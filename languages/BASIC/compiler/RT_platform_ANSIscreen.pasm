.const int BLACK =  0
.const int RED	=  1
.const int GREEN  = 2
.const int YELLOW = 3
.const int BLUE   = 4
.const int MAGENTA= 5
.const int CYAN   = 6
.const int WHITE  = 7
.sub _ansi_setup
	saveall
	$P0=new PerlArray
	set $P0[0], BLACK
	set $P0[1], BLUE
	set $P0[2], GREEN
	set $P0[3], CYAN
	set $P0[4], RED
	set $P0[5], MAGENTA
	set $P0[6], YELLOW
	set $P0[7], WHITE
	store_global "ANSI_fgcolors", $P0

	$P0=new PerlArray
	set $P0[0], BLACK
	set $P0[1], BLUE
	set $P0[2], GREEN
	set $P0[3], CYAN
	set $P0[4], RED
	set $P0[5], MAGENTA
	set $P0[6], YELLOW
	set $P0[7], WHITE
	set $P0[8], BLACK
	set $P0[9], BLUE
	set $P0[10], GREEN
	set $P0[11], CYAN
	set $P0[12], RED
	set $P0[13], MAGENTA
	set $P0[14], YELLOW
	set $P0[15], 8
	store_global "ANSI_bgcolors", $P0
	restoreall
	ret
.end
.sub _ansi_screen_clear
	print "\e[2J"
	print "\e[H"
	ret
.end
.sub _ANSI_SCREEN_LOCATE	# void ansi_screen_locate (int x, int y)
	saveall
	.param int x
	.param int y
	print "\e["
	print x
	print ";"
	print y
	print "H"
	restoreall
	ret
.end
## These don't work exactly right.  ANSI would require that I send
## \e[6n and read the input stream for a \e[row;colR reply from the 
## terminal.  I *really* can't do that until IO is fixed, because STDIN
## is line-buffered and asking the user to press return after each cursor
## positioning is lame.
#ANSI_SCREEN_SETXCUR:
#	print "\e[;"
#	print I1
#	print "H"
#	ret
#
#ANSI_SCREEN_SETYCUR:
#	print "\e["
#	print I1
#	print ";H"
#	ret
#
#	# I0,I1
#	# QB origin is 1,1

## QB.exe
##     0 = black       4 = red           8 = grey             12 = light red
##     1 = blue        5 = magenta       9 = light blue       13 = light magenta
##     2 = green       6 = brown        10 = light green      14 = yellow
##     3 = cyan        7 = white        11 = light cyan       15 = bright white
#
.sub _ANSI_SCREEN_COLOR		#  void ansi_screen_color(int fg, int bg)
	saveall
	.param int fore
	.param int back
	print "\e"
#	# foreground in I0
#	# background in I1
	print "[0;"
	find_global $P0, "ANSI_fgcolors"
	lt fore, 8, ANSI_FG
	sub fore, fore, 8
	print "1;"	# Turn on high intensity
ANSI_FG: set $I3, $P0[fore]
	print "3"
	print $I3
	print ";"
	
	# Background
ANSI_BG:find_global $P0, "ANSI_bgcolors"
	set $I3, $P0[back]
	print "4"
	print $I3
	print "m"
	restoreall
	ret
.end
.sub _POSIX_INKEY
	saveall
	loadlib P1, ""
	dlfunc P0, P1, "system", "it"
	set I0, 1
	set S5, "stty cbreak -echo"
	invoke

	dlfunc P0, P1, "fcntl", "iiii"
	set I0, 1
	set I5, 0	# Stdin
	set I6, 3	# F_GETFL
	invoke

	set I9, I5	# Old values
	bor I7, I5, 2048  # O_NONBLOCK 04000
	set I5, 0	# Stdin
	set I6, 4	# F_SETFL
	invoke

	read S0, 1

	set I7, I9
	set I5, 0
	set I6, 4
	invoke

	loadlib P1, ""
	dlfunc P0, P1, "system", "it"
	set I0, 1
	set S5, "stty -cbreak echo"
	invoke

	.return S0
	restoreall
	ret
.end
