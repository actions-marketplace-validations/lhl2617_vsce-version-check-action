#!/bin/sh -l

set -e

extension_publisher=$1
extension_name=$2
extension_version=$3
fail_if_unpublished=$4

error_unpublished=10
error_not_greater=11

marketplace_version=$(npx vsce show "$extension_publisher.$extension_name" --json | jq -j '.versions[0].version')

if [ -z "$marketplace_version" ]
then
    # Unpublished, npx vsce show will still return a 0 exit code
    echo "Extension is unpublished"
    if [ "$fail_if_unpublished" = "true" ]
    then
        echo "Failed: fail-if-unpublished is set to true"
        exit $error_unpublished
    else
        echo "Success: fail-if-unpublished is set to false"
        exit 0
    fi
else
    is_valid=$(dpkg --compare-versions "$extension_version" "gt" "$marketplace_version")
    if [ "$is_valid" = "0" ]
    then
        echo "Success: Extension version ($extension_version) is greater than marketplace version ($marketplace_version)"
        exit 0
    else  
        echo "Failed: Extension version ($extension_version) is not greater than marketplace version ($marketplace_version)"
        exit $error_not_greater
    fi
fi
