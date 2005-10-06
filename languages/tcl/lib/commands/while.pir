###
# [while]

.namespace [ "Tcl" ]

.sub "&while"
  .param pmc argv :slurpy
  .local int argc
  argc = argv

  if argc != 2 goto bad_args

  .local string condition,body
  condition = argv[0]
  body      = argv[1]

  .local pmc retval, compiled_code

  .local pmc compiler
  .local pmc expression_compiler, pir_compiler, compiled_condition

  compiler = find_global "_Tcl", "compile"
  expression_compiler = find_global "_Tcl", "__expression_compile"
  pir_compiler = find_global "_Tcl", "pir_compiler"

  ($I0,$P1) = compiler(0,body)
  compiled_code = pir_compiler($I0,$P1)
  ($I0,$P1) = expression_compiler(0,condition)
  compiled_condition = pir_compiler($I0,$P1)

while_loop:
  retval = compiled_condition()
  unless retval goto done
  push_eh handle_continue
    retval = compiled_code()
  clear_eh

  goto while_loop

handle_continue:
  .local int return_type
  .get_return_code(P5,return_type)
  if return_type == TCL_BREAK goto done
  if return_type == TCL_CONTINUE goto while_loop

done:
  .return("")

bad_args:
  .throw ("wrong # args: should be \"while test command\"")

.end
