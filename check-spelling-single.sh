#!/bin/bash

while read -r file
do
    aspell list --lang=en --encoding=utf-8 --personal=./.aspell.en.pws < "$file" | sort -u
done < <(find . -name "*.md" -not -path "**/node_modules/*" -not -path "**/charts/*");
