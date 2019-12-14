#!/usr/bin/env bash

sleep 90
# print the maximum number of GitHub contributions in one day from the last year
curl https://github.com/"$1" | awk '/data-count="(.*?)"/{print $8}' | grep -oE '\d+' | sort -n | uniq | tail -n 1
