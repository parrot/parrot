.include "RT_platform_win32.pir"
.include "RT_platform_ANSIscreen.pir"
.include "sysinfo.pasm"

.sub _platform_setup		# void platform_setup(void)
	sysinfo S0, .SYSINFO_PARROT_OS
	ne S0, "MSWin32", NOTWIN
	_win32_setup()
	branch END
NOTWIN: _ansi_setup()
END:	noop
.end
.sub _platform_shutdown
	sysinfo S0, .SYSINFO_PARROT_OS
	ne S0, "MSWin32", NOTWIN
	_win32_shutdown()
	branch END
NOTWIN: _ansi_shutdown()
END:	noop
.end
.sub _screen_clear
	get_global $P0, "PRINTCOL"
	set $P0["value"], 0
	set_global "PRINTCOL", $P0
	sysinfo S0, .SYSINFO_PARROT_OS
	ne S0, "MSWin32", NOTWIN
	_win32_screen_clear()
	branch END
NOTWIN: _ansi_screen_clear()
END:	noop
.end

#SCREEN_SETXCUR:
#	set I1, P6[.VALUE]
#	sysinfo S0, .SYSINFO_PARROT_OS
#	eq S0, "MSWin32", WIN32_SCREEN_SETXCUR
#	branch ANSI_SCREEN_SETXCUR
#
#SCREEN_SETYCUR:
#	set I1, P6[.VALUE]
#	sysinfo S0, .SYSINFO_PARROT_OS
#	eq S0, "MSWin32", WIN32_SCREEN_SETYCUR
#	branch ANSI_SCREEN_SETYCUR
#
#	# X in P7, Y in P6
.sub _screen_locate		# void screen_locate(float x, float y)
	.param num xf
	.param num yf
	.local int x
	.local int y
	.local string sys
	set x, xf
	set y, yf
	sysinfo sys, 4

	ne sys, "MSWin32", NOTWIN
	_WIN32_SCREEN_LOCATE(x,y)
	branch END
NOTWIN: _ANSI_SCREEN_LOCATE(x,y)
END:	noop
.end
.sub _screen_color	# void screen_color(float fore, float back)
	.param num foref
	.param num backf
	.local int fore
	.local int back
	.local string sys
	set back, backf
	set fore, foref
	sysinfo sys, 4
	ne sys, "MSWin32", NOTWIN
	_WIN32_SCREEN_COLOR(fore,back)
	branch END
NOTWIN: _ANSI_SCREEN_COLOR(fore,back)
END:	noop
.end

.sub _line_read
	.local string sys
	sysinfo sys, 4
	eq sys, "MSWin32", END
	_TERMIO_normal()
END:	noop
.end
.sub _scan_read
	.local string sys
	sysinfo sys, 4
	eq sys, "MSWin32", END
	_TERMIO_scankey()
END:	noop
.end

.sub _inkey_string		# string inkey$(void)
	.local string sys
	sysinfo sys, 4
	ne sys, "MSWin32", NOTWIN
	_WIN32_INKEY()
	branch END
NOTWIN: _TERMIO_INKEY()
END:	noop
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
