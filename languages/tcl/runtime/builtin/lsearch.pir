.HLL 'Tcl', 'tcl_group'
.namespace

# RT#40699: this is only a stub

.sub '&lsearch'
  .param pmc argv :slurpy

  .local pmc options
  options = new .ResizablePMCArray
  push options, 'all'
  push options, 'ascii'
  push options, 'decreasing'
  push options, 'dictionary'
  push options, 'exact'
  push options, 'glob'
  push options, 'increasing'
  push options, 'index'
  push options, 'inline'
  push options, 'integer'
  push options, 'nocase'
  push options, 'not'
  push options, 'real'
  push options, 'regexp'
  push options, 'sorted'
  push options, 'start'
  push options, 'subindices'

  .local pmc select_switches, switches
  select_switches  = get_root_global ['_tcl'], 'select_switches'
  switches = select_switches(options, argv, 0, 1, 'option')

  .local int argc
  argc = elements argv

  if argc != 2 goto bad_args

  .local string option, pattern
  .local pmc list, __list

  __list = get_root_global [ '_tcl' ] , '__list'
  list    = shift argv
  list = __list(list)
  pattern = shift argv

  .local pmc iter
  iter = new .Iterator, list 

  .local int pos, result
  result = -1 
  pos = 0  

  .local int lc
  lc = exists switches['nocase']
  unless lc goto got_case
  pattern = downcase pattern

got_case:
  $I1 = exists switches['exact']
  if $I1 goto exact_loop
  $I1 = exists switches['regexp']
  if $I1 goto regexp_begin

glob_begin:
  .local pmc globber
  globber = compreg 'PGE::Glob'
  .local pmc rule, match
  rule = globber.'compile'(pattern)

glob_loop:
  unless iter goto done
  $S0 = shift iter 
  unless lc goto glob_match
  $S0 = downcase $S0
glob_match:
  match = rule($S0)
  unless match goto glob_next
  result = pos  
  goto done
glob_next: 
  inc pos
  goto glob_loop

regexp_begin: # very similar to glob_...
  .local pmc regexp
  regexp = compreg 'PGE::P5Regex'
  .local pmc rule, match
  rule = regexp(pattern)

regexp_loop:
  unless iter goto done
  $S0 = shift iter 
  unless lc goto regexp_match
  $S0 = downcase $S0
regexp_match:
  match = rule($S0)
  unless match goto regexp_next
  result = pos  
  goto done
regexp_next: 
  inc pos
  goto regexp_loop

exact_loop:
  unless iter goto done
  $S0 = shift iter 
  unless lc goto exact_match
  $S0 = downcase $S0
exact_match:
  if $S0 != pattern goto exact_next
  result = pos  
  goto done
exact_next: 
  inc pos
  goto exact_loop

done:
  .return (result)

bad_args:
  tcl_error 'wrong # args: should be "lsearch ?options? list pattern"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
