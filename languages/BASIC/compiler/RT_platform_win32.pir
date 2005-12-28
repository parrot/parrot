=for fixing

I can't test this on windows, and it's currently broken. Please fix it.

.const int SIZEOF_CONSOLE_SCREEN_BUFFER_INFO = 22
.const int SIZEOF_DWORD = 4
.sub _win32_setup			# void win32_setup(void)
	loadlib P1, "kernel32.dll"
	dlfunc P0, P1, "GetStdHandle", "pi"
	set I0, 1
	set I5, -11
	invoke
	store_global "kernel32", P1
	store_global "Win32handle", P5
	set I0, 1
	set I5, -10
	invoke
	store_global "Win32Inputhandle", P5
	$P0= new .PerlHash
	store_global "Win32console", $P0
	_WIN32_CONSOLE_INFO()
.end
.sub _win32_shutdown			# void win32_shutdown(void)
.end
.sub _WIN32_CONSOLE_INFO		# void WIN32_CONSOLE_INFO(void)
	find_global P1, "kernel32"
	dlfunc P0, P1, "GetConsoleScreenBufferInfo", "ipp"
	find_global P5, "Win32handle"
	P6=new .ManagedStruct
	set P6, SIZEOF_CONSOLE_SCREEN_BUFFER_INFO
	set I0, 1
	invoke
	set P5, P6
	find_global P0, "Win32console"

	$I1 = _UMS_GET_SHORT(0,P5) # 0==dwSize.X
	set P0["xbuf"], $I1

	$I1 = _UMS_GET_SHORT(2,P5) # 0==dwSize.X
	set P0["ybuf"], $I1

	$I1 = _UMS_GET_SHORT(4,P5)
	inc $I1
	set P0["curx"], $I1

	$I1 = _UMS_GET_SHORT(4,P5)
	inc $I1
	set P0["cury"], $I1

	set $I1, P5[8]
	set P0["attr"], $I1	# wAttributes
.end
.sub _UMS_GET_SHORT		# int value ums_get_short(int offset, ManagedStruct buf)
	.param int offset
	.param ManagedStruct buf
	set $I2, buf[offset]
	inc offset
	set $I3, buf[offset]
	shl $I3, $I3, 8
	add $I3, $I3, $I2
	.return($I3)
.end
.sub _win32_screen_clear	# void _WIN32_SCREEN_CLEAR(void)
	_WIN32_CONSOLE_CLEAR()
	_WIN32_CONSOLE_HOME()
.end
.sub _WIN32_CONSOLE_HOME	# void Win32_console_home(void)
	find_global P2, "kernel32"
	dlfunc P0, P2, "SetConsoleCursorPosition", "ipi"
	set I0, 1
	find_global P5, "Win32handle"
	set I5, 0
	invoke
.end

.sub _WIN32_CONSOLE_CLEAR	# void Win32_console_clear(void)
	find_global P1, "Win32console"
	find_global P2, "kernel32"
	dlfunc P0, P2, "FillConsoleOutputCharacterA", "ipcilp"
	set I0, 1
	find_global P5, "Win32handle"
	P6=new .ManagedStruct
	set P6, SIZEOF_DWORD
	set I5, 32			# Char (space)
	set I1, P1["xbuf"]
	set I2, P1["ybuf"]
	mul I6, I1, I2			# Length
	set I7, 0			# Coords
	invoke
	# Now, re-fill screen with whatever attribute is currently
	# in effect.
	dlfunc P0, P2, "FillConsoleOutputAttribute", "ipiilp"
	set I0, 1
	find_global P5, "Win32handle"
	P6= new .ManagedStruct
	set P6, SIZEOF_DWORD
	set I5, P1["attr"]		# Attrib
	set I1, P1["xbuf"]
	set I2, P1["ybuf"]
	mul I6, I1, I2			# Length
	set I7, 0			# Coords
	invoke
.end
.sub _WIN32_SCREEN_FINDPOS		# void Win32_screen_findpos(void)
	_WIN32_CONSOLE_INFO()
.end
.sub _WIN32_SCREEN_GETXCUR		# int win32_screen_getxcur(void)
	find_global P1, "Win32console"
	set $I0, P1["curx"]
	.return($I0)
.end
.sub _WIN32_SCREEN_GETYCUR		# int win32_screen_getycur(void)
	find_global P1, "Win32console"
	set $I0, P1["cury"]
	.return($I0)
.end
.sub _WIN32_SCREEN_SETXCUR	# void win32_screen_setxcur(int x)
	.param int x
	.local int y
	_WIN32_SCREEN_FINDPOS()
	y = _WIN32_SCREEN_GETYCUR()
	_WIN32_SCREEN_LOCATE(x,y)
.end
.sub _WIN32_SCREEN_SETYCUR	# void win32_screen_setycur(int y)
	.param int y
	.local int x
	_WIN32_SCREEN_FINDPOS()
	x = _WIN32_SCREEN_GETXCUR()
	_WIN32_SCREEN_LOCATE(x,y)
.end
.sub _WIN32_SCREEN_LOCATE	# void win32_screen_locate(int x, int y)
	.param int x
	.param int y
	dec x
	dec y
	set I5, x
	shl I5, I5, 16
	add I5, I5, y
	find_global P1, "Win32console"
	find_global P2, "kernel32"
	dlfunc P0, P2, "SetConsoleCursorPosition", "ipi"
	set I0, 1
	find_global P5, "Win32handle"
	invoke
.end

#SCREEN Mode 0 Syntax:  COLOR [foreground][,[background][,border]]
#   ¦ foreground is the text color (range = 0-31, with 16-31 blinking)
#   ¦ background is the screen color (range = 0-7)
#   ¦ border is the color surrounding the screen (range = 0-15)
#     0 = black       4 = red           8 = grey             12 = light red
#     1 = blue        5 = magenta       9 = light blue       13 = light magenta
#     2 = green       6 = brown        10 = light green      14 = yellow
#     3 = cyan        7 = white        11 = light cyan       15 = bright white
.const int  FOREGROUND_BLUE  =      1
.const int  FOREGROUND_GREEN  =     2
.const int  FOREGROUND_RED	=  4
.const int  FOREGROUND_INTENSITY =  8
.const int  BACKGROUND_BLUE	= 16
.const int  BACKGROUND_GREEN	= 32
.const int  BACKGROUND_RED	= 64
.const int  BACKGROUND_INTENSITY = 128
#WIN32_SCREEN_GETFORE:
#	set P1, P24["console"]
#	set I0, P1["attr"]
#	band I0, I0, 15
#	ret
#WIN32_SCREEN_GETBACK:
#	set P1, P24["console"]
#	set I0, P1["attr"]
#	shr I0, I0, 4
#	ret
#	# Call with the foreground in I0
#	#		background in I1
#	# "border" is not obeyed here.
.sub _WIN32_SCREEN_COLOR	# void Win32_screen_color(int fore, int back)
	.param int fore
	.param int back
	shl I5, back, 4
	add I5, I5, fore
	find_global P2, "kernel32"
	dlfunc P0, P2, "SetConsoleTextAttribute", "ipi"
	find_global P5, "Win32handle"
	set I0, 1
	invoke
	_WIN32_CONSOLE_INFO()  # refresh this.
.end
.const int SIZEOF_INPUT_RECORD = 20
.const int NUMBER_OF_EVENTS = 128
# buffer is INPUT_RECORD * EVENTS
.const int INPUT_BUFFER = 2560
.sub _WIN32_INKEY	# string Win32_inkey(void)
	set S0, ""
	set I9, 0
	find_global P1, "kernel32"
	dlfunc P0, P1, "SetConsoleMode", "ipi"
	set I0, 1
	find_global P5, "Win32Inputhandle"
	set I5, 0
	invoke
INKEY:  
	dlfunc P9, P1,  "PeekConsoleInputA",  "ippip"
        dlfunc P10, P1, "ReadConsoleInputA", "ippip"
	find_global P5, "Win32Inputhandle"
	P6=new .ManagedStruct
	P7=new .ManagedStruct
	set P6, INPUT_BUFFER
	set P7, SIZEOF_DWORD

	# Are there any events?
	set P0, P9	# Peek
	set I0, 1
	set I5, NUMBER_OF_EVENTS	# sizeof read buffer
	invoke

	# Peek down the event queue to see if there's a key event
	set I0, P7[0]   # Number of events.
	eq I0, 0, NO_EVENTS
	set I5, -1
NEXT_EVENT:
	inc I5
	eq I5, I0, END_EVENTS
	mul I7, I5, SIZEOF_INPUT_RECORD
	set I1, P6[I7]
	ne I1, 1, NEXT_EVENT

	# Got a key event, was it a key down?
	add I8, I7, SIZEOF_DWORD
	set I1, P6[I8]
	ne I1, 1, NEXT_EVENT	# Nope, a key up

	# Is it a special-key thingy? (shift, alt...)
	add I8, I7, 14
	set I1, P6[I8]
	eq I1, 0, NEXT_EVENT

	# Cool.  Grab the key.
	set I9, I1
	chr S0, I9

	# I6 is the event we're interested in!
	# 
	# There *was* a key event.  Pull everything up to that event
	#
	inc I5
	set P0, P10	# ReadConsoleInput
        set I0, 1
	find_global P5, "Win32Inputhandle"
	invoke
	branch END

NO_EVENTS:
END_EVENTS:
END:	.return(S0)
.end

=cut
