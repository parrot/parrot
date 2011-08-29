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
.annotate 'file', 'frontend/parrot2/prt0.winxed'
.annotate 'line', 11
# var interp: $P1
# predefined getinterp
    getinterp $P1
.annotate 'line', 12
# try: create handler
    new $P9, 'ExceptionHandler'
    set_label $P9, __label_1
    push_eh $P9
# try: begin
# {
.annotate 'line', 13
# var pir_compiler: $P2
# predefined compreg
    compreg $P2, "PIR"
.annotate 'line', 14
# prog_name: $S1
    $S1 = __ARG_2[0]
.annotate 'line', 15
# input_file_type: $I1
    $P9 = WSubId_1($S1)
    set $I1, $P9
.annotate 'line', 16
# output_file: $S2
    null $S2
.annotate 'line', 17
    ne $I1, 0, __label_3
.annotate 'line', 18
    concat $S4, "Invalid file type ", $S1
    WSubId_2($P1, $S4)
  __label_3: # endif
.annotate 'line', 19
# var exe_name: $P3
    $P3 = __ARG_1.'shift'()
.annotate 'line', 20
# var packfile_pmc: $P4
    null $P4
.annotate 'line', 21
    $P1[11] = $P3
# for loop
.annotate 'line', 22
# i: $I2
    null $I2
  __label_6: # for condition
# predefined elements
    elements $I3, __ARG_1
    ge $I2, $I3, __label_5
# {
.annotate 'line', 23
# sys_arg: $S3
    $S3 = __ARG_1[$I2]
# switch
.annotate 'line', 24
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
.annotate 'line', 26
    inc $I2
    $S2 = __ARG_1[$I2]
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 29
    set $I1, 3
    goto __label_7 # break
  __label_11: # case
.annotate 'line', 32
    $P9 = WSubId_3($S1)
    set $S2, $P9
.annotate 'line', 33
    $P4 = $P2.'compile_file'($S1)
.annotate 'line', 34
    $P4.'write_to_file'($S2)
.annotate 'line', 35
    new $P4, [ 'PackfileView' ]
.annotate 'line', 36
    $P4.'read_from_file'($S2)
.annotate 'line', 37
    null $S2
    goto __label_7 # break
  __label_12: # case
.annotate 'line', 40
    $P2.'preprocess'($S1)
# predefined exit
.annotate 'line', 41
    exit 0
  __label_13: # case
.annotate 'line', 43
    WSubId_4($P1)
  __label_14: # case
.annotate 'line', 45
    WSubId_5($P1)
  __label_8: # default
.annotate 'line', 47
    concat $S6, "Unknown argument ", $S3
    WSubId_2($P1, $S6)
  __label_7: # switch end
# }
  __label_4: # for iteration
.annotate 'line', 22
    set $I3, $I2
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 50
    unless_null $S1, __label_15
.annotate 'line', 51
    WSubId_2($P1)
  __label_15: # endif
.annotate 'line', 52
    unless_null $P4, __label_16
.annotate 'line', 53
    $P4 = WSubId_6($S1, $I1, $P2)
  __label_16: # endif
.annotate 'line', 54
    if_null $S2, __label_17
# {
.annotate 'line', 55
    $P4.'write_to_file'($S2)
# predefined exit
.annotate 'line', 56
    exit 0
# }
  __label_17: # endif
.annotate 'line', 58
    $P9 = $P4.'subs_by_flag'("init")
    if_null $P9, __label_19
    iter $P10, $P9
    set $P10, 0
  __label_18: # for iteration
    unless $P10 goto __label_19
    shift $P5, $P10
.annotate 'line', 59
    $P5()
    goto __label_18
  __label_19: # endfor
.annotate 'line', 60
# var main_sub: $P6
    $P6 = $P4.'main_sub'()
.annotate 'line', 61
# var prt0_pf: $P7
    $P7 = $P1["packfile"]
.annotate 'line', 62
    $P4.'set_current_packfile'($P1)
.annotate 'line', 63
    .tailcall $P6(__ARG_2)
# }
# try: end
    pop_eh
    goto __label_2
.annotate 'line', 12
# catch
  __label_1:
    .get_results($P8)
    finalize $P8
    pop_eh
# {
.annotate 'line', 65
    WSubId_7($P1, $P8)
# }
# catch end
  __label_2:
# }
.annotate 'line', 67

.end # __PARROT_ENTRY_MAIN__


.sub '__default_get_packfile' :subid('WSubId_6') :anon
        .param string __ARG_1
        .param int __ARG_2
        .param pmc __ARG_3
# Body
# {
# switch
.annotate 'line', 71
    set $I1, __ARG_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    set $I2, 1
    if $I1 == $I2 goto __label_4
    set $I2, 3
    if $I1 == $I2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 73
# var pf: $P1
    $P1 = __ARG_3.'compile_file'(__ARG_1)
.annotate 'line', 74
    .return($P1)
  __label_4: # case
.annotate 'line', 76
# var pasm_compiler: $P2
# predefined compreg
    compreg $P2, "PASM"
.annotate 'line', 77
    .tailcall $P2.'compile_file'(__ARG_1)
  __label_5: # case
.annotate 'line', 79
# var packfile_pmc: $P3
    new $P3, [ 'PackfileView' ]
.annotate 'line', 80
    $P3.'read_from_file'(__ARG_1)
.annotate 'line', 81
    .return($P3)
  __label_2: # default
    null $P4
.annotate 'line', 83
    .return($P4)
  __label_1: # switch end
# }
.annotate 'line', 85

.end # __default_get_packfile


.sub '__get_input_file_type' :subid('WSubId_1') :anon
        .param string __ARG_1
# Body
# {
.annotate 'line', 89
# len: $I1
# predefined length
    length $I2, __ARG_1
    sub $I1, $I2, 4
.annotate 'line', 90
# ext: $S1
# predefined substr
    substr $S1, __ARG_1, $I1
.annotate 'line', 91
    ne $S1, ".pir", __label_1
    .return(2)
  __label_1: # endif
.annotate 'line', 92
    ne $S1, ".pbc", __label_2
    .return(3)
  __label_2: # endif
.annotate 'line', 93
    sub $I2, $I1, 1
# predefined substr
    substr $S1, __ARG_1, $I2
.annotate 'line', 94
    ne $S1, ".pasm", __label_3
    .return(1)
  __label_3: # endif
.annotate 'line', 95
    .return(2)
# }
.annotate 'line', 96

.end # __get_input_file_type


.sub '__handle_error_and_exit' :subid('WSubId_7') :anon
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 100
# severity: $I1
    getattribute $P4, __ARG_2, 'severity'
    set $I1, $P4
.annotate 'line', 101
    ne $I1, 6, __label_1
.annotate 'line', 102
    getattribute $P4, __ARG_2, 'exit_code'
    set $I5, $P4
# predefined exit
    exit $I5
  __label_1: # endif
.annotate 'line', 103
# var stderr_pmc: $P1
# predefined getstderr
    getstderr $P1
.annotate 'line', 104
# message: $S1
    getattribute $P4, __ARG_2, 'message'
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 105
    isnull $I5, $S1
    if $I5 goto __label_4
    iseq $I5, $S1, ""
  __label_4:
    unless $I5 goto __label_3
.annotate 'line', 106
    set $S1, "No exception handler and no message"
  __label_3: # endif
.annotate 'line', 107
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, $S1
    push $P4, $P5
# predefined sprintf
    sprintf $S5, "%s\n", $P4
    $P1.'print'($S5)
.annotate 'line', 109
# line_sep: $S2
    set $S2, ""
.annotate 'line', 110
# var bts: $P2
    $P2 = __ARG_2.'backtrace_strings'()
# for loop
.annotate 'line', 111
# i: $I2
# predefined elements
    elements $I5, $P2
    sub $I2, $I5, 1
  __label_7: # for condition
    lt $I2, 0, __label_6
# {
.annotate 'line', 112
# bt: $S3
    $S3 = $P2[$I2]
.annotate 'line', 113
# var lines: $P3
# predefined split
    split $P3, "\n", $S3
.annotate 'line', 114
    if_null $P3, __label_9
    iter $P6, $P3
    set $P6, 0
  __label_8: # for iteration
    unless $P6 goto __label_9
    shift $S4, $P6
# {
.annotate 'line', 115
# prt0_idx: $I3
    null $I3
.annotate 'line', 116
# pirop index
    index $I3, $S4, "__PARROT_ENTRY_MAIN__"
.annotate 'line', 117
    eq $I3, -1, __label_10
    goto __label_8 # continue
  __label_10: # endif
.annotate 'line', 119
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, $S2
    push $P4, $P5
    box $P5, $S4
    push $P4, $P5
# predefined sprintf
    sprintf $S5, "%s%s", $P4
    $P1.'print'($S5)
.annotate 'line', 120
    set $S2, "\n"
# }
    goto __label_8
  __label_9: # endfor
.annotate 'line', 122
    set $S2, "\nthrown from\n"
# }
  __label_5: # for iteration
.annotate 'line', 111
    set $I5, $I2
    dec $I2
    goto __label_7
  __label_6: # for end
.annotate 'line', 125
# exit_code: $I4
    getattribute $P4, __ARG_2, 'exit_code'
    set $I4, $P4
.annotate 'line', 126
    ne $I4, 0, __label_11
.annotate 'line', 127
    set $I4, 1
  __label_11: # endif
.annotate 'line', 128
# predefined exit
    exit $I4
# }
.annotate 'line', 129

.end # __handle_error_and_exit


.sub '__show_version_and_exit' :subid('WSubId_4') :anon
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 133
# var config: $P1
    $P1 = __ARG_1[8]
.annotate 'line', 134
# msg_fmt: $S1
    set $S1, "This is Parrot version %s%s built for %s-%s\nCopyright (C) 2001-2011, Parrot Foundation.\n\nThis code is distributed under the terms of the Artistic License 2.0.\nFor more details, see the full text of the license in the LICENSE file\nincluded in the Parrot source tree\n"
.annotate 'line', 143
# var msg: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P1["VERSION"]
    push $P3, $P5
    $P6 = $P1["DEVEL"]
    push $P3, $P6
    $P7 = $P1["cpuarch"]
    push $P3, $P7
    $P8 = $P1["platform"]
    push $P3, $P8
# predefined sprintf
    sprintf $S2, $S1, $P3
    box $P2, $S2
.annotate 'line', 144
# predefined say
    say $P2
# predefined exit
.annotate 'line', 145
    exit 0
# }
.annotate 'line', 146

.end # __show_version_and_exit


.sub '__show_help_and_exit' :subid('WSubId_5') :anon
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 150
# msg: $S1
    set $S1, "parrot [Options] <file> [<program options...>]\n  Options:\n    -h --help\n    -V --version\n    -I --include add path to include search\n    -L --library add path to library search\n       --hash-seed F00F  specify hex value to use as hash seed\n    -X --dynext add path to dynamic extension search\n   <Run core options>\n    -R --runcore slow|bounds|fast\n    -R --runcore trace|profiling|gcdebug\n    -t --trace [flags]\n   <VM options>\n    -D --parrot-debug[=HEXFLAGS]\n       --help-debug\n    -w --warnings\n    -G --no-gc\n    -g --gc ms2|gms|ms|inf set GC type\n       <GC MS2 options>\n       --gc-dynamic-threshold=percentage    maximum memory wasted by GC\n       --gc-min-threshold=KB\n       <GC GMS options>\n       --gc-nursery-size=percent of sysmem  size of gen0 (default 2)\n       --gc-debug\n       --leak-test|--destroy-at-end\n    -. --wait    Read a keystroke before starting\n       --runtime-prefix\n   <Compiler options>\n    -d --imcc-debug[=HEXFLAGS]\n    -v --verbose\n    -E --pre-process-only\n    -o --output=FILE\n       --output-pbc\n    -O --optimize[=LEVEL]\n    -a --pasm\n    -c --pbc\n    -r --run-pbc\n    -y --yydebug\n   <Language options>\nsee docs/running.pod for more\n"
.annotate 'line', 193
# predefined say
    say $S1
# predefined exit
.annotate 'line', 194
    exit 0
# }
.annotate 'line', 195

.end # __show_help_and_exit


.sub '__get_temporary_output_file' :subid('WSubId_3') :anon
        .param string __ARG_1
# Body
# {
.annotate 'line', 200
    concat $S1, __ARG_1, ".pbc"
    .return($S1)
# }
.annotate 'line', 201

.end # __get_temporary_output_file


.sub '__usage_and_exit' :subid('WSubId_2') :anon
        .param pmc __ARG_1
        .param string __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 205
# var stderr: $P1
    $P1 = __ARG_1.'stderr_handle'()
.annotate 'line', 206
    unless __ARG_3 goto __label_1
.annotate 'line', 207
    concat $S1, __ARG_2, "\n"
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 208
    $P1.'print'("parrot -[acEGhrtvVwy.] [-d [FLAGS]] [-D [FLAGS]] ")
.annotate 'line', 209
    $P1.'print'("[-O [level]] [-[LIX] path] [-R runcore] [-o FILE] <file> <args>\n")
# predefined exit
.annotate 'line', 210
    exit 1
# }
.annotate 'line', 211

.end # __usage_and_exit

# End generated code
