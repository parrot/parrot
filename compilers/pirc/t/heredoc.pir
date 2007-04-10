.sub main
	foo(<<'CODE', <<'OUTPUT', <<'HI')

	print "Hello!"
CODE
    Hello!
OUTPUT
	this is some message
HI

.end

.sub foo
	.param pmc args :slurpy

	.yield(<<'YIELD')
 This is some text returned through .yield!

YIELD

    .return(<<'RET')
 Some text returned through return
RET
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
