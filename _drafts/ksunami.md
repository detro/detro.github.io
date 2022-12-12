---
layout: post
title: "Announcing Kafkesc & Ksunami"
tags: [ksunami, kafkesc, apache, kafka, opensource, project, workload, generator, producer, records, waves]
---

October this year, while I was in the process of
[changing job](https://www.linkedin.com/feed/update/urn:li:activity:6995482562605236224/),
I started working on an open source project to monitor Kafka _consumer lag_.
At [New Relic](https://newrelic.com), a previous gig of mine, we used **a lot of Kafka**,
and we cared equally about monitoring its usage: there are some
[great articles](https://newrelic.com/blog/best-practices/new-relic-kafkapocalypse)
on New Relic own blogs, [published over the years](https://newrelic.com/blog/search?s=kafka).

I'm also _still_ learning [Rust](https://www.rust-lang.org/), and so this was
the perfect excuse: fresh project, a language I want to become proficient in,
and time to learn-by-doing.

## Wait! TL;DR first?

I'm announcing a command-line tool to produce a constant, configurable, cyclical
stream of (dummy) records against a Kafka Cluster Topic. It's called
[Ksunami](https://github.com/kafkesc/ksunami). I'm also announcing a new GitHub
organization, [Kafkaesc](https://github.com/kafkesc), to host Ksunami
and more.

Keep reading, if you want to enjoy my long rambling about Kafka consumer lag,
and how I decided to build Ksunami.

## Consumer Lag out-of-the-box

All _proper_ Kafka Consumers produce metrics, including
[Consumer Fetch Metrics](https://kafka.apache.org/documentation/#consumer_fetch_monitoring).
Amongst the metrics, there are also these:

| Attribute name    | Description                      |
|-------------------|----------------------------------|
| `records-lag`     | The latest lag of the partition  |
| `records-lag-avg` | The average lag of the partition |
| `records-lag-max` | The max lag of the partition     |

And this metric is decorated as follows:

```
kafka.consumer:\
	type=consumer-fetch-manager-metrics,\
	partition="{partition}",\
	topic="{topic}",\
	client-id="{client-id}"

# NOTE: I splitting the line with `\` to help parsing the content
```

This means that, for each Consumer with a given `client-id`, we know
for each `topic` and `partition`, how far behind it is compared to the
latest record in the partition.

That's great! But it has a few drawbacks:

1. **lag is reported by the consumer itself**: this means that the very
   system you want to monitor the lag of, has the lag data. This is not ideal:
   what if your consumer is in an application that is in a crash-loop? You
   would be essentially _asking the patient to diagnose his own illness_.
2. **lag is an offset (i.e. `latest - current`)**:
   that's useful, but sometimes it's hard to associate meaning to it - if
   the topic doesn't see a constant stream of records, it's hard to quantify the
   lag (i.e. how late is my system in terms of _time_?)
3. **lag has to be collected across consumers**: if your system scales horizontally,
   to gather a complete picture of your consumption and lag, across all the partitions
   of a topic, you need to gather that from all the consumers; in flexibly
   scaling systems, this might be sub-optimal.

## So? What's the big idea?

First of all, **this is NOT my idea**. What I'm working on is a re-implementation of
a lag measuring system that other people smarter than me wrote at New Relic years ago.
I did spend time running and twaking it, but I'm not the one that came up with it.

Anyway, the idea is to create a system that can measure the lag, by interrogating
the Kafka Brokers themselves. Specifically, interrogating the information
contained in a special private topic that Kafka uses, to track the current
offset of every consumer:
[`__consumer_offsets`](https://kafka.apache.org/documentation/#impl_offsettracking).

By keeping track of that information, **capturing the wall-clock time** when
each `client-id` commits its offset, and comparing with the _latest_ offset
reported by consumers of topic partitions, it's possible to estrapolate/estimate
the _lag_ of each `client-id`, both in terms of _offset lag_, and _time lag_.

You can read more about this idea also [here](https://medium.com/agoda-engineering/adding-time-lag-to-monitor-kafka-consumer-2c626fa61cfc) and
[here](https://www.lightbend.com/blog/monitor-kafka-consumer-group-latency-with-kafka-lag-exporter).

## OK so, you are announcing something that measures lag?

Nope. Not yet. Given this is an entirely open source project, and I have
no business needs to deliver it by a reasonable timescale, I'm approaching this
in a verbose, prolonged, tiny-step-at-a-time way.

And so, I'll be building each piece of my system slowly, refining and tweaking
for the pure pleasure of it. And maybe, out of one of them, _You_ might
find a useful tool - who knows?

My new job doesn't involve Kafka, and I don't have a rich test cluster to
develop and test against: I need to procure one first.

## Kafkesc

**Yeeeees**, it was supposed to be called Kafkesque, but someone decide to take
the GitHub username, and use it to make 2 commits in 5 years ;-( .

So, I went for a funny alternative: **Kafkesc**
([github.com/kafkesc](https://github.com/kafkesc)).

![Kafkesc](https://avatars.githubusercontent.com/u/115027432?s=400&u=cdabaa31af9824aaaeb05edb8f1c808f10ad1027&v=4)

In this organization I'm going to host Kafka-related repositories
and projects, as the needs arise. The first, obviously, I need some
Kafka in my life.

## Kafka Development Cluster (`kafka-dev-cluster`)

> A **battery-included** BUT **development-only** pairing of `Makefile` &
> `docker-compose.yml`, designed to quickly spin-up a Kafka cluster for
> development purposes.

[`kafka-dev-cluster`](https://github.com/kafkesc/kafka-dev-cluster) has
all one needs to get a local dev cluster going, and it comes with some
super simple `Makefile` commands, so I can get bytes in and out of Kafka fast.

There is no installation: just clone the repo, and start the cluster.

```shell
$ git clone https://github.com/kafkesc/kafka-dev-cluster.git
$ cd kafka-dev-cluster
$ make start
```

I have half a mind to add a Prometheus instance to it, so that it can spin
up a dashboard on a different port. It could help with local monitoring.

But now, time to put some _serious_ records into that cluster.

## Ksunami: Waves of Kafka Records!

_Congratulations! You are crazy enough, that you decided to read all the way here!_

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

[`ksunami`](github.com/kafkesc/ksunami) ([crates.io](https://crates.io/crates/ksunami))
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

Ksunami comes from spending years managing Kafka infrastructure, and having
to address problems that occur in very specific, very high-throughput
situations. Situations that... wake you up at night.

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
want to know how [Cubic Bézier curves](https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Cubic_B%C3%A9zier_curves) fit into producing records to Kafka, give it a read.

At the time of writing, Ksunami is at version
[`v0.1.x`](https://crates.io/crates/ksunami/versions), and a sort-of-roadmap
is captured in the [issues](https://github.com/kafkesc/ksunami/issues).

## Duuuude! What about consumer lag?

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