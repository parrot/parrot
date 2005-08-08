###
# [rename]

.namespace [ "Tcl" ]

.sub "&rename"
  .param pmc old_p
  .param pmc new_p

  if I3 != 2 goto error

  .local int return_type
  .local pmc retval
  retval = new String 

  return_type = TCL_OK
  retval = ""

  .local string oldName
  .local string newName
 
  oldName = old_p
  oldName = "&" . oldName
  newName = new_p
  newName = "&" . newName

  .local pmc theSub

  # If newName is empty, then just delete
  if newName == "" goto delete

add:
  # Grab the original sub
  push_eh doesnt_exist
    theSub = find_global "Tcl", oldName
  clear_eh
  # Create the new sub
  store_global "Tcl", newName, theSub

delete:
  null theSub 
  store_global "Tcl", oldName, theSub
  goto done 

doesnt_exist:
  return_type = TCL_ERROR
  retval = "can't rename \""
  $S0 = old_p
  retval .= $S0
  retval .= "\": command doesn't exist"
  goto done

error:
  return_type = TCL_ERROR
  retval = "wrong # args: should be \"rename oldName newName\""

done:
  .return(return_type,retval)
.end
