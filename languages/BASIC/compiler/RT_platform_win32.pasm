	# Win32 Specific routines
.constant SIZEOF_CONSOLE_SCREEN_BUFFER_INFO 22
.constant SIZEOF_DWORD 4

WIN32_SETUP:
	noop
WIN32_CONSOLE_SETUP:
	loadlib P1, "kernel32.dll"
	dlfunc P0, P1, "GetStdHandle", "pi"
	set I0, 1
	set I5, -11
	invoke
	set P24["kernel32"], P1
	set P24["handle"], P5
	new P0, .PerlHash
	set P24["console"], P0
	bsr WIN32_CONSOLE_INFO
	ret

WIN32_CONSOLE_INFO:
	set P1, P24["kernel32"]		      # 65
	dlfunc P0, P1, "GetConsoleScreenBufferInfo", "ipp"
	set P5, P24["handle"]
	new P6, .ManagedStruct
	set P6, .SIZEOF_CONSOLE_SCREEN_BUFFER_INFO
	set I0, 1
	invoke
	set P5, P6
	set P0, P24["console"]
	set I0, 0		# dwSize.X
	bsr UMS_GET_SHORT
	set P0["xbuf"], I1
	set I0, 2		# dwSize.Y
	bsr UMS_GET_SHORT
	set P0["ybuf"], I1
	set I0, 4		# dwCursorPosition.X
	bsr UMS_GET_SHORT
	inc I1
	set P0["curx"], I1
	set I0, 6		# dwCursorPosition.Y
	bsr UMS_GET_SHORT
	inc I1
	set P0["cury"], I1
	set I1, P5[8]
	set P0["attr"], I1	# wAttributes
	ret

	# P5 ManagedStruct
	# I0 offset in UMS
	# I1 return
UMS_GET_SHORT:
	pushi
	set I2, P5[I0]
	inc I0
	set I3, P5[I0]
	shl I3, I3, 8
	add I3, I3, I2
	save I3
	popi
	restore I1
	ret

WIN32_SCREEN_CLEAR:
	bsr WIN32_CONSOLE_CLEAR
	bsr WIN32_CONSOLE_HOME
	ret
	
WIN32_CONSOLE_HOME:
	set P2, P24["kernel32"]
	dlfunc P0, P2, "SetConsoleCursorPosition", "ipi"
	set I0, 1
	set P5, P24["handle"]
	set I5, 0
	invoke
	ret

WIN32_CONSOLE_CLEAR:
	set P1, P24["console"]
	set P2, P24["kernel32"]		      
	dlfunc P0, P2, "FillConsoleOutputCharacterA", "ipcilp"
	set I0, 1
	set P5, P24["handle"]
	new P6, .ManagedStruct
	set P6, .SIZEOF_DWORD
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
	set P5, P24["handle"]	# Handle

	new P6, .ManagedStruct
	set P6, .SIZEOF_DWORD
	set I5, P1["attr"]		# Attrib
	set I1, P1["xbuf"]
	set I2, P1["ybuf"]
	mul I6, I1, I2			# Length
	set I7, 0			# Coords

	invoke
	ret

WIN32_SCREEN_FINDPOS:  # Find the X,Y position on the screen
	bsr WIN32_CONSOLE_INFO
	ret
WIN32_SCREEN_GETXCUR:
	set P1, P24["console"]
	set I0, P1["curx"]
	ret
WIN32_SCREEN_GETYCUR:
	set P1, P24["console"]
	set I0, P1["cury"]
	ret
WIN32_SCREEN_LOCATE:
	dec I0		# 1,1 is the origin in QuickBASIC
	dec I1
	set I5, I0
	shl I5, I5, 16
	add I5, I5, I1
	set P1, P24["console"]
	set P2, P24["kernel32"]
	dlfunc P0, P2, "SetConsoleCursorPosition", "ipi"
	set I0, 1
	set P5, P24["handle"]
	invoke
	ret

#SCREEN Mode 0 Syntax:  COLOR [foreground][,[background][,border]]
#   ¦ foreground is the text color (range = 0-31, with 16-31 blinking)
#   ¦ background is the screen color (range = 0-7)
#   ¦ border is the color surrounding the screen (range = 0-15)
#     0 = black       4 = red           8 = grey             12 = light red
#     1 = blue        5 = magenta       9 = light blue       13 = light magenta
#     2 = green       6 = brown        10 = light green      14 = yellow
#     3 = cyan        7 = white        11 = light cyan       15 = bright white
.constant  FOREGROUND_BLUE        1
.constant  FOREGROUND_GREEN       2
.constant  FOREGROUND_RED	  4
.constant  FOREGROUND_INTENSITY   8
.constant  BACKGROUND_BLUE	 16
.constant  BACKGROUND_GREEN	 32
.constant  BACKGROUND_RED	 64
.constant  BACKGROUND_INTENSITY 128
WIN32_SCREEN_GETFORE:
	set P1, P24["console"]
	set I0, P1["attr"]
	band I0, I0, 15
	ret
WIN32_SCREEN_GETBACK:
	set P1, P24["console"]
	set I0, P1["attr"]
	shr I0, I0, 4
	ret
	# Call with the foreground in I0
	#		background in I1
	# "border" is not obeyed here.
WIN32_SCREEN_COLOR:
	shl I5, I1, 4
	add I5, I5, I0
	set P1, P24["console"]
	set P2, P24["kernel32"]
	dlfunc P0, P2, "SetConsoleTextAttribute", "ipi"
	set P5, P24["handle"]
	set I0, 1
	invoke
	bsr WIN32_CONSOLE_INFO  # refresh this.
	ret
