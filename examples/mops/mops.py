"""
# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/mops/mops.c - Calculate M ops/s

=head1 SYNOPSIS

    % python examples/mops/mops.py

=head1 DESCRIPTION

A Python implementation of the F<examples/mops/mops.pasm> example
program, for speed comparisons.

Calculates a value for M ops/s (million operations per second) using
integer arithmetic.

Prints out:

=over 4

=item * the number of look iterations, 

=item * the estimated number of ops performed,

=item * the elapsed time, and 

=item * the number of M op/s.

=back

=cut

"""

import sys
import time

I2 = 0                       # set    I2, 0
I3 = 1                       # set    I3, 1
I4 = 10000000                # set    I4, 10000000
                             #
print "Iterations:   ", I4   # print  "Iterations:    "
                             # print  I4
                             # print  "\n"
                             #
I1 = 2                       # set    I1, 2
I5 = I4 * I1                 # mul    I5, I4, I1
                             #
print "Estimated ops:", I5   # print  "Estimated ops: "
                             # print  I5
                             # print  "\n"
                             #
N1 = time.time()             # time N1
                             #
while I4:                    # REDO:
  I4 = I4 - I3               # sub    I4, I4, I3
                             # if     I4, REDO
                             #
                             # DONE:
N5 = time.time()             # time   N5
                             #
N2 = N5 - N1                 # sub    N2, N5, N1
                             #
print "Elapsed time: ", N2   # print  "Elapsed time:  "
                             # print  N2
                             # print  "\n"
                             #
N1 = I5                      # iton   N1, I5
N1 = N1 / N2                 # div    N1, N1, N2
N2 = 1000000.0               # set    N2, 1000000.0
N1 = N1 / N2                 # div    N1, N1, N2
                             #
print "M op/s:       ", N1   # print  "M op/s:        "
                             # print  N1
                             # print  "\n"
                             #
sys.exit(0)                  # end

"""

=head1 SEE ALSO

F<examples/assembly/mops.pasm>,
F<examples/mops/mops.c>,
F<examples/mops/mops.cs>,
F<examples/mops/mops.il>,
F<examples/mops/mops.p6>,
F<examples/mops/mops.pl>,
F<examples/mops/mops.ps>,
F<examples/mops/mops.rb>,
F<examples/mops/mops.scheme>.

=cut

"""