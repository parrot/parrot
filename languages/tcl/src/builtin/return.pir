###
# [return]

.HLL '_Tcl', ''
.namespace [ 'builtins' ]

.sub 'return'
  .param string retval
  .param pmc    raw_args
  .param pmc    argv

  .local string pir_code
  .local int argc 
  argc = argv

  if argc == 0 goto noargs
  if argc == 1 goto onearg

  # don't handle this case staticly
  null $P0
  .return($P0)

onearg:
  pir_code = 'tcl_return '
  $S1 = argv[0]
  pir_code.= $S1
  pir_code.= "\n"
  .return(pir_code)

noargs:
  pir_code = "tcl_return \"\"\n"
  .return(pir_code)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
