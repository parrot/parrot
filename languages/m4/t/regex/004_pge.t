# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 1;

# Check the functionality of the Parrot Grammar Engine needed by Parrot m4

# Use the example in 'compilers/pge/README' to see whether PGE works at all
pir_output_is( << 'END_PIR', << 'END_OUT', "check whether PGE is there" );

.sub 'test' :main
    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Dumper.pbc"

    .local pmc p6rule_compile
    p6rule_compile = find_global "PGE", "p6rule"            # get the compiler

    .local string pattern       
    pattern = "^(<[_a..zA..Z]><[_a..zA..Z0..9]>*)"  # capture the complete id

    .local pmc word_rulesub                     
    word_rulesub = p6rule_compile(pattern)                  # compile the pattern to a rulesub

    .local string target
    target = "Hello World"                          # target string
    .local pmc match
    .local pmc captures
    captures = new .Undef

    .local pmc word_rulesub
    match = word_rulesub(target)                    # execute rule on target string

    if_null match, match_fail                       # if match fails stop
    unless match goto match_fail                    # if match fails stop

match_success:
    print "match succeeded\n"

    match."dump"()                                  # display captures ($0, $1, etc.)

    .local pmc captures
    ( captures ) = match."get_array"()

    .local pmc captures_0
    captures_0 = captures[0]                    # TODO will the blow up when the match failed?
    print "The first capture is: "
    print captures_0 
    print "\n"

    goto end_main

match_fail:
    print "match failed\n"   
    goto e_mainnd

end_main:
.end

END_PIR
match succeeded
: <Hello @ 0> 0
[0]: <Hello @ 0> 0
The first capture is: Hello
END_OUT
