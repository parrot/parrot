.sub main

	x = 1
	x['x'] = 1
	x[1] = 1
	x[1.1] = 1
	x[X] = 1

	x = x [ 'x']
	x = x[1]

	x = x [ 1.1 ]

	x = x [ X ]



.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
