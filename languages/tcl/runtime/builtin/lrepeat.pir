##
# [lrepeat]

.namespace [ "Tcl" ]

.sub "&lrepeat"
  .param pmc argv :slurpy

  # XXX Need error handling

  .local int repeater # I hardly know 'er.
  repeater = argv[0] 
   
  # convert the Array ireturned by foldup into a TclList.

  .local int argc
  argc = argv
 
  .local pmc retval
  retval = new .TclList
 
  .local int i_cnt
  .local int o_cnt

  o_cnt = 1
OUTER_LOOP:
  if o_cnt > repeater goto OUTER_DONE
  i_cnt = 1
INNER_LOOP:
  if i_cnt >= argc goto INNER_DONE
  $P0 = argv[i_cnt]
  push retval, $P0
  inc i_cnt
  goto INNER_LOOP
INNER_DONE: 
  inc o_cnt
  goto OUTER_LOOP
OUTER_DONE:

  .return(retval)
.end
