#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/op/gc-active-buffers.t - Test that buffers are freed as soon as possible

=head1 SYNOPSIS

    % prove t/op/gc-active-buffers.t

=head1 DESCRIPTION

Tests that unused buffers (strings) are freed in the first GC run. See
TT1603 - http://trac.parrot.org/parrot/ticket/1603

=cut

.include 'interpinfo.pasm'

.sub _main :main
    .include 'test_more.pir'

    plan(1)

    sweep 1
    $I0 = interpinfo .INTERPINFO_ACTIVE_BUFFERS

    .local int count
    count= 1000
  loop:
        unless count goto done

        # original test form TT1603
        $P0 = new 'StringBuilder'
        $P0.'append_format'("a\n")
        $S0 = $P0

        # another way to trigger the problem
        $S1 = "abc"
        $S2 = substr $S1, 0, 1

        dec count
    goto loop
  done:

    sweep 1
    $I1 = interpinfo .INTERPINFO_ACTIVE_BUFFERS

    $I2 = $I1 - $I0
    $S0 = $I2
    $S0 .= " additional active buffers (which should be <= 100)"
    $I3 = isle $I2, 100
    ok($I3, $S0)
 .end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
