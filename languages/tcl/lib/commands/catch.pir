###
# [catch]

.namespace [ "Tcl" ]

.sub "&catch"
  .local pmc argv
  argv = foldup
 
  .local int argc 
  argc = argv

  .local int return_type
  .local pmc retval
  .local string varname,sigil_varname
  .local string code
  .local pmc parse
  .local pmc interpret
  return_type = TCL_OK
  parse = find_global "_Tcl", "parse"
  interpret = find_global "_Tcl", "__interpret"

  .local int call_level
  $P0 = find_global "_Tcl", "call_level"
  call_level = $P0

  if argc == 0 goto badargs
  if argc  > 2 goto badargs
  code = argv[0]
  $P1 = parse(code)
  register $P1
  # ignoring $P0 here.
  ($I0,$P0) = interpret($P1)
  retval = new Integer
  retval = $I0

  if argc==1 goto done
  # XXX This should probably use the "set" command for better
  # error handling on bad var names.

  #.local pmc set_sub
  #.local int set_return_type
  #.local pmc set_retval
  #set_sub = find_global "Tcl", "_set"
  #(set_return_type,set_retval) = set_sub(varname,$P0)
  #if set_return_type != TCL_OK goto done
  #return_type = TCL_OK
 
  varname = argv[1]
  sigil_varname = "$" . varname

if call_level goto save_lex
  store_global "Tcl", sigil_varname, $P0
  goto done
save_lex:
  store_lex call_level, sigil_varname, $P0
  goto done

badargs:
  return_type = TCL_ERROR
  retval = new String
  retval = "wrong # args: should be \"catch script ?resultVarName? ?optionVarName?\""

done:
  .return(return_type,retval)
.end
