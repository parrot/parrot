.namespace [ "Tcl" ]

# XXX very simplistic.

.sub "&after"
  .local pmc argv 
  argv = foldup

  $I0 = argv[0]
  $N0 = $I0 / 1000
  sleep $N0

  .local pmc retval
  retval = new String
  retval = ""
  .return(TCL_OK,retval)
.end
