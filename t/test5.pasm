#
# test5.pasm
#
# Copyright (C) 2001 Yet Another Society. All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#

	print "Start\n"
	bsr  FOO
	print "End\n"
	end
FOO:
	print "Middle\n"
	ret
