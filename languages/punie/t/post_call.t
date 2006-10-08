#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

pir_output_is( <<'CODE', <<'OUT', 'dump node structure in visual format' );
.sub _main
    load_bytecode 'languages/punie/lib/POST.pir'
    .local pmc node
    node = new 'POST::Call'
    node.'source'('foo')
    node.'pos'(42)
    node.'name'('bar')
    node.dump()
    .return ()
.end
CODE
<POST::Call> => { 
    'source' => 'foo',
    'pos' => '42',
    'name' => 'bar',
    'children' => []
}
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
