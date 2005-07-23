=head2 [incr]

 incr foo
 incr foo offset

=cut

.namespace [ "Tcl" ]

.sub "incr"
  .local pmc argv 
  argv = foldup

  .local int value
  .local int increment 
  increment = 1
  
  .local pmc argc
  argc = new Integer # persist across function calls...
  argc = argv

  .local pmc retval
  .local pmc original_pmc

  .local int return_type
  return_type = TCL_OK 
 
  if argc == 0 goto error

  .local pmc read
  read = find_global "_Tcl", "__read"
  $S1 = argv[0] 
  (return_type,original_pmc) = read($S1)
  # XXX this should probably just return what read did if there's an error.
  if return_type == TCL_ERROR goto bad_variable

  if argc == 1 goto do_incr
  if argc == 2 goto offset
  if argc > 2 goto error

offset:
  increment = argv[1]

do_incr:
  $I0 = original_pmc
  $I0 += increment
  original_pmc = $I0
  retval = original_pmc
  goto done 

error:
  return_type = TCL_ERROR 
  retval = new String
  retval = "wrong # args: should be \"incr varName ?increment?\""

done:
  .return(return_type,retval)

bad_variable:
  $P1 = new String
  $P1 = "can't read \""
  $S0 = argv[0]
  $P1 .= $S0
  $P1 .= "\": no such variable"
  .return(TCL_ERROR,$P1)

.end
