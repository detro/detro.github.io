---
layout: post
title: "Announcing Ksunami v0.1.x"
tags: [ksunami, kafkesc, apache, kafka, opensource, project, workload, producer, records]
---

October this year, while I was in the process of
[changing job](https://www.linkedin.com/feed/update/urn:li:activity:6995482562605236224/),
I started working on an open source project to monitor Kafka _consumer lag_.
At [New Relic](https://newrelic.com), a previous gig, we used **a lot of Kafka**,
and we cared equally about monitoring its usage: there are some
[great articles](https://newrelic.com/blog/best-practices/new-relic-kafkapocalypse)
on New Relic own blogs, [published over the years](https://newrelic.com/blog/search?s=kafka).

In the process, I realised that I needed a way to spin up a Kafka cluster for
development, _and_ I needed a producer of Kafka records, that was able to behave
in accordance to specific scenarios.

I'm also _still_ learning [Rust](https://www.rust-lang.org/), and so this was
the perfect excuse: fresh project, a language I want to become proficient in,
and time to learn-by-doing.

## Ksunami: waves of Kafka records

From [GitHub](https://github.com/kafkesc/ksunami):

> Ksunami is a command-line tool to produce a constant, configurable, cyclical
> stream of (dummy) records against a Kafka Cluster Topic.
>
> If you are experimenting with scalability and latency against Kafka, and are
> looking for ways to reproduce a continues stream of records, following a
> specific traffic pattern that repeats periodically, Ksunami is the tool for you.
>
> Ksunami offers a way to set up the production of records, expressing the
> scenario as a sequence of "phases" that repeat indefinitely.
> Records content is configurable but random: the purpose of the tool is to
> help with performance and scalability testing of your infrastructure.

Ksunami ([crates.io](https://crates.io/crates/ksunami))
is a command line tool, useful to reproduce typical production scenarios
that are harder to do artificially without a lot of preparation.

```shell
# Example: Low rec/sec, but spike of 1000x once-a-day, lasting 60 seconds
$ ksunami \
    --topic {{ ONCE_A_DAY_SPIKE_TOPIC }} \
    ... \
    --min-sec 86310 \  # i.e. 24h - 90s
    --min 10 \         # most of the day, this topics sees 10 rec/sec 
    \
    --up-sec 10 \      # transitions from min to max within 10 sec
    --up spike-in \    # sudden jump: 10k rec/sec
    \
    --max-sec 60 \     # a spike of just 60s
    --max 10000 \      # producing at 10k rec/sec 
    \
    --down-sec 20 \    # transitions from max to min within 20 sec
    --down spike-out \ # sudden drop: back to just 10 rec/sec
    ...
```

Ksunami comes from spending a few years managing Kafka infrastructure, and having
to address problems that occur in very specific, very high-throughput
situations. Situations that... _wake you up at night_.

In the repo I provided [some ideas](https://github.com/kafkesc/ksunami#examples)
on how Ksunami can be used. And, even in this early stage, it already
[provides many options](https://github.com/kafkesc/ksunami#usage), to tailor to
very specific needs.

```shell
# Records in a wavy-pattern over the 24h cycle
$ ksunami \
    --topic {{ WAVY_TOPIC }} \
    ... \
    --min-sec 21600 \    # first quarter of the day
    --min 1000 \         # 1k rec/sec 
    \
    --up-sec 21600 \     # second quarter of the day
    --up ease-in-out \   # stable rise
    \
    --max-sec 21600 \    # third quarter of the day
    --max 3000 \         # 3k rec/sec 
    \
    --down-sec 21600 \   # fourth quarter of the day
    --down ease-in-out \ # stable decline
    ...
```

Ksunami is built around the **concept of _4 phases_ and _transitions_**: in the
`README.md` I provided an extended explaination of its
[core concepts](https://github.com/kafkesc/ksunami#core-concepts). And if you
want to know how
[Cubic Bézier curves](https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Cubic_B%C3%A9zier_curves)
fit into producing records to Kafka, give it a read.

**At the time of writing, Ksunami is at version
[`v0.1.x`](https://crates.io/crates/ksunami/versions)**, and I delineated
a bit of a roadmap in the [issue tracker](https://github.com/kafkesc/ksunami/issues).

Even if we are just at `0.1.x`, Ksunami is already sporting a multi-threaded async core,
based on the superb [Tokio](https://tokio.rs/), and a rich command line interface,
thanks to the awesome [clap](https://crates.io/crates/clap).

## Spinning a Kafka cluster for development

Earlier I was hinting at
[Kafka Development Cluster](https://github.com/kafkesc/kafka-dev-cluster):

> A **battery-included** BUT **development-only** pairing of `Makefile` &
> `docker-compose.yml`, designed to quickly spin-up a Kafka cluster for
> development purposes.

[`kafka-dev-cluster`](https://github.com/kafkesc/kafka-dev-cluster) has
all someone (I?) needs to get a local dev cluster going, and it comes with some
super simple `Makefile` commands, so I can get bytes in and out of Kafka fast.

There is no installation: just clone the repo, and start the cluster.

```shell
$ git clone https://github.com/kafkesc/kafka-dev-cluster.git
$ cd kafka-dev-cluster
$ make start
```

I have half a mind to add a Prometheus instance to it, so that it can spin
up a dashboard on a different port. It could help with local monitoring.
Ah, and maybe a [Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html#sr-overview)?

## "Wait! What's github.com/kafkesc?"

I created an dedicated GitHub Organization to host what I'm doing.
Yes! It _was_ supposed to be called _Kafkesque_, but someone decide to take
that username, and use it to make 2 commits in 5 years ;-(.
So I went for a funny alternative: [Kafkesc](https://github.com/kafkesc).

![Kafkesc](https://avatars.githubusercontent.com/u/115027432?s=400&u=cdabaa31af9824aaaeb05edb8f1c808f10ad1027&v=4)

In this organization I'm going to host Kafka-related repositories
and projects, as the needs arise.

## In conclusion

Ksunami is a _Records Producer_: I can tell it to produce more or less,
at specific intervals, with specific spikes and valleys,
tailoring its behaviour to the scenarios I want.

I now need a _Records Consumer_! Something that can be made to misbehave?
That every 10 minutes takes a _nap_ and stops consuming? That turns on
once a day, consumes a whole topic of records, and then sleeps for 23h,
letting records (and lag) accumulate?

Sorry, it will be a while before I can release a consumer lag calculator. But I
did write last year a Rust parser for `__consumer_offsets`: maybe I should
take a second and release that as a Rust Crate?