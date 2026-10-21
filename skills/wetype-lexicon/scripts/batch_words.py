"""Bounded immutable word-list ingestion for resumable native import jobs."""
import hashlib
import os
from pathlib import Path
import stat
import tempfile
import engine_support as e

MAX_BYTES=2*1024*1024
MAX_INPUT_ROWS=100000

def parse(path):
    source=Path(path).expanduser()
    if source.suffix.lower() not in ('.json','.csv','.tsv'):
        raise e.Error('Supported word lists: UTF-8 .tsv, .csv, .json')
    with source.open('rb') as stream:
        if not stat.S_ISREG(os.fstat(stream.fileno()).st_mode):
            raise e.Error('Word list must be a regular file')
        raw=stream.read(MAX_BYTES+1)
    if len(raw)>MAX_BYTES:raise e.Error('Word list exceeds 2 MiB')
    # Normalize exactly the bytes whose SHA is recorded, even if the caller edits
    # the source concurrently. The engine parser remains the single authority.
    name=None
    try:
        with tempfile.NamedTemporaryFile(suffix=source.suffix.lower(),delete=False) as copy:
            name=copy.name;copy.write(raw)
        validation=e.normalize_rows(Path(name),max_rows=MAX_INPUT_ROWS)
    finally:
        if name is not None:os.unlink(name)
    return {'source_name':source.name,'source_sha256':hashlib.sha256(raw).hexdigest(),
            'source_bytes':len(raw),'source_format':source.suffix.lower()[1:],**validation}
