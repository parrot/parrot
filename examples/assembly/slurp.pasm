# Slurp a file line by line, concat to S1 and
# at end, print the whole buffer.
	set S1, ""
AGAIN:
	read S0, 256
	length I1, S0
	le I1, 0, MAINLOOP
	concat S1, S0
	branch AGAIN

MAINLOOP:
	puts S1
	end

