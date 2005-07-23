###
# [return]

.namespace [ "Tcl" ]

.sub "&return"
   .local pmc argv 
  argv = foldup
 
  .local int argc 
  argc = argv

  .local pmc retval
  retval = new String
  if argc == 0 goto noargs
  if argc == 1 goto onearg

  # XXX use TCL_ERROR here...
  print "bad call to return"
  retval = ""
  goto done

onearg:
  retval = argv[0]
  goto done

noargs:
  retval = "" 

 # The sole purpose of this command (and break, and continue) is to 
 # generate a specific return code. Normally, when a proc finishes TCL_OK
 # control passes to the next item in the queue.

done:
  .return(TCL_RETURN,retval)
.end
