#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

pir_output_is(<<'CODE', <<'OUT', 'dump node structure in visual format');
.sub _main
    load_bytecode 'PAST.pbc'
    .local pmc node
    node = new 'PAST::Var'
    node.'source'('foo')
    node.'pos'(42)
    node.'varname'('bar')
    node.'vartype'('scalar')
    node.'scope'('global')
    node.dump()
    .return ()
.end
CODE
<PAST::Var> => { 
    'source' => 'foo',
    'pos' => '42',
    'varname' => 'bar',
    'vartype' => 'scalar',
    'scope' => 'global',
}
OUT
