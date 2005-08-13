###
# [unset]

.namespace [ "Tcl" ]

.sub "&unset"
  .local pmc argv 
  argv = foldup

  # For now, pretend the usage is "unset <foo>"

  .local int argc
  argc = argv

  .local string varname,sigil_varname
  varname = argv[0]
  sigil_varname = "$" . varname

  .local pmc retval
  .local int return_type

  retval = new String
  retval = ""

  .local int call_level
  $P0 = find_global "_Tcl", "call_level"
  call_level = $P0

  .local pmc search_variable
  # XXX Should use get_var?
  push_eh catch
    if call_level goto get_lexical
    search_variable = find_global "Tcl", sigil_varname
    goto resume
get_lexical:
    search_variable = find_lex call_level, sigil_varname
resume:
  clear_eh

  if_null search_variable, error

  null search_variable

  if call_level goto set_lexical
  store_global "Tcl", sigil_varname, search_variable
  goto set_done
set_lexical:
  store_lex call_level, sigil_varname, search_variable
set_done:

  return_type=TCL_OK
  goto done

error:
  return_type = TCL_ERROR 
  $S0 = "can't unset \""
  $S0 .= varname
  $S0 .= "\": no such variable"
  retval = $S0

done:
  .return(return_type,retval) 

catch:
  goto resume
.end
