---
layout: post
author: detro
published: true
title: "Maven, PhantomJS and Jasmine to write your JS Unit Testing"
tags: [ci, phantomjs, jasmine, unit testing, maven, jsunit]
date: "2011-07-08 17:40:40"
updated: "2011-12-22 10:34:40"
permalink: /2011/07/09/Maven-PhantomJS-and-Jasmine-to-write-your-JS-Unit-Testing
---

In [Betfair](http://www.betfair.com) we are building all sort of new things, and one of the aspects on which we are trying to focus more is doing Automated Tests for JavaScript.  Currently, all non-js code in Betfair passes through different kind of Automated (and Human) Testing (from Unit Testing, to Security, to Performance, to Human and Scripted QA), but the JavaScript language, by its very nature, makes it tricky to test in an automated fashion. It's not impossible, just a bit harder than it should.

<div class="img">
<img src="http://www.itmonline.org/jintu/image/jasmine.jpg" alt="A beautiful jasmine..." />
A beautiful jasmine...
</div>

Lately I have been spending a big chunk of my spare time lending a hand to the [PhantomJS](http://www.phantomjs.org/) project, as some of you that know me might recall.

# Don't break the flow

That started because I saw in PhantomJS, and it's headless nature, a great opportunity to contribute to the internal effort around **JS Unit Testing**. And because I wanted to allow both developers and [CI](http://en.wikipedia.org/wiki/Continuous_integration)-Servers to run JavaScript Tests with ease.

I believe that if **development experience** it's easy (and, I dare to say, **FUN**), _code just flows_! And if you can do testing with just one command from your [CLI](http://en.wikipedia.org/wiki/Command-line_interface), the flow becomes almost _beat_.

In Betfair we use [Maven](http://maven.apache.org/) to drive our build system (yeah, I know, XML orgies are terrible...). So, we type a lot of:


```bash
$ mvn clean install
```


even in departments where we mostly do Front End code. Ideally, we wanted to add, as a step to the build, a way to hook in the JavaScript Testing, and having the test result driving the build outcome. 

**`IF` JavaScript Test fails `THEN` Build Fails**! Dead simple.

# Jasmine, but not necessarily 

There are multiple libraries to write [Unit Tests for JavaScript out there](http://www.google.co.uk/search?sourceid=chrome&ie=UTF-8&q=javascript+unit+testing), and we decided to go for [Jasmine](http://pivotal.github.com/jasmine/), the evolution of [JSUnit](http://www.jsunit.net/) (now discontinued).

You can go for anything you want really, but in this post/example (and here in Betfair) we picked Jasmine. Feel free to choose your own library: as long as you are running in a browser, anything is good.

# Setup

To run the show, I came up with this setup: PhantomJS runs a script that runs a "jasmine-enabled" webpage. The script is then able to **extract the result out of the webpage** and save it on files. That's how it looks like:

<div class="img">
<img src="https://lh3.googleusercontent.com/-nJO__AXEdWQ/TvMHQ0agptI/AAAAAAAACUU/GPrj4MKuEUk/s800/PhantomJSJasmineXMLexamplesetup%252520%2525281%252529.png" width="700" />
</div>

Yes, it's a long chain of delegation. But it works. And it's also "modular": in case you want to run the tests in another Browser, you can just open the `".html"` runner! Or, in case you don't want to use Maven, you can just invoke phantom and pass it the "jasmine xml runner script" (plus arguments).

## Jasmine reporters `#forthewin`

Jasmine has a very great _design feature_: **Reporters**. You can implement this kind of plugins to _attach_ to Jasmine, separating the test execution from the test reporting. Based on the reporter you write, you can get any sort of output.

In our case, we need the tests to produce output in [JUnit XML format](http://stackoverflow.com/questions/4922867/junit-xml-format-specification-that-hudson-supports/4925847#4925847), and so I wrote one. But, if you know your shit, you are probably thinking:
<blockquote>
&laquo;A web browser is sandboxed: how do your write a file with XML from there?&raquo;
</blockquote>
Well, read on.

## Jasmine `test_runner.html`

As mentioned, Jasmine requires a webpage prepared to run the tests. In our case, something like the following is good:

```html
<!DOCTYPE HTML>
<html>
<head>
  <title>Jasmine Test Runner</title>
  <link rel="stylesheet" type="text/css" href="lib/jasmine-1.0.2/jasmine.css">
  <script type="text/javascript" src="lib/jasmine-1.0.2/jasmine.js"></script>
  <script type="text/javascript" src="lib/jasmine-1.0.2/jasmine-html.js"></script>
  <script type="text/javascript" src="lib/jasmine-reporters/jasmine.phantomjs-reporter.js"></script>

  <!-- include source files here... -->
  <script type="text/javascript" src="../src/tv.js"></script>

  <!-- include spec files here... -->
  <script type="text/javascript" src="test_spec.js"></script>

</head>
<body>

<script type="text/javascript">
  jasmine.getEnv().addReporter(new jasmine.TrivialReporter());
  jasmine.getEnv().addReporter(new jasmine.PhantomJSReporter());
  jasmine.getEnv().execute();
</script>

</body>
</html>
```


## How PhantomJS does the trick

PhantomJS, as you might know, allows to instantiate and manipulate webpages. And webpages are "sandboxed": so, it's not possible to write files on the filesystem from there. So, what I did 2 things:

1. Implemented a set of API for File I/O and submitted a pull request (see `fs` object in PhantomJS)
2. Implemented a Jasmine Reporter that saves the output of the tests in isolated variables in the test runner page context (see `test/lib/jasmine-reporters/jasmine.phantomjs-reporter.js`)
3. Wrote a PhantomJS script that is able to extract the test output from the webpage context and save it on filesystem (see `test/phantomjs_jasminexml_runner.js`)

In this way it's possible to preserve the sanboxing, while saving the desired XML format. And, along the way, give to PhantomJS the ability to manipulate files.

The script looks like this:

```javascript
// ...
    var htmlrunner = phantom.args[0],
        resultdir = phantom.args[1],
        page = new WebPage();
    
// ...

    page.open(htmlrunner, function(status) {
        if (status === "success") {
            utils.core.waitfor(function() { // wait for this to be true
                return page.evaluate(function() {
                    return typeof(jasmine.phantomjsXMLReporterPassed) !== "undefined";
                });
            }, function() { // once done...
                // Retrieve the result of the tests
                var suitesResults = page.evaluate(function(){
                    return jasmine.phantomjsXMLReporterResults;
                });
                
                // Save the result of the tests in files
                var f = null;
                for ( var i = 0, len = suitesResults.length; i < len; ++i ) {
                    try {
                        f = fs.open(resultdir + '/' + suitesResults[i]["xmlfilename"], "w");
                        f.write(suitesResults[i]["xmlbody"]);
                        f.close();
                    } catch (e) {
                        console.log(e);
                        console.log("phantomjs> Unable to save result of Suite '"+ suitesResults[i]["xmlfilename"] +"'");
                    }
                }
                
                // Return the correct exit status. '0' only if all the tests passed
                phantom.exit(page.evaluate(function(){
                    return jasmine.phantomjsXMLReporterPassed ? 0 : 1; //< exit(0) is success, exit(1) is failure
                }));
            }, function() { // or, once it timesout...
                phantom.exit(1);
            });
        } else {
            console.log("phantomjs> Could not load '" + htmlrunner + "'.");
            phantom.exit(1);
        }
    });
```


Ah, the Filesystem API (i.e. the `fs.open()` above) are still _stabilising_ as we are not sure yet how much of the [CommonJS/Filesystem](http://wiki.commonjs.org/wiki/Filesystem) specs we want to implement in PhantomJS. If you care about PhantomJS, contribute to the discussion [here](https://groups.google.com/d/topic/phantomjs/Z4E3cD3IJIM/discussion).

## Oh, yes, Maven

Some of you might have reached this page for Maven. Let me say, I'm sorry you have to deal with that thing, but... let's just focus.

Maven has a plugin for running external executable: `exec-maven-plugin`. It allows to launch any executable and, in case this exit failing (i.e. `exit(1);` or `exit(EXIT_FAILURE);`), fail the build. Super!

So, how it looks like?

```xml
<?xml version="1.0"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
    http://maven.apache.org/maven-v4_0_0.xsd">
    <!-- ... -->
    <build>
        <plugins>
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>exec-maven-plugin</artifactId>
                <version>1.1</version>
                <executions>
                    <execution>
                        <id>PhantomJS Unit Testing</id>
                        <phase>test</phase>
                        <goals>
                            <goal>exec</goal>
                        </goals>
                    </execution>
                </executions>
                <configuration>
                    <executable>phantomjs</executable>
                    <workingDirectory>test</workingDirectory>
                    <arguments>
                        <argument>phantomjs_jasminexml_runner.js</argument>
                        <argument>test_runner.html</argument>
                        <argument>${project.build.directory}/surefire-reports</argument>
                    </arguments>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
```


This adds a step in the `test phase` of the build, running our tests.

# It's on GitHub

As every piece of code that a) I think it's of any value, and b) that I can share, it's on GitHub: [phantom-jasminexml-example](https://github.com/detro/phantomjs-jasminexml-example). As the name says, this is just an example. An _inspiration_. Please customise it as much as you want to fit your purposes. And in case you can, contribute a patch to make it better.

# Conclusion

This just started. My experience in JavaScript Unit Testing is not very good, and I'm learning in the process. So, chances are, this solution has a lot of problems, it's rubbish and needs rewrite.

If that's the case, please post a comment with your thoughts and, possibly, suggestions on how this can be improved. For example, it would be great if `phantomjs_jasminexml_runner.js` was able to **generate the `test_runner.html` automagically**, after having scanned a directory containing test specs.

# PR time

By the way, if you eat code for breakfast, and you are proud of it, [we are hiring](http://jobvite.com/m?37Sa6fwZ): you might join us in trying to build this new piece of the puzzle for Betfair.
