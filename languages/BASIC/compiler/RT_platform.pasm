	# Platform-Specific stuff
	# There needs to be a dispatcher to make the runtime do various things
	#	based on platform type.  
	
	# Do anything here that needs to be done for your platform to run properly
.include "RT_platform_win32.pasm"
PLATFORM_SETUP:
	bsr WIN32_SETUP
	ret
SCREEN_CLEAR:
	bsr WIN32_SCREEN_CLEAR
	set I14, 0	# Column position for tab()
	ret
SCREEN_FINDPOS:
	bsr WIN32_SCREEN_FINDPOS
	ret

SCREEN_GETXCUR:
	bsr WIN32_SCREEN_GETXCUR
	new P6, .PerlHash
	set P6["type"],"INT"
	set P6["value"],I0
	ret
SCREEN_GETYCUR:
	bsr WIN32_SCREEN_GETYCUR
	new P6, .PerlHash
	set P6["type"],"INT"
	set P6["value"],I0
	ret
	# X in P7, Y in P6
SCREEN_LOCATE:
	set I0, P6["value"]
	set I1, P7["value"]
	set I14, I0
	bsr WIN32_SCREEN_LOCATE
	ret
SCREEN_COLOR:
	set I1, P6["value"]
	set I0, P7["value"]
	bsr WIN32_SCREEN_COLOR
	ret
SCREEN_GETFORE:
	bsr WIN32_SCREEN_GETFORE
	new P6, .PerlHash
	set P6["type"], "INT"
	set P6["value"], I0
	ret
SCREEN_GETBACK:
	bsr WIN32_SCREEN_GETBACK
	new P6, .PerlHash
	set P6["type"], "INT"
	set P6["value"], I0
	ret
