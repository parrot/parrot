#
# [lset]
#

.namespace [ "Tcl" ]

.sub "&lset"
  .local pmc argv
  argv = foldup
  
  .local int return_type
  .local pmc retval
  
  $I0 = argv
  if $I0 < 2 goto wrong_args
  
  .local string name
  $P0  = argv[0]
  name = $P0
  
  .local pmc read, set
  read = find_global "_Tcl", "__read"
  set  = find_global "_Tcl", "__set"
  
  (return_type, retval) = read(name)
  if return_type == TCL_ERROR goto done
  
  .local int count
  count = argv
  if count == 2 goto replace
  $P0 = argv[1]
  $S0 = $P0
  if $S0 == "" goto replace

lset:
  .local pmc __list
  __list = find_global "_Tcl", "__list"
  (return_type, retval) = __list(retval)
  if return_type == TCL_ERROR goto done
  
  .local int i, end
  i   = 1
  end = count - 2
  .local pmc list
  list = retval
  
loop:
  if i >= end goto loop_done
  
  $I0 = argv[i]
  $P0 = list[$I0]
  (return_type, $P0) = __list($P0)
  if return_type == TCL_ERROR goto done
  list[$I0] = $P0
  list      = $P0
  
  inc i
  goto loop

loop_done:
  $I0 = argv[i]
  $P0 = argv[-1]
  list[$I0] = $P0
  (return_type, retval) = set(name, retval)
  goto done

wrong_args:
  return_type = TCL_ERROR
  retval = new TclString
  retval = "wrong # args: should be \"lset listVar index ?index...? value\""
  goto done

replace:
  $P0 = argv[-1]
  (return_type, retval) = set(name, $P0)
  # goto done

done:
  .return(return_type, retval)
.end
