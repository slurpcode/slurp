---
title: "Using Pylint, An Introduction"
description: "A tool for cleaning your Python code"
tags: ["Beginner"]
categories: ["Python"]
Author: "Jim Homme"
date: "2020-09-29"
publishdate: "2020-10-02"
---

## Introduction

Just as you wouldn't go to a black tie dinner without using a lint roller on
your tux or dress before walking into the venue, or, in the old days, going over
your suit before that all-important interview, you want your Python code to be
clean before you let it out into the world for professionals to see. you want to
catch bugs before they bite. This is why you would use a linting tool.
[Pylint](http://www.pylint.org) is one of the more popular linting tools. This
post tells what it is, how to set it up, and how to get started using it.

<!-- more -->

## The Difference Between What Happens When The Python Interpreter Catches Errors And What Happens When You Run A Linter

When you use the Python interpreter to run a Python program, it may not run your
program because it catches errors that Python cannot understand. The kinds of
errors that keep your Python file from running are called Syntax errors. Once
you remove the syntax errors from your program, the Python interpreter runs it,
and it begins to do its processing. If it has errors that prevent it from
running correctly, these are called run-time errors.

Linting tools inspect your Python files for both kinds of errors plus [coding
conventions accepted by the Python
community](https://www.python.org/dev/peps/pep-0008/). Using a linting tool
makes it easier for both the Python interpreter to run your programs and for
anyone who works on projects with you to read your code, since they help you
follow agreed upon standards.

## How Pylint Helps Further

Pylint looks for "code smells," any characteristics in the source code of a
program that possibly indicate deeper problems. In human interactions, you might
look for proper grammar when someone is speaking to you, or you might be looking
for deeper meaning indicated by the words they use and their voice inflections.

## Pylint Environment

You can run Pylint from the command line or from an editor, such as PyCharm or Visual
Studio Code. It works on Linux, Windows, and Mac. We will concentrate on using
it from the command line, since using it from an editor uses its command line
options. You can experiment with its configurations and easily see more directly
how they affect how it runs.

## Installing it

You would want to install Pylint into your default Python environment, since you
would want to check all of your Python code with it. Assuming that you have
[Python](https://www.python.org/) installed, from the command line, type:

``` python
pip install pylint
```

To run Pylint, type:

``` python
pylint myprogram.py 
```

Where `myprogram.py` is the Python file you want it to check.

## Default options

By default, Pylint has all error checks and messages enabled. You can configure
it to look for and report on five classes of errors:

* (C) convention, for programming standard violation
* (R) refactor, for bad code smell
* (W) warning, for python specific problems
* (E) error, for likely bugs in the code
* (F) fatal, for errors occurred that prevent pylint from doing further
Processing.

## Further Resources

* [Pylint home page](https://www.pylint.org/)
* [Pylint User Manual](http://pylint.pycqa.org/en/latest/) j* [PEP8, the Python
* [Readable Pylint Style Guide](https://www.python.org/dev/peps/pep-0008/)
  Messages](https://github.com/janjur/readable-pylint-messages/blob/master/README.md)
* [Linting Python In Visual Studio
  Code](https://code.visualstudio.com/docs/python/linting)
* [PyCharm plug-in for
  Pylint](https://plugins.jetbrains.com/plugin/11084-pylint)* [Pylint technical
  reference](https://pylint.readthedocs.io/en/latest/technical_reference/features.html)
* [Python support in
  Emacs](https://www.emacswiki.org/emacs/PythonProgrammingInEmacs)
* [Pylint plug-in for Vim](https://www.vim.org/scripts/script.php?script_id=891)
* [Pylint support for Eclipse](http://pydev.org/)
* [A Beginner's Guide in Python - Pylint
  Tutorial](https://docs.pylint.org/en/1.6.0/tutorial.html)

## About The Author

Jim Homme is a former professional musician, father of three, husband, and a
32-year veteran in Information Technology. He loves to read and play chess. He
leads a team of accessibility testers at [Bender Consulting
Services](https://www.benderconsult.com/). He is the owner of
[jimhomme.com](https://www.jimhomme.com/), where he writes about Python and
related technologies.
