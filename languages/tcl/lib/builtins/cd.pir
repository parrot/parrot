.namespace [ "_Tcl::builtins" ]

.sub "cd"
  .param int register_num
  .param pmc argv

  .local string pir_code,temp_code
  .local int argc,directory_num,result_num
  argc = argv
  directory_num = 0

  .local pmc compiler
  compiler = find_global "_Tcl", "compile_dispatch"

  if argc == 0 goto noargs
  if argc == 1 goto got_dir

  pir_code = ".throw ('wrong # args: should be \"cd\ ?dirName?\"')\n"
  .return(register_num,pir_code)

got_dir:
  $P1 = argv[0]
  (directory_num,temp_code) = compiler(register_num,$P1)
  register_num = directory_num + 1
  pir_code .= temp_code
  goto cd_it

noargs: 
  pir_code .= "$P"
  $S1 = register_num
  pir_code .= $S1
  pir_code .= "= new .Env\n"
  directory_num = register_num + 1
  $S2 = directory_num
  pir_code .= "$P"
  pir_code .= $S2
  pir_code .= "= $P"
  pir_code .= $S1
  pir_code .= "['HOME']\n"
  register_num = directory_num + 1

cd_it:
  pir_code .= "$P"
  $S1 = register_num
  pir_code .= $S1
  pir_code .= " = new .OS\n"
  pir_code .= "$P"
  result_num = register_num + 1
  $S2 = result_num
  pir_code .= $S2
  pir_code .= " = $P"
  pir_code .= $S1
  pir_code .= '."cd"($P'
  $S2 = directory_num
  pir_code .= $S2
  pir_code .= ")\n"

  .return(result_num,pir_code)

.end
