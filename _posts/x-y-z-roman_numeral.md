---
layout: post
published: false
title: "Roman Numerals"
tags: []
---
Roman Numeral Coding Question

Description:
Ask someone to write a program that converts a decimal number to a roman numeral.

Focal categories:
Coding Skills

Phrasing:
Every one is familiar with Roman numerals, but it seems like a lot of people seem to have little differences in the rules. So it's best to establish a baseline:

  &quot;M&quot; = 1000
  &quot;D&quot; = 500
  &quot;C&quot; = 100
  &quot;L&quot; = 50
  &quot;X&quot; = 10
  &quot;V&quot; = 5
  &quot;I&quot; = 1

* To find the value of a set of roman numerals you add up the value of the characters.
* A power of ten can only be repeated three times i.e., [[XXX]] = 30, [[XXXX]] is not valid.
* Those that are not powers of ten can only appear once, i.e. VV is not valid.
* The numbers must read highest-lowest from the left to the right.
* If a letter of a smaller value appears before a number of a higher value, then the smaller number is to be subtracted from the higher value. ex: [[IX]] = 9.
* You can subtract only powers of ten i.e., I, X, C
* Only one character can be used to subtract from a larger character. eg IIX = 8 is not allowed.
* You can't subtract a number from one that is more than 10 times greater. That is, you can only subtract I from V or X, X from L or C, etc. For e.g., [[IC]] can not be used for 99. It must be [[XCIX]].
* I have no idea why they sometimes put IIII on watches. : )
** ''It's (traditionally) to avoid blasphemy -- <tt>IV</tt> used to stand for "Jove," and later "YHWH."  Cite: http://en.wikipedia.org/wiki/Roman_numerals''
** Another explanation that has made the rounds is that IIII provides better symmetry to the watch face than using IV. Though [[http://www.web40571.clarahost.co.uk/roman/clockface.htm]] provides evidence that in medieval times, IIII was often used instead of IV.

Ranked Solutions:

I think this is a place where the easy solution becomes really the
best solution.  There is a median to the amount of code you must write
to implement the logic versus how much space hardcoding values takes
and keeping readabilty.  A good coder should be able to discuss these
issues.

'''Easy:'''
Can someone figure out what's the max number that can be written with
the rules above? It's 3999. If asked, they should be able to figure it
out.

Since this is harder then you think, the answer is: MMMCMXCIX = 3999
  MMM + CM + XC + IX
  MMM = 3000
  CM = 1000-100 = 900
  XC = 100 - 10 = 90
  IX = 10-9 = 9
  SUM = 3000+900+90+9 = 3999

MMMDCCCLXXXVIII = 3888 is the naive approach of only adding roman numerals.
  MMM + D + CCC + L + XXX + V + III
  MMM = 3000
  D = 500
  CCC = 300
  L = 50
  XXX= 30
  V = 5
  III = 3
  SUM= 3000+500+300+50+30+5+3 = 3888

'''Medium:'''
They could hard code every value from 1 to 3999. bad. They could hard
code every value in the thousands, hundreds, tens and ones. ie:

 1 = I
 ...
 6 = VI
 7 = VII
 ...
 10 = X
 ...
 60 = LX
 70 = LXX
 ...
 100 = C
 ...
 600 = DC
 700 = DCC
 ...
 1000 = M
 2000 = MM
 3000 = MMM

And just keep mod'ing by 10 until and breaking down the number.  I
like the approach where you have ones, five, and ten.  Essentially the
pattern is the at each 10^X level is the same.  so at the 10^1 level,
the ones = X, five = L, and ten = C.  At the 10^2 level, the ones = C,
five = D, and ten = M.

'''Hard:'''
If you can get them to implement the logic, I think it's pretty good.

'''Hints:'''
* You can ask them to start off with small numbers. You can start the scope of the problem with &quot;a number between 1 and 10.
* Some people will think they have to implement all the logic for this and not hard code any values. (ie. no lookup table). This can lead to really weird if cases. See if they can get themselves out of it. Try to simplify it for them.

Indicators:

* This question is more of how well they can organize their thoughts. If they can get the logic down, it's a good sign.
* If their &quot;if&quot; cases seem really outragous, like &quot;if (i &lt; 17 and i &gt; 15) then and they can't get out of that mode, it's a bad sign.

From Andy Chiu

----
Eric Docktor says:

There are different strategies for implementing the code. I've ranked them here in the order I prefer for reasons described. I don't think it's important that candidates (or you, dear reader) agree with me on which solution is best, only that folks can talk about the tradeoffs of the solutions.

1. Pattern map:
* Validate that the number is &lt; 3999
* While loop that pulls off the digits from the input number from greatest (1000s digit) to least (1s digit)
* Feed that digit to a function that returns the roman numeral string for that number given the number, and which digit it is. The function should use a pattern map to convert the digit to a roman numeral string. For example, you can use an array of (undef, A, [[AA]], [[AAA]], [[AB]], B, [[BA]], BAA, BAAA, [[AC]]) and then get the pattern for the value by looking up array<nowiki>[</nowiki>value<nowiki>]</nowiki>. Then substitute the A/B/C with the appropriate roman numeral letters for the given position (1s: I, V, X; 10s: X, L, C; 100s: C, D, M; 1000s: M, undef, undef.)
* Append the returned string to the main string within the while loop.

2. If/thens, with while loop:
* Similar to above, but instead of using a pattern map within the function, you find if the value is a 4, 5, or 9, and print the string appropriate to that number. If the value is less than 4, use a for loop to print the right # of Is, Xs or Cs. Else, it's 6-8, so print a V, L or C and then use a for loop to print the Is, Xs or Cs.

3. Hard-code each value between 1-3999 to its roman numeral string
* Would take 3999 assignments, which might take the candidate a little while to write in an interview. On the plus side, the run-time efficiency is O(1), which is better than the above two.

* [poertel]: Nah, they're all O(1) since the problem has a finite domain. The subtleties of big-O notation obviously aren't that important to an engineer, but that's the answer in case you want to know whether your candidate paid attention in algorithms class!
** ''Is that also the case for all algorithms whose time complexity depends on the size of an array? Arrays can't have more than 2^(8*sizeof(size_t)) elements.''
*** Why not longer arrays than that? a) size_t has been and will be altered in time. b) array don't have to always be indexed by a size_t. c) arrays don't actually have to be all in memory, they can be streamed in.
*** There is a theoretical upper bound of how many atoms exist in the universe. Said bound is a finite number. This however does not mean we can enumerate all atoms in O(1)!
*** BigO notation is meant to show how performance is impacted as the input increases.  The fact that the problem has a finite domain does not impact it.  You need to compare romanNumeral(1), romanNumeral(2), etc. and watch the runtime in each.  For this case (assuming you use a hash table), you'll notice that the runtime is constant.  In the others, you'll notice that the runtime increases as the input increases.

----
Jim Larson says:

Sometimes IIII is used instead of [[IV]] for superstition:  [[IV]] is
the start of the name of IVPITER (Jupiter, or Zeus in Greek),
the king of the gods.  For bonus points, have the routine consult
a configuration file for names of dieties which must be avoided.

----
Jacob Cohen says:

There's an approach that doesn't depend on what the value of each digit is. It's basically a modification of the greedy algorithm where you subtract the largest remaining value you can. The modification involves letting it compose a smaller power of ten in front of the current value as a subtraction, and adding the compound value if possible.

 bool isPowerOfTen(int x) {
   while (x > 1) {
     if (x % 10) return false;
     x /= 10;
   }
   return x == 1;
 }
 std::string integerToRoman(unsigned int n) {
  std::string result;
  struct RVal {
    char roman;
    int val;
  } rvals[] = {
    { 'M', 1000 },
    { 'D', 500 },
    { 'C', 100 },
    { 'L', 50 },
    { 'X', 10 },
    { 'V', 5 },
    { 'I', 1 } };
  int rvalCount = sizeof(rvals) / sizeof(rvals[0]);
  for (int i=0; i<rvalCount && n; ++i) {
    // Basic greedy algorithm, subtract the biggest remaining
    // value we can until the value would go negative.
    while (n >= rvals[i].val) {
      result += rvals[i].roman;
      n -= rvals[i].val;
    }
    // But here's the trick. See if we can add a smaller power of
    // ten and get a result large enough to subtract the current
    // value.
    for (int j=i+1; j < rvalCount; ++j) {
      if (isPowerOfTen(rvals[j].val)) {
        if (n + rvals[j].val >= rvals[i].val) {
          result += rvals[j].roman;
          result += rvals[i].roman;
          n -= (rvals[i].val - rvals[j].val);
        }
        break;
      }
    }
  }
  return result;
 }
----
Ben Olmstead says:

I've normally implemented int->roman like:

 std::string integerToRoman(unsigned int n) {
  std::string result;
  struct RVal {
    const char *roman;
    int val;
  } rvals[] = {
    { "M", 1000 },
    { "CM", 900 },
    { "D",  500 },
    { "CD", 400 },
    { "C",  100 },
    { "XC",  90 },
    { "L",   50 },
    { "XL",  40 },
    { "X",   10 },
    { "IX",   9 },
    { "V",    5 },
    { "IV",   4 },
    { "I",    1 } };
  int rvalCount = sizeof(rvals) / sizeof(rvals[0]);
  for (int i=0; i<rvalCount && n; ++i) {
    // Basic greedy algorithm, subtract the biggest remaining
    // value we can until the value would go negative.
    while (n >= rvals[i].val) {
      result += rvals[i].roman;
      n -= rvals[i].val;
    }
  }
  return result;
 }

Especially for the rules given here, it's easier just to write out the few IX-style cases.


----
Andrew Evenson says:

The problem requires some amount of information, probably saved in a structure, and a routine that utilizes the information to build the answer. I look for a good balance about how much information to store against how much code has to be written to use it. I also look for clear thinking on the algorithm that builds the solution. I also prefer if 'i' can be manipulated arithmetically rather than converted to a string first. I also like when a candidate can explain his/her choice to encapsulate (e.g. StringBuilder) over tune (e.g. write chars into a buffer and track the offset).

    private static final String[][] simple_table = new String[][]{
        new String[]{"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"},
        new String[]{"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"},
        new String[]{"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"},
        new String[]{"", "M", "MM", "MMM"}
    };


    public static String toRoman (int i) {
        if (i < 1 || i > 3999) throw new RuntimeException("Number " + i + " is not in range [1...3999]");
        StringBuilder b = new StringBuilder(16);
        for (int offset = 0; i > 0; i /= 10) {
            b.insert(0, simple_table[offset++][i % 10]);
        }
        return b.toString();
    }


If you have a lot of digits to convert and you want the best performance, you can always build an expanded table using the method defined earlier. For this reason, I would not give any points for someone who hand wrote the entire table.

    private static final String[] expanded_table = buildExpandedTable();

    private static String[] buildExpandedTable(){
        String[] table = new String[4000];
        for (int i = 1; i < 4000; i++) {
            table[i] = toRoman(i);
        }
        return table;
    }

    public static String getRoman (int i) {
        return expanded_table[i];  // returns null for '0' and out of range for all others...
    }


[[Category:Interview_Questions]]
