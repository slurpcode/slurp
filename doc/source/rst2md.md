# ➡ RST2MD

## Pandoc

[Pandoc](https://pandoc.org/) is a swiss army knife, if you need to convert
files from one markup format into another.

It supports conversion to and from following formats:

- [Markdown](http://daringfireball.net/projects/markdown/)
- [reStructuredText](http://docutils.sourceforge.net/docs/ref/rst/introduction.html)
- HTML
- [Ebooks](http://en.wikipedia.org/wiki/EPUB)
- [TeX](http://www.latex-project.org/)
- [XML](http://opendocument.xml.org/)
- [CSV](https://tools.ietf.org/html/rfc4180)
- [Ms-Office docx](https://en.wikipedia.org/wiki/Office_Open_XML)
- [ipynb](https://nbformat.readthedocs.io/en/latest/)
- PDF
- [Wiki](http://www.mediawiki.org/wiki/Help:Formatting)

## Converting a file

```
pandoc inputfile -s -o outputfile
```

Pandoc makes converting a `.rst` file to `.md` file easier. Use following
command to convert reStructuredText into Markdown format.

```
pandoc file.rst -s -o file.md
```
