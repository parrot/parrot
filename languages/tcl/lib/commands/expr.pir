###
# [expr]

#
# expr arg [... arg arg]

.namespace [ "Tcl" ]

.sub "&expr"
  .param pmc argv :slurpy
 
  .local string expr
  .local int argc
  .local int looper

  .local pmc retval
  .local pmc expression_compiler,pir_compiler
  expression_compiler = find_global "_Tcl", "__expression_compile"
  pir_compiler = find_global "_Tcl", "pir_compiler"

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
  ($I0,$P1) = expression_compiler(0,expr)
  $P2 = pir_compiler($I0,$P1)
  .return $P2()

no_args:
  .throw("wrong # args: should be \"expr arg ?arg ...?\"")
.end
