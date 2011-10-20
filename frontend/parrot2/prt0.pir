# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ ]
# Constant NO_FILE evaluated at compile time
# Constant PASM_FILE evaluated at compile time
# Constant PIR_FILE evaluated at compile time
# Constant PBC_FILE evaluated at compile time
# Constant MODE_NORMAL evaluated at compile time
# Constant MODE_PREPROCESS evaluated at compile time
# Constant MODE_RUNFILE evaluated at compile time

.sub '__PARROT_ENTRY_MAIN__args' :subid('WSubId_7') :anon
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_5 = "WSubId_5"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
# exe_name: $S1
    null $S1
# pirop shift
    shift $S1, __ARG_1
# prog_name: $S2
    null $S2
# input_file_type: $I1
    null $I1
# output_file: $S3
    null $S3
# var packfile_pmc: $P1
    null $P1
# dummy: $S4
    null $S4
# mode: $I2
    null $I2
  __label_3: # while
# builtin elements
    elements $I3, __ARG_1
    le $I3, 0, __label_2
# {
# sys_arg: $S5
    $S5 = __ARG_1[0]
# switch
    set $S7, $S5
    set $S8, "-o"
    if $S7 == $S8 goto __label_6
    set $S8, "-c"
    if $S7 == $S8 goto __label_7
    set $S8, "-r"
    if $S7 == $S8 goto __label_8
    set $S8, "-E"
    if $S7 == $S8 goto __label_9
    set $S8, "-V"
    if $S7 == $S8 goto __label_10
    set $S8, "-h"
    if $S7 == $S8 goto __label_11
    goto __label_5
  __label_6: # case
# pirop shift
    shift $S4, __ARG_1
# pirop shift
    shift $S3, __ARG_1
    goto __label_4 # break
  __label_7: # case
# pirop shift
    shift $S4, __ARG_1
    set $I1, 3
    goto __label_4 # break
  __label_8: # case
# pirop shift
    shift $S4, __ARG_1
    set $I2, 2
    goto __label_4 # break
  __label_9: # case
# pirop shift
    shift $S4, __ARG_1
    set $I2, 1
    goto __label_4 # break
  __label_10: # case
    WSubId_1()
  __label_11: # case
    WSubId_2()
  __label_5: # default
    set $S2, $S5
    goto __label_1 # goto done_args
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # endwhile
  __label_1: # label done_args
    isnull $I3, $S2
    if $I3 goto __label_13
    iseq $I3, $S2, ""
  __label_13:
    unless $I3 goto __label_12
    WSubId_3("Missing program name")
  __label_12: # endif
    ne $I2, 1, __label_14
# {
# builtin compreg
    compreg $P3, "PIR"
    $P3.'preprocess'($S2)
# builtin exit
    exit 0
# }
  __label_14: # endif
    if $I1 goto __label_15
# {
    $P3 = WSubId_4($S2)
    set $I1, $P3
    if $I1 goto __label_16
    concat $S7, "Invalid file type ", $S2
    WSubId_3($S7)
  __label_16: # endif
# }
  __label_15: # endif
    ne $I2, 2, __label_17
# {
# temp_outfile: $S6
    $P3 = WSubId_5($S2)
    null $S6
    if_null $P3, __label_18
    set $S6, $P3
  __label_18:
# builtin compreg
    compreg $P3, "PIR"
    $P1 = $P3.'compile_file'($S2)
    $P1.'write_to_file'($S6)
    new $P1, [ 'PackfileView' ]
    $P1.'read_from_file'($S6)
# }
  __label_17: # endif
    unless_null $P1, __label_19
    $P1 = WSubId_6($S2, $I1)
  __label_19: # endif
    if_null $S3, __label_20
# {
    $P1.'write_to_file'($S3)
# builtin exit
    exit 0
# }
  __label_20: # endif
    $P3 = $P1.'subs_by_tag'("init")
    if_null $P3, __label_22
    iter $P4, $P3
    set $P4, 0
  __label_21: # for iteration
    unless $P4 goto __label_22
    shift $P2, $P4
    $P2()
    goto __label_21
  __label_22: # endfor
    .return($P1)
# }

.end # __PARROT_ENTRY_MAIN__args


.sub '__PARROT_ENTRY_MAIN__' :anon :main
        .param pmc __ARG_1
.const 'Sub' WSubId_7 = "WSubId_7"
.const 'Sub' WSubId_8 = "WSubId_8"
# Body
# {
# try: create handler
    new $P4, 'ExceptionHandler'
    set_label $P4, __label_1
    push_eh $P4
# try: begin
# {
# var packfile_pmc: $P1
    $P1 = WSubId_7(__ARG_1)
# var main_sub: $P2
    $P2 = $P1.'main_sub'()
    .tailcall $P2(__ARG_1)
# }
# try: end
    pop_eh
    goto __label_2
# catch
  __label_1:
    .get_results($P3)
    finalize $P3
    pop_eh
# {
    WSubId_8($P3)
# }
# catch end
  __label_2:
# }

.end # __PARROT_ENTRY_MAIN__


.sub '__default_get_packfile' :subid('WSubId_6') :anon
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
# switch
    set $I1, __ARG_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    set $I2, 1
    if $I1 == $I2 goto __label_4
    set $I2, 3
    if $I1 == $I2 goto __label_5
    goto __label_2
  __label_3: # case
# var pir_compiler: $P1
# builtin compreg
    compreg $P1, "PIR"
# var pf: $P2
    $P2 = $P1.'compile_file'(__ARG_1)
    .return($P2)
  __label_4: # case
# var pasm_compiler: $P3
# builtin compreg
    compreg $P3, "PASM"
    .tailcall $P3.'compile_file'(__ARG_1)
  __label_5: # case
# var packfile_pmc: $P4
    new $P4, [ 'PackfileView' ]
    $P4.'read_from_file'(__ARG_1)
    .return($P4)
  __label_2: # default
    null $P5
    .return($P5)
  __label_1: # switch end
# }

.end # __default_get_packfile


.sub '__get_input_file_type' :subid('WSubId_4') :anon
        .param string __ARG_1
# Body
# {
# len: $I1
# builtin length
    length $I2, __ARG_1
    sub $I1, $I2, 4
# ext: $S1
    lt $I1, 0, __label_2
# builtin substr
    substr $S1, __ARG_1, $I1
    goto __label_1
  __label_2:
    set $S1, ''
  __label_1:
    ne $S1, ".pir", __label_3
    .return(2)
  __label_3: # endif
    ne $S1, ".pbc", __label_4
    .return(3)
  __label_4: # endif
    le $I1, 0, __label_5
# {
    sub $I2, $I1, 1
# builtin substr
    substr $S1, __ARG_1, $I2
    ne $S1, ".pasm", __label_6
    .return(1)
  __label_6: # endif
# }
  __label_5: # endif
    .return(2)
# }

.end # __get_input_file_type


.sub '__handle_error_and_exit' :subid('WSubId_8') :anon
        .param pmc __ARG_1
# Body
# {
# severity: $I1
    getattribute $P4, __ARG_1, 'severity'
    set $I1, $P4
    ne $I1, 6, __label_1
    getattribute $P4, __ARG_1, 'exit_code'
    set $I4, $P4
# builtin exit
    exit $I4
  __label_1: # endif
# var stderr_pmc: $P1
# builtin getstderr
    getstderr $P1
# message: $S1
    getattribute $P4, __ARG_1, 'message'
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
    isnull $I4, $S1
    if $I4 goto __label_4
    iseq $I4, $S1, ""
  __label_4:
    unless $I4 goto __label_3
    set $S1, "No exception handler and no message"
  __label_3: # endif
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $S1
# builtin sprintf
    sprintf $S5, "%s\n", $P4
    $P1.'print'($S5)
# line_sep: $S2
    set $S2, ""
# var bts: $P2
    $P2 = __ARG_1.'backtrace_strings'()
# for loop
# i: $I2
# builtin elements
    elements $I4, $P2
    sub $I2, $I4, 1
  __label_7: # for condition
    lt $I2, 0, __label_6
# {
# bt: $S3
    $S3 = $P2[$I2]
# var lines: $P3
# builtin split
    split $P3, "\n", $S3
    if_null $P3, __label_9
    iter $P5, $P3
    set $P5, 0
  __label_8: # for iteration
    unless $P5 goto __label_9
    shift $S4, $P5
# {
# builtin indexof
    index $I4, $S4, "__PARROT_ENTRY_MAIN__"
    eq $I4, -1, __label_10
    goto __label_8 # continue
  __label_10: # endif
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 2
    $P4[0] = $S2
    $P4[1] = $S4
# builtin sprintf
    sprintf $S5, "%s%s", $P4
    $P1.'print'($S5)
    set $S2, "\n"
# }
    goto __label_8
  __label_9: # endfor
    set $S2, "\nthrown from\n"
# }
  __label_5: # for iteration
    set $I4, $I2
    dec $I2
    goto __label_7
  __label_6: # for end
# exit_code: $I3
    getattribute $P4, __ARG_1, 'exit_code'
    set $I3, $P4
    if $I3 goto __label_11
    set $I3, 1
  __label_11: # endif
# builtin exit
    exit $I3
# }

.end # __handle_error_and_exit


.sub '__show_version_and_exit' :subid('WSubId_1') :anon
# Body
# {
# var config: $P1
# builtin getinterp
    getinterp $P3
    $P1 = $P3[8]
# msg_fmt: $S1
    set $S1, "This is Parrot version %s%s built for %s-%s\nCopyright (C) 2001-2011, Parrot Foundation.\n\nThis code is distributed under the terms of the Artistic License 2.0.\nFor more details, see the full text of the license in the LICENSE file\nincluded in the Parrot source tree\n"
# var msg: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 4
    $P4 = $P1["VERSION"]
    $P3[0] = $P4
    $P5 = $P1["DEVEL"]
    $P3[1] = $P5
    $P6 = $P1["cpuarch"]
    $P3[2] = $P6
    $P7 = $P1["platform"]
    $P3[3] = $P7
# builtin sprintf
    sprintf $S2, $S1, $P3
    box $P2, $S2
# builtin say
    say $P2
# builtin exit
    exit 0
# }

.end # __show_version_and_exit


.sub '__show_help_and_exit' :subid('WSubId_2') :anon
# Body
# {
# msg: $S1
    set $S1, "parrot [Options] <file> [<program options...>]\n  Options:\n    -h --help\n    -V --version\n    -I --include add path to include search\n    -L --library add path to library search\n       --hash-seed F00F  specify hex value to use as hash seed\n    -X --dynext add path to dynamic extension search\n   <Run core options>\n    -R --runcore slow|bounds|fast|subprof\n    -R --runcore trace|profiling|gcdebug\n    -t --trace [flags]\n   <VM options>\n    -D --parrot-debug[=HEXFLAGS]\n       --help-debug\n    -w --warnings\n    -G --no-gc\n    -g --gc ms2|gms|ms|inf set GC type\n       <GC MS2 options>\n       --gc-dynamic-threshold=percentage    maximum memory wasted by GC\n       --gc-min-threshold=KB\n       <GC GMS options>\n       --gc-nursery-size=percent of sysmem  size of gen0 (default 2)\n       --gc-debug\n       --leak-test|--destroy-at-end\n    -. --wait    Read a keystroke before starting\n       --runtime-prefix\n   <Compiler options>\n    -d --imcc-debug[=HEXFLAGS]\n    -v --verbose\n    -E --pre-process-only\n    -o --output=FILE\n       --output-pbc\n    -O --optimize[=LEVEL]\n    -a --pasm\n    -c --pbc\n    -r --run-pbc\n    -y --yydebug\n   <Language options>\nsee docs/running.pod for more\n"
# builtin say
    say $S1
# builtin exit
    exit 0
# }

.end # __show_help_and_exit


.sub '__get_temporary_output_file' :subid('WSubId_5') :anon
        .param string __ARG_1
# Body
# {
    concat $S1, __ARG_1, ".pbc"
    .return($S1)
# }

.end # __get_temporary_output_file


.sub '__usage_and_exit' :subid('WSubId_3') :anon
        .param string __ARG_1 :optional
        .param int __ARG_2 :opt_flag
# Body
# {
# var stderr: $P1
# builtin getstderr
    getstderr $P1
    unless __ARG_2 goto __label_1
    concat $S1, __ARG_1, "\n"
    $P1.'print'($S1)
  __label_1: # endif
    $P1.'print'("parrot -[acEGhrtvVwy.] [-d [FLAGS]] [-D [FLAGS]] ")
    $P1.'print'("[-O [level]] [-[LIX] path] [-R runcore] [-o FILE] <file> <args>\n")
# builtin exit
    exit 1
# }

.end # __usage_and_exit

# End generated code
