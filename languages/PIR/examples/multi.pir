
.sub main :multi()

.end

.sub foo :multi(x)
.end

.sub bar :multi("x", _, int, float, string, pmc)


.end

.sub bar :multi("x", "x")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
