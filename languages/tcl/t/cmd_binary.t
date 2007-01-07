#!perl

# the following lines re-execute this as a tcl script
# the \ at the end of these lines makes them a comment in tcl \
use lib qw(languages/tcl/lib tcl/lib lib ../lib ../../lib); # \
use Tcl::Test; #\
__DATA__

source lib/test_more.tcl
plan 5

eval_is {binary} {wrong # args: should be "binary option ?arg arg ...?"} \
  {binary: no args}

eval_is {binary foo} {bad option "foo": must be format or scan} \
  {binary: bad subcommand}

binary scan [binary format dccc -1.3 6 7 8] dcc* d c c*
is $d    -1.3  {binary: reversible d}
is $c       6  {binary: reversible c}
is ${c*} {7 8} {binary: scan [format cc] c*}
