# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code


.sub initial_load_bytecode :anon :load :init
    load_bytecode 'Getopt/Obj.pbc'
.end

# end libs
.namespace [ 'WinxedDriverOptions' ]

.sub 'WinxedDriverOptions' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'file', 'winxed_installed.winxed'
.annotate 'line', 19
# var options: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 20
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, 'c'
    push $P4, $P5
    box $P5, 'Compile to pir'
    push $P4, $P5
.annotate 'line', 19
    push $P1, $P4
.annotate 'line', 21
    root_new $P6, ['parrot';'ResizablePMCArray']
    box $P7, 'e=s'
    push $P6, $P7
    box $P7, 'Evaluate'
    push $P6, $P7
.annotate 'line', 19
    push $P1, $P6
.annotate 'line', 22
    root_new $P8, ['parrot';'ResizablePMCArray']
    box $P9, 'o=s'
    push $P8, $P9
    box $P9, 'Object name'
    push $P8, $P9
.annotate 'line', 19
    push $P1, $P8
.annotate 'line', 23
    root_new $P10, ['parrot';'ResizablePMCArray']
    box $P11, 'target=s'
    push $P10, $P11
    box $P11, 'Set target type'
    push $P10, $P11
.annotate 'line', 19
    push $P1, $P10
.annotate 'line', 24
    root_new $P12, ['parrot';'ResizablePMCArray']
    box $P13, 'L=s'
    push $P12, $P13
    box $P13, 'Add to parrot library search path'
    push $P12, $P13
.annotate 'line', 19
    push $P1, $P12
.annotate 'line', 25
    root_new $P14, ['parrot';'ResizablePMCArray']
    box $P15, 'I=s'
    push $P14, $P15
    box $P15, 'Add to parrot include search path'
    push $P14, $P15
.annotate 'line', 19
    push $P1, $P14
.annotate 'line', 26
    root_new $P16, ['parrot';'ResizablePMCArray']
    box $P17, 'debug'
    push $P16, $P17
    box $P17, 'Set debug mode'
    push $P16, $P17
.annotate 'line', 19
    push $P1, $P16
.annotate 'line', 27
    root_new $P18, ['parrot';'ResizablePMCArray']
    box $P19, 'nowarn'
    push $P18, $P19
    box $P19, 'No warnings'
    push $P18, $P19
.annotate 'line', 19
    push $P1, $P18
.annotate 'line', 28
    root_new $P20, ['parrot';'ResizablePMCArray']
    box $P21, 'noan'
    push $P20, $P21
    box $P21, 'No code annotations'
    push $P20, $P21
.annotate 'line', 19
    push $P1, $P20
.annotate 'line', 29
    root_new $P22, ['parrot';'ResizablePMCArray']
    box $P23, 'help'
    push $P22, $P23
    box $P23, 'Show this help'
    push $P22, $P23
.annotate 'line', 19
    push $P1, $P22
.annotate 'line', 30
    root_new $P24, ['parrot';'ResizablePMCArray']
    box $P25, 'version'
    push $P24, $P25
    box $P25, 'Show version and exit'
    push $P24, $P25
.annotate 'line', 19
    push $P1, $P24
.annotate 'line', 32
    setattribute self, 'options', $P1
.annotate 'line', 33
    if_null $P1, __label_2
    iter $P26, $P1
    set $P26, 0
  __label_1: # for iteration
    unless $P26 goto __label_2
    shift $P2, $P26
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
    if_null $P2, __label_2
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
    if_null $P2, __label_5
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
    concat $S1, '--', $S1
    goto __label_7
  __label_6: # else
.annotate 'line', 68
    concat $S1, '-', $S1
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
.annotate 'line', 11
    get_class $P1, [ 'Getopt'; 'Obj' ]
    addparent $P0, $P1
.annotate 'line', 13
    addattribute $P0, 'name'
.annotate 'line', 14
    addattribute $P0, 'options'
.annotate 'line', 15
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'extname' :subid('WSubId_2')
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
    concat $S1, $S3, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 85
    concat $S1, __ARG_1, __ARG_2
  __label_2: # endif
.annotate 'line', 86
    .return($S1)
# }
.annotate 'line', 87

.end # extname


.sub 'getcompiler' :subid('WSubId_1')
# Body
# {
.annotate 'line', 91
# var compiler: $P1
    null $P1
.annotate 'line', 92
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_1
    push_eh $P2
# try: begin
.annotate 'line', 93
# predefined load_language
    load_language 'winxed'
    compreg $P1, 'winxed'
# try: end
    pop_eh
    goto __label_2
.annotate 'line', 92
# catch
  __label_1:
    .get_results($P3)
    finalize $P3
    pop_eh
# catch end
  __label_2:
.annotate 'line', 95
    unless_null $P1, __label_3
# {
# predefined die
.annotate 'line', 103
    die "winxed: Cannot load language"
# }
  __label_3: # endif
.annotate 'line', 105
    .return($P1)
# }
.annotate 'line', 106

.end # getcompiler


.sub 'main' :main
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 110
# var optionset: $P1
    new $P1, [ 'WinxedDriverOptions' ]
    $P1.'WinxedDriverOptions'(__ARG_1)
.annotate 'line', 112
    $P20 = $P1.'getbool'('version')
    if_null $P20, __label_1
    unless $P20 goto __label_1
# {
.annotate 'line', 113
# var compiler: $P2
    $P2 = WSubId_1()
.annotate 'line', 114
    $P20 = $P2.'version_string'()
# predefined say
    say $P20
# predefined exit
.annotate 'line', 115
    exit 0
# }
  __label_1: # endif
.annotate 'line', 118
# help: $I1
    $P20 = $P1.'getbool'('help')
    set $I1, $P20
.annotate 'line', 119
# compileonly: $I2
    $P20 = $P1.'getbool'('c')
    set $I2, $P20
.annotate 'line', 120
# target: $S1
    $P20 = $P1.'getstring'('target')
    null $S1
    if_null $P20, __label_2
    set $S1, $P20
  __label_2:
.annotate 'line', 121
# eval: $S2
    $P20 = $P1.'getstring'('e')
    null $S2
    if_null $P20, __label_3
    set $S2, $P20
  __label_3:
.annotate 'line', 122
# objectname: $S3
    $P20 = $P1.'getstring'('o')
    null $S3
    if_null $P20, __label_4
    set $S3, $P20
  __label_4:
.annotate 'line', 123
# opt_L: $S4
    $P20 = $P1.'getstring'('L')
    null $S4
    if_null $P20, __label_5
    set $S4, $P20
  __label_5:
.annotate 'line', 124
# opt_I: $S5
    $P20 = $P1.'getstring'('I')
    null $S5
    if_null $P20, __label_6
    set $S5, $P20
  __label_6:
.annotate 'line', 125
# debug: $I3
    $P20 = $P1.'getbool'('debug')
    set $I3, $P20
.annotate 'line', 126
# nowarn: $I4
    $P20 = $P1.'getbool'('nowarn')
    set $I4, $P20
.annotate 'line', 127
# noan: $I5
    $P20 = $P1.'getbool'('noan')
    set $I5, $P20
.annotate 'line', 129
    unless $I1 goto __label_7
# {
.annotate 'line', 130
    $P1.'showhelp'()
# predefined exit
.annotate 'line', 131
    exit 0
# }
  __label_7: # endif
.annotate 'line', 134
    if_null $S4, __label_8
# {
.annotate 'line', 135
# var interp: $P3
    null $P3
.annotate 'line', 136
# pirop getinterp
    getinterp $P3
.annotate 'line', 137
# var lpaths: $P4
    $P4 = $P3[9]
.annotate 'line', 138
# var pathlib: $P5
    $P5 = $P4[1]
.annotate 'line', 139
# predefined string
    set $S10, $S4
    $P5.'push'($S10)
# }
  __label_8: # endif
.annotate 'line', 141
    if_null $S5, __label_9
# {
.annotate 'line', 142
# var interp: $P6
    null $P6
.annotate 'line', 143
# pirop getinterp
    getinterp $P6
.annotate 'line', 144
# var lpaths: $P7
    $P7 = $P6[9]
.annotate 'line', 145
# var pathlib: $P8
    $P8 = $P7[0]
.annotate 'line', 146
# predefined string
    set $S10, $S5
    $P8.'push'($S10)
# }
  __label_9: # endif
.annotate 'line', 149
# var compileoptions: $P9
    root_new $P9, ['parrot';'Hash']
.annotate 'line', 150
    box $P20, $I3
    $P9["debug"] = $P20
.annotate 'line', 151
    box $P21, $I5
    $P9["noan"] = $P21
.annotate 'line', 152
    box $P22, $I4
    $P9["nowarn"] = $P22
.annotate 'line', 154
    unless $I2 goto __label_10
# {
.annotate 'line', 155
    if_null $S1, __label_12
# predefined die
.annotate 'line', 156
    die "options -c and --target can't be used together"
  __label_12: # endif
.annotate 'line', 157
    $P9["target"] = "pir"
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 160
    unless_null $S1, __label_13
.annotate 'line', 161
    set $S1, ''
  __label_13: # endif
# switch
.annotate 'line', 162
    set $S10, $S1
    set $S11, ''
    if $S10 == $S11 goto __label_16
    set $S11, 'run'
    if $S10 == $S11 goto __label_17
    set $S11, 'pir'
    if $S10 == $S11 goto __label_18
    set $S11, 'include'
    if $S10 == $S11 goto __label_19
    goto __label_15
  __label_16: # case
  __label_17: # case
    goto __label_14 # break
  __label_18: # case
  __label_19: # case
.annotate 'line', 168
    set $I2, 1
.annotate 'line', 169
    $P9["target"] = $S1
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 172
    concat $S12, "Invalid target '", $S1
    concat $S12, $S12, "'"
# predefined die
    die $S12
  __label_14: # switch end
# }
  __label_11: # endif
.annotate 'line', 176
    isnull $I9, $S3
    not $I9
    unless $I9 goto __label_21
    not $I9, $I2
  __label_21:
    unless $I9 goto __label_20
# predefined die
.annotate 'line', 177
    die '-o without -c or --target is not supported yet'
  __label_20: # endif
.annotate 'line', 179
# var compiler: $P10
    $P10 = WSubId_1()
.annotate 'line', 181
# var code: $P11
    null $P11
.annotate 'line', 182
# outfilename: $S6
    null $S6
.annotate 'line', 183
# try: create handler
    new $P20, 'ExceptionHandler'
    set_label $P20, __label_22
    $P20.'handle_types'(567)
    push_eh $P20
# try: begin
# {
.annotate 'line', 184
    unless_null $S2, __label_24
# {
.annotate 'line', 185
# predefined elements
    elements $I9, __ARG_1
    ge $I9, 1, __label_26
# {
# predefined say
.annotate 'line', 186
    say "ERROR: No program specified"
.annotate 'line', 187
    $P1.'showhelp'()
# predefined exit
.annotate 'line', 188
    exit 1
# }
  __label_26: # endif
.annotate 'line', 190
# srcfilename: $S7
    $S7 = __ARG_1[0]
.annotate 'line', 191
    set $I9, $I2
    unless $I9 goto __label_28
    isnull $I9, $S3
  __label_28:
    unless $I9 goto __label_27
.annotate 'line', 192
    $P20 = WSubId_2($S7, '.pir')
    set $S6, $P20
  __label_27: # endif
.annotate 'line', 193
    $P11 = $P10.'compile_from_file'($S7, $P9 :flat :named)
# }
    goto __label_25
  __label_24: # else
# {
.annotate 'line', 197
# var output: $P12
    null $P12
.annotate 'line', 198
# var outfile: $P13
    null $P13
.annotate 'line', 199
    unless $I2 goto __label_29
# {
.annotate 'line', 200
    unless_null $S6, __label_30
.annotate 'line', 201
    set $S6, $S3
  __label_30: # endif
.annotate 'line', 202
    isnull $I9, $S6
    not $I9
    unless $I9 goto __label_33
    isne $I9, $S6, "-"
  __label_33:
    unless $I9 goto __label_31
# {
.annotate 'line', 203
# predefined open
    root_new $P13, ['parrot';'FileHandle']
    $P13.'open'($S6,'w')
.annotate 'line', 204
    set $P12, $P13
# }
    goto __label_32
  __label_31: # else
.annotate 'line', 207
# predefined getstdout
    getstdout $P12
  __label_32: # endif
.annotate 'line', 208
    $P9['output'] = $P12
# }
  __label_29: # endif
.annotate 'line', 210
# expr: $S8
    concat $S8, 'function main[main](argv){', $S2
    concat $S8, $S8, ';}'
.annotate 'line', 211
    $P11 = $P10.'compile'($S8, $P9 :flat :named)
.annotate 'line', 213
    unless $I2 goto __label_34
# {
.annotate 'line', 214
    if_null $P13, __label_36
.annotate 'line', 215
    $P13.'close'()
  __label_36: # endif
# predefined exit
.annotate 'line', 216
    exit 0
# }
    goto __label_35
  __label_34: # else
.annotate 'line', 219
    __ARG_1.'unshift'('__EVAL__')
  __label_35: # endif
# }
  __label_25: # endif
# }
# try: end
    pop_eh
    goto __label_23
.annotate 'line', 183
# catch
  __label_22:
    .get_results($P14)
    finalize $P14
    pop_eh
# {
.annotate 'line', 223
# var payload: $P15
    $P15 = $P14["payload"]
.annotate 'line', 224
    if_null $P15, __label_37
.annotate 'line', 225
    getattribute $P20, $P15, 'filename'
    getattribute $P21, $P15, 'line'
    getattribute $P22, $P15, 'message'
# predefined cry
    getstderr $P0
    print $P0, $P20
    print $P0, ':'
    print $P0, $P21
    print $P0, ': '
    print $P0, $P22
    print $P0, "\n"
    goto __label_38
  __label_37: # else
.annotate 'line', 227
    $P23 = $P14["message"]
# predefined cry
    getstderr $P0
    print $P0, $P23
    print $P0, "\n"
  __label_38: # endif
# predefined exit
.annotate 'line', 228
    exit 1
# }
# catch end
  __label_23:
.annotate 'line', 231
    unless $I2 goto __label_39
# {
.annotate 'line', 232
    unless_null $S6, __label_40
.annotate 'line', 233
    set $S6, $S3
  __label_40: # endif
.annotate 'line', 234
# create: $I6
    isnull $I6, $S6
    not $I6
    unless $I6 goto __label_41
    isne $I6, $S6, "-"
  __label_41:
.annotate 'line', 235
# var outfile: $P16
    unless $I6 goto __label_43
# predefined open
    root_new $P16, ['parrot';'FileHandle']
    $P16.'open'($S6,'w')
    goto __label_42
  __label_43:
# predefined getstdout
    getstdout $P16
  __label_42:
.annotate 'line', 236
    $P16.'print'($P11)
.annotate 'line', 237
    unless $I6 goto __label_44
.annotate 'line', 238
    $P16.'close'()
  __label_44: # endif
# predefined exit
.annotate 'line', 239
    exit 0
# }
  __label_39: # endif
.annotate 'line', 244
# var sub: $P17
    null $P17
.annotate 'line', 245
# try: create handler
    new $P20, 'ExceptionHandler'
    set_label $P20, __label_45
    push_eh $P20
# try: begin
# {
.annotate 'line', 246
    $P17 = $P11.'get_main'()
# }
# try: end
    pop_eh
    goto __label_46
.annotate 'line', 245
# catch
  __label_45:
    .get_results($P21)
    finalize $P21
    pop_eh
# {
# for loop
.annotate 'line', 249
# i: $I7
    null $I7
  __label_49: # for condition
# {
.annotate 'line', 250
    $P17 = $P11[$I7]
.annotate 'line', 251
    unless_null $P17, __label_50
    goto __label_48 # break
  __label_50: # endif
.annotate 'line', 252
# predefined string
    set $S10, $P17
    ne $S10, 'main', __label_51
    goto __label_48 # break
  __label_51: # endif
# }
  __label_47: # for iteration
.annotate 'line', 249
    inc $I7
    goto __label_49
  __label_48: # for end
.annotate 'line', 255
    unless_null $P17, __label_52
.annotate 'line', 256
    $P17 = $P11[0]
  __label_52: # endif
# }
# catch end
  __label_46:
.annotate 'line', 259
# retval: $I8
    null $I8
.annotate 'line', 260
# try: create handler
    new $P20, 'ExceptionHandler'
    set_label $P20, __label_53
    $P20.'handle_types_except'(64)
    push_eh $P20
# try: begin
# {
.annotate 'line', 261
# var retvalp: $P18
    $P18 = $P17(__ARG_1)
.annotate 'line', 262
    if_null $P18, __label_55
.annotate 'line', 263
    set $I8, $P18
  __label_55: # endif
# }
# try: end
    pop_eh
    goto __label_54
.annotate 'line', 260
# catch
  __label_53:
    .get_results($P19)
    finalize $P19
    pop_eh
# {
.annotate 'line', 266
# msg: $S9
    $S9 = $P19['message']
.annotate 'line', 267
    isnull $I9, $S9
    not $I9
    unless $I9 goto __label_57
    isne $I9, $S9, ''
  __label_57:
    unless $I9 goto __label_56
.annotate 'line', 268
# predefined cry
    getstderr $P0
    print $P0, $S9
    print $P0, "\n"
  __label_56: # endif
.annotate 'line', 269
    set $I8, 1
# }
# catch end
  __label_54:
.annotate 'line', 271
# predefined exit
    exit $I8
# }
.annotate 'line', 272

.end # main

# End generated code
