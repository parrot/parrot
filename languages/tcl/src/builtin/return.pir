###
# [return]

.HLL '_Tcl', ''
.namespace [ 'builtins' ]

.sub 'return'
  .param int register_num
  .param pmc argv

  .local string pir_code
  .local int argc 
  argc = argv

  if argc == 0 goto noargs
  if argc == 1 goto onearg

  pir_code = ".throw (\"XXX: bad call to return\")\n"
  .return(register_num,pir_code)

onearg:
  .local string temp_code
  .local int value_num
  .local pmc compiler
  .get_from_HLL(compiler, '_tcl', 'compile_dispatch')

  $P0 = argv[0]
  (value_num, temp_code) = compiler(register_num, $P0)
  $S1 = value_num
  pir_code = temp_code
  pir_code.= ".tcl_return($P"
  pir_code.= $S1
  pir_code.= ")\n"
  .return(register_num,pir_code)

noargs:
  pir_code = ".tcl_return (\"\")\n"
  .return(register_num,pir_code)

.end
