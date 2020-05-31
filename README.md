# Slurp

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-10-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

[![Fuchsia Programming](https://img.shields.io/website/https/slurpcode.github.io/slurp.svg)](https://slurpcode.github.io/slurp)
[![Logorama](https://img.shields.io/website?color=blue&url=https%3A%2F%2Flogorama.netlify.app%2F)](https://logorama.netlify.app/)
[![Slurp Charts](https://img.shields.io/website?color=purple&url=https%3A%2F%2Fslurpcode.netlify.com%2F)](https://slurpcode.netlify.app/)
[![Slurp - Read the Docs](https://img.shields.io/readthedocs/slurp)](https://slurp.readthedocs.io/)

[![Netlify Status](https://api.netlify.com/api/v1/badges/65f774da-2a53-422d-a304-8cddfa37a9fe/deploy-status)](https://app.netlify.com/sites/slurpcode/deploys)
[![Netlify Status](https://api.netlify.com/api/v1/badges/bfedfccb-e9c8-4d92-8553-29850be57fb2/deploy-status)](https://app.netlify.com/sites/logorama/deploys)
[![CircleCI branch](https://img.shields.io/circleci/project/github/slurpcode/slurp/master.svg)](https://circleci.com/gh/slurpcode/slurp)
[![Travis CI](https://travis-ci.org/slurpcode/slurp.svg?branch=master)](https://travis-ci.org/github/slurpcode/slurp)

[![Slurp is GPL-3.0](https://img.shields.io/github/license/slurpcode/slurp.svg)](https://github.com/slurpcode/slurp/blob/master/LICENSE)
[![This project is using Percy.io for visual regression testing](https://percy.io/static/images/percy-badge.svg)](https://percy.io)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=slurpcode/slurp)](https://dependabot.com)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e1f59ed4900747198ab1df798e85267c)](https://app.codacy.com/app/slurpcode/slurp?utm_source=github.com&utm_medium=referral&utm_content=slurpcode/slurp&utm_campaign=Badge_Grade_Dashboard)
[![codebeat](https://codebeat.co/badges/0f22c395-4213-4f0b-b5a6-22b68c1ba7eb)](https://codebeat.co/projects/github-com-slurpcode-slurp-master)
[![CodeFactor](https://www.codefactor.io/repository/github/slurpcode/slurp/badge)](https://www.codefactor.io/repository/github/slurpcode/slurp)
[![Total alerts](https://img.shields.io/lgtm/alerts/g/slurpcode/slurp.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/slurpcode/slurp/alerts/)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/slurpcode/slurp.svg)](https://github.com/slurpcode/slurp/graphs/contributors)
[![GitHub last commit](https://img.shields.io/github/last-commit/slurpcode/slurp.svg)](https://github.com/slurpcode/slurp/commits/master)
![GitHub repo size](https://img.shields.io/github/repo-size/slurpcode/slurp.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/slurpcode/slurp.svg)
![GitHub language count](https://img.shields.io/github/languages/count/slurpcode/slurp.svg)
![GitHub top language](https://img.shields.io/github/languages/top/slurpcode/slurp.svg)
![GitHub search hit counter](https://img.shields.io/github/search/slurpcode/slurp/jekyll.svg)

## Sites

[Fuchsia Programming](https://fuchsia.surf/)

[Slurp Code - Charts](https://slurpcode.netlify.app/)

[Slurp Read the Docs - in progress](https://slurp.readthedocs.io/)

[Logorama](https://logorama.netlify.app/)

![Lode Runner](docs/assets/images/gifs/lode-runner.gif "Lode Runner")
![Star Wars](docs/assets/images/gifs/star-wars-2.gif "Star Wars")

## Local testing

### Fuchsia Programming

Jekyll based site requires Ruby

```
rdoc -o docs/rdoc --exclude="assets|docs|node_modules|CODEOWNERS|Gemfile|LICENSE|README|.csv|.fql|.go|.iml|.ipr|.iws|.json|.lock|.php|.py|.sh|.toml|.txt|.xsl"
cd docs || exit
bundle exec jekyll serve
```

### Slurp Read the Docs

Python based

```
cd doc || exit
make html
```

### Logorama

Jekyll based site requires Ruby

```
cd logorama || exit
bundle exec jekyll serve
```

### DITA To PDF - Vanilla

```
cd eclipse-cheatsheets-to-dita-to-pdf/output
dita --input=map.ditamap --format=pdf -o pdf
```

### DITA To PDF - Custom Plugin

## Built With

- [Ruby](https://www.ruby-lang.org/)
- [Python](https://www.python.org/)
- [Golang](https://golang.org/)
- [PHP](https://www.php.net/)
- [Perl](https://www.perl.org/)
- [Shell](https://en.wikipedia.org/wiki/Shell_script)
- [GitHub Pages](https://pages.github.com/)
- [GitHub Desktop](https://desktop.github.com/)
- [Terminal (macOS)](<https://en.wikipedia.org/wiki/Terminal_(macOS)>)
- [Command-line interface](https://en.wikipedia.org/wiki/Command-line_interface)
- [Git](https://git-scm.com/)
- [Vim](https://www.vim.org/)
- [IntelliJ IDEA Community](https://www.jetbrains.com/idea/)
- [RubyMine](https://www.jetbrains.com/ruby/)
- [Atom](https://atom.io/)
- [BBEdit](http://www.barebones.com/products/bbedit/)
- [Bundler](https://bundler.io/)
- [Jekyll](https://jekyllrb.com/)
- [Jekyll Feed](https://github.com/jekyll/jekyll-feed)
- [Liquid](https://shopify.github.io/liquid/)
- [Minima](https://github.com/jekyll/minima)
- [Jemoji](https://github.com/jekyll/jemoji)
- [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [jQuery](https://jquery.com/)
- [Typer.js](https://steven.codes/typerjs/)
- [anime.js](http://animejs.com/)
- [mo &bull; js](https://github.com/legomushroom/mojs)
- [SnowStorm](https://github.com/scottschiller/Snowstorm)
- [Canvas](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial)
- [Sass](https://sass-lang.com/)
- [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)
- [HTML5](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5)
- [Markdown](https://daringfireball.net/projects/markdown)
- [Graphics Interchange Format - GIF](https://en.wikipedia.org/wiki/GIF)
- [Portable Network Graphics - PNG](https://en.wikipedia.org/wiki/Portable_Network_Graphics)
- [JPEG](https://en.wikipedia.org/wiki/JPEG)
- [ICO](<https://en.wikipedia.org/wiki/ICO_(file_format)>)
- [CSV](https://en.wikipedia.org/wiki/CSV)
- [YAML](http://yaml.org/)
- [Open Graph protocol](http://ogp.me/)
- [Nokogiri](https://nokogiri.org/)
- [overcommit](https://github.com/brigade/overcommit)
- [Rubocop](https://github.com/rubocop-hq/rubocop)
- [Pylint](https://www.pylint.org/)
- [Flake8](http://flake8.pycqa.org/en/latest/)
- [Revive](https://revive.run/)
- [Shellcheck](https://github.com/koalaman/shellcheck)
- [textlint](https://textlint.github.io/)
- [markdownlint](https://www.npmjs.com/package/markdownlint)
- [Hound](https://houndci.com/)
- [Sitemaps XML](https://www.sitemaps.org/protocol.html)
- [RSS](https://en.wikipedia.org/wiki/RSS)
- [Atom (Web standard)](<https://en.wikipedia.org/wiki/Atom_(Web_standard)>)
- [XSLT](https://www.w3schools.com/xml/xsl_intro.asp)
- [XPath](https://www.w3schools.com/xml/xpath_intro.asp)
- [codebeat](https://codebeat.co)
- [AccessLint](https://www.accesslint.com/)
- [CodeFactor](https://www.codefactor.io/)
- [DeepScan](https://deepscan.io/)
- [Renovate](https://renovate.whitesourcesoftware.com/)
- [DeepSource](https://deepsource.io/)
- [Requirements files](https://pip.readthedocs.io/en/1.1/requirements.html)
- [WIP](https://github.com/marketplace/wip)
- [Web App Manifest](https://developers.google.com/web/fundamentals/web-app-manifest/)
- [MP4](https://en.wikipedia.org/wiki/MPEG-4_Part_14)
- [YouTube](https://www.youtube.com/)
- [OpenSearch](https://developer.mozilla.org/en-US/docs/Web/OpenSearch)
- [Markdownlint](https://github.com/markdownlint/markdownlint)
- [yamllint](https://yamllint.readthedocs.io/en/stable/index.html)
- [Percy](https://percy.io)
- [LGTM](https://lgtm.com)
- [Dependabot](https://dependabot.com/)
- [Snyk](https://snyk.io/)
- [CircleCI](https://circleci.com/)
- [Shields IO](https://shields.io)
- [Pull Request Size](https://github.com/marketplace/pull-request-size)
- [Restyled](https://restyled.io/)
- [All Contributors](https://allcontributors.org/)
- [Disqus](https://disqus.com/)
- [CODEOWNERS](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/about-code-owners)
- [EditorConfig](https://editorconfig.org/)
- [TOML](https://en.wikipedia.org/wiki/TOML)
- [FileUtils](https://apidock.com/ruby/v2_6_3/FileUtils)
- [Mechanize](https://www.rubydoc.info/gems/mechanize/Mechanize)
- [CSV class](https://docs.ruby-lang.org/en/2.6.0/CSV.html)
- [Paint](https://github.com/janlelis/paint)
- [Colly](http://go-colly.org/)
- [ferret](https://www.montferret.dev/)
- [pflag](https://github.com/spf13/pflag)
- [AWK](https://en.wikipedia.org/wiki/AWK)
- [sed](https://en.wikipedia.org/wiki/Sed)
- [grep](https://en.wikipedia.org/wiki/Grep)
- [curl](https://curl.haxx.se/)
- [mkdir](https://en.wikipedia.org/wiki/Mkdir)
- [sleep](<https://en.wikipedia.org/wiki/Sleep_(command)>)
- [sort](<https://en.wikipedia.org/wiki/Sort_(Unix)>)
- [cd](<https://en.wikipedia.org/wiki/Cd_(command)>)
- [exit](<https://en.wikipedia.org/wiki/Exit_(command)>)
- [uniq](https://en.wikipedia.org/wiki/Uniq)
- [tail](<https://en.wikipedia.org/wiki/Tail_(Unix)>)
- [echo](<https://en.wikipedia.org/wiki/Echo_(command)>)

## Find the hidden Fuchsia Beasts

![alien](docs/assets/images/beasts/alien.png "alien")
![bear](docs/assets/images/beasts/bear.png "bear")
![bubble](docs/assets/images/beasts/bubble.png "bubble")
![dino](docs/assets/images/beasts/dino.png "dino")
![ghost](docs/assets/images/beasts/ghost.png "ghost")
![jaguar](docs/assets/images/beasts/jaguar.png "jaguar")
![karate](docs/assets/images/beasts/karate.png "karate")
![min](docs/assets/images/beasts/min.png "min")
![lion](docs/assets/images/beasts/orange.png "lion")
![police](docs/assets/images/beasts/police.png "police")
![punch](docs/assets/images/beasts/punch.png "punch")
![space](docs/assets/images/beasts/space.png "space")
![thexder](docs/assets/images/beasts/thexder.png "thexder")
![darth](docs/assets/images/beasts/darth.png "darth")
![yeti](docs/assets/images/beasts/yeti.png "yeti")

## History

The original **`Fuchsia`** Programming on Heroku

[https://fuchsia.herokuapp.com/](https://fuchsia.herokuapp.com/)

## Contributors ✨

Thanks goes to these wonderful people
([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://thebeast.me/about/"><img src="https://avatars3.githubusercontent.com/u/418747?v=4" width="100px;" alt=""/><br /><sub><b>John Bampton</b></sub></a><br /><a href="https://github.com/slurpcode/slurp/issues?q=author%3Ajbampton" title="Bug reports">🐛</a> <a href="#business-jbampton" title="Business development">💼</a> <a href="https://github.com/slurpcode/slurp/commits?author=jbampton" title="Code">💻</a> <a href="#content-jbampton" title="Content">🖋</a> <a href="https://github.com/slurpcode/slurp/commits?author=jbampton" title="Documentation">📖</a> <a href="#ideas-jbampton" title="Ideas, Planning, & Feedback">🤔</a> <a href="#infra-jbampton" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="#maintenance-jbampton" title="Maintenance">🚧</a> <a href="#projectManagement-jbampton" title="Project Management">📆</a> <a href="#question-jbampton" title="Answering Questions">💬</a> <a href="https://github.com/slurpcode/slurp/pulls?q=is%3Apr+reviewed-by%3Ajbampton" title="Reviewed Pull Requests">👀</a> <a href="#security-jbampton" title="Security">🛡️</a> <a href="#tool-jbampton" title="Tools">🔧</a> <a href="https://github.com/slurpcode/slurp/commits?author=jbampton" title="Tests">⚠️</a> <a href="#a11y-jbampton" title="Accessibility">️️️️♿️</a></td>
    <td align="center"><a href="http://spectralapps.com.br"><img src="https://avatars1.githubusercontent.com/u/56676505?v=4" width="100px;" alt=""/><br /><sub><b>Andrew </b></sub></a><br /><a href="https://github.com/slurpcode/slurp/issues?q=author%3Aspectralapps" title="Bug reports">🐛</a> <a href="https://github.com/slurpcode/slurp/commits?author=spectralapps" title="Code">💻</a></td>
    <td align="center"><a href="http://www.database-genius.com"><img src="https://avatars3.githubusercontent.com/u/15176414?v=4" width="100px;" alt=""/><br /><sub><b>Preston Hunter</b></sub></a><br /><a href="https://github.com/slurpcode/slurp/commits?author=prestonhunter" title="Code">💻</a> <a href="https://github.com/slurpcode/slurp/commits?author=prestonhunter" title="Documentation">📖</a></td>
    <td align="center"><a href="https://www.linkedin.com/in/sugiarto-udah-15023111"><img src="https://avatars0.githubusercontent.com/u/70807?v=4" width="100px;" alt=""/><br /><sub><b>sugiarto</b></sub></a><br /><a href="https://github.com/slurpcode/slurp/commits?author=ugifractal" title="Code">💻</a> <a href="https://github.com/slurpcode/slurp/pulls?q=is%3Apr+reviewed-by%3Augifractal" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="http://llearn.me/portfolio/"><img src="https://avatars2.githubusercontent.com/u/33186580?v=4" width="100px;" alt=""/><br /><sub><b>AdemHodzic</b></sub></a><br /><a href="https://github.com/slurpcode/slurp/commits?author=AdemHodzic" title="Code">💻</a></td>
    <td align="center"><a href="https://www.grafixwiz.com"><img src="https://avatars2.githubusercontent.com/u/33774837?v=4" width="100px;" alt=""/><br /><sub><b>Harley Armentrout</b></sub></a><br /><a href="https://github.com/slurpcode/slurp/commits?author=grfxwzdesigner" title="Documentation">📖</a> <a href="#design-grfxwzdesigner" title="Design">🎨</a> <a href="#ideas-grfxwzdesigner" title="Ideas, Planning, & Feedback">🤔</a> <a href="#projectManagement-grfxwzdesigner" title="Project Management">📆</a></td>
    <td align="center"><a href="https://github.com/summerhill5"><img src="https://avatars2.githubusercontent.com/u/42298149?v=4" width="100px;" alt=""/><br /><sub><b>Jorge Araica</b></sub></a><br /><a href="https://github.com/slurpcode/slurp/commits?author=summerhill5" title="Documentation">📖</a> <a href="#design-summerhill5" title="Design">🎨</a> <a href="#ideas-summerhill5" title="Ideas, Planning, & Feedback">🤔</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/Karinisk"><img src="https://avatars1.githubusercontent.com/u/43111214?v=4" width="100px;" alt=""/><br /><sub><b>Karinisk</b></sub></a><br /><a href="#design-Karinisk" title="Design">🎨</a></td>
    <td align="center"><a href="http://ndm.id.au/"><img src="https://avatars3.githubusercontent.com/u/1697199?v=4" width="100px;" alt=""/><br /><sub><b>Nicholas Meredith</b></sub></a><br /><a href="https://github.com/slurpcode/slurp/commits?author=udha" title="Documentation">📖</a> <a href="#ideas-udha" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="http://www.anish.info.np/"><img src="https://avatars3.githubusercontent.com/u/16479244?v=4" width="100px;" alt=""/><br /><sub><b>Anish Bhusal</b></sub></a><br /><a href="https://github.com/slurpcode/slurp/commits?author=anisbhsl" title="Code">💻</a> <a href="https://github.com/slurpcode/slurp/commits?author=anisbhsl" title="Documentation">📖</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the
[all-contributors](https://github.com/all-contributors/all-contributors)
specification. Contributions of any kind welcome!
