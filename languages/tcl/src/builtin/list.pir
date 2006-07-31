.HLL '_Tcl', ''
.namespace [ 'builtins' ]

.sub 'list'
    .param int register_num
    .param pmc argv

    .local string pir_code,temp_code
    .local int argc
    argc = argv

    .local pmc compiler
    compiler = get_root_global ['_tcl'], 'compile_dispatch'

    # generate code to allocate the list
    .local int    list_register
    .local string list_register_str
    list_register = register_num
    inc register_num
    pir_code = "    $P"
    list_register_str = list_register
    pir_code .= list_register_str
    pir_code .= " = new 'TclList'\n"

    # handle all the list elements
    .local int arg_num
    arg_num = 0
    .local int temp_num
    temp_num = list_register + 1
  arg_loop:  
    if arg_num >= argc goto end_loop 
    $P1 = argv[arg_num]
    (temp_num,temp_code) = compiler(register_num,$P1)
    pir_code .= temp_code
    pir_code .= "    $P"
    pir_code .= list_register_str  
    pir_code .= "["
    $S0 = arg_num
    pir_code .= $S0
    pir_code .= "] = $P"
    $S0 = temp_num
    pir_code .= $S0
    pir_code .= "\n"
    inc temp_num

    inc arg_num
    goto arg_loop
  end_loop:

    # This is kind of lame - reassign the tcllist to a new register
    # so we can have "result goes in highest number register" with the
    # minimum amount of work.
    
    # temp_num is a bad name, but it contains the information we need. 
    pir_code .= "    $P"
    $S0 = temp_num
    pir_code .= $S0
    pir_code .= " = $P"
    pir_code .= list_register_str
    pir_code .= "\n"

    .return(temp_num,pir_code)
.end
