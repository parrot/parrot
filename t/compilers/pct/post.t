#! perl

# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;

foreach my $name (qw(Op Ops Sub Label)) {
    my $module = "'POST';'$name'";
    my $code   = <<'CODE'
.sub _main
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
    "_dumper"(node, "ost")
    .return ()
.end
CODE
        ;

        $module =~ s/'//g;
    pir_output_is( $code, <<"OUT", "set attributes for $module via method" );
foo
"ost" => PMC '$module'  {
    <name> => "foo"
    [0] => PMC '$module'  {
        <name> => "bar"
    }
}
OUT

}

pir_output_is( <<'CODE', <<'OUT', 'dump POST::Op node in visual format' );
.sub _main
    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'
    .local pmc node
    node = new ['POST';'Op']
    node.'pirop'('add')
    node.'result'('$P1')
    node.'inline'('%r=1')
    "_dumper"(node, "ost")
    .return ()
.end
CODE
"ost" => PMC 'POST;Op'  {
    <inline> => "%r=1"
    <pirop> => "add"
    <result> => "$P1"
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'dump POST::Label node in visual format' );
.sub _main
    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'
    .local pmc node
    node = new ['POST';'Label']
    node.'name'('labeler')
    "_dumper"(node, "ost")
    .return ()
.end
CODE
"ost" => PMC 'POST;Label'  {
    <name> => "labeler"
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'Generate :multi' );
.sub _main
    load_bytecode 'PCT.pbc'
    load_bytecode 'dumper.pbc'
    .local pmc node
    node = new ['POST';'Sub']
    node.'name'('foo')
    $P0 = new ['ResizablePMCArray']
    push $P0, "_"
    push $P0, "Foo"
    $P1 = new ['ResizableStringArray']
    push $P1, "Bar"
    push $P1, "Baz"
    push $P0, $P1
    node.'multi'($P0)

    .local pmc compiler
    compiler = new ['POST';'Compiler']
    $S0 = compiler.'to_pir'(node)
    say $S0
    .return ()
.end
CODE

.namespace []
.sub "foo"  :subid("post10") :multi(_,["Foo"],["Bar";"Baz"])
.end


OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
