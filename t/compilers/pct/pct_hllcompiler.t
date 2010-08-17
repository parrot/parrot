#!perl

# Copyright (C) 2005-2006, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Test::More;
use Parrot::Test tests => 5;

pir_output_is( <<'CODE', <<'OUT', 'some of the auxiliary methods' );

.sub _main :main
    load_bytecode 'PCT/HLLCompiler.pbc'
    $P0 = new ['PCT';'HLLCompiler']

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

.namespace [ 'NoneParser' ]

.sub 'TOP'
    .param string source
    .param pmc options         :slurpy :named
    .return (source)
.end

.namespace [ 'NoneBuilder' ]

.sub 'init' :anon :load :init
    load_bytecode 'Protoobject.pbc'
    $P0 = get_hll_global 'Protomaker'
    $P1 = $P0.'new_subclass'('Protoobject', 'NoneBuilder', 'text')
.end

.sub 'get' :method
    .param string stage

    $P0 = new ['PAST';'Op']
    $P0.'pasttype'('inline')
    $P0.'inline'("print %0\nprint \"\\n\"")

    $P2 = getattribute self, "text"
    $P1 = new ['PAST';'Val']
    $P1.'value'($P2)

    $P0.'push'($P1)

    .return ($P0)
.end

.sub 'text' :method
    .param pmc word
    setattribute self, 'text', word
.end

.namespace [ 'NoneGrammar' ]

.sub 'init' :anon :load :init
    load_bytecode 'Protoobject.pbc'
    $P0 = get_hll_global 'Protomaker'
    $P1 = $P0.'new_subclass'('Protoobject', 'NoneGrammar')
.end

.sub 'apply' :method
    .param pmc source

    $P0 = new 'NoneBuilder'
    $P0.'text'(source)

    .return ($P0)
.end

.namespace [ 'None';'Compiler' ]

.sub _main :main
    load_bytecode 'PCT.pbc'

    $P0 = new ['PCT';'HLLCompiler']
    $P0.'language'('None')
    $P0.'parsegrammar'('NoneParser')
    $P0.'astgrammar'('NoneGrammar')

    .local pmc args
    args = new 'ResizableStringArray'
    push args, "command"
    push args, "-e"
    push args, "thingy"
    $P1 = $P0.'command_line'(args)

    .return()
.end


CODE
thingy
OUT

pir_output_is( <<'CODE', <<'OUT', 'default stages' );
.sub _main :main
    load_bytecode 'PCT/HLLCompiler.pbc'

    .local pmc hllcompiler
    hllcompiler = new ['PCT';'HLLCompiler']

    $P0 = getattribute hllcompiler, "@stages"
    $S0 = join " ", $P0
    say $S0
    .return()
.end

CODE
parse past post pir evalpmc
OUT

pir_output_is( <<'CODE', <<'OUT', 'inserting and removing stages' );
.sub _main :main
    load_bytecode 'PCT/HLLCompiler.pbc'

    .local pmc hllcompiler
    hllcompiler = new ['PCT';'HLLCompiler']

    hllcompiler.'removestage'('parse')
    hllcompiler.'addstage'('foo')
    hllcompiler.'addstage'('bar', 'before' => 'evalpmc')
    hllcompiler.'addstage'('optimize', 'after' => 'past')
    hllcompiler.'addstage'('optimize', 'after' => 'post')
    hllcompiler.'addstage'('peel', 'after' => 'optimize')
    $P0 = getattribute hllcompiler, "@stages"
    $S0 = join " ", $P0
    say $S0
    .return()
.end

CODE
past optimize peel post optimize peel pir bar evalpmc foo
OUT

pir_output_is( <<'CODE', <<'OUT', 'EXPORTALL method' );
.namespace []

.sub main :main
    load_bytecode 'PCT.pbc'
    .local pmc h, source, dest
    h = new ['PCT';'HLLCompiler']

    $P0 = new 'NameSpace'
    set_hll_global ['Omg'], 'Lol', $P0

    source = get_hll_namespace ['Foo';'Bar']
    dest = get_hll_namespace ['Omg';'Lol']

    h.'EXPORTALL'(source,dest)

    $P0 = get_hll_global ['Omg';'Lol'], 'hi'
    $P0()
    $P0 = get_hll_global ['Omg';'Lol'], 'lol'
    $P0()
.end

.namespace ['Foo';'Bar';'EXPORT';'ALL']

.sub 'lol'
    say 'omgwtf!'
.end

.sub 'hi'
    say 'hello world!'
.end


CODE
hello world!
omgwtf!
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
