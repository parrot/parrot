# Simple cat util to test PIO read/write
# This does not use STDIO
	getstdin P0
	getstdout P1
REDO:
	readline S0, P0
	print S0
	if S0, REDO
	end
