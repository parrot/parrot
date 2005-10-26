# This line will be printed by ./parrot examples/pir/readline.t

# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pir/readline.pir - Read,concatenate and print

=head1 SYNOPSIS

    % ./parrot examples/pir/readline.pir

=head1 DESCRIPTION

Reads from C<stdin> and concatenates to a buffer. When an empty line is
received the buffer is printed and the program is terminated.

=cut

.sub "example" :main
        .local pmc stdin
        .local string buffer, line

	stdin = getstdin
	buffer = ""

AGAIN:
	line = readline stdin
	I1 = length line
	if I1 <= 1 goto MAINLOOP
	concat buffer, line
	branch AGAIN

MAINLOOP:
	print buffer
.end
