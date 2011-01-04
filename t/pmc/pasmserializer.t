#!perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use lib qw[ . lib ../lib ../../lib ];
use Test::More;
use Parrot::Test tests => 2;


pir_output_like(<<'CODE', <<'OUT', 'PASMSerialize(FIA)');
.sub 'main' :main
    $P0 = new ['FixedIntegerArray']
    $P0 = 5
    $P0[0] = 1
    $P0[1] = 2
    $P0[2] = 3
    $P0[3] = 4
    $P0[4] = 5

    $P1 = new ['PASMSerializer']
    setref $P1, $P0
    $S0 = $P1
    say $S0
.end
CODE
/
    \s [$]1: FixedIntegerArray \s \n
    [$]1: \[ \s (?: \d+ \s+ )+ [$]0 \s \] \n
/mx
OUT

pir_output_like(<<'CODE', <<'OUT', 'PASMSerialize(RPA)');
.sub 'main' :main
    $P0 = new ['ResizablePMCArray']
    $P0[0] = $P0
    $P1 = box 42
    $P2 = new ['Hash']
    $P2['Hello World'] = $P1
    $P2['Circular Ref'] = $P0
    $P0[1] = $P1
    $P0[2] = $P2

    $P1 = new ['PASMSerializer']
    setref $P1, $P0
    $S0 = $P1
    say $S0
.end
CODE
/
    \s [$]1: ResizablePMCArray \s \n
    (?:
        [$]\d+: \[ \s (?: (?: -? \d+ (?: [.] \d+ )? (?: e \d+ )?
                            | \w+:"(?: [^"] | \\ ")*"
                            | STRINGNULL
                            | [$]\d+ (?: : \w+)?
                            )
         \s+ )+ [$]0 \s \] \n
    ){3}
/mx
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
