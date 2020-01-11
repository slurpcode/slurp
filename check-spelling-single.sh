#!/bin/bash

for file in $(find . -name "*.md" -not -path "**/node_modules/*" -not -path "**/charts/*");
do
    aspell list --lang=en --encoding=utf-8 --personal=./.aspell.en.pws < "$file" | sort -u
done
