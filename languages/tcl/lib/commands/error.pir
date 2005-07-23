###
# [error]

# XXX only handles the one arg form of error right now.
# need global vars before setting errorInfo, and stack tracing isn't
# ready yet.
# (So, the usage statement lies)

.namespace [ "Tcl" ]

.sub "error"
  .local pmc argv
  argv = foldup

  .local int argc 
  argc = argv

  .local pmc retval
  retval = new String

  if argc != 1 goto badargs

  retval = argv[0]
  goto done

badargs:
  retval = "wrong # args: should be \"error message ?errorInfo? ?errorCode?\""
 
 # The sole purpose of this command (and break, and continue) is to 
 # generate a specific return code. Normally, when a proc finishes TCL_OK
 # control passes to the next item in the queue.

done:
  .return(TCL_ERROR,retval)
.end
