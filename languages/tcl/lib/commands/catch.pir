###
# [catch]

.namespace [ "Tcl" ]

.sub "&catch"
  .param pmc argv :slurpy
 
  .local int argc 
  argc = argv

  .local int retval
  .local pmc code_retval,parse
  .local string varname,sigil_varname,code

  parse = find_global "_Tcl", "parse"

  if argc == 0 goto badargs
  if argc  > 2 goto badargs

  code = argv[0]
  $P1 = parse(code)
  push_eh non_ok
    code_retval = $P1()
    retval = TCL_OK  # no exception => TCL_OK
  clear_eh

  goto got_retval

non_ok:
  code_retval = P5[0]
  .get_return_code(P5,retval)

got_retval:
  #argc = argv # lost over function invoke?
  if argc==1 goto done

  varname = argv[1]

  # Store the caught value in a 

  .local pmc __set
  __set = find_global "_Tcl", "__set"
  __set(varname,code_retval)

done:
  .return(retval)

badargs:
  .throw ("wrong # args: should be \"catch script ?resultVarName? ?optionVarName?\"")

.end
