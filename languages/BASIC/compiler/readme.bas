' Demo for Parrot BASIC 2
'
dim menu$(1)
items=0

sub titles
	shared menu$()
	shared items

	open "BASIC_README" for input as #2
	do
		input #2, a$
		if right$(a$,1) = "?" then
			items=items+1
			menu$(items)=a$
		end if
	loop until a$ = "END"
	close #2
end sub

sub showitem(which)
	shared menu$()

	print string$(70,"-")
	open "BASIC_README" for input as #2
	display = 0
	do
		input #2, a$
		if right$(a$,1) = "?" and display then exit do
		if a$ = menu$(which) then
			display=1
		end if
		if display then print a$
	loop until a$ = "END"
	close #2
	print string$(70,"-")
end sub

call titles

do
	for i = 1 to items
		print i;".  ";menu$(i)
	next i
	choice=0
	print
	input "Choice";choice
	if choice > 0 then call showitem(choice)
loop until choice = 0
