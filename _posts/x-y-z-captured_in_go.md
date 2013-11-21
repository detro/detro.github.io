---
layout: post
published: true
title: "Captured in game of Go"
tags: []
---

=Overview=
This question is nice because it has a relatively simple algorithm, but can be harder to code well. This makes it different than most coding questions which have harder algorithms, but are simpler to code. The solution is basically just a breadth first search, its very similar to a Flood Fill algorithm.  The coding challenge comes from managing the recursion and avoiding code duplication. Note that the setup to the question is a little bit long, but that its still usually a good opportunity to assess how well they communicate about technical problems. If they have trouble understanding the rules to a game they will have similar trouble understanding the rules in a system.

'''Typically used to assess:''' SDE I level coding bar.

=Setup=
Have you heard of the game of Go?

[if they answer yes then I make sure to explain that they need to forget other rules of the game when I show them the example board.]

[While I say this next part I draw a Go board on the whiteboard and put a couple of stones on it.]

Cool, we are only concerned with a really small semantic of the game: Capturing. Go is played on a grid board like a lot of other games.  Except instead of playing in the cells you play on the intersections. There is a black player and a white player.  Each player places stones on the board; black places a stone, white player places a stone.  As far were concerned for this problem the stones never move.

Now the semantic of the Game that we care about is "Capturing". Lets say that White wants to capture this black stone.  It does that by covering the four way adjacencies of that stone; the ones connected by lines.  Diagonals don't count.  So to capture this guy White would have to go in these four spots.

[I draw the four white stones on the Go board].
{{S3Pic|go-capture-demo.png}}

Make sense?

[they always answer "yes".]

Now lets say that the black player wants to capture this white stone on the edge of the board.  In this case the white player only has to cover adjacencies that actually exist, so he only needs three stones.

[I draw the three stones needed to capture a single stone on the right hand edge of the board.]
{{S3Pic|go-edge-capture.png}}

Similarly you only need two stones to capture a piece in the corner.  Make sense?

[they always answer "yes" here, so far its pretty easy.]

Ok, now this gets really interesting when we have multiple adjacent pieces of the same colour.

[I take the original example that I drew in the middle of the board and change the lower white piece to black and then draw a couple more pieces so that the board looks like this:
{{S3Pic|go-uncaptured-block.png}}
]

So now if White wants to capture the original black piece he can't cover all of the adjacencies because one is occupied by a black piece.  So in order to capture that piece he now needs to capture this entire mutually adjacent block of black pieces.  And he does that in the same way: he covers all of the adjacencies of the block, like this.

[draw:
{{S3Pic|go-captured-block.png}}
]

Now a couple of things to realise here: first off remember that diagonals don't count, you only have to cover the adjacencies that are directly connected by lines.  So these are the only pieces we need.  Second, if we had done a slightly different set of moves like this:

[draw:
{{S3Pic|go-surrounded-not-captured.png}}
]

We would have surrounded the black pieces, but they still wouldn't be captured because there is still an empty space next to the shape.  Does that make sense?

Great, now I'm going to give you a quick example board so that we can make sure that you understand these capturing rules.  Once we're on the same page then I'll give you the programming problem.  So lets say I gave you this board.

[draw:
{{S3Pic|go-example-board.png}}
]

What is the minimal set of pieces that you put on the Board in order to capture this piece.

[I draw a little arrow pointing to the piece indicated with an arrow below, then I hand them the marker.
{{S3Pic|go-example-board-captured.png}}
]

[most of the time they will make a mistake where they capture all of the pieces that I drew, when really they don't need to capture the pieces in the upper right hand corner.  Then I ask them why they need the extra pieces and they fix it.  Sometimes if they know the game of Go they will realise that you can't actually capture this shape by the rules of the game, and then I ask them to disregard the rules about where you are able to play for the purposes of this question. Eventually they get it or else I keep explaining.  Normally up to this point is about 5 minutes.]

Cool, so here's the programming problem: Given a board and a vertex on the board I want you to tell me: true or false, the piece at that vertex is currently captured, or is not currently captured.  So if I pointed you to the piece with the arrow (which they have just captured) you should return true.  Or if I gave you a vertex containing one of the black pieces that you just placed on the left then you should return false, because they are not currently captured.

[that's basically it, that’s how I set it up.  At this point I ask them "How would you approach this problem?" and let them dive in.]

=Evaluation=

==RULES==
This is the part where I explain the capturing rules of the game and give them a quick example board where they can demonstrate that they understand them before I ask the programming question.  It usually takes about 3-4 minutes total. I use this part to assess how well they communicate about technical problems.  I give the same explanation to everyone, so I have a good baseline to evaluate how quickly they pick things up.  If they handle the example board incorrectly more than once, or I have to repeat the same point too many times then I ding them on "communication about technology".

==ALGORITHM==
Here I introduce the problem and ask them how they would approach it.  This is a pretty standard problem solving evaluation.  Most candidates will go for a recursive solution, some will unroll the recursion.  Every once in a while you will find someone who tries something different, but most will fall into the base "flood fill", "breadth first search" type solution.  A couple o things to look for:
Do they see what I call the "backtracking" problem? This is where they will revisit intersections on the graph which they have already visited (and therefor infinitely loop).  I generally give problem solving bonus points for this, but don't really take points off if they don't see it.  I get the best data on this problem from the actual code implementation, so I'd rather spend more time there.
Some candidates will split the problem into "discover the extent of the connected block of stones" and then "find out if there are empty spaces around them." This is generally inefficient, but not extensively so. If they happen on this solution first and then can realise that combining the steps is more code and time efficient then they get some bonus points for "making mental leaps."

==CODE==
I usually give them two prompts before they start coding:
# Assume that you're implementing this in the context of a working game of Go.  If there are classes or methods that you expect to be there already, feel free to use them.  If they are interesting I will make you implement them, otherwise you can just use them.
#Its very easy to duplicate a lot of code on this problem.  Try to find ways to minimise the duplication.

Really the second one is the one I care about.  The first prompt is to stop them from writing code that isn't interesting.  Seeing how well they minimise duplicate code is where the decent separate themselves from the great on this question.  There are several ways that people fail on the coding:
# They can't come up with the basic structure of the recursion.  These people just don't have enough practice coding and probably won't be successful. (- converting ideas to code).
# They miss edge conditions like passing in a null position, or a position on the board that does not contain a stone. I find that these sorts of issues are generally coachable, but too many of them can be troubling (- detail orientation).
# They can't get their head around how to collate the results of their search.  For instance they get back the results of which of their neighbours are captured and which aren't, but can't figure out how to combine those results correctly to find a solution.  Honestly I think this is a function of brain power, they just can't hold the model in their head. This one is tough to coach and generally is a mark against their being successful (- making mental leaps, converting ideas to code).
# They catch the "backtracking" problem in their algorithm, but not in their code.  This really isn't that big a deal, but you can correlate it with issues from other interviews sometimes, so its good to note. (- detail orientation).
# They have separate "if" cases for "up, down, left, right".  This is why I tell them not to duplicate code. If they do this then I will generally ask them about it specifically at the end and try to get them to find a way to remove the duplication.  If they can't find a way to do it then they get a downgrade on "code organisation". I think the ability to find the right abstraction for this (there are many possibilities) then I think its a combination of a couple things: mental horsepower (which is obviously not coachable), and coding practice.  Both are strong marks against hiring, especially at the SDE I level.
# The most common way that people solve the code duplication problem is to have a method on the Board called "getNeighbors" (or the like), which returns a list of the adjacent positions.  Then they can iterate over the list.  If they do this I don't make them actually implement the getNeighbors method, I just let them use it.  However if they try to make the method do something like only return adjacent pieces of the same colour (which basically mean they are getting to solve most of the problem for them) then I make them implement it.
