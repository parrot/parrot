#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_pir;

my($pir,$expected);

# string to list is a thin wrapper around parse - So this test hardly does
# it justice. I think the fact that I'm including /4/ separate IMC files
# here is an omen of something.

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    .local string arg
    .local PerlArray list
   
    arg = "a b c d"
 
    list = __stringToList(arg)
    $I0 = list
    print $I0
    print "\n"
    $S0 = list[0]
    print $S0
    print "\n"
    $S0 = list[1]
    print $S0
    print "\n"
    $S0 = list[2]
    print $S0
    print "\n"
    $S0 = list[3]
    print $S0
    print "\n"
    end
  .end
  .include "languages/tcl/lib/string_to_list.imc"  
  .include "languages/tcl/lib/parse.imc"
  .include "languages/tcl/lib/match_close.imc"
  .include "languages/tcl/lib/backslash_newline_subst.imc"
EOPIR
4
a
b
c
d
EOF

is(output($pir),$expected,"simple list");
