#!/usr/bin/perl
#
# mops.pl
#
# A Perl implementation of the mops.pasm example program,
# for speed comparisons.
#
# Copyright (C) 2001 The Parrot Team. All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#

sub time_hires { time() }

$I2 = 0;                      # set    I2, 0
$I3 = 1;                      # set    I3, 1
$I4 = 100000000;              # set    I4, 100000000
                              #
print "Iterations:    $I4\n"; # print  "Iterations:    "
                              # print  I4
                              # print  "\n"
                              #
$I1 = 2;                      # set    I1, 2
$I5 = $I4 * $I1;              # mul    I5, I4, I1
                              #
print "Estimated ops: $I5\n"; # print  "Estimated ops: "
                              # print  I5
                              # print  "\n"
                              #
$N1 = time_hires();           # time N1
                              #
REDO:                         # REDO:
$I4 = $I4 - $I3;              # sub    I4, I4, I3
goto REDO if $I4;             # if     I4, REDO
                              #
DONE:                         # DONE:
$N5 = time_hires();           # time   N5
                              #
$N2 = $N5 - $N1;              # sub    N2, N5, N1
                              #
print "Elapsed time:  $N2\n"; # print  "Elapsed time:  "
                              # print  N2
                              # print  "\n"
                              #
$N1 = $I5;                    # iton   N1, I5
$N1 = $N1 / $N2;              # div    N1, N1, N2
$N2 = 1000000.0;              # set    N2, 1000000.0
$N1 = $N1 / $N2;              # div    N1, N1, N2
                              #
print "M op/s:        $N1\n"; # print  "M op/s:        "
                              # print  N1
                              # print  "\n"
                              #
exit(0);                      # end

