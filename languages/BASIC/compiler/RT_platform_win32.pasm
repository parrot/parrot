.const int SIZEOF_CONSOLE_SCREEN_BUFFER_INFO = 22
.const int SIZEOF_DWORD = 4
.sub _win32_setup			# void win32_setup(void)
	saveall
	loadlib P1, "kernel32.dll"
	dlfunc P0, P1, "GetStdHandle", "pi"
	set I0, 1
	set I5, -11
	invoke
	store_global "kernel32", P1
	store_global "Win32handle", P5
	$P0= new PerlHash
	store_global "Win32console", $P0
	call _WIN32_CONSOLE_INFO
	restoreall
	ret
.end
.sub _WIN32_CONSOLE_INFO		# void WIN32_CONSOLE_INFO(void)
	saveall
	find_global P1, "kernel32"
	dlfunc P0, P1, "GetConsoleScreenBufferInfo", "ipp"
	find_global P5, "Win32handle"
	P6=new ManagedStruct
	set P6, SIZEOF_CONSOLE_SCREEN_BUFFER_INFO
	set I0, 1
	invoke
	set P5, P6
	find_global P0, "Win32console"

	.arg P5
	.arg 0			# dwSize.X
	call _UMS_GET_SHORT
	.result $I1
	set P0["xbuf"], $I1

	.arg P5
	.arg 2			# dwSize.Y
	call _UMS_GET_SHORT
	.result $I1
	set P0["ybuf"], $I1

	.arg P5
	.arg 4
	call _UMS_GET_SHORT
	.result $I1
	inc $I1
	set P0["curx"], $I1

	.arg P5
	.arg 4
	call _UMS_GET_SHORT
	.result $I1
	inc $I1
	set P0["cury"], $I1

	set $I1, P5[8]
	set P0["attr"], $I1	# wAttributes
	restoreall
	ret
.end
.sub _UMS_GET_SHORT		# int value ums_get_short(int offset, ManagedStruct buf)
	saveall
	.param int offset
	.param ManagedStruct buf
	set $I2, buf[offset]
	inc offset
	set $I3, buf[offset]
	shl $I3, $I3, 8
	add $I3, $I3, $I2
	.return $I3
	restoreall
	ret
.end
.sub _win32_screen_clear	# void _WIN32_SCREEN_CLEAR(void)
	call _WIN32_CONSOLE_CLEAR
	call _WIN32_CONSOLE_HOME
	ret
.end
.sub _WIN32_CONSOLE_HOME	# void Win32_console_home(void)
	saveall
	find_global P2, "kernel32"
	dlfunc P0, P2, "SetConsoleCursorPosition", "ipi"
	set I0, 1
	find_global P5, "Win32handle"
	set I5, 0
	invoke
	restoreall
	ret
.end

.sub _WIN32_CONSOLE_CLEAR	# void Win32_console_clear(void)
	saveall
	find_global P1, "Win32console"
	find_global P2, "kernel32"
	dlfunc P0, P2, "FillConsoleOutputCharacterA", "ipcilp"
	set I0, 1
	find_global P5, "Win32handle"
	P6=new ManagedStruct
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
	P6= new ManagedStruct
	set P6, SIZEOF_DWORD
	set I5, P1["attr"]		# Attrib
	set I1, P1["xbuf"]
	set I2, P1["ybuf"]
	mul I6, I1, I2			# Length
	set I7, 0			# Coords
	invoke
	restoreall
	ret
.end
.sub _WIN32_SCREEN_FINDPOS		# void Win32_screen_findpos(void)
	call _WIN32_CONSOLE_INFO
	ret
.end
.sub _WIN32_SCREEN_GETXCUR		# int win32_screen_getxcur(void)
	saveall
	find_global P1, "Win32console"
	set $I0, P1["curx"]
	.return $I0
	restoreall
	ret
.end
.sub _WIN32_SCREEN_GETYCUR		# int win32_screen_getycur(void)
	saveall
	find_global P1, "Win32console"
	set $I0, P1["cury"]
	.return $I0
	restoreall
	ret
.end
.sub _WIN32_SCREEN_SETXCUR	# void win32_screen_setxcur(int x)
	saveall
	.param int x
	.local int y
	call _WIN32_SCREEN_FINDPOS
	call _WIN32_SCREEN_GETYCUR
	.result y
	.arg y
	.arg x
	call _WIN32_SCREEN_LOCATE
	restoreall
	ret
.end
.sub _WIN32_SCREEN_SETYCUR	# void win32_screen_setycur(int y)
	saveall
	.param int y
	.local int x
	call _WIN32_SCREEN_FINDPOS
	call _WIN32_SCREEN_GETXCUR
	.result x
	.arg y
	.arg x
	call _WIN32_SCREEN_LOCATE
	restoreall
	ret
.end
.sub _WIN32_SCREEN_LOCATE	# void win32_screen_locate(int x, int y)
	saveall
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
	restoreall
	ret
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
	saveall
	.param int fore
	.param int back
	shl I5, back, 4
	add I5, I5, fore
	find_global P2, "kernel32"
	dlfunc P0, P2, "SetConsoleTextAttribute", "ipi"
	find_global P5, "Win32handle"
	set I0, 1
	invoke
	call _WIN32_CONSOLE_INFO  # refresh this.
	restoreall
	ret
.end
