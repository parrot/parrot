# Simple open/seek/write/close test.
# 
	open P0, "/tmp/seektest.dat", ">"
	#open P0, "C:\\seektest.dat", ">"
	seek I0, P0, 300, 0
	# 64bit version of seek with high 32bits = 0
	#seek IO, P0, 0, 400, 0
	print P0, "test\n"
	close P0
	end
