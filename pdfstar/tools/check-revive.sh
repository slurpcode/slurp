#!/bin/bash

cd ../ || exit

# print first
revive -config config.toml .

var=$(revive -config config.toml .)
# then exit with fail if found
if test -z "$var"; then
  exit 0
else
  exit 1
fi
