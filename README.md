# [ivandemarino.me](https://ivandemarino.me)

[![pages-build-deployment](https://github.com/detro/detro.github.io/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/detro/detro.github.io/actions/workflows/pages/pages-build-deployment)

This is the source code of [my blog](https://ivandemarino.me). The website
is statically generated using [Jekyll](https://jekyllrb.com/), and served
from the [`gh-pages`](https://github.com/detro/detro.github.io/tree/gh-pages) branch.

## Requirements

* [Ruby](https://www.ruby-lang.org/en/) `v3.x` (for [Jekyll](https://jekyllrb.com/))
* [NVM](https://github.com/nvm-sh/nvm) (for [Less](https://lesscss.org/))

## Install

To install all the necessary dependencies:

```shell
$ make install
```

This takes care of installing [Bundler](https://bundler.io/),
Jekyll, Jekyll plugins, Less. And with this, you are all set.

## (Makefile) commands

* `make install`: install dependencies (as above)
* `make uninstall`: cleanup dependencies
* `make update`: updates all dependencies
* `make serve`: serve the website on http://localhost:4000/
* `make ghp.build`: generates the site into the `../gh-pages` sibling directory, hosting the `gh-pages` branch
* `make ghp.commit`: usually used after `ghp.generate`, it commits the generated site into the `gh-pages` branch
* `make ghp.push`: it pushes the committed changes from the local `gh-pages` branch, to `origin/gh-pages`

The typical "dev-cycle" is:

```
serve -> MAKE CHANGES UNTIL HAPPY -> ghp.generate -> ghp.commit -> ghp.push
```

## License

Creative Commons Attribution 4.0 International [(CC BY 4.0)](./LICENSE)
