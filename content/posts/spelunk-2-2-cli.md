---
title: "Spelunk v2.2: now with CLI"
layout: post
author: detro
tags: ["secrets", "go", "golang", "spelunk", "project", "cli", "tools", "homebrew", "shell", "cloud", "kubernetes", "vault", "aws", "gcloud", "azure", "1password", "keeper", "bitwarden"]
date: "2026-08-30T22:03:00Z"
cover:
  image: "/images/spelunk-cave.png"
  relative: true
---

Quick recap for those joining late. [Spelunk](https://github.com/detro/spelunk) started as
a Go library to fetch secrets from any [Source](https://github.com/detro/spelunk#sources-secretsource) using a URI-like [Coordinates](https://github.com/detro/spelunk#coordinates-secretcoord) system ([intro](/posts/you-need-spelunk/)). Then I added support for various cloud Secret Managers and a heap of [Modifiers](https://github.com/detro/spelunk#modifiers-secretmodifier) ([`v1.2.0` + `v1.3.0`](/posts/spelunk-1-2-and-1-3/)). And after that I tore the repo apart into isolated modules/plugins, so you would only compile the third-party SDKs you actually needed ([`v2.0.0`](/posts/spelunk-2/)).

And now, time to tick another box!

## Spelunk is a CLI now 💲

I ended [the very first post](/posts/you-need-spelunk/) with a little TODO list, and one of the points was: _"Build a `spelunk` binary, so to embed it in shell scripts"_. That's
what [`v2.2.*`](https://github.com/detro/spelunk/releases/tag/v2.2.1) is about:


```shell
# dig up a secret and print it to STDOUT
$ spelunk [dig] "k8s://production/app-secret/db-password"

# checks if a secret exists: exit code 0/non-zero
$ spelunk exists "vault://secret/data/production/api-key"

# list which of the supported Sources is active, based on the credentials provided
$ spelunk creds -v
```

But what it is _really_ made for, is embedding it into your scripts:

```shell
# dig bearer token from Kubernetes
$ curl -H "Authorization: Bearer $(spelunk k8s://ns/name/key)" https://api.example.com

# or a Docker Hub password from Vault
$ spelunk "vault://secret/data/ci/docker/password" | docker login --username user --password-stdin
```

The secrets are printed to `STDOUT`. And if you need to, increase log verbosity with one or more `-v` (`STDERR`).

Pipe `|` it wherever you need: I purposely made it as _POSIX friendly_ as I could.

## Features 🤩

It **bundles _almost_ every [Source](https://github.com/detro/spelunk#sources-secretsource)** that Spelunk offers (`aws://`, `az://`, `gcp://`, `vault://`, `k8s://`, `op://`, `kp://`, plus the built-ins) and **every [Modifier](https://github.com/detro/spelunk#modifiers-secretmodifier)** (`?jp=`, `?yp=`, `?tp=`, `?xp=`, `?b64*`).

It **[auto-discovers credentials](https://github.com/detro/spelunk/tree/main/cmd/spelunk#configuration-reference)**, by looking up idiomatic **environment variables** and the **configuration files** that providers usually expect. And if you need to set them explicitly:

```shell
$ spelunk --help

#...

AWS Secrets Manager Configuration (https://aws.amazon.com/secrets-manager/):
  --aws-region=STRING          AWS Region ($AWS_REGION).
  --aws-profile=STRING         AWS Profile ($AWS_PROFILE).
  --aws-endpoint-url=STRING    AWS Secrets Manager Endpoint URL ($AWS_ENDPOINT_URL_SECRETSMANAGER).

Azure Key Vault Configuration (https://azure.microsoft.com/en-us/products/key-vault/):
  --azure-vault-url=STRING            Azure Key Vault URL (e.g. https://<vault-name>.vault.azure.net) ($AZURE_KEYVAULT_URL).
  --azure-tenant-id=STRING            Azure Tenant ID ($AZURE_TENANT_ID).
  --azure-client-id=STRING            Azure Client ID ($AZURE_CLIENT_ID).
  --azure-client-secret=STRING        Azure Client Secret ($AZURE_CLIENT_SECRET).
  --azure-insecure-skip-tls-verify    Skip TLS verification for Azure Key Vault (useful for local emulators).

GCP Secrets Manager Configuration (https://cloud.google.com/security/products/secret-manager):
  --gcp-credentials-file=STRING    Path to GCP Service Account Credentials JSON file ($GOOGLE_APPLICATION_CREDENTIALS).

HashiCorp Vault Configuration (https://www.hashicorp.com/en/products/vault):
  --vault-addr=STRING         Vault Server Address (e.g. https://vault.example.com:8200) ($VAULT_ADDR).
  --vault-token=STRING        Vault Authentication Token ($VAULT_TOKEN).
  --vault-namespace=STRING    Vault Namespace ($VAULT_NAMESPACE).

Kubernetes Secrets Configuration (https://kubernetes.io/docs/concepts/configuration/secret/):
  --kubeconfig=STRING    Path to Kubeconfig file ($KUBECONFIG).

1Password Configuration (https://developer.1password.com/docs/cli/):
  --op-service-account-token=STRING    1Password Service Account Token ($OP_SERVICE_ACCOUNT_TOKEN).
  --op-integration-name="spelunk"      1Password Integration Name.
  --op-integration-version="dev"       1Password Integration Version.

Keeper Configuration (https://docs.keeper.io/en/enterprise-guide/commander-cli):
  --ksm-config=STRING    Keeper Secrets Manager configuration (Base64 string or file path) ($KSM_CONFIG).
```

**It automagically adapts to the credentials it detects:** the rest is politely ignored. But if you need to know _what_ credentials it found:

```shell
# For example, on my system I only have Kubernetes right now
$ spelunk creds -v
2026-08-30T20:51:19+01:00 INF credentials valid plugin=k8s
```

Check out the [CLI README](https://github.com/detro/spelunk/blob/main/cmd/spelunk/README.md), or go straight for `spelunk --help`. It is built on the superb [alecthomas/kong](https://github.com/alecthomas/kong), and so the usage instructions are _extra nice_.

### Wait, why "almost" every Source? 🤨

Well, this is embarrassing.

You might have noticed that I _apparently_ jumped from `v2.0.x`, to `v2.2.x`. I didn't. I actually released [`v2.1.x`](https://github.com/detro/spelunk/releases#release-v2.1.0), but I had not realised that it wouldn't run on Windows. The binary required `CGO` to be built, because of the dependency on [bitwarden/sdk-go](https://github.com/bitwarden/sdk-go) for the `bw://` Source. This caused me 2 issues:

1. It required running 3 different `goreleaser` GitHub Workflows: a different runner per-OS, and a convoluted process to converge into a single release 😒
2. It (somehow) has a runtime dependency on a Bitwarden platform-specific native library on Windows, so it didn't actually run there 🧨

So, I decided that <u>for now</u> Spelunk CLI was good enough without Bitwarden. This allowed me to compile it __without__ `CGO`, simplify the `goreleaser` process, and ship a fixed `v2.2.x`.

The **Bitwarden plugin is __still__ fully supported** if you use Spelunk as a library. It just doesn't get to ride in the CLI. [Yet](https://github.com/detro/spelunk/issues/29).

## Installation, 4 ways 🖖

I provide statically linked binaries for `OS=linux|darwin|windows` and `ARCH=amd64|arm64`. They can be installed via:

* From [my Homebrew Tap](https://github.com/detro/homebrew-tap/) (`brew install detro/tap/spelunk`)
* Downloading the right [pre-compiled binaries](https://github.com/detro/spelunk/releases) for your system
* Compiled via `go install github.com/detro/spelunk/cmd/spelunk@latest`
* Or by compiling a `git clone https://github.com/detro/spelunk.git`

Just head [over here](https://github.com/detro/spelunk/tree/main/cmd/spelunk#installation) to get started.

## And it comes with improvements too 🛠

* [JSONPath](https://en.wikipedia.org/wiki/JSONPath) support is now built on [`ohler55/ojg`](https://github.com/ohler55/ojg), replacing an unmaintained dependency
* Every module `go.mod` has been improved by declaring the lowest Go version it actually needs to be built, so nobody is forced to upgrade their toolchain because of me
* Additional tests around the `jp`, `yp` and `tp` extractors

Everything is in the [CHANGELOG](https://github.com/detro/spelunk/blob/main/CHANGELOG.md) (of course!). And the very latest release is currently [`v2.2.1`](https://github.com/detro/spelunk/releases/tag/v2.2.1).

_Time to grab your pickaxe again, `brew install`, and go dig up some secrets from your terminal!_
