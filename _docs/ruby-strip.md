---
title: 🎞️ Ruby Strip
permalink: /docs/ruby-strip/
---

# Ruby white space strip command line application

This program uses
**[Ruby Power](https://www.ruby-lang.org/en/documentation/success-stories/)** to
strip whitespace from files, and the accompanying documentation provided aims at
being an easy to follow tutorial on all things
**[Ruby](https://www.ruby-lang.org/en/)**.

This program runs on the
[command line](https://en.wikipedia.org/wiki/Command-line_interface) and accepts
a single
[parameter](<https://en.wikipedia.org/wiki/Parameter_(computer_programming)>), a
folder [path](<https://en.wikipedia.org/wiki/Path_(computing)>) name.

It checks this folder [recursively](https://en.wikipedia.org/wiki/Recursion)
through all sub folders and files for leading and trailing
[whitespace](https://en.wikipedia.org/wiki/Whitespace_character).

It removes all the excess leading and trailing whitespace and
[copies](<https://en.wikipedia.org/wiki/Copy_(command)>) the folder contents to
this projects `output`
[directory](<https://en.wikipedia.org/wiki/Directory_(computing)>).

So far it has been checked against these
[file formats](https://en.wikipedia.org/wiki/File_format):

- \*.c
- \*.xml
- \*.xsl
- \*.txt
- \*.php
- \*.html
- \*.py
- \*.css
- \*.rb

Simply run:

```
$ ruby ruby-strip.rb -h
  Usage: ruby-strip.rb [options]
      -p, --path                       Directory or path
                                       relative to this directory
                                       to check for excess whitespace.
      -h, --help                       Displays help
          --version                    Show program version
```

This should copy the folder to the `output` directory.

[&#8595;](#watch-this-space) [&#8593;](#ruby-strip)

## Watch This Space

[&#8593;](#ruby-strip)
