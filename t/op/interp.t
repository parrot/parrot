#!perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 8;

=head1 NAME

t/op/interp.t - Running the Interpreter

=head1 SYNOPSIS

    % prove t/op/interp.t

=head1 DESCRIPTION

Tests the old and new styles of running the Parrot interpreter and the
C<interpinfo> opcode.

=cut

# we probably shouldn't just run a label, but this catches a potential seggie
pasm_output_is( <<'CODE', <<'OUTPUT', "runinterp - new style" );
    new P0, 'ParrotInterpreter'
    say 'calling'
    # set_addr/invoke ?
    runinterp P0, foo
    say 'ending'
    end
    say 'bad things!'
  foo:
    say 'In 2'
    end
CODE
calling
In 2
ending
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'runinterp - works with printing' );
.sub 'test' :main
    .local string actual
    .local pmc test_interp
               test_interp = new 'ParrotInterpreter'

    print "uno\n"
    runinterp test_interp, pasm
    print "dos\n"
    goto pasm_end

  pasm:
    noop
    end
  pasm_end:
.end
CODE
uno
dos
OUTPUT

# Need to disable GC while trace is on, as there's a non-zero chance that a
# GC sweep would occur, causing a bonus "GC mark" line in the output, which makes
# the test fail.
pasm_output_like(
    <<'CODE', <<'OUTPUT', "restart trace" );
    print "ok 1\n"
    sweepoff
    set I0, 1
    trace I0
    dec I0
    trace I0
    sweepon
    print "ok 2\n"
    end
CODE
/^ok\s1\n
(?:0+8.*)?\n
(?:0+a.*)?\n
ok\s2\n$/x
OUTPUT

pasm_output_is( <<'CODE', 'nada:', 'interp - warnings' );
    new P0, 'Undef'
    set I0, P0
    print "nada:"
    warningson 1
    new P1, 'Undef'
    set I0, P1
    end
CODE

pasm_output_is( <<'CODE', <<'OUTPUT', "getinterp" );
    .include "interpinfo.pasm"
    getinterp P0
    print "ok 1\n"
    set I0, P0[.INTERPINFO_ACTIVE_PMCS]
    interpinfo I1, .INTERPINFO_ACTIVE_PMCS
    eq I0, I1, ok2
    print "not "
  ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "access argv" );
    get_params "0", P5
    .include "iglobals.pasm"
    getinterp P1
    set P2, P1[.IGLOBALS_ARGV_LIST]
    set I0, P5
    set I1, P2
    eq I0, I1, ok1
    print "not "
  ok1:
    print "ok 1\n"
    set S0, P5[0]
    set S1, P2[0]
    eq S0, S1, ok2
    print "not "
  ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "check_events" );
    print "before\n"
    check_events
    print "after\n"
    end
CODE
before
after
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "interpinfo & getinterp: current runcore" );
.include 'interpinfo.pasm'
.include 'interpcores.pasm'

.sub 'test' :main
    $I0 = interpinfo .INTERPINFO_CURRENT_RUNCORE
    if $I0 == .PARROT_FUNCTION_CORE   goto ok1
    if $I0 == .PARROT_FAST_CORE       goto ok1
    if $I0 == .PARROT_EXEC_CORE       goto ok1
    if $I0 == .PARROT_GC_DEBUG_CORE   goto ok1
    print 'not '
  ok1:
    say 'ok 1'

    $P0 = getinterp
    $I1 = $P0[.INTERPINFO_CURRENT_RUNCORE]
    if $I0 == $I1 goto ok2
    print 'not '
  ok2:
    say 'ok 2'
.end
CODE
ok 1
ok 2
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
