.HLL '_Tcl', ''
.namespace [ 'builtins' ]

.sub 'list'
    .param string retval
    .param pmc    raw_args
    .param pmc    argv

    .local string pir_code,temp_code
    .local int argc
    argc = elements argv

    # generate code to allocate the list
    pir_code .= retval
    pir_code .= " = new 'TclList'\n"

    # handle all the list elements
    .local int arg_num
    arg_num = 0
  arg_loop:  
    if arg_num >= argc goto end_loop 
    $P1 = argv[arg_num]
    pir_code .= retval  
    pir_code .= '['
    $S0 = arg_num
    pir_code .= $S0
    pir_code .= '] = '
    $S0 = $P1
    pir_code .= $S0
    pir_code .= "\n"

    inc arg_num
    goto arg_loop
  end_loop:

    .return(pir_code)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
