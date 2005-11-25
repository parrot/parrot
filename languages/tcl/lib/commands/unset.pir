###
# [unset]

.namespace [ "Tcl" ]

.sub "&unset"
  .param pmc argv :slurpy

  # For now, pretend the usage is "unset <foo>"

  .local int argc
  argc = argv

  .local string varname,sigil_varname
  varname = argv[0]
  sigil_varname = "$" . varname

  .local int call_level
  $P0 = find_global "_Tcl", "call_level"
  call_level = $P0
  .local pmc find_var, found_var
  find_var = find_global "_Tcl", "__find_var"
  found_var = find_var(varname)
  if_null found_var, error

  null found_var
  if call_level == 0 goto remove_global
  store_lex sigil_varname, found_var
  .return ("") 

remove_global:
  store_global "Tcl", sigil_varname, found_var
  .return ("") 

error:
  $S0 = "can't unset \""
  $S0 .= varname
  $S0 .= "\": no such variable"
  .throw ($S0)

catch:
###  goto resume   XXX no such label
.end
