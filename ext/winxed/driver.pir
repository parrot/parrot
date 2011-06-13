# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code


.sub initial_load_bytecode :anon :load :init
    load_bytecode 'Getopt/Obj.pbc'
.end

# end libs
.namespace [ ]
# Constant DEBUG evaluated at compile time
.namespace [ 'WinxedDriverOptions' ]

.sub 'WinxedDriverOptions' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'file', 'winxed_installed.winxed'
.annotate 'line', 21
# var options: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 22
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, 'c'
    push $P4, $P5
    box $P5, 'Compile to pir'
    push $P4, $P5
.annotate 'line', 21
    push $P1, $P4
.annotate 'line', 23
    root_new $P6, ['parrot';'ResizablePMCArray']
    box $P7, 'e=s'
    push $P6, $P7
    box $P7, 'Evaluate'
    push $P6, $P7
.annotate 'line', 21
    push $P1, $P6
.annotate 'line', 24
    root_new $P8, ['parrot';'ResizablePMCArray']
    box $P9, 'o=s'
    push $P8, $P9
    box $P9, 'Object name'
    push $P8, $P9
.annotate 'line', 21
    push $P1, $P8
.annotate 'line', 25
    root_new $P10, ['parrot';'ResizablePMCArray']
    box $P11, 'target=s'
    push $P10, $P11
    box $P11, 'Set target type'
    push $P10, $P11
.annotate 'line', 21
    push $P1, $P10
.annotate 'line', 26
    root_new $P12, ['parrot';'ResizablePMCArray']
    box $P13, 'L=s'
    push $P12, $P13
    box $P13, 'Add to parrot library search path'
    push $P12, $P13
.annotate 'line', 21
    push $P1, $P12
.annotate 'line', 27
    root_new $P14, ['parrot';'ResizablePMCArray']
    box $P15, 'I=s'
    push $P14, $P15
    box $P15, 'Add to parrot include search path'
    push $P14, $P15
.annotate 'line', 21
    push $P1, $P14
.annotate 'line', 28
    root_new $P16, ['parrot';'ResizablePMCArray']
    box $P17, 'nowarn'
    push $P16, $P17
    box $P17, 'No warnings'
    push $P16, $P17
.annotate 'line', 21
    push $P1, $P16
.annotate 'line', 29
    root_new $P18, ['parrot';'ResizablePMCArray']
    box $P19, 'noan'
    push $P18, $P19
    box $P19, 'No code annotations'
    push $P18, $P19
.annotate 'line', 21
    push $P1, $P18
.annotate 'line', 30
    root_new $P20, ['parrot';'ResizablePMCArray']
    box $P21, 'help'
    push $P20, $P21
    box $P21, 'Show this help'
    push $P20, $P21
.annotate 'line', 21
    push $P1, $P20
.annotate 'line', 32
    setattribute self, 'options', $P1
.annotate 'line', 33
    iter $P22, $P1
    set $P22, 0
  __label_1: # for iteration
    unless $P22 goto __label_2
    shift $P2, $P22
.annotate 'line', 34
    $P3 = $P2[0]
    self.'push_string'($P3)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 35
    self.'notOptStop'(1)
.annotate 'line', 36
    $P4 = __ARG_1.'shift'()
    setattribute self, 'name', $P4
.annotate 'line', 37
    $P4 = self.'get_options'(__ARG_1)
    setattribute self, 'opts', $P4
# }
.annotate 'line', 38

.end # WinxedDriverOptions


.sub 'getbool' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 41
# var value: $P1
    getattribute $P2, self, 'opts'
    $P1 = $P2[__ARG_1]
.annotate 'line', 42
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 43

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 46
# var value: $P1
    getattribute $P2, self, 'opts'
    $P1 = $P2[__ARG_1]
.annotate 'line', 47
# result: $S1
    null $S1
.annotate 'line', 48
    if_null $P1, __label_1
.annotate 'line', 49
    set $S1, $P1
  __label_1: # endif
.annotate 'line', 50
    .return($S1)
# }
.annotate 'line', 51

.end # getstring


.sub 'showhelp' :method
# Body
# {
.annotate 'line', 54
    getattribute $P2, self, 'name'
# predefined say
    print 'Usage: '
    print $P2
    say ' [options] [program] [args]'
# predefined say
.annotate 'line', 55
    say '  Available options:'
.annotate 'line', 56
# l: $I1
    null $I1
.annotate 'line', 57
# i: $I2
    null $I2
.annotate 'line', 58
# var o: $P1
    null $P1
.annotate 'line', 59
    getattribute $P2, self, 'options'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 60
    $P4 = $P1[0]
    set $S2, $P4
# predefined length
    length $I3, $S2
    add $I2, $I3, 4
.annotate 'line', 61
    le $I2, $I1, __label_3
    set $I1, $I2
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 63
    getattribute $P2, self, 'options'
    iter $P5, $P2
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P1, $P5
# {
.annotate 'line', 64
# s: $S1
    $S1 = $P1[0]
.annotate 'line', 65
# predefined length
    length $I4, $S1
    isgt $I3, $I4, 1
    unless $I3 goto __label_8
# predefined substr
    substr $S2, $S1, 1, 1
    isne $I3, $S2, '='
  __label_8:
    unless $I3 goto __label_6
.annotate 'line', 66
    concat $S0, '--', $S1
    set $S1, $S0
    goto __label_7
  __label_6: # else
.annotate 'line', 68
    concat $S0, '-', $S1
    set $S1, $S0
  __label_7: # endif
.annotate 'line', 69
# predefined length
    length $I3, $S1
    sub $I2, $I1, $I3
.annotate 'line', 70
    repeat $S2, ' ', $I2
    $P2 = $P1[1]
# predefined say
    print '    '
    print $S1
    print $S2
    print '->  '
    say $P2
# }
    goto __label_4
  __label_5: # endfor
# }
.annotate 'line', 72

.end # showhelp

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedDriverOptions' ]
.annotate 'line', 13
    get_class $P1, [ 'Getopt'; 'Obj' ]
    addparent $P0, $P1
.annotate 'line', 15
    addattribute $P0, 'name'
.annotate 'line', 16
    addattribute $P0, 'options'
.annotate 'line', 17
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'extname' :subid('WSubId_1')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 80
# newname: $S1
    null $S1
.annotate 'line', 81
# l: $I1
# predefined length
    length $I1, __ARG_1
.annotate 'line', 82
    isgt $I2, $I1, 7
    unless $I2 goto __label_3
# predefined substr
    substr $S2, __ARG_1, -7
    iseq $I2, $S2, '.winxed'
  __label_3:
    unless $I2 goto __label_1
.annotate 'line', 83
    sub $I3, $I1, 7
# predefined substr
    substr $S3, __ARG_1, 0, $I3
    concat $S0, $S3, __ARG_2
    set $S1, $S0
    goto __label_2
  __label_1: # else
.annotate 'line', 85
    concat $S0, __ARG_1, __ARG_2
    set $S1, $S0
  __label_2: # endif
.annotate 'line', 86
    .return($S1)
# }
.annotate 'line', 87

.end # extname


.sub 'main' :main
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 91
# var optionset: $P1
    new $P1, [ 'WinxedDriverOptions' ]
    $P1.'WinxedDriverOptions'(__ARG_1)
.annotate 'line', 93
# help: $I1
    $P19 = $P1.'getbool'('help')
    set $I1, $P19
.annotate 'line', 94
# compileonly: $I2
    $P19 = $P1.'getbool'('c')
    set $I2, $P19
.annotate 'line', 95
# target: $S1
    $P19 = $P1.'getstring'('target')
    null $S1
    if_null $P19, __label_1
    set $S1, $P19
  __label_1:
.annotate 'line', 96
# eval: $S2
    $P19 = $P1.'getstring'('e')
    null $S2
    if_null $P19, __label_2
    set $S2, $P19
  __label_2:
.annotate 'line', 97
# objectname: $S3
    $P19 = $P1.'getstring'('o')
    null $S3
    if_null $P19, __label_3
    set $S3, $P19
  __label_3:
.annotate 'line', 98
# opt_L: $S4
    $P19 = $P1.'getstring'('L')
    null $S4
    if_null $P19, __label_4
    set $S4, $P19
  __label_4:
.annotate 'line', 99
# opt_I: $S5
    $P19 = $P1.'getstring'('I')
    null $S5
    if_null $P19, __label_5
    set $S5, $P19
  __label_5:
.annotate 'line', 100
# nowarn: $I3
    $P19 = $P1.'getbool'('nowarn')
    set $I3, $P19
.annotate 'line', 101
# noan: $I4
    $P19 = $P1.'getbool'('noan')
    set $I4, $P19
.annotate 'line', 103
    unless $I1 goto __label_6
# {
.annotate 'line', 104
    $P1.'showhelp'()
# predefined exit
.annotate 'line', 105
    exit 0
# }
  __label_6: # endif
.annotate 'line', 108
    if_null $S4, __label_7
# {
.annotate 'line', 109
# var interp: $P2
    null $P2
.annotate 'line', 110
# pirop getinterp
    getinterp $P2
.annotate 'line', 111
# var lpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 112
# var pathlib: $P4
    $P4 = $P3[1]
.annotate 'line', 113
# predefined string
    set $S10, $S4
    $P4.'push'($S10)
# }
  __label_7: # endif
.annotate 'line', 115
    if_null $S5, __label_8
# {
.annotate 'line', 116
# var interp: $P5
    null $P5
.annotate 'line', 117
# pirop getinterp
    getinterp $P5
.annotate 'line', 118
# var lpaths: $P6
    $P6 = $P5[9]
.annotate 'line', 119
# var pathlib: $P7
    $P7 = $P6[0]
.annotate 'line', 120
# predefined string
    set $S10, $S5
    $P7.'push'($S10)
# }
  __label_8: # endif
.annotate 'line', 123
# var compileoptions: $P8
    root_new $P8, ['parrot';'Hash']
    box $P19, $I4
    $P8["noan"] = $P19
    box $P20, $I3
    $P8["nowarn"] = $P20
.annotate 'line', 124
    unless $I2 goto __label_9
# {
.annotate 'line', 125
    if_null $S1, __label_11
# predefined die
.annotate 'line', 126
    die "options -c and --target can't be used together"
  __label_11: # endif
.annotate 'line', 127
    $P8["target"] = "pir"
# }
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 130
    unless_null $S1, __label_12
.annotate 'line', 131
    set $S1, ''
  __label_12: # endif
# switch
.annotate 'line', 132
    set $S10, $S1
    set $S11, ''
    if $S10 == $S11 goto __label_15
    set $S11, 'run'
    if $S10 == $S11 goto __label_16
    set $S11, 'pir'
    if $S10 == $S11 goto __label_17
    set $S11, 'include'
    if $S10 == $S11 goto __label_18
    goto __label_14
  __label_15: # case
  __label_16: # case
    goto __label_13 # break
  __label_17: # case
  __label_18: # case
.annotate 'line', 138
    set $I2, 1
.annotate 'line', 139
    $P8["target"] = $S1
    goto __label_13 # break
  __label_14: # default
.annotate 'line', 142
    concat $S12, "Invalid target '", $S1
    concat $S12, $S12, "'"
# predefined die
    die $S12
  __label_13: # switch end
# }
  __label_10: # endif
.annotate 'line', 146
    isnull $I8, $S3
    not $I8
    unless $I8 goto __label_20
    not $I8, $I2
  __label_20:
    unless $I8 goto __label_19
# predefined die
.annotate 'line', 147
    die '-o without -c or --target is not supported yet'
  __label_19: # endif
.annotate 'line', 149
# var compiler: $P9
    null $P9
.annotate 'line', 150
# try: create handler
    new $P19, 'ExceptionHandler'
    set_label $P19, __label_21
    push_eh $P19
# try: begin
.annotate 'line', 151
# predefined load_language
    load_language 'winxed'
    compreg $P9, 'winxed'
# try: end
    pop_eh
    goto __label_22
.annotate 'line', 150
# catch
  __label_21:
    .get_results($P20)
    finalize $P20
    pop_eh
# catch end
  __label_22:
.annotate 'line', 154
    unless_null $P9, __label_23
# {
# predefined die
.annotate 'line', 162
    die "winxed: Cannot load language"
# }
  __label_23: # endif
.annotate 'line', 165
# var code: $P10
    null $P10
.annotate 'line', 166
# outfilename: $S6
    null $S6
.annotate 'line', 167
# try: create handler
    new $P19, 'ExceptionHandler'
    set_label $P19, __label_24
    $P19.'handle_types'(567)
    push_eh $P19
# try: begin
# {
.annotate 'line', 168
    unless_null $S2, __label_26
# {
.annotate 'line', 169
# predefined elements
    elements $I8, __ARG_1
    ge $I8, 1, __label_28
# {
# predefined say
.annotate 'line', 170
    say "ERROR: No program specified"
.annotate 'line', 171
    $P1.'showhelp'()
# predefined exit
.annotate 'line', 172
    exit 1
# }
  __label_28: # endif
.annotate 'line', 174
# srcfilename: $S7
    $S7 = __ARG_1[0]
.annotate 'line', 175
    set $I8, $I2
    unless $I8 goto __label_30
    isnull $I8, $S3
  __label_30:
    unless $I8 goto __label_29
.annotate 'line', 176
    $P19 = WSubId_1($S7, '.pir')
    set $S6, $P19
  __label_29: # endif
.annotate 'line', 177
    $P10 = $P9.'compile_from_file'($S7, $P8 :flat :named)
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 181
# var output: $P11
    null $P11
.annotate 'line', 182
# var outfile: $P12
    null $P12
.annotate 'line', 183
    unless $I2 goto __label_31
# {
.annotate 'line', 184
    unless_null $S6, __label_32
.annotate 'line', 185
    set $S6, $S3
  __label_32: # endif
.annotate 'line', 186
    isnull $I8, $S6
    not $I8
    unless $I8 goto __label_35
    isne $I8, $S6, "-"
  __label_35:
    unless $I8 goto __label_33
# {
.annotate 'line', 187
# predefined open
    root_new $P12, ['parrot';'FileHandle']
    $P12.'open'($S6,'w')
.annotate 'line', 188
    set $P11, $P12
# }
    goto __label_34
  __label_33: # else
.annotate 'line', 191
# predefined getstdout
    getstdout $P11
  __label_34: # endif
.annotate 'line', 192
    $P8['output'] = $P11
# }
  __label_31: # endif
.annotate 'line', 194
# expr: $S8
    concat $S8, 'function main[main](argv){', $S2
    concat $S8, $S8, ';}'
.annotate 'line', 195
    $P10 = $P9.'compile'($S8, $P8 :flat :named)
.annotate 'line', 197
    unless $I2 goto __label_36
# {
.annotate 'line', 198
    if_null $P12, __label_38
.annotate 'line', 199
    $P12.'close'()
  __label_38: # endif
# predefined exit
.annotate 'line', 200
    exit 0
# }
    goto __label_37
  __label_36: # else
.annotate 'line', 203
    __ARG_1.'unshift'('__EVAL__')
  __label_37: # endif
# }
  __label_27: # endif
# }
# try: end
    pop_eh
    goto __label_25
.annotate 'line', 167
# catch
  __label_24:
    .get_results($P13)
    finalize $P13
    pop_eh
# {
.annotate 'line', 207
# var payload: $P14
    $P14 = $P13["payload"]
.annotate 'line', 208
    if_null $P14, __label_39
.annotate 'line', 209
    getattribute $P19, $P14, 'filename'
    getattribute $P20, $P14, 'line'
    getattribute $P21, $P14, 'message'
# predefined cry
    getstderr $P0
    print $P0, $P19
    print $P0, ':'
    print $P0, $P20
    print $P0, ': '
    print $P0, $P21
    print $P0, "\n"
    goto __label_40
  __label_39: # else
.annotate 'line', 211
    $P22 = $P13["message"]
# predefined cry
    getstderr $P0
    print $P0, $P22
    print $P0, "\n"
  __label_40: # endif
# predefined exit
.annotate 'line', 212
    exit 1
# }
# catch end
  __label_25:
.annotate 'line', 215
    unless $I2 goto __label_41
# {
.annotate 'line', 216
    unless_null $S6, __label_42
.annotate 'line', 217
    set $S6, $S3
  __label_42: # endif
.annotate 'line', 218
# create: $I5
    isnull $I5, $S6
    not $I5
    unless $I5 goto __label_43
    isne $I5, $S6, "-"
  __label_43:
.annotate 'line', 219
# var outfile: $P15
    unless $I5 goto __label_45
# predefined open
    root_new $P15, ['parrot';'FileHandle']
    $P15.'open'($S6,'w')
    goto __label_44
  __label_45:
# predefined getstdout
    getstdout $P15
  __label_44:
.annotate 'line', 220
    $P15.'print'($P10)
.annotate 'line', 221
    unless $I5 goto __label_46
.annotate 'line', 222
    $P15.'close'()
  __label_46: # endif
# predefined exit
.annotate 'line', 223
    exit 0
# }
  __label_41: # endif
.annotate 'line', 228
# var sub: $P16
    null $P16
.annotate 'line', 229
# try: create handler
    new $P19, 'ExceptionHandler'
    set_label $P19, __label_47
    push_eh $P19
# try: begin
# {
.annotate 'line', 230
    $P16 = $P10.'get_main'()
# }
# try: end
    pop_eh
    goto __label_48
.annotate 'line', 229
# catch
  __label_47:
    .get_results($P20)
    finalize $P20
    pop_eh
# {
# for loop
.annotate 'line', 233
# i: $I6
    null $I6
  __label_51: # for condition
# {
.annotate 'line', 234
    $P16 = $P10[$I6]
.annotate 'line', 235
    unless_null $P16, __label_52
    goto __label_50 # break
  __label_52: # endif
.annotate 'line', 236
# predefined string
    set $S10, $P16
    ne $S10, 'main', __label_53
    goto __label_50 # break
  __label_53: # endif
# }
  __label_49: # for iteration
.annotate 'line', 233
    inc $I6
    goto __label_51
  __label_50: # for end
.annotate 'line', 239
    unless_null $P16, __label_54
.annotate 'line', 240
    $P16 = $P10[0]
  __label_54: # endif
# }
# catch end
  __label_48:
.annotate 'line', 243
# retval: $I7
    null $I7
.annotate 'line', 244
# try: create handler
    new $P19, 'ExceptionHandler'
    set_label $P19, __label_55
    $P19.'handle_types_except'(64)
    push_eh $P19
# try: begin
# {
.annotate 'line', 245
# var retvalp: $P17
    $P17 = $P16(__ARG_1)
.annotate 'line', 246
    if_null $P17, __label_57
.annotate 'line', 247
    set $I7, $P17
  __label_57: # endif
# }
# try: end
    pop_eh
    goto __label_56
.annotate 'line', 244
# catch
  __label_55:
    .get_results($P18)
    finalize $P18
    pop_eh
# {
.annotate 'line', 250
# msg: $S9
    $S9 = $P18['message']
.annotate 'line', 251
    isnull $I8, $S9
    not $I8
    unless $I8 goto __label_59
    isne $I8, $S9, ''
  __label_59:
    unless $I8 goto __label_58
.annotate 'line', 252
# predefined cry
    getstderr $P0
    print $P0, $S9
    print $P0, "\n"
  __label_58: # endif
.annotate 'line', 253
    set $I7, 1
# }
# catch end
  __label_56:
.annotate 'line', 255
# predefined exit
    exit $I7
# }
.annotate 'line', 256

.end # main

# End generated code
