###
# [error]

# XXX only handles the one arg form of error right now.
# need global vars before setting errorInfo, and stack tracing isn't
# ready yet.
# (So, the usage statement lies)

.namespace [ "Tcl" ]

.sub "&error"
  .param pmc argv :slurpy

  .local int argc 
  argc = argv

  if argc < 1 goto badargs
  if argc > 3 goto badargs

  .local pmc errorInfo, errorCode
  if argc == 3 goto arg_3
  if argc == 2 goto arg_2
 
  errorInfo = new .TclString
  errorInfo = ''
  errorCode = new .TclString
  errorCode = 'NONE'
  goto finish

arg_3:
  errorInfo = argv[1]
  errorCode = argv[2]
  goto finish

arg_2:
  errorCode = new .TclString
  errorCode = 'NONE'
  errorInfo = argv[1]

finish:
  store_global 'Tcl', '$errorInfo', errorInfo
  store_global 'Tcl', '$errorCode', errorCode
  $P0 = argv[0]
  .throw($P0)

badargs:
  .throw("wrong # args: should be \"error message ?errorInfo? ?errorCode?\"")
.end
