	set I0, 200
	set I2, 500
	set S0,  ""
	time N5
	set I1, 0

mainloop:

loopup:
	pushs
	concat S1, S0, S0
	concat S2, S0, S0
	concat S3, S0, S0
	concat S4, S0, S0
	concat S5, S0, S0
	concat S6, S0, S0
	concat S7, S0, S0
	concat S8, S0, S0

	inc I1
	lt I1, I0, loopup

loopdown:
	pops
	dec I1
	gt I1, 0, loopdown

	inc I3
	lt I3, I2, mainloop


getout:	time N6

	sub N7, N6, N5
	print N7
 	print " seconds.\n"

	interpinfo I1, 1
	print "A total of "
	print I1
	print " bytes were allocated\n"

	interpinfo I1, 2
	print "A total of "
	print I1
	print " DOD runs were made\n"

	interpinfo I1, 3
	print "A total of "
	print I1
	print " collection runs were made\n"

	interpinfo I1, 10
	print "Copying a total of "
	print I1
	print " bytes\n"

	interpinfo I1, 5
	print "There are "
	print I1
	print " active Buffer structs\n"

	interpinfo I1, 7
	print "There are "
	print I1
	print " total Buffer structs\n"

	end
