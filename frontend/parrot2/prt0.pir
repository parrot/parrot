.const int NO_FILE = 0
.const int PASM_FILE = 1
.const int PIR_FILE = 2
.const int PBC_FILE = 3

.sub '__PARROT_ENTRY_MAIN__' :anon :main
    .param pmc sys_args
    .param pmc prog_args

    # Set up the top-level exception handler of last resort
    push_eh __top_level_handler

    # Dig through the system arguments, setting up the interp
    .local pmc sys_args_iter, packfile_pmc, pir_compiler
    .local string exe_name, prog_name, sys_arg, output_file
    .local int input_file_type

    pir_compiler = compreg "PIR"
    prog_name = prog_args[0]
    input_file_type = '__get_input_file_type'(prog_name)
    unless input_file_type == 0 goto __have_valid_input_file
    die "Invalid file type"

  __have_valid_input_file:
    exe_name = shift sys_args
    sys_args_iter = iter sys_args
  __sys_args_parse_top:
    unless sys_args_iter goto __sys_args_parse_end
    sys_arg = shift sys_args_iter

    if sys_arg == '-V' goto __show_version
    if sys_arg == '-h' goto __show_help
    if sys_arg == "-o" goto __setup_output_file
    if sys_arg == "-r" goto __setup_compile_run_from_file
    if sys_arg == "-c" goto __force_pbc_file
    if sys_arg == "-E" goto __preprocess_only
    die "Unknown argument"

  __show_version:
    '__show_version'()
    pop_eh
    exit 1

  __show_help:
    '__show_help'()
    pop_eh
    exit 1

  __setup_output_file:
    output_file = shift sys_args_iter
    goto __sys_args_parse_top

  __setup_compile_run_from_file:
    output_file = '__get_temporary_output_file'(prog_name)
    packfile_pmc = pir_compiler.'compile_file'(prog_name)
    packfile_pmc.'write_to_file'(output_file)
    packfile_pmc = new ['PackfileView']
    packfile_pmc.'read_from_file'(output_file)

  __force_pbc_file:
    input_file_type = PBC_FILE
    goto __sys_args_parse_top

  __preprocess_only:
    pir_compiler.'preprocess'(prog_name)
    pop_eh
    exit 0

  __sys_args_parse_end:
    unless null packfile_pmc goto __have_packfile_pmc
    packfile_pmc = '__default_get_packfile'(prog_name, input_file_type, pir_compiler)

  __have_packfile_pmc:
    unless null output_file goto __run_packfile
    packfile_pmc.'write_to_file'(output_file)
    pop_eh
    exit 0

  __run_packfile:
    .local pmc main_sub
    '__init_packfile'(packfile_pmc)
    main_sub = packfile_pmc.'main_sub'()
    main_sub(prog_args)
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

.sub '__default_get_packfile' :anon
    .param string file_name
    .param int file_type
    .param pmc pir_compiler
    .local pmc packfile_pmc

    if file_type == PIR_FILE goto __compile_pir_file
    if file_type == PASM_FILE goto __compile_pasm_file
    if file_type == PBC_FILE goto __load_pbc_file
    $P0 = null
    .return($P0)

  __compile_pir_file:
    packfile_pmc = pir_compiler.'compile_file'(file_name)
    .return(packfile_pmc)

  __compile_pasm_file:
    # TODO
  __load_pbc_file:
    packfile_pmc = new ['PackfileView']
    packfile_pmc.'read_from_file'(file_name)
    .return(packfile_pmc)
.end

.sub '__get_input_file_type' :anon
    .param string file_name
    .local string ext

    $I0 = length file_name
    $I0 -= 4
    ext = substr file_name, $I0
    if ext == ".pir" goto __have_pir_file
    if ext == ".pbc" goto __have_pbc_file
    .return(NO_FILE)
  __have_pir_file:
    .return(PIR_FILE)
  __have_pbc_file:
    .return(PBC_FILE)
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

.sub '__handle_error_and_exit' :anon
    .param pmc exception
    .local pmc bts, bts_iter, stderr_pmc, interp
    .local string message
    interp = getinterp
    stderr_pmc = interp.'stderr_handle'()
    message = exception["message"]
    bts = exception.'backtrace_strings'()
    bts_iter = iter bts
  __backtrace_loop_top:
    unless bts_iter goto __backtrace_loop_bottom
    $S0 = shift bts_iter
    stderr_pmc.'print'($S0)
    stderr_pmc.'print'("\n")
    goto __backtrace_loop_top
  __backtrace_loop_bottom:
    .local int exit_code
    exit_code = exception["exit_code"]
    exit exit_code
.end

.sub '__show_version'
    .local pmc interp
    .local string version_str, archname_str
    # TODO: Get version_str and archname_str, probably from config
    $S0 = <<'END_OF_VERSION'
This is Parrot version %s built for %s
Copyright (C) 2001-2011, Parrot Foundation.

This code is distributed under the terms of the Artistic License 2.0.
For more details, see the full text of the license in the LICENSE file
included in the Parrot source tree
END_OF_VERSION
    $P0 = new ['ResizableStringArray']
    $P0[0] = version_str
    $P0[1] = archname_str
    $S1 = sprintf $S0, $P0
    say $S1
.end

.sub '__show_help'
    $S0 = <<'END_OF_HELP'
parrot [Options] <file> [<program options...>]
  Options:
    -h --help
    -V --version
    -I --include add path to include search
    -L --library add path to library search
       --hash-seed F00F  specify hex value to use as hash seed
    -X --dynext add path to dynamic extension search
   <Run core options>
    -R --runcore slow|bounds|fast
    -R --runcore trace|profiling|gcdebug
    -t --trace [flags]
   <VM options>
    -D --parrot-debug[=HEXFLAGS]
       --help-debug
    -w --warnings
    -G --no-gc
    -g --gc ms2|gms|ms|inf set GC type
       <GC MS2 options>
       --gc-dynamic-threshold=percentage    maximum memory wasted by GC
       --gc-min-threshold=KB
       <GC GMS options>
       --gc-nursery-size=percent of sysmem  size of gen0 (default 2)
       --gc-debug
       --leak-test|--destroy-at-end
    -. --wait    Read a keystroke before starting
       --runtime-prefix
   <Compiler options>
    -d --imcc-debug[=HEXFLAGS]
    -v --verbose
    -E --pre-process-only
    -o --output=FILE
       --output-pbc
    -O --optimize[=LEVEL]
    -a --pasm
    -c --pbc
    -r --run-pbc
    -y --yydebug
   <Language options>
see docs/running.pod for more
END_OF_HELP
    say $S0
.end
