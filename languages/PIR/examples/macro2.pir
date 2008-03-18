.sub main
	.local int i
	#.a = 1
	a = a
	.X(a,b)
.end


.macro X(a,b)
	.local $x: doit()


	loop: doit()
	.a = .b
	.sym int i
.endm

.sub main
	.local int i
	#.a = 1
	a = a
	.X(a,b)
.end


.macro X(a,b)
	.local $x: doit()


	loop: doit()
	.a = .b
	.sym int i
.endm

.macro X(a,b)
	.local $x: doit()


	loop: doit()
	.a = .b
	.sym int i
.endm

.sub main
	.local int i
	#.a = 1
	a = a
	.X(a,b)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
