# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 1;
use Test::More;

# Check the functionality of the Parrot Grammat Engine needed by Parrot m4

# Use the example in 'compilers/pge/README' wether PGE works at all
{
  pir_output_is( << 'END_PIR', << 'OUTPUT', "check whether PGE is there" );
.sub test @MAIN
    load_bytecode "PGE.pbc"
    .local pmc p6rule
    p6rule = find_global "PGE", "p6rule"  # get the compiler

    .local string pattern       
    .local pmc rulesub                     
    pattern = "^(From|Subject):"          # pattern to compile
    rulesub = p6rule(pattern)             # compile it to rulesub

    .local pmc match
    .local string target
    target = "From: pmichaud@pobox.com"   # target string
    match = rulesub(target)               # execute rule on target string

match_loop:
    unless match goto match_fail          # if match fails stop
    print "match succeeded\n"

    match."dump"()                        # display captures ($0, $1, etc.)

    match."next"()                        # find the next match
    goto match_loop

match_fail:
    print "match failed\n"   
    .return()
.end
END_PIR
match succeeded
: <From @ 0> 0
[0]: <From @ 0> 0
match failed
OUTPUT
}
