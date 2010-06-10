# This line will be printed by ./parrot examples/pir/readline.t

# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 NAME

examples/pir/readline.pir - Read,concatenate and print

=head1 SYNOPSIS

    % ./parrot examples/pir/readline.pir

=head1 DESCRIPTION

Reads from C<stdin> and concatenates to a buffer. When an empty line is
received the buffer is printed and the program is terminated.

=cut

.include 'cclass.pasm'
.loadlib 'io_ops'

.sub "example" :main
        .local pmc stdin
        .local string buffer, line

	stdin = getstdin
	buffer = ""

AGAIN:
	line = readline stdin
	$I1 = length line
	if $I1 <= 1 goto MAINLOOP
	# test for multi-char newlines
	if $I1 >=3 goto CONCAT
	$I2 = is_cclass .CCLASS_NEWLINE, line, 0
	if $I2, MAINLOOP

CONCAT:
	concat buffer, line
	branch AGAIN

MAINLOOP:
	print buffer
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
