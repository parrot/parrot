.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&regsub'
  .param pmc argv :slurpy
 
  .local int argc
  argc = elements argv 
  if argc < 3 goto badargs

  .local string expression, target, subSpec
 
  .local pmc options
  options = new .ResizablePMCArray
  push options, 'all'
  push options, 'nocase'
  push options, 'expanded' # RT#40774: use tcl-regexps
  push options, 'line'
  push options, 'linestop'
  push options, 'lineanchor'
  push options, 'start'

  .local pmc select_switches, switches
  select_switches  = get_root_global ['_tcl'], 'select_switches'
  switches = select_switches(options, argv, 1, 1)

  expression = shift argv
  target     = shift argv
  subSpec    = shift argv
 
  .local pmc tclARE # RT#40774: for now, just use P5 regexen
  tclARE = compreg 'PGE::P5Regex'

  .local pmc rule,match 
  rule = tclARE(expression)
  match = rule(target)
  unless match goto match_failed
 
  .local int from, to, match_len
  from = match.'from'()
  to   = match.'to'()
  match_len = to - from

  .local pmc matches
  matches = match.'get_array'() 

  # replace any special characters with the results of the match 
  .local int pos
  pos = 0
  .local string replStr
  replStr = ''
  .local int string_len, char
  string_len = length subSpec
loop:
  if pos >= string_len goto loop_done
  char = ord subSpec, pos
  if char == 92 goto handle_bs # handle backslash
  if char == 38 goto emit_0  # ampersand
emit_char:
  $S0 = chr char
  replStr .= $S0
  inc pos
  goto loop

emit_escaped_char:
  replStr .= "\\"
  goto emit_char

emit_0:
  $S0 = match
  replStr .= $S0
  inc pos 
  goto loop

handle_bs:
  inc pos
  if pos >= string_len goto emit_char
  char = ord subSpec, pos
  if char == 92 goto emit_char # backslash
  if char == 48 goto emit_0
  if char <  49 goto emit_escaped_char
  if char >  57 goto emit_escaped_char
  # handle \1 - \9
  char -= 49 # we're now an int from 0 to 8 (\1 -> 0, etc.)
  $S0 = matches[char]
  replStr .= $S0
  inc pos
  goto loop

loop_done:

 
  substr target, from, match_len, replStr

  argc = elements argv
  unless argc goto return_it
  .local pmc __set
  __set = get_root_global [ '_tcl' ], '__set'
  .local string varName
  varName = shift argv
  __set (varName, target)
  
  .return(1)  # XXX fix this when we support multiple replacements

return_it:
match_failed:
  .return (target)

badargs:
  tcl_error 'wrong # args: should be "regsub ?switches? exp string subSpec ?varName?"'

.end
