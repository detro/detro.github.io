---
title: "Spelunk v2.0.0 - The Multi-Module & Lean-Dependencies Release"
tags: ["secrets", "go", "golang", "spelunk", "project", "library", "cloud", "aws", "gcp", "azure", "xml", "yaml", "toml", "modules", "plugins"]
date: "2026-05-29T17:00:00Z"
cover:
  image: "/images/spelunk-cave.png"
---


I just released **Spelunk `v2.0.0`**, a major architectural redesign of the library
to dig up secrets from various sources, for Golang.

If you have read [previous posts about Spelunk](https://detro.github.io/tags/spelunk/),
you know that the project started with a simple mission: to provide a single, clean, URI-based interface (`scheme://location?modifier=arg`) to fetch secrets across any
storage backend—whether it is local files, environment variables, Kubernetes, HashiCorp Vault, AWS, Azure, or GCP.

With `v2.0.0`, I have re-designed Spelunk to solve dependency bloat and make
the core library exceptionally lean.

## Why v2?

In Spelunk v1.x, even though it offered decoupled plugins for AWS, Vault,
and Kubernetes, they all lived inside a single, monolithic Go module.
This meant that any Go application importing `spelunk` to fetch a simple
environment variable or base64 secret was forced to download, compile,
and carry heavyweight cloud SDKs.

This resulted in slower builds, larger binaries, and an unnecessarily
massive dependency graph.

Yeah, my bad I guess: sorry... 🤷 🙄

## Multi-Module Workspace

To solve this, Spelunk v2.0.0 transitions to a **Multi-Module Workspace Architecture** leveraging [Go Workspaces](https://go.dev/doc/tutorial/workspaces).

I decoupled the repository into **independent Go modules**:

1. **`github.com/detro/spelunk/v2`**: The core runtime module.
   It now carries **zero** external production dependencies.
2. **12 Isolated Plugins** (`plugin/modifier/*` and `plugin/source/*`):
   Every single integration (AWS, GCP, Azure, Vault, Kubernetes, 1Password, Bitwarden, etc.) are now a fully isolated module with its own `go.mod`.
 3. **4 Example Applications** (`examples/*`): Examples are also fully isolated
   modules referencing published tags

Users now pull down **only** the specific SDK dependencies that the specific plugins
they choose to import uses.

## Also in v2

A few other things changed, but mostly are about CI (fixes and speed-ups)
and general tooling (`Taskfile.yaml` improvements).

Read more on the [v2.0.0 release page](https://github.com/detro/spelunk/releases/tag/v2.0.0)
or on the [CHANGELOG](https://github.com/detro/spelunk/blob/main/CHANGELOG.md).

## Upgrading

Upgrading to v2 is straightforward.

1. Append `/v2` to your `imports`
2. Run `go mod tidy`

... and that should be it really. Maybe a `go get`(?), but not much more.

_So grab your pickaxe, update your `imports`, and go dig up some secrets!_