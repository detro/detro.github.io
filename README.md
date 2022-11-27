# ivandemarino.me - Personal blog

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
* `make build`: generates the website and stores it in `../gh-pages` sibling directory
* `make serve`: serve the website on http://localhost:4000/

## License

Creative Commons Attribution 4.0 International [(CC BY 4.0)](./LICENSE)
