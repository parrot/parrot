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
	set P6, P24["handle"]
	new P5, .ManagedStruct
	set P5, .SIZEOF_CONSOLE_SCREEN_BUFFER_INFO
	set I0, 1
	invoke
	set P0, P24["console"]
	set I0, 0		# dwSize.X
	bsr UMS_GET_SHORT
	set P0["xbuf"], I1
	print I1
	print " X "

	set I0, 2		# dwSize.Y
	bsr UMS_GET_SHORT
	set P0["ybuf"], I1
	print I1
	print " Y \n"

	set I0, 4		# dwCursorPosition.X
	bsr UMS_GET_SHORT
	set P0["curx"], I1
	set I0, 6		# dwCursorPosition.Y
	bsr UMS_GET_SHORT
	set P0["cury"], I1
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
	set I14, 0	# Column position for tab()
	ret

WIN32_CONSOLE_CLEAR:
	set P1, P24["console"]
	set P2, P24["kernel32"]		      
	dlfunc P0, P2, "FillConsoleOutputCharacterA", "ipcilp"
	set I0, 1
	new P5, .ManagedStruct
	set P5, .SIZEOF_DWORD
	set I5, 0			# Coords
	set I1, P1["xbuf"]
	set I2, P1["ybuf"]
	mul I6, I1, I2			# Length
	print "Length: "
	print I6
	print "\n"
	set I7, 32			# Char
	set P6, P24["handle"]	# Handle
	invoke
	ret	
	