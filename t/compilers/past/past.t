#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 6;

pir_output_is(<<'CODE', <<'OUT', 'load the libraries');
.sub _main
    load_bytecode 'PAST.pbc'
.end
CODE
OUT

foreach my $name (qw(Code Exp Stmts Stmt Sub)) {
my $module = "PAST::$name";
my $code = <<'CODE'
.sub _main
    load_bytecode 'PAST.pbc'
    .local pmc node
    .local pmc node2
CODE
;

$code .= "    node = new '$module'\n";
$code .= "    node2 = new '$module'\n";
$code .= <<'CODE'
    node.'source'('foo')
    node.'pos'(42)

    node2.'source'('b')
    node2.'pos'(9)
    node.'add_child'(node2)

    $P1 = getattribute node, 'source'
    print $P1
    print "\n"
    $P1 = getattribute node, 'pos'
    print $P1
    print "\n"
    node.dump()
    .return ()
.end
CODE
;

pir_output_is($code, <<"OUT", "set attributes for $module via method");
foo
42
<$module> => { 
    'source' => 'foo',
    'pos' => '42',
    'children' => [
        <$module> => { 
            'source' => 'b',
            'pos' => '9',
            'children' => []
        }
    ]
}
OUT

}
