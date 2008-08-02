.HLL 'Tcl', ''
.namespace []

.sub '&while'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc != 2 goto bad_args
  # get necessary conversion subs
  .local pmc compileTcl
  compileTcl = get_root_global ['_tcl'], 'compileTcl'
  .local pmc compileExpr
  compileExpr = get_root_global ['_tcl'], 'compileExpr'
  .local pmc a_test
  a_test = argv[0]
  a_test = compileExpr(a_test)
  .local pmc a_command
  a_command = argv[1]
  a_command = compileTcl(a_command)
  .local pmc R
  .local pmc temp

  .local pmc toBoolean
  toBoolean = get_root_global ['_tcl'], 'toBoolean'
while_loop:
temp = a_test()
  $P0 = temp
  $I0 = toBoolean($P0)
  unless $I0 goto while_loop_done

  push_eh while_loop_exception
temp = a_command()
  pop_eh

  goto while_loop

while_loop_exception:
  .catch()
  .get_return_code($I0)
  if $I0 == .CONTROL_CONTINUE goto while_loop
  if $I0 == .CONTROL_BREAK    goto while_loop_done
  .rethrow()

while_loop_done:
  R = new 'TclString'
  R = ''
  .return(R)
bad_args:
  die 'wrong # args: should be "while test command"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
