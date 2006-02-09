###
# [eval]

#
# eval arg [... arg arg]

.namespace [ "Tcl" ]

.sub "&eval"
  .param pmc argv :slurpy
 
  .local string expr
  .local int argc
  argc = argv
  unless argc goto no_args
 
  .local int looper
 
  .local pmc compiler,pir_compiler
  compiler = find_global "_Tcl", "compile"
  pir_compiler = find_global "_Tcl", "pir_compiler"

  expr = ""
  looper = 0

loop:
  if looper == argc goto loop_done
  $S0 = argv[looper]
  concat expr, $S0
  inc looper
  if looper == argc goto loop_done
  concat expr," "

  goto loop

loop_done:
  ($I0,$P1) = compiler(0,expr)
  $P2 = pir_compiler($I0,$P1) 
  .return $P2()

no_args:
  .throw("wrong # args: should be \"eval arg ?arg ...?\"")

.end
