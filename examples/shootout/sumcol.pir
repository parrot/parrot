#!./parrot -j
#
# ./parrot -j sumcol.pir < sum8M
# by Joshua Isom

.sub main :main
	.local pmc stdin
	.local string line
	.local int count, tmp, linelen
	stdin = getstdin
beginwhile:
	line = readline stdin
	linelen = length line
	unless linelen goto endwhile
	tmp	= line
	count += tmp
	goto beginwhile
endwhile:
	print count
	print "\n"
.end

