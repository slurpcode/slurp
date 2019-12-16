#!/usr/bin/env bash

flake8 --ignore=E501
mdl .
rubocop
yamllint .
