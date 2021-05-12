#!/bin/bash

set -e

# Ensure we're in the project root
cd "$(dirname "$0")"

echo "=== Valid ==="
./entrypoint.sh lhl2617 lilypond-formatter 100000.0.0 false \
    || (echo "failed" && exit 1) && echo "passed"

echo "=== Too old ==="
./entrypoint.sh lhl2617 lilypond-formatter 0.1.0 false \
    && (echo "failed" && exit 1) || echo "passed"

echo "=== Does not exist, OK ==="
./entrypoint.sh lhl2617 REEEEEEEE 100000.0.0 false \
    || (echo "failed" && exit 1) && echo "passed"

echo "=== Does not exist, failed ==="
./entrypoint.sh lhl2617 REEEEEEEE 100000.0.0 false \
    && (echo "failed" && exit 1) || echo "passed"

echo "Tests passed"