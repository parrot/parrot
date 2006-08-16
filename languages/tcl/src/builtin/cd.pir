.HLL '_Tcl', ''
.namespace [ 'builtins' ]

.sub 'cd'
  .param int register_num
  .param pmc raw_args
  .param pmc argv

  .local string pir_code,temp_code
  .local int argc,directory_num,result_num
  argc = elements argv
  directory_num = 0

  .local string dir
  dir = ""

  if argc >= 2 goto bad_args
  if argc == 0 goto noargs
  
  dir = argv[0]
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
  dir = "$P" . $S2

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
  pir_code .= '."chdir"('
  pir_code .= dir
  pir_code .= ")\n"

  .return(result_num,pir_code)

bad_args:
  pir_code = "tcl_error 'wrong # args: should be \"cd\ ?dirName?\"'\n"
  .return(register_num,pir_code)
.end
