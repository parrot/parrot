#
# test.pasm
#
# Copyright (C) 2001 The Parrot Team. All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#

        set    I2, 0
        set    I3, 1
        set    I4, 100000000

        print  "Iterations:    "
        print  I4
        print  "\n"

        set    I1, 3
        mul    I5, I4, I1

        print  "Estimated ops: "
        print  I5
        print  "\n"

        time   N1

REDO:   eq     I2, I4, DONE
        add    I2, I2, I3
        branch REDO

DONE:   time   N5

        sub    N2, N5, N1

        print  "Elapsed time:  "
        print  N2
        print  "\n"

        iton   N1, I5
        div    N1, N1, N2
        set    N2, 1000000.0
        div    N1, N1, N2

        print  "M op/s:        "
        print  N1
        print  "\n"

        end

