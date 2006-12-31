.HLL 'Tcl', 'tcl_group'
.namespace

# RT#40699: this is only a stub

.sub '&lsearch'
  .param pmc argv :slurpy

  .local string option, element
  .local pmc list, __list

  __list = get_root_global [ '_tcl' ] , '__list'

  option  = shift argv #ignore, assume -exact
  if option == '-exact' goto got_option
  unshift argv, option

got_option:
  list    = shift argv
  list = __list(list)
  element = shift argv

  .local pmc iter
  iter = new .Iterator, list 
  .local int pos, match
  match = -1 
  pos = 0  
 
loop:
  unless iter goto loop_done
  $S0 = shift iter 
  if $S0 != element goto next
  match = pos  
  goto loop_done
next: 
  inc pos
  goto loop
loop_done:

  .return (match)
.end
