#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;

pir_output_is(<<'CODE', <<'OUT', 'load the libraries');
.sub _main
    load_bytecode 'languages/punie/lib/PAST.pir'
.end
CODE
OUT

foreach my $module (qw(Code Exp Stmts Stmt Sub Var)) {
my $code = <<'CODE'
.sub _main
    load_bytecode 'languages/punie/lib/PAST.pir'
    .local pmc node
CODE
;

$code .= "    node = new 'PAST::$module'\n";
$code .= <<'CODE'
    $P0 = new .String
    $P0 = 'bar'
    node.'source'('foo')
    node.'pos'(42)
    node.'add_child'($P0)

    $P1 = getattribute node, 'source'
    print $P1
    print "\n"
    $P1 = getattribute node, 'pos'
    print $P1
    print "\n"
    $P2 = getattribute node, 'children'
    $P3 = $P2[0]
    print $P3
    print "\n"
    .return ()
.end
CODE
;

pir_output_is($code, <<'OUT', "set attributes for PAST::$module via method");
foo
42
bar
OUT

}
