#! perl

# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);

use Parrot::Test tests => 11;

foreach my $name (qw(Node Val Var Op Block Stmts)) {
    my $module = "'PAST';'$name'";
    my $code   = <<'CODE'
.sub _main :main
    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'
    .local pmc node
    .local pmc node2
CODE
        ;

    $code .= "    node = new [$module]\n";
    $code .= "    node2 = new [$module]\n";
    $code .= <<'CODE'
    node.'init'('name' => 'foo')
    node2.'init'('name' => 'bar')
    node.'push'(node2)

    $P1 = node.'name'()
    say $P1
    "_dumper"(node, "ast")
    .return ()
.end
CODE
        ;

        $module =~ s/'//g;
    pir_output_is( $code, <<"OUT", "set attributes for $module via method" );
foo
"ast" => PMC '$module'  {
    <name> => "foo"
    [0] => PMC '$module'  {
        <name> => "bar"
    }
}
OUT

}

pir_output_is( <<'CODE', <<'OUT', 'dump PAST::Val node in visual format' );
.sub _main :main
    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'
    .local pmc node
    node = new ['PAST';'Val']
    node.'value'(1)
    node.'returns'('Integer')
    $P1 = node.'value'()
    say $P1
    $P1 = node.'returns'()
    say $P1
    "_dumper"(node, "ast")
    .return ()
.end
CODE
1
Integer
"ast" => PMC 'PAST;Val'  {
    <returns> => "Integer"
    <value> => 1
}
OUT

## TT #1476: test that return() is taken from the type of value when not specified

## TT #1476: check the rest of the PAST::Var attributes
pir_output_is( <<'CODE', <<'OUT', 'dump PAST::Var node in visual format' );
.sub _main :main
    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'
    .local pmc node
    node = new ['PAST';'Var']
    node.'scope'('foo')
    node.'viviself'('baz')
    node.'lvalue'('buz')
    "_dumper"(node, "ast")
    .return ()
.end
CODE
"ast" => PMC 'PAST;Var'  {
    <lvalue> => "buz"
    <scope> => "foo"
    <viviself> => "baz"
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'dump PAST::Op node in visual format' );
.sub _main :main
    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'
    .local pmc node
    node = new ['PAST';'Op']
    node.'pasttype'('pirop')
    node.'pirop'('add')
    node.'lvalue'('foo')
    node.'inline'('%r = add %0, %1')
    "_dumper"(node, "ast")
    .return ()
.end
CODE
"ast" => PMC 'PAST;Op'  {
    <inline> => "%r = add %0, %1"
    <lvalue> => "foo"
    <pasttype> => "pirop"
    <pirop> => "add"
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'dump PAST::Block node in visual format' );
.sub _main :main
    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'
    .local pmc node
    node = new ['PAST';'Block']
    node.'blocktype'('declaration')
    "_dumper"(node, "ast")
    .return ()
.end
CODE
"ast" => PMC 'PAST;Block'  {
    <blocktype> => "declaration"
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'PAST::Val constant nodes' );
.sub 'main' :main
    load_bytecode 'PCT.pbc'

    .local pmc block
    $P0 = get_hll_global ['PAST'], 'Block'
    block = $P0.'new'('name'=>'xyz', 'subid'=>'xyz')

    .local pmc node
    $P0 = get_hll_global ['PAST'], 'Val'
    node = $P0.'new'('value'=> 'CONTROL_NEXT', 'returns'=>'!except_types')
    block.'push'(node)

    .local pmc compiler
    compiler = get_hll_global ['PAST'], 'Compiler'
    $S0 = compiler.'compile'(block, 'target'=>'pir')
    say $S0
.end
CODE

.namespace []
.include "except_types.pasm"
.sub "xyz"  :subid("xyz")
.annotate 'line', 0
    .return (.CONTROL_NEXT)
.end


OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
