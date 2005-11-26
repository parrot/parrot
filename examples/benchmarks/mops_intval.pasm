# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/mops_intval.pasm - Calculate a benchmark

=head1 SYNOPSIS

    % ./parrot examples/benchmarks/mops_intval.pasm

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

F<examples/assembly/mops_p.pasm>,
F<examples/mops/mops.c>,
F<examples/mops/mops.cs>,
F<examples/mops/mops.il>,
F<examples/mops/mops.p6>,
F<examples/mops/mops.pl>,
F<examples/mops/mops.ps>,
F<examples/mops/mops.py>,
F<examples/mops/mops.rb>,
F<examples/mops/mops.scheme>.

=cut

