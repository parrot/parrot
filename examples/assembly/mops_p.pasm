#
# test.pasm
#
# Copyright (C) 2001 The Parrot Team. All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#

        new    P1, .PerlInt
        new    P2, .PerlInt
        new    P3, .PerlInt
        new    P4, .PerlInt
        new    P5, .PerlInt

        set    P2, 0
        set    P3, 1
        set    P4, 100000000

        print  "Iterations:    "
        print  P4
        print  "\n"

        # Eeevil hack.
        add    P5, P5, P4
        add    P5, P5, P4

        print  "Estimated ops: "
        print  P5
        print  "\n"

        time   N1

REDO:   dec    P4
        if     P4, REDO

        print  "done\n"
DONE:   time   N5

        sub    N2, N5, N1

        print  "Elapsed time:  "
        print  N2
        print  "\n"

        set    N1, P5
        div    N1, N1, N2
        set    N2, 1000000.0
        div    N1, N1, N2

        print  "M op/s:        "
        print  N1
        print  "\n"

        end

