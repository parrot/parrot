#! perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;

pir_output_is( <<'CODE', <<'OUT', 'load the libraries' );
.sub _main
    load_bytecode 'PAST-pm.pbc'
.end
CODE
OUT

foreach my $name (qw(Op Ops Sub Label)) {
    my $module = "POST::$name";
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
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Dumper.pbc'
    .local pmc node
    node = new 'POST::Op'
    node.'pirop'('add')
    node.'result'('$P1')
    node.'arglist'("$P1", "$P2")
    $P1 = node.'pir'()
    say $P1
    "_dumper"(node, "ost")
    .return ()
.end
CODE
    add $P1, $P2

"ost" => PMC 'POST::Op'  {
    <pirop> => "add"
    <result> => "$P1"
    <arglist> => ResizablePMCArray (size:2) [
        "$P1",
        "$P2"
    ]
}
OUT

pir_output_is( <<'CODE', <<'OUT', 'dump POST::Label node in visual format' );
.sub _main
    load_bytecode 'PAST-pm.pbc'
    load_bytecode 'Dumper.pbc'
    .local pmc node
    node = new 'POST::Label'
    node.'name'('labeler')
    $P1 = node.'pir'()
    say $P1
    "_dumper"(node, "ost")
    .return ()
.end
CODE
  labeler10:

"ost" => PMC 'POST::Label'  {
    <name> => "labeler"
    <value> => "labeler10"
}
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
