#!perl
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id: basic.t 16003 2006-12-05 07:39:03Z paultcochrane $

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/hllcompiler.t - testing the features of the HLLCompiler module

=head1 SYNOPSIS

        $ prove t/compilers/past-pm/hllcompiler.t

=cut

pir_output_is( <<'CODE', <<'OUT', 'some of the auxiliary methods' );

.sub _main :main
    load_bytecode 'Parrot/HLLCompiler.pbc'
    $P0 = new [ 'HLLCompiler' ]

    # parse_name method
    $P1 = $P0.'parse_name'('None::Module')
    $S1 = $P1[0]
    say $S1
    $S1 = $P1[1]
    say $S1

    $P0.'parsegrammar'('None::Parser')
    $S1 = $P0.'parsegrammar'()
    say $S1

    $P0.'astgrammar'('None::Grammar')
    $S1 = $P0.'astgrammar'()
    say $S1
    end
.end
CODE
None
Module
None::Parser
None::Grammar
OUT

pir_output_is( <<'CODE', <<'OUT', 'one complete start-to-end compiler' );

.namespace [ 'None::Compiler' ]

.sub _main :main
    load_bytecode 'Parrot/HLLCompiler.pbc'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PAST-pm.pbc'

    # These are currently loaded as separate modules, but will move into
    # test file after HLLCompiler is refactored a little more.
    load_bytecode 't/compilers/past-pm/NoneGrammar.pir'
    load_bytecode 't/compilers/past-pm/NoneParser.pir'

    $P0 = new [ 'HLLCompiler' ]
    $P0.'language'('None')
    $P0.'parsegrammar'('NoneParser')
    $P0.'astgrammar'('NoneGrammar')

    .local pmc args
    args = new ResizableStringArray
    push args, "dummy"
    push args, "t/compilers/past-pm/script.source"
    $P1 = $P0.'command_line'(args)

    .return()
.end


CODE
thingy
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
