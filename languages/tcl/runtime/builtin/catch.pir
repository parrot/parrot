###
# [catch]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub "&catch"
  .param pmc argv :slurpy
 
  .local int argc 
  argc = argv

  .local int retval
  .local pmc code_retval,compiler,pir_compiler
  .local string varname,sigil_varname,code

  .get_from_HLL(compiler, '_tcl', 'compile')
  .get_from_HLL(pir_compiler, '_tcl', 'pir_compiler')

  if argc == 0 goto badargs
  if argc  > 2 goto badargs

  code = argv[0]
  ($I0,$P1) = compiler(0,code)
  $P2 = pir_compiler($I0,$P1)
  
  push_eh non_ok
    code_retval = $P2()
    retval = TCL_OK  # no exception => TCL_OK
  clear_eh

  goto got_retval

non_ok:
  .catch()
  .get_return_code(retval)
  .get_message(code_retval)

got_retval:
  #argc = argv # lost over function invoke?
  if argc==1 goto done

  varname = argv[1]

  # Store the caught value in a 

  .local pmc __set
  .get_from_HLL(__set, '_tcl', '__set')
  __set(varname,code_retval)

done:
  .return(retval)

badargs:
  .throw ("wrong # args: should be \"catch script ?resultVarName? ?optionVarName?\"")

.end
