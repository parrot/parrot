	null P0
	loadlib P1, "match_group"
	print "ok 1\n"
	find_type I0, "Match"
	print I0
	print "\n"
	new P0, I0
	print "ok 2\n"
	find_type I0, "PerlString"
	new P1, I0
	set P1, "value"
	set P0["slot"], P1
	set S0, P0["slot"]
	print S0
	print "\n"
	end
