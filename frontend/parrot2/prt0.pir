
.sub '__PARROT_ENTRY_MAIN__' :anon :main
    .param pmc sys_args
    .param pmc prog_args

    # Set up the top-level exception handler of last resort
    push_eh __top_level_handler

    # Dig through the system arguments, setting up the interp
    .local pmc sys_args_iter, packfile_pmc, pir_compiler
    .local string exe_name, prog_name, sys_arg, output_file

    pir_compiler = compreg "PIR"
    prog_name = prog_args[0]
    exe_name = shift sys_args
    sys_args_iter = iter sys_args
  __sys_args_parse_top:
    unless sys_args_iter goto __sys_args_parse_end
    sys_arg = shift sys_args_iter

    if sys_arg == "-o" goto __setup_output_file
    if sys_arg == "-r" goto __setup_compile_run_from_file
    if sys_arg == "-c" goto __compile_to_file
    if sys_arg == "-E" goto __preprocess_only


  __setup_output_file:
    output_file = shift sys_args_iter
    goto __sys_args_parse_top

  __setup_compile_run_from_file:
    output_file = '__get_temporary_output_file'(prog_name)
    packfile_pmc = pir_compiler.'compile_file'(prog_name)
    packfile_pmc.'write_to_file'(output_file)
    packfile_pmc = new ['PackfileView']
    packfile_pmc.'read_from_file'(output_file)

  __compile_to_file:
    packfile_pmc = pir_compiler.'compile_file'(prog_name)
    goto __sys_args_parse_top

  __preprocess_only:
    pir_compiler.'preprocess'(prog_name)
    pop_eh
    exit 0

  __sys_args_parse_bottom:
    unless null packfile_pmc goto __have_packfile_pmc
    packfile_pmc = '__default_get_packfile'(prog_name)

  __have_packfile_pmc:
    unless null output_file goto __run_packfile
    packfile_pmc.'write_to_file'(output_file)
    pop_eh
    exit 0

  __run_packfile:
    .local pmc main_sub
    '__init_packfile'(packfile_pmc)
    main_sub = packfile_pmc.'main_sub'()
    main_sub(args)
    pop_eh
    exit 0

  __top_level_handler:
    # Something bad happened. This is the top-level error handler of last
    # resort. If we got there, the user program threw an unhandled exception
    .local pmc e
    .get_results(e)
    finalize e
    pop_eh
    '__handle_error_and_exit'(e)
.end

.sub '__compile_or_load' :anon
    .param string filename
    .local string extension
    .local pmc packfile

    $I0 = length filename
    $I0 -= 4
    extension = substr filename, $I0
    if extension == ".pir" goto have_pir_file
    if extension == ".pbc" goto have_pbc_file
    die "Cannot figure out what kind of file it is"

  have_pir_file:
    .local pmc pir_compiler
    pir_compiler = compreg "PIR"
    packfile = pir_compiler.'compile_file'(filename)
    .return(packfile)

  have_pbc_file:
    packfile = new 'PackfileView'
    packfile.'read_from_file'(filename)
    .return(packfile)
.end

.sub '__init_packfile' :anon
    .param pmc packfile
    .local pmc init_subs, sub_iter, sub
    init_subs = packfile.'subs_by_id'("init")
    sub_iter = iter init_subs
  init_loop_top:
    unless sub_iter goto init_loop_bottom
    sub = shift sub_iter
    sub()
    goto init_loop_top
  init_loop_bottom:
.end

.sub '__get_main' :anon
    .param pmc packfile
    .local pmc main_sub
    main_sub = packfile.'main_sub'()
    return main_sub
.end

.sub '__handle_error_and_exit' :anon
    .param pmc exception
.end
