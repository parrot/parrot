#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 17

eval_is {switch} \
  {wrong # args: should be "switch ?switches? string pattern body ... ?default body?"} \
  {too few args, 0}

eval_is {switch a} \
  {wrong # args: should be "switch ?switches? string pattern body ... ?default body?"} \
  {too few args, 1}

eval_is {switch -monkey a} \
  {bad option "-monkey": must be -exact, -glob, -indexvar, -matchvar, -nocase, -regexp, or --} \
  {bad flag, -monkey}

eval_is {switch chr {a 1 b}} \
  {extra switch pattern with no body} \
  {pattern with no body}

eval_is {
 set q 1
 switch a a {set q 2}
 set q
} 2 {implied exact, singleton}

eval_is {
 set q 1
 switch b a {
   set q 2
 } b {
   set q 3
 }
 set q
} 3 {implied exact, two choices}

eval_is {
 set q 1
 switch -- -a -a {set q 2}
 set q
} 2 {implied exact, --}

eval_is {
 set q 1
 switch -- -b -a {
   set q 2
 } -b {
   set q 3
 }
 set q
} 3 {implied exact, --, two choices}

eval_is {
  set q 1
  switch ab {
    ab	{ set q 2 }
  }
  set q
} 2 {implied exact, single choice in list}

eval_is {
  set q 1
  switch ab {
    *b { set q 2 }
    a* { set q 3 }
    ab { set q 4 }
    ba { set q 5 }
  }
  set q
} 4 {implied exact, no globbing}

eval_is {
  set q 1
  switch abc {
    *b { set q 2 }
    a* { set q 3 }
    ab { set q 4 }
    ba { set q 5 }
    default { set q 6 }
  }
  set q
} 6 {implied exact, default}

eval_is {
  set q 1
  switch ab {
    *b { set q 2 }
    a* { set q 3 }
    ab { set q 4 }
    ba { set q 5 }
    default { set q 6 }
  }
  set q
} 4 {implied exact, match before default}

eval_is {
  set q 1
  switch abc {
    *b { set q 2 }
    a* { set q 3 }
    ab { set q 4 }
    ba { set q 5 }
  }
  set q
} 1 {implied exact, no match, no default}

eval_is {
  set q 1  
  switch ab {
    b  { set q 2 }
    ab { set q 3 }
    ba { set q 4 }
  }
  set q
} 3 {implied exact, choices in list}

eval_is {
  set q 1
  switch -glob ab {
    b  { set q 2 }
    a* { set q 3 }
    ab { set q 4 }
  }
  set q
} 3 {-glob, three choices}

eval_is {
  set q 1
  switch -glob abc {
    b  { set q 2 }
    a? { set q 3 }
    *a { set q 3 }
  }
  set q
} 1 {-glob, no match, no default}

eval_is {
  set q 1
  switch abc {
    b  { set q 2 }
    a? { set q 3 }
    *a { set q 4 }
    default { set q 5 }
  }
  set q
} 5 {-glob, no match, default}

# XXX Need -regexp tests 
