# 👁️ Diffs

## Animated PDF differencing

[pdftocairo](https://www.mankier.com/1/pdftocairo)

## Colordiff

Text differencing of two PDF files in the `terminal` using:

- [dwdiff](https://linux.die.net/man/1/dwdiff)
- [GNU wdiff](https://www.gnu.org/software/wdiff/)
- [pdftotext](https://www.xpdfreader.com/pdftotext-man.html)
- [colordiff](https://www.colordiff.org/)
- [GNU Grep](https://www.gnu.org/software/grep/manual/grep.html)

Red text is from the `old` PDF and green text is from the `new` PDF. Currently
`dwdiff` provides a slightly better output than `wdiff`.

Commands used to create the `colordiff`:

```
cd test_files\pdf
dwdiff <(pdftotext old/filename.pdf -) <(pdftotext new/filename.pdf -) | colordiff | grep -C 3 '\[-' > dwdiff-colordiff-output.txt
```

```
cd test_files\pdf
wdiff <(pdftotext old/filename.pdf -) <(pdftotext new/filename.pdf -) | colordiff | grep -C 3 '\[-' > colordiff-output.txt
```

[&#8595;](#watch-this-space) [&#8593;](#flicker-diff)

## Watch This Space

[&#8593;](#flicker-diff)
