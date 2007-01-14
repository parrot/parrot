#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 14

eval_is {binary} {wrong # args: should be "binary option ?arg arg ...?"} \
  {binary: no args}

eval_is {binary foo} {bad option "foo": must be format or scan} \
  {binary: bad subcommand}

# we test the default precision (which is special) elsewhere
# so just set a precision to work around a bug
set tcl_precision 17

binary scan [binary format dccc -1.3 6 7 8] dcc* d c c*
is $d    -1.3  {binary: reversible d}
is $c       6  {binary: reversible c}
is ${c*} {7 8} {binary: scan [format cc] c*}

binary scan [binary format f -1.3] f f
is $f -1.2999999523162842  {binary: reversible f}

binary scan [binary format n 9] n n
is $n 9 {binary: reversible n}

binary scan {foo bar} aa* first rest
is [list $first $rest] {f {oo bar}} {binary: scan aa*}

binary scan [binary format A6A foo bar] A* string
eval_is {set string} {foo   b} {binary: format A6A, scan A*}

binary scan [binary format A* {foo bar}] A7 string
is $string {foo bar} {binary: format A*, scan A7}

binary scan [binary format a4a foo bar] a3ca string1 c string2
is $string1 foo {binary: format a4a, scan a3ca}
is $c       0   {binary: format a4a, scan a3ca}
is $string2 b   {binary: format a4a, scan a3ca}

# segfault misc.
is [proc a {} { binary scan \x80 d joe } ; a] {} {BOOM?}
