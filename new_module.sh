#!/usr/bin/env bash
# Usage: ./new_module.sh ClassName
# Creates include/ClassName.h and src/ClassName.cpp. CMake picks them up automatically.
set -euo pipefail
cd "$(dirname "$0")"

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 ClassName" >&2
  exit 1
fi

NAME="$1"
if [[ ! "$NAME" =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]]; then
  echo "Error: '$NAME' is not a valid C++ identifier" >&2
  exit 1
fi

HDR="include/$NAME.h"
SRC="src/$NAME.cpp"
if [[ -e "$HDR" || -e "$SRC" ]]; then
  echo "Error: $HDR or $SRC already exists" >&2
  exit 1
fi

cat > "$HDR" <<EOT
#pragma once

class $NAME {
public:
    $NAME();
    ~$NAME();
};
EOT

cat > "$SRC" <<EOT
#include "$NAME.h"

$NAME::$NAME() {}

$NAME::~$NAME() {}
EOT

echo "Created $HDR and $SRC"
echo "Use it in main.cpp with: #include \"$NAME.h\""
