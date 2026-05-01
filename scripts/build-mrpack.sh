#!/usr/bin/env bash
# Build the .mrpack distributable from scripts/modrinth.index.json.
# Run from repo root: bash scripts/build-mrpack.sh
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p dist

python3 - <<'PY'
import json, os, zipfile

manifest = json.load(open('scripts/modrinth.index.json'))
version = manifest['versionId']
out = f'dist/PillowCreate-{version}.mrpack'

with zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED) as z:
    z.writestr('modrinth.index.json', json.dumps(manifest, indent=2))
    z.writestr('overrides/.keep', '')

size = os.path.getsize(out)
print(f'Built: {out} ({size} bytes)')
PY
