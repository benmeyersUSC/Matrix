#!/usr/bin/env bash
# Configure (if needed) and compile. Pass "release" for an optimized build.
set -euo pipefail
cd "$(dirname "$0")"

BUILD_TYPE=Debug
[[ "${1:-}" == "release" ]] && BUILD_TYPE=Release

cmake -S . -B build -DCMAKE_BUILD_TYPE="$BUILD_TYPE"
cmake --build build -j
