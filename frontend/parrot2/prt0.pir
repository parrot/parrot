# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ ]
# Constant NO_FILE evaluated at compile time
# Constant PASM_FILE evaluated at compile time
# Constant PIR_FILE evaluated at compile time
# Constant PBC_FILE evaluated at compile time

.sub '__PARROT_ENTRY_MAIN__' :anon :main
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_5 = "WSubId_5"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
# var interp: $P1
# predefined getinterp
    getinterp $P1
# try: create handler
    new $P8, 'ExceptionHandler'
    set_label $P8, __label_1
    push_eh $P8
# try: begin
# {
# var pir_compiler: $P2
# predefined compreg
    compreg $P2, "PIR"
# prog_name: $S1
    $S1 = __ARG_2[0]
# input_file_type: $I1
    $P8 = WSubId_1($S1)
    set $I1, $P8
# output_file: $S2
    null $S2
    if $I1, __label_3
    concat $S4, "Invalid file type ", $S1
    WSubId_2($P1, $S4)
  __label_3: # endif
# var exe_name: $P3
    $P3 = __ARG_1.'shift'()
# var packfile_pmc: $P4
    null $P4
# for loop
# i: $I2
    null $I2
  __label_6: # for condition
# predefined elements
    elements $I3, __ARG_1
    ge $I2, $I3, __label_5
# {
# sys_arg: $S3
    $S3 = __ARG_1[$I2]
# switch
    set $S4, $S3
    set $S5, "-o"
    if $S4 == $S5 goto __label_9
    set $S5, "-c"
    if $S4 == $S5 goto __label_10
    set $S5, "-r"
    if $S4 == $S5 goto __label_11
    set $S5, "-E"
    if $S4 == $S5 goto __label_12
    set $S5, "-V"
    if $S4 == $S5 goto __label_13
    set $S5, "-h"
    if $S4 == $S5 goto __label_14
    goto __label_8
  __label_9: # case
    inc $I2
    $S2 = __ARG_1[$I2]
    goto __label_7 # break
  __label_10: # case
    set $I1, 3
    goto __label_7 # break
  __label_11: # case
    $P8 = WSubId_3($S1)
    set $S2, $P8
    $P4 = $P2.'compile_file'($S1)
    $P4.'write_to_file'($S2)
    new $P4, [ 'PackfileView' ]
    $P4.'read_from_file'($S2)
    null $S2
    goto __label_7 # break
  __label_12: # case
    $P2.'preprocess'($S1)
# predefined exit
    exit 0
  __label_13: # case
    WSubId_4($P1)
  __label_14: # case
    WSubId_5($P1)
  __label_8: # default
    concat $S6, "Unknown argument ", $S3
    WSubId_2($P1, $S6)
  __label_7: # switch end
# }
  __label_4: # for iteration
    set $I3, $I2
    inc $I2
    goto __label_6
  __label_5: # for end
# predefined elements
    elements $I3, __ARG_2
    ge $I3, 1, __label_15
    WSubId_2($P1, "Missing program name")
  __label_15: # endif
    unless_null $P4, __label_16
    $P4 = WSubId_6($S1, $I1, $P2)
  __label_16: # endif
    if_null $S2, __label_17
# {
    $P4.'write_to_file'($S2)
# predefined exit
    exit 0
# }
  __label_17: # endif
    $P8 = $P4.'subs_by_tag'("init")
    if_null $P8, __label_19
    iter $P9, $P8
    set $P9, 0
  __label_18: # for iteration
    unless $P9 goto __label_19
    shift $P5, $P9
    $P5()
    goto __label_18
  __label_19: # endfor
# var main_sub: $P6
    $P6 = $P4.'main_sub'()
    .tailcall $P6(__ARG_2)
# }
# try: end
    pop_eh
    goto __label_2
# catch
  __label_1:
    .get_results($P7)
    finalize $P7
    pop_eh
# {
    WSubId_7($P1, $P7)
# }
# catch end
  __label_2:
# }

.end # __PARROT_ENTRY_MAIN__


.sub '__default_get_packfile' :subid('WSubId_6') :anon
        .param string __ARG_1
        .param int __ARG_2
        .param pmc __ARG_3
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
# var pf: $P1
    $P1 = __ARG_3.'compile_file'(__ARG_1)
    .return($P1)
  __label_4: # case
# var pasm_compiler: $P2
# predefined compreg
    compreg $P2, "PASM"
    .tailcall $P2.'compile_file'(__ARG_1)
  __label_5: # case
# var packfile_pmc: $P3
    new $P3, [ 'PackfileView' ]
    $P3.'read_from_file'(__ARG_1)
    .return($P3)
  __label_2: # default
    null $P4
    .return($P4)
  __label_1: # switch end
# }

.end # __default_get_packfile


.sub '__get_input_file_type' :subid('WSubId_1') :anon
        .param string __ARG_1
# Body
# {
# len: $I1
# predefined length
    length $I2, __ARG_1
    sub $I1, $I2, 4
# ext: $S1
# predefined substr
    substr $S1, __ARG_1, $I1
    ne $S1, ".pir", __label_1
    .return(2)
  __label_1: # endif
    ne $S1, ".pbc", __label_2
    .return(3)
  __label_2: # endif
    sub $I2, $I1, 1
# predefined substr
    substr $S1, __ARG_1, $I2
    ne $S1, ".pasm", __label_3
    .return(1)
  __label_3: # endif
    .return(2)
# }

.end # __get_input_file_type


.sub '__handle_error_and_exit' :subid('WSubId_7') :anon
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
# severity: $I1
    getattribute $P4, __ARG_2, 'severity'
    set $I1, $P4
    ne $I1, 6, __label_1
    getattribute $P4, __ARG_2, 'exit_code'
    set $I5, $P4
# predefined exit
    exit $I5
  __label_1: # endif
# var stderr_pmc: $P1
# predefined getstderr
    getstderr $P1
# message: $S1
    getattribute $P4, __ARG_2, 'message'
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
    isnull $I5, $S1
    if $I5 goto __label_4
    iseq $I5, $S1, ""
  __label_4:
    unless $I5 goto __label_3
    set $S1, "No exception handler and no message"
  __label_3: # endif
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $S1
# predefined sprintf
    sprintf $S5, "%s\n", $P4
    $P1.'print'($S5)
# line_sep: $S2
    set $S2, ""
# var bts: $P2
    $P2 = __ARG_2.'backtrace_strings'()
# for loop
# i: $I2
# predefined elements
    elements $I5, $P2
    sub $I2, $I5, 1
  __label_7: # for condition
    lt $I2, 0, __label_6
# {
# bt: $S3
    $S3 = $P2[$I2]
# var lines: $P3
# predefined split
    split $P3, "\n", $S3
    if_null $P3, __label_9
    iter $P5, $P3
    set $P5, 0
  __label_8: # for iteration
    unless $P5 goto __label_9
    shift $S4, $P5
# {
# prt0_idx: $I3
    null $I3
# pirop index
    index $I3, $S4, "__PARROT_ENTRY_MAIN__"
    eq $I3, -1, __label_10
    goto __label_8 # continue
  __label_10: # endif
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 2
    $P4[0] = $S2
    $P4[1] = $S4
# predefined sprintf
    sprintf $S5, "%s%s", $P4
    $P1.'print'($S5)
    set $S2, "\n"
# }
    goto __label_8
  __label_9: # endfor
    set $S2, "\nthrown from\n"
# }
  __label_5: # for iteration
    set $I5, $I2
    dec $I2
    goto __label_7
  __label_6: # for end
# exit_code: $I4
    getattribute $P4, __ARG_2, 'exit_code'
    set $I4, $P4
    if $I4, __label_11
    set $I4, 1
  __label_11: # endif
# predefined exit
    exit $I4
# }

.end # __handle_error_and_exit


.sub '__show_version_and_exit' :subid('WSubId_4') :anon
        .param pmc __ARG_1
# Body
# {
# var config: $P1
    $P1 = __ARG_1[8]
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
# predefined sprintf
    sprintf $S2, $S1, $P3
    box $P2, $S2
# predefined say
    say $P2
# predefined exit
    exit 0
# }

.end # __show_version_and_exit


.sub '__show_help_and_exit' :subid('WSubId_5') :anon
        .param pmc __ARG_1
# Body
# {
# msg: $S1
    set $S1, "parrot [Options] <file> [<program options...>]\n  Options:\n    -h --help\n    -V --version\n    -I --include add path to include search\n    -L --library add path to library search\n       --hash-seed F00F  specify hex value to use as hash seed\n    -X --dynext add path to dynamic extension search\n   <Run core options>\n    -R --runcore slow|bounds|fast\n    -R --runcore trace|profiling|gcdebug\n    -t --trace [flags]\n   <VM options>\n    -D --parrot-debug[=HEXFLAGS]\n       --help-debug\n    -w --warnings\n    -G --no-gc\n    -g --gc ms2|gms|ms|inf set GC type\n       <GC MS2 options>\n       --gc-dynamic-threshold=percentage    maximum memory wasted by GC\n       --gc-min-threshold=KB\n       <GC GMS options>\n       --gc-nursery-size=percent of sysmem  size of gen0 (default 2)\n       --gc-debug\n       --leak-test|--destroy-at-end\n    -. --wait    Read a keystroke before starting\n       --runtime-prefix\n   <Compiler options>\n    -d --imcc-debug[=HEXFLAGS]\n    -v --verbose\n    -E --pre-process-only\n    -o --output=FILE\n       --output-pbc\n    -O --optimize[=LEVEL]\n    -a --pasm\n    -c --pbc\n    -r --run-pbc\n    -y --yydebug\n   <Language options>\nsee docs/running.pod for more\n"
# predefined say
    say $S1
# predefined exit
    exit 0
# }

.end # __show_help_and_exit


.sub '__get_temporary_output_file' :subid('WSubId_3') :anon
        .param string __ARG_1
# Body
# {
    concat $S1, __ARG_1, ".pbc"
    .return($S1)
# }

.end # __get_temporary_output_file


.sub '__usage_and_exit' :subid('WSubId_2') :anon
        .param pmc __ARG_1
        .param string __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
# var stderr: $P1
    $P1 = __ARG_1.'stderr_handle'()
    unless __ARG_3 goto __label_1
    concat $S1, __ARG_2, "\n"
    $P1.'print'($S1)
  __label_1: # endif
    $P1.'print'("parrot -[acEGhrtvVwy.] [-d [FLAGS]] [-D [FLAGS]] ")
    $P1.'print'("[-O [level]] [-[LIX] path] [-R runcore] [-o FILE] <file> <args>\n")
# predefined exit
    exit 1
# }

.end # __usage_and_exit

# End generated code
