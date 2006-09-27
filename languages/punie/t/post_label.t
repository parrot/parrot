#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

pir_output_is(<<'CODE', <<'OUT', 'set attributes via method');
.sub _main
    load_bytecode 'languages/punie/lib/POST.pir'
    .local pmc node
    node = new 'POST::Label'
    node.'source'('foo')
    node.'pos'(42)
    node.'name'('bar')
    $P1 = getattribute node, 'source'
    print $P1
    print "\n"
    $P1 = getattribute node, 'pos'
    print $P1
    print "\n"
    $P1 = getattribute node, 'name'
    print $P1
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
    load_bytecode 'languages/punie/lib/POST.pir'
    .local pmc node
    node = new 'POST::Label'
    node.'source'('foo')
    node.'pos'(42)
    node.'name'('bar')
    node.dump()
    .return ()
.end
CODE
<POST::Label> => { 
    'source' => 'foo',
    'pos' => '42',
    'name' => 'bar',
    'dest' => undef,
}
OUT

pir_output_is(<<'CODE', <<'OUT', 'generate a label');
.sub _main
    load_bytecode 'languages/punie/lib/POST.pir'
    .local pmc node
    node = new 'POST::Label'
    $S1 = node.generate_label('name')
    print $S1
    print "\n"
    $S2 = node.generate_label()
    print $S2
    print "\n"
    .return()
.end
CODE
name_label_1
label_2
OUT
