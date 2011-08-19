.include "iglobals.pasm"

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
    .local pmc sys_args_iter, packfile_pmc, pir_compiler, interp
    .local string exe_name, prog_name, sys_arg, output_file
    .local int input_file_type

    interp = getinterp

    pir_compiler = compreg "PIR"
    prog_name = prog_args[0]
    input_file_type = '__get_input_file_type'(prog_name)
    output_file = null

    unless input_file_type == 0 goto __have_valid_input_file
    $S0 = "Invalid file type "
    $S0 .= prog_name
    '__usage_and_exit'($S0)

  __have_valid_input_file:
    exe_name = shift sys_args
    $P0 = box exe_name
    interp[.IGLOBALS_EXECUTABLE] = $P0

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
    pop_eh
    '__usage_and_exit'()

  __show_version:
    pop_eh
    '__show_version_and_exit'()

  __show_help:
    pop_eh
    '__show_help_and_exit'()

  __setup_output_file:
    output_file = shift sys_args_iter
    goto __sys_args_parse_top

  __setup_compile_run_from_file:
    output_file = '__get_temporary_output_file'(prog_name)
    packfile_pmc = pir_compiler.'compile_file'(prog_name)
    packfile_pmc.'write_to_file'(output_file)
    packfile_pmc = new ['PackfileView']
    packfile_pmc.'read_from_file'(output_file)
    output_file = null

  __force_pbc_file:
    input_file_type = PBC_FILE
    goto __sys_args_parse_top

  __preprocess_only:
    pir_compiler.'preprocess'(prog_name)
    pop_eh
    exit 0

  __sys_args_parse_end:
    unless null packfile_pmc goto __have_packfile_pmc
    if null prog_name goto __no_input_file
    packfile_pmc = '__default_get_packfile'(prog_name, input_file_type, pir_compiler)
    goto __have_packfile_pmc

  __no_input_file:
    pop_eh
    '__usage_and_exit'("Missing program name")

  __have_packfile_pmc:
    if null output_file goto __run_packfile
    packfile_pmc.'write_to_file'(output_file)
    pop_eh
    exit 0

  __run_packfile:
    .local pmc main_sub
    '__init_packfile'(packfile_pmc)
    main_sub = packfile_pmc.'main_sub'()
    .tailcall main_sub(prog_args)

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
    .local pmc pasm_compiler
    pasm_compiler = compreg "PASM"
    packfile_pmc = pasm_compiler.'compile_file'(file_name)
    .return(packfile_pmc)

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
    $I0 -= 1
    ext = substr file_name, $I0
    if ext == ".pasm" goto __have_pasm_file
    # By default, it's a pir file
    goto __have_pir_file

  __have_pir_file:
    .return(PIR_FILE)
  __have_pbc_file:
    .return(PBC_FILE)
  __have_pasm_file:
    .return(PASM_FILE)
.end

.sub '__init_packfile' :anon
    .param pmc packfile
    .local pmc init_subs, sub_iter, sub
    init_subs = packfile.'subs_by_flag'("init")
    sub_iter = iter init_subs
  init_loop_top:
    unless sub_iter goto init_loop_bottom
    sub = shift sub_iter
    sub()
    goto init_loop_top
  init_loop_bottom:
.end

.include "except_severity.pasm"
.sub '__handle_error_and_exit' :anon
    .param pmc exception
    .local pmc bts, bts_iter, stderr_pmc, interp, line_iter
    .local string message
    .local int severity, exit_code

    severity = exception["severity"]
    if severity == .EXCEPT_EXIT goto __direct_exit

    interp = getinterp
    stderr_pmc = interp.'stderr_handle'()
    message = exception["message"]
    stderr_pmc.'print'(message)
    stderr_pmc.'print'("\n")

    bts = exception.'backtrace_strings'()
    bts_iter = iter bts
    $S1 = ""
  __backtrace_loop_top:
    unless bts_iter goto __backtrace_loop_bottom
    stderr_pmc.'print'($S1)

    $S0 = shift bts_iter
    $P0 = split "\n", $S0
    line_iter = iter $P0
  __line_loop_top:
    unless line_iter goto __line_loop_bottom
    $S0 = shift line_iter
    $I0 = index $S0, "frontend/parrot2/prt0"
    unless $I0 == -1 goto __line_loop_top
    stderr_pmc.'print'($S1)
    stderr_pmc.'print'($S0)
    $S1 = "\n"
    goto __line_loop_top
  __line_loop_bottom:

    goto __backtrace_loop_top
  __backtrace_loop_bottom:

    exit_code = exception["exit_code"]
    unless exit_code == 0 goto __really_exit
    exit_code = 1
  __really_exit:
    exit exit_code

  __direct_exit:
    exit_code = exception["exit_code"]
    exit exit_code
.end

.sub '__show_version_and_exit'
    .local pmc interp, config
    .local string version_str, devel_str, cpuarch_str, platform_str
    interp = getinterp
    config = interp[.IGLOBALS_CONFIG_HASH]
    version_str = config["VERSION"]
    devel_str = config["DEVEL"]
    cpuarch_str = config["cpuarch"]
    platform_str = config["platform"]
    $S0 = <<'END_OF_VERSION'
This is Parrot version %s%s built for %s-%s
Copyright (C) 2001-2011, Parrot Foundation.

This code is distributed under the terms of the Artistic License 2.0.
For more details, see the full text of the license in the LICENSE file
included in the Parrot source tree
END_OF_VERSION
    $P0 = new ['ResizableStringArray']
    $P0[0] = version_str
    $P0[1] = devel_str
    $P0[2] = cpuarch_str
    $P0[3] = platform_str
    $S1 = sprintf $S0, $P0
    say $S1

    exit 0
.end

.sub '__show_help_and_exit'
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

    exit 0
.end

.sub '__get_temporary_output_file'
    .param string infile
    # TODO
.end

.sub '__usage_and_exit'
    .param string msg :optional
    .param int has_msg :opt_flag
    $P0 = getinterp
    $P1 = $P0.'stderr_handle'()
    unless has_msg goto __print_usage
    $P1.'print'(msg)
    $P1.'print'("\n")
  __print_usage:
    $P1.'print'("parrot -[acEGhrtvVwy.] [-d [FLAGS]] [-D [FLAGS]] ")
    $P1.'print'("[-O [level]] [-[LIX] path] [-R runcore] [-o FILE] <file> <args>\n")

    exit 1
.end
