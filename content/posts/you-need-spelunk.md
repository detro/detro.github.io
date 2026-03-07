---
title: Digging-up Secrets? You need Spelunk!
layout: post
author: detro
tags: ["secrets", "golang", "spelunk", "project", "library", "cli", "tools", "kubernetes", "vault", "secrets manager", "cloud"]
date: "2026-03-07T20:28:00Z"
aliases:
  - /spelunk
  - /introducing-spelunk
cover:
  image: "/images/spelunk-cave.png"
  relative: true
---

If your Team, Organization or Company is serious about where to keep credentials used by services (or to interact with them), they are likely in [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/), [Hashicorp Vault](https://developer.hashicorp.com/vault/docs/secrets/kv), [one](https://cloud.google.com/security/products/secret-manager) [of the various](https://aws.amazon.com/secrets-manager/) [cloud-based](https://azure.microsoft.com/en-us/products/key-vault) Secrets Managers, [1Password](https://developer.1password.com/), etc. Then, when running locally, they might be in your Environment Variables, in a `.env`, in a file or just in plaintext in a script (naughty!).

This might lead to services and tools written to deal with those different “secret provision scenarios”. Or tricky/brittle local setups.

## Introducing Spelunk

{{< figure
  src="/images/spelunk-cave.png"
  align="center"
  caption="Ready to dig-up your secrets 😜"
>}}

[**Spelunk**](https://github.com/detro/spelunk) is a Golang library for extracting secrets from various sources
(Kubernetes, Vault, env vars, files) using a unified URI-based string: **Secret Coordinates**. For example:

```shell
# Get the value of `the-key` out of `my-team-secret` secret,
# stored in the namespace `my-namespace`
k8s://my-namespace/my-team-secret/the-key

# Secret provided in Base64 encoded form
base64://bXktYmlnLXNlY3JldAo=

# Field `$.kafka.password` extracted from the local `kafka-credentials.json`
file://kafka-credentials.json?jp=$.kafka.password
```

Spelunk simplifies the access to secrets by requiring only the *coordinates* for "digging it up". I deal for cloud-native environments, and suitable for command-line tools, as well as deployed services.

## Use cases?

* **Cloud-Native CLI Tools & Applications:** simplifies secret management for CLI tools via ["Secret Coordinates"](https://github.com/detro/spelunk#coordinates-secretcoord) instead of hardcoding secrets or managing integrations
* **Adaptable Secret Fetching:** if your Security Team decides to move from a secret storage to another, all there is to do is changing coordinates (i.e. `k8s://` → `vault://`)
* **Secret Modification/Formatting:** Using [Modifiers](https://github.com/detro/spelunk#modifiers-secretmodifier), users can extract exactly what they need from a secret (e.g. via JSONPath)
* **Idiomatic Parsing:** It integrates with CLI configuration libraries (like [flag](https://pkg.go.dev/flag), [Kong](https://github.com/alecthomas/kong), [urfave/cli](https://github.com/urfave/cli), [Viper](https://github.com/spf13/viper), …) to treat secrets just like any other parsed argument ([code examples](https://github.com/detro/spelunk/tree/main/examples))

## Let’s see some code!

You have a Kubernetes Secret:

```yaml
apiVersion: v1
kind: Secret
metadata:
  namespace: my-namespace
  name: my-secret
data:
  my-data-key: Rm9yemEgTmFwb2xpIFNlbXByZSEgSnV2ZSBNZXJkYSEK
```

Spelunk can dig it up for you:

```go
package main

import (
	"github.com/detro/spelunk"
	"github.com/detro/spelunk/plugin/source/kubernetes"
	v1 "k8s.io/client-go/kubernetes/typed/core/v1"
)

// Initialize the Kubernetes client...
k8sClient, _ := v1.NewForConfig(restConfig)

// Create a Spelunker
spelunker := spelunk.NewSpelunker(
	kubernetes.WithKubernetes(k8sClient),
)

// Dig-up secrets!
coord, _ := types.NewSecretCoord("k8s://my-namespace/my-secret/my-data-key")
secret, _ := spelunker.DigUp(ctx, coord)
```

## And it can dig-up secrets out of?

Currently Spelunk supports fetching secrets from these sources:

* Environment Variables
* File
* Plaintext
* Base64
* [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) (plugin)
* [HashiCorp Vault](https://www.hashicorp.com/en/products/vault) (plugin)

And [more are in the works](https://github.com/detro/spelunk?tab=readme-ov-file#sources-secretsource).

## “Modifiers” you said?

Modifiers are _optional behaviour_ applied to a secret after it has been dug-up by Spelunk. It can be seen as a _function in the mathematical sense_:
$$
Modifier(Val,Input) = ModifiedVal
$$
Each modifier is **applied in the same order provided** to the secret value found at the coordinates:

```
<type>://<location>?mod1=A&mod2=B&mod1=C
```

Currently we have a JSONPath extractor (`?jp=<JSONPath>`) and Base64 encoder (`?b64`). And, like for secret sources, [more modifiers are in the works](https://github.com/detro/spelunk/tree/main?tab=readme-ov-file#modifiers-secretmodifier).

## Only what you need

Spelunk follows a *“only import what you need”* principle. Aside from the most simple `SecretSource`s and `SecretModifier`s, all others are provided as [_plug-in_ that you import](https://github.com/detro/spelunk/tree/main?tab=readme-ov-file#built-in-vs-plug-in) in your project when needed:

```go
package main

import (
	"github.com/detro/spelunk"
	"github.com/detro/spelunk/plugin/source/vault"
)

func main() {
	// ... initialize a `vaultClient` and plug it in...
	spelunker = spelunk.NewSpelunker(
		vault.WithVault(vaultClient),
	)
}
```

## Alternatives?

When the need for something like Spelunk rose, I looked for what options were out there. The closest thing I found was [Go CDK Secrets](https://gocloud.dev/howto/secrets/). But, to my surprise, it does not support Kubernetes! 

So, I decided to roll my own.

## Next steps

Right now the latest release of Spelunk is [v1.1.0](https://github.com/detro/spelunk/releases/tag/v1.1.0), that introduced support for HashiCorp Vault. In the works I got:

* Support for [GCP Secrets Manager](https://cloud.google.com/security/products/secret-manager), [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/) and [Azure Key Vault](https://azure.microsoft.com/en-gb/products/key-vault/)
* Support for more extractors (like **XPath**)
* Support for more encoders (like **SHA-2/3**)
* Build a `spelunk` binary, so to embed it in shell scripts
