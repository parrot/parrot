.namespace [ "_Tcl::builtins" ]

.sub "continue"
  .param int register_num
  .param pmc argv

  .local string pir_code

  .local int argc
  argc = argv

  if argc != 0 goto badargs
  pir_code = ".tcl_continue()\n"
  .return(register_num,pir_code)

badargs:
  pir_code =<<"END_PIR"
.throw(\"wrong # args: should be \\\"continue\\\"\")
END_PIR

  .return(register_num,pir_code)
.end
