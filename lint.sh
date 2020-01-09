#!/usr/bin/env bash

flake8 --ignore=E501
mdl .
rubocop
yamllint .erb-lint.yml .hound.yml .overcommit.yml .percy.yml .reek.yml .rubocop.yml .travis.yml
