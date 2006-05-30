# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=head1 NAME

examples/subs/bsr_ret.pasm - Branch to location

=head1 SYNOPSIS

    % ./parrot examples/subs/bsr_ret.pasm

=head1 DESCRIPTION

Shows branching and returning to a location saved on the call stack.

=head1 SEE ALSO

F<docs/ops/core.pod>
F<docs/pdds/pdd03_calling_conventions.pod>

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

