	null P0
	loadlib P1, "foo"
	print "ok 1\n"
	find_type I0, "Foo"
	print I0
	print "\n"
	new P0, I0
	print "ok 2\n"
	set I0, P0
	print I0
	print "\n"
	end
