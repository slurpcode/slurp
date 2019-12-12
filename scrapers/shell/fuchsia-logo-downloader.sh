#!/usr/bin/env bash

sleep 75
mkdir -p logos
cd logos || exit
if [ -z "$1" ]; then
  j=306
else
  j=$1
fi
for ((i = 0; i <= j; i++)); do
  curl -O https://raw.githubusercontent.com/fuchsia-programming/fuchsia-programming.github.io/master/assets/images/logos/fuchsia-"$i".png
  sleep 5
done
