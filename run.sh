#!/usr/bin/env bash
# Run the compiled program. Any args are forwarded to main.
set -euo pipefail
cd "$(dirname "$0")"

if [[ ! -x build/main ]]; then
  echo "build/main not found — run ./build.sh first" >&2
  exit 1
fi
./build/main "$@"
