---
title: "Spelunk v1.2.0 + v1.3.0: Secret Managers and Extractors"
layout: post
author: detro
tags: ["secrets", "golang", "spelunk", "project", "library", "cloud", "aws", "gcp", "azure", "xml", "yaml", "toml"]
date: "2026-03-17T12:00:00Z"
cover:
  image: "/images/spelunk-cave.png"
---

If you read my [previous post introducing Spelunk](/posts/you-need-spelunk/), you already know: fetching secret from any source should be easy, especially for your users.
Reading them from HashiCorp Vault, Kubernetes or whatever should be easy to.
If they where JSON objects, extracting specific fields should be easy.
Switching between a secret providers should (repeat with me!) _easy_!

Well, since the initial announcement, my pickaxe has been swinging non-stop in the Spelunk caves, and I unearthed two updates: **v1.2.0** and **v1.3.0**! 🎉

## Release Titles 💨

Before we dive into the shiny new features, let's talk about something truly important: **Release Titles**. I decided to give "titles" to each release. Why? Because `v1.2.0` is boring, while *"The Secret Managers release"* gives releases... personality, sets the theme, and makes it way easier to remember what actually shipped.

## v1.2.0 – "The Secret Managers release" 🌧

https://github.com/detro/spelunk/releases/tag/v1.2.0

While Spelunk already had Kubernetes and Vault covered, it was lacking cloud-native Secret Manager(s). But in this release, Spelunk brings the "Big Three" to the party:

* **AWS Secrets Manager** (`aws://`) ([doc](https://pkg.go.dev/github.com/detro/spelunk@main/plugin/source/aws))
* **Google Cloud Secret Manager** (`gcp://`) ([doc](https://pkg.go.dev/github.com/detro/spelunk@main/plugin/source/gcp))
* **Azure Key Vault** (`az://`) ([doc](https://pkg.go.dev/github.com/detro/spelunk@main/plugin/source/azure))

Whether you are surfing on Azure, scaling on AWS, or chilling on GCP, Spelunk has a plugin ready to fetch your most sensitive strings.

I also threw in some super handy **[Base64](https://en.wikipedia.org/wiki/Base64) modifiers** built right in:

* `?b64 / ?b64e`: Encodes the secret value to Base64
* `?b64d`: Decodes the secret value from Base64


## v1.3.0 – "The Extractors release" ⛏️

https://github.com/detro/spelunk/releases/tag/v1.3.0

Once you dig up a secret, sometimes it's a giant blob of structured data, and you only want *one tiny shiny nugget* from it. That's where modifiers come in, and in v1.3.0 I went absolutely _bananas_ with **extractor modifiers**.

If you thought our JSONPath extractor (`?jp=`) was cool, how about:

* **XML Extraction**: Now you can use [XPath](https://en.wikipedia.org/wiki/XPath) via the `?xp=` modifier 
* **YAML Extraction**: Use [JSONPath](https://en.wikipedia.org/wiki/JSONPath) on YAML secrets with the `?yp=` modifier
* **TOML Extraction**: Use JSONPath on TOML secrets with the `?tp=` modifier

Under the hood, I did a bit of refactoring to make these modifiers robust. For example, JSONPath expressions are now compiled *before* querying, meaning you'll get much clearer error messages if you fat-finger a query syntax rather than just a confusing "not found".

### YAML and TOML extractors?!?! 🤔

About YAML and TOML, it is always possible to map those formats to JSON.
And because of this, it is possible to dig values out of them using JSONPath!

But don't ask _Me_ why _You_ end up with YAML or TOML in your secrets!?!?!? 😅

## What's Next?

With these two releases, [Spelunk](https://github.com/detro/spelunk) is more powerful and flexible than ever. I'll continue to chip away at the rock to bring you even more sources and modifiers (maybe SHA hashing? Who knows!). 

So grab your pickaxe, update your `go.mod`, and go dig up some secrets! 
