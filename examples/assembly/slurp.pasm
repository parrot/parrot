# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/slurp.pasm - Read,concatenate and print

=head1 SYNOPSIS

    % ./parrot examples/assembly/slurp.pasm

=head1 DESCRIPTION

Reads from C<stdin> and concatenates to a buffer. When an empty line is
received the buffer is printed.

=cut

	getstdin P0
	set S1, ""
AGAIN:
	readline S0, P0
	length I1, S0
	le I1, 1, MAINLOOP
	concat S1, S0
	branch AGAIN

MAINLOOP:
	print S1
	end

