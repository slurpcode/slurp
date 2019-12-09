#!/usr/bin/env bash

sleep 60
# print the maximum number of GitHub contributions in one day from the last year
curl https://github.com/"$1" | ruby -lne '/data-count="(.*?)"/ =~ #$.'
