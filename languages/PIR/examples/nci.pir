.sub main :main
  .begin_call
  .nci_call $P1 # r = funcname(x, y, z)
  .end_call
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
