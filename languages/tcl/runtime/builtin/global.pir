###
# [global]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&global'
  .param pmc argv :slurpy

  .local int argc 
  argc = argv

  if argc == 0 goto badargs

  .local int call_level
  $P0 = get_root_global ['_tcl'], 'call_level'
  call_level = $P0
  unless call_level goto done # global doesn't work when already global.

  .local int ii
  ii = 0
  .local string varname
  .local string sigil_varname

loop:
  if ii == argc goto done
  varname = argv[ii]
  sigil_varname = '$' . varname

  push_eh next
    $P1 = find_global sigil_varname
  clear_eh

  .local pmc call_chain, lexpad
  call_chain = get_root_global ['_tcl'], 'call_chain'
  lexpad     = call_chain[-1]
  lexpad[sigil_varname] = $P1

next:
  inc ii
  goto loop
  
done:
  .return('')

badargs:
  .throw('wrong # args: should be "global varName ?varName ...?"')
.end
