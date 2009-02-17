# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

examples/pasm/fact.pasm - Mmmm, beer good

=head1 SYNOPSIS

    % ./parrot examples/pasm/fact.pasm

=head1 DESCRIPTION

Compute the factorial recursively for 0! to 30! and print the results.

=head1 HISTORY

=over 4

=item 20020316 bdwheele@indiana.edu

Changed local labels to global for new assembler. Use C<pushi> instead
of the now missing C<clonei>.

=back

=cut

main:
	set 	I1,0
	## P9 is used as a stack for temporaries.
	new     P9, 'ResizableIntegerArray'
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

### P0 is the number to compute, and also the return value.
fact:
	lt	P0,2,is_one
	## save I2, because we're gonna trash it.
	push	P9,I2
	set	I2,P0
	dec	P0
	bsr	fact
	mul	P0,P0,I2
	pop     I2,P9
	ret
is_one:
	set	P0,1
	ret
