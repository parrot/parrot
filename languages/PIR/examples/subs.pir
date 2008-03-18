#
# comments at begin of file
#
.sub main :main
	.param int x
	.param num y
	.param pmc z
	.param string s
	#.param $P1
	#.param $P2
	#.param $P3
	#.param $P4
	#.param I1
	#.param P2
	#.param S3
	#.param N4
	print "Hello"
	end
.end

.sub foo :init
	.return(1)
	.return(1,2)
	.return(1,2,3)
	.return("hello")
	.return("a","b","c")
	.return(-1, -1.1)
	.return($P2, P0)
	.return($I222, I11)
	.return($S999, S9)
	.return($N999, N9)
.end

.sub bar :load
	.return()
.end

.sub baz :outer('bar')
	.yield(1)
	.yield(1,2)
	.yield(1,2,3)
	.yield("hello")
	.yield("a","b","c")
	.yield(-1, -1.1)
	.yield($P2, P0)
	.yield($I222, I11)
	.yield($S999, S9)
	.yield($N999, N9)

	'f'()
	f()
	# this does not work, and should not: check and fix.
	#f("x" => x)
	#f(x :flat)
	#f(x :named )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
