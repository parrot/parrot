.include "RT_platform_win32.pasm"
.include "RT_platform_ANSIscreen.pasm"
.sub _platform_setup		# void platform_setup(void)
	saveall
	sysinfo S0, 4
	ne S0, "MSWin32", NOTWIN
	call _win32_setup
	branch END
NOTWIN: call _ansi_setup
END:	restoreall
	ret
.end
.sub _screen_clear
	saveall
	find_global $P0, "PRINTCOL"
	set $P0["value"], 0
	store_global "PRINTCOL", $P0
	sysinfo S0, 4
	ne S0, "MSWin32", NOTWIN
	call _win32_screen_clear
	branch END
NOTWIN: call _ansi_screen_clear
END:	restoreall
	ret
.end

#SCREEN_SETXCUR:
#	set I1, P6[.VALUE]
#	sysinfo S0, 4
#	eq S0, "MSWin32", WIN32_SCREEN_SETXCUR
#	branch ANSI_SCREEN_SETXCUR
#
#SCREEN_SETYCUR:
#	set I1, P6[.VALUE]
#	sysinfo S0, 4
#	eq S0, "MSWin32", WIN32_SCREEN_SETYCUR
#	branch ANSI_SCREEN_SETYCUR
#
#	# X in P7, Y in P6
.sub _screen_locate		# void screen_locate(float x, float y)
	saveall
	.param float xf
	.param float yf
	.local int x
	.local int y
	.local string sys
	set x, xf
	set y, yf
	sysinfo sys, 4

	.arg y
	.arg x
	ne sys, "MSWin32", NOTWIN
	call _WIN32_SCREEN_LOCATE
	branch END
NOTWIN: call _ANSI_SCREEN_LOCATE
END:	restoreall
	ret
.end
.sub _screen_color	# void screen_color(float fore, float back)
	saveall
	.param float foref
	.param float backf
	.local int fore
	.local int back
	.local string sys
	set back, backf
	set fore, foref
	.arg back
	.arg fore
	sysinfo sys, 4
	ne sys, "MSWin32", NOTWIN
	call _WIN32_SCREEN_COLOR
	branch END
NOTWIN: call _ANSI_SCREEN_COLOR
END:	restoreall
	ret
.end
## Problem in ANSI
#SCREEN_GETFORE:
#	sysinfo S0, 4
#	set I0, 0
#	ne S0, "MSWin32", SCREEN_GETFORE_NOTWIN
#	bsr WIN32_SCREEN_GETFORE
#SCREEN_GETFORE_NOTWIN:
#	new P6, .PerlArray
#	set P6[.TYPE], "INT"
#	set P6[.VALUE], I0
#	ret
#
#SCREEN_GETBACK:
#	sysinfo S0, 4
#	set I0, 0
#	ne S0, "MSWin32", SCREEN_GETBACK_NOTWIN
#	bsr WIN32_SCREEN_GETBACK
#SCREEN_GETBACK_NOTWIN:
#	new P6, .PerlArray
#	set P6[.TYPE], "INT"
#	set P6[.VALUE], I0
#	ret
