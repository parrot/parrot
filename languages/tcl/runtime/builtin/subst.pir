.HLL 'Tcl', 'tcl_group'
.namespace

# RT#40779: this is only a stub.

.sub '&subst'
  .param pmc argv :slurpy
 
  .local int argc
  argc = elements argv 
  if argc == 0 goto badargs

  .local string a_string
 
  a_string = argv[0]

  .return (a_string)

badargs:
    tcl_error 'wrong # args: should be "subst ?-nobackslashes? ?-nocommands? ?-novariables? string"'

.end
