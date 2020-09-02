#!/usr/bin/env bash

# print first
find . -type f -name '*.csv' -printf '%p\n' | xargs -t -n1 csvlint

# exit if invalid
# shellcheck disable=SC2016
find . -type f -name '*.csv' -printf '%p\n' | xargs -n1 sh -c 'csvlint $0 || exit 255' > /dev/null
