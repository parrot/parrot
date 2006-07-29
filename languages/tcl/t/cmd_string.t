#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 32

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
