.namespace [ "_Tcl::builtins" ]

.sub "incr"
  .param int register_num
  .param pmc argv

  .local string pir_code,temp_code
  pir_code = ""
  temp_code = ""

  .local int argc
  argc = argv
  if argc == 0 goto error
  if argc >  2 goto error

  .local pmc compiler
  compiler = find_global "_Tcl", "compile"

  .local int value_num,increment_num
  .local pmc value,increment

  if argc == 2 goto got_increment
  value     = argv[0]

  (value_num,temp_code) = compiler(value,register_num)
  pir_code .= temp_code
  register_num = value_num + 1
  pir_code .= ".local pmc read,set,number\nread=find_global \"_Tcl\", \"__read\"\n"
  pir_code .= "number=find_global \"_Tcl\", \"__number\"\n"
  pir_code .= "set=find_global \"_Tcl\", \"__set\"\n$P"
  $S0 = register_num
  pir_code .= $S0
  pir_code .= "=read($P"
  $S0 = value_num
  pir_code .= $S0
  pir_code .= ")\n$P"
  $S0 = register_num
  pir_code .= $S0
  pir_code .= "=number($P"
  pir_code .= $S0
  pir_code .= ")\n"

  $S0 = register_num
  pir_code .= "inc $P"
  pir_code .= $S0
  pir_code .= "\nset($P"
  $S0 = value_num
  pir_code .= $S0
  pir_code .= ",$P"
  $S0 = register_num
  pir_code .= $S0
  pir_code .= ")\n"
  .return (register_num,pir_code)

got_increment:
  value     = argv[0]
  increment = argv[1]

  (increment_num,temp_code) = compiler(increment,register_num)
  register_num = increment_num + 1 
  pir_code .= temp_code
  (value_num,temp_code) = compiler(value,register_num)
  pir_code .= temp_code
  register_num = value_num + 1
  pir_code .= ".local pmc read,set,number\nread=find_global \"_Tcl\", \"__read\"\n"
  pir_code .= "number=find_global \"_Tcl\", \"__number\"\n"
  pir_code .= "set=find_global \"_Tcl\", \"__set\"\n$P"
  $S0 = register_num
  pir_code .= $S0
  pir_code .= "=read($P"
  $S0 = value_num
  pir_code .= $S0
  pir_code .= ")\n$P"
  $S0 = register_num
  pir_code .= $S0
  pir_code .= "=number($P"
  pir_code .= $S0
  pir_code .= ")\n$P"
  $S0 = increment_num
  pir_code .= $S0
  pir_code .= "=number($P"
  pir_code .= $S0
  pir_code .= ")\n"

  $S0 = register_num
  pir_code .= "$P"
  pir_code .= $S0
  pir_code .= "=$P"
  pir_code .= $S0
  pir_code .= "+$P"
  $S0 = increment_num
  pir_code .= $S0
  pir_code .= "\nset($P"
  $S0 = value_num
  pir_code .= $S0
  pir_code .= ",$P"
  $S0 = register_num
  pir_code .= $S0
  pir_code .= ")\n"
  .return (register_num,pir_code)

error:
  pir_code = ".throw (\"wrong # args: should be \\\"incr varName ?increment?\\\"\")\n"
  .return (register_num,pir_code)
.end
