	# Platform-Specific stuff
	# There needs to be a dispatcher to make the runtime do various things
	#	based on platform type.  
	
	# Do anything here that needs to be done for your platform to run properly
	# If Win32, use those routines
	#    Otherwise assume an ANSI terminal
.include "RT_platform_win32.pasm"
.include "RT_platform_ANSIscreen.pasm"
PLATFORM_SETUP:
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SETUP
	branch ANSI_SETUP

SCREEN_CLEAR:
	set I14, 0	# Column position for tab()
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SCREEN_CLEAR
	branch ANSI_SCREEN_CLEAR

SCREEN_SETXCUR:
	set I1, P6["value"]
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SCREEN_SETXCUR
	branch ANSI_SCREEN_SETXCUR

SCREEN_SETYCUR:
	set I1, P6["value"]
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SCREEN_SETYCUR
	branch ANSI_SCREEN_SETYCUR

	# X in P7, Y in P6
SCREEN_LOCATE:
	set I1, P6["value"]
	set I0, P7["value"]
	set I14, I1
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SCREEN_LOCATE
	branch ANSI_SCREEN_LOCATE

SCREEN_COLOR:
	set I1, P6["value"]
	set I0, P7["value"]
	sysinfo S0, 4
	eq S0, "MSWin32", WIN32_SCREEN_COLOR
	branch ANSI_SCREEN_COLOR


# Problem in ANSI
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
