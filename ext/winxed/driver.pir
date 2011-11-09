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
    assign $P1, 12
.annotate 'line', 20
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 2
    $P3[0] = 'c'
    $P3[1] = 'Compile to pir'
.annotate 'line', 19
    $P1[0] = $P3
.annotate 'line', 21
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 2
    $P4[0] = 'e=s'
    $P4[1] = 'Evaluate'
.annotate 'line', 19
    $P1[1] = $P4
.annotate 'line', 22
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 2
    $P5[0] = 'o=s'
    $P5[1] = 'Object name'
.annotate 'line', 19
    $P1[2] = $P5
.annotate 'line', 23
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 2
    $P6[0] = 'target=s'
    $P6[1] = 'Set target type'
.annotate 'line', 19
    $P1[3] = $P6
.annotate 'line', 24
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = 'L=s'
    $P7[1] = 'Add to parrot library search path'
.annotate 'line', 19
    $P1[4] = $P7
.annotate 'line', 25
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 2
    $P8[0] = 'I=s'
    $P8[1] = 'Add to parrot include search path'
.annotate 'line', 19
    $P1[5] = $P8
.annotate 'line', 26
    root_new $P9, ['parrot';'ResizablePMCArray']
    assign $P9, 2
    $P9[0] = 'X=s'
    $P9[1] = 'Add to parrot dynext search path'
.annotate 'line', 19
    $P1[6] = $P9
.annotate 'line', 27
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 2
    $P10[0] = 'debug'
    $P10[1] = 'Set debug mode'
.annotate 'line', 19
    $P1[7] = $P10
.annotate 'line', 28
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 2
    $P11[0] = 'nowarn'
    $P11[1] = 'No warnings'
.annotate 'line', 19
    $P1[8] = $P11
.annotate 'line', 29
    root_new $P12, ['parrot';'ResizablePMCArray']
    assign $P12, 2
    $P12[0] = 'noan'
    $P12[1] = 'No code annotations'
.annotate 'line', 19
    $P1[9] = $P12
.annotate 'line', 30
    root_new $P13, ['parrot';'ResizablePMCArray']
    assign $P13, 2
    $P13[0] = 'help'
    $P13[1] = 'Show this help'
.annotate 'line', 19
    $P1[10] = $P13
.annotate 'line', 31
    root_new $P14, ['parrot';'ResizablePMCArray']
    assign $P14, 2
    $P14[0] = 'version'
    $P14[1] = 'Show version and exit'
.annotate 'line', 19
    $P1[11] = $P14
.annotate 'line', 33
    setattribute self, 'options', $P1
.annotate 'line', 34
    if_null $P1, __label_2
    iter $P15, $P1
    set $P15, 0
  __label_1: # for iteration
    unless $P15 goto __label_2
    shift $P2, $P15
.annotate 'line', 35
    $P3 = $P2[0]
    self.'push_string'($P3)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 36
    self.'notOptStop'(1)
.annotate 'line', 37
    $P4 = __ARG_1.'shift'()
    setattribute self, 'name', $P4
.annotate 'line', 38
    $P4 = self.'get_options'(__ARG_1)
    setattribute self, 'opts', $P4
# }
.annotate 'line', 39

.end # WinxedDriverOptions


.sub 'getbool' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 42
# var value: $P1
    getattribute $P2, self, 'opts'
    $P1 = $P2[__ARG_1]
.annotate 'line', 43
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 44

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 47
# var value: $P1
    getattribute $P2, self, 'opts'
    $P1 = $P2[__ARG_1]
.annotate 'line', 48
# result: $S1
    null $S1
.annotate 'line', 49
    if_null $P1, __label_1
.annotate 'line', 50
    set $S1, $P1
  __label_1: # endif
.annotate 'line', 51
    .return($S1)
# }
.annotate 'line', 52

.end # getstring


.sub 'showhelp' :method
# Body
# {
.annotate 'line', 55
    getattribute $P2, self, 'name'
# builtin say
    print 'Usage: '
    print $P2
    say ' [options] [program] [args]'
# builtin say
.annotate 'line', 56
    say '  Available options:'
.annotate 'line', 57
# l: $I1
    null $I1
.annotate 'line', 58
# i: $I2
    null $I2
.annotate 'line', 59
# var o: $P1
    null $P1
.annotate 'line', 60
    getattribute $P2, self, 'options'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 61
    $P4 = $P1[0]
    set $S2, $P4
# builtin length
    length $I3, $S2
    add $I2, $I3, 4
.annotate 'line', 62
    le $I2, $I1, __label_3
    set $I1, $I2
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 64
    getattribute $P2, self, 'options'
    if_null $P2, __label_5
    iter $P5, $P2
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P1, $P5
# {
.annotate 'line', 65
# s: $S1
    $S1 = $P1[0]
.annotate 'line', 66
# builtin length
    length $I5, $S1
    isgt $I4, $I5, 1
    unless $I4 goto __label_8
# builtin substr
    substr $S2, $S1, 1, 1
    isne $I6, $S2, '='
    set $I3, $I6
    goto __label_9
  __label_8:
    set $I3, $I4
  __label_9:
    unless $I3 goto __label_6
.annotate 'line', 67
    concat $S3, '--', $S1
    set $S1, $S3
    goto __label_7
  __label_6: # else
.annotate 'line', 69
    concat $S4, '-', $S1
    set $S1, $S4
  __label_7: # endif
.annotate 'line', 70
# builtin length
    length $I3, $S1
    sub $I2, $I1, $I3
.annotate 'line', 71
    repeat $S2, ' ', $I2
    $P2 = $P1[1]
# builtin say
    print '    '
    print $S1
    print $S2
    print '->  '
    say $P2
# }
    goto __label_4
  __label_5: # endfor
# }
.annotate 'line', 73

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

.sub 'path_option' :subid('WSubId_2')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 79
# value: $S1
    $P3 = __ARG_1.'getstring'(__ARG_2)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 80
    if_null $S1, __label_2
# {
.annotate 'line', 81
# var lpaths: $P1
# builtin getinterp
    getinterp $P3
    $P1 = $P3[9]
.annotate 'line', 82
# var pathlib: $P2
    $P2 = $P1[__ARG_3]
.annotate 'line', 83
    $P2.'push'($S1)
# }
  __label_2: # endif
# }
.annotate 'line', 85

.end # path_option


.sub 'extname' :subid('WSubId_3') :anon
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 91
# newname: $S1
    null $S1
.annotate 'line', 92
# l: $I1
# builtin length
    length $I1, __ARG_1
.annotate 'line', 93
    isgt $I3, $I1, 7
    unless $I3 goto __label_3
# builtin substr
    substr $S2, __ARG_1, -7
    iseq $I4, $S2, '.winxed'
    set $I2, $I4
    goto __label_4
  __label_3:
    set $I2, $I3
  __label_4:
    unless $I2 goto __label_1
.annotate 'line', 94
    sub $I5, $I1, 7
# builtin substr
    substr $S3, __ARG_1, 0, $I5
    concat $S4, $S3, __ARG_2
    set $S1, $S4
    goto __label_2
  __label_1: # else
.annotate 'line', 96
    concat $S5, __ARG_1, __ARG_2
    set $S1, $S5
  __label_2: # endif
.annotate 'line', 97
    .return($S1)
# }
.annotate 'line', 98

.end # extname


.sub 'getcompiler' :subid('WSubId_1') :anon
# Body
# {
.annotate 'line', 102
# var compiler: $P1
    null $P1
.annotate 'line', 103
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_1
    push_eh $P2
# try: begin
.annotate 'line', 104
# builtin load_language
    load_language 'winxed'
    compreg $P1, 'winxed'
# try: end
    pop_eh
    goto __label_2
.annotate 'line', 103
# catch
  __label_1:
    .get_results($P3)
    finalize $P3
    pop_eh
# catch end
  __label_2:
.annotate 'line', 106
    unless_null $P1, __label_3
# {
# builtin die
.annotate 'line', 114
    die "winxed: Cannot load language"
# }
  __label_3: # endif
.annotate 'line', 116
    .return($P1)
# }
.annotate 'line', 117

.end # getcompiler


.sub 'process_args' :subid('WSubId_4') :anon
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 121
# var optionset: $P1
    new $P1, [ 'WinxedDriverOptions' ]
    $P1.'WinxedDriverOptions'(__ARG_1)
.annotate 'line', 123
    $P12 = $P1.'getbool'('version')
    if_null $P12, __label_1
    unless $P12 goto __label_1
# {
.annotate 'line', 124
# var compiler: $P2
    $P2 = WSubId_1()
.annotate 'line', 125
    $P12 = $P2.'version_string'()
# builtin say
    say $P12
# builtin exit
.annotate 'line', 126
    exit 0
# }
  __label_1: # endif
.annotate 'line', 129
# help: $I1
    $P12 = $P1.'getbool'('help')
    set $I1, $P12
.annotate 'line', 130
# compileonly: $I2
    $P12 = $P1.'getbool'('c')
    set $I2, $P12
.annotate 'line', 131
# target: $S1
    $P12 = $P1.'getstring'('target')
    null $S1
    if_null $P12, __label_2
    set $S1, $P12
  __label_2:
.annotate 'line', 132
# eval: $S2
    $P12 = $P1.'getstring'('e')
    null $S2
    if_null $P12, __label_3
    set $S2, $P12
  __label_3:
.annotate 'line', 133
# objectname: $S3
    $P12 = $P1.'getstring'('o')
    null $S3
    if_null $P12, __label_4
    set $S3, $P12
  __label_4:
.annotate 'line', 134
# debug: $I3
    $P12 = $P1.'getbool'('debug')
    set $I3, $P12
.annotate 'line', 135
# nowarn: $I4
    $P12 = $P1.'getbool'('nowarn')
    set $I4, $P12
.annotate 'line', 136
# noan: $I5
    $P12 = $P1.'getbool'('noan')
    set $I5, $P12
.annotate 'line', 138
    unless $I1 goto __label_5
# {
.annotate 'line', 139
    $P1.'showhelp'()
# builtin exit
.annotate 'line', 140
    exit 0
# }
  __label_5: # endif
.annotate 'line', 143
    WSubId_2($P1, 'L', 1)
.annotate 'line', 144
    WSubId_2($P1, 'I', 0)
.annotate 'line', 145
    WSubId_2($P1, 'X', 2)
.annotate 'line', 147
# var compileoptions: $P3
    root_new $P3, ['parrot';'Hash']
.annotate 'line', 148
    $P3["debug"] = $I3
.annotate 'line', 149
    $P3["noan"] = $I5
.annotate 'line', 150
    $P3["nowarn"] = $I4
.annotate 'line', 152
    unless $I2 goto __label_6
# {
.annotate 'line', 153
    if_null $S1, __label_8
# builtin die
.annotate 'line', 154
    die "options -c and --target can't be used together"
  __label_8: # endif
.annotate 'line', 155
    $P3["target"] = "pir"
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 158
    unless_null $S1, __label_9
.annotate 'line', 159
    set $S1, ''
  __label_9: # endif
# switch
.annotate 'line', 160
    set $S7, $S1
    set $S8, ''
    if $S7 == $S8 goto __label_12
    set $S8, 'run'
    if $S7 == $S8 goto __label_13
    set $S8, 'pir'
    if $S7 == $S8 goto __label_14
    set $S8, 'include'
    if $S7 == $S8 goto __label_15
    goto __label_11
  __label_12: # case
  __label_13: # case
    goto __label_10 # break
  __label_14: # case
  __label_15: # case
.annotate 'line', 166
    set $I2, 1
.annotate 'line', 167
    $P3["target"] = $S1
    goto __label_10 # break
  __label_11: # default
.annotate 'line', 170
    concat $S9, "Invalid target '", $S1
    concat $S9, $S9, "'"
# builtin die
    die $S9
  __label_10: # switch end
# }
  __label_7: # endif
.annotate 'line', 174
    isnull $I9, $S3
    not $I9
    unless $I9 goto __label_17
    not $I10, $I2
    set $I8, $I10
    goto __label_18
  __label_17:
    set $I8, $I9
  __label_18:
    unless $I8 goto __label_16
# builtin die
.annotate 'line', 175
    die '-o without -c or --target is not supported yet'
  __label_16: # endif
.annotate 'line', 177
# var compiler: $P4
    $P4 = WSubId_1()
.annotate 'line', 179
# var code: $P5
    null $P5
.annotate 'line', 180
# outfilename: $S4
    null $S4
.annotate 'line', 181
# try: create handler
    new $P12, 'ExceptionHandler'
    set_label $P12, __label_19
    $P12.'handle_types'(567)
    push_eh $P12
# try: begin
# {
.annotate 'line', 182
    unless_null $S2, __label_21
# {
.annotate 'line', 183
# builtin elements
    elements $I8, __ARG_1
    ge $I8, 1, __label_23
# {
# builtin say
.annotate 'line', 184
    say "ERROR: No program specified"
.annotate 'line', 185
    $P1.'showhelp'()
# builtin exit
.annotate 'line', 186
    exit 1
# }
  __label_23: # endif
.annotate 'line', 188
# srcfilename: $S5
    $S5 = __ARG_1[0]
.annotate 'line', 189
    unless $I2 goto __label_25
    isnull $I9, $S3
    set $I8, $I9
    goto __label_26
  __label_25:
    set $I8, $I2
  __label_26:
    unless $I8 goto __label_24
.annotate 'line', 190
    $P12 = WSubId_3($S5, '.pir')
    set $S4, $P12
  __label_24: # endif
.annotate 'line', 191
    $P5 = $P4.'compile_from_file'($S5, $P3 :flat :named)
# }
    goto __label_22
  __label_21: # else
# {
.annotate 'line', 195
# var output: $P6
    null $P6
.annotate 'line', 196
# var outfile: $P7
    null $P7
.annotate 'line', 197
    unless $I2 goto __label_27
# {
.annotate 'line', 198
    unless_null $S4, __label_28
.annotate 'line', 199
    set $S4, $S3
  __label_28: # endif
.annotate 'line', 200
    isnull $I9, $S4
    not $I9
    unless $I9 goto __label_31
    isne $I10, $S4, "-"
    set $I8, $I10
    goto __label_32
  __label_31:
    set $I8, $I9
  __label_32:
    unless $I8 goto __label_29
# {
.annotate 'line', 201
# builtin open
    root_new $P7, ['parrot';'FileHandle']
    $P7.'open'($S4,'w')
.annotate 'line', 202
    set $P6, $P7
# }
    goto __label_30
  __label_29: # else
.annotate 'line', 205
# builtin getstdout
    getstdout $P6
  __label_30: # endif
.annotate 'line', 206
    $P3['output'] = $P6
# }
  __label_27: # endif
.annotate 'line', 208
# expr: $S6
    concat $S7, 'function main[main](argv){', $S2
    concat $S7, $S7, ';}'
    set $S6, $S7
.annotate 'line', 209
    $P5 = $P4.'compile'($S6, $P3 :flat :named)
.annotate 'line', 211
    unless $I2 goto __label_33
# {
.annotate 'line', 212
    if_null $P7, __label_35
.annotate 'line', 213
    $P7.'close'()
  __label_35: # endif
# builtin exit
.annotate 'line', 214
    exit 0
# }
    goto __label_34
  __label_33: # else
.annotate 'line', 217
    __ARG_1.'unshift'('__EVAL__')
  __label_34: # endif
# }
  __label_22: # endif
# }
# try: end
    pop_eh
    goto __label_20
.annotate 'line', 181
# catch
  __label_19:
    .get_results($P8)
    finalize $P8
    pop_eh
# {
.annotate 'line', 221
# var payload: $P9
    $P9 = $P8["payload"]
.annotate 'line', 222
    if_null $P9, __label_36
.annotate 'line', 223
    getattribute $P12, $P9, 'filename'
    getattribute $P13, $P9, 'line'
    getattribute $P14, $P9, 'message'
# builtin cry
    getstderr $P0
    print $P0, $P12
    print $P0, ':'
    print $P0, $P13
    print $P0, ': '
    print $P0, $P14
    print $P0, "\n"
    goto __label_37
  __label_36: # else
.annotate 'line', 225
    $P15 = $P8["message"]
# builtin cry
    getstderr $P0
    print $P0, $P15
    print $P0, "\n"
  __label_37: # endif
# builtin exit
.annotate 'line', 226
    exit 1
# }
# catch end
  __label_20:
.annotate 'line', 229
    unless $I2 goto __label_38
# {
.annotate 'line', 230
    unless_null $S4, __label_39
.annotate 'line', 231
    set $S4, $S3
  __label_39: # endif
.annotate 'line', 232
# create: $I6
    isnull $I8, $S4
    not $I8
    unless $I8 goto __label_40
    isne $I9, $S4, "-"
    set $I6, $I9
    goto __label_41
  __label_40:
    set $I6, $I8
  __label_41:
.annotate 'line', 233
# var outfile: $P10
    unless $I6 goto __label_43
# builtin open
    root_new $P10, ['parrot';'FileHandle']
    $P10.'open'($S4,'w')
    goto __label_42
  __label_43:
# builtin getstdout
    getstdout $P12
    set $P10, $P12
  __label_42:
.annotate 'line', 234
    $P10.'print'($P5)
.annotate 'line', 235
    unless $I6 goto __label_44
.annotate 'line', 236
    $P10.'close'()
  __label_44: # endif
# builtin exit
.annotate 'line', 237
    exit 0
# }
  __label_38: # endif
.annotate 'line', 242
# var sub: $P11
    null $P11
.annotate 'line', 243
# try: create handler
    new $P12, 'ExceptionHandler'
    set_label $P12, __label_45
    push_eh $P12
# try: begin
# {
.annotate 'line', 244
    $P11 = $P5.'get_main'()
# }
# try: end
    pop_eh
    goto __label_46
.annotate 'line', 243
# catch
  __label_45:
    .get_results($P13)
    finalize $P13
    pop_eh
# {
# for loop
.annotate 'line', 247
# i: $I7
    null $I7
  __label_49: # for condition
# {
.annotate 'line', 248
    $P11 = $P5[$I7]
.annotate 'line', 249
    unless_null $P11, __label_50
    goto __label_48 # break
  __label_50: # endif
.annotate 'line', 251
# builtin string
    set $S7, $P11
    ne $S7, 'main', __label_51
    goto __label_48 # break
  __label_51: # endif
.annotate 'line', 252
# }
  __label_47: # for iteration
.annotate 'line', 247
    inc $I7
    goto __label_49
  __label_48: # for end
.annotate 'line', 255
    unless_null $P11, __label_52
.annotate 'line', 256
    $P11 = $P5[0]
  __label_52: # endif
# }
# catch end
  __label_46:
.annotate 'line', 258
    .return($P11)
# }
.annotate 'line', 259

.end # process_args


.sub 'main' :main
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 263
# var mainsub: $P1
    $P1 = WSubId_4(__ARG_1)
.annotate 'line', 266
# retval: $I1
    null $I1
.annotate 'line', 267
# try: create handler
    new $P4, 'ExceptionHandler'
    set_label $P4, __label_1
    $P4.'handle_types_except'(64)
    push_eh $P4
# try: begin
# {
.annotate 'line', 268
# var retvalp: $P2
    $P2 = $P1(__ARG_1)
.annotate 'line', 269
    if_null $P2, __label_3
.annotate 'line', 270
    set $I1, $P2
  __label_3: # endif
# }
# try: end
    pop_eh
    goto __label_2
.annotate 'line', 267
# catch
  __label_1:
    .get_results($P3)
    finalize $P3
    pop_eh
# {
.annotate 'line', 273
# msg: $S1
    $S1 = $P3['message']
.annotate 'line', 274
    isnull $I3, $S1
    not $I3
    unless $I3 goto __label_5
    isne $I4, $S1, ''
    set $I2, $I4
    goto __label_6
  __label_5:
    set $I2, $I3
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 275
# builtin cry
    getstderr $P0
    print $P0, $S1
    print $P0, "\n"
  __label_4: # endif
.annotate 'line', 276
    set $I1, 1
# }
# catch end
  __label_2:
.annotate 'line', 278
# builtin exit
    exit $I1
# }
.annotate 'line', 279

.end # main

# End generated code
