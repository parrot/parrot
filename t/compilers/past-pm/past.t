#! perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 11;

pir_output_is( <<'CODE', <<'OUT', 'load the libraries' );
.sub _main
    load_bytecode 'PAST-pm.pbc'
.end
CODE
OUT

foreach my $name (qw(Node Val Var Op Block Stmts)) {
    my $module = "PAST::$name";
    my $code   = <<'CODE'
.sub _main
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Dumper.pbc'
    .local pmc node
    .local pmc node2
CODE
        ;

    $code .= "    node = new '$module'\n";
    $code .= "    node2 = new '$module'\n";
    $code .= <<'CODE'
    node.'init'('name' => 'foo', 'atype'=> '42')
    node2.'init'('name' => 'bar', 'atype'=> '43')
    node.'push'(node2)

    $P1 = node.'name'()
    say $P1
    "_dumper"(node, "ast")
    .return ()
.end
CODE
        ;

    pir_output_is( $code, <<"OUT", "set attributes for $module via method" );
foo
"ast" => PMC '$module'  {
    <name> => "foo"
    <atype> => "42"
    [0] => PMC '$module'  {
        <name> => "bar"
        <atype> => "43"
    }
}
OUT

}

pir_output_is( <<'CODE', <<'OUT', 'dump PAST::Val node in visual format' );
.sub _main
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Dumper.pbc'
    .local pmc node
    node = new 'PAST::Val'
    node.'ctype'('s~')
    node.'vtype'('.String')
    $P1 = node.'ctype'()
    say $P1
    $P1 = node.'vtype'()
    say $P1
    "_dumper"(node, "ast")
    .return ()
.end
CODE
s~
.String
"ast" => PMC 'PAST::Val'  {
    <ctype> => "s~"
    <vtype> => ".String"
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'dump PAST::Var node in visual format' );
.sub _main
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Dumper.pbc'
    .local pmc node
    node = new 'PAST::Var'
    node.'scope'('foo')
    node.'ismy'('bar')
    node.'viviself'('baz')
    node.'islvalue'('buz')
    node.'bindvalue'('boz')
    "_dumper"(node, "ast")
    .return ()
.end
CODE
"ast" => PMC 'PAST::Var'  {
    <scope> => "foo"
    <ismy> => "bar"
    <viviself> => "baz"
    <islvalue> => "buz"
    <bindvalue> => "boz"
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'dump PAST::Op node in visual format' );
.sub _main
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Dumper.pbc'
    .local pmc node
    node = new 'PAST::Op'
    node.'pasttype'('pirop')
    node.'pirop'('add')
    node.'returns'('.String')
    node.'islvalue'('foo')
    node.'inline'('%r = add %0, %1')
    "_dumper"(node, "ast")
    .return ()
.end
CODE
"ast" => PMC 'PAST::Op'  {
    <pasttype> => "pirop"
    <pirop> => "add"
    <returns> => ".String"
    <islvalue> => "foo"
    <inline> => "%r = add %0, %1"
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'dump PAST::Block node in visual format' );
.sub _main
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Dumper.pbc'
    .local pmc node
    node = new 'PAST::Block'
    node.'blocktype'('declaration')
    node.'symtable'('foo')
    node.'compiler'('PIR')
    node.'pragma'('anon')
    "_dumper"(node, "ast")
    .return ()
.end
CODE
"ast" => PMC 'PAST::Block'  {
    <blocktype> => "declaration"
    <symtable> => "foo"
    <compiler> => "PIR"
    <pragma> => "anon"
}
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
