#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/mmd.t - Multi-Method Dispatch

=head1 SYNOPSIS

	% perl -Ilib t/pmc/mmd.t

=head1 DESCRIPTION

Tests the multi-method dispatch.

=cut

use Parrot::Test tests => 4;

output_is(<<'CODE', <<'OUTPUT', "built in");
    new P0, .Integer
    new P1, .Integer
    new P2, .Integer
    set P1, 10
    set P2, 3
    div P0, P1, P2
    print P0
    print "\n"
    end
CODE
3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM divide");
##PIR##
.sub _main

.include "pmctypes.pasm"
.include "vtable_constants.pasm"

    .local pmc divide
    divide = global "Integer_divide_PerlInt"
    mmdvtregister .VTABLE_DIVIDE, .Integer, .PerlInt, divide

    $P0 = new PerlInt
    $P1 = new Integer
    $P2 = new PerlInt
    $P1 = 10
    $P2 = 3
    $P0 = $P1 / $P2
    print $P0
    print "\n"
    end
.end

.sub Integer_divide_PerlInt
    .param pmc left
    .param pmc right
    .param pmc lhs
    $I0 = left
    $I1 = right
    $I2 = $I0/$I1   # don't call divide Integer/PerlInt here
    lhs = $I2       # '
.end
CODE
3
OUTPUT
output_is(<<'CODE', <<'OUTPUT', "1+1=3");
##PIR##
.sub _main

.include "pmctypes.pasm"
.include "vtable_constants.pasm"

    .local pmc add
    add = global "add"
    mmdvtregister .VTABLE_ADD, .Integer, .Integer, add

    $P0 = new Integer
    $P1 = new Integer
    $P2 = new Integer
    $P1 = 1
    $P2 = 1
    $P0 = $P1 + $P2
    print $P0
    print "\n"
    end
.end

.sub add
    .param pmc left
    .param pmc right
    .param pmc lhs
    $I0 = left
    $I1 = right
    $I2 = $I0 + $I1
    inc $I2
    lhs = $I2
.end
CODE
3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "PASM divide - override builtin");
##PIR##
.sub _main

.include "pmctypes.pasm"
.include "vtable_constants.pasm"

    .local pmc divide
    divide = global "Integer_divide_Integer"
    mmdvtregister .VTABLE_DIVIDE, .Integer, .Integer, divide

    $P0 = new Integer
    $P1 = new Integer
    $P2 = new Integer
    $P1 = 10
    $P2 = 3
    $P0 = $P1 / $P2
    print $P0
    print "\n"
    end
.end

.sub Integer_divide_Integer
    .param pmc left
    .param pmc right
    .param pmc lhs
    lhs = 42
.end
CODE
42
OUTPUT
