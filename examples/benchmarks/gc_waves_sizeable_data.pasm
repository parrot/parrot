	set I0, 11
	set I2, 200
	set S0,  "                         "
	set S1, S0
	set S2, S0
	set S3, S0
	set S4, S0
	set S5, S0
	set S6, S0
	set S7, S0
	set S8, S0
	time N5
	set I1, 0

mainloop:

loopup:
	concat S1, S8, S8
	concat S2, S8, S8
	concat S3, S8, S8
	concat S4, S8, S8
	concat S5, S8, S8
	concat S6, S8, S8
	concat S7, S8, S8
	concat S8, S8, S8

	inc I1
	lt I1, I0, loopup

loopdown:
        length I15, S1
        div I15, I15, 2
	substr S1, S1, 0, I15
	substr S2, S2, 0, I15
	substr S3, S3, 0, I15
	substr S4, S4, 0, I15
	substr S5, S5, 0, I15
	substr S6, S6, 0, I15
	substr S7, S7, 0, I15
	substr S8, S8, 0, I15

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
