# 📜 Sphinx, The Code Documentation Tool, An Introduction

- Date: "2020-10-31"

## How to set up the Sphinx code documentation tool and get started with it

You've just finished your latest development masterpiece. Now you have to go
back and document it or find someone who likes to write way more than you do to
do that job. What are the chances that your documentation is going to happen,
let alone happen well? Not good?

Have you tried to learn to use a code library or had to maintain someone else's
code and cursed the lack of documentation, when good documentation would have
saved you hours of trial and error writing and re-writing code to figure out how
the software works? Worse yet, have you ever failed to document code properly,
forgot you wrote that code, then cursed yourself for not writing good
documentation?

I have the cure.

<!--more-->

On your next development project, take much of the pain out of documentation.
Use [Sphinx](https://www.sphinx-doc.org/).

## What Is Sphinx

According to its home page, Sphinx is a tool that makes it easy to create
intelligent and beautiful documentation. It eliminates the need for you to
create and maintain separate documentation source files. No more getting
documentation out of sync with your code. Sphinx can read your source code and
automatically produce documentation. With a little self-education, you can learn
to make the documentation even better. Read on to learn how to install it and
start learning to write documentation with it.

## Languages Sphinx Can Document

Languages Sphinx can document include:

- Python
- C
- C++

## Output Formats

Sphinx originally documented code in HTML format, but it can also produce output
in other formats including PDF and Windows Help.

## Installing Sphinx

Sphinx is written in Python, which means that you already need to have Python
installed on your system. specifically, Python 3.

The
[Sphinx Installation instructions](https://www.sphinx-doc.org/en/master/usage/installation.html)
explains how to obtain and install it on Mac and Linux.

### Installing Sphinx On Windows

To install on Windows, I recommend that you follow this procedure:

### Install Chocolaty

Installing Chocolaty will allow you to easily install and upgrade a lot more
programs. You need to run either PowerShell or Cmd as an administrator to do
that.

- See this page on
  [how to run PowerShell as an administrator](https://www.jimhomme.com/).
- See this page on how to
  [install The Chocolaty Package Manager.](https://chocolatey.org/install)

### How To Install Python

If Python isn't on your windows system, you can install it after you've
installed Chocolaty. Get a PowerShell or command prompt as an administrator and
type this command.

```text
choco install python
```

### Sphinx Installation

Now that you have Python installed, from the command line, type this command to
install Sphinx.

```python
pip install -U sphinx
```

This installs Sphinx on your computer for only your user ID.

After you've installed sphinx, you can use this command to verify that you have
installed it correctly.

```python
sphinx-build --version
```

If the version number appears on your screen, you've installed everything
correctly. You can now start using Sphinx to document your code.

## Using Sphinx To Write Documentation

I mentioned that Sphinx can read your code and produce documentation. To fully
use its potential, though, you need to learn
[reStructuredText](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html).
[See this full restructuredText reference](https://docutils.sourceforge.io/rst.html).

### Using Markdown For Documentation

If you prefer to use Markdown to document your code,
[Check out this page to find out how](https://www.sphinx-doc.org/en/master/usage/markdown.html).

## Things To Try

If learning restructuredText or Markdown stops you from experimenting with
Sphinx, you could try the following to encourage you to go deeper into learning
it:

- Read the
  [Getting Started](https://www.sphinx-doc.org/en/master/usage/quickstart.html)
  and try some of the sample code there on your code. Check out the resulting
  documentation
- Run it against a file on your system produced by the makers of Python, then
  look at the source and compare that to the documentation to see what tricks
  you can pick up to add to your own code documentation.
- Play with producing a static website on your local computer with it.

## One More Piece Of Encouragement

Let me encourage you with a workflow suggestion. When you know some piece of
code you're working on does what it's supposed to do, use your newly-acquired
knowledge about Sphinx to take that final step of documenting it. Your teammates
will thank you. The development world will thank you. You will thank yourself if
you ever need to maintain your own code.

## About The Author

Jim Homme is a former professional musician, father of three, husband, and a
32-year veteran in Information Technology. He loves to read and play chess. He
leads a team of accessibility testers at
[Bender Consulting Services](https://www.benderconsult.com/). He is the owner of
[jimhomme.com](https://www.jimhomme.com/), where he writes about Python and
related technologies.
