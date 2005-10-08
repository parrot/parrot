# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 1;

# Check the functionality of the Parrot Grammat Engine needed by Parrot m4

# Use the example in 'compilers/pge/README' wether PGE works at all
{
  pir_output_is( << 'END_PIR', << 'OUTPUT', "check whether PGE is there" );
.sub test @MAIN
    load_bytecode "PGE.pbc"
    .local pmc p6rule
    p6rule = find_global "PGE", "p6rule"  # get the compiler

    .local string pattern       
    pattern = "^<[_a..zA..Z]><[_a..zA..Z0..9]>*"          # pattern to compile

    .local pmc state
    state = new Hash
    .local pmc rulesub                     
    rulesub = p6rule(pattern)             # compile it to rulesub
    state['word_rulesub'] = rulesub

    .local string target
    target = "Hello World"                # target string
    .local pmc match
    .local pmc word_rulesub
    word_rulesub = state['word_rulesub']
    match = word_rulesub(target)               # execute rule on target string

match_loop:
    if_null match, match_fail          # if match fails stop
    unless match goto match_fail          # if match fails stop
    print "match succeeded\n"

    match."dump"()                        # display captures ($0, $1, etc.)

    match."next"()                        # find the next match
    goto match_loop

match_fail:
    print "match failed\n"   
.end
END_PIR
match succeeded
: <Hello @ 0> 0
match succeeded
: <Hello @ 0> 0
match succeeded
: <Hello @ 0> 0
match failed
OUTPUT
}
