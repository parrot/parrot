# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

examples/pasm/fact.pasm - Recursive Factorial in PASM

=head1 SYNOPSIS

    % ./parrot examples/pasm/fact.pasm

=head1 DESCRIPTION

Compute the factorial recursively for 0! to 30! and print the results.

=cut

.pcc_sub :main main:
    new P10, 'ResizableIntegerArray'
	set 	I1,0
	## P9 is used as a stack for temporaries.
	new	P9, 'ResizableIntegerArray'
loop:
	print	"fact of "
	print	I1
	print	" is: "
	new P0, 'Integer'
	set	P0,I1
	local_branch P10, fact
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
	local_branch P10, fact
	mul	P0,P0,I2
	pop	I2,P9
	local_return P10
is_one:
	set	P0,1
	local_return P10

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
