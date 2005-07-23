###
# [parray]

.namespace [ "Tcl" ]

.sub "&parray"
  .local pmc argv
  argv = foldup

  .local int argc 
  argc = argv
  
  .local pmc retval
  retval = new String
  retval = ""
  .local int return_type
  return_type = TCL_OK

  if argc == 0 goto error

  .local pmc read
  read = find_global "_Tcl", "__read"
  .local string name
  name = argv[0]
  .local pmc array
  array = read(name)
  
  .local pmc keys
  keys = iter array

loop:
  unless keys goto done
  $P0 = keys."next"()
  $S1 = array[$P0]
  
  print name
  print "("
  print $P0
  print ") = "
  print $S1
  print "\n"
  goto loop

error:
  
done:
  .return(return_type,retval)
.end
