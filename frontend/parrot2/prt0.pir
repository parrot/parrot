
.sub '__PARROT_ENTRY_MAIN__' :anon :main
    .param pmc args

    push_eh __top_level_handler

    .local string program_name
    .local pmc program_pbc, main_sub
    program_name = shift args
    program_pbc = '__compile_or_load'(program_name)
    '__init_packfile'(program_pbc)
    main_sub = '__get_main'(program_pbc)

    # Here we go!
    main_sub(args)

    # Normal Exit
    pop_eh
    exit 0

    # Something bad happened. This is the top-level error handler of last
    # resort. If we got there, the user program threw an unhandled exception
  __top_level_handler:
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
