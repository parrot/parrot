	set I0, 2000
	set I1, 0
	set I2, 2000
	set I3, 0
	set S0,  ""
	time N5
doubleloop:

loop:
	concat S1, S0, S0
	inc I1
	lt I1, I0, loop

	inc I3
	set I1, 0
	lt I3, I2, doubleloop


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
