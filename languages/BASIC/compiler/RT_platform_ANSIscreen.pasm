	# ANSIScreen Specific routines
	# P24 is ours to use, but I don't really know why we'd need it.
ANSI_SETUP:  
	# Not really needed under Non-Win systems?
	# This is a good place to go get a console if you need one.
	ret

ANSI_SCREEN_CLEAR:
	ret

ANSI_SCREEN_FINDPOS:	# Probably not possible.  :(
	ret

	# I0,I1
	# QB origin is 1,1
ANSI_SCREEN_LOCATE:
	ret

# QB.exe
#     0 = black       4 = red           8 = grey             12 = light red
#     1 = blue        5 = magenta       9 = light blue       13 = light magenta
#     2 = green       6 = brown        10 = light green      14 = yellow
#     3 = cyan        7 = white        11 = light cyan       15 = bright white
	# foreground in I0
	# background in I1
ANSI_SCREEN_COLOR:
	ret
