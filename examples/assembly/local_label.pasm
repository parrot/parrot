#
# local_label.pasm
#
# Copyright (C) 2001 The Parrot Team. All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#

.macro MAIN ()
              print	"test 1\n"
	      branch	.$ok
.local $ng:   print	"ng 1\n"
	      branch	test2
.local $ok:   print	"ok 1\n"

.endm

.macro TEST2 ()
test2:
              print	"test 2\n"
	      branch	.$ok
.local $ng:   print	"ng 2\n"
	      branch	done
.local $ok:   print	"ok 2\n"

.endm

              .MAIN ()
              .TEST2 ()

done:	      end
	

