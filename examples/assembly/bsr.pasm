# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/bsr.pasm - Branch to location

=head1 SYNOPSIS

    % ./parrot examples/assembly/bsr.pasm

=head1 DESCRIPTION

Shows branching and returning to a location saved on the call stack.

=cut

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

