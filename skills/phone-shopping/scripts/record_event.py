#!/usr/bin/env python3
"""Persist a procurement event before/after phone actions, with an atomic checkpoint."""
import argparse
import json
import os
from contextlib import contextmanager
from pathlib import Path
from datetime import datetime, timezone
from uuid import uuid4


@contextmanager
def writer_lock(stream):
    """Serialize task writers on POSIX and Windows without extra dependencies."""
    if os.name == 'nt':
        import msvcrt
        stream.seek(0, os.SEEK_END)
        if stream.tell() == 0:
            stream.write('0')
            stream.flush()
        stream.seek(0)
        msvcrt.locking(stream.fileno(), msvcrt.LK_LOCK, 1)
        try:
            yield
        finally:
            stream.seek(0)
            msvcrt.locking(stream.fileno(), msvcrt.LK_UNLCK, 1)
    else:
        import fcntl
        fcntl.flock(stream, fcntl.LOCK_EX)
        try:
            yield
        finally:
            fcntl.flock(stream, fcntl.LOCK_UN)


def atomic_json(path, value):
    temporary = path.with_name(path.name + '.tmp')
    with temporary.open('w', encoding='utf-8') as stream:
        json.dump(value, stream, ensure_ascii=False, indent=2)
        stream.write('\n')
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temporary, path)


def merge_patch(target, patch):
    """Merge partial object fields; replace arrays and scalar values explicitly."""
    for key, value in patch.items():
        if isinstance(value, dict) and isinstance(target.get(key), dict):
            merge_patch(target[key], value)
        else:
            target[key] = value


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--root', required=True)
    parser.add_argument('payload', help='JSON file containing event and optional checkpoint_patch')
    args = parser.parse_args()
    root = Path(args.root)
    root.mkdir(parents=True, exist_ok=True)
    payload = json.loads(Path(args.payload).read_text(encoding='utf-8'))
    event = payload['event']
    event.setdefault('event_id', str(uuid4()))
    event.setdefault('timestamp', datetime.now(timezone.utc).isoformat())
    if not event.get('kind'):
        raise ValueError('event.kind required')
    with (root / '.writer.lock').open('a+') as lock, writer_lock(lock):
        event_path = root / 'events.jsonl'
        checkpoint_path = root / 'checkpoint.json'
        checkpoint = json.loads(checkpoint_path.read_text(encoding='utf-8')) if checkpoint_path.exists() else {}
        saved_events = [json.loads(line) for line in event_path.read_text(encoding='utf-8').splitlines()] if event_path.exists() else []
        last_id = checkpoint.get('last_event_id')
        replay_from = 0
        if last_id:
            matches = [i for i, saved in enumerate(saved_events) if saved['event_id'] == last_id]
            if not matches:
                raise ValueError('checkpoint refers to an event missing from the journal')
            replay_from = matches[0] + 1
        for saved in saved_events[replay_from:]:
            if saved.get('checkpoint_patch_semantics') == 'recursive_v1':
                merge_patch(checkpoint, saved.get('checkpoint_patch', {}))
            else:
                checkpoint.update(saved.get('checkpoint_patch', {}))
            checkpoint['last_event_id'] = saved['event_id']
            checkpoint['updated_at'] = saved['timestamp']
        if replay_from < len(saved_events):
            atomic_json(checkpoint_path, checkpoint)
        if any(saved['event_id'] == event['event_id'] for saved in saved_events):
            print(json.dumps({'status': 'already_recorded', 'event_id': event['event_id']}))
            return
        merge_patch(checkpoint, payload.get('checkpoint_patch', {}))
        checkpoint['last_event_id'] = event['event_id']
        checkpoint['updated_at'] = event['timestamp']
        # Journal first: if checkpoint replacement fails, this event can be replayed locally.
        event['checkpoint_patch'] = payload.get('checkpoint_patch', {})
        event['checkpoint_patch_semantics'] = 'recursive_v1'
        with event_path.open('a', encoding='utf-8') as stream:
            stream.write(json.dumps(event, ensure_ascii=False) + '\n')
            stream.flush()
            os.fsync(stream.fileno())
        atomic_json(checkpoint_path, checkpoint)
    print(json.dumps({'status': 'recorded', 'event_id': event['event_id']}, ensure_ascii=False))


if __name__ == '__main__':
    main()
