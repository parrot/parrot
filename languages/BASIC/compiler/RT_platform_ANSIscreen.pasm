	# ANSIScreen Specific routines
	# P24 is ours to use, but I don't really know why we'd need it.
.constant BLACK   0
.constant RED	  1
.constant GREEN   2
.constant YELLOW  3
.constant BLUE    4
.constant MAGENTA 5
.constant CYAN    6
.constant WHITE   7
ANSI_SETUP:  
	new P24, .PerlHash
	new P0, .PerlArray
	set P0[0], .BLACK
	set P0[1], .BLUE
	set P0[2], .GREEN
	set P0[3], .CYAN
	set P0[4], .RED
	set P0[5], .MAGENTA
	set P0[6], .YELLOW
	set P0[7], .WHITE
	set P24["fgcolors"], P0
	new P0, .PerlArray
	set P0[0], .BLACK
	set P0[1], .BLUE
	set P0[2], .GREEN
	set P0[3], .CYAN
	set P0[4], .RED
	set P0[5], .MAGENTA
	set P0[6], .YELLOW
	set P0[7], .WHITE
	set P0[8], .BLACK
	set P0[9], .BLUE
	set P0[10], .GREEN
	set P0[11], .CYAN
	set P0[12], .RED
	set P0[13], .MAGENTA
	set P0[14], .YELLOW
	set P0[15], 8
	set P24["bgcolors"], P0
	ret

ANSI_SCREEN_CLEAR:
	print "\e[2J"
	print "\e[H"
	ret

# These don't work exactly right.  ANSI would require that I send
# \e[6n and read the input stream for a \e[row;colR reply from the 
# terminal.  I *really* can't do that until IO is fixed, because STDIN
# is line-buffered and asking the user to press return after each cursor
# positioning is lame.
ANSI_SCREEN_SETXCUR:
	print "\e[;"
	print I1
	print "H"
	ret

ANSI_SCREEN_SETYCUR:
	print "\e["
	print I1
	print ";H"
	ret

	# I0,I1
	# QB origin is 1,1
ANSI_SCREEN_LOCATE:
	print "\e["
	print I0
	print ";"
	print I1
	print "H"
	ret

# QB.exe
#     0 = black       4 = red           8 = grey             12 = light red
#     1 = blue        5 = magenta       9 = light blue       13 = light magenta
#     2 = green       6 = brown        10 = light green      14 = yellow
#     3 = cyan        7 = white        11 = light cyan       15 = bright white

ANSI_SCREEN_COLOR:
	#print "\e[m"
	#print I0
	#print " "
	#print I1
	#print " "
	#bsr ANSI_SCREEN_COLOR2
	print "\e"
	bsr ANSI_SCREEN_COLOR2
	ret
	

	# foreground in I0
	# background in I1
ANSI_SCREEN_COLOR2:
	print "[0;"
	set P0, P24["fgcolors"]
	lt I0, 8, ANSI_FG
	sub I0, I0, 8
	print "1;"	# Turn on high intensity
ANSI_FG: set I3, P0[I0]
	print "3"
	print I3
	print ";"
	
	# Background
ANSI_BG:set P0, P24["bgcolors"]
	set I3, P0[I1]
	print "4"
	print I3
	print "m"
	ret
	
