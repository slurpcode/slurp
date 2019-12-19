#!/usr/bin/env bash

rdoc -o docs/rdoc --exclude="assets|docs|node_modules|CODEOWNERS|Gemfile|LICENSE|README|.csv|.fql|.go|.iml|.ipr|.iws|.json|.lock|.php|.py|.sh|.toml|.txt|.xsl"
cd docs || exit
bundle exec jekyll serve
