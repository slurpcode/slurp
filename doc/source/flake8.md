# 🧹 Using Flake8, An Introduction - "A tool for cleaning your Python code"

- Tags: ["Beginner"]
- Categories: ["Python"]
- Date: "2020-09-29"

## Introduction

[Flake8](https://flake8.pycqa.org/en/latest/) is one of the more popular linting
tools. This post tells what it is, how to set it up, and how to get started
using it.

## The Difference Between What Happens When The Python Interpreter Catches Errors And What Happens When You Run A Linter

When you use the Python interpreter to run a Python program, it may not run your
program because it catches errors that Python cannot understand. The kinds of
errors that keep your Python file from running are called Syntax errors. Once
you remove the syntax errors from your program, the Python interpreter runs it,
and it begins to do its processing. If it has errors that prevent it from
running correctly, these are called run-time errors.

Linting tools inspect your Python files for both kinds of errors plus
[coding conventions accepted by the Python community](https://www.python.org/dev/peps/pep-0008/).
Using a linting tool makes it easier for both the Python interpreter to run your
programs and for anyone who works on projects with you to read your code, since
they help you follow agreed upon standards.

## How Flake8 Helps Further

Flake8 looks for code that does not follow accepted Python practices according
to PEP8.

## Flake8 Environment

You can run Flake8 from the command line or from an editor, such as PyCharm or
Visual Studio Code. It works on Linux, Windows, and Mac. You can also integrate
it with your GitHub projects. We will concentrate on using it from the command
line, since using it from an editor uses its command line options. You can
experiment with its configurations and easily see more directly how they affect
how it runs.

## Installing Flake8

You would want to install Flake8 into your default Python environment, since you
would want to check all of your Python code with it, but you can also install it
for every version of Python you have on your system. Assuming that you have
[Python](https://www.python.org/) installed, to install into your default
environment, from the command line, type:

```python
pip install flake8
```

To install Flake8 for a particular version of Python, type:

```python
python<version> -m pip install flake8
```

Where `<version>` is any version of Python on your system.

## Running Flake8

To run Flake8, type:

```python
Flake8
```

This starts Flake8.

You can run it against a version other than the default. For example:

```python
python2.7 -m flake8
```

Where `python2.7` is one version of Python, and `-m` runs Flake8 as a standalone
module.

You can also run Flake8 against individual Python files and entire directories.
To do that, add the name of the Python file or folder to the command line.

Finally, you can run Flake8 using any of its command line options, and it has a
very comprehensive configuration scheme that uses
[configuration files](https://en.wikipedia.org/wiki/Configuration_file).

## Getting Help

To get help with Flake8, type:

```python
flake8 --help
```

## Further Resources

- [Flake8 documentation home page](https://flake8.pycqa.org/)
- [Flake8 User Manual](https://flake8.pycqa.org/en/latest/user/index.html)
- [Complete list of Flake8 options](https://flake8.pycqa.org/en/latest/user/options.html)
- [PEP8, the Python style guide](https://www.python.org/dev/peps/pep-0008/)
- [Linting Python In Visual Studio Code](https://code.visualstudio.com/docs/python/linting)
- [PyCharm plug-in for Flake8](https://plugins.jetbrains.com/plugin/11563-flake8-support)
- [Python support in Emacs](https://www.emacswiki.org/emacs/PythonProgrammingInEmacs)
- [Flake8 support in Vim](https://github.com/nvie/vim-flake8)

## About The Author

Jim Homme is a former professional musician, father of three, husband, and a
32-year veteran in Information Technology. He loves to read and play chess. He
leads a team of accessibility testers at
[Bender Consulting Services](https://www.benderconsult.com/). He is the owner of
[jimhomme.com](https://www.jimhomme.com/), where he writes about Python and
related technologies.
