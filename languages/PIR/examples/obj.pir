.sub main :main
  .local pmc x, y, z
  x. y()
.end

.sub foo
  print "Foo"
.end

.sub str :vtable

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
