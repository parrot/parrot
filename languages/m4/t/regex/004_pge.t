# $Id$

use strict;

use Parrot::Test test => 1;
use Test::More;

plan skip_all => "Waiting on some PGE features";

# Use the example in 'compilers/p6ge/README' wether the GE works at all
{
  pir_output_is( << 'END_PIR', << 'OUTPUT', "call parrot and do something" );
.sub test @MAIN
    load_bytecode "../../../compilers/p6ge/p6ge.pir"
    .local pmc p6ge_compile
    p6ge_compile = global "_p6ge_compile"  # get the compiler

    .local string pattern       
    .local pmc rulesub                     
    pattern = "^(From|Subject):"           # pattern to compile
    rulesub = p6ge_compile(pattern)        # compile it to rulesub

    .local pmc match
    .local string target
    target = "From: pmichaud@pobox.com"       # target string
    match = rulesub(target)                   # execute rule on target string

match_loop:
    unless match goto match_fail           # if match fails stop
    print "match succeeded\n"

    match."_print"()                       # display captures ($0, $1, etc.)

    match."_next"()                        # find the next match
    goto match_loop

match_fail:
    print "match failed\n"   
    .return()
.end
END_PIR
match succeeded
  $0: <From: @ 0>
  $1: <From @ 0>
match failed
OUTPUT
}
