# THIS IS A GENERATED FILE! DO NOT EDIT!
# Compiled with Winxed 1.9.1
# Source file: winxed_installed.winxed
# Begin generated code

.sub initial_load_bytecode :anon :load :init
    load_bytecode 'Getopt/Obj.pbc'
.end

# end libs
.namespace [ 'WinxedDriverOptions' ]

.sub 'WinxedDriverOptions' :method
        .param pmc __ARG_1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 12
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 2
    $P3[0] = 'c'
    $P3[1] = 'Compile to pir'
    $P1[0] = $P3
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 2
    $P4[0] = 'e=s'
    $P4[1] = 'Evaluate'
    $P1[1] = $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 2
    $P5[0] = 'o=s'
    $P5[1] = 'Object name'
    $P1[2] = $P5
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 2
    $P6[0] = 'target=s'
    $P6[1] = 'Set target type'
    $P1[3] = $P6
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = 'L=s'
    $P7[1] = 'Add to parrot library search path'
    $P1[4] = $P7
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 2
    $P8[0] = 'I=s'
    $P8[1] = 'Add to parrot include search path'
    $P1[5] = $P8
    root_new $P9, ['parrot';'ResizablePMCArray']
    assign $P9, 2
    $P9[0] = 'X=s'
    $P9[1] = 'Add to parrot dynext search path'
    $P1[6] = $P9
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 2
    $P10[0] = 'debug'
    $P10[1] = 'Set debug mode'
    $P1[7] = $P10
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 2
    $P11[0] = 'nowarn'
    $P11[1] = 'No warnings'
    $P1[8] = $P11
    root_new $P12, ['parrot';'ResizablePMCArray']
    assign $P12, 2
    $P12[0] = 'noan'
    $P12[1] = 'No code annotations'
    $P1[9] = $P12
    root_new $P13, ['parrot';'ResizablePMCArray']
    assign $P13, 2
    $P13[0] = 'help'
    $P13[1] = 'Show this help'
    $P1[10] = $P13
    root_new $P14, ['parrot';'ResizablePMCArray']
    assign $P14, 2
    $P14[0] = 'version'
    $P14[1] = 'Show version and exit'
    $P1[11] = $P14
    setattribute self, 'options', $P1
    if_null $P1, __label_2
    iter $P15, $P1
    set $P15, 0
  __label_1: # for iteration
    unless $P15 goto __label_2
    shift $P2, $P15
    $P3 = $P2[0]
    self.'push_string'($P3)
    goto __label_1
  __label_2: # endfor
    self.'notOptStop'(1)
    $P4 = __ARG_1.'shift'()
    setattribute self, 'name', $P4
    $P4 = self.'get_options'(__ARG_1)
    setattribute self, 'opts', $P4

.end # WinxedDriverOptions


.sub 'getbool' :method
        .param string __ARG_1
    getattribute $P2, self, 'opts'
    $P1 = $P2[__ARG_1]
    isnull $I1, $P1
    not $I1
    .return($I1)

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
    getattribute $P2, self, 'opts'
    $P1 = $P2[__ARG_1]
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1: # endif
    .return($S1)

.end # getstring


.sub 'showhelp' :method
    getattribute $P2, self, 'name'
    print 'Usage: '
    print $P2
    say ' [options] [program] [args]'
    say '  Available options:'
    null $I1
    null $I2
    null $P1
    getattribute $P2, self, 'options'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
    $P4 = $P1[0]
    set $S2, $P4
    length $I3, $S2
    add $I2, $I3, 4
    le $I2, $I1, __label_3
    set $I1, $I2
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    getattribute $P2, self, 'options'
    if_null $P2, __label_5
    iter $P5, $P2
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P1, $P5
    $S1 = $P1[0]
    length $I3, $S1
    le $I3, 1, __label_6
    substr $S2, $S1, 1, 1
    eq $S2, '=', __label_6
    concat $S3, '--', $S1
    set $S1, $S3
    goto __label_7
  __label_6: # else
    concat $S4, '-', $S1
    set $S1, $S4
  __label_7: # endif
    length $I3, $S1
    sub $I2, $I1, $I3
    repeat $S2, ' ', $I2
    $P2 = $P1[1]
    print '    '
    print $S1
    print $S2
    print '->  '
    say $P2
    goto __label_4
  __label_5: # endfor

.end # showhelp

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedDriverOptions' ]
    get_class $P1, [ 'Getopt'; 'Obj' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
    addattribute $P0, 'options'
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'path_option' :subid('WSubId_2')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
    $P3 = __ARG_1.'getstring'(__ARG_2)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    if_null $S1, __label_2
    getinterp $P3
    $P1 = $P3[9]
    $P2 = $P1[__ARG_3]
    $P2.'push'($S1)
  __label_2: # endif

.end # path_option


.sub 'extname' :subid('WSubId_3') :anon
        .param string __ARG_1
        .param string __ARG_2
    null $S1
    length $I1, __ARG_1
    le $I1, 7, __label_1
    substr $S2, __ARG_1, -7
    ne $S2, '.winxed', __label_1
    sub $I2, $I1, 7
    substr $S3, __ARG_1, 0, $I2
    concat $S4, $S3, __ARG_2
    set $S1, $S4
    goto __label_2
  __label_1: # else
    concat $S5, __ARG_1, __ARG_2
    set $S1, $S5
  __label_2: # endif
    .return($S1)

.end # extname


.sub 'getcompiler' :subid('WSubId_1') :anon
    null $P1
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_1
    push_eh $P2
    load_language 'winxed'
    compreg $P1, 'winxed'
    pop_eh
    goto __label_2
  __label_1:
    .get_results($P3)
    finalize $P3
    pop_eh
  __label_2:
    unless_null $P1, __label_3
    die "winxed: Cannot load language"
  __label_3: # endif
    .return($P1)

.end # getcompiler


.sub 'process_args' :subid('WSubId_4') :anon
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_3 = "WSubId_3"
    new $P13, [ 'WinxedDriverOptions' ]
    $P13.'WinxedDriverOptions'(__ARG_1)
    set $P1, $P13
    $P13 = $P1.'getbool'('version')
    if_null $P13, __label_1
    unless $P13 goto __label_1
    $P2 = WSubId_1()
    $P13 = $P2.'version_string'()
    say $P13
    exit 0
  __label_1: # endif
    $P13 = $P1.'getbool'('help')
    set $I1, $P13
    $P13 = $P1.'getbool'('c')
    set $I2, $P13
    $P13 = $P1.'getstring'('target')
    null $S1
    if_null $P13, __label_2
    set $S1, $P13
  __label_2:
    $P13 = $P1.'getstring'('e')
    null $S2
    if_null $P13, __label_3
    set $S2, $P13
  __label_3:
    $P13 = $P1.'getstring'('o')
    null $S3
    if_null $P13, __label_4
    set $S3, $P13
  __label_4:
    $P13 = $P1.'getbool'('debug')
    set $I3, $P13
    $P13 = $P1.'getbool'('nowarn')
    set $I4, $P13
    $P13 = $P1.'getbool'('noan')
    set $I5, $P13
    unless $I1 goto __label_5
    $P1.'showhelp'()
    exit 0
  __label_5: # endif
    WSubId_2($P1, 'L', 1)
    WSubId_2($P1, 'I', 0)
    WSubId_2($P1, 'X', 2)
    root_new $P3, ['parrot';'Hash']
    $P3["debug"] = $I3
    $P3["noan"] = $I5
    $P3["nowarn"] = $I4
    unless $I2 goto __label_6
    if_null $S1, __label_8
    die "options -c and --target can't be used together"
  __label_8: # endif
    $P3["target"] = "pir"
    goto __label_7
  __label_6: # else
    unless_null $S1, __label_9
    set $S1, ''
  __label_9: # endif
    if $S1 == '' goto __label_12
    if $S1 == 'run' goto __label_13
    if $S1 == 'pir' goto __label_14
    if $S1 == 'include' goto __label_15
    goto __label_10
  __label_12: # case
  __label_13: # case
    goto __label_11 # break
  __label_14: # case
  __label_15: # case
    set $I2, 1
    $P3["target"] = $S1
    goto __label_11 # break
  __label_10: # default
    concat $S8, "Invalid target '", $S1
    concat $S8, $S8, "'"
    die $S8
  __label_11: # switch end
  __label_7: # endif
    if_null $S3, __label_16
    if $I2 goto __label_16
    die '-o without -c or --target is not supported yet'
  __label_16: # endif
    $P4 = WSubId_1()
    null $P5
    null $S4
    new $P13, 'ExceptionHandler'
    set_label $P13, __label_17
    $P13.'handle_types'(567)
    push_eh $P13
    unless_null $S2, __label_19
    elements $I7, __ARG_1
    ge $I7, 1, __label_21
    say "ERROR: No program specified"
    $P1.'showhelp'()
    exit 1
  __label_21: # endif
    $S5 = __ARG_1[0]
    unless $I2 goto __label_22
    unless_null $S3, __label_22
    $P13 = WSubId_3($S5, '.pir')
    set $S4, $P13
  __label_22: # endif
    $P5 = $P4.'compile_from_file'($S5, $P3 :flat :named)
    goto __label_20
  __label_19: # else
    null $P6
    null $P7
    unless $I2 goto __label_23
    unless_null $S4, __label_24
    set $S4, $S3
  __label_24: # endif
    if_null $S4, __label_25
    eq $S4, "-", __label_25
    root_new $P7, ["parrot";"FileHandle"]
    $P7."open"($S4,'w')
    set $P6, $P7
    goto __label_26
  __label_25: # else
    getstdout $P6
  __label_26: # endif
    $P3['output'] = $P6
  __label_23: # endif
    concat $S6, 'function main[main](argv){', $S2
    concat $S6, $S6, ';}'
    $P5 = $P4.'compile'($S6, $P3 :flat :named)
    unless $I2 goto __label_27
    if_null $P7, __label_29
    $P7.'close'()
  __label_29: # endif
    exit 0
    goto __label_28
  __label_27: # else
    __ARG_1.'unshift'('__EVAL__')
  __label_28: # endif
  __label_20: # endif
    pop_eh
    goto __label_18
  __label_17:
    .get_results($P8)
    finalize $P8
    pop_eh
    $P9 = $P8["payload"]
    if_null $P9, __label_30
    getattribute $P13, $P9, 'filename'
    getattribute $P14, $P9, 'line'
    getattribute $P15, $P9, 'message'
    getstderr $P0
    print $P0, $P13
    print $P0, ':'
    print $P0, $P14
    print $P0, ': '
    print $P0, $P15
    print $P0, "\n"

    goto __label_31
  __label_30: # else
    $P16 = $P8["message"]
    getstderr $P0
    print $P0, $P16
    print $P0, "\n"

  __label_31: # endif
    exit 1
  __label_18:
    unless $I2 goto __label_32
    unless_null $S4, __label_33
    set $S4, $S3
  __label_33: # endif
    isnull $I6, $S4
    not $I6
    unless $I6 goto __label_34
    isne $I6, $S4, "-"
  __label_34:
    unless $I6 goto __label_36
    root_new $P10, ["parrot";"FileHandle"]
    $P10."open"($S4,'w')
    goto __label_35
  __label_36:
    getstdout $P13
    set $P10, $P13
  __label_35:
    $P10.'print'($P5)
    unless $I6 goto __label_37
    $P10.'close'()
  __label_37: # endif
    exit 0
  __label_32: # endif
    null $P11
    new $P13, 'ExceptionHandler'
    set_label $P13, __label_38
    push_eh $P13
    $P15 = $P5.'subs_by_tag'("load")
    if_null $P15, __label_41
    iter $P17, $P15
    set $P17, 0
  __label_40: # for iteration
    unless $P17 goto __label_41
    shift $P12, $P17
    $P12()
    goto __label_40
  __label_41: # endfor
    $P5.'mark_initialized'("load")
    $P11 = $P5.'main_sub'()
    pop_eh
    goto __label_39
  __label_38:
    .get_results($P14)
    finalize $P14
    pop_eh
    getstderr $P0
    print $P0, "Cannot find main sub"
    print $P0, "\n"

  __label_39:
    .return($P11)

.end # process_args


.sub '__PARROT_ENTRY_WINXED_main' :main
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_5 = "WSubId_5"
    $P1 = WSubId_4(__ARG_1)
    null $I1
    new $P4, 'ExceptionHandler'
    set_label $P4, __label_1
    $P4.'handle_types_except'(65543)
    push_eh $P4
    $P2 = $P1(__ARG_1)
    if_null $P2, __label_3
    set $I1, $P2
  __label_3: # endif
    pop_eh
    goto __label_2
  __label_1:
    .get_results($P3)
    finalize $P3
    pop_eh
    WSubId_5($P3)
  __label_2:
    exit $I1

.end # __PARROT_ENTRY_WINXED_main


.sub 'fail' :subid('WSubId_5') :anon
        .param pmc __ARG_1
    getstderr $P1
    getattribute $P3, __ARG_1, 'message'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    isnull $I3, $S1
    if $I3 goto __label_3
    iseq $I3, $S1, ""
  __label_3:
    unless $I3 goto __label_2
    set $S1, "No exception handler and no message"
  __label_2: # endif
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = $S1
    sprintf $S5, "%s\n", $P3
    $P1.'print'($S5)
    set $S2, ""
    $P2 = __ARG_1.'backtrace_strings'()
    elements $I3, $P2
    sub $I1, $I3, 1
  __label_6: # for condition
    lt $I1, 0, __label_5
    $S3 = $P2[$I1]
    split $P3, "\n", $S3
    if_null $P3, __label_8
    iter $P4, $P3
    set $P4, 0
  __label_7: # for iteration
    unless $P4 goto __label_8
    shift $S4, $P4
    index $I3, $S4, "__PARROT_ENTRY"
    lt $I3, 0, __label_9
    goto __label_7 # continue
  __label_9: # endif
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 2
    $P3[0] = $S2
    $P3[1] = $S4
    sprintf $S5, "%s%s", $P3
    $P1.'print'($S5)
    set $S2, "\n"
    goto __label_7
  __label_8: # endfor
    set $S2, "\nthrown from\n"
  __label_4: # for iteration
    dec $I1
    goto __label_6
  __label_5: # for end
    getattribute $P3, __ARG_1, 'exit_code'
    set $I2, $P3
    unless $I2 goto __label_11
    set $I3, $I2
    goto __label_10
  __label_11:
    set $I3, 1
  __label_10:
    exit $I3

.end # fail

# End generated code
