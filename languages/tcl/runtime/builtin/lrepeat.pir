##
# [lrepeat]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&lrepeat'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  .local int count
  $P0   = argv[0]
  count = __integer($P0)

  if count < 1 goto must_have_count
   
  # convert the Array ireturned by foldup into a TclList.
  .local pmc retval
  retval = new .TclList
 
  .local int i_cnt
  .local int o_cnt

  o_cnt = 1
OUTER_LOOP:
  if o_cnt > count goto OUTER_DONE
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

must_have_count:
  tcl_error 'must have a count of at least 1'

bad_args:
  tcl_error 'wrong # args: should be "lrepeat positiveCount value ?value ...?"'
.end
