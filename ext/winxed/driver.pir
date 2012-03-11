# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.sub initial_load_bytecode :anon :tag('load') :tag('init')
    $P0 = load_bytecode 'Getopt/Obj.pbc'
    $I0 = $P0.'is_initialized'('load')
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'('load')
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'('load')
  done_initialization:
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
    length $I4, $S1
    isgt $I3, $I4, 1
    unless $I3 goto __label_8
    substr $S2, $S1, 1, 1
    isne $I3, $S2, '='
  __label_8:
    unless $I3 goto __label_6
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

.sub Winxed_class_init :anon :tag('load') :tag('init')
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
    isgt $I2, $I1, 7
    unless $I2 goto __label_3
    substr $S2, __ARG_1, -7
    iseq $I2, $S2, '.winxed'
  __label_3:
    unless $I2 goto __label_1
    sub $I3, $I1, 7
    substr $S3, __ARG_1, 0, $I3
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

    $P0 = load_language 'winxed'
    $I0 = $P0.'is_initialized'('load')
    if $I0 goto done_initialization

    $P1 = $P0.'subs_by_tag'('load')
    $P2 = iter $P1
  loop_top:
    unless $P2 goto loop_bottom
    $P3 = shift $P2
    $P3()
    goto loop_top
  loop_bottom:

    $P0.'mark_initialized'('load')
  done_initialization:

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
    new $P12, [ 'WinxedDriverOptions' ]
    $P12.'WinxedDriverOptions'(__ARG_1)
    set $P1, $P12
    $P12 = $P1.'getbool'('version')
    if_null $P12, __label_1
    unless $P12 goto __label_1
    $P2 = WSubId_1()
    $P12 = $P2.'version_string'()
    say $P12
    exit 0
  __label_1: # endif
    $P12 = $P1.'getbool'('help')
    set $I1, $P12
    $P12 = $P1.'getbool'('c')
    set $I2, $P12
    $P12 = $P1.'getstring'('target')
    null $S1
    if_null $P12, __label_2
    set $S1, $P12
  __label_2:
    $P12 = $P1.'getstring'('e')
    null $S2
    if_null $P12, __label_3
    set $S2, $P12
  __label_3:
    $P12 = $P1.'getstring'('o')
    null $S3
    if_null $P12, __label_4
    set $S3, $P12
  __label_4:
    $P12 = $P1.'getbool'('debug')
    set $I3, $P12
    $P12 = $P1.'getbool'('nowarn')
    set $I4, $P12
    $P12 = $P1.'getbool'('noan')
    set $I5, $P12
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
    isnull $I8, $S3
    not $I8
    unless $I8 goto __label_17
    not $I8, $I2
  __label_17:
    unless $I8 goto __label_16
    die '-o without -c or --target is not supported yet'
  __label_16: # endif
    $P4 = WSubId_1()
    null $P5
    null $S4
    new $P12, 'ExceptionHandler'
    set_label $P12, __label_18
    $P12.'handle_types'(567)
    push_eh $P12
    unless_null $S2, __label_20
    elements $I8, __ARG_1
    ge $I8, 1, __label_22
    say "ERROR: No program specified"
    $P1.'showhelp'()
    exit 1
  __label_22: # endif
    $S5 = __ARG_1[0]
    set $I8, $I2
    unless $I8 goto __label_24
    isnull $I8, $S3
  __label_24:
    unless $I8 goto __label_23
    $P12 = WSubId_3($S5, '.pir')
    set $S4, $P12
  __label_23: # endif
    $P5 = $P4.'compile_from_file'($S5, $P3 :flat :named)
    goto __label_21
  __label_20: # else
    null $P6
    null $P7
    unless $I2 goto __label_25
    unless_null $S4, __label_26
    set $S4, $S3
  __label_26: # endif
    isnull $I8, $S4
    not $I8
    unless $I8 goto __label_29
    isne $I8, $S4, "-"
  __label_29:
    unless $I8 goto __label_27
    root_new $P7, ['parrot';'FileHandle']
    $P7.'open'($S4,'w')
    set $P6, $P7
    goto __label_28
  __label_27: # else
    getstdout $P6
  __label_28: # endif
    $P3['output'] = $P6
  __label_25: # endif
    concat $S6, 'function main[main](argv){', $S2
    concat $S6, $S6, ';}'
    $P5 = $P4.'compile'($S6, $P3 :flat :named)
    unless $I2 goto __label_30
    if_null $P7, __label_32
    $P7.'close'()
  __label_32: # endif
    exit 0
    goto __label_31
  __label_30: # else
    __ARG_1.'unshift'('__EVAL__')
  __label_31: # endif
  __label_21: # endif
    pop_eh
    goto __label_19
  __label_18:
    .get_results($P8)
    finalize $P8
    pop_eh
    $P9 = $P8["payload"]
    if_null $P9, __label_33
    getattribute $P12, $P9, 'filename'
    getattribute $P13, $P9, 'line'
    getattribute $P14, $P9, 'message'
    getstderr $P0
    print $P0, $P12
    print $P0, ':'
    print $P0, $P13
    print $P0, ': '
    print $P0, $P14
    print $P0, "\n"

    goto __label_34
  __label_33: # else
    $P15 = $P8["message"]
    getstderr $P0
    print $P0, $P15
    print $P0, "\n"

  __label_34: # endif
    exit 1
  __label_19:
    unless $I2 goto __label_35
    unless_null $S4, __label_36
    set $S4, $S3
  __label_36: # endif
    isnull $I6, $S4
    not $I6
    unless $I6 goto __label_37
    isne $I6, $S4, "-"
  __label_37:
    unless $I6 goto __label_39
    root_new $P10, ['parrot';'FileHandle']
    $P10.'open'($S4,'w')
    goto __label_38
  __label_39:
    getstdout $P12
    set $P10, $P12
  __label_38:
    $P10.'print'($P5)
    unless $I6 goto __label_40
    $P10.'close'()
  __label_40: # endif
    exit 0
  __label_35: # endif
    null $P11
    new $P12, 'ExceptionHandler'
    set_label $P12, __label_41
    push_eh $P12
    $P11 = $P5.'get_main'()
    pop_eh
    goto __label_42
  __label_41:
    .get_results($P13)
    finalize $P13
    pop_eh
    null $I7
  __label_45: # for condition
    $P11 = $P5[$I7]
    unless_null $P11, __label_46
    goto __label_44 # break
  __label_46: # endif
    set $S7, $P11
    ne $S7, 'main', __label_47
    goto __label_44 # break
  __label_47: # endif
  __label_43: # for iteration
    inc $I7
    goto __label_45
  __label_44: # for end
    unless_null $P11, __label_48
    $P11 = $P5[0]
  __label_48: # endif
  __label_42:
    .return($P11)

.end # process_args


.sub 'main' :main
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
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
    $S1 = $P3['message']
    isnull $I2, $S1
    not $I2
    unless $I2 goto __label_5
    isne $I2, $S1, ''
  __label_5:
    unless $I2 goto __label_4
    getstderr $P0
    print $P0, $S1
    print $P0, "\n"

  __label_4: # endif
    set $I1, 1
  __label_2:
    exit $I1

.end # main

# End generated code
