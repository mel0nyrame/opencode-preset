#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
VENDOR_DIR="$SCRIPT_DIR/vendor"

if ! command -v npm >/dev/null 2>&1; then
  printf '%s\n' "npm is required to install the optional /context tokenizer dependencies." >&2
  exit 1
fi

mkdir -p "$VENDOR_DIR"

npm install \
  --prefix "$VENDOR_DIR" \
  --no-save \
  --package-lock=false \
  js-tiktoken \
  @huggingface/transformers

printf '%s\n' "Installed /context tokenizer dependencies in $VENDOR_DIR/node_modules"
