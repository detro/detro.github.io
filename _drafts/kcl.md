---
layout: post
title: "KCL"
tags: [kafkesc, apache, kafka, opensource, project, consume, lag]
---

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