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

use Parrot::Test tests => 7;

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
.include "mmd.pasm"

    .local pmc divide
    divide = global "Integer_divide_PerlInt"
    mmdvtregister .MMD_DIVIDE, .Integer, .PerlInt, divide

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
.include "mmd.pasm"

    .local pmc add
    add = global "add"
    mmdvtregister .MMD_ADD, .Integer, .Integer, add

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
.include "mmd.pasm"

    .local pmc divide
    divide = global "Integer_divide_Integer"
    mmdvtregister .MMD_DIVIDE, .Integer, .Integer, divide

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

output_is(<<'CODE', <<'OUTPUT', "INTVAL return numeq");
##PIR##
.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc comp
    comp = global "Float_cmp_Integer"
    mmdvtregister .MMD_NUMCMP, .Float, .Integer, comp

    $P1 = new Float
    $P2 = new Integer
    $P1 = 47.11
    $P2 = 47
    $I0 = cmp $P1, $P2   # XXX cmp calls cmp_num
    print $I0
    print "\n"
    end
.end

.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .pcc_begin_return
    .return -42
    .pcc_end_return
.end
CODE
-42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mmdvtfind");
##PIR##
.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc comp
    comp = global "Float_cmp_Integer"
    mmdvtregister .MMD_NUMCMP, .Float, .Integer, comp
    $P0 = mmdvtfind .MMD_NUMCMP, .Float, .Integer
    isnull $P0, nok
    print "ok 1\n"
    ne_addr $P0, comp, nok
    print "ok 2\n"
    end
nok:
    print "not ok\n"
    end
.end

.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .pcc_begin_return
    .return -42
    .pcc_end_return
.end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mmdvtfind - invoke it");
##PIR##
.sub _main

.include "pmctypes.pasm"
.include "mmd.pasm"

    .local pmc comp
    comp = global "Float_cmp_Integer"
    mmdvtregister .MMD_NUMCMP, .Float, .Integer, comp
    $P0 = mmdvtfind .MMD_NUMCMP, .Float, .Integer
    isnull $P0, nok
    print "ok 1\n"
    ne_addr $P0, comp, nok
    print "ok 2\n"
    $P1 = new Float
    $P2 = new Integer
    $P1 = 47.11
    $P2 = 47
    $I0 = $P0($P1, $P2)
    print $I0
    print "\n"
    end
nok:
    print "not ok\n"
    end
.end
.sub Float_cmp_Integer
    .param pmc left
    .param pmc right
    .pcc_begin_return
    .return -42
    .pcc_end_return
.end
CODE
ok 1
ok 2
-42
OUTPUT
