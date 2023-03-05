# 🎬 Getting Started

This set of documentation is written in
[Markdown](https://daringfireball.net/projects/markdown/syntax) which is a
lightweight and easy-to-use syntax for styling all forms of writing.

Markdown takes about 10 minutes to learn and GitHub provides its three-minute
read on
[Mastering Markdown](https://guides.github.com/features/mastering-markdown/)

Discussion about code base improvements happens in GitHub
[issues](https://github.com/slurpcode/slurp/issues) and on
[pull requests](https://github.com/slurpcode/slurp/pulls).

## Hosting

- [Cloudflare Workers](https://workers.cloudflare.com/)
- [GitHub Pages](https://pages.github.com/)
- [Heroku](https://www.heroku.com/) - no longer free
- [Read the Docs](https://readthedocs.org/)
- [Render](https://render.com/)

## Basic Setup

Project requires Golang, Node, Ruby, Python and more.

```shell
npm install -g npm@latest
```

From the root of the repository:

```shell
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

## Documentation

Python [Sphinx](https://www.sphinx-doc.org/) based `Slurp Read the Docs` site
based in Markdown. We have a local requirements file just for `Read the Docs` hosting.

```shell
cd doc || exit
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

Files are stored in `doc/source`. From the `doc` folder run with:

```shell
make html
```

## Fuchsia Programming Site

`Fuchsia Programming` is a Jekyll based site that requires Ruby which
is stored in the `docs` folder. Don't get mixed up with `doc` from the
[documentation](#documentation) site above.

```shell
cd docs || exit
bundle exec jekyll serve
```

## Logorama

`Logorama` is a Jekyll based logo showcase site that requires Ruby:

```shell
cd logorama || exit
bundle exec jekyll serve
```

## DITA Project

`DITA To PDF` - Vanilla

```shell
cd eclipse-cheatsheets-to-dita-to-pdf/output || exit
dita --input=map.ditamap --format=pdf -o pdf
```
