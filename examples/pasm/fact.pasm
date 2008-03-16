# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

examples/pasm/fact.pasm - Mmmm, beer good

=head1 SYNOPSIS

    % ./parrot examples/pasm/fact.pasm

=head1 DESCRIPTION

Compute the factorial recursively for 0! to 6! and print the results.

=head1 HISTORY

=over 4

=item 20020316 bdwheele@indiana.edu

Changed local labels to global for new assembler. Use C<pushi> instead
of the now missing C<clonei>.

=back

=cut

main:
	set 	I1,0

loop:
	print	"fact of "
	print	I1
	print	" is: "
    new P0, 'Integer'
	set	P0,I1
	bsr	fact
	print	P0
	print	"\n"
	inc	I1
	eq	I1,31,done
	branch	loop
done:
	end

# P0 is the number to compute
fact:
        saveall
	lt	P0,2,is_one
	set	I1,P0
	dec	P0
	bsr	fact
	mul	P0,P0,I1
	save	P0
	branch	fact_done
is_one:
	set	P0,1
	save	P0
fact_done:
	restoreall
	restore	P0
	ret
