#!/bin/sh -l

# Ensure we're in the project root
cd "$(dirname "$0")" || exit 1

extension_publisher=lhl2617
extension_name=lilypond-formatter

current_version=$(npx vsce show "$extension_publisher.$extension_name" --json | \
    jq -j '.versions[0].version')

echo "=== Valid ==="
./entrypoint.sh $extension_publisher lilypond-formatter 100000.0.0 false \
    || exit 1
echo "--- Passed ---"
echo ""

echo "=== Too old ==="
./entrypoint.sh $extension_publisher lilypond-formatter 0.1.0 false \
    && exit 1
echo "--- Passed ---"
echo ""

echo "=== Equal ==="
./entrypoint.sh $extension_publisher lilypond-formatter "$current_version" false \
    && exit 1
echo "--- Passed ---"
echo ""

echo "=== Unpublished, fail-if-unpublished is set to true ==="
./entrypoint.sh $extension_publisher REEEEEEEE 100000.0.0 true \
    && exit 1
echo "--- Passed ---"
echo ""

echo "=== Unpublished, fail-if-unpublished is set to false ==="
./entrypoint.sh $extension_publisher REEEEEEEE 100000.0.0 false \
    || exit 1
echo "--- Passed ---"
echo ""

echo "All tests passed"
