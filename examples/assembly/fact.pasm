#
# fact.pasm
#
# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#
# compute the factorial recursively for 0 to 6 and print the results.
#
# 20020316 bdwheele@indiana.edu 
#   changed local labels to global for new assembler
#   use pushi instead of the now missing 'clonei'

main:
	set 	I1,0

loop:
	print	"fact of "
	print	I1
	print	" is: "
	set	I0,I1
	bsr	fact
	print	I0
	print	"\n"
	inc	I1
	eq	I1,7,done
	branch	loop
done:
	end

# I0 is the number to compute
fact:
	pushi
	lt	I0,2,is_one
	set	I1,I0
	dec	I0
	bsr	fact
	mul	I0,I0,I1
	save	I0
	branch	fact_done
is_one:
	set	I0,1
	save	I0
fact_done:
	popi
	restore	I0
	ret
