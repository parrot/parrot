###
# [expr]

#
# expr arg [... arg arg]

.namespace [ "Tcl" ]

.sub "expr"
  .local pmc argv 
  argv = foldup
 
  .local string expr
  .local int argc
  .local int looper

  .local pmc retval
  .local int return_type
  return_type = TCL_OK
  .local pmc expression_p
  .local pmc expression_i
  expression_p = find_global "_Tcl", "__expression_parse"
  expression_i = find_global "_Tcl", "__expression_interpret"

  expr = ""
  looper = 0
  argc = argv 
  unless argc goto no_args

loop:
  if looper == argc goto loop_done
  $S0 = argv[looper]
  concat expr, $S0
  inc looper
  if looper == argc goto loop_done
  concat expr," "

  goto loop

loop_done:
  (return_type,retval) = expression_p(expr)
  if return_type==TCL_ERROR goto done
  (return_type,retval) = expression_i(retval) 
done:
  .return(return_type,retval)

no_args:
  retval = new String
  retval = "wrong # args: should be \"expr arg ?arg ...?\""
  .return(TCL_ERROR,retval)
.end
