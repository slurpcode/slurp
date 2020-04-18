#!/usr/bin/env bash

flake8 --ignore=E501 --exclude=venv
find . -name "*.py" -not -path "**/venv/*" | xargs pylint --disable=C0103,C0114
mdl .
rubocop
reek -c .reek.yml
yamllint .erb-lint.yml .hound.yml .overcommit.yml .percy.yml .reek.yml .rubocop.yml .travis.yml .circleci/config.yml .github/labeler.yml .github/workflows/greetings.yml .github/workflows/label.yml
