# stress3.pasm
#
# Do some GC stress-testing
#

# first loop, 100 times use 1.000.000 PMCs
#
# with a program arg of 1 these are destroyed before the 2. loop

	set I10, P5
	lt I10, 2, noarg
	set I11, P5[1]
noarg:
	set I0, 100
	new P0, .PerlArray

ol:	bsr buildarray
	set P0[I0], P1
	dec I0
	if I0, ol

# now check reusage, destroy them depending on I11
	unless I11, no_dest
	new P0, .PerlUndef
no_dest:
	set I0, 5000000
	new P3, .PerlArray
l2:
	new P1, .PerlInt
	set P3[0], P1
	dec I0
	if I0, l2

	interpinfo I1, 2
	print "A total of "
	print I1
	print " DOD runs were made\n"
	interpinfo I1, 4
	print I1
	print " active PMCs\n"
	interpinfo I1, 6
	print I1
	print " total  PMCs\n"

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
