# Simple cat util to test PIO read/write
# This does not use STDIO
REDO:
	read S0, 256 
	puts S0
	branch REDO
	end
