	# Platform-Specific stuff
	# There needs to be a dispatcher to make the runtime do various things
	#	based on platform type.  
	
	# Do anything here that needs to be done for your platform to run properly
.include "RT_platform_win32.pasm"
.include "RT_platform_ANSIscreen.pasm"
PLATFORM_SETUP:
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SETUP
	branch ANSI_SETUP

SCREEN_CLEAR:
	set I14, 0	# Column position for tab()
	sysinfo S0, 4
	print "Sysinfo says '"
	print S0
	print "'\n"
	eq S0, "MSWin32", WIN32_SCREEN_CLEAR
	branch ANSI_SCREEN_CLEAR

# Next three probably only possible under Win32.
SCREEN_FINDPOS:
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SCREEN_FINDPOS
	branch ANSI_SCREEN_FINDPOS

SCREEN_GETXCUR:
	sysinfo S0, 4
	set I0, 0
	ne S0, "MSWin32", SCREEN_GETXCUR_NOTWIN
	bsr WIN32_SCREEN_GETXCUR
SCREEN_GETXCUR_NOTWIN:
	new P6, .PerlHash
	set P6["type"],"INT"
	set P6["value"],I0
	ret

SCREEN_GETYCUR:
	sysinfo S0, 4
	set I0, 0
	ne S0, "MSWin32", SCREEN_GETYCUR_NOTWIN
	bsr WIN32_SCREEN_GETYCUR
SCREEN_GETYCUR_NOTWIN:
	new P6, .PerlHash
	set P6["type"],"INT"
	set P6["value"],I0
	ret
# End of portability nightmare

	# X in P7, Y in P6
SCREEN_LOCATE:
	set I0, P6["value"]
	set I1, P7["value"]
	set I14, I0
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SCREEN_LOCATE
	branch ANSI_SCREEN_LOCATE

SCREEN_COLOR:
	set I1, P6["value"]
	set I0, P7["value"]
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SCREEN_COLOR
	branch ANSI_SCREEN_COLOR

SCREEN_GETFORE:
	sysinfo S0, 4
	set I0, 0
	ne S0, "MSWin32", SCREEN_GETFORE_NOTWIN
	bsr WIN32_SCREEN_GETFORE
SCREEN_GETFORE_NOTWIN:
	new P6, .PerlHash
	set P6["type"], "INT"
	set P6["value"], I0
	ret

SCREEN_GETBACK:
	sysinfo S0, 4
	set I0, 0
	ne S0, "MSWin32", SCREEN_GETBACK_NOTWIN
	bsr WIN32_SCREEN_GETBACK
SCREEN_GETBACK_NOTWIN:
	new P6, .PerlHash
	set P6["type"], "INT"
	set P6["value"], I0
	ret
