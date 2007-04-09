.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&regsub'
  .param pmc argv :slurpy
 
  .local int argc
  argc = elements argv 
  if argc < 3 goto badargs

  .local string expression, target, subSpec, original_target
 
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
  original_target = target
  subSpec    = shift argv
 
  .local pmc tclARE # RT#40774: for now, just use P5 regexen
  tclARE = compreg 'PGE::P5Regex'
  $I0 = exists switches['nocase']
  unless $I0 goto ready
  expression = downcase expression
  target = downcase target

ready:
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
  replStr .= '\'
  goto emit_char

emit_0:
  $I0 = match.'from'()
  $I1 = match.'to'()
  $I1 -= $I0
  $S0 = substr original_target, $I0, $I1
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
  $P0 = matches[char]
  $I0 = $P0.'from'()
  $I1 = $P0.'to'()
  $I1 -= $I0
  $S0 = substr original_target, $I0, $I1
  replStr .= $S0
  inc pos
  goto loop

loop_done:

  substr original_target, from, match_len, replStr

  argc = elements argv
  unless argc goto return_it
  .local pmc __set
  __set = get_root_global [ '_tcl' ], '__set'
  .local string varName
  varName = shift argv
  __set (varName, original_target)
  
  .return(1)  # XXX fix this when we support multiple replacements

return_it:
match_failed:
  .return (original_target)

badargs:
  tcl_error 'wrong # args: should be "regsub ?switches? exp string subSpec ?varName?"'

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
