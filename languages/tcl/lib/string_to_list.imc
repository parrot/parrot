# XXX move into a PMC vtable

.namespace [ "_Tcl" ]

.sub __stringToList
  .param string str

  .local int return_type
  return_type = TCL_OK
  
  .local pmc retval
  retval = new TclList
 
  .local pmc parsed_str

  .local pmc parser 
  parser = find_global "_Tcl", "parser"
  
  push_eh parse_error
    parsed_str = parser."parse"(str,0,1)
  clear_eh
  register parsed_str
  
  $I0 = parsed_str
  if $I0 == 0 goto done

  retval = shift parsed_str

  # XXX If there is more than one entry in the parsed_str array, then
  # there's probably an error condition we need to raise.
  
  goto done
  
parse_error:
  return_type = TCL_ERROR
  $S0 = P5["_message"]
  retval = new String
  retval = $S0
  # goto done

done:
  .return(return_type, retval)
.end
