---
layout: post
title: "Kafkesc Updates: Docker, __consumer_offsets, byte parsing and Rust"
tags: [kafkesc, ksunami, docker, consumer_offsets, parsing, apache, kafka, opensource, projects, rust]
---

While I haven't taken the time to blog since the [Ksunami announcement],
I have been ploughing away at various projects inside the [Kafkesc] organization,
and also continuing the side-objective of growing my [Rust] skills.

So, here is a recap of a few things I have released since. And also,
how is it leading to a substantial growth in my [Rust] knowledge.

## Ksunami gets an official Docker image

In an attempt to make adoption easier, I setup [ksunami-docker] so that running
`ksunami` can be ever easier; in Docker, Kubernetes or wherever you
need. For example:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ksunami
  labels:
    ecosystem: kafka
    purpose: workload-generation
spec:
  containers:
  - name: ksunami-container
    image: kafkesc/ksunami:latest
    args: [
        "--brokers",  "B1:9091,B2:9091,...",
        "--topic",    "MY_ONCE_A_DAY_SPIKE_TOPIC",
        "--min-sec",  "86310",
        "--min",      "10",
        "--up-sec",   "10",
        "--up",       "spike-in",
        "--max-sec",  "60",
        "--max",      "10000",
        "--down-sec", "20",
        "--down",     "spike-out",
    ]
```

The Docker image is designed so that all the arguments passed to the docker image,
are passed directly to the internal `ksunami` binary. So, the exact same
[usage instructions](https://github.com/kafkesc/ksunami#usage) apply.

As you would expect, for each release of [ksunami] there will be a corresponding
release of [ksunami-docker] with a matching docker image tag.

At the time of writing, `kafkesc/ksunami:latest` is `kafkesc/ksunami:v0.1.7`.

## Unlocking the secrets of the `__consumer_offsets` Kafka Topic

Unless you decide to track your Consumer Offset outside of Kafka, you are likely
using the default mechanisms to _commit_ your offsets back to Kafka itself.

Kafka uses a _special internal_ topic to store that information:
`__consumer_offsets`. The documentation about Kafka internal 
[Consumer Offset Tracking] is a bit wanting, but there are plenty of articles
[about this topic](https://www.google.com/search?q=parsing+__consumer_offsets).

![](https://kafka.apache.org/0110/images/log_consumer.png)

For [Kafkesc], where I'm writing everything in [Rust] in the spirit of
_learning by doing_, I needed a parser for the records that are in this topic.
The records keys and values are an entirely bespoke binary format, designed
for this very narrow and specific need of tracking Consumer Offsets: nothing
generic would do.

I couldn't find anything in Rust that was able to parse every record and
every fields in it, so I built one: [kafkesc/konsumer_offsets].

It has the following features:

* **Most complete parser for `__consumer_offsets` messages out there**
* Reverse-engineering of [Kafka] 3.x parsing logic, making it retro-compatible
  by default
* Able to parse the _subscription_ and _assignment_ data contained in
  `GroupMetadata` messages: beyond what even the Kafka own parser can do
* Every struct and field is well documented
* Internal parsing functions are also documented and have references to the code
  they are based upon: if you read the code, you can go correlate to the [Kafka]
  codebase that its imitating
* Parsing is based on [bytes_parser] (more on this in a sec)
  and errors on [thiserror], so it's easy to read and handles result
  errors idiomatically

If you need to consume the `__consumer_offsets` [Kafka] Topic, and are looking
for a solid [Rust] parser,
[`konsumer_offsets` `v0.1.1`](https://crates.io/crates/konsumer_offsets) is on
[crates.io]. Give it a whirl.

## Easiest byte parsing you can find in [Rust]

When I was reverse engineering [Kafka] internal logic to implement
[kafkesc/konsumer_offsets], I was looking for the [Rust] equivalent of
[Java `ByteBuffer`]: I was looking for a simple wrapper to place around the
raw bytes, and use a _plain English_ interface that would:

* read the correct amount of bytes that encode a specific type
* parse those bytes into that type, and return it
* move an internal cursor, that would move forward the same amount of bytes we
  had just read

Initially I didn't find a crate that would do it for me, so I started
writing basic functions `parse_<type>()` into the
[`konsumer_offsets`](https://crates.io/crates/konsumer_offsets) project
I was working on.

After a few parsing functions, I realised that a simple yet effective generalization
was possible, and that would give me a chance to write my first [Rust]
[macro]. So I did.

That lead to creating [bytes_parser], currently at version
[`v0.1.4`](https://crates.io/crates/bytes_parser) on [crates.io].

### But... what about [nom]?

I later learned that I could have used [nom], but I still think it would have
felt like shooting a fly with a cannon, so I'm glad I went my own way.

While [nom] seems like an excellent and feature reach crate, I needed a simple
wrapper like what I described above. This is also because the work required
was to reverse-engineer the Kafka source code (Scala): in there the logic is
based on types very similar to [Java `ByteBuffer`].

I saw no reason not to put together a super-simple solution, to call my own.

## The power of learning by doing

This quick blogpost is a way to crystallize how important is for people like me,
to have an active-part in learning: reading a documentation and trying to
retain information for later use, just doesn't work.

At university it was the same: the Computer Science classes that I have absorbed
best, are the one that had big laboratory assignment, where you would put to
use the concepts.

I know, maybe I'm (like we say in Napoli) _discovering hot water_ here. But
I feel very frequently in this industry, that because we are all about efficiency
and we hate repeating ourselves, we rely on writing long, information-dense
documentations, and then expect people to absorb it.

It doesn't work for me, and I bet it also doesn't work for many others.

### Things I learned about Rust in the past few months

In the specific, here are a few things about [Rust] that working on [Kafkesc]
projects lead me to use and pick up (so far):

* How to use [Macros] to generate source code
* It's a great idea to have your CI run `cargo clippy`
* Enums and [`match`] are the best way to model (exhaustively) multi-branch logic
* How to define and implement my own [Traits]
* Using [`Arc`] and [`RwLock`] to make multi-threaded async programming easy
* Growing confident with [tokio] and async/await programming
* Cherish the [`Clone`] trait
* Implement as many [common Traits] as possible
* Loving the [thiserror] crate
* Write increasingly better `rustdoc` (even for macro-generated function!)
* That many [Rust] projects use dual licensing: [Apache 2.0] + [MIT]
* There is a reason [clap] is used by everyone, and its declarative syntax is amazing

And probably a lot more that I can't think of right now.

## Conclusion, about Rust

A lot of what I have listed above was already known to me. But by trying to
apply _business ideas_ to Rust idioms, trying to model what was in my head,
to what Rust _wants_ you to write, is leading to a deeper understanding and
learning of this amazing programming language.

And my admiration and respect for it and the people behind it, has grown too.

## Conclusion, about Kafkesc

The beauty of not having a deadline, means that I can stop every now and then,
and _hone_ something until it looks great, before I move on. Where in a business
setting one should never let _perfect get in the way of great_, with [Kafkesc]
I totally can.

And if a community spawns out of it at some point, that would be a cherry on top.
For now, I'm just happy to share my Kafka-centric solutions, written in [Rust].

People that have worked with me, likely know or can figure out where I'm heading
with this organization: for now, I'll keep the overarching plan to myself. 

[Ksunami announcement]: https://ivandemarino.me/2022/12/announcing-ksunami
[Kafkesc]: https://github.com/kafkesc
[ksunami-docker]: https://github.com/kafkesc/ksunami-docker
[ksunami]: https://github.com/kafkesc/ksunami
[Consumer Offset Tracking]: https://kafka.apache.org/documentation/#impl_offsettracking
[kafkesc/konsumer_offsets]: https://github.com/kafkesc/konsumer_offsets
[bytes_parser]: https://github.com/detro/bytes_parser
[thiserror]: https://crates.io/crates/thiserror
[Kafka]: https://kafka.apache.org/
[Rust]: https://www.rust-lang.org/
[Java `ByteBuffer`]: https://docs.oracle.com/en/java/javase/19/docs/api/java.base/java/nio/ByteBuffer.html
[nom]: https://crates.io/crates/nom
[bytes_parser]: https://github.com/detro/bytes_parser
[`Arc`]: https://doc.rust-lang.org/std/sync/struct.Arc.html
[`RwLock`]: https://doc.rust-lang.org/std/sync/struct.RwLock.html
[`Clone`]: https://doc.rust-lang.org/std/clone/trait.Clone.html
[Macros]: https://doc.rust-lang.org/book/ch19-06-macros.html
[macro]: https://doc.rust-lang.org/book/ch19-06-macros.html
[`match`]: https://doc.rust-lang.org/book/ch06-02-match.html
[Traits]: https://doc.rust-lang.org/book/ch10-02-traits.html
[common Traits]: https://stevedonovan.github.io/rustifications/2018/09/08/common-rust-traits.html
[Apache 2.0]: http://www.apache.org/licenses/LICENSE-2.0
[MIT]: http://opensource.org/licenses/MIT
[clap]: https://crates.io/crates/clap
[tokio]: https://crates.io/crates/tokio
[crates.io]: https://crates.io
