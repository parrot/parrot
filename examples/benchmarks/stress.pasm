# stress.pasm
#
# Do some GC stress-testing
#

# Our master loop, 10000 times

	set I0, 10
	new P0, .PerlArray

ol:	bsr buildarray
	set P0[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol

	set I0, 20
	new P2, .PerlArray

ol1:	bsr buildarray
	set P2[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol1

	set I0, 20
	new P3, .PerlArray

ol2:	bsr buildarray
	set P3[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol2

	interpinfo I1, 2
	print "A total of "
	print I1
	print " DOD runs were made\n"

	end


	# Our inner loop, 10000 times
buildarray:
	set I1, 10000
	new P1, .PerlArray
loop1:	new P9, .PerlInt
	set P9, I1
	set P1[I1], P9
	dec I1
	if I1, loop1
	ret
