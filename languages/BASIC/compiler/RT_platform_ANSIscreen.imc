.const int BLACK =  0
.const int RED	 =  1
.const int GREEN  = 2
.const int YELLOW = 3
.const int BLUE   = 4
.const int MAGENTA= 5
.const int CYAN   = 6
.const int WHITE  = 7

.const int TCGETA  = 0x5405
.const int TCSETAF = 0x5408

.const int ICANON = 2
.const int IECHO  = 8

.const int F_GETFL = 3
.const int F_SETFL = 4

.const int STDIN = 0

.sub _ansi_setup
	$P0=new .PerlArray
	$P0[0]= BLACK
	$P0[1]= BLUE
	$P0[2]= GREEN
	$P0[3]= CYAN
	$P0[4]= RED
	$P0[5]= MAGENTA
	$P0[6]= YELLOW
	$P0[7]= WHITE
	store_global "ANSI_fgcolors", $P0

	$P0=new .PerlArray
	$P0[0]= BLACK
	$P0[1]= BLUE
	$P0[2]= GREEN
	$P0[3]= CYAN
	$P0[4]= RED
	$P0[5]= MAGENTA
	$P0[6]= YELLOW
	$P0[7]= WHITE
	$P0[8]= BLACK
	$P0[9]= BLUE
	$P0[10]= GREEN
	$P0[11]= CYAN
	$P0[12]= RED
	$P0[13]= MAGENTA
	$P0[14]= YELLOW
	$P0[15]= 8
	store_global "ANSI_bgcolors", $P0

	$P0=new .PerlHash
	$P0["value"]=0
	store_global "scankey", $P0
.end

.sub _ansi_screen_clear
	print "\e[2J"
	print "\e[H"
.end

.sub _ansi_shutdown
	_TERMIO_normal()
.end

.sub _ANSI_SCREEN_LOCATE	# void ansi_screen_locate (int x, int y)
	.param int x
	.param int y
	print "\e["
	print x
	print ";"
	print y
	print "H"
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
ANSI_FG: 
	$I3 = $P0[fore]
	print "3"
	print $I3
	print ";"
	
	# Background
ANSI_BG:
	$P0 = find_global "ANSI_bgcolors"
	$I3 = $P0[back]
	print "4"
	print $I3
	print "m"
.end

.sub _set_noecho_cbreak

	$P1 = loadlib ""
        .local pmc ioctl
	ioctl = dlfunc $P1, "ioctl", "iiip"

	$P9 = new .ManagedStruct    # Saved
	$P9 = 20

	$P10 = new .ManagedStruct   # New
	$P10 = 20

        ioctl(0, TCGETA, $P9)

        ioctl(0, TCGETA, $P10)

	$I0 = _get_little_endian($P10,6,2)

	$I1 = ICANON
	$I1 = bnot $I1
	$I0 = band $I0, $I1 # settty.c_lflag &= ~ICANON;

	$I1 = IECHO
	$I1 = bnot $I1
	$I0 = band $I0, $I1	# settty.c_lflag &= ~ECHO;

	_set_little_endian($P10,6,2,$I0)

	ioctl(0, TCSETAF, $P10)

	store_global "ioctl_mode", $P9
.end

.sub _set_echo_nocbreak
	$P1 = loadlib ""
	.local pmc ioctl
	ioctl = dlfunc $P1, "ioctl", "iiip"
	$P9 = find_global "ioctl_mode"

	ioctl(0, TCSETAF, $P9)
.end

.sub _set_nonblock	# void _set_nonblock
	I11= 0
	$P1 = loadlib ""
	.local pmc fcntl
	fcntl = dlfunc $P1, "fcntl", "iiii"

	.local int old_value
	old_value = fcntl(STDIN, F_GETFL)

	fcntl = dlfunc $P1, "fcntl", "iiil"

	$I7 = bor I5, 2048  # O_NONBLOCK 04000
	#invoke		# nmode=fcntl(0, F_SETFL, mode | O_NONBLOCK)
	fcntl(STDIN, F_SETFL, $I7)

	$P0=new .PerlHash
	$P0["value"]= old_value
	store_global "fcntl_mode", $P0
.end

.sub _unset_nonblock	# void _unset_nonblock
	$P0 = find_global "fcntl_mode"
	$I11= $P0["value"]
	$P1 = loadlib ""
	.local pmc fcntl
	fcntl = dlfunc $P1, "fcntl", "iiil"

	fcntl(0, F_SETFL, $I11)
.end

.sub _TERMIO_scankey
	find_global $P0, "scankey"
	I0= $P0["value"]
	eq I0, 1, END
	_set_noecho_cbreak()
END:    
	$P0["value"]= 1
	store_global "scankey", $P0
.end

.sub _TERMIO_normal
	find_global $P0, "scankey"
	I0= $P0["value"]
	eq I0, 0, END
	_set_echo_nocbreak()
END:    
	$P0["value"]= 0
	store_global "scankey", $P0
.end

# For now, uses TERMIO calls directly and assumes you're on a
# LITTLE ENDIAN machine.
.sub _TERMIO_INKEY
	read $S0, 1
	.return($S0)
.end

