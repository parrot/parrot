.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&subst'
  .param pmc argv :slurpy
 
  .local int argc
  argc = elements argv 
  if argc == 0 goto badargs

  .local string a_string
 
  # XXX not handling options. 

  a_string = argv[0]

  # XXX not handling anything. Just a slightly better stub.
  .return (a_string)

badargs:
    tcl_error 'wrong # args: should be "subst ?-nobackslashes? ?-nocommands? ?-novariables? string"'

.end
