#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;

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
    $P0 = getattribute node, 'type'
    $P0 = "foo\n"
    $P1 = getattribute node, 'type'
    print $P1
    $P0 = getattribute node, 'source'
    $P0 = "bar\n"
    $P1 = getattribute node, 'source'
    print $P1
    $P0 = getattribute node, 'line'
    $P0 = 42
    $P1 = getattribute node, 'line'
    print $P1
    print "\n"
    $P0 = getattribute node, 'children'
    $P1 = new PerlString
    $P1 = "baz\n"
    push $P0, $P1
    $P2 = getattribute node, 'children'
    $P3 = $P2[0]
    print $P3
    .return ()
.end
CODE
foo
bar
42
baz
OUT

pir_output_is(<<'CODE', <<'OUT', 'set attributes via method');
.sub _main
    load_bytecode 'languages/punie/lib/PAST/Node.pir'
    .local pmc node
    node = new 'PAST::Node'
    $P0 = new PerlString
    $P0 = 'baz'
    $P1 = new PerlArray
    push $P1, $P0
    node.set_node('foo', 'bar', 42, $P1)
    $P1 = getattribute node, 'type'
    print $P1
    print "\n"
    $P1 = getattribute node, 'source'
    print $P1
    print "\n"
    $P1 = getattribute node, 'line'
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
bar
42
baz
OUT
