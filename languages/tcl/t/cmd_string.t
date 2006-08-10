#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 126

# arg checking
eval_is {string} \
  {wrong # args: should be "string option arg ?arg ...?"} {no args}

# [string first]
is [string first a abcdefa]     0 {first, initial}
is [string first a federala]    5 {first, middle}
is [string first c green]      -1 {first, failure}
is [string first c green 0]    -1 {first, index, failure}
is [string first c abcdc end-4] 2 {first, index, end}
is [string first c abcd 20]    -1 {first, index, overshot}
is [string first c abcdc 1]     2 {first, index}

eval_is {string first c abcd joe} \
  {bad index "joe": must be integer?[+-]integer? or end?[+-]integer?} \
  {first, index, invalid index}

eval_is {string first} \
  {wrong # args: should be "string first subString string ?startIndex?"} \
  {first, not enough args}

eval_is {string first a b c d} \
  {wrong # args: should be "string first subString string ?startIndex?"} \
  {first, too many args}

# [string last]
is [string last a abcdefa]     6 {last, initial}
is [string last a federala]    7 {last, middle}
is [string last c green]      -1 {last, failure}
is [string last c green 0]    -1 {last, index, failure}
is [string last c abcdc end-2] 2 {last, index, end}

### Overshot is ignored in this case as the maximum between the string
### of the offset is considered
is [string last c abcd 20]     2 {last, index, overshot}
is [string last c abcdc 1]    -1 {last, index}

eval_is {string last c abcdc joe} \
  {bad index "joe": must be integer?[+-]integer? or end?[+-]integer?} \
  {last, index, invalid index}
eval_is {string last} \
  {wrong # args: should be "string last subString string ?startIndex?"} \
  {last, not enough args}
eval_is {string last a b c d} \
  {wrong # args: should be "string last subString string ?startIndex?"} \
  {last, too many args}

# [string index]
is [string index abcde 0]       a {index, initial}
is [string index abcde end]     e {index, end}
is [string index abcde 10]     {} {index, overshot}
is [string index abcde -1]     {} {index, undershot, neg.}
is [string index abcde end--1] {} {index, overshot, neg.}
eval_is {string index abcde 1.2} \
  {bad index "1.2": must be integer?[+-]integer? or end?[+-]integer?} \
  {index, float}
eval_is {string index abcde end-1.2} \
  {bad index "end-1.2": must be integer?[+-]integer? or end?[+-]integer?} \
  {index, end-float}
eval_is {string index abcde bogus} \
  {bad index "bogus": must be integer?[+-]integer? or end?[+-]integer?} \
  {index, bad index}
eval_is {string index abcde end-bogus} \
  {bad index "end-bogus": must be integer?[+-]integer? or end?[+-]integer?} \
  {index, bad -end}
eval_is {string index} \
  {wrong # args: should be "string index string charIndex"} \
  {string index, no args}
eval_is {string index a b c} \
  {wrong # args: should be "string index string charIndex"} \
  {string index, too many args}

# [string length]
eval_is {string length} \
  {wrong # args: should be "string length string"} \
  {length, too few args}

eval_is {string length a b} \
  {wrong # args: should be "string length string"} \
  {length, too many args}

is [string length 10]     2 "length, ascii"
is [string length \u6666] 1 "length, unicode"
is [string length ""]     0 "length, empty"

# [string range]
eval_is {string range} \
  {wrong # args: should be "string range string first last"} \
  {range, too few args}
eval_is {string range a b c d} \
  {wrong # args: should be "string range string first last"} \
  {range, too many args}

is [string range abcde 0 end] abcde {range, total}
is [string range abcde 1 end-1] bcd {range, partial}
is [string range abcde end-20 20] abcde {range, overextended}

# [string match]

is [string match * foo]        1 {string match * only}
is [string match a?c abc]      1 {string match ?}
is [string match {a[bc]c} abc] 1 {string match charset}
is [string match {a[ac]c} abc] 0 {string match charset, fail}
is [string match {\*} *]       1 {string match \*}
is [string match {\?} ?]       1 {string match \?}
is [string match ABC abc]      0 {string match case failure}
is [string match {\[} {[}]     1 {string match \[}
is [string match {\]} {]}]     1 {string match \]}

# [string repeat]
eval_is {string repeat} \
  {wrong # args: should be "string repeat string count"} \
  {repeat no args}
eval_is {string repeat a} \
  {wrong # args: should be "string repeat string count"} \
  {repeat too few args}
eval_is {string repeat a b c} \
  {wrong # args: should be "string repeat string count"} \
  {repeat too many args}

is [string repeat a 5] aaaaa {string repeat: simple}

# [string bytelength]
eval_is {string bytelength} \
  {wrong # args: should be "string bytelength string"} \
  {bytelength no args}
eval_is {string bytelength a b} \
  {wrong # args: should be "string bytelength string"} \
  {bytelength too many args}

is [string bytelength hi] 2 {bytelength ascii}
is [string bytelength \u6666] 3 {bytelength unicode}
is [string bytelength \u666]  2 {bytelength unicode 2}

# [string equal]

eval_is {string equal banana} \
  {wrong # args: should be "string equal ?-nocase? ?-length int? string1 string2"} \
  {equal too few args}

is [string equal oranges apples] 0 {equal, ne}
is [string equal oranges orANGes] 0 {equal, ne by case only}
is [string equal banana banana] 1 {sting equal, equal}
is [string equal -length 5 ferry ferrous] 0 {equal, length, ne}
is [string equal -length 4 ferry ferrous] 1 {equal, length, eq}
is [string equal -length -1 banana bananarum] 0 {equal, neg length, ne}
is [string equal -length -1 banana banana] 1 {equal, neg length, eq}

# [string tolower]
eval_is {string tolower} \
  {wrong # args: should be "string tolower string ?first? ?last?"} \
  {tolower, too few args}

is [string tolower "AabcD ABC"] {aabcd abc} {tolower, simple}
is [string tolower PARROT end-4 4] ParroT {tolower, both limits}
is [string tolower PARROT 4] PARRoT {tolower, single index}
is [string tolower PARROT 40] PARROT {tolower, single index, out of range}

# [string toupper]

eval_is {string toupper} \
  {wrong # args: should be "string toupper string ?first? ?last?"} \
  {toupper, too few args}

is [string toupper "AabcD ABC"] {AABCD ABC} {toupper}
is [string toupper parrot end-4 4] {pARROt} {toupper, both limits}
is [string toupper parrot 4] parrOt {toupper, single index}
is [string tolower parrot 40] parrot {toupper, single index out of range}

# [string totitle]

is [string totitle "AabcD ABC"] {Aabcd abc} {totitle}
is [string totitle PARROT end-4 4] PArroT {totitle, both limits}
is [string totitle parrot 4] parrOt {totitle, single index}
is [string totitle PARROT 40] PARROT {totitle, single index, out of string}

eval_is {string totitle} \
  {wrong # args: should be "string totitle string ?first? ?last?"} \
  {too few args}

# [string replace]
is [string replace parrcamelot 4 8] parrot {replace}
is [string replace junkparrot -10 3] parrot {replace, negative index}
is [string replace parrotjunk 6 20] parrot {replace, index > string len}
is [string replace perl 1 3 arrot] parrot {replace with something}
is [string replace perl 3 1 arrot] perl {replace, swapped indices}

eval_is {string replace} \
  {wrong # args: should be "string replace string first last ?string?"} \
  {replace, too few args}


# [string trimleft]
is [string trimleft "  \nfoo"] foo {trimleft, default}
is [string trimleft "abcfaoo" abc] faoo {trimleft, charset}
is [string trimleft "abcfaoo" z] abcfaoo {trimleft, charset, nomatch}

eval_is {string trimleft} \
  {wrong # args: should be "string trimleft string ?chars?"} \
  {trimleft, too few args}

# [string trimright]
is [string trimright " foo  "] { foo} {trimright, default}
is [string trimright "abcfaoo" ao] abcf {trimright, charset}
is [string trimright "abcfaoo" z] abcfaoo {trimright, charset, no match}

eval_is {string trimright} \
  {wrong # args: should be "string trimright string ?chars?"} \
  {trimleft, too few args}

# [string trim]
is [string trim " \n foo  "] foo {trim, default}
is [string trim "ooabacfaoo" ao] bacf {trim, charset}
is [string trim "abcfaoo" z] abcfaoo {trim, charset, nomatch}

eval_is {string trim} \
  {wrong # args: should be "string trim string ?chars?"} \
  {trim, too few args}

# [string compare]
is [string compare aaa aaa] 0 {compare, same}
is [string compare aaa aab] -1 {compare, "lower" string}
is [string compare aab aaa] 1 {compare, "higher" string}
is [string compare aaaa aaa] 1 {compare, bigger string}
is [string compare aaa aaaa] -1 {compare, smaller string}
is [string compare -length 3 aaa aaaa] 0 {compare, different sizes, length}
is [string compare -length 4 aaabc aaabb] 0 {compare, diff strings, length}
is [string compare -nocase AAA aaa] 0 {compare, -nocase, eq}
is [string compare -nocase aaa AAB] -1 {compare, "lower", -nocase}
is [string compare -nocase AAB aaa] 1 {compare, "higher", -nocase}
is [string compare -nocase AAAA aaa] 1 {compare, bigger string, -nocase}
is [string compare -nocase AAA aaaa] -1 {compare, smaller, -nocase}
is [string compare -length 3 -nocase aaa AAAA] 0 \
  {compare, different lengths, -len -nocase}
is [string compare -length 4 -nocase AAABC aaabb] 0 \
  {compare, different strings, len specified, different cases}
is [string compare AAAA aaaa] -1 {compare, same string, different case}
is [string compare -length -10 aaabc aaabb] 1 {compare, negative length}

eval_is {string compare} \
  {wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"} \
  {compare, no args}

eval_is {string compare -length aaa bbb} \
  {wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"} \
  {compare, bad option to length}

eval_is {string compare -length 4 -length 8 aaa bbb} \
  {wrong # args: should be "string compare ?-nocase? ?-length int? string1 string2"} \
  {compare multiple lengths}

eval_is {string compare -length four aaabc aaabb} \
  {expected integer but got "four"} \
  {bad length arg}

eval_is {string compare -length 4.2 aaabc aaabb} \
  {expected integer but got "4.2"} \
  {compare, float length}

# [string wordend]
is  [string wordend "foo bar baz" 0] 3 {wordend, from beginning}

is [string wordend "foo bar99_baz" 5] 13 {wordend, numerics and underscores}

is [string wordend "foo bar" 3] 4 {wordend, space}

eval_is {string wordend} \
  {wrong # args: should be "string wordend string index"} \
  {wordend too few args}

