"""Pure offline queue policy. It never opens a dictionary or sends/acknowledges data.

Call while authoritative data is exclusively locked. Compute action_delta from
an audited Add-only candidate, not from input row count. Re-read the authoritative
probe before publication. A successful decision is local admission, never ACK.
"""
from dataclasses import dataclass, asdict
from typing import Optional

UINT64_MAX = (1 << 64) - 1
RETENTION = 1000
WINDOW = 900

@dataclass(frozen=True)
class Checkpoint:
    epoch: str
    max_assigned: int
    watermark: int

@dataclass(frozen=True)
class Decision:
    allowed: bool
    reason: str
    backlog: Optional[int] = None
    projected_backlog: Optional[int] = None
    compensation_reserve: Optional[int] = None
    window: int = WINDOW
    retention: int = RETENTION
    provenance: str = "unknown"

    def to_dict(self):
        return asdict(self)


def _uint(x):
    return type(x) is int and 0 <= x <= UINT64_MAX


def assess(observation, action_delta, compensation_reserve=None, *, previous=None,
           allow_mock=False):
    """Fail closed on unknown/invalid queues and reject before publication.

    observation schema1: epoch(str), complete(bool), header_valid(bool),
    head_valid(bool), max_assigned(int), watermark(int), sequences(list[int]),
    provenance('native_head' or explicit 'mock_watermark').
    `compensation_reserve` protects only this many future native compensation
    actions, not arbitrary/all-history rollback. Supply an audited upper bound.
    """
    provenance = observation.get('provenance', 'unknown') if type(observation) is dict else 'unknown'
    def deny(reason, **details):
        return Decision(False, reason, provenance=provenance, **details)
    if type(observation) is not dict or type(observation.get('schema')) is not int or observation.get('schema') != 1:
        return deny('unknown_queue_schema')
    if observation.get('complete') is not True or observation.get('header_valid') is not True:
        return deny('unknown_or_invalid_queue')
    if observation.get('head_valid') is not True:
        return deny('unknown_or_invalid_sync_head')
    if provenance != 'native_head' and not (allow_mock is True and provenance == 'mock_watermark'):
        return deny('untrusted_or_mock_watermark')
    epoch = observation.get('epoch')
    maximum, watermark = observation.get('max_assigned'), observation.get('watermark')
    if type(epoch) is not str or not epoch or len(epoch) > 256:
        return deny('invalid_epoch')
    if not _uint(maximum) or not _uint(watermark) or watermark > maximum:
        return deny('invalid_sequence_bounds')
    if not _uint(action_delta) or not _uint(compensation_reserve):
        return deny('unknown_action_bound')
    # Do not permit exhaustion or the engine's after+1 wraparound.
    if maximum + action_delta + compensation_reserve >= UINT64_MAX:
        return deny('sequence_exhaustion')
    sequences = observation.get('sequences')
    if type(sequences) is not list or any(not _uint(s) or s == 0 or s > maximum for s in sequences):
        return deny('invalid_action_sequences')
    if sequences != sorted(set(sequences)):
        return deny('duplicate_or_unsorted_sequences')
    backlog = maximum - watermark
    pending = [s for s in sequences if s > watermark]
    # Validate by count and adjacency, never allocate range(max_assigned).
    if len(pending) != backlog or (pending and (pending[0] != watermark + 1 or pending[-1] != maximum
            or any(b != a + 1 for a, b in zip(pending, pending[1:])))):
        return deny('pending_sequence_gap', backlog=backlog)
    if previous is not None:
        if (not isinstance(previous, Checkpoint) or type(previous.epoch) is not str or not previous.epoch
                or not _uint(previous.max_assigned) or not _uint(previous.watermark)
                or previous.watermark > previous.max_assigned):
            return deny('invalid_previous_checkpoint')
        if epoch != previous.epoch:
            return deny('queue_epoch_changed')
        if maximum < previous.max_assigned:
            return deny('assigned_sequence_rewound')
        if watermark < previous.watermark:
            return deny('watermark_rewound')
    projected = backlog + action_delta
    details = dict(backlog=backlog, projected_backlog=projected, compensation_reserve=compensation_reserve)
    if backlog > RETENTION:
        return deny('already_beyond_engine_retention', **details)
    if projected + compensation_reserve > WINDOW:
        return deny('backpressure_wait_for_observed_progress', **details)
    return Decision(True, 'admitted_local_only', provenance=provenance, **details)


def checkpoint(observation):
    """Call only after successful assessment and publication/observation."""
    return Checkpoint(observation['epoch'], observation['max_assigned'], observation['watermark'])


if __name__ == '__main__':
    import argparse, json
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('observation');p.add_argument('--new-actions',type=int,required=True)
    p.add_argument('--compensation-reserve',type=int,required=True)
    p.add_argument('--lab-allow-mock',action='store_true')
    a=p.parse_args()
    with open(a.observation,encoding='utf8') as f: data=json.load(f)
    decision=assess(data,a.new_actions,a.compensation_reserve,allow_mock=a.lab_allow_mock)
    print(json.dumps(decision.to_dict(),ensure_ascii=False,indent=2))
    raise SystemExit(0 if decision.allowed else 2)
