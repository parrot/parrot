#!perl

use strict;
use warnings;
use lib qw(tcl/lib ./lib ../lib ../../lib ../../../lib);

use Parrot::Test tests => 5;
use Parrot::Config;
use Test::More;

SKIP: {
    skip( "Parrot not configured with ICU", 5 ) unless $PConfig{has_icu};
    language_output_is( "tcl", <<TCL, <<OUT, "string match nocase" );
  puts [string match -nocase ABC abc]
TCL
1
OUT

    language_output_is( "tcl", <<'TCL', <<OUT, "string match nocase: unicode (Greek alphas)" );
  puts [string match -nocase \u03b1 \u0391]
TCL
1
OUT

    language_output_is( "tcl", <<'TCL', <<OUT, "string equal, diff with -nocase" );
  puts [string equal -nocase APPLEs oranGES]
TCL
0
OUT

    language_output_is( "tcl", <<'TCL', <<OUT, "string equal, same with -nocase" );
  puts [string equal -nocase baNAna BAnana]
TCL
1
OUT

    language_output_is( "tcl", <<'TCL', <<OUT, "string equal, -length and -nocase" );
  puts [string equal -nocase -length 4 fERry FeRroUs]
TCL
1
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
