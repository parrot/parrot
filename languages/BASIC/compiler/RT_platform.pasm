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
	ret


