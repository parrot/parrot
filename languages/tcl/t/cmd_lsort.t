#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 21

is [lsort {}] {} {empty list}

eval_is {lsort} \
  {wrong # args: should be "lsort ?options? list"} \
  {no args}

eval_is {lsort blah {}} \
  {bad option "blah": must be -ascii, -command, -decreasing, -dictionary, -increasing, -index, -indices, -integer, -nocase, -real, or -unique} \
  {bad option}

is [lsort {SortMe}] {SortMe} {one element list}

is [lsort [list a10 B2 b1 a1 a2]] \
 {B2 a1 a10 a2 b1} \
 {implicit ASCII}

is [lsort {z z z}] {z z z} {implicit ASCII, all same}

is [lsort {a z z t a monkey}] {a a monkey t z z} {implicit ASCII, few same}

is [lsort {{a b c} {} {a c d} {z z t}}] \
 {{} {a b c} {a c d} {z z t}} \
 {list of lists}

is [lsort {{3 2} {3 4} {} no way}] \
  {{} {3 2} {3 4} no way} \
  {list of lists mixed}

eval_is {
  set a {{3 2} {3 4} {} no way}
  lsort $a
} {{} {3 2} {3 4} no way} \
  {list of lists mixed var subst}

is [lsort -increasing {a10 B2 b1 a1 a2}] \
  {B2 a1 a10 a2 b1} {-increasing}

is [lsort -unique {a10 B2 a2 B2 b1 a1 a2 z z t}] \
  {B2 a1 a10 a2 b1 t z} {-unique}

is [lsort -unique {}] {} {unique empty}
is [lsort -unique A] {A} {unique one elem}

is [lsort -integer {10 2 30 5 0 -5 2}] \
  {-5 0 2 2 5 10 30} {-integer}

is [lsort -unique -integer {10 2 30 5 0 -5 2 -5}]  \
  {-5 0 2 5 10 30} {-integer -unique}

eval_is {lsort -integer {10 10.2}} \
  {expected integer but got "10.2"} \
  {integer on non-integer value}

is [lsort -decreasing {1 3 2 5 9 4 8 7 6}] \
 {9 8 7 6 5 4 3 2 1} {decreasing}

is [lsort -decreasing -integer -unique {10 2 30 5 0 -5 2}] \
  {30 10 5 2 0 -5} \
  {decreasing integer unique}

eval_is {lsort -dictionary {a10 B2 b1 a1 a2}} \
  {a1 a2 a10 b1 B2} \
  {dictionary} \
  {TODO {no excuses!}}

eval_is {
  lsort -real {4.28 5.65 6.20 7.66 7.6 2.4 8.5 0.4 7.6 6.3}
} {0.4 2.4 4.28 5.65 6.20 6.3 7.6 7.6 7.66 8.5} {-real}
