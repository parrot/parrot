.namespace [ "_Tcl::builtins" ]

.sub "pwd"
  .param int register_num
  .param pmc argv

  .local string pir_code
  .local int argc 
  argc = argv

  if argc == 0 goto noargs

  pir_code = ".throw ('wrong # args: should be \"pwd\"')\n"
  .return(register_num,pir_code)

noargs:
  pir_code = "$P"
  $S1 = register_num
  pir_code .= $S1
  pir_code .= " = new .OS\n$P"
  pir_code .= $S1
  pir_code .= " = $P"
  pir_code .= $S1
  pir_code .= '."cwd"()'
  pir_code .= "\n"

  .return(register_num,pir_code)

.end
