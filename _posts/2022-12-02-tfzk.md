---
layout: post
title: "TFZK - A Terraform Provider for Apache ZooKeeper"
tags: [tfzk, terraform, zookeeper, apache, opensource, project]
---

## Gimme the TL;DR

A new Terraform provider is available, designed to interact with ZooKeeper ZNodes:
[TFZK](https://registry.terraform.io/providers/tfzk/zookeeper/latest).
The latest stable version is `v1.0.3`, and you should give it a go.

Ah! And [here is the doc](https://registry.terraform.io/providers/tfzk/zookeeper/latest/docs).

## OK, I got more time - go ahead!

Earlier this year I decided to scratch a long-standing itch: build a
[Terraform Provider](https://developer.hashicorp.com/terraform/language/providers)
for [Apache ZooKeeper](https://zookeeper.apache.org/). While there was already
[one](https://registry.terraform.io/providers/ContentSquare/zookeeper/latest),
it came with limitations that created issues in production environments:

* only supported connecting to a _single_ ensemble member
* no support for storing binary data
* no access to the [ZNode Stat Structure](https://zookeeper.apache.org/doc/current/zookeeperProgrammers.html#sc_zkStatStructure)
* no support for [`PERSISTENT_SEQUENTIAL` ZNodes](https://zookeeper.apache.org/doc/r3.1.2/zookeeperProgrammers.html#Sequence+Nodes+--+Unique+Naming)

Enter [Terraform Provider ZooKeeper (TFZK)](https://registry.terraform.io/providers/tfzk/zookeeper/latest)
([GitHub repo](https://github.com/tfzk/terraform-provider-zookeeper)).

![tfzk logo](/img/tfzk-logo.png)

## Wait! What's ZooKeeper?

From [here](https://zookeeper.apache.org/doc/current/index.html):

> ZooKeeper is a high-performance coordination service for distributed applications.
> It exposes common services - such as naming, configuration management,
> synchronization, and group services - in a simple interface so you don't have
> to write them from scratch. You can use it off-the-shelf to implement consensus,
> group management, leader election, and presence protocols.

## What does ZooKeeper have to do with Terraform?

Good question.

[Terraform](https://developer.hashicorp.com/terraform/intro) is a _de-facto_
industry standard for managing small, medium and even large infrastructure in a
declarative manner. In a _cloud world_, **Terraform is a tool to bring order to chaos**.

Build a large enough infrastructure, and you will need to come up with ways to
dynamically distribute configuration to running systems. Say, you need a way
to inform your 
_[sharded](https://www.sciencedirect.com/topics/computer-science/sharding) cloud infrastructure_
of things like:

* which shard is in charge of what incoming traffic
* how services running in one shard, can send data to another one
* a new shard was deployed
* an existing shard was retired/drained

You could, in theory, provide your _topology_ to every service, via startup-time configuration.
But that comes with a non-zero downtime: you need to modify and distribute the
configuration, and then restart your services to read it. Not ideal for your uptime.

That's where a service like ZooKeeper shines: it's not designed for
high throughput or for storing lots of data. But to be a reliable central place
to send services to, so they can coordinate and react to larger infrastructure changes.

So, to answer your question, _what does ZooKeeper have to do with Terraform?_
ZooKeeper can be a perfect place to store a _live_ picture of your
infrastructure reality and let services rely on it to listen for changes.

## So, what can I do with this provider?

ZooKeeper can do a lot of things, but all are built around the core concept
of [ZNode](https://zookeeper.apache.org/doc/current/zookeeperProgrammers.html#sc_zkDataModel_znodes):

> Every node in a ZooKeeper tree is referred to as a znode.
> Znodes maintain a stat structure that includes version numbers for data changes,
> acl changes. The stat structure also has timestamps.
> The version number, together with the timestamp, allows ZooKeeper to validate
> the cache and coordinate updates.
> Each time a znode's data changes, the version number increases.
> For instance, whenever a client retrieves data, it also receives the version of the data.

TFZK offers a ZNode [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete):

* A Persistent ZNodes resource: [`zookeeper_znode`](https://registry.terraform.io/providers/tfzk/zookeeper/latest/docs/resources/znode)
* A Persistent Sequential ZNodes resource: [`zookeeper_sequential_znode`](https://registry.terraform.io/providers/tfzk/zookeeper/latest/docs/resources/sequential_znode)
* A ZNode data source: [`zookeeper_znode`](https://registry.terraform.io/providers/tfzk/zookeeper/latest/docs/data-sources/znode)
* Support for [connecting the provider to all servers](https://registry.terraform.io/providers/tfzk/zookeeper/latest/docs#servers) in the Ensemble
* Configurable [sessions time-out](https://registry.terraform.io/providers/tfzk/zookeeper/latest/docs#zookeeper-sessions)
* Full access to the ZNodes [Stat Structure](https://registry.terraform.io/providers/tfzk/zookeeper/latest/docs#the-stat-structure)

Given that a Terraform Provider only "runs" during your `plan`s and `apply`s,
its focus is on Persistent ZNodes. For this reason, it can't support 
Ephemeral ZNodes, Watchers and other "live" features, that are built
for services that hold a persistent connection:
those are more targeted at runtime services and applications (i.e. your code).

## OK, I'm sold. How do I get started?

At the time I'm writing this, [`v1.0.3`](https://registry.terraform.io/providers/tfzk/zookeeper/1.0.3)
is out. Start by adding to your Terraform configuration:

```terraform
terraform {
  required_providers {
    zookeeper = {
      source = "tfzk/zookeeper"
      version = "1.0.3"
    }
  }
}

provider "zookeeper" {
  # Configuration options
}
```

And then head to the
[official documentation](https://registry.terraform.io/providers/tfzk/zookeeper/latest/docs).

## It's great, but it's missing feature X!

Great, [why don't you help me?](https://github.com/tfzk/terraform-provider-zookeeper#development)
I set it up so it should be easy to set up a local dev environment, where you
can spin up an ensemble to test against.

There are especially 2 [features](https://github.com/tfzk/terraform-provider-zookeeper#provider-features)
I'd like to see implemented:

* Support for full authentication
* Support for ACLs

And if you are new to Terraform Provider development, take a look at
[this amazing tutorial](https://developer.hashicorp.com/terraform/tutorials/providers/provider-use).
That's how I got started.