#
# fact.pasm
#
# Copyright (C) 2001 Yet Another Society. All rights reserved.
# This program is free software. It is subject to the same
# license as The Parrot Interpreter.
#
# $Id$
#
# compute the factorial recursively for 0 to 6 and print the results.
#

main:
	set 	I1,0

$loop:
	print	"fact of "
	print	I1
	print	" is: "
	set	I0,I1
	bsr	fact
	print	I0
	print	"\n"
	inc	I1,1
	eq	I1,7,$done
	branch	$loop
$done:
	end

# I0 is the number to compute
fact:
	clonei
	lt	I0,2,$is_one
	set	I1,I0
	dec	I0,1	
	bsr	fact
	mul	I0,I0,I1
	save	I0
	branch	$done
$is_one:
	set	I0,1
	save	I0
$done:
	popi
	restore	I0
	ret
