# Slurp a file line by line, concat to S1 and
# at end, print the whole buffer.
	getstdin P0
	set S1, ""
AGAIN:
	readline S0, P0
	length I1, S0
	le I1, 0, MAINLOOP
	concat S1, S0
	branch AGAIN

MAINLOOP:
	print S1
	end

