# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/mops.pasm - Calculate a benchmark

=head1 SYNOPSIS

    % ./parrot examples/assembly/mops.pasm

=head1 DESCRIPTION

Calculates a value for M ops/s (million operations per second) using
integer arithmetic.

=cut

        set    I2, 0
        set    I3, 1
        set    I4, 100000000

        print  "Iterations:    "
        print  I4
        print  "\n"

        set    I1, 2
        mul    I5, I4, I1

        print  "Estimated ops: "
        print  I5
        print  "\n"

        time   N1

REDO:   sub    I4, I4, I3
        if     I4, REDO

DONE:   time   N5

        sub    N2, N5, N1

        print  "Elapsed time:  "
        print  N2
        print  "\n"

        if     I4, BUG

        set    N1, I5
        div    N1, N1, N2
        set    N2, 1000000.0
        div    N1, N1, N2

        print  "M op/s:        "
        print  N1
        print  "\n"

        end

BUG:    print "This can't happen\n"
        end

=head1 SEE ALSO

F<examples/assembly/mops_p.pasm>.

=cut

