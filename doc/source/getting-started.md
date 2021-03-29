# 🎬 Getting Started

This set of documentation is written in [Markdown](
https://daringfireball.net/projects/markdown/syntax) which is a
lightweight and easy-to-use syntax for styling all forms of writing.

Markdown takes about 10 minutes to learn and GitHub provides its
three-minute read on [Mastering Markdown](
https://guides.github.com/features/mastering-markdown/)

Discussion about code base improvements happens in GitHub
[issues](https://github.com/slurpcode/slurp/issues) and on
[pull requests](https://github.com/slurpcode/slurp/pulls).

## Hosting

- [Cloudflare Workers](https://workers.cloudflare.com/)
- [GitHub Pages](https://pages.github.com/)
- [Heroku](https://www.heroku.com/)
- [Read the Docs](https://readthedocs.org/)
- [Render](https://render.com/)

## Basic Setup

Project requires Golang, Node, Ruby, Python and more.

```shell
npm install -g npm@latest
```

From the root of the repository:

```shell
pip3 install -r requirements.txt
npm install
gem install bundler
bundle update --bundler
bundle install
```

## Documentation

Python [Sphinx](https://www.sphinx-doc.org/) based
`Slurp Read the Docs` site based in Markdown.
Files are stored in `doc/source`. Run with:

```
cd doc || exit
make html
```

`Fuchsia Programming` is a Jekyll based site that requires Ruby:

```
cd docs || exit
bundle exec jekyll serve
```

`Logorama` is a Jekyll based logo showcase site that
requires Ruby:

```
cd logorama || exit
bundle exec jekyll serve
```

`DITA To PDF` - Vanilla

```
cd eclipse-cheatsheets-to-dita-to-pdf/output
dita --input=map.ditamap --format=pdf -o pdf
```
