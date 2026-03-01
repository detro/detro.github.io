# Zio Ivan's Blog

This repository contains the source code for my personal blog and website,
[Zio Ivan](https://ivandemarino.me/).
It is a static site built with [Hugo](https://gohugo.io/).

## Prerequisites

To build and run this site locally, you need the tools listed in
[`.tool-versions`](./.tool-versions).
I recommend installing [`asdf`](https://asdf-vm.com/) and then running:

```shell
$ cut -d' ' -f1 .tool-versions | while read T; do asdf plugin add $T; done
```

## License

All content is **© Ivan De Marino** and
licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
unless otherwise stated.
