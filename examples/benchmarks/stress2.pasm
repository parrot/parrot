# stress.pasm
#
# Do some GC stress-testing
#

# Our master loop, 10000 times

      	set I3, 20
ol:	set I0, 10
	new P0, .PerlArray

ol1:	bsr buildarray
	set P0[I0], P1
	dec I0
	if I0, ol1

	dec I3
	if I3, ol


	end


	# Our inner loop, 10000 times
buildarray:
	set I1, 10000
	new P1, .PerlArray
loop1:	new P2, .PerlInt
	set P2, I1
	set P1[I1], P2
	dec I1
	if I1, loop1
	ret
