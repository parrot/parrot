#
# test.pasm
#
# Copyright (C) 2001 The Parrot Team. All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#

        set I2, 0
        set I3, 1
        set I4, 100000000
	set S0, "\nIterations: "
	print S0
	print I4
        time I1
REDO:   eq I2, I4, DONE
        add I2, I2, I3
        branch REDO
DONE:   time I5
	set S0, "\nStart time: "
	print S0
        print I1
	set S0, "\nEnd time: "
	print S0
        print I5

	set S0, "\nCount: "
	print S0
        print I2

	set S0, "\nElapsed time:"
	print S0
        sub I2, I5, I1
        print I2

        set I1, 3
        mul I4, I4, I1
        iton N1, I4
        iton N2, I2
	set S0, "\nEstimated ops:"
	print S0
        print I4

	set S0, "\nEstimated ops (numerically):"
	print S0
        print N1

	set S0, "\nElapsed time:"
	print S0
        print I2

	set S0, "\nElapsed time:"
	print S0
        print N2

        div N1, N1, N2
	set S0, "\nOps/sec:"
	print S0
        print N1

	set S0, "\n"
	print S0

        end

