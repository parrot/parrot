#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;

pir_output_is(<<'CODE', <<'OUT', 'load the library');
.sub _main
    load_bytecode 'languages/punie/lib/Node.pir'
.end
CODE
OUT

pir_output_is(<<'CODE', <<'OUT', 'construct a node');
.sub _main
    load_bytecode 'languages/punie/lib/Node.pir'
    .local pmc node
    node = new 'Node'
    .return()
.end
CODE
OUT

pir_output_is(<<'CODE', <<'OUT', 'set attributes manually');
.sub _main
    load_bytecode 'languages/punie/lib/Node.pir'
    .local pmc node
    node = new 'Node'
    $P0 = getattribute node, 'source'
    $P0 = "foo\n"
    $P1 = getattribute node, 'source'
    print $P1
    $P0 = getattribute node, 'pos'
    $P0 = 42
    $P1 = getattribute node, 'pos'
    print $P1
    print "\n"
    $P1 = new .String
    $P1 = "bar\n"
    $P2 = new .ResizablePMCArray
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
    load_bytecode 'languages/punie/lib/Node.pir'
    .local pmc node
    node = new 'Node'
    node.'source'('foo')
    node.'pos'(42)

    $P0 = new .String
    $P0 = 'bar'
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
foo
42
bar
OUT

pir_output_is(<<'CODE', <<'OUT', 'dump node structure in visual format');
.sub _main
    load_bytecode 'languages/punie/lib/Node.pir'
    .local pmc node1
    node1 = new 'Node'
    node1.'source'('foo')
    node1.'pos'(42)

    .local pmc node2
    node2 = new 'Node'
    node2.'source'('b')
    node2.'pos'(9)

    node1.'add_child'(node2)
    node1.dump()
    .return ()
.end
CODE
<Node> => { 
    'source' => 'foo',
    'pos' => '42',
    'children' => [
        <Node> => { 
            'source' => 'b',
            'pos' => '9',
            'children' => []
        }
    ]
}
OUT
