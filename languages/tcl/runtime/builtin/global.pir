###
# [global]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&global'
  .param pmc argv :slurpy

  .local int argc 
  argc = argv

  if argc == 0 goto badargs

  .local pmc call_chain, lexpad
  .local int call_level
  call_chain = get_root_global ['_tcl'], 'call_chain'
  call_level = elements call_chain
  unless call_level goto done # global doesn't work when already global.
  lexpad = call_chain[-1]

  .local int ii
  ii = 0
  .local string varname
  .local string sigil_varname

loop:
  if ii == argc goto done
  varname = argv[ii]
  sigil_varname = '$' . varname

  push_eh create_global
    $P1 = get_hll_global sigil_varname
  clear_eh
has_global:
  lexpad[sigil_varname] = $P1
  inc ii
  goto loop

create_global:
  $P1 = new .Undef
  set_hll_global sigil_varname, $P1
  goto has_global
  
done:
  .return('')

badargs:
  .throw('wrong # args: should be "global varName ?varName ...?"')
.end
