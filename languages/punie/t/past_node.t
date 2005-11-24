#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;

pir_output_is(<<'CODE', <<'OUT', 'load the library');
.sub _main
    load_bytecode 'languages/punie/lib/PAST/Node.pir'
.end
CODE
OUT

pir_output_is(<<'CODE', <<'OUT', 'construct a node');
.sub _main
    load_bytecode 'languages/punie/lib/PAST/Node.pir'
    .local pmc node
    node = new 'PAST::Node'
    .return()
.end
CODE
OUT

pir_output_is(<<'CODE', <<'OUT', 'set attributes manually');
.sub _main
    load_bytecode 'languages/punie/lib/PAST/Node.pir'
    .local pmc node
    node = new 'PAST::Node'
    $P0 = getattribute node, 'source'
    $P0 = "foo\n"
    $P1 = getattribute node, 'source'
    print $P1
    $P0 = getattribute node, 'pos'
    $P0 = 42
    $P1 = getattribute node, 'pos'
    print $P1
    print "\n"
    $P1 = new PerlString
    $P1 = "bar\n"
    $P2 = new PerlArray
    push $P2, $P1
    setattribute node, 'children', $P2
    $P2 = getattribute node, 'children'
    $P3 = $P2[0]
    print $P3
    .return ()
.end
CODE
foo
42
bar
OUT

pir_output_is(<<'CODE', <<'OUT', 'set attributes via method');
.sub _main
    load_bytecode 'languages/punie/lib/PAST/Node.pir'
    .local pmc node
    node = new 'PAST::Node'
    $P0 = new PerlString
    $P0 = 'bar'
    $P1 = new PerlArray
    push $P1, $P0
    node.set_node('foo', 42, $P1)
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
foo
42
bar
OUT

pir_output_is(<<'CODE', <<'OUT', 'dump node structure in visual format');
.sub _main
    load_bytecode 'languages/punie/lib/PAST/Node.pir'
    .local pmc node1
    .local pmc node2
    node1 = new 'PAST::Node'
    node2 = new 'PAST::Node'
    node2.set_node('b', 9, $P0)
    $P1 = new PerlArray
    push $P1, node2 
    node1.set_node('foo', 42, $P1)
    node1.dump()
    .return ()
.end
CODE
<PAST::Node> => { 
    'source' => 'foo',
    'pos' => '42',
    'children' => [
        <PAST::Node> => { 
            'source' => 'b',
            'pos' => '9',
            'children' => []
        }
    ]
}
OUT
