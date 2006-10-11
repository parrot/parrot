#! perl
# Copyright (C) 2006 The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/stm/basic.t -- Single-threaded tests of the STM opcodes and PMC types.

=head1 SYNOPSIS

    % prove t/stm/basic.t

=head1 DESCRIPTION

Makes sure the STM opcodes and the STMVar and STMRef PMC types work as expected
in easy, single-threaded cases.

=cut

pasm_output_is(<<'CODE', <<'OUTPUT', "empty transactions");
        stm_depth I0
        ne I0, 0, test_fail
begin:  stm_start
        stm_depth I1
        ne I1, 1, test_fail
inner:  stm_start
        stm_depth I2
        ne I2, 2, test_fail
        stm_commit inner
        stm_depth I3
        ne I3, 1, test_fail
        stm_commit begin
        stm_depth I4
        ne I4, 0, test_fail

        print "okay\n"
        end

test_fail:
        print "not okay\n"

        end
CODE
okay
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "STMVar init'd containing NULL");
.sub main :main
    $P1 = new .STMVar
tx: stm_start
    $P0 = $P1."get_read"()
    if null $P0 goto okay2
    print "not ok 1\n"
okay1:
    $I0 = isa $P0, "STMVar"
    if $I0 goto okay2
    print "not ok 2\n"
okay2:
    stm_commit tx
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "STMRef init'd containing NULL");
.sub main :main
    $P1 = new .STMRef
tx: stm_start
    $I0 = defined $P1
    unless $I0 goto okay1
    print "not ok 1\n"
okay1:
    stm_commit tx
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "STMVar init'd containing an Integer");
.sub check
    .param string annotate
    .param pmc what
    .local string reason

    reason = "isa says not integer"
    $I0 = isa what, "Integer"
    if $I0 == 0 goto failed

    reason = "value is not 42"
    $I0 = what
    if $I0 != 42 goto failed
    goto done
failed:
    print "FAIL "
    print annotate
    print ": "
    print reason
    print "\n"
done:
.end

.sub main :main
    $P0 = new .Integer
    $P0 = 42
    $P1 = new .STMVar, $P0
tx: stm_start
    $P2 = $P1."get_read"()
    check("get_read", $P2)
    $P2 = $P1."get_update"()
    check("get_update", $P2)
    stm_commit tx
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "STMRef init'd containing an Integer");
.sub check
    .param string annotate
    .param pmc what
    .local string reason

    reason = "isa says not integer"
    $I0 = isa what, "Integer"
    if $I0 == 0 goto failed

    reason = "value is not 42"
    $I0 = what
    if $I0 != 42 goto failed
    goto done
failed:
    print "FAIL "
    print annotate
    print ": "
    print reason
    print "\n"
done:
.end

.sub main :main
    $P0 = new .Integer
    $P0 = 42
    $P1 = new .STMRef, $P0
tx: stm_start
    check("STMRef value", $P1)
    stm_commit tx
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "aborting acts as expected");
.sub main :main
    .local string reason
    $P0 = new .Integer
    $P0 = 42
    $P1 = new .STMRef, $P0
    stm_start
    $P1 = 45
    reason = "New value not visible in transaction"
    if $P1 != 45 goto test_fail_tx
    stm_abort
    stm_start
    reason = "New value still visible after abort"
    if $P1 != 42 goto test_fail_tx
    stm_abort
    print "ok\n"
    end
test_fail_tx:
    stm_abort
test_fail:
    print "not ok\n"
    print "reason = "
    print reason
    print "\n"
    print $P1
    print "\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "committed updates are seen afterwards");
.sub main :main
    .local string reason
    $P0 = new .Integer
    $P0 = 42
    $P1 = new .STMRef, $P0
tx_a:
    stm_start
    $P1 = 45
    reason = "New value not visible in transaction"
    if $P1 != 45 goto test_fail_tx
    stm_commit tx_a

    stm_start
    reason = "New value not visible after commit"
    if $P1 != 45 goto test_fail_tx
    $P1 = 46
    reason = "New value not visible in transaction (2)"
    stm_abort

tx_b:
    stm_start
    reason = "Committed value not visible after abort"
    if $P1 != 45 goto test_fail_tx
    $P1 = 44
    stm_commit tx_b

    stm_start
    reason = "Second committed value not visible"
    if $P1 != 44 goto test_fail_tx
    stm_abort

    print "ok\n"
    end

test_fail_tx:
    stm_abort
test_fail:
    print "not ok\n"
    print "reason = "
    print reason
    print "\n"
    stm_start
    print "$P1 = "
    print $P1
    print "\n"
    stm_abort
.end
CODE
ok
OUTPUT

# XXX is this test good enough?
pir_output_is(<<'CODE', <<'OUTPUT', "GC isn't too eager");
.sub main :main
    .local string reason
    $P0 = new .Integer
    $P0 = 0
    $P1 = new .STMRef, $P0
tx_a:
    stm_start
    sweep 1
    $P1 = 1
    stm_start
    sweep 1
    $P1 = 2
    stm_start
    sweep 1
    $P1 = 3
    stm_abort
    sweep 1
    $P1 = 4
    stm_abort
    sweep 1
    stm_commit tx_a
    sweep 1
    stm_start
    if $P1 == 1 goto okay
    print "not "
okay:
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Push limits (write and read records)");
.const int NUM_VALS = 400
.sub main :main
    .local pmc arr
    .local int i
    .local pmc sv
    arr = new FixedPMCArray
    arr = NUM_VALS

    i = 0
loop1:
    sv = new Integer
    sv = i
    sv = new STMVar, sv
    arr[i] = sv
    inc i
    if i < NUM_VALS goto loop1

tx_read:
    stm_start
    i = 0
loop_read:
    sv = arr[i]
    sv = sv.'get_read'()
    if sv == i goto okay_rd
    print "(read) not okay at "
    print i
    print "\n"
okay_rd:
    inc i
    if i < NUM_VALS goto loop_read
    stm_commit tx_read

tx_update:
    stm_start
    i = 0
loop_update:
    sv = arr[i]
    sv = sv.'get_update'()
    if sv == i goto okay_up
    print "(update) NOT OKAY AT "
    print i
    print "\n"
okay_up:
    inc i
    if i < NUM_VALS goto loop_update
    stm_commit tx_update

tx_write:
    stm_start
    i = 0
loop_write:
    sv = arr[i]
    .local pmc tmp
    tmp = new Integer
    tmp = -1
    sv.'set'(tmp)
    inc i
    if i < NUM_VALS goto loop_write
    stm_commit tx_write

tx_read_final:
    stm_start
    i = 0
loop_read_final:
    sv = arr[i]
    sv = sv.'get_read'()
    if sv == -1 goto okay_rf
    print "(read final) not okay at "
    print i
    print "\n"
okay_rf:
    inc i
    if i < NUM_VALS goto loop_read_final
    stm_commit tx_read_final
    print "done\n"
.end
CODE
done
OUTPUT
