#!perl

# Copyright (C) 2005-2006, Parrot Foundation.

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Test::More;
use Parrot::Test tests => 6;

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

.sub 'init' :anon :tag('load') :init
    load_bytecode 'P6object.pbc'
    $P0 = get_hll_global 'P6metaclass'
    $P1 = $P0.'new_class'('NoneBuilder', 'attr' => 'text')
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

.sub 'init' :anon :tag('load') :init
    load_bytecode 'P6object.pbc'
    $P0 = get_hll_global 'P6metaclass'
    $P1 = $P0.'new_class'('NoneGrammar')
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

pir_output_is( <<'CODE', <<'OUT', 'lineof method' );
.sub 'main' :main
    load_bytecode 'PCT/HLLCompiler.pbc'
    'lineof_tests'()
.end

.sub 'is'
    .param int a
    .param int b
    .param string message
    if a == b goto ok
    print "not "
  ok:
    print "ok\n"
.end

.sub 'lineof_tests'
    .local pmc hll, target
    hll = get_hll_global ['PCT'], 'HLLCompiler'
    target = box "0123\n5678\r0123\r\n678\n"
    $I0 = hll.'lineof'(target, 0, 'cache'=>1)
    is($I0, 0, "lineof - beginning of string")
    $I0 = hll.'lineof'(target, 1, 'cache'=>1)
    is($I0, 0, "lineof - char on first line")
    $I0 = hll.'lineof'(target, 4, 'cache'=>1)
    is($I0, 0, "lineof - immediately before nl")
    $I0 = hll.'lineof'(target, 5, 'cache'=>1)
    is($I0, 1, "lineof - immediately after nl")
    $I0 = hll.'lineof'(target, 8, 'cache'=>1)
    is($I0, 1, "lineof - char before cr")
    $I0 = hll.'lineof'(target, 9, 'cache'=>1)
    is($I0, 1, "lineof - immediately before cr")
    $I0 = hll.'lineof'(target, 10, 'cache'=>1)
    is($I0, 2, "lineof - immediately after cr")
    $I0 = hll.'lineof'(target, 11, 'cache'=>1)
    is($I0, 2, "lineof - char after cr")
    $I0 = hll.'lineof'(target, 13, 'cache'=>1)
    is($I0, 2, "lineof - char before crnl")
    $I0 = hll.'lineof'(target, 14, 'cache'=>1)
    is($I0, 2, "lineof - immediately before crnl")
    $I0 = hll.'lineof'(target, 15, 'cache'=>1)
    is($I0, 3, "lineof - middle of crnl")
    $I0 = hll.'lineof'(target, 16, 'cache'=>1)
    is($I0, 3, "lineof - immediately after crnl")
    $I0 = hll.'lineof'(target, 19, 'cache'=>1)
    is($I0, 3, "lineof - immediately before final nl")
    $I0 = hll.'lineof'(target, 20, 'cache'=>1)
    is($I0, 4, "lineof - immediately after final nl")
.end
CODE
ok
ok
ok
ok
ok
ok
ok
ok
ok
ok
ok
ok
ok
ok
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
