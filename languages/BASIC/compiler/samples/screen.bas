for i = 0 to 23: print: next i

print "This program will perform tests of the basic screen functionality."
print "It is functional on Win32 consoles, and ANSI terminals.  There are"
print "differences (subtle and non) about the way things display."
print 
print "You appear to be running: ";
_STARTASM
	sysinfo S0, 4
	print S0
_ENDASM
print :print 
Input "Press <enter> to continue", a$

cls
print "Foreground test:"
color 0, 15: print "Black 0"
color 1, 15: print "Blue  1"
color 2, 15: print "Green 2"
color 3, 15: print "Cyan  3"
color 4, 15: print "Red   4"
color 5, 15: print "Magenta 5"
color 6, 15: print "Brown 6"
color 7, 15: print "White 7"
color 8, 15: print "Grey  8"
color 9, 15: print "Light Blue      9"
color 10, 15: print "Light Green   10"
color 11, 15: print "Light Cyan    11"
color 12, 15: print "Light Red     12"
color 13, 15: print "Light Magenta 13"
color 14, 15: print "Yellow        14"
color 15, 15: print "White         15"

color 0, 15
locate 1, 40: print "Background test:"

locate 2, 40:color 0, 0: print "Black 0"
locate 3, 40:color 0, 1: print "Blue  1"
locate 4, 40:color 0, 2: print "Green 2"
locate 5, 40:color 0, 3: print "Cyan  3"
locate 6, 40:color 0, 4: print "Red   4"
locate 7, 40:color 0, 5: print "Magenta 5"
locate 8, 40:color 0, 6: print "Brown 6"
locate 9, 40:color 0, 7: print "White 7"
locate 10, 40:color 0, 8: print "Grey  8"
locate 11, 40:color 0, 9: print "Light Blue      9"
locate 12, 40:color 0, 10: print "Light Green   10"
locate 13, 40:color 0, 11: print "Light Cyan    11"
locate 14, 40:color 0, 12: print "Light Red     12"
locate 15, 40:color 0, 13: print "Light Magenta 13"
locate 16, 40:color 0, 14: print "Yellow        14"
locate 17, 40:color 0, 15: print "White         15"

locate 19, 1
print "The colors should appear as described.  On ANSI terminals, there"
print "are only 8 background colors.  Win32 Consoles will see 16."
print

color 0, 15

input "Press <enter> for a colorful display", a$

cls
vert = 10
horiz = 40
vertval=0
horizval=0
colors = 0


for p = 1 to 26 step 1
	increase = .6
	vfact=0
	hfact=0
	vertval=0
	horizval=0
	for i=1 to 360 
		vo = vfact*sin(vertval)
		ho = hfact*cos(horizval)
		locate vert+vo, horiz+ho
		c=colors mod 7
		color c+7,15
		print "*";
		vertval=vertval+increase
		horizval=horizval+increase

		vfact=vfact+.03
		hfact=hfact+.12
		colors=colors+(6/360)
	next i
next p

locate 23, 1
color 0, 15
end
