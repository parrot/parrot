###
# [catch]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&catch'
  .param pmc argv :slurpy
 
  .local int argc 
  argc = elements argv

  .local int retval
  .local pmc code_retval, ns
  .local string varname,sigil_varname,code
  $P0 = getinterp
  ns = $P0['namespace'; 1]

  .local pmc __script
  __script = get_root_global ['_tcl'], '__script'

  if argc == 0 goto bad_args
  if argc  > 3 goto bad_args

  code = argv[0]
  push_eh non_ok
    $P2 = __script(code, 'ns' => ns)
    code_retval = $P2()
    retval = TCL_OK  # no exception => TCL_OK
  clear_eh

  goto got_retval

non_ok:
  .catch()
  .get_return_code(retval)
  .get_message(code_retval)

got_retval:
  if argc == 1 goto done

  varname = argv[1]

  # Store the caught value in a 

  .local pmc __set
  __set = get_root_global ['_tcl'], '__set'
  __set(varname,code_retval)

done:
  .return(retval)

bad_args:
  tcl_error 'wrong # args: should be "catch script ?resultVarName? ?optionVarName?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
