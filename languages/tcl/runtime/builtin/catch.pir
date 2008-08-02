.HLL 'Tcl', ''
.namespace []

.sub '&catch'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  .local int retval
  .local pmc code_retval, ns
  .local string varname,sigil_varname,code
  $P0 = getinterp
  ns = $P0['namespace'; 1]

  .local pmc compileTcl
  compileTcl = get_root_global ['_tcl'], 'compileTcl'

  if argc == 0 goto bad_args
  if argc  > 3 goto bad_args

  code = argv[0]
  push_eh non_ok
    $P2 = compileTcl(code, 'ns' => ns)
    code_retval = $P2()
    retval = .CONTROL_OK
  pop_eh

  goto got_retval

non_ok:
  .catch()
  .get_return_code(retval)
  .get_message(code_retval)

got_retval:
  if argc == 1 goto handle_retval

  varname = argv[1]

  # Store the caught value in a

  .local pmc setVar
  setVar = get_root_global ['_tcl'], 'setVar'
  setVar(varname,code_retval)

handle_retval:
  # We need to convert the code
  if retval != .CONTROL_OK goto handle_error
  retval = .TCL_OK
  goto done
handle_error:
  if retval != .CONTROL_ERROR goto handle_return
  retval = .TCL_ERROR
  goto done
handle_return:
  if retval != .CONTROL_RETURN goto handle_break
  retval = .TCL_RETURN
  goto done
handle_break:
  if retval != .CONTROL_BREAK goto handle_continue
  retval = .TCL_BREAK
  goto done
handle_continue:
  retval = .TCL_CONTINUE

done:
  .return(retval)

bad_args:
  die 'wrong # args: should be "catch script ?resultVarName? ?optionVarName?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
