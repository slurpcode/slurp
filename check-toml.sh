#!/usr/bin/env bash

# print first
find . -type f -name '*.toml' -printf '%p\n' | xargs -t -n1 ./tomlcheck -f

# exit if invalid
# shellcheck disable=SC2016
find . -type f -name '*.toml' -printf '%p\n' | xargs -n1 sh -c './tomlcheck -f $0 || exit 255' >/dev/null
