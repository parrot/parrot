#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 60

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


