#
# bsr.pasm
#
# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#

MAIN:	print "Main\n"
	bsr TESTSUB 
	print "Main: Return from TestSub\n"
END:	end


TESTSUB:
	print "TestSub\n"
	bsr NESTSUB	
	print "TestSub: Ret from NestSub\n"
	ret

NESTSUB:
	print "NestSub\n"
	ret

