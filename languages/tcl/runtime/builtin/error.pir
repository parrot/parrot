.HLL 'Tcl', ''
.namespace []

.sub '&error'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  if argc < 1 goto badargs
  if argc > 3 goto badargs

  .local pmc errorInfo, errorCode
  if argc == 3 goto arg_3
  if argc == 2 goto arg_2

  errorInfo = new 'TclString'
  errorInfo = ''
  errorCode = new 'TclString'
  errorCode = 'NONE'
  goto finish

arg_3:
  errorInfo = argv[1]
  errorCode = argv[2]
  goto finish

arg_2:
  errorCode = new 'TclString'
  errorCode = 'NONE'
  errorInfo = argv[1]

finish:
  $P1 = get_hll_global '$errorInfo'
  assign $P1, errorInfo
  $P1 = get_hll_global '$errorCode'
  assign $P1, errorCode
  $P0 = argv[0]
  die $P0

badargs:
  die 'wrong # args: should be "error message ?errorInfo? ?errorCode?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
