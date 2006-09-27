        bounds 1
	push_eh _x
	newclass P1, "YaPH"
	find_method P0, P1, "Just another Parrot Hacker\n"
	print "What you see isn't what you get\n"
_x:
	get_results "(0,0)", P0, S0
	set I0, 8
	substr S0, S0, I0, 27
	shr I0, 1
	bsr I0
	substr S0, 0x185, I0, S0
	ret
