# Simple open/seek/write/close test.
#
	#open P0, "/tmp/seektest.dat", ">"
	open P0, "seektest.dat", ">"
	seek P0, 300, 0
	# 64bit version of seek with high 32bits = 0
	#seek IO, P0, 0, 400, 0
	print P0, "test1\n"
	print P0, "test2\n"
	print P0, "test3\n"
	seek P0, 0, 0
	print P0, "test4\n"
	print P0, "test5\n"
	close P0
	end
