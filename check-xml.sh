#!/usr/bin/env bash

# print first
find . -type f -not -path "./docs/*" -not -path "./logorama/*" -name '*.xml' -printf '%p\n' | xargs -n1 sh -c 'xmllint $0 > /dev/null'

# exit if invalid
# shellcheck disable=SC2016
find . -type f -not -path "./docs/*" -not -path "./logorama/*" -name '*.xml' -printf '%p\n' | xargs -n1 sh -c 'xmllint $0 || exit 255' >/dev/null
