###
# [list]

.HLL 'Tcl', 'tcl_group'
.namespace []

# RT #56958 We should be getting a TclList as a result of :slurpy
# The sub should be this simple:
#
#  .sub '&list'
#    .param pmc argv :slurpy
#    .return(argv)
#  .end
#
# t/tcl_misc.t will fail with current parrot and the short version
# of this sub.

.sub '&list'
  .param pmc argv :slurpy

  $S0 = typeof argv
  if $S0 != 'TclList' goto fixup
  .return(argv)


fixup:
  .local pmc iter, retval
  retval = new 'TclList'

  iter = new 'Iterator', argv
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    push retval, $P0
    goto iter_loop
  iter_end:
  .return(retval)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
