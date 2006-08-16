###
# [return]

.HLL '_Tcl', ''
.namespace [ 'builtins' ]

.sub 'return'
  .param int register_num
  .param pmc raw_args
  .param pmc argv

  .local string pir_code
  .local int argc 
  argc = argv

  if argc == 0 goto noargs
  if argc == 1 goto onearg

  pir_code = "tcl_error \"XXX: bad call to return\"\n"
  .return(register_num,pir_code)

onearg:
  pir_code = "tcl_return "
  $S1 = argv[0]
  pir_code.= $S1
  pir_code.= "\n"
  .return(register_num,pir_code)

noargs:
  pir_code = "tcl_return \"\"\n"
  .return(register_num,pir_code)
.end
