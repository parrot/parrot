# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ 'Winxed'; 'Compiler' ]

.sub 'isspace' :subid('WSubId_22')
        .param string __ARG_1
.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 22
    iseq $I1, __ARG_1, ' '
    if $I1 goto __label_2
    iseq $I1, __ARG_1, "\n"
  __label_2:
    if $I1 goto __label_1
    iseq $I1, __ARG_1, "\t"
  __label_1:
    .return($I1)
.annotate 'line', 23

.end # isspace


.sub 'isdigit' :subid('WSubId_11')
        .param string __ARG_1
.annotate 'line', 27
    index $I2, '0123456789', __ARG_1
    isgt $I1, $I2, -1
    .return($I1)
.annotate 'line', 28

.end # isdigit


.sub 'hexdigit' :subid('WSubId_12')
        .param string __ARG_1
.annotate 'line', 32
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 33
    lt $I1, 0, __label_1
    mod $I1, $I1, 16
  __label_1: # endif
.annotate 'line', 34
    .return($I1)
.annotate 'line', 35

.end # hexdigit


.sub 'isidentstart' :subid('WSubId_23')
        .param string __ARG_1
.annotate 'line', 39
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 42
    isgt $I1, $I2, -1
.annotate 'line', 39
    .return($I1)
.annotate 'line', 43

.end # isidentstart


.sub 'isident' :subid('WSubId_10')
        .param string __ARG_1
.annotate 'line', 47
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
.annotate 'line', 51
    isgt $I1, $I2, -1
.annotate 'line', 47
    .return($I1)
.annotate 'line', 52

.end # isident


.sub 'sformat' :subid('WSubId_26')
        .param string __ARG_1
        .param pmc __ARG_2 :slurpy
.annotate 'line', 56
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 57
    $P1.'append_format'(__ARG_1, __ARG_2 :flat)
.annotate 'line', 58
    set $S1, $P1
    .return($S1)
.annotate 'line', 59

.end # sformat


.sub 'for_each' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 65
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 66
    __ARG_2($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 67

.end # for_each


.sub 'transform' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 71
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 72
    $P3 = __ARG_3($P1)
    push __ARG_2, $P3
    goto __label_1
  __label_2: # endfor
.annotate 'line', 73
    .return(__ARG_2)
.annotate 'line', 74

.end # transform


.sub 'find_same' :subid('WSubId_124')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 78
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 79
    ne_addr $P1, __ARG_2, __label_3
.annotate 'line', 80
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 81
    .return($P3)
.annotate 'line', 82

.end # find_same

.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]

.sub 'WinxedCompilerError' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
        .param int __ARG_4 :optional
.annotate 'line', 107
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 108
    box $P1, __ARG_2
    setattribute self, 'message', $P1
.annotate 'line', 109
    box $P1, __ARG_3
    setattribute self, 'filename', $P1
.annotate 'line', 110
    box $P1, __ARG_4
    setattribute self, 'line', $P1
.annotate 'line', 111

.end # WinxedCompilerError

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 96
    addattribute $P0, 'type'
.annotate 'line', 97
    addattribute $P0, 'filename'
.annotate 'line', 98
    addattribute $P0, 'line'
.annotate 'line', 99
    addattribute $P0, 'message'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Warn' :subid('WSubId_21')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.annotate 'line', 116
    getstderr $P1
.annotate 'line', 117
    $P1.'print'('WARNING: ')
.annotate 'line', 118
    $P1.'print'(__ARG_1)
.annotate 'line', 119
    if_null __ARG_2, __label_1
.annotate 'line', 120
    $P1.'print'(' near ')
.annotate 'line', 121
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
  __label_1: # endif
.annotate 'line', 123
    $P1.'print'("\n")
.annotate 'line', 124

.end # Warn


.sub 'InternalError' :subid('WSubId_6')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
.annotate 'line', 128
    unless __ARG_3 goto __label_1
.annotate 'line', 129
    __ARG_2 = __ARG_2.'getstart'()
.annotate 'line', 130
    $P2 = __ARG_2.'show'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 131
    concat $S2, __ARG_1, ' near '
    concat $S2, $S2, $S1
    set __ARG_1, $S2
  __label_1: # endif
.annotate 'line', 133
    unless __ARG_3 goto __label_4
.annotate 'line', 134
    new $P2, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 135
    $P3 = __ARG_2.'filename'()
    $P4 = __ARG_2.'linenum'()
    $P2.'WinxedCompilerError'('internal', __ARG_1, $P3, $P4)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 136
    new $P6, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P6.'WinxedCompilerError'('internal', __ARG_1)
    set $P5, $P6
    set $P1, $P5
  __label_3:
.annotate 'line', 137
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2
.annotate 'line', 138

.end # InternalError


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 142
    if_null __ARG_2, __label_1
.annotate 'line', 143
    __ARG_2 = __ARG_2.'getstart'()
  __label_1: # endif
.annotate 'line', 144
    if_null __ARG_2, __label_3
    $P1 = __ARG_2.'linenum'()
    goto __label_2
  __label_3:
    box $P1, -1
  __label_2:
    set $I1, $P1
.annotate 'line', 145
    if_null __ARG_2, __label_5
    $P1 = __ARG_2.'filename'()
    goto __label_4
  __label_5:
    box $P1, "UNKNOWN"
  __label_4:
    null $S1
    if_null $P1, __label_6
    set $S1, $P1
  __label_6:
.annotate 'line', 146
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S2, ' near ', $S3
.annotate 'line', 147
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
.annotate 'line', 149
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
.annotate 'line', 147
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1
.annotate 'line', 151

.end # SyntaxError


.sub 'NoLeftSide' :subid('WSubId_73')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 155
    WSubId_1('Not a left-side expression', __ARG_1)
.annotate 'line', 156

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_54')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 160
    concat $S1, "Expected ", __ARG_1
    WSubId_1($S1, __ARG_2)
.annotate 'line', 161

.end # Expected


.sub 'Unexpected' :subid('WSubId_55')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 165
    concat $S1, "Unexpected ", __ARG_1
    WSubId_1($S1, __ARG_2)
.annotate 'line', 166

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 170
    WSubId_1("Expected identifier", __ARG_1)
.annotate 'line', 171

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 175
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_1($S1, __ARG_2)
.annotate 'line', 176

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
.annotate 'line', 180
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 181
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 182

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
.annotate 'line', 186
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 187
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 188

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_108')
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.annotate 'line', 192
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 193
    WSubId_3(__ARG_1)
  __label_1: # endif
.annotate 'line', 194

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_68')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 198
    $P1 = __ARG_2.'get'()
.annotate 'line', 199
    WSubId_4(__ARG_1, $P1)
.annotate 'line', 200

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_110')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 204
    $P1 = __ARG_2.'get'()
.annotate 'line', 205
    WSubId_5(__ARG_1, $P1)
.annotate 'line', 206

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_75')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 210
    concat $S1, "Variable '", __ARG_1
    concat $S1, $S1, "' is not defined"
    WSubId_1($S1, __ARG_2)
.annotate 'line', 211

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
.annotate 'line', 223
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 224
    box $P1, __ARG_2
    setattribute self, 'line', $P1
.annotate 'line', 225

.end # Token


.sub 'getstart' :method
.annotate 'line', 226
    .return(self)

.end # getstart


.sub 'iseof' :method
.annotate 'line', 228
    .return(0)

.end # iseof


.sub 'iscomment' :method
.annotate 'line', 229
    .return(0)

.end # iscomment


.sub 'isidentifier' :method
.annotate 'line', 230
    .return(0)

.end # isidentifier


.sub 'isint' :method
.annotate 'line', 231
    .return(0)

.end # isint


.sub 'isfloat' :method
.annotate 'line', 232
    .return(0)

.end # isfloat


.sub 'isstring' :method
.annotate 'line', 233
    .return(0)

.end # isstring


.sub 'issinglequoted' :method
.annotate 'line', 234
    .return(0)

.end # issinglequoted


.sub 'getintvalue' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 238
    WSubId_6('Not a literal int', self)
.annotate 'line', 239

.end # getintvalue


.sub 'rawstring' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 242
    WSubId_6('Not a literal string', self)
.annotate 'line', 243

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_3 = "WSubId_3"
.annotate 'line', 246
    WSubId_3(self)
.annotate 'line', 247

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
.annotate 'line', 248
    .return(0)

.end # iskeyword


.sub 'checkkeyword' :method
.annotate 'line', 249
    .return(0)

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
.annotate 'line', 250
    .return(0)

.end # isop


.sub 'checkop' :method
.annotate 'line', 251
    .return('')

.end # checkop


.sub 'viewable' :method
.annotate 'line', 252
    .return('(unknown)')

.end # viewable


.sub 'filename' :method
.annotate 'line', 253
    getattribute $P1, self, 'file'
    .return($P1)

.end # filename


.sub 'linenum' :method
.annotate 'line', 254
    getattribute $P1, self, 'line'
    .return($P1)

.end # linenum


.sub 'show' :method
.annotate 'line', 257
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 258
    getattribute $P1, self, 'file'
    set $S2, $P1
    getattribute $P2, self, 'line'
    set $S3, $P2
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
.annotate 'line', 259

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
.annotate 'line', 219
    addattribute $P0, 'file'
.annotate 'line', 220
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
.annotate 'line', 266
    self.'Token'(__ARG_1, 0)
.annotate 'line', 267

.end # TokenEof


.sub 'iseof' :method
.annotate 'line', 268
    .return(1)

.end # iseof


.sub 'viewable' :method
.annotate 'line', 269
    .return('(End of file)')

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 262
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 277
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 278
    box $P1, __ARG_3
    setattribute self, 'str', $P1
.annotate 'line', 279

.end # TokenWithVal


.sub 'get_string' :method :vtable
.annotate 'line', 280
    getattribute $P1, self, 'str'
    .return($P1)

.end # get_string


.sub 'viewable' :method
.annotate 'line', 283
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 284

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 272
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 274
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 291
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 292

.end # TokenComment


.sub 'iscomment' :method
.annotate 'line', 293
    .return(1)

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 287
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 300
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 301

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
.annotate 'line', 304
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
.annotate 'line', 305

.end # isop


.sub 'checkop' :method
.annotate 'line', 308
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
.annotate 'line', 309

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 296
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 316
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 317

.end # TokenIdentifier


.sub 'isidentifier' :method
.annotate 'line', 318
    .return(1)

.end # isidentifier


.sub 'getidentifier' :method
.annotate 'line', 321
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 322

.end # getidentifier


.sub 'checkkeyword' :method
.annotate 'line', 325
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
.annotate 'line', 326

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
.annotate 'line', 329
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
.annotate 'line', 330

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 312
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
.annotate 'line', 335
    .return(1)

.end # isstring


.sub 'rawstring' :method
.annotate 'line', 338
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 339

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 333
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 346
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 347

.end # TokenQuoted


.sub 'get_string' :method :vtable
.annotate 'line', 350
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
.annotate 'line', 351

.end # get_string


.sub 'viewable' :method
.annotate 'line', 354
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
.annotate 'line', 355

.end # viewable


.sub 'getasquoted' :method
.annotate 'line', 358
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 359

.end # getasquoted


.sub 'getPirString' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 362
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 363
    null $S2
.annotate 'line', 364
    new $P1, 'ExceptionHandler'
    set_label $P1, __label_2
    push_eh $P1
.annotate 'line', 365
    $P0 = new ['String']
    $P0 = $S1
    $S2 = $P0.'unescape'('utf8')
    pop_eh
    goto __label_3
  __label_2:
.annotate 'line', 364
    .get_results($P2)
    finalize $P2
    pop_eh
.annotate 'line', 368
    WSubId_1("Invalid escape sequence in literal string", self)
  __label_3:
.annotate 'line', 370
    null $I1
.annotate 'line', 371
    box $P1, $S2
    if_null $P1, __label_5
    iter $P3, $P1
    set $P3, 0
  __label_4: # for iteration
    unless $P3 goto __label_5
    shift $I2, $P3
.annotate 'line', 372
    le $I2, 127, __label_6
.annotate 'line', 373
    set $I1, 1
    goto __label_5 # break
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
.annotate 'line', 377
    escape $S1, $S2
.annotate 'line', 378
    unless $I1 goto __label_8
    set $S3, "utf8:"
    goto __label_7
  __label_8:
    set $S3, ""
  __label_7:
.annotate 'line', 379
    concat $S4, $S3, '"'
    concat $S4, $S4, $S1
    concat $S4, $S4, '"'
    .return($S4)
.annotate 'line', 380

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
.annotate 'line', 342
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 387
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 388

.end # TokenSingleQuoted


.sub 'issinglequoted' :method
.annotate 'line', 389
    .return(1)

.end # issinglequoted


.sub 'get_string' :method :vtable
.annotate 'line', 392
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
.annotate 'line', 393

.end # get_string


.sub 'viewable' :method
.annotate 'line', 396
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
.annotate 'line', 397

.end # viewable


.sub 'getasquoted' :method
.annotate 'line', 400
    set $S1, ''
.annotate 'line', 401
    getattribute $P1, self, 'str'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
    if_null $S2, __label_3
    length $I1, $S2
    ne $I1, 1, __label_3
    ord $I1, $S2
    if $I1 == 34 goto __label_5
    if $I1 == 92 goto __label_6
    if $I1 == 39 goto __label_7
    goto __label_3
  __label_5: # case
  __label_6: # case
  __label_7: # case
.annotate 'line', 406
    concat $S3, '\', $S2
    set $S2, $S3
    goto __label_4 # break
  __label_3: # default
  __label_4: # switch end
.annotate 'line', 409
    concat $S1, $S1, $S2
    goto __label_1
  __label_2: # endfor
.annotate 'line', 411
    .return($S1)
.annotate 'line', 412

.end # getasquoted


.sub 'getPirString' :method
.annotate 'line', 415
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 416
    set $S2, "'"
.annotate 'line', 417
    null $I1
.annotate 'line', 418
    box $P1, $S1
    if_null $P1, __label_3
    iter $P2, $P1
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $I2, $P2
.annotate 'line', 419
    islt $I5, $I2, 32
    if $I5 goto __label_5
    isgt $I5, $I2, 127
  __label_5:
    unless $I5 goto __label_4
.annotate 'line', 420
    set $I1, 1
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 424
    null $I3
.annotate 'line', 425
    unless $I1 goto __label_6
.annotate 'line', 426
    set $S2, '"'
.annotate 'line', 427
    set $S3, ''
.annotate 'line', 428
    box $P1, $S1
    if_null $P1, __label_8
    iter $P3, $P1
    set $P3, 0
  __label_7: # for iteration
    unless $P3 goto __label_8
    shift $S4, $P3
.annotate 'line', 429
    ne $S4, '\', __label_9
.annotate 'line', 430
    concat $S3, $S3, '\\'
    goto __label_10
  __label_9: # else
.annotate 'line', 433
    ord $I4, $S4
.annotate 'line', 434
    islt $I5, $I4, 32
    if $I5 goto __label_13
    isgt $I5, $I4, 127
  __label_13:
    unless $I5 goto __label_11
.annotate 'line', 435
    le $I4, 127, __label_14
.annotate 'line', 436
    set $I3, 1
  __label_14: # endif
.annotate 'line', 437
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_15
    set $S5, $P1
  __label_15:
.annotate 'line', 438
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
    goto __label_12
  __label_11: # else
.annotate 'line', 441
    concat $S3, $S3, $S4
  __label_12: # endif
  __label_10: # endif
    goto __label_7
  __label_8: # endfor
.annotate 'line', 444
    set $S1, $S3
  __label_6: # endif
.annotate 'line', 446
    concat $S6, $S2, $S1
    concat $S6, $S6, $S2
    set $S1, $S6
.annotate 'line', 447
    unless $I3 goto __label_16
.annotate 'line', 448
    concat $S6, 'utf8:', $S1
    set $S1, $S6
  __label_16: # endif
.annotate 'line', 449
    .return($S1)
.annotate 'line', 450

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 383
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 457
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 458

.end # TokenInteger


.sub 'isint' :method
.annotate 'line', 459
    .return(1)

.end # isint


.sub 'getintvalue' :method
.annotate 'line', 462
    getattribute $P1, self, 'str'
    set $I1, $P1
    .return($I1)
.annotate 'line', 463

.end # getintvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
.annotate 'line', 453
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 470
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 471

.end # TokenFloat


.sub 'isfloat' :method
.annotate 'line', 472
    .return(1)

.end # isfloat


.sub 'getfloatvalue' :method
.annotate 'line', 476
    getattribute $P1, self, 'str'
    set $N1, $P1
.annotate 'line', 477
    .return($N1)
.annotate 'line', 478

.end # getfloatvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
.annotate 'line', 466
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'TokenError' :subid('WSubId_7')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 488
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
.annotate 'line', 490
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
.annotate 'line', 488
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1
.annotate 'line', 491

.end # TokenError


.sub 'UnterminatedString' :subid('WSubId_8')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 495
    WSubId_7('Unterminated string', __ARG_1, __ARG_2)
.annotate 'line', 496

.end # UnterminatedString


.sub 'UnterminatedHeredoc' :subid('WSubId_9')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 500
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_2)
.annotate 'line', 501

.end # UnterminatedHeredoc


.sub 'UnclosedComment' :subid('WSubId_13')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 505
    WSubId_7("Unclosed comment", __ARG_1, __ARG_2)
.annotate 'line', 506

.end # UnclosedComment


.sub 'getquoted' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
.annotate 'line', 510
    set $S1, ''
.annotate 'line', 511
    null $S2
.annotate 'line', 512
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
    if $S2 == "" goto __label_6
    if $S2 == "\n" goto __label_7
    if $S2 == '\' goto __label_8
    goto __label_4
  __label_6: # case
  __label_7: # case
.annotate 'line', 516
    WSubId_8(__ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 519
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 520
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 521
    WSubId_8(__ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 522
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 525
    concat $S1, $S1, $S2
  __label_5: # switch end
  __label_1: # for iteration
.annotate 'line', 512
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 528
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 529

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
.annotate 'line', 533
    set $S1, ''
.annotate 'line', 534
    null $S2
.annotate 'line', 535
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
.annotate 'line', 536
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 537
    WSubId_8(__ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 538
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 535
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 540
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 541

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_18')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_9 = "WSubId_9"
.annotate 'line', 545
    set $S1, ''
.annotate 'line', 546
    null $S2
.annotate 'line', 547
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
    if $S2 == '' goto __label_6
    if $S2 == '"' goto __label_7
    if $S2 == '\' goto __label_8
    goto __label_4
  __label_6: # case
.annotate 'line', 550
    WSubId_9(__ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 555
    concat $S6, '\', $S2
    set $S2, $S6
    goto __label_5 # break
  __label_4: # default
  __label_5: # switch end
.annotate 'line', 558
    concat $S5, $S1, $S2
    set $S1, $S5
  __label_1: # for iteration
.annotate 'line', 547
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 560
    concat $S5, $S1, ':>>'
    set $S1, $S5
.annotate 'line', 562
    set $S3, ''
.annotate 'line', 563
    null $S4
  __label_9: # do
.annotate 'line', 565
    set $S4, ''
.annotate 'line', 566
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
    if $S2 == '' goto __label_17
    if $S2 == '"' goto __label_18
    if $S2 == '\' goto __label_19
    goto __label_15
  __label_17: # case
.annotate 'line', 569
    WSubId_9(__ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 572
    concat $S6, '\', $S2
    set $S2, $S6
    goto __label_16 # break
  __label_15: # default
  __label_16: # switch end
.annotate 'line', 575
    concat $S4, $S4, $S2
  __label_12: # for iteration
.annotate 'line', 566
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 577
    eq $S4, $S1, __label_20
.annotate 'line', 578
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
  __label_11: # continue
.annotate 'line', 579
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 580
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 581

.end # getheredoc


.sub 'getident' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_10 = "WSubId_10"
.annotate 'line', 585
    set $S1, __ARG_2
.annotate 'line', 586
    null $S2
.annotate 'line', 587
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    $P2 = WSubId_10($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 588
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 587
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_3
  __label_2: # for end
.annotate 'line', 589
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 590
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 591

.end # getident


.sub 'getnumber' :subid('WSubId_24')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_12 = "WSubId_12"
.annotate 'line', 595
    null $S1
.annotate 'line', 596
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 598
    concat $S1, $S1, $S2
.annotate 'line', 599
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # continue
.annotate 'line', 600
    $P1 = WSubId_11($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 601
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
.annotate 'line', 602
    null $I1
    null $I2
.annotate 'line', 603
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
    $P2 = WSubId_12($S2)
    set $I2, $P2
    lt $I2, 0, __label_8
.annotate 'line', 604
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 605
    concat $S1, $S1, $S2
  __label_7: # for iteration
.annotate 'line', 603
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 607
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 608
    set $S1, $I1
.annotate 'line', 609
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
.annotate 'line', 611
    ne $S2, '.', __label_10
  __label_12: # do
.annotate 'line', 613
    concat $S1, $S1, $S2
.annotate 'line', 614
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # continue
.annotate 'line', 615
    $P1 = WSubId_11($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 616
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
.annotate 'line', 617
    concat $S1, $S1, 'E'
.annotate 'line', 618
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
.annotate 'line', 619
    concat $S1, $S1, $S2
.annotate 'line', 620
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_17: # endif
  __label_21: # for condition
.annotate 'line', 622
    $P1 = WSubId_11($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 623
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 622
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_21
  __label_20: # for end
  __label_15: # endif
.annotate 'line', 625
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 626
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
    goto __label_11
  __label_10: # else
.annotate 'line', 629
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
.annotate 'line', 630
    concat $S1, $S1, 'E'
.annotate 'line', 631
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
.annotate 'line', 632
    concat $S1, $S1, $S2
.annotate 'line', 633
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_25: # endif
  __label_29: # for condition
.annotate 'line', 635
    $P1 = WSubId_11($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 636
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 635
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_29
  __label_28: # for end
.annotate 'line', 637
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 638
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
    goto __label_23
  __label_22: # else
.annotate 'line', 641
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 642
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
  __label_23: # endif
  __label_11: # endif
.annotate 'line', 645

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_19')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.annotate 'line', 649
    set $S1, __ARG_2
.annotate 'line', 650
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
  __label_3: # for condition
    isne $I1, $S2, ''
    unless $I1 goto __label_5
    isne $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_2
.annotate 'line', 651
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 650
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 652
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 653

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_13 = "WSubId_13"
.annotate 'line', 657
    set $S1, __ARG_2
.annotate 'line', 658
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
  __label_7: # for condition
.annotate 'line', 660
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 661
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 660
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 662
    ne $S2, '', __label_9
.annotate 'line', 663
    WSubId_13(__ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 664
    concat $S1, $S1, $S2
.annotate 'line', 665
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 666
    ne $S2, '', __label_10
.annotate 'line', 667
    WSubId_13(__ARG_1, __ARG_3)
  __label_10: # endif
  __label_4: # continue
.annotate 'line', 668
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 669
    concat $S1, $S1, '/'
.annotate 'line', 670
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 671

.end # getcomment


.sub 'getop' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.annotate 'line', 675
    set $S1, __ARG_2
.annotate 'line', 676
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 677

.end # getop

.namespace [ 'Winxed'; 'Compiler'; 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_14 = "WSubId_14"
.const 'Sub' WSubId_15 = "WSubId_15"
.const 'Sub' WSubId_16 = "WSubId_16"
.const 'Sub' WSubId_17 = "WSubId_17"
.const 'Sub' WSubId_18 = "WSubId_18"
.const 'Sub' WSubId_19 = "WSubId_19"
.const 'Sub' WSubId_20 = "WSubId_20"
.annotate 'line', 694
    not $I1, __ARG_3
    new $P3, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P3
.annotate 'line', 695
    setattribute self, 'h', __ARG_1
.annotate 'line', 696
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 697
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 698
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 699
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 700
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 701
    root_new $P2, ['parrot';'Hash']
    $P2[''] = WSubId_14
    $P2['{'] = WSubId_15
    $P1['$'] = $P2
    $P1['"'] = WSubId_16
    $P1["'"] = WSubId_17
.annotate 'line', 704
    root_new $P3, ['parrot';'Hash']
.annotate 'line', 705
    root_new $P4, ['parrot';'Hash']
    $P4[''] = WSubId_15
    $P4['='] = WSubId_15
    $P3['='] = $P4
    $P3[':'] = WSubId_15
    $P1['='] = $P3
.annotate 'line', 708
    root_new $P5, ['parrot';'Hash']
    $P5['+'] = WSubId_15
    $P5['='] = WSubId_15
    $P1['+'] = $P5
.annotate 'line', 709
    root_new $P6, ['parrot';'Hash']
    $P6['-'] = WSubId_15
    $P6['='] = WSubId_15
    $P1['-'] = $P6
.annotate 'line', 710
    root_new $P7, ['parrot';'Hash']
    $P7['='] = WSubId_15
    $P1['*'] = $P7
.annotate 'line', 711
    root_new $P8, ['parrot';'Hash']
    $P8['|'] = WSubId_15
    $P1['|'] = $P8
.annotate 'line', 712
    root_new $P9, ['parrot';'Hash']
    $P9['&'] = WSubId_15
    $P1['&'] = $P9
.annotate 'line', 713
    root_new $P10, ['parrot';'Hash']
.annotate 'line', 714
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_15
    $P11[':'] = WSubId_18
    $P10['<'] = $P11
    $P10['='] = WSubId_15
    $P1['<'] = $P10
.annotate 'line', 717
    root_new $P12, ['parrot';'Hash']
    $P12['>'] = WSubId_15
    $P12['='] = WSubId_15
    $P1['>'] = $P12
.annotate 'line', 718
    root_new $P13, ['parrot';'Hash']
.annotate 'line', 719
    root_new $P14, ['parrot';'Hash']
    $P14[''] = WSubId_15
    $P14['='] = WSubId_15
    $P13['='] = $P14
    $P1['!'] = $P13
.annotate 'line', 721
    root_new $P15, ['parrot';'Hash']
    $P15['%'] = WSubId_15
    $P15['='] = WSubId_15
    $P1['%'] = $P15
.annotate 'line', 722
    root_new $P16, ['parrot';'Hash']
    $P16['='] = WSubId_15
    $P16['/'] = WSubId_19
    $P16['*'] = WSubId_20
    $P1['/'] = $P16
    $P1['#'] = WSubId_19
.annotate 'line', 725
    setattribute self, 'select', $P1
.annotate 'line', 726

.end # Tokenizer


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_21 = "WSubId_21"
.annotate 'line', 729
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 730
    WSubId_21(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 731

.end # warn


.sub 'getchar' :method
.annotate 'line', 734
    getattribute $P1, self, 'pending'
.annotate 'line', 735
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 736
    eq $S1, '', __label_2
.annotate 'line', 737
    assign $P1, ''
    goto __label_3
  __label_2: # else
.annotate 'line', 739
    getattribute $P2, self, 'h'
.annotate 'line', 740
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 741
    ne $S1, "\n", __label_4
.annotate 'line', 742
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 744
    .return($S1)
.annotate 'line', 745

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
.annotate 'line', 748
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
.annotate 'line', 749

.end # ungetchar


.sub 'get_token' :method
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_23 = "WSubId_23"
.const 'Sub' WSubId_14 = "WSubId_14"
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_15 = "WSubId_15"
.annotate 'line', 752
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 753
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 755
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 756
    $P3 = WSubId_22($S1)
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 757
    $P4 = self.'getchar'()
    set $S1, $P4
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 758
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 759
    ne $S1, '', __label_5
.annotate 'line', 760
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
.annotate 'line', 761
    $P3 = WSubId_23($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 762
    .tailcall WSubId_14(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 763
    $P3 = WSubId_11($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 764
    .tailcall WSubId_24(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 766
    set $S2, $S1
.annotate 'line', 767
    getattribute $P1, self, 'select'
.annotate 'line', 768
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 770
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 771
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 772
    set $P1, $P2
.annotate 'line', 773
    $P2 = $P1[$S1]
.annotate 'line', 774
    unless_null $P2, __label_11
.annotate 'line', 775
    self.'ungetchar'($S1)
.annotate 'line', 776
    $P2 = $P1['']
    goto __label_12
  __label_11: # else
.annotate 'line', 779
    concat $S2, $S2, $S1
  __label_12: # endif
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 781
    if_null $P2, __label_14
.annotate 'line', 782
    $P3 = $P2(self, $S2, $I1)
    goto __label_13
  __label_14:
.annotate 'line', 783
    $P4 = WSubId_15(self, $S2, $I1)
    set $P3, $P4
  __label_13:
.annotate 'line', 781
    .return($P3)
.annotate 'line', 784

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
.annotate 'line', 787
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 788
    $P3 = $P1.'iseof'()
    isfalse $I1, $P3
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    box $P2, $I1
    unless $P2 goto __label_3
    $P2 = $P1.'iscomment'()
  __label_3:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 789
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 790
    .return($P1)
.annotate 'line', 791

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
.annotate 'line', 794
    getattribute $P1, self, 'stacked'
    push $P1, __ARG_1
.annotate 'line', 795

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 685
    addattribute $P0, 'warnings'
.annotate 'line', 686
    addattribute $P0, 'h'
.annotate 'line', 687
    addattribute $P0, 'pending'
.annotate 'line', 688
    addattribute $P0, 'select'
.annotate 'line', 689
    addattribute $P0, 'stacked'
.annotate 'line', 690
    addattribute $P0, 'filename'
.annotate 'line', 691
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'typetoregcheck' :subid('WSubId_112')
        .param string __ARG_1
    if __ARG_1 == 'int' goto __label_3
    if __ARG_1 == 'float' goto __label_4
    if __ARG_1 == 'string' goto __label_5
    if __ARG_1 == 'var' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 824
    .return('I')
  __label_4: # case
.annotate 'line', 825
    .return('N')
  __label_5: # case
.annotate 'line', 826
    .return('S')
  __label_6: # case
.annotate 'line', 827
    .return('P')
  __label_1: # default
.annotate 'line', 828
    .return('')
  __label_2: # switch end
.annotate 'line', 830

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_122')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
    if_null __ARG_1, __label_1
    length $I1, __ARG_1
    ne $I1, 1, __label_1
    ord $I1, __ARG_1
    if $I1 == 73 goto __label_3
    if $I1 == 78 goto __label_4
    if $I1 == 83 goto __label_5
    if $I1 == 80 goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 835
    .return('int')
  __label_4: # case
.annotate 'line', 836
    .return('num')
  __label_5: # case
.annotate 'line', 837
    .return('string')
  __label_6: # case
.annotate 'line', 838
    .return('pmc')
  __label_1: # default
.annotate 'line', 839
    WSubId_6('Invalid reg type')
  __label_2: # switch end
.annotate 'line', 841

.end # typetopirname

.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 863
    setattribute self, 'handle', __ARG_1
.annotate 'line', 864
    box $P1, ""
    setattribute self, 'file', $P1
.annotate 'line', 865
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 866
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 867
    box $P1, 0
    setattribute self, 'pendingl', $P1
.annotate 'line', 868
    not $I1, __ARG_2
    new $P2, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P2
.annotate 'line', 869

.end # Emit


.sub 'setDebug' :method
.annotate 'line', 872
    box $P1, 1
    setattribute self, 'debug', $P1
.annotate 'line', 873

.end # setDebug


.sub 'getDebug' :method
.annotate 'line', 876
    getattribute $P1, self, 'debug'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 877

.end # getDebug


.sub 'disable_annotations' :method
.annotate 'line', 880
    box $P1, 1
    setattribute self, 'noan', $P1
.annotate 'line', 881

.end # disable_annotations


.sub 'close' :method
.annotate 'line', 884
    null $P1
    setattribute self, 'handle', $P1
.annotate 'line', 885

.end # close


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_21 = "WSubId_21"
.annotate 'line', 888
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 889
    WSubId_21(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 890

.end # warn


.sub 'updateannot' :method
.annotate 'line', 893
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 894
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'file', '"
.annotate 'line', 896
    getattribute $P4, self, 'file'
.annotate 'line', 894
    $P3[1] = $P4
    $P3[2] = "'\n"
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 899
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
  __label_1: # endif
.annotate 'line', 901
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 902
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'line', "
.annotate 'line', 904
    getattribute $P4, self, 'line'
.annotate 'line', 902
    $P3[1] = $P4
    $P3[2] = "\n"
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 907
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
  __label_2: # endif
.annotate 'line', 909

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
.annotate 'line', 912
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 913
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 914

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
.annotate 'line', 917
    self.'updateannot'()
.annotate 'line', 918
    self.'vprint'(__ARG_1)
.annotate 'line', 919

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
.annotate 'line', 922
    self.'updateannot'()
.annotate 'line', 923
    self.'vprint'(__ARG_1)
.annotate 'line', 924
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
.annotate 'line', 925

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 928
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
.annotate 'line', 930
    getattribute $P1, self, 'file'
.annotate 'line', 931
    getattribute $P2, self, 'line'
.annotate 'line', 932
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 933
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 934
    set $S2, $P1
    eq $S2, $S1, __label_3
.annotate 'line', 935
    assign $P1, $S1
.annotate 'line', 936
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 937
    assign $P2, 0
  __label_3: # endif
.annotate 'line', 939
    set $I2, $P2
    eq $I2, $I1, __label_4
.annotate 'line', 940
    assign $P2, $I1
.annotate 'line', 941
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
  __label_4: # endif
  __label_1: # endif
.annotate 'line', 944

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
.annotate 'line', 947
    self.'updateannot'()
.annotate 'line', 948
    getattribute $P1, self, 'handle'
    concat $S1, "# ", __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
.annotate 'line', 949

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 952
    getattribute $P1, self, 'handle'
.annotate 'line', 953
    $P1.'print'('  ')
.annotate 'line', 954
    $P1.'print'(__ARG_1)
.annotate 'line', 955
    $P1.'print'(":")
.annotate 'line', 956
    if_null __ARG_2, __label_1
.annotate 'line', 957
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 958
    $P1.'print'("\n")
.annotate 'line', 959

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 962
    getattribute $P1, self, 'handle'
.annotate 'line', 963
    $P1.'print'("    goto ")
.annotate 'line', 964
    $P1.'print'(__ARG_1)
.annotate 'line', 965
    if_null __ARG_2, __label_1
.annotate 'line', 966
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 967
    $P1.'print'("\n")
.annotate 'line', 968

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 972
    self.'say'('    ', __ARG_1, " ", __ARG_2)
.annotate 'line', 973

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 976
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 977

.end # emitarg2


.sub 'emitarg3' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 980
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 981

.end # emitarg3


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 984
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 985

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 988
    self.'say'("    if ", __ARG_1, " goto ", __ARG_2)
.annotate 'line', 989

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 992
    self.'say'("    unless ", __ARG_1, " goto ", __ARG_2)
.annotate 'line', 993

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 996
    self.'say'("    if_null ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 997

.end # emitif_null


.sub 'emitunless_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1000
    self.'say'("    unless_null ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1001

.end # emitunless_null


.sub 'emitnull' :method
        .param string __ARG_1
.annotate 'line', 1004
    self.'say'("    null ", __ARG_1)
.annotate 'line', 1005

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
.annotate 'line', 1009
    self.'say'("    inc ", __ARG_1)
.annotate 'line', 1010

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
.annotate 'line', 1013
    self.'say'("    dec ", __ARG_1)
.annotate 'line', 1014

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1017
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1018

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1021
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1022

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1025
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1026

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1029
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1030

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 1033
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 1034

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1037
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1038

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1041
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1042

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1045
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1046

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1049
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1050

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1053
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1054

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1057
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1058

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1061
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1062

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1065
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1066

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1069
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1070

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
.annotate 'line', 1073
    self.'say'("    print ", __ARG_1)
.annotate 'line', 1074

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
.annotate 'line', 1077
    self.'say'("    say ", __ARG_1)
.annotate 'line', 1078

.end # emitsay


.sub 'emitget_hll_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1081
    concat $S1, ", ", __ARG_2
    self.'say'("    get_hll_namespace ", __ARG_1, $S1)
.annotate 'line', 1082

.end # emitget_hll_namespace


.sub 'emitget_root_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1085
    concat $S1, ", ", __ARG_2
    self.'say'("    get_root_namespace ", __ARG_1, $S1)
.annotate 'line', 1086

.end # emitget_root_namespace


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
.annotate 'line', 1089
    self.'print'("    get_hll_global ", __ARG_1)
.annotate 'line', 1090
    if_null __ARG_3, __label_1
.annotate 'line', 1091
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1092
    self.'say'(", '", __ARG_2, "'")
.annotate 'line', 1093

.end # emitget_hll_global


.sub 'emitget_root_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
.annotate 'line', 1096
    self.'print'("    get_root_global ", __ARG_1)
.annotate 'line', 1097
    if_null __ARG_3, __label_1
.annotate 'line', 1098
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1099
    self.'say'(", '", __ARG_2, "'")
.annotate 'line', 1100

.end # emitget_root_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1103
    self.'say'("    find_lex ", __ARG_1, ", '", __ARG_2, "'")
.annotate 'line', 1104

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1107
    self.'say'("    store_lex '", __ARG_1, "', ", __ARG_2)
.annotate 'line', 1108

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 852
    addattribute $P0, 'handle'
.annotate 'line', 853
    addattribute $P0, 'file'
.annotate 'line', 854
    addattribute $P0, 'line'
.annotate 'line', 855
    addattribute $P0, 'pendingf'
.annotate 'line', 856
    addattribute $P0, 'pendingl'
.annotate 'line', 857
    addattribute $P0, 'debug'
.annotate 'line', 858
    addattribute $P0, 'noan'
.annotate 'line', 859
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 1133
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 1134

.end # integerValue


.sub 'floatValue' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
.annotate 'line', 1138
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenFloat'($P3, $P4, __ARG_3)
    set $P1, $P2
.annotate 'line', 1139
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
.annotate 'line', 1140

.end # floatValue


.sub 'stringQuotedValue' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 1144
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, __ARG_3)
    set $P1, $P2
.annotate 'line', 1145
    new $P3, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P3.'StringLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
.annotate 'line', 1146

.end # stringQuotedValue


.sub 'floatresult' :subid('WSubId_79')
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1154
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1155
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1156
    .return($I1)
.annotate 'line', 1157

.end # floatresult


.sub 'floatAsString' :subid('WSubId_74')
        .param num __ARG_1
.annotate 'line', 1167
    null $S1
    set $S1, __ARG_1
.annotate 'line', 1169
    box $P2, $S1
    $P1 = $P2.'is_integer'($S1)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 1170
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1171
    .return($S1)
.annotate 'line', 1172

.end # floatAsString


.sub 'createPredefConstInt' :subid('WSubId_138')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1183
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P3.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
    set $P1, $P3
.annotate 'line', 1185
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1186
    $P3 = WSubId_25(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
.annotate 'line', 1187

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_128')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1191
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P3.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
    set $P1, $P3
.annotate 'line', 1193
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1194
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1195
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1194
    $P2.'setvalue'($P3)
.annotate 'line', 1196

.end # createPredefConstString


.sub 'string_from_literal' :subid('WSubId_28')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1210
    null $S1
.annotate 'line', 1212
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1215
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1218
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1213
    getattribute $P1, __ARG_1, 'numval'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1216
    $P2 = __ARG_1.'getFloatValue'()
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1219
    $P3 = __ARG_1.'get_value'()
    set $S1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1222
    WSubId_6('wrong call to string_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1224
    .return($S1)
.annotate 'line', 1225

.end # string_from_literal


.sub 'int_from_literal' :subid('WSubId_29')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1229
    null $I1
.annotate 'line', 1231
    $I2 = __ARG_1.'isintegerliteral'()
    if $I2 goto __label_3
.annotate 'line', 1234
    $I2 = __ARG_1.'isfloatliteral'()
    if $I2 goto __label_4
.annotate 'line', 1237
    $I2 = __ARG_1.'isstringliteral'()
    if $I2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1232
    getattribute $P1, __ARG_1, 'numval'
    set $I1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1235
    $P2 = __ARG_1.'getFloatValue'()
    set $I1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1238
    $P3 = __ARG_1.'get_value'()
    set $I1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1241
    WSubId_6('wrong call to int_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1243
    .return($I1)
.annotate 'line', 1244

.end # int_from_literal


.sub 'float_from_literal' :subid('WSubId_113')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1248
    null $N1
.annotate 'line', 1250
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1251
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1254
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
  __label_4: # case
.annotate 'line', 1252
    $P1 = __ARG_1.'getFloatValue'()
    set $N1, $P1
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1255
    $P2 = __ARG_1.'get_value'()
    set $N1, $P2
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1258
    WSubId_6('wrong call to float_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1260
    .return($N1)
.annotate 'line', 1261

.end # float_from_literal

.namespace [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]

.sub 'Builtin_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1288
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1289
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1290
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1291
    split $P1, "\n", __ARG_2
    join $S1, "\n    ", $P1
    concat $S2, '    ', $S1
    set __ARG_2, $S2
.annotate 'line', 1292
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1293
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
.annotate 'line', 1294

.end # Builtin_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 1297
    getattribute $P1, self, 'typeresult'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1299
    ne $S1, 'v', __label_2
.annotate 'line', 1300
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_4, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1301
    WSubId_1('using return value from void builtin', __ARG_3)
  __label_4: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 1304
    isnull $I1, __ARG_4
    if $I1 goto __label_7
    iseq $I1, __ARG_4, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1305
    WSubId_6('Bad result in non void builtin')
  __label_6: # endif
  __label_3: # endif
.annotate 'line', 1308
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1309
    getattribute $P2, self, 'body'
    $P1 = WSubId_26($P2, __ARG_4, __ARG_5 :flat)
    __ARG_1.'say'($P1)
.annotate 'line', 1310

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
.annotate 'line', 1267
    addattribute $P0, 'body'
.annotate 'line', 1268
    addattribute $P0, 'typeresult'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]

.sub 'BuiltinBase' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param string __ARG_6
        .param string __ARG_7
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1331
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1332
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1333
    new $P3, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
    $P3.'Builtin_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1335
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1336
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1337
    null $I1
.annotate 'line', 1338
    if_null __ARG_4, __label_3
.annotate 'line', 1339
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
    if_null __ARG_4, __label_4
    length $I2, __ARG_4
    ne $I2, 1, __label_4
    ord $I2, __ARG_4
    if $I2 == 42 goto __label_6
    if $I2 == 33 goto __label_7
    goto __label_4
  __label_6: # case
.annotate 'line', 1342
    set $I1, -1
    goto __label_5 # break
  __label_7: # case
.annotate 'line', 1345
    set $I1, -2
.annotate 'line', 1346
    if_null __ARG_5, __label_8
.annotate 'line', 1347
    concat $S1, "Invalid builtin '", __ARG_1
    concat $S1, $S1, '"'
    WSubId_6($S1)
  __label_8: # endif
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 1350
    set $I1, 1
.annotate 'line', 1351
    if_null __ARG_5, __label_9
.annotate 'line', 1352
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1353
    inc $I1
  __label_9: # endif
.annotate 'line', 1355
    if_null __ARG_6, __label_10
.annotate 'line', 1356
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1357
    inc $I1
  __label_10: # endif
.annotate 'line', 1359
    if_null __ARG_7, __label_11
.annotate 'line', 1360
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1361
    inc $I1
  __label_11: # endif
  __label_5: # switch end
  __label_3: # endif
.annotate 'line', 1365
    box $P1, $I1
    setattribute self, 'nparams', $P1
.annotate 'line', 1366

.end # BuiltinBase


.sub 'iscompileevaluable' :method
.annotate 'line', 1369
    .return(0)
.annotate 'line', 1370

.end # iscompileevaluable


.sub 'name' :method
.annotate 'line', 1373
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1374
    .return($S1)
.annotate 'line', 1375

.end # name


.sub 'result' :method
.annotate 'line', 1378
    getattribute $P1, self, 'typeresult'
    .return($P1)
.annotate 'line', 1379

.end # result


.sub 'params' :method
.annotate 'line', 1380
    getattribute $P1, self, 'nparams'
    .return($P1)

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1383
    null $S1
    if __ARG_1 == 0 goto __label_3
    if __ARG_1 == 1 goto __label_4
    if __ARG_1 == 2 goto __label_5
    if __ARG_1 == 3 goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 1385
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 1386
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 1387
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 1388
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 1390
    WSubId_6('Invalid builtin arg')
  __label_2: # switch end
.annotate 'line', 1392
    .return($S1)
.annotate 'line', 1393

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1396
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1398
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 1400
    eq $S1, '__ASSERT__', __label_3
.annotate 'line', 1401
    concat $S3, 'builtin ', $S1
    __ARG_1.'comment'($S3)
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 1404
    getattribute $P2, self, 'typeresult'
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 1405
    isne $I1, $S2, 'v'
    unless $I1 goto __label_6
    iseq $I1, __ARG_4, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 1406
    $P2 = __ARG_2.'tempreg'($S2)
    set __ARG_4, $P2
  __label_5: # endif
.annotate 'line', 1407
    getattribute $P1, self, 'body'
.annotate 'line', 1408
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 1409

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
.annotate 'line', 1315
    addattribute $P0, 'name'
.annotate 'line', 1316
    addattribute $P0, 'body'
.annotate 'line', 1317
    addattribute $P0, 'typeresult'
.annotate 'line', 1318
    addattribute $P0, 'type0'
.annotate 'line', 1319
    addattribute $P0, 'type1'
.annotate 'line', 1320
    addattribute $P0, 'type2'
.annotate 'line', 1321
    addattribute $P0, 'type3'
.annotate 'line', 1322
    addattribute $P0, 'nparams'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]

.sub 'BuiltinFunction' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
.annotate 'line', 1421
    self.'BuiltinBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 1422

.end # BuiltinFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1412
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]

.sub 'BuiltinFunctionEval' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
        .param string __ARG_8 :optional
.annotate 'line', 1435
    self.'BuiltinBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1436
    setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1437

.end # BuiltinFunctionEval


.sub 'iscompileevaluable' :method
.annotate 'line', 1440
    .return(1)
.annotate 'line', 1441

.end # iscompileevaluable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1425
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
.annotate 'line', 1427
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]

.sub 'Builtin_typecast' :method
        .param string __ARG_1
.annotate 'line', 1449
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 1450

.end # Builtin_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1453
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1454
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1455
    WSubId_6("Invalid Builtin_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1456
    $P1 = __ARG_5[0]
.annotate 'line', 1457
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 1459
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1460
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1461
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1464
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1465
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1467
    ne $S3, 'null', __label_9
.annotate 'line', 1468
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1470
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
.annotate 'line', 1472

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
.annotate 'line', 1446
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'builtineval_stringcast' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 1477
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1478
    $P2 = WSubId_28($P1)
    .tailcall WSubId_27(__ARG_1, __ARG_2, $P2)
.annotate 'line', 1479

.end # builtineval_stringcast


.sub 'builtineval_intcast' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1483
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1484
    $P2 = WSubId_29($P1)
    set $I1, $P2
.annotate 'line', 1485
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1486

.end # builtineval_intcast


.sub 'Builtin_varcast' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1490
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1491
    WSubId_6("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1492
    $P1 = __ARG_5[0]
.annotate 'line', 1493
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 1494
    ne $S1, 'P', __label_3
.annotate 'line', 1495
    null $S2
.annotate 'line', 1496
    null $P2
.annotate 'line', 1498
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1514
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1499
    $P7 = $P1.'getName'()
    set $S2, $P7
.annotate 'line', 1500
    $P8 = $P1.'checkIdentifier'()
    null $S3
    if_null $P8, __label_9
    set $S3, $P8
  __label_9:
.annotate 'line', 1501
    $P3 = $P1.'checkVar'()
.annotate 'line', 1502
    isne $I2, $S3, ''
    unless $I2 goto __label_13
    isnull $I2, $P3
    not $I2
  __label_13:
    unless $I2 goto __label_12
    $P9 = $P3.'issubid'()
    isfalse $I2, $P9
  __label_12:
    unless $I2 goto __label_10
.annotate 'line', 1504
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_11
  __label_10: # else
.annotate 'line', 1507
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 1
    $P7[0] = $S2
    $P2 = $P1.'scopesearch'($P7, 0)
.annotate 'line', 1508
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 1509
    getattribute $P7, $P2, 'owner'
    $P4 = $P7.'getpath'()
.annotate 'line', 1510
    $P7 = WSubId_30($P4)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
  __label_14: # endif
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1517
    new $P5, ['ResizableStringArray']
.annotate 'line', 1518
    $P1.'buildkey'($P5)
.annotate 'line', 1519
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1520
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_17
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_17:
    unless $I1 goto __label_16
.annotate 'line', 1521
    getattribute $P7, $P2, 'owner'
    $P6 = $P7.'getpath'()
.annotate 'line', 1522
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1523
    $P7 = WSubId_30($P6)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
  __label_16: # endif
.annotate 'line', 1525
    $P7 = $P5.'pop'()
    set $S2, $P7
.annotate 'line', 1526
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1527
    $P8 = WSubId_30($P5)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P8)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1530
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1531
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
    goto __label_4
  __label_3: # else
.annotate 'line', 1535
    $P7 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_18
    set $S4, $P7
  __label_18:
.annotate 'line', 1536
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1537
    ne $S4, 'null', __label_19
.annotate 'line', 1538
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_20
  __label_19: # else
.annotate 'line', 1540
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_20: # endif
  __label_4: # endif
.annotate 'line', 1542

.end # Builtin_varcast


.sub 'Builtin_say' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1546
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1547
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1548
    lt $I1, 0, __label_1
.annotate 'line', 1549
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1550
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1549
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1551
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 1554
    __ARG_1.'emitsay'("''")
  __label_2: # endif
.annotate 'line', 1555

.end # Builtin_say


.sub 'emit_printP0' :subid('WSubId_32')
        .param string __ARG_1
.annotate 'line', 1559
    concat $S1, "    print $P0, ", __ARG_1
    .return($S1)
.annotate 'line', 1560

.end # emit_printP0


.sub 'Builtin_cry' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_32 = "WSubId_32"
.annotate 'line', 1564
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1571
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P2 = WSubId_31(__ARG_5, $P3, WSubId_32)
    join $S1, "\n", $P2
.annotate 'line', 1565
    $P1 = WSubId_26("    getstderr $P0\n%0\n    print $P0, \"\\n\"\n", $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 1572

.end # Builtin_cry


.sub 'Builtin_print' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1576
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1577
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1578
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1579

.end # Builtin_print


.sub 'Builtin_ASSERT' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 1585
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1586
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1587
    $P3 = __ARG_2.'genlabel'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 1588
    $P1 = __ARG_5[0]
.annotate 'line', 1589
    $P2 = $P1.'emit_getint'(__ARG_1)
.annotate 'line', 1590
    __ARG_1.'emitif'($P2, $S1)
.annotate 'line', 1599
    $P4 = __ARG_3.'filename'()
    $P5 = __ARG_3.'linenum'()
.annotate 'line', 1591
    $P3 = WSubId_26("    getstderr $P0\n    print $P0, \"Assertion failed at '%0' line \"\n    print $P0, %1\n    print $P0, \"\\n\"\n    exit 1\n", $P4, $P5)
    __ARG_1.'print'($P3)
.annotate 'line', 1600
    __ARG_1.'emitlabel'($S1)
  __label_1: # endif
.annotate 'line', 1602

.end # Builtin_ASSERT


.sub 'Builtin_invoke' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 1608
    $P1 = __ARG_5[0]
.annotate 'line', 1609
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1610
    WSubId_1("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1611
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 1612

.end # Builtin_invoke


.sub 'builtineval_length' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1616
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1617
    $P2 = WSubId_28($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1618
    length $I1, $S1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1619

.end # builtineval_length


.sub 'builtineval_bytelength' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1623
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1624
    $P2 = WSubId_28($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1625
    bytelength $I1, $S1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1626

.end # builtineval_bytelength


.sub 'builtineval_ord' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1630
    elements $I1, __ARG_3
.annotate 'line', 1631
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1632
    $P3 = WSubId_28($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1633
    null $I2
.annotate 'line', 1634
    le $I1, 1, __label_2
.annotate 'line', 1635
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1636
    $P3 = WSubId_29($P2)
    set $I2, $P3
  __label_2: # endif
.annotate 'line', 1638
    ord $I3, $S1, $I2
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I3)
.annotate 'line', 1639

.end # builtineval_ord


.sub 'builtineval_chr' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_29 = "WSubId_29"
.annotate 'line', 1643
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1644
    $P2 = WSubId_29($P1)
    set $I1, $P2
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1645

.end # builtineval_chr


.sub 'builtineval_substr' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 1649
    elements $I1, __ARG_3
.annotate 'line', 1650
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1651
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1652
    $P4 = WSubId_28($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1653
    $P4 = WSubId_29($P2)
    set $I2, $P4
.annotate 'line', 1654
    null $S2
.annotate 'line', 1655
    set $I4, __ARG_3
    le $I4, 2, __label_2
.annotate 'line', 1656
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1657
    $P4 = WSubId_29($P3)
    set $I3, $P4
.annotate 'line', 1658
    substr $S2, $S1, $I2, $I3
    goto __label_3
  __label_2: # else
.annotate 'line', 1661
    substr $S2, $S1, $I2
  __label_3: # endif
.annotate 'line', 1662
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S2)
.annotate 'line', 1663

.end # builtineval_substr


.sub 'builtineval_indexof' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1667
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1668
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1669
    $P3 = WSubId_28($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1670
    $P3 = WSubId_28($P2)
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1671
    index $I1, $S1, $S2
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1672

.end # builtineval_indexof


.sub 'builtineval_indexof_pos' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1676
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1677
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1678
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1679
    $P4 = WSubId_28($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1680
    $P4 = WSubId_28($P2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1681
    $P6 = __ARG_3[2]
    getattribute $P5, $P6, 'arg'
    $P4 = WSubId_29($P5)
    set $I1, $P4
.annotate 'line', 1682
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I2)
.annotate 'line', 1683

.end # builtineval_indexof_pos


.sub 'builtineval_escape' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 1687
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1691
    $P2 = WSubId_28($P1)
    set $S3, $P2
    escape $S2, $S3
    escape $S1, $S2
.annotate 'line', 1690
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1692

.end # builtineval_escape


.sub 'builtin_sleep' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1696
    $P1 = __ARG_5[0]
.annotate 'line', 1697
    null $S1
.annotate 'line', 1698
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
    if_null $S2, __label_2
    length $I1, $S2
    ne $I1, 1, __label_2
    ord $I1, $S2
    if $I1 == 73 goto __label_4
    if $I1 == 78 goto __label_5
    goto __label_2
  __label_4: # case
.annotate 'line', 1701
    $P2 = $P1.'emit_getint'(__ARG_1)
    set $S1, $P2
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 1704
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 1707
    $P4 = $P1.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 1708
    set $S1, "0"
    goto __label_7
  __label_6: # else
.annotate 'line', 1710
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 1711
    set $S1, "$N0"
.annotate 'line', 1712
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1713
    __ARG_1.'emitset'($S1, $S3)
  __label_7: # endif
  __label_3: # switch end
.annotate 'line', 1716
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1717
    __ARG_1.'emitarg1'('sleep', $S1)
.annotate 'line', 1718

.end # builtin_sleep


.sub 'getbuiltins' :subid('WSubId_139')
        .param pmc __ARG_1
.const 'Sub' WSubId_33 = "WSubId_33"
.const 'Sub' WSubId_34 = "WSubId_34"
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_49 = "WSubId_49"
.annotate 'line', 1722
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1724
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('I')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('int', WSubId_33, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1722
    __ARG_1.'add'($P1)
.annotate 'line', 1727
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1728
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('N')
    set $P3, $P4
    $P2.'BuiltinFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1727
    __ARG_1.'add'($P1)
.annotate 'line', 1731
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1733
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('S')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('string', WSubId_34, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1731
    __ARG_1.'add'($P1)
.annotate 'line', 1736
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('var', WSubId_35, 'P', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1740
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1744
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1748
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1752
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1756
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sleep', WSubId_36, 'v', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1760
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1764
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1768
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1772
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1776
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1783
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1790
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1797
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1805
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1814
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1824
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1828
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('length', WSubId_37, 'length %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1833
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('bytelength', WSubId_38, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1838
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('chr', WSubId_39, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1847
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('ord', WSubId_40, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1852
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('ord', WSubId_40, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1857
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('substr', WSubId_41, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1862
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('substr', WSubId_41, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1867
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1871
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('indexof', WSubId_42, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1876
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('indexof', WSubId_43, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1881
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1885
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('escape', WSubId_44, 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1890
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1898
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1906
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1913
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1920
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1924
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1928
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1932
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1936
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1943
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1950
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1954
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unshift', 'unshift %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1958
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_var', 'pop %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1962
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_var', 'shift %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1966
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_int', 'pop %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1970
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_int', 'shift %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1974
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_float', 'pop %0, %1', 'N', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1978
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_float', 'shift %0, %1', 'N', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1982
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_string', 'pop %0, %1', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1986
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_string', 'shift %0, %1', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1990
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1994
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1998
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2002
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2006
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2010
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2014
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2018
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2022
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2026
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2030
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2034
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2038
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2051
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2055
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2059
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2063
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2067
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2071
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2075
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2079
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2083
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2087
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2091
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2098
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2105
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2109
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2113
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2117
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2121
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2125
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('print', WSubId_45, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2129
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('say', WSubId_46, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2133
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cry', WSubId_47, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2137
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('__ASSERT__', WSubId_48, 'v', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2141
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('invoke', WSubId_49, 'P', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2145

.end # getbuiltins


.sub 'optimize_array' :subid('WSubId_52')
        .param pmc __ARG_1
.annotate 'line', 2153
    if_null __ARG_1, __label_2
    elements $I1, __ARG_1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
.annotate 'line', 2154
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 2155
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_3: # for iteration
.annotate 'line', 2154
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 2156

.end # optimize_array


.sub 'emit_array' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2160
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 2161
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2162

.end # emit_array


.sub 'parseDotted' :subid('WSubId_69')
        .param pmc __ARG_1
.annotate 'line', 2166
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2167
    $P2 = __ARG_1.'get'()
.annotate 'line', 2168
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2169
    push $P1, $P2
  __label_3: # while
.annotate 'line', 2170
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2171
    $P2 = __ARG_1.'get'()
.annotate 'line', 2172
    push $P1, $P2
    goto __label_3
  __label_2: # endwhile
  __label_1: # endif
.annotate 'line', 2175
    __ARG_1.'unget'($P2)
.annotate 'line', 2176
    .return($P1)
.annotate 'line', 2177

.end # parseDotted


.sub 'parseList' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 2185
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2186
    null $P2
  __label_1: # do
.annotate 'line', 2188
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 2189
    push $P1, $P3
  __label_3: # continue
.annotate 'line', 2190
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 2191
    unless_null __ARG_4, __label_4
.annotate 'line', 2192
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2194
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 2195
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 2196
    .return($P1)
.annotate 'line', 2197

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.annotate 'line', 2202
    $P1 = __ARG_1.'get'()
.annotate 'line', 2203
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2204
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 2205
    .return($P1)
.annotate 'line', 2206

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_70')
        .param pmc __ARG_1
.annotate 'line', 2210
    new $P1, ['ResizableStringArray']
.annotate 'line', 2211
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 2212
    $P4 = $P2.'getidentifier'()
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2213
    .return($P1)
.annotate 'line', 2214

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2227
    setattribute self, 'start', __ARG_1
.annotate 'line', 2228
    setattribute self, 'owner', __ARG_2
.annotate 'line', 2229

.end # initbase


.sub 'getstart' :method
.annotate 'line', 2232
    getattribute $P1, self, 'start'
    .return($P1)
.annotate 'line', 2233

.end # getstart


.sub 'viewable' :method
.annotate 'line', 2236
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2237
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2239
    .return("")
  __label_2: # endif
.annotate 'line', 2240

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 2243
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 2244

.end # annotate


.sub 'getpath' :method
.annotate 'line', 2247
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()
.annotate 'line', 2248

.end # getpath


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 2251
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 2252

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 2255
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 2256

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 2259
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
.annotate 'line', 2260

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 2263
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
.annotate 'line', 2264

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 2267
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 2268

.end # scopesearch


.sub 'dowarnings' :method
.annotate 'line', 2271
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 2272

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 2222
    addattribute $P0, 'start'
.annotate 'line', 2223
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2289
    setattribute self, 'owner', __ARG_1
.annotate 'line', 2290
    setattribute self, 'e', __ARG_2
.annotate 'line', 2291

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 2295
    getattribute $P1, self, 'e'
.annotate 'line', 2296
    null $S1
.annotate 'line', 2297
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2298
    getattribute $P2, self, 'pnull'
.annotate 'line', 2299
    unless_null $P2, __label_3
.annotate 'line', 2300
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2301
    $P1.'emitnull'($S2)
.annotate 'line', 2302
    box $P2, $S2
    setattribute self, 'pnull', $P2
  __label_3: # endif
.annotate 'line', 2304
    set $S1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 2307
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2308
    .return($S1)
.annotate 'line', 2309

.end # add

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
.annotate 'line', 2284
    addattribute $P0, 'owner'
.annotate 'line', 2285
    addattribute $P0, 'e'
.annotate 'line', 2286
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2324
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_51, __ARG_3)
    setattribute self, 'args', $P2
.annotate 'line', 2325

.end # SimpleArgList


.sub 'numargs' :method
.annotate 'line', 2329
    getattribute $P1, self, 'args'
    elements $I1, $P1
    .return($I1)
.annotate 'line', 2330

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 2333
    getattribute $P1, self, 'args'
.annotate 'line', 2334
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 2335

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2339
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 2340

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 2343
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2344
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2345
    $P5 = $P2.'emit_get'(__ARG_1)
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2346
    .return($P1)
.annotate 'line', 2347

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 2350
    $P1 = self.'getargvalues'(__ARG_1)
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
.annotate 'line', 2351

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2320
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
.annotate 'line', 2363
    getattribute $P1, self, 'name'
    .return($P1)

.end # getname


.sub 'numargs' :method
.annotate 'line', 2366
    getattribute $P1, self, 'args'
.annotate 'line', 2367
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2368
    .return($I1)
.annotate 'line', 2369

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2372
    getattribute $P1, self, 'args'
.annotate 'line', 2373
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2374
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2375
    .tailcall $P1.'getarg'(__ARG_1)
.annotate 'line', 2376

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2379
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2380
    if_null __ARG_2, __label_1
.annotate 'line', 2381
    setattribute self, 'args', __ARG_2
  __label_1: # endif
.annotate 'line', 2382

.end # Modifier


.sub 'optimize' :method
.annotate 'line', 2385
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2386
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2387
    .return(self)
.annotate 'line', 2388

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2360
    addattribute $P0, 'name'
.annotate 'line', 2361
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2393
    $P1 = __ARG_1.'get'()
.annotate 'line', 2394
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2395
    $P1 = __ARG_1.'get'()
.annotate 'line', 2396
    null $P2
.annotate 'line', 2397
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2398
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2400
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2401
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
.annotate 'line', 2402

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_53 = "WSubId_53"
.annotate 'line', 2411
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_53, ']')
    setattribute self, 'list', $P2
.annotate 'line', 2412

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2415
    getattribute $P1, self, 'list'
    WSubId_52($P1)
.annotate 'line', 2416

.end # optimize


.sub 'getlist' :method
.annotate 'line', 2417
    getattribute $P1, self, 'list'
    .return($P1)

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
.annotate 'line', 2420
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 2421
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2422
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2424
    .return($P2)
.annotate 'line', 2425

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2407
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_30')
        .param pmc __ARG_1
.annotate 'line', 2434
    null $S1
.annotate 'line', 2435
    elements $I1, __ARG_1
    unless $I1 goto __label_1
.annotate 'line', 2436
    join $S2, "'; '", __ARG_1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 2437
    .return($S1)
.annotate 'line', 2438

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2442
    $P1 = __ARG_2.'get'()
.annotate 'line', 2444
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2446
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2448
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2445
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2447
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2449
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2451
    __ARG_2.'unget'($P1)
.annotate 'line', 2452
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
.annotate 'line', 2454

.end # parseUsing


.sub 'parseSig' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2458
    new $P4, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P4.'SigParameterList'(__ARG_2, __ARG_3)
    set $P1, $P4
.annotate 'line', 2459
    $P2 = __ARG_2.'get'()
.annotate 'line', 2460
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2461
    WSubId_54("'='", $P2)
  __label_1: # endif
.annotate 'line', 2462
    $P3 = WSubId_51(__ARG_2, __ARG_3)
.annotate 'line', 2463
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 2464

.end # parseSig


.sub 'parseClassSpecifier' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 2468
    $P1 = __ARG_1.'get'()
.annotate 'line', 2469
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2470
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 2471
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 2472
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 2473
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2474
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 2475
    WSubId_1('Invalid class', $P1)
.annotate 'line', 2476

.end # parseClassSpecifier


.sub 'parseStatement' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_61 = "WSubId_61"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_64 = "WSubId_64"
.const 'Sub' WSubId_65 = "WSubId_65"
.annotate 'line', 2480
    $P1 = __ARG_1.'get'()
.annotate 'line', 2481
    null $P2
.annotate 'line', 2482
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2483
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2484
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2485
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2486
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2487
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2488
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 2489
    $P3 = __ARG_1.'get'()
.annotate 'line', 2490
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2491
    WSubId_55("':'", $P1)
  __label_5: # endif
.annotate 'line', 2492
    .tailcall WSubId_56($P1, __ARG_1, __ARG_2)
  __label_4: # endif
.annotate 'line', 2495
    $P5 = $P1.'checkkeyword'()
    set $S1, $P5
    if $S1 == 'using' goto __label_8
    if $S1 == 'const' goto __label_9
    if $S1 == 'volatile' goto __label_10
    if $S1 == 'var' goto __label_11
    if $S1 == 'string' goto __label_12
    if $S1 == 'int' goto __label_13
    if $S1 == 'float' goto __label_14
    if $S1 == 'return' goto __label_15
    if $S1 == 'yield' goto __label_16
    if $S1 == 'goto' goto __label_17
    if $S1 == 'if' goto __label_18
    if $S1 == 'while' goto __label_19
    if $S1 == 'do' goto __label_20
    if $S1 == 'continue' goto __label_21
    if $S1 == 'break' goto __label_22
    if $S1 == 'switch' goto __label_23
    if $S1 == 'for' goto __label_24
    if $S1 == 'throw' goto __label_25
    if $S1 == 'try' goto __label_26
    goto __label_6
  __label_8: # case
.annotate 'line', 2497
    .tailcall WSubId_57($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2499
    .tailcall WSubId_58($P1, __ARG_1, __ARG_2)
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 2502
    .tailcall WSubId_59($P1, __ARG_1, __ARG_2)
    goto __label_7 # break
  __label_11: # case
.annotate 'line', 2505
    $P2 = __ARG_1.'get'()
.annotate 'line', 2506
    __ARG_1.'unget'($P2)
.annotate 'line', 2507
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2508
    .tailcall WSubId_60($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_7 # break
  __label_12: # case
.annotate 'line', 2511
    $P2 = __ARG_1.'get'()
.annotate 'line', 2512
    __ARG_1.'unget'($P2)
.annotate 'line', 2513
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2514
    .tailcall WSubId_61($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 2517
    $P2 = __ARG_1.'get'()
.annotate 'line', 2518
    __ARG_1.'unget'($P2)
.annotate 'line', 2519
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2520
    .tailcall WSubId_62($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_7 # break
  __label_14: # case
.annotate 'line', 2523
    $P2 = __ARG_1.'get'()
.annotate 'line', 2524
    __ARG_1.'unget'($P2)
.annotate 'line', 2525
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2526
    .tailcall WSubId_63($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_7 # break
  __label_15: # case
.annotate 'line', 2529
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2531
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2533
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2535
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2537
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2539
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2541
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2543
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2545
    .tailcall WSubId_64($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2547
    .tailcall WSubId_65($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2549
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2551
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_6: # default
  __label_7: # switch end
.annotate 'line', 2554
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
.annotate 'line', 2555
    $P4 = __ARG_1.'get'()
.annotate 'line', 2556
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2557
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2558
    __ARG_1.'unget'($P4)
  __label_31: # endif
.annotate 'line', 2560
    __ARG_1.'unget'($P1)
.annotate 'line', 2561
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
.annotate 'line', 2562

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2572
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 2573

.end # Statement


.sub 'isempty' :method
.annotate 'line', 2574
    .return(0)

.end # isempty


.sub 'allowtailcall' :method
.annotate 'line', 2577
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
.annotate 'line', 2578

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 2581
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
.annotate 'line', 2582

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 2585
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 2586

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 2589
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
.annotate 'line', 2590

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 2593
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 2594

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2597
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
.annotate 'line', 2598

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2601
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
.annotate 'line', 2602

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2605
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2606

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2609
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2610

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2613
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
.annotate 'line', 2614

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 2617
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2618

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 2621
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
.annotate 'line', 2622

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 2625
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 2626

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 2629
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
.annotate 'line', 2630

.end # usenamespace


.sub 'getouter' :method
.annotate 'line', 2637
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
.annotate 'line', 2638

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.annotate 'line', 2641
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
.annotate 'line', 2642

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.annotate 'line', 2645
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
.annotate 'line', 2646

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2649
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2651
    .return(self)
.annotate 'line', 2652

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2568
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
.annotate 'line', 2657
    .return(1)

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2660
    WSubId_6('Attempt to annotate empty statement')
.annotate 'line', 2661

.end # annotate


.sub 'optimize' :method
.annotate 'line', 2662
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2655
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
.annotate 'line', 2675
    getattribute $P1, self, 'statements'
.annotate 'line', 2676
    elements $I1, $P1
.annotate 'line', 2677
    set $I2, 1
.annotate 'line', 2678
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
.annotate 'line', 2679
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2680
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2681
    null $I2
  __label_4: # endif
.annotate 'line', 2682
    $P1[$I3] = $P2
  __label_1: # for iteration
.annotate 'line', 2678
    inc $I3
    goto __label_3
  __label_2: # for end
    unless $I2 goto __label_7
.annotate 'line', 2684
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
.annotate 'line', 2685

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2671
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2692
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2693
    setattribute self, 'statements', $P1
.annotate 'line', 2694

.end # MultiStatement


.sub 'isempty' :method
.annotate 'line', 2695
    .return(0)

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
.annotate 'line', 2698
    getattribute $P1, self, 'statements'
    push $P1, __ARG_1
.annotate 'line', 2699
    .return(self)
.annotate 'line', 2700

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 2703
    getattribute $P1, self, 'statements'
    WSubId_66(__ARG_1, $P1)
.annotate 'line', 2704

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2688
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2710
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2712
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2711
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2713
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2715
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
.annotate 'line', 2717

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2725
    null $P1
.annotate 'line', 2726
    $P2 = __ARG_1.'get'()
.annotate 'line', 2727
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2728
    $P2 = __ARG_1.'get'()
.annotate 'line', 2729
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2730
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 2733
    __ARG_1.'unget'($P2)
.annotate 'line', 2734
    $P1 = WSubId_51(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 2736
    .return($P1)
.annotate 'line', 2737

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2746
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2747
    $P1 = __ARG_2.'get'()
.annotate 'line', 2748
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2749
    unless $I1 goto __label_1
.annotate 'line', 2750
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2751
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2752
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2753
    $P1 = __ARG_2.'get'()
.annotate 'line', 2754
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
.annotate 'line', 2755
    __ARG_2.'unget'($P1)
.annotate 'line', 2756
    $P3 = WSubId_50(__ARG_2, __ARG_3, WSubId_67, '}')
    setattribute self, 'args', $P3
  __label_5: # endif
.annotate 'line', 2758
    WSubId_68(';', __ARG_2)
.annotate 'line', 2759

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2762
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 2763
    .return(self)
.annotate 'line', 2764

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2767
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2768
    self.'annotate'(__ARG_1)
.annotate 'line', 2769
    $P4 = __ARG_1.'getDebug'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 2770
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
  __label_2: # endif
.annotate 'line', 2771
    getattribute $P1, self, 'args'
.annotate 'line', 2772
    __ARG_1.'print'('    ')
.annotate 'line', 2773
    unless_null $P1, __label_3
.annotate 'line', 2774
    __ARG_1.'say'($S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2776
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2777
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
.annotate 'line', 2778
    $P4 = $P3.'emit_get'(__ARG_1)
    push $P2, $P4
    goto __label_5
  __label_6: # endfor
.annotate 'line', 2779
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
  __label_4: # endif
.annotate 'line', 2781

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2739
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2741
    addattribute $P0, 'opname'
.annotate 'line', 2742
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 2793
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2794
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2795
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2796
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2797
    WSubId_68(';', __ARG_2)
.annotate 'line', 2798
    $P3 = WSubId_70($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2799
    .return(self)
.annotate 'line', 2800

.end # ExternStatement


.sub 'optimize' :method
.annotate 'line', 2801
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2804
    self.'annotate'(__ARG_1)
.annotate 'line', 2805
    getattribute $P1, self, 'path'
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
.annotate 'line', 2806

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2788
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2790
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_71 = "WSubId_71"
.annotate 'line', 2818
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2819
    null $P3
    $P1 = WSubId_50(__ARG_2, $P3, WSubId_71, ';')
.annotate 'line', 2820
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2821
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2822
    self.'createvarnamed'($P2, 'P', $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2824
    setattribute self, 'names', $P1
.annotate 'line', 2825

.end # StaticStatement


.sub 'optimize' :method
.annotate 'line', 2828
    .return(self)
.annotate 'line', 2829

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2832
    self.'annotate'(__ARG_1)
.annotate 'line', 2833
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 2834
    $P2 = self.'getvar'($P1)
.annotate 'line', 2835
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2837

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2813
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2815
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2851
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2852
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2853
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2854
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2855
    WSubId_68(';', __ARG_2)
.annotate 'line', 2856
    setattribute self, 'path', $P1
.annotate 'line', 2857

.end # UsingStatement


.sub 'optimize' :method
.annotate 'line', 2860
    getattribute $P1, self, 'path'
.annotate 'line', 2861
    $P2 = $P1[-1]
.annotate 'line', 2863
    $P3 = self.'scopesearch'($P1, 0)
.annotate 'line', 2865
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2879
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2866
    elements $I2, $P1
    unless $I2 goto __label_5
.annotate 'line', 2867
    clone $P4, $P1
.annotate 'line', 2868
    $P4.'pop'()
.annotate 'line', 2869
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2870
    if_null $P5, __label_6
.annotate 'line', 2871
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2872
    if_null $P3, __label_7
.annotate 'line', 2873
    self.'createvarused'($P2, $P3)
.annotate 'line', 2874
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_7: # endif
  __label_6: # endif
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2880
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2881
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2882
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2883
    self.'usesubid'($S1)
.annotate 'line', 2884
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2886
    self.'createvar'($P2, 'P')
.annotate 'line', 2887
    .return(self)
.annotate 'line', 2888

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2891
    getattribute $P1, self, 'path'
.annotate 'line', 2892
    $S1 = $P1[-1]
.annotate 'line', 2893
    $P2 = self.'getvar'($S1)
.annotate 'line', 2894
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
.annotate 'line', 2895
    self.'annotate'(__ARG_1)
.annotate 'line', 2896
    null $S2
.annotate 'line', 2897
    elements $I1, $P1
    le $I1, 1, __label_2
.annotate 'line', 2898
    $P1.'pop'()
.annotate 'line', 2899
    $P3 = WSubId_30($P1)
    set $S2, $P3
  __label_2: # endif
.annotate 'line', 2901
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
  __label_1: # endif
.annotate 'line', 2903

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2844
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2846
    addattribute $P0, 'path'
.annotate 'line', 2847
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 2913
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2914
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2915
    WSubId_54('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2916
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2917
    unless_null $P2, __label_2
.annotate 'line', 2918
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2919
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2920

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2926
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2927
    WSubId_72(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2928
    WSubId_68(';', __ARG_2)
.annotate 'line', 2929

.end # UsingNamespaceStatement


.sub 'optimize' :method
.annotate 'line', 2932
    .return(self)
.annotate 'line', 2933

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2922
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 2948
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2949
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2950
    null $P2
  __label_1: # do
.annotate 'line', 2952
    $P3 = WSubId_51(__ARG_2, self)
.annotate 'line', 2953
    $P1.'push'($P3)
  __label_3: # continue
.annotate 'line', 2954
    $P2 = __ARG_2.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 2955
    WSubId_4(';', $P2)
.annotate 'line', 2956
    setattribute self, 'expr', $P1
.annotate 'line', 2957

.end # ExprStatement


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2960
    getattribute $P1, self, 'expr'
    WSubId_52($P1)
.annotate 'line', 2961
    .return(self)
.annotate 'line', 2962

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2965
    getattribute $P2, self, 'expr'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 2966
    $P1.'emit_void'(__ARG_1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2967

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2943
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2945
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
.annotate 'line', 2984
    setattribute self, 'type', __ARG_1
.annotate 'line', 2985
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2986
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2987
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2988

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
.annotate 'line', 2991
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
.annotate 'line', 2992

.end # setlex


.sub 'gettype' :method
.annotate 'line', 2993
    getattribute $P1, self, 'type'
    .return($P1)

.end # gettype


.sub 'getreg' :method
.annotate 'line', 2994
    getattribute $P1, self, 'reg'
    .return($P1)

.end # getreg


.sub 'getscope' :method
.annotate 'line', 2995
    getattribute $P1, self, 'scope'
    .return($P1)

.end # getscope


.sub 'getvalue' :method
.annotate 'line', 2996
    getattribute $P1, self, 'value'
    .return($P1)

.end # getvalue


.sub 'isconst' :method
.annotate 'line', 2997
    .return(0)

.end # isconst


.sub 'getlex' :method
.annotate 'line', 2998
    getattribute $P1, self, 'lexname'
    .return($P1)

.end # getlex


.sub 'getflags' :method
.annotate 'line', 2999
    getattribute $P1, self, 'flags'
    .return($P1)

.end # getflags


.sub 'issubid' :method
.annotate 'line', 3002
    getattribute $P1, self, 'reg'
.annotate 'line', 3003
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_1
    set $S2, $P1
    substr $S1, $S2, 0, 7
    iseq $I1, $S1, 'WSubId_'
  __label_1:
    .return($I1)
.annotate 'line', 3004

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2976
    addattribute $P0, 'type'
.annotate 'line', 2977
    addattribute $P0, 'reg'
.annotate 'line', 2978
    addattribute $P0, 'scope'
.annotate 'line', 2979
    addattribute $P0, 'flags'
.annotate 'line', 2980
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
.annotate 'line', 3012
    setattribute self, 'name', __ARG_1
.annotate 'line', 3013

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3016
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
.annotate 'line', 3017

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 3009
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3026
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
.annotate 'line', 3027

.end # VarData_const


.sub 'isconst' :method
.annotate 'line', 3028
    .return(1)

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3031
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 3032
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 3033
    setattribute self, 'value', __ARG_1
.annotate 'line', 3034

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 3020
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 3022
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'VarContainer' :method
.annotate 'line', 3045
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
.annotate 'line', 3046

.end # VarContainer


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3049
    getattribute $P1, self, 'locals'
.annotate 'line', 3050
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3051
    $P2 = $P1[$S1]
.annotate 'line', 3052
    if_null $P2, __label_2
.annotate 'line', 3053
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 3054
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 3055
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, $S2, self, __ARG_3)
    set $P3, $P4
.annotate 'line', 3056
    $P1[$S1] = $P3
.annotate 'line', 3057
    .return($P3)
.annotate 'line', 3058

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3061
    getattribute $P1, self, 'locals'
.annotate 'line', 3062
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3063
    $P2 = $P1[$S1]
.annotate 'line', 3064
    if_null $P2, __label_2
.annotate 'line', 3065
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3066
    $P1[$S1] = __ARG_2
.annotate 'line', 3067

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3070
    getattribute $P1, self, 'locals'
.annotate 'line', 3071
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3072
    $P2 = $P1[$S1]
.annotate 'line', 3073
    if_null $P2, __label_2
.annotate 'line', 3074
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3075
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
.annotate 'line', 3076

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3079
    getattribute $P1, self, 'locals'
.annotate 'line', 3080
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3081
    $P2 = $P1[$S1]
.annotate 'line', 3082
    if_null $P2, __label_2
.annotate 'line', 3083
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3084
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P4.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
    set $P3, $P4
.annotate 'line', 3085
    $P1[$S1] = $P3
.annotate 'line', 3086
    .return($P3)
.annotate 'line', 3087

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
.annotate 'line', 3090
    getattribute $P1, self, 'locals'
.annotate 'line', 3091
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
.annotate 'line', 3092

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
.annotate 'line', 3095
    null $P1
.annotate 'line', 3096
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 3097
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 3098
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 3100
    .return($P3)
.annotate 'line', 3101

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3104
    null $P1
.annotate 'line', 3105
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 3106
    .return($P1)
  __label_1: # endif
.annotate 'line', 3107
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 3108
    .return($P1)
  __label_2: # endif
.annotate 'line', 3109
    getattribute $P2, self, 'owner'
.annotate 'line', 3110
    if_null $P2, __label_3
.annotate 'line', 3111
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 3112
    .return($P3)
.annotate 'line', 3113

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
.annotate 'line', 3116
    $P1 = self.'getouter'()
.annotate 'line', 3117
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3118
    .return($S1)
.annotate 'line', 3119

.end # makelexical


.sub 'makelexicalself' :method
.annotate 'line', 3122
    set $P1, self
.annotate 'line', 3124
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 3125
    .return('__WLEX_self')
.annotate 'line', 3126

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 3040
    addattribute $P0, 'locals'
.annotate 'line', 3041
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]

.sub 'BlockStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3139
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 3140
    self.'VarContainer'()
.annotate 'line', 3141

.end # BlockStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 3135
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3152
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 3153

.end # Expr


.sub 'issimple' :method
.annotate 'line', 3154
    .return(0)

.end # issimple


.sub 'isliteral' :method
.annotate 'line', 3155
    .return(0)

.end # isliteral


.sub 'isintegerliteral' :method
.annotate 'line', 3156
    .return(0)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3157
    .return(0)

.end # isintegerzero


.sub 'isfloatliteral' :method
.annotate 'line', 3158
    .return(0)

.end # isfloatliteral


.sub 'isstringliteral' :method
.annotate 'line', 3159
    .return(0)

.end # isstringliteral


.sub 'isidentifier' :method
.annotate 'line', 3160
    .return(0)

.end # isidentifier


.sub 'isnull' :method
.annotate 'line', 3161
    .return(0)

.end # isnull


.sub 'hascompilevalue' :method
.annotate 'line', 3162
    .return(0)

.end # hascompilevalue


.sub 'isnegable' :method
.annotate 'line', 3163
    .return(0)

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
.annotate 'line', 3166
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 3167

.end # tempreg


.sub 'genlabel' :method
.annotate 'line', 3170
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 3171

.end # genlabel


.sub 'optimize' :method
.annotate 'line', 3175
    .return(self)
.annotate 'line', 3176

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 3177
    .return(0)

.end # cantailcall


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3182
    self.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 3183

.end # emit_init


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3186
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3187
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3188
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3189
    .return($S2)
.annotate 'line', 3190

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3193
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3194
    null $S2
    if_null $S1, __label_2
    length $I1, $S1
    ne $I1, 1, __label_2
    ord $I1, $S1
    if $I1 == 73 goto __label_4
    if $I1 == 78 goto __label_5
    if $I1 == 83 goto __label_6
    if $I1 == 80 goto __label_7
    goto __label_2
  __label_4: # case
.annotate 'line', 3196
    set $S2, "$I0"
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 3197
    set $S2, "$N0"
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3198
    set $S2, "$S0"
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 3199
    set $S2, "$P0"
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 3201
    concat $S3, "Unexcpected emit_void with type '", $S1
    concat $S3, $S3, "'"
    getattribute $P1, self, 'start'
    WSubId_6($S3, $P1)
  __label_3: # switch end
.annotate 'line', 3203
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3204

.end # emit_void


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3207
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3208
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 3209
    .tailcall self.'emit_get'(__ARG_1)
.annotate 'line', 3210

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 3213
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3214
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
.annotate 'line', 3215
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3216
    self.'annotate'(__ARG_1)
.annotate 'line', 3217
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 3218
    set $S1, $S2
  __label_2: # endif
.annotate 'line', 3220
    .return($S1)
.annotate 'line', 3221

.end # emit_getint


.sub 'emit_getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3224
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3225
    $P1 = self.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3226
    eq $S1, 'P', __label_3
.annotate 'line', 3227
    set $S3, $S2
.annotate 'line', 3228
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 3229
    __ARG_1.'emitbox'($S2, $S3)
  __label_3: # endif
.annotate 'line', 3231
    .return($S2)
.annotate 'line', 3232

.end # emit_getvar


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.annotate 'line', 3235
    WSubId_73(self)
.annotate 'line', 3236

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 3148
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
.annotate 'line', 3241
    .return(1)

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 3239
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FinalExpr' ]

.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3250
    typeof $P1, self
    set $S1, $P1
    concat $S2, "misuse of ", $S1
    WSubId_6($S2, self)
.annotate 'line', 3251

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
.annotate 'line', 3245
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 3261
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3262
    $P1 = __ARG_1.'get'()
.annotate 'line', 3263
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3264
    WSubId_54('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3265
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
.annotate 'line', 3266

.end # FunctionExpr


.sub 'checkresult' :method
.annotate 'line', 3267
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 3270
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3271
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3272
    .return(self)
.annotate 'line', 3273

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3276
    self.'annotate'(__ARG_1)
.annotate 'line', 3277
    getattribute $P1, self, 'fn'
.annotate 'line', 3278
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3279
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3280
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3282
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 3283

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3256
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3258
    addattribute $P0, 'fn'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
.annotate 'line', 3301
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3302
    .return(self)
.annotate 'line', 3303

.end # set


.sub 'optimize_condition' :method
.annotate 'line', 3306
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3307

.end # optimize_condition


.sub 'optimize' :method
.annotate 'line', 3310
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3311
    .return(self)
.annotate 'line', 3312

.end # optimize


.sub 'getvalue' :method
.annotate 'line', 3315
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3316
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3317
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_3
    unless $P3 goto __label_3
    set $I1, 2
    goto __label_2
  __label_3:
    set $I1, 1
  __label_2:
    .return($I1)
  __label_1: # endif
.annotate 'line', 3318
    .return(0)
.annotate 'line', 3319

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3322
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3324
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3325
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3326
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3328
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3329
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if_null $S2, __label_5
    length $I1, $S2
    ne $I1, 1, __label_5
    ord $I1, $S2
    if $I1 == 83 goto __label_7
    if $I1 == 80 goto __label_8
    if $I1 == 73 goto __label_9
    if $I1 == 78 goto __label_10
    goto __label_5
  __label_7: # case
  __label_8: # case
.annotate 'line', 3332
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3335
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 3338
    WSubId_6('Invalid if condition')
  __label_6: # switch end
  __label_2: # endif
.annotate 'line', 3341

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3344
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3346
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3347
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3348
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3350
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3351
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if_null $S2, __label_5
    length $I1, $S2
    ne $I1, 1, __label_5
    ord $I1, $S2
    if $I1 == 83 goto __label_7
    if $I1 == 80 goto __label_8
    if $I1 == 73 goto __label_9
    if $I1 == 78 goto __label_10
    goto __label_5
  __label_7: # case
  __label_8: # case
.annotate 'line', 3354
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3357
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 3360
    WSubId_6('Invalid if condition')
  __label_6: # switch end
  __label_2: # endif
.annotate 'line', 3363

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3298
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
.annotate 'line', 3370
    .return(1)

.end # isliteral


.sub 'hascompilevalue' :method
.annotate 'line', 3371
    .return(1)

.end # hascompilevalue


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3368
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3382
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3383
    setattribute self, 'strval', __ARG_2
.annotate 'line', 3384

.end # StringLiteral


.sub 'isstringliteral' :method
.annotate 'line', 3385
    .return(1)

.end # isstringliteral


.sub 'checkresult' :method
.annotate 'line', 3386
    .return('S')

.end # checkresult


.sub 'getPirString' :method
.annotate 'line', 3389
    getattribute $P1, self, 'strval'
.annotate 'line', 3390
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3391
    .return($S1)
.annotate 'line', 3392

.end # getPirString


.sub 'get_value' :method
.annotate 'line', 3395
    getattribute $P1, self, 'strval'
.annotate 'line', 3396
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3397
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3398
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3399
    .return($S1)
.annotate 'line', 3400

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3403
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
.annotate 'line', 3404

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3407
    .tailcall self.'getPirString'()
.annotate 'line', 3408

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3377
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3379
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3419
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3420
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3421
    set $I1, __ARG_3
.annotate 'line', 3422
    box $P1, $I1
    setattribute self, 'numval', $P1
.annotate 'line', 3423

.end # IntegerLiteral


.sub 'isintegerliteral' :method
.annotate 'line', 3424
    .return(1)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3427
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
.annotate 'line', 3428

.end # isintegerzero


.sub 'checkresult' :method
.annotate 'line', 3429
    .return('I')

.end # checkresult


.sub 'getIntegerValue' :method
.annotate 'line', 3432
    getattribute $P1, self, 'numval'
    .return($P1)
.annotate 'line', 3433

.end # getIntegerValue


.sub 'getFloatValue' :method
.annotate 'line', 3436
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3437
    .return($N1)
.annotate 'line', 3438

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3441
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3442
    if $I1 goto __label_1
.annotate 'line', 3443
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3445
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_2: # endif
.annotate 'line', 3446

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3449
    .tailcall self.'getIntegerValue'()
.annotate 'line', 3450

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3413
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3415
    addattribute $P0, 'pos'
.annotate 'line', 3416
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3460
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3461
    setattribute self, 'numval', __ARG_2
.annotate 'line', 3462

.end # FloatLiteral


.sub 'isfloatliteral' :method
.annotate 'line', 3463
    .return(1)

.end # isfloatliteral


.sub 'checkresult' :method
.annotate 'line', 3464
    .return('N')

.end # checkresult


.sub 'getFloatValue' :method
.annotate 'line', 3467
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3468
    .return($N1)
.annotate 'line', 3469

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3472
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3473
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3474

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_74 = "WSubId_74"
.annotate 'line', 3477
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3478
    .tailcall WSubId_74($N1)
.annotate 'line', 3479

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3455
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3457
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'concat_literal' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3489
    getattribute $P1, __ARG_1, 'strval'
.annotate 'line', 3490
    getattribute $P2, __ARG_2, 'strval'
.annotate 'line', 3493
    $P4 = $P1.'issinglequoted'()
    unless $P4 goto __label_3
    $P4 = $P2.'issinglequoted'()
  __label_3:
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 3495
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P6, $P1, 'file'
    getattribute $P7, $P1, 'line'
.annotate 'line', 3496
    getattribute $P8, $P1, 'str'
    set $S1, $P8
    getattribute $P9, $P2, 'str'
    set $S2, $P9
    concat $S3, $S1, $S2
    $P5.'TokenSingleQuoted'($P6, $P7, $S3)
    set $P3, $P5
    goto __label_1
  __label_2:
.annotate 'line', 3498
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P1, 'file'
    getattribute $P13, $P1, 'line'
.annotate 'line', 3499
    $P14 = $P1.'getasquoted'()
    set $S4, $P14
    $P15 = $P2.'getasquoted'()
    set $S5, $P15
    concat $S6, $S4, $S5
    $P11.'TokenQuoted'($P12, $P13, $S6)
    set $P10, $P11
    set $P3, $P10
  __label_1:
.annotate 'line', 3500
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 3501

.end # concat_literal

.namespace [ 'Winxed'; 'Compiler'; 'FunctionId' ]

.sub 'FunctionId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.annotate 'line', 3510
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3511
    box $P1, __ARG_4
    setattribute self, 'subid', $P1
.annotate 'line', 3512

.end # FunctionId


.sub 'checkresult' :method
.annotate 'line', 3513
    .return('P')

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3516
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 3517

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
.annotate 'line', 3505
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3507
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionRef' ]

.sub 'FunctionRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3525
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3526
    setattribute self, 'sym', __ARG_3
.annotate 'line', 3527

.end # FunctionRef


.sub 'checkresult' :method
.annotate 'line', 3528
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3531
    getattribute $P1, self, 'sym'
.annotate 'line', 3532
    getattribute $P3, $P1, 'owner'
    $P2 = $P3.'getpath'()
.annotate 'line', 3533
    self.'annotate'(__ARG_1)
.annotate 'line', 3534
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'name'
    $P2.'emit_get_global'(__ARG_1, $P3, __ARG_2, $P4)
.annotate 'line', 3535

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
.annotate 'line', 3520
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3522
    addattribute $P0, 'sym'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
.annotate 'line', 3541
    .return(1)

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3544
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3545
    setattribute self, 'name', __ARG_2
.annotate 'line', 3546

.end # IdentifierExpr


.sub 'isnull' :method
.annotate 'line', 3549
    getattribute $P1, self, 'name'
.annotate 'line', 3550
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3551
    .return(0)
  __label_1: # endif
.annotate 'line', 3552
    .tailcall $P1.'iskeyword'('null')
.annotate 'line', 3553

.end # isnull


.sub 'checkresult' :method
.annotate 'line', 3556
    getattribute $P1, self, 'name'
.annotate 'line', 3557
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3558
    if_null $P2, __label_1
.annotate 'line', 3559
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
    set $S1, $P1
    if $S1 == 'self' goto __label_5
    if $S1 == 'null' goto __label_6
    goto __label_3
  __label_5: # case
  __label_6: # case
.annotate 'line', 3564
    .return('P')
  __label_3: # default
.annotate 'line', 3566
    .return('')
  __label_4: # switch end
  __label_2: # endif
.annotate 'line', 3569

.end # checkresult


.sub 'getName' :method
.annotate 'line', 3572
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3573
    .return($S1)
.annotate 'line', 3574

.end # getName


.sub 'checkVar' :method
.annotate 'line', 3577
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
.annotate 'line', 3578

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3581
    getattribute $P1, self, 'name'
.annotate 'line', 3582
    unless_null $P1, __label_1
.annotate 'line', 3583
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3584
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3585
    null $S1
.annotate 'line', 3586
    unless_null $P2, __label_2
    set $S2, $P1
    if $S2 == 'self' goto __label_6
    if $S2 == 'null' goto __label_7
    goto __label_4
  __label_6: # case
  __label_7: # case
.annotate 'line', 3590
    set $S1, $P1
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 3592
    set $S1, ''
  __label_5: # switch end
    goto __label_3
  __label_2: # else
.annotate 'line', 3596
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3597
    .return($S1)
.annotate 'line', 3598

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_75 = "WSubId_75"
.annotate 'line', 3601
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3602
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3603
    getattribute $P2, self, 'name'
    WSubId_75($P2, self)
  __label_1: # endif
.annotate 'line', 3604
    .return($P1)
.annotate 'line', 3605

.end # getIdentifier


.sub 'optimize' :method
.annotate 'line', 3608
    getattribute $P1, self, 'name'
.annotate 'line', 3609
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3610
    if_null $P2, __label_1
.annotate 'line', 3611
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3612
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3613
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3614
    band $I2, $I1, 1
    unless $I2 goto __label_4
.annotate 'line', 3615
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3616
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
    goto __label_5
  __label_4: # else
.annotate 'line', 3623
    $P3 = $P2.'getreg'()
.annotate 'line', 3624
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3625
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionId'($P7, $P8, $P1, $P3)
    set $P5, $P6
    .return($P5)
  __label_7: # endif
  __label_5: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 3629
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3631
    isnull $I2, $P4
    if $I2 goto __label_11
.annotate 'line', 3633
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I2 goto __label_12
.annotate 'line', 3643
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I2 goto __label_13
    goto __label_10
  __label_11: # case
    goto __label_9 # break
  __label_12: # case
.annotate 'line', 3634
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_14
.annotate 'line', 3635
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_16
    set $S1, $P6
  __label_16:
.annotate 'line', 3636
    self.'usesubid'($S1)
.annotate 'line', 3637
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
.annotate 'line', 3638
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionId'($P7, $P8, $P1, $S1)
    set $P5, $P6
    .return($P5)
    goto __label_15
  __label_14: # else
.annotate 'line', 3641
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionRef'($P7, $P8, $P4)
    set $P5, $P6
    .return($P5)
  __label_15: # endif
    goto __label_9 # break
  __label_13: # case
.annotate 'line', 3644
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    $P10.'FunctionRef'($P11, $P12, $P4)
    set $P9, $P10
    .return($P9)
  __label_10: # default
  __label_9: # switch end
  __label_2: # endif
.annotate 'line', 3647
    .return(self)
.annotate 'line', 3648

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3651
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3652
    self.'annotate'(__ARG_1)
.annotate 'line', 3653
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3654

.end # emit


.sub 'emit_void' :method

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3658
    null $S1
.annotate 'line', 3659
    $P2 = self.'getIdentifier'()
    set $S1, $P2
.annotate 'line', 3660
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3661
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_1:
.annotate 'line', 3662
    band $I2, $I1, 1
    unless $I2 goto __label_3
.annotate 'line', 3663
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 3664
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 3665
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
  __label_7:
    unless $I2 goto __label_6
.annotate 'line', 3666
    self.'annotate'(__ARG_1)
  __label_6: # endif
.annotate 'line', 3667
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 3670
    .return($S1)
.annotate 'line', 3671

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3674
    self.'annotate'(__ARG_1)
.annotate 'line', 3675
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3676
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3677
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3678
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3679
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
    if_null $S1, __label_6
    length $I1, $S1
    ne $I1, 1, __label_6
    ord $I1, $S1
    if $I1 == 83 goto __label_8
    if $I1 == 80 goto __label_9
    goto __label_6
  __label_8: # case
  __label_9: # case
.annotate 'line', 3683
    __ARG_1.'emitnull'($S2)
    goto __label_7 # break
  __label_6: # default
.annotate 'line', 3686
    WSubId_1("Can't assign null to that type", self)
  __label_7: # switch end
    goto __label_5
  __label_4: # else
.annotate 'line', 3689
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3690
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 3692
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3693
    ne $S3, 'v', __label_13
.annotate 'line', 3694
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3695
    ne $S1, $S3, __label_14
.annotate 'line', 3696
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 3699
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3700
    self.'annotate'(__ARG_1)
.annotate 'line', 3701
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3702
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3704
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
  __label_15: # endif
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3707
    .return($S2)
.annotate 'line', 3708

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3538
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3540
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3718
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3719
    setattribute self, 'desc', __ARG_2
.annotate 'line', 3720

.end # LexicalVolatileExpr


.sub 'checkresult' :method
.annotate 'line', 3723
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
.annotate 'line', 3724

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3727
    getattribute $P1, self, 'desc'
.annotate 'line', 3728
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3729
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3730
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3731
    .return($S2)
.annotate 'line', 3732

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3735
    self.'annotate'(__ARG_1)
.annotate 'line', 3736
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3737
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3738

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3741
    getattribute $P1, self, 'owner'
.annotate 'line', 3742
    getattribute $P2, self, 'desc'
.annotate 'line', 3743
    $P3 = $P2.'gettype'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3744
    null $S2
.annotate 'line', 3746
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3750
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3747
    $P3 = $P1.'tempreg'($S1)
    set $S2, $P3
.annotate 'line', 3748
    __ARG_1.'emitnull'($S2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3751
    $P4 = $P1.'tempreg'($S1)
    set $S2, $P4
.annotate 'line', 3752
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3755
    ne $S1, 'P', __label_6
.annotate 'line', 3756
    $P5 = __ARG_2.'emit_getvar'(__ARG_1)
    set $S2, $P5
    goto __label_7
  __label_6: # else
.annotate 'line', 3757
    $P6 = __ARG_2.'checkresult'()
    set $S3, $P6
    ne $S1, $S3, __label_8
.annotate 'line', 3758
    $P7 = __ARG_2.'emit_get'(__ARG_1)
    set $S2, $P7
    goto __label_9
  __label_8: # else
.annotate 'line', 3760
    $P8 = $P1.'tempreg'($S1)
    set $S2, $P8
.annotate 'line', 3761
    __ARG_2.'emit'(__ARG_1, $S2)
  __label_9: # endif
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 3765
    $P3 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P3, $S2)
.annotate 'line', 3766
    .return($S2)
.annotate 'line', 3767

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3770
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
.annotate 'line', 3771

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3713
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3715
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3780
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3781

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3776
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 3791
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3792
    $P2 = WSubId_69(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3793
    getattribute $P1, self, 'key'
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3794
    WSubId_54('namespace identifier', __ARG_3)
  __label_1: # endif
.annotate 'line', 3795

.end # OpNamespaceExpr


.sub 'checkresult' :method
.annotate 'line', 3796
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3799
    getattribute $P1, self, 'owner'
.annotate 'line', 3800
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3801
    unless_null $P2, __label_1
.annotate 'line', 3802
    WSubId_1('unknown namespace', self)
  __label_1: # endif
.annotate 'line', 3803
    $P3 = $P2.'getpath'()
.annotate 'line', 3804
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3805

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3786
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3788
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_76 = "WSubId_76"
.annotate 'line', 3816
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3817
    $P2 = WSubId_76(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
.annotate 'line', 3818

.end # OpClassExpr


.sub 'checkresult' :method
.annotate 'line', 3819
    .return('P')

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3822
    getattribute $P1, self, 'owner'
.annotate 'line', 3823
    getattribute $P2, self, 'clspec'
.annotate 'line', 3824
    null $P3
.annotate 'line', 3827
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
.annotate 'line', 3830
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    if $I1 goto __label_4
.annotate 'line', 3833
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 3828
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3829
    if_null $P3, __label_7
    getattribute $P4, $P3, 'path'
    goto __label_6
  __label_7:
    null $P4
  __label_6:
    .return($P4)
  __label_4: # case
.annotate 'line', 3831
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3832
    if_null $P3, __label_9
    getattribute $P5, $P3, 'path'
    goto __label_8
  __label_9:
    null $P5
  __label_8:
    .return($P5)
  __label_5: # case
.annotate 'line', 3834
    typeof $P6, $P2
    set $S1, $P6
    concat $S2, $S1, " not supported yet here"
.annotate 'line', 3835
    getattribute $P7, $P2, 'start'
.annotate 'line', 3834
    WSubId_1($S2, $P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3837
    getattribute $P4, $P2, 'start'
    WSubId_6("Unexpected class key", $P4)
.annotate 'line', 3838

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3841
    getattribute $P1, self, 'owner'
.annotate 'line', 3842
    getattribute $P2, self, 'clspec'
.annotate 'line', 3845
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 3846
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3847
    if_null $P3, __label_4
.annotate 'line', 3848
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3849
    .return()
  __label_4: # endif
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3854
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3855
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3856
    __ARG_1.'say'()
.annotate 'line', 3857

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3810
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3812
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3867
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3868
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3869

.end # OpUnaryExpr


.sub 'optimizearg' :method
.annotate 'line', 3872
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
.annotate 'line', 3873

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 3876
    self.'optimizearg'()
.annotate 'line', 3877
    .return(self)
.annotate 'line', 3878

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3862
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3864
    addattribute $P0, 'subexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3889
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3890
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3891
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3892

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3895
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3896
    .return(self)
.annotate 'line', 3897

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
.annotate 'line', 3900
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 3901

.end # setfrom


.sub 'optimizearg' :method
.annotate 'line', 3904
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3905
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3906

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 3909
    self.'optimizearg'()
.annotate 'line', 3910
    .return(self)
.annotate 'line', 3911

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
.annotate 'line', 3914
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 3915

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
.annotate 'line', 3918
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 3919

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3883
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3885
    addattribute $P0, 'lexpr'
.annotate 'line', 3886
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3928
    .return('I')
.annotate 'line', 3929

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3932
    self.'optimizearg'()
.annotate 'line', 3933
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3934
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3935
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3936
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 3937
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3938
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_25($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 3940
    .return(self)
.annotate 'line', 3941

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3924
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
.annotate 'line', 3950
    .return('I')
.annotate 'line', 3951

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3946
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3959
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3960

.end # OpDeleteExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3963
    self.'optimizearg'()
.annotate 'line', 3964
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3965
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    not $I1, $I2
    if $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    iseq $I1, $S1, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3966
    WSubId_1("delete with invalid operator", self)
  __label_1: # endif
.annotate 'line', 3967
    .return(self)
.annotate 'line', 3968

.end # optimize


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 3971
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3972
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3973
    self.'annotate'(__ARG_1)
.annotate 'line', 3974
    __ARG_1.'print'('    delete ')
.annotate 'line', 3975
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3976
    __ARG_1.'say'()
.annotate 'line', 3977

.end # emit_void


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3980
    self.'emit_void'(__ARG_1)
.annotate 'line', 3981
    __ARG_1.'emitset'(__ARG_2, '1')
.annotate 'line', 3982

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3955
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3989
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3990

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3993
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3994
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3995
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3996
    self.'annotate'(__ARG_1)
.annotate 'line', 3997
    __ARG_1.'print'('    exists ', __ARG_2, ', ')
.annotate 'line', 3998
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3999
    __ARG_1.'say'()
    goto __label_2
  __label_1: # else
.annotate 'line', 4002
    WSubId_1("exists with invalid operator", self)
  __label_2: # endif
.annotate 'line', 4003

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3985
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4012
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4013

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
.annotate 'line', 4016
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4017

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4020
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4021
    .return(self)
.annotate 'line', 4022

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 4025
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4026
    self.'optimizearg'()
.annotate 'line', 4027
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4028
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4029
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4032
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4033
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 4034
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_77($P2, $P3, $N2)
  __label_2: # endif
.annotate 'line', 4037
    .return(self)
.annotate 'line', 4038

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4041
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4042
    self.'annotate'(__ARG_1)
.annotate 'line', 4043
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
.annotate 'line', 4044

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 4008
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4053
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4054

.end # OpNotExpr


.sub 'isnegable' :method
.annotate 'line', 4055
    .return(1)

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 4058
    .return('I')
.annotate 'line', 4059

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4062
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4063
    .return(self)
.annotate 'line', 4064

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4067
    self.'optimizearg'()
.annotate 'line', 4068
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4069
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4070
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4071
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4073
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4074
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4075
    .return(self)
.annotate 'line', 4076

.end # optimize


.sub 'negated' :method
.annotate 'line', 4079
    getattribute $P1, self, 'subexpr'
    .return($P1)
.annotate 'line', 4080

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4083
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4084
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4085
    self.'annotate'(__ARG_1)
.annotate 'line', 4086
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if_null $S2, __label_2
    length $I1, $S2
    ne $I1, 1, __label_2
    ord $I1, $S2
    if $I1 == 73 goto __label_4
    if $I1 == 80 goto __label_5
    goto __label_2
  __label_4: # case
.annotate 'line', 4088
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 4091
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 4094
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_3: # switch end
.annotate 'line', 4096

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 4049
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]

.sub 'OpBinNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4105
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4106

.end # OpBinNotExpr


.sub 'checkresult' :method
.annotate 'line', 4109
    .return('I')
.annotate 'line', 4110

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4113
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4114
    .return(self)
.annotate 'line', 4115

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4118
    self.'optimizearg'()
.annotate 'line', 4119
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4120
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4121
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4122
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4124
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4125
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4126
    .return(self)
.annotate 'line', 4127

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4130
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4131
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4132
    self.'annotate'(__ARG_1)
.annotate 'line', 4133
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
.annotate 'line', 4134

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 4101
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
.annotate 'line', 4143
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4144

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4147
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4148
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 4149
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 4150

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 4139
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4159
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4160
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4161

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4164
    self.'emit_get'(__ARG_1)
.annotate 'line', 4165

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 4155
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4172
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4173

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4176
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4177
    self.'annotate'(__ARG_1)
.annotate 'line', 4178
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4179
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4180
    .return($S1)
.annotate 'line', 4181

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 4168
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4188
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4189

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4192
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4193
    self.'annotate'(__ARG_1)
.annotate 'line', 4194
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4195
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4196
    .return($S1)
.annotate 'line', 4197

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 4184
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4206
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4207

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4210
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4211
    self.'annotate'(__ARG_1)
.annotate 'line', 4212
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_2
.annotate 'line', 4213
    $P2 = self.'tempreg'('P')
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 4214
    __ARG_1.'emitarg2'('clone', $S2, $S1)
.annotate 'line', 4215
    __ARG_1.'emitset'(__ARG_2, $S2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4218
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 4219
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4220
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4221

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4224
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4225
    self.'annotate'(__ARG_1)
.annotate 'line', 4226
    $P2 = self.'checkresult'()
    $P1 = self.'tempreg'($P2)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4227
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_3
.annotate 'line', 4228
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 4230
    __ARG_1.'emitset'($S2, $S1)
  __label_4: # endif
.annotate 'line', 4231
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4232
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4233
    .return($S2)
.annotate 'line', 4234

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4237
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4238
    self.'annotate'(__ARG_1)
.annotate 'line', 4239
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4240
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4241

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 4202
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4248
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4249

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4252
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4253
    self.'annotate'(__ARG_1)
.annotate 'line', 4254
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_2
.annotate 'line', 4255
    $P2 = self.'tempreg'('P')
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 4256
    __ARG_1.'emitarg2'('clone', $S2, $S1)
.annotate 'line', 4257
    __ARG_1.'emitset'(__ARG_2, $S2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4260
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 4261
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4262
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4263
    .return($S1)
.annotate 'line', 4264

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4267
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4268
    self.'annotate'(__ARG_1)
.annotate 'line', 4269
    $P2 = self.'checkresult'()
    $P1 = self.'tempreg'($P2)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4270
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_3
.annotate 'line', 4271
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 4273
    __ARG_1.'emitset'($S2, $S1)
  __label_4: # endif
.annotate 'line', 4274
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4275
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4276
    .return($S2)
.annotate 'line', 4277

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4280
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4281
    self.'annotate'(__ARG_1)
.annotate 'line', 4282
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4283
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4284

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 4244
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4295
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4296
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4297
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 4298
    .return(self)
.annotate 'line', 4299

.end # set


.sub 'checkresult' :method
.annotate 'line', 4302
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4303

.end # checkresult


.sub 'optimize_base' :method
.annotate 'line', 4306
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 4307
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 4308
    .return(self)
.annotate 'line', 4309

.end # optimize_base


.sub 'optimize' :method
.annotate 'line', 4312
    .tailcall self.'optimize_base'()
.annotate 'line', 4313

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_73 = "WSubId_73"
.annotate 'line', 4316
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4317
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
    $P2 = $P1.'isliteral'()
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4318
    WSubId_73($P1)
  __label_1: # endif
.annotate 'line', 4319

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4322
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4323
    self.'annotate'(__ARG_1)
.annotate 'line', 4324
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4325

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4328
    self.'emit_get'(__ARG_1)
.annotate 'line', 4329

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 4289
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4291
    addattribute $P0, 'lexpr'
.annotate 'line', 4292
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4338
    self.'annotate'(__ARG_1)
.annotate 'line', 4339
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4340
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4341

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4344
    self.'annotate'(__ARG_1)
.annotate 'line', 4345
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4346
    getattribute $P2, self, 'rexpr'
    $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4347

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 4334
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4356
    self.'annotate'(__ARG_1)
.annotate 'line', 4357
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4358
    __ARG_1.'emitassign'(__ARG_2, $S1)
.annotate 'line', 4359

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 4362
    self.'checkleft'()
.annotate 'line', 4363
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4364
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 4365
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 4366
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 4367
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 4368
    self.'annotate'(__ARG_1)
.annotate 'line', 4369
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 4370
    .return($S1)
.annotate 'line', 4371

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4374
    self.'annotate'(__ARG_1)
.annotate 'line', 4375
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4376

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 4352
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4385
    self.'checkleft'()
.annotate 'line', 4386
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4387
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4388
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4389
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4390
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4391
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 4392
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
.annotate 'line', 4394
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 4395
    null $S5
.annotate 'line', 4396
    self.'annotate'(__ARG_1)
    if_null $S1, __label_8
    length $I1, $S1
    ne $I1, 1, __label_8
    ord $I1, $S1
    if $I1 == 83 goto __label_10
    if $I1 == 73 goto __label_11
    if $I1 == 78 goto __label_12
    goto __label_8
  __label_10: # case
.annotate 'line', 4399
    eq $S2, 'S', __label_13
.annotate 'line', 4400
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4401
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4402
    set $S4, $S5
  __label_13: # endif
.annotate 'line', 4404
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 4408
    eq $S1, $S2, __label_14
.annotate 'line', 4409
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4410
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4411
    set $S4, $S5
  __label_14: # endif
.annotate 'line', 4413
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_9 # break
  __label_8: # default
.annotate 'line', 4416
    __ARG_1.'emitaddto'($S3, $S4)
  __label_9: # switch end
  __label_5: # endif
.annotate 'line', 4419
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_15
.annotate 'line', 4420
    $P1.'emit_store'(__ARG_1, $S3)
  __label_15: # endif
.annotate 'line', 4421
    .return($S3)
.annotate 'line', 4422

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 4381
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 4431
    self.'checkleft'()
.annotate 'line', 4432
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4433
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4434
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4435
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4436
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4437
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4438
    null $S5
.annotate 'line', 4439
    self.'annotate'(__ARG_1)
    if_null $S1, __label_5
    length $I1, $S1
    ne $I1, 1, __label_5
    ord $I1, $S1
    if $I1 == 83 goto __label_7
    if $I1 == 73 goto __label_8
    if $I1 == 78 goto __label_9
    goto __label_5
  __label_7: # case
.annotate 'line', 4442
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4445
    eq $S1, $S2, __label_10
.annotate 'line', 4446
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4447
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4448
    set $S4, $S5
  __label_10: # endif
.annotate 'line', 4450
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 4453
    __ARG_1.'emitsubto'($S3, $S4)
  __label_6: # switch end
.annotate 'line', 4455
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 4456
    $P1.'emit_store'(__ARG_1, $S3)
  __label_11: # endif
.annotate 'line', 4457
    .return($S3)
.annotate 'line', 4458

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4427
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4467
    self.'checkleft'()
.annotate 'line', 4468
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4469
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4470
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4471
    null $S2
.annotate 'line', 4472
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    if_null $S3, __label_2
    length $I1, $S3
    ne $I1, 1, __label_2
    ord $I1, $S3
    if $I1 == 83 goto __label_4
    goto __label_2
  __label_4: # case
.annotate 'line', 4474
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4475
    self.'annotate'(__ARG_1)
.annotate 'line', 4476
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 4479
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4480
    self.'annotate'(__ARG_1)
.annotate 'line', 4481
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_3: # switch end
.annotate 'line', 4483
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_5
.annotate 'line', 4484
    $P1.'emit_store'(__ARG_1, $S1)
  __label_5: # endif
.annotate 'line', 4485
    .return($S1)
.annotate 'line', 4486

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4463
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4495
    self.'checkleft'()
.annotate 'line', 4496
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4497
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4498
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4499
    self.'annotate'(__ARG_1)
.annotate 'line', 4500
    __ARG_1.'emitarg2'('div', $S1, $S2)
.annotate 'line', 4501
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 4502
    $P1.'emit_store'(__ARG_1, $S1)
  __label_3: # endif
.annotate 'line', 4503
    .return($S1)
.annotate 'line', 4504

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4491
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4513
    self.'checkleft'()
.annotate 'line', 4514
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4515
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4516
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4517
    self.'annotate'(__ARG_1)
.annotate 'line', 4518
    __ARG_1.'emitarg2'('mod', $S1, $S2)
.annotate 'line', 4519
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 4520
    $P1.'emit_store'(__ARG_1, $S1)
  __label_3: # endif
.annotate 'line', 4521
    .return($S1)
.annotate 'line', 4522

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4509
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4534
    .return('I')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4537
    self.'optimizearg'()
.annotate 'line', 4538
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4539
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4540
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4541
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 4542
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4543
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_25($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 4545
    .return(self)
.annotate 'line', 4546

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 4549
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4550
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4551
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4552
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4553
    self.'annotate'(__ARG_1)
.annotate 'line', 4554
    null $S5
.annotate 'line', 4556
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4561
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4566
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4571
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4576
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4581
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4557
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4558
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4559
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4562
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4563
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4564
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4567
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4568
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4569
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4572
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4573
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4574
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4577
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4578
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4579
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4582
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4583
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4584
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4585
    if __ARG_3 == 0 goto __label_21
    if __ARG_3 == 1 goto __label_22
    if __ARG_3 == 2 goto __label_23
    goto __label_19
  __label_21: # case
.annotate 'line', 4590
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_22: # case
.annotate 'line', 4593
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_23: # case
.annotate 'line', 4596
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_19: # default
  __label_20: # switch end
.annotate 'line', 4599

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4602
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4603

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4606
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
.annotate 'line', 4607

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4610
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
.annotate 'line', 4611

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4532
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
.annotate 'line', 4622
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
.annotate 'line', 4623

.end # Negable


.sub 'isnegable' :method
.annotate 'line', 4624
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4627
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4628
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4629
    .return(self)
.annotate 'line', 4630

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4618
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4644
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4645
    self.'Negable'(__ARG_3)
.annotate 'line', 4646
    setattribute self, 'expr', __ARG_2
.annotate 'line', 4647

.end # CheckerExpr


.sub 'isnegable' :method
.annotate 'line', 4648
    .return(1)

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 4649
    .return('I')

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4638
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4640
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4656
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4657

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4660
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4661
    self.'annotate'(__ARG_1)
.annotate 'line', 4662
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4663
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4664
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
.annotate 'line', 4665

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4668
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4669
    self.'annotate'(__ARG_1)
.annotate 'line', 4670
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4671
    __ARG_1.'emitif_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4673
    __ARG_1.'emitunless_null'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4674

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4677
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4678
    self.'annotate'(__ARG_1)
.annotate 'line', 4679
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4680
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4682
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4683

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4652
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]

.sub 'ZeroCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4690
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4691

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4694
    getattribute $P1, self, 'expr'
.annotate 'line', 4695
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4696
    self.'annotate'(__ARG_1)
.annotate 'line', 4697
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4698
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4700
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_3: # endif
.annotate 'line', 4701

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4704
    getattribute $P1, self, 'expr'
.annotate 'line', 4705
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4706
    self.'annotate'(__ARG_1)
.annotate 'line', 4707
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4708
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4710
    __ARG_1.'emitif'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4711

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4714
    getattribute $P1, self, 'expr'
.annotate 'line', 4715
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4716
    self.'annotate'(__ARG_1)
.annotate 'line', 4717
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4718
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4720
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4721

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4686
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'OpEqualExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.annotate 'line', 4730
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4731
    self.'Negable'(__ARG_5)
.annotate 'line', 4732

.end # OpEqualExpr


.sub 'isnegable' :method
.annotate 'line', 4733
    .return(1)

.end # isnegable


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4736
    self.'optimizearg'()
.annotate 'line', 4737
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4738
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4739
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4740
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4741
    unless $I1 goto __label_1
.annotate 'line', 4742
    unless $I2 goto __label_2
.annotate 'line', 4743
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_25($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4745
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
  __label_1: # endif
.annotate 'line', 4747
    unless $I2 goto __label_4
.annotate 'line', 4748
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4749
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4750
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4751
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_8
    $P3 = $P2.'isliteral'()
  __label_8:
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 4752
    ne $S1, $S2, __label_9
    if_null $S1, __label_10
    length $I7, $S1
    ne $I7, 1, __label_10
    ord $I7, $S1
    if $I7 == 73 goto __label_12
    if $I7 == 83 goto __label_13
    goto __label_10
  __label_12: # case
.annotate 'line', 4755
    $P4 = $P1.'getIntegerValue'()
    set $I3, $P4
.annotate 'line', 4756
    $P5 = $P2.'getIntegerValue'()
    set $I4, $P5
.annotate 'line', 4757
    getattribute $P6, self, 'positive'
    if_null $P6, __label_15
    unless $P6 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4758
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    .tailcall WSubId_25($P7, $P8, $I5)
  __label_13: # case
.annotate 'line', 4760
    getattribute $P10, $P1, 'strval'
    getattribute $P9, $P10, 'str'
    null $S3
    if_null $P9, __label_16
    set $S3, $P9
  __label_16:
.annotate 'line', 4761
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_17
    set $S4, $P11
  __label_17:
.annotate 'line', 4762
    getattribute $P13, self, 'positive'
    if_null $P13, __label_19
    unless $P13 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4763
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    .tailcall WSubId_25($P14, $P15, $I6)
  __label_10: # default
  __label_11: # switch end
  __label_9: # endif
  __label_7: # endif
.annotate 'line', 4767
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4768
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4769
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4770
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4771
    .return(self)
.annotate 'line', 4772

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4775
    self.'annotate'(__ARG_1)
.annotate 'line', 4776
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'iseq'
    goto __label_1
  __label_2:
    set $S1, 'isne'
  __label_1:
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4777

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4780
    self.'annotate'(__ARG_1)
.annotate 'line', 4781
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4782

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4785
    self.'annotate'(__ARG_1)
.annotate 'line', 4786
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'eq'
    goto __label_1
  __label_2:
    set $S1, 'ne'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4787

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4790
    self.'annotate'(__ARG_1)
.annotate 'line', 4791
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'ne'
    goto __label_1
  __label_2:
    set $S1, 'eq'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4792

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4726
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]

.sub 'OpSameExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.annotate 'line', 4803
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4804
    self.'Negable'(__ARG_5)
.annotate 'line', 4805

.end # OpSameExpr


.sub 'isnegable' :method
.annotate 'line', 4806
    .return(1)

.end # isnegable


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4809
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
.annotate 'line', 4810

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4813
    self.'annotate'(__ARG_1)
.annotate 'line', 4814
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4815
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4816
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4817

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4820
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4821

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4824
    self.'annotate'(__ARG_1)
.annotate 'line', 4825
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4826
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4827
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4828

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4831
    self.'annotate'(__ARG_1)
.annotate 'line', 4832
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4833
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4834
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4835

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4798
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4800
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4842
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4845
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4846

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4849
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4850

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4853
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4854

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4857
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4858

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4861
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4862

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4840
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4869
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4872
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4873

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4876
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4877

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4880
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4881

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4884
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4885

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4888
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4889

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4867
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4896
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4899
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4900

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4903
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4904

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4907
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4908

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4911
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4912

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4915
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4916

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4894
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4923
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4926
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4927

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4930
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4931

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4934
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4935

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4938
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4939

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4942
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4943

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4921
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4952
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    set $S2, $P1
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_3
    getattribute $P4, self, 'rexpr'
    $P3 = $P4.'checkresult'()
    set $S3, $P3
    iseq $I1, $S3, 'I'
  __label_3:
    unless $I1 goto __label_2
    set $S1, 'I'
    goto __label_1
  __label_2:
    set $S1, 'P'
  __label_1:
    .return($S1)
.annotate 'line', 4954

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4948
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4963
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4964

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4967
    self.'optimizearg'()
.annotate 'line', 4968
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 4969
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4970
    unless $I1 goto __label_3
.annotate 'line', 4971
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4972
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_25($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4970
    .return($P1)
  __label_1: # endif
.annotate 'line', 4974
    .return(self)
.annotate 'line', 4975

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4978
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4979
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4980
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4981
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    $P3 = $P1.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    $P3 = $P2.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 4982
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 4983
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 4984
    __ARG_1.'emitbinop'('and', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 4987
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 4988
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 4989
    $P4 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 4990
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 4993
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 4994
    __ARG_1.'emitunless'(__ARG_2, $S4)
.annotate 'line', 4995
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 4996
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 4997
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 5000
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 5001
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5003

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5006
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5007
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5008
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5009
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    $P3 = $P1.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    $P3 = $P2.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5010
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5011
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5012
    __ARG_1.'emitbinop'('and', "$I0", $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5015
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5016
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_9
    set $S5, $P3
  __label_9:
.annotate 'line', 5017
    __ARG_1.'emitunless'($S5, $S4)
.annotate 'line', 5018
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 5019
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5021

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4959
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5030
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5031

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 5034
    self.'optimizearg'()
.annotate 'line', 5035
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 5036
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5037
    if $I1 goto __label_3
.annotate 'line', 5038
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 5039
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_25($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 5037
    .return($P1)
  __label_1: # endif
.annotate 'line', 5041
    .return(self)
.annotate 'line', 5042

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5045
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5046
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5047
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5048
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    $P3 = $P1.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    $P3 = $P2.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5049
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5050
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5051
    __ARG_1.'emitbinop'('or', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5054
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5055
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 5056
    $P4 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 5057
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 5060
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 5061
    __ARG_1.'emitif'(__ARG_2, $S4)
.annotate 'line', 5062
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5063
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 5064
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 5067
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 5068
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5070

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5073
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5074
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5075
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5076
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    $P3 = $P1.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    $P3 = $P2.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5077
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5078
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5079
    __ARG_1.'emitbinop'('or', "$I0", $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5082
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5083
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_9
    set $S5, $P3
  __label_9:
.annotate 'line', 5084
    __ARG_1.'emitif'($S5, $S4)
.annotate 'line', 5085
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 5086
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5088

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 5026
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 5093
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5103
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5104

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5107
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5108
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5109
    self.'annotate'(__ARG_1)
.annotate 'line', 5110
    __ARG_1.'emitbinop'('band', __ARG_2, $S1, $S2)
.annotate 'line', 5111

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5114
    band $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5115

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 5099
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5124
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5125

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5128
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5129
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5130
    self.'annotate'(__ARG_1)
.annotate 'line', 5131
    __ARG_1.'emitbinop'('bor', __ARG_2, $S1, $S2)
.annotate 'line', 5132

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5135
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5136

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 5120
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5145
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5146

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5149
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5150
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5151
    self.'annotate'(__ARG_1)
.annotate 'line', 5152
    __ARG_1.'emitbinop'('bxor', __ARG_2, $S1, $S2)
.annotate 'line', 5153

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5156
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5157

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 5141
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5167
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5169
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 5176
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5170
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 5171
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 5172
    getattribute $P3, __ARG_4, 'values'
    self.'append'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 5174
    self.'pushexpr'(__ARG_4)
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5177
    getattribute $P5, __ARG_4, 'values'
    setattribute self, 'values', $P5
.annotate 'line', 5178
    self.'unshiftexpr'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 5181
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = __ARG_3
    $P7[1] = __ARG_4
    setattribute self, 'values', $P7
  __label_1: # switch end
.annotate 'line', 5183

.end # ConcatString


.sub 'pushexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5186
    getattribute $P1, self, 'values'
.annotate 'line', 5187
    $P2 = $P1[-1]
.annotate 'line', 5188
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5189
    $P4 = WSubId_78($P2, __ARG_1)
    $P1[-1] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5191
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 5192

.end # pushexpr


.sub 'unshiftexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5195
    getattribute $P1, self, 'values'
.annotate 'line', 5196
    $P2 = $P1[0]
.annotate 'line', 5197
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5198
    $P4 = WSubId_78(__ARG_1, $P2)
    $P1[0] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5200
    unshift $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 5201

.end # unshiftexpr


.sub 'append' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5204
    getattribute $P1, self, 'values'
.annotate 'line', 5205
    $P2 = $P1[-1]
.annotate 'line', 5206
    $P4 = $P2.'isstringliteral'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5207
    $P3 = __ARG_1[0]
.annotate 'line', 5208
    $P4 = $P3.'isstringliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5209
    $P5 = WSubId_78($P2, $P3)
    $P1[-1] = $P5
.annotate 'line', 5210
    __ARG_1.'shift'()
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 5213
    $P1.'append'(__ARG_1)
.annotate 'line', 5214

.end # append


.sub 'checkresult' :method
.annotate 'line', 5216
    .return('S')

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
.annotate 'line', 5219
    getattribute $P1, self, 'values'
.annotate 'line', 5220
    elements $I1, $P1
.annotate 'line', 5221
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 5222
    null $I2
.annotate 'line', 5223
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5224
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 5223
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5225
    .return($P2)
.annotate 'line', 5226

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5229
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5230
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 5231

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 5234
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5235
    elements $I1, $P1
.annotate 'line', 5236
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5237
    self.'annotate'(__ARG_1)
.annotate 'line', 5238
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
.annotate 'line', 5239
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 5240
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 5239
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 5241
    .return($S1)
.annotate 'line', 5242

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5245
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5246
    elements $I1, $P1
.annotate 'line', 5247
    self.'annotate'(__ARG_1)
.annotate 'line', 5248
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
.annotate 'line', 5249
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5250
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 5249
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5251

.end # emit_init


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5254
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5255
    elements $I1, $P1
.annotate 'line', 5256
    self.'annotate'(__ARG_1)
.annotate 'line', 5257
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5258
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 5257
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5259

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 5162
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 5164
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
.annotate 'line', 5268
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 5269

.end # RepeatString


.sub 'checkresult' :method
.annotate 'line', 5270
    .return('S')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5273
    getattribute $P1, self, 'rexpr'
.annotate 'line', 5274
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5275
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5276
    self.'annotate'(__ARG_1)
.annotate 'line', 5277
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
.annotate 'line', 5278

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 5264
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5287
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5288

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5291
    self.'optimizearg'()
.annotate 'line', 5292
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5293
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5294
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5295
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5296
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5297
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'S'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5298
    .tailcall WSubId_78($P1, $P2)
  __label_5: # endif
.annotate 'line', 5299
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_8
    iseq $I3, $S2, 'I'
  __label_8:
    unless $I3 goto __label_7
.annotate 'line', 5300
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5301
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5302
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_7: # endif
.annotate 'line', 5305
    $P3 = WSubId_79($S1, $S2)
    if_null $P3, __label_9
    unless $P3 goto __label_9
.annotate 'line', 5306
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5307
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5308
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_77($P3, $P4, $N3)
  __label_9: # endif
  __label_3: # endif
.annotate 'line', 5312
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'S'
  __label_11:
    unless $I3 goto __label_10
.annotate 'line', 5313
    new $P4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'ConcatString'($P5, $P6, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_10: # endif
.annotate 'line', 5315
    .return(self)
.annotate 'line', 5316

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_79 = "WSubId_79"
.annotate 'line', 5319
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5320
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5321
    ne $S1, $S2, __label_3
.annotate 'line', 5322
    .return($S1)
  __label_3: # endif
.annotate 'line', 5323
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 5324
    .return('S')
  __label_4: # endif
.annotate 'line', 5325
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 5326
    .return('S')
  __label_6: # endif
.annotate 'line', 5327
    $P1 = WSubId_79($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 5328
    .return('N')
  __label_8: # endif
.annotate 'line', 5329
    .return('I')
.annotate 'line', 5330

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5333
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5334
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5335
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5336
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5337
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5339
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5340
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5341
    ne $S1, 'S', __label_6
.annotate 'line', 5342
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
.annotate 'line', 5343
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 5344
    eq $S2, 'S', __label_11
.annotate 'line', 5345
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 5346
    set $S4, $S6
    goto __label_12
  __label_11: # else
.annotate 'line', 5349
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 5350
    set $S5, $S6
  __label_12: # endif
  __label_8: # endif
.annotate 'line', 5353
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
    goto __label_7
  __label_6: # else
.annotate 'line', 5356
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5357
    null $S7
.annotate 'line', 5358
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
.annotate 'line', 5360
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 5361
    __ARG_1.'emitset'($S7, $S4)
  __label_18: # endif
.annotate 'line', 5363
    null $S8
.annotate 'line', 5364
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
.annotate 'line', 5366
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 5367
    __ARG_1.'emitset'($S8, $S5)
  __label_20: # endif
.annotate 'line', 5369
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
    goto __label_14
  __label_13: # else
.annotate 'line', 5372
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
  __label_7: # endif
.annotate 'line', 5374

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 5283
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5383
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5384

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 5387
    self.'optimizearg'()
.annotate 'line', 5388
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5389
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5390
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5391
    $P4 = $P1.'checkresult'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5392
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 5393
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5394
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5395
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5396
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 5399
    .return(self)
.annotate 'line', 5400

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5403
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5404
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5406
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 5408
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 5410
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 5412
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 5407
    .return($S1)
  __label_6: # case
.annotate 'line', 5409
    .return('P')
  __label_8: # case
.annotate 'line', 5411
    .return('N')
  __label_10: # case
.annotate 'line', 5413
    .return('N')
  __label_4: # default
.annotate 'line', 5415
    .return('I')
  __label_3: # switch end
.annotate 'line', 5417

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5420
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5421
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5422
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5423
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5424
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5425
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5426
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5427
    null $S6
.annotate 'line', 5428
    eq $S2, $S1, __label_6
.annotate 'line', 5429
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5430
    ne $S1, 'P', __label_7
.annotate 'line', 5431
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 5433
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 5434
    set $S4, $S6
  __label_6: # endif
.annotate 'line', 5436
    eq $S3, $S1, __label_9
.annotate 'line', 5437
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5438
    ne $S1, 'P', __label_10
.annotate 'line', 5439
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 5441
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 5442
    set $S5, $S6
  __label_9: # endif
.annotate 'line', 5444
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
.annotate 'line', 5445

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 5379
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5454
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5455

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5458
    self.'optimizearg'()
.annotate 'line', 5459
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5460
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5461
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5462
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5463
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5464
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5465
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 5466
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5467
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_5: # endif
.annotate 'line', 5470
    $P3 = WSubId_79($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 5471
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5472
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5473
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_77($P3, $P4, $N3)
  __label_7: # endif
  __label_3: # endif
.annotate 'line', 5477
    ne $S1, 'S', __label_8
.annotate 'line', 5478
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 5479
    .return(self)
.annotate 'line', 5480

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5483
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5484
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5485
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5486
    ne $S1, $S2, __label_3
.annotate 'line', 5487
    .return($S1)
  __label_3: # endif
.annotate 'line', 5488
    ne $S1, 'S', __label_4
.annotate 'line', 5489
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5491
    .return('N')
  __label_5: # endif
.annotate 'line', 5492

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5495
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5496
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5497
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5498
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5499
    null $S3
    null $S4
.annotate 'line', 5500
    iseq $I3, $S1, $S2
    unless $I3 goto __label_4
    iseq $I3, $S1, 'I'
    if $I3 goto __label_6
    iseq $I3, $S1, 'N'
  __label_6:
    if $I3 goto __label_5
    iseq $I3, $S1, 'P'
  __label_5:
  __label_4:
    unless $I3 goto __label_3
.annotate 'line', 5501
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5502
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5503
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5504
    .return()
  __label_3: # endif
.annotate 'line', 5509
    ne $S1, 'N', __label_7
.annotate 'line', 5510
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5511
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5512
    null $S5
    if_null $S2, __label_8
    length $I3, $S2
    ne $I3, 1, __label_8
    ord $I3, $S2
    if $I3 == 73 goto __label_10
    if $I3 == 78 goto __label_11
    goto __label_8
  __label_10: # case
.annotate 'line', 5515
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5516
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5517
    set $S5, $S4
    goto __label_9 # break
  __label_11: # case
.annotate 'line', 5520
    set $S5, $S4
    goto __label_9 # break
  __label_8: # default
.annotate 'line', 5523
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5524
    __ARG_1.'emitset'($S5, $S4)
  __label_9: # switch end
.annotate 'line', 5526
    self.'annotate'(__ARG_1)
.annotate 'line', 5527
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
.annotate 'line', 5528
    .return()
  __label_7: # endif
.annotate 'line', 5531
    null $I1
    null $I2
.annotate 'line', 5532
    $P4 = $P1.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_14
    $P3 = $P1.'isidentifier'()
  __label_14:
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 5533
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S3, $P5
.annotate 'line', 5534
    $P1.'emit'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
.annotate 'line', 5537
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5538
    set $S3, $I1
  __label_13: # endif
.annotate 'line', 5540
    $P4 = $P2.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_17
    $P3 = $P2.'isidentifier'()
  __label_17:
    if_null $P3, __label_15
    unless $P3 goto __label_15
.annotate 'line', 5541
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S4, $P5
.annotate 'line', 5542
    $P2.'emit'(__ARG_1, $S4)
    goto __label_16
  __label_15: # else
    if_null $S2, __label_18
    length $I3, $S2
    ne $I3, 1, __label_18
    ord $I3, $S2
    if $I3 == 83 goto __label_20
    if $I3 == 78 goto __label_21
    if $I3 == 73 goto __label_22
    goto __label_18
  __label_20: # case
.annotate 'line', 5547
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5548
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_21: # case
.annotate 'line', 5551
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_22: # case
  __label_18: # default
.annotate 'line', 5555
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5556
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
  __label_16: # endif
.annotate 'line', 5560
    self.'annotate'(__ARG_1)
.annotate 'line', 5561
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5562

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 5450
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5571
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5572

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5575
    self.'optimizearg'()
.annotate 'line', 5576
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5577
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5578
    $P5 = $P1.'isliteral'()
    unless $P5 goto __label_2
    $P5 = $P2.'isliteral'()
  __label_2:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 5579
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 5580
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5581
    null $P3
.annotate 'line', 5582
    null $P4
.annotate 'line', 5583
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5584
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5585
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5586
    unless $I2 goto __label_7
.annotate 'line', 5587
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_25($P5, $P6, $N3)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 5590
    $P5 = WSubId_79($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
.annotate 'line', 5591
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5592
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5593
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5594
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_77($P5, $P6, $N3)
  __label_9: # endif
  __label_8: # endif
  __label_1: # endif
.annotate 'line', 5598
    .return(self)
.annotate 'line', 5599

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5602
    .return('N')
.annotate 'line', 5603

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5606
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5607
    null $P2
.annotate 'line', 5608
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5609
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
.annotate 'line', 5610
    $P2 = self.'tempreg'('N')
.annotate 'line', 5611
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5612
    set $P3, $P2
  __label_1: # endif
.annotate 'line', 5614
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5615
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5616
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
.annotate 'line', 5617
    $P2 = self.'tempreg'('N')
.annotate 'line', 5618
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5619
    set $P5, $P2
  __label_2: # endif
.annotate 'line', 5621
    self.'annotate'(__ARG_1)
.annotate 'line', 5622
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
.annotate 'line', 5623

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5567
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5632
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5633

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5636
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5637
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5638
    self.'annotate'(__ARG_1)
.annotate 'line', 5639
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5640

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5643
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5644

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5628
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5653
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5654

.end # OpCModExpr


.sub 'checkresult' :method
.annotate 'line', 5657
    .return('I')
.annotate 'line', 5658

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5661
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5662
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5663
    self.'annotate'(__ARG_1)
.annotate 'line', 5668
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5669

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5649
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5678
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5679

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5682
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5683
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5684
    self.'annotate'(__ARG_1)
.annotate 'line', 5685
    __ARG_1.'emitbinop'('shl', __ARG_2, $S1, $S2)
.annotate 'line', 5686

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5689
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5690

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5674
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5699
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5700

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5703
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5704
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5705
    self.'annotate'(__ARG_1)
.annotate 'line', 5706
    __ARG_1.'emitbinop'('shr', __ARG_2, $S1, $S2)
.annotate 'line', 5707

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5710
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5711

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5695
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5720
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 5721

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 5724
    null $I1
    null $I2
.annotate 'line', 5725
    set $S1, ''
.annotate 'line', 5726
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 5727
    $P5 = $P1.'getname'()
    set $S2, $P5
    if $S2 == 'flat' goto __label_5
    if $S2 == 'named' goto __label_6
    goto __label_3
  __label_5: # case
.annotate 'line', 5729
    set $I1, 1
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 5732
    set $I2, 1
.annotate 'line', 5733
    $P6 = $P1.'numargs'()
    set $I3, $P6
    if $I3 == 0 goto __label_9
    if $I3 == 1 goto __label_10
    goto __label_7
  __label_9: # case
    goto __label_8 # break
  __label_10: # case
.annotate 'line', 5737
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5738
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5739
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5740
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_8 # break
  __label_7: # default
.annotate 'line', 5743
    WSubId_1('Invalid modifier', self)
  __label_8: # switch end
  __label_3: # default
  __label_4: # switch end
    goto __label_1
  __label_2: # endfor
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5751
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5754
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5749
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5752
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5755
    __ARG_1.'print'(' :named')
.annotate 'line', 5756
    eq $S1, '', __label_17
.annotate 'line', 5757
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5760

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5716
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5769
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5770
    setattribute self, 'modifiers', __ARG_2
.annotate 'line', 5771

.end # Argument


.sub 'optimize' :method
.annotate 'line', 5774
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5775
    .return(self)
.annotate 'line', 5776

.end # optimize


.sub 'hascompilevalue' :method
.annotate 'line', 5779
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
.annotate 'line', 5780

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5765
    addattribute $P0, 'arg'
.annotate 'line', 5766
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 5785
    null $P1
.annotate 'line', 5786
    $P2 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 5787
    $P3 = __ARG_1.'get'()
.annotate 'line', 5788
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5789
    $P3 = __ARG_1.'get'()
.annotate 'line', 5790
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 5791
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
    goto __label_4
  __label_3: # else
.annotate 'line', 5794
    WSubId_54('modifier list', $P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 5797
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5798
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
.annotate 'line', 5799

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_80 = "WSubId_80"
.annotate 'line', 5810
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5811
    setattribute self, 'start', __ARG_2
.annotate 'line', 5812
    $P1 = __ARG_3.'get'()
.annotate 'line', 5813
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 5814
    __ARG_3.'unget'($P1)
.annotate 'line', 5815
    $P3 = WSubId_50(__ARG_3, __ARG_1, WSubId_80, __ARG_4)
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 5817

.end # ArgumentList


.sub 'numargs' :method
.annotate 'line', 5820
    getattribute $P1, self, 'args'
.annotate 'line', 5821
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
    .return($I1)
.annotate 'line', 5822

.end # numargs


.sub 'getrawargs' :method
.annotate 'line', 5825
    getattribute $P1, self, 'args'
    .return($P1)
.annotate 'line', 5826

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 5829
    getattribute $P1, self, 'args'
.annotate 'line', 5830
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 5831

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
.annotate 'line', 5834
    getattribute $P1, self, 'args'
.annotate 'line', 5835
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
.annotate 'line', 5836

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 5839
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 5840
    .return(self)
.annotate 'line', 5841

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 5844
    getattribute $P1, self, 'argregs'
.annotate 'line', 5845
    unless_null $P1, __label_1
.annotate 'line', 5846
    new $P2, ['ResizableStringArray']
.annotate 'line', 5847
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
.annotate 'line', 5848
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P7, $P5
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P4, $P7
.annotate 'line', 5849
    getattribute $P8, $P4, 'arg'
    $P6 = $P3.'add'($P8)
    null $S1
    if_null $P6, __label_4
    set $S1, $P6
  __label_4:
.annotate 'line', 5850
    push $P2, $S1
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5852
    setattribute self, 'argregs', $P2
  __label_1: # endif
.annotate 'line', 5854
    .return($P1)
.annotate 'line', 5855

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 5858
    getattribute $P1, self, 'args'
.annotate 'line', 5859
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5861
    set $S1, ''
.annotate 'line', 5862
    $P4 = self.'numargs'()
    set $I1, $P4
.annotate 'line', 5863
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5864
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5865
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5866
    if_null $P3, __label_4
.annotate 'line', 5867
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5868
    set $S1, ', '
  __label_1: # for iteration
.annotate 'line', 5863
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5870

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5803
    addattribute $P0, 'owner'
.annotate 'line', 5804
    addattribute $P0, 'start'
.annotate 'line', 5805
    addattribute $P0, 'args'
.annotate 'line', 5806
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_81')
        .param pmc __ARG_1
.annotate 'line', 5875
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5876
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5877
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5878
    .return(1)
.annotate 'line', 5879

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5890
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5891
    setattribute self, 'builtin', __ARG_3
.annotate 'line', 5892
    setattribute self, 'args', __ARG_4
.annotate 'line', 5893

.end # CallBuiltinExpr


.sub 'checkresult' :method
.annotate 'line', 5896
    getattribute $P1, self, 'builtin'
    .tailcall $P1.'result'()
.annotate 'line', 5897

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5900
    self.'emit'(__ARG_1, "")
.annotate 'line', 5901

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 5904
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    if_null $S1, __label_2
    length $I1, $S1
    ne $I1, 1, __label_2
    ord $I1, $S1
    if $I1 == 73 goto __label_4
    if $I1 == 78 goto __label_5
    if $I1 == 83 goto __label_6
    if $I1 == 80 goto __label_7
    if $I1 == 118 goto __label_8
    goto __label_2
  __label_4: # case
  __label_5: # case
  __label_6: # case
  __label_7: # case
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 5910
    WSubId_1("Can't use result of a void builtin", self)
  __label_2: # default
.annotate 'line', 5912
    concat $S3, "Unexpected result type '", $S1
    concat $S3, $S3, "'"
    WSubId_6($S3, self)
  __label_3: # switch end
.annotate 'line', 5914
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_9
    set $S2, $P1
  __label_9:
.annotate 'line', 5915
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 5916
    .return($S2)
.annotate 'line', 5917

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5920
    getattribute $P1, self, 'builtin'
.annotate 'line', 5921
    getattribute $P2, self, 'args'
.annotate 'line', 5922
    new $P3, ['ResizableStringArray']
.annotate 'line', 5923
    null $P4
.annotate 'line', 5924
    $P8 = $P1.'params'()
    set $I3, $P8
    if $I3 == -1 goto __label_3
    if $I3 == -2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 5926
    new $P9, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P10, self, 'owner'
    $P9.'CollectValues'($P10, __ARG_1)
    set $P5, $P9
.annotate 'line', 5927
    if_null $P2, __label_6
    iter $P11, $P2
    set $P11, 0
  __label_5: # for iteration
    unless $P11 goto __label_6
    shift $P4, $P11
.annotate 'line', 5928
    getattribute $P13, $P4, 'arg'
    $P12 = $P5.'add'($P13)
    push $P3, $P12
    goto __label_5
  __label_6: # endfor
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 5931
    root_new $P6, ['parrot';'ResizablePMCArray']
.annotate 'line', 5932
    if_null $P2, __label_8
    iter $P14, $P2
    set $P14, 0
  __label_7: # for iteration
    unless $P14 goto __label_8
    shift $P4, $P14
.annotate 'line', 5933
    getattribute $P15, $P4, 'arg'
    push $P6, $P15
    goto __label_7
  __label_8: # endfor
.annotate 'line', 5934
    getattribute $P16, self, 'builtin'
    getattribute $P17, self, 'start'
    $P16.'expand'(__ARG_1, self, $P17, __ARG_2, $P6)
.annotate 'line', 5935
    .return()
  __label_1: # default
.annotate 'line', 5937
    getattribute $P18, self, 'args'
    set $I1, $P18
.annotate 'line', 5938
    new $P19, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P20, self, 'owner'
    $P19.'CollectValues'($P20, __ARG_1)
    set $P7, $P19
.annotate 'line', 5939
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
.annotate 'line', 5940
    $P21 = $P2[$I2]
    getattribute $P4, $P21, 'arg'
.annotate 'line', 5941
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
.annotate 'line', 5942
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
.annotate 'line', 5943
    null $S3
.annotate 'line', 5944
    $P8 = $P4.'isnull'()
    if_null $P8, __label_14
    unless $P8 goto __label_14
    if_null $S2, __label_16
    length $I3, $S2
    ne $I3, 1, __label_16
    ord $I3, $S2
    if $I3 == 73 goto __label_18
    if $I3 == 78 goto __label_19
    if $I3 == 83 goto __label_20
    goto __label_16
  __label_18: # case
  __label_19: # case
  __label_20: # case
.annotate 'line', 5949
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5950
    __ARG_1.'emitnull'($S3)
    goto __label_17 # break
  __label_16: # default
.annotate 'line', 5953
    $P10 = $P7.'add'($P4)
    set $S3, $P10
  __label_17: # switch end
    goto __label_15
  __label_14: # else
.annotate 'line', 5957
    iseq $I3, $S1, $S2
    if $I3 goto __label_24
    iseq $I3, $S2, '?'
  __label_24:
    if $I3 goto __label_23
.annotate 'line', 5958
    iseq $I3, $S2, 'p'
    unless $I3 goto __label_25
.annotate 'line', 5959
    iseq $I3, $S1, 'S'
    if $I3 goto __label_26
    iseq $I3, $S1, 'P'
  __label_26:
  __label_25:
  __label_23:
    unless $I3 goto __label_21
.annotate 'line', 5960
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
.annotate 'line', 5962
    ne $S2, 'p', __label_27
.annotate 'line', 5963
    set $S2, 'P'
  __label_27: # endif
.annotate 'line', 5964
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P8, __label_28
    set $S4, $P8
  __label_28:
    if_null $S2, __label_29
    length $I3, $S2
    ne $I3, 1, __label_29
    ord $I3, $S2
    if $I3 == 80 goto __label_31
    if $I3 == 73 goto __label_32
    if $I3 == 78 goto __label_33
    if $I3 == 83 goto __label_34
    goto __label_29
  __label_31: # case
.annotate 'line', 5965
    if_null $S1, __label_35
    length $I4, $S1
    ne $I4, 1, __label_35
    ord $I4, $S1
    if $I4 == 73 goto __label_37
    if $I4 == 78 goto __label_38
    if $I4 == 83 goto __label_39
    goto __label_35
  __label_37: # case
  __label_38: # case
  __label_39: # case
.annotate 'line', 5971
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
.annotate 'line', 5972
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_36 # break
  __label_35: # default
.annotate 'line', 5975
    set $S3, $S4
  __label_36: # switch end
    goto __label_30 # break
  __label_32: # case
  __label_33: # case
  __label_34: # case
.annotate 'line', 5981
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5982
    __ARG_1.'emitset'($S3, $S4)
    goto __label_30 # break
  __label_29: # default
.annotate 'line', 5985
    set $S3, $S4
  __label_30: # switch end
  __label_22: # endif
  __label_15: # endif
.annotate 'line', 5989
    push $P3, $S3
  __label_9: # for iteration
.annotate 'line', 5939
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_2: # switch end
.annotate 'line', 5992
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)
.annotate 'line', 5993

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
.annotate 'line', 5883
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 5885
    addattribute $P0, 'builtin'
.annotate 'line', 5886
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_81 = "WSubId_81"
.annotate 'line', 6000
    $P7 = __ARG_3.'getname'()
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 6001
    __ARG_1.'use_builtin'($S1)
.annotate 'line', 6002
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P7 = __ARG_4.'numargs'()
    set $I1, $P7
  __label_2:
.annotate 'line', 6003
    if $I1 goto __label_5
    root_new $P7, ['parrot';'ResizablePMCArray']
    set $P1, $P7
    goto __label_4
  __label_5:
    $P8 = __ARG_4.'getrawargs'()
    set $P1, $P8
  __label_4:
.annotate 'line', 6005
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 6006
    null $P3
.annotate 'line', 6007
    if_null $P2, __label_7
    iter $P9, $P2
    set $P9, 0
  __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P4, $P9
.annotate 'line', 6008
    getattribute $P7, $P4, 'nparams'
    set $I2, $P7
.annotate 'line', 6009
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 6010
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 6011
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 6012
    set $P3, $P4
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
.annotate 'line', 6014
    unless_null $P3, __label_12
.annotate 'line', 6015
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 6018
    $P7 = $P3.'iscompileevaluable'()
    if_null $P7, __label_13
    unless $P7 goto __label_13
.annotate 'line', 6019
    $P8 = WSubId_81($P1)
    if_null $P8, __label_14
    unless $P8 goto __label_14
.annotate 'line', 6020
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 6021
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_15
    push_eh $P7
.annotate 'line', 6022
    getattribute $P10, __ARG_1, 'owner'
    getattribute $P11, __ARG_1, 'start'
    $P8 = $P5($P10, $P11, $P1)
    .return($P8)
    pop_eh
    goto __label_16
  __label_15:
.annotate 'line', 6021
    .get_results($P6)
    finalize $P6
    pop_eh
.annotate 'line', 6026
    $S2 = $P6["message"]
    concat $S3, "Compile time evaluation of builtin ", $S1
    concat $S3, $S3, " failed: '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
.annotate 'line', 6025
    WSubId_1($S3, __ARG_2)
  __label_16:
  __label_14: # endif
  __label_13: # endif
.annotate 'line', 6031
    new $P8, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P8.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P7, $P8
    .return($P7)
.annotate 'line', 6032

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6041
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6042
    setattribute self, 'funref', __ARG_4
.annotate 'line', 6043
    $P1 = __ARG_1.'get'()
.annotate 'line', 6044
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6045
    __ARG_1.'unget'($P1)
.annotate 'line', 6046
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 6048

.end # CallExpr


.sub 'checkresult' :method
.annotate 'line', 6049
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6052
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 6053
    getattribute $P2, self, 'args'
.annotate 'line', 6054
    if_null $P2, __label_1
.annotate 'line', 6055
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 6057
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
.annotate 'line', 6058
    $P3 = $P1.'search_nonmember'()
.annotate 'line', 6060
    isnull $I1, $P3
    if $I1 goto __label_5
.annotate 'line', 6062
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_6
.annotate 'line', 6073
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
.annotate 'line', 6076
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6061
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_6: # case
.annotate 'line', 6063
    $P8 = $P3.'ismulti'()
    isfalse $I2, $P8
    unless $I2 goto __label_9
.annotate 'line', 6064
    $P4 = $P3.'makesubid'()
.annotate 'line', 6065
    self.'usesubid'($P4)
.annotate 'line', 6066
    new $P7, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
    $P7.'CallSubid'(self, $P1, $P2, $P4)
    set $P6, $P7
    .return($P6)
    goto __label_10
  __label_9: # else
.annotate 'line', 6069
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 6070
    .return(self)
  __label_10: # endif
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6074
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 6075
    .return(self)
  __label_8: # case
.annotate 'line', 6077
    getattribute $P11, self, 'owner'
    getattribute $P12, $P1, 'start'
    .tailcall WSubId_82($P11, $P12, $P3, $P2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6080
    getattribute $P13, self, 'start'
    WSubId_6("unexpected type found in scope", $P13)
  __label_3: # switch end
  __label_2: # endif
.annotate 'line', 6083
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 6084
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_11: # endif
.annotate 'line', 6087
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_12
    unless $P6 goto __label_12
.annotate 'line', 6088
    $P7 = $P1.'checkIdentifier'()
    set $S1, $P7
    ne $S1, '', __label_13
.annotate 'line', 6089
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P9 = $P1.'getName'()
    $P8[0] = $P9
    $P5 = self.'scopesearch'($P8, 0)
.annotate 'line', 6090
    isnull $I1, $P5
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 6091
    getattribute $P6, self, 'owner'
    getattribute $P7, $P1, 'start'
    .tailcall WSubId_82($P6, $P7, $P5, $P2)
  __label_14: # endif
  __label_13: # endif
  __label_12: # endif
.annotate 'line', 6095
    setattribute self, 'funref', $P1
.annotate 'line', 6096
    setattribute self, 'args', $P2
.annotate 'line', 6097
    .return(self)
.annotate 'line', 6098

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 6101
    .return(1)
.annotate 'line', 6102

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6105
    getattribute $P1, self, 'funref'
.annotate 'line', 6106
    null $S1
.annotate 'line', 6108
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6109
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 6110
    ne $S1, '', __label_3
.annotate 'line', 6111
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
.annotate 'line', 6113
    isnull $I1, $P2
    if $I1 goto __label_6
.annotate 'line', 6116
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
.annotate 'line', 6119
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 6114
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
    join $S1, "", $P3
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 6117
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 6120
    WSubId_6("Builtin unexpected here", self)
  __label_5: # default
.annotate 'line', 6122
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 3
    $P6[0] = "'"
    $P7 = $P1.'getName'()
    $P6[1] = $P7
    $P6[2] = "'"
    join $S1, "", $P6
  __label_4: # switch end
  __label_3: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 6127
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 6128
    .return($S1)
.annotate 'line', 6129

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
.annotate 'line', 6132
    getattribute $P1, self, 'args'
.annotate 'line', 6133
    if_null $P1, __label_1
.annotate 'line', 6134
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6135

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 6138
    __ARG_1.'print'('(')
.annotate 'line', 6139
    getattribute $P1, self, 'args'
.annotate 'line', 6140
    if_null $P1, __label_1
.annotate 'line', 6141
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6142
    __ARG_1.'say'(')')
.annotate 'line', 6143

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6146
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6147
    self.'prepareargs'(__ARG_1)
.annotate 'line', 6149
    self.'annotate'(__ARG_1)
.annotate 'line', 6151
    __ARG_1.'print'('    ')
.annotate 'line', 6152
    ne __ARG_2, '.tailcall', __label_2
.annotate 'line', 6153
    __ARG_1.'print'('.tailcall ')
    goto __label_3
  __label_2: # else
.annotate 'line', 6155
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_3: # endif
.annotate 'line', 6157
    __ARG_1.'print'($S1)
.annotate 'line', 6158
    self.'emitargs'(__ARG_1)
.annotate 'line', 6159

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6162
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6163
    self.'prepareargs'(__ARG_1)
.annotate 'line', 6164
    self.'annotate'(__ARG_1)
.annotate 'line', 6165
    __ARG_1.'print'('    ')
.annotate 'line', 6166
    __ARG_1.'print'($S1)
.annotate 'line', 6167
    self.'emitargs'(__ARG_1)
.annotate 'line', 6168

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6034
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6036
    addattribute $P0, 'funref'
.annotate 'line', 6037
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallSubid' ]

.sub 'CallSubid' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6180
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6181
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6182
    setattribute self, 'args', __ARG_3
.annotate 'line', 6183
    setattribute self, 'subid', __ARG_4
.annotate 'line', 6184

.end # CallSubid


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 6187
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 6188

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
.annotate 'line', 6175
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 6177
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6196
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6197
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6198
    setattribute self, 'args', __ARG_3
.annotate 'line', 6199

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6202
    getattribute $P1, self, 'funref'
.annotate 'line', 6204
    getattribute $P2, $P1, 'left'
  __label_2: # while
.annotate 'line', 6205
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6206
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6207
    $P5 = $P2.'isidentifier'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 6208
    $P6 = $P2.'checkIdentifier'()
    null $S1
    if_null $P6, __label_4
    set $S1, $P6
  __label_4:
.annotate 'line', 6209
    isnull $I1, $S1
    if $I1 goto __label_6
    iseq $I1, $S1, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 6213
    new $P3, ['ResizableStringArray']
.annotate 'line', 6214
    $P1.'buildkey'($P3)
.annotate 'line', 6215
    $P5 = $P3.'pop'()
    null $S2
    if_null $P5, __label_7
    set $S2, $P5
  __label_7:
.annotate 'line', 6216
    $P4 = self.'tempreg'('P')
.annotate 'line', 6217
    self.'annotate'(__ARG_1)
.annotate 'line', 6218
    $P5 = WSubId_30($P3)
    __ARG_1.'emitget_hll_global'($P4, $S2, $P5)
.annotate 'line', 6219
    .return($P4)
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 6222
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 4
    $P6 = $P1.'emit_left_get'(__ARG_1)
    $P5[0] = $P6
    $P5[1] = ".'"
.annotate 'line', 6223
    $P7 = $P1.'get_member'()
.annotate 'line', 6222
    $P5[2] = $P7
    $P5[3] = "'"
    join $S3, "", $P5
    .return($S3)
.annotate 'line', 6224

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 6192
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6234
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6235
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6236
    setattribute self, 'args', __ARG_3
.annotate 'line', 6237

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6240
    getattribute $P1, self, 'funref'
.annotate 'line', 6241
    getattribute $P2, $P1, 'right'
.annotate 'line', 6242
    $P3 = $P2.'checkresult'()
.annotate 'line', 6243
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6244
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 6247
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 6248
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 6249
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
.annotate 'line', 6250

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 6230
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6260
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6261
    setattribute self, 'left', __ARG_3
.annotate 'line', 6262

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
.annotate 'line', 6265
    getattribute $P1, self, 'left'
    .tailcall $P1.'emit_getvar'(__ARG_1)
.annotate 'line', 6266

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 6255
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6257
    addattribute $P0, 'left'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6275
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6276
    setattribute self, 'right', __ARG_4
.annotate 'line', 6277

.end # MemberExpr


.sub 'checkresult' :method
.annotate 'line', 6278
    .return('P')

.end # checkresult


.sub 'search_nonmember' :method
.annotate 'line', 6284
    null $P1
.annotate 'line', 6285
    null $P2
.annotate 'line', 6286
    getattribute $P3, self, 'left'
  __label_2: # while
.annotate 'line', 6287
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6288
    getattribute $P3, $P3, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6289
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 6290
    $P4 = $P3.'checkIdentifier'()
.annotate 'line', 6291
    isnull $I1, $P4
    if $I1 goto __label_5
    set $S1, $P4
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 6292
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 6293
    self.'buildkey'($P5)
.annotate 'line', 6294
    .tailcall self.'scopesearch'($P5, 0)
  __label_4: # endif
  __label_3: # endif
    null $P6
.annotate 'line', 6297
    .return($P6)
.annotate 'line', 6298

.end # search_nonmember


.sub 'optimize' :method
.annotate 'line', 6301
    getattribute $P4, self, 'left'
    $P3 = $P4.'optimize'()
    setattribute self, 'left', $P3
.annotate 'line', 6303
    $P1 = self.'search_nonmember'()
.annotate 'line', 6305
    isnull $I1, $P1
    if $I1 goto __label_3
.annotate 'line', 6307
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
.annotate 'line', 6311
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6308
    $P2 = $P1.'ismulti'()
    if_null $P2, __label_6
    unless $P2 goto __label_6
.annotate 'line', 6309
    new $P4, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'FunctionRef'($P5, $P6, $P1)
    set $P3, $P4
    .return($P3)
  __label_6: # endif
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 6312
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6314
    .return(self)
.annotate 'line', 6315

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
.annotate 'line', 6318
    getattribute $P1, self, 'left'
.annotate 'line', 6319
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6320
    $P2 = $P1.'getName'()
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 6322
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6323
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
    push __ARG_1, $P2
.annotate 'line', 6324

.end # buildkey


.sub 'get_member' :method
.annotate 'line', 6327
    getattribute $P1, self, 'right'
    .return($P1)
.annotate 'line', 6328

.end # get_member


.sub '__emit_get_left' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6331
    getattribute $P1, self, 'left'
.annotate 'line', 6332
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    eq $S1, 'P', __label_1
.annotate 'line', 6333
    WSubId_1("non-var at left of '.'", self)
  __label_1: # endif
.annotate 'line', 6334
    .tailcall $P1.'emit_get_nonull'(__ARG_1)
.annotate 'line', 6335

.end # __emit_get_left


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6338
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6339
    self.'annotate'(__ARG_1)
.annotate 'line', 6340
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
.annotate 'line', 6341

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6344
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6345
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6346
    .return($S1)
.annotate 'line', 6347

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6350
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6351
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6352
    self.'annotate'(__ARG_1)
.annotate 'line', 6353
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 6354

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6357
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6358
    null $S2
.annotate 'line', 6359
    ne __ARG_2, 'P', __label_2
.annotate 'line', 6361
    ne __ARG_3, 'null', __label_4
.annotate 'line', 6362
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 6363
    __ARG_1.'emitnull'(__ARG_3)
  __label_4: # endif
.annotate 'line', 6365
    set $S2, __ARG_3
    goto __label_3
  __label_2: # else
.annotate 'line', 6368
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 6369
    __ARG_1.'emitbox'($S2, __ARG_3)
  __label_3: # endif
.annotate 'line', 6371
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6372

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6375
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6376
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6377
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 6378
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
.annotate 'line', 6380
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 6381
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 6382
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 6384
    set $S2, $S3
  __label_7: # endif
  __label_4: # endif
.annotate 'line', 6386
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6387
    .return($S2)
.annotate 'line', 6388

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 6269
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6271
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6399
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6400
    setattribute self, 'right', __ARG_4
.annotate 'line', 6401

.end # MemberRefExpr


.sub 'checkresult' :method
.annotate 'line', 6402
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6405
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 6406
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 6407
    .return(self)
.annotate 'line', 6408

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 6411
    getattribute $P1, self, 'left'
.annotate 'line', 6412
    getattribute $P2, self, 'right'
.annotate 'line', 6413
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 6414
    WSubId_54("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6415
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6416
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6417
    self.'annotate'(__ARG_1)
.annotate 'line', 6418
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
.annotate 'line', 6419

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 6422
    getattribute $P1, self, 'left'
.annotate 'line', 6423
    getattribute $P2, self, 'right'
.annotate 'line', 6424
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 6425
    WSubId_54("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6426
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6427
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6428
    null $S3
.annotate 'line', 6429
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    if_null $S5, __label_4
    length $I1, $S5
    ne $I1, 1, __label_4
    ord $I1, $S5
    if $I1 == 80 goto __label_6
    goto __label_4
  __label_6: # case
.annotate 'line', 6431
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 6433
    ne $S3, 'null', __label_7
.annotate 'line', 6434
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 6435
    __ARG_1.'emitnull'($S3)
  __label_7: # endif
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 6439
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 6440
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6441
    __ARG_1.'emitbox'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 6444
    self.'annotate'(__ARG_1)
.annotate 'line', 6445
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 6446
    .return($S3)
.annotate 'line', 6447

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 6394
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6396
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]

.sub 'StringIndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6458
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6459
    setattribute self, 'left', __ARG_3
.annotate 'line', 6460
    setattribute self, 'arg', __ARG_4
.annotate 'line', 6461

.end # StringIndexExpr


.sub 'checkresult' :method
.annotate 'line', 6464
    .return('S')
.annotate 'line', 6465

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 6468
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6469
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6470
    self.'annotate'(__ARG_1)
.annotate 'line', 6471
    $P1 = WSubId_26("    substr %0, %1, %2, 1", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P1)
.annotate 'line', 6473

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 6452
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6454
    addattribute $P0, 'left'
.annotate 'line', 6455
    addattribute $P0, 'arg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6487
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6488
    setattribute self, 'left', __ARG_4
.annotate 'line', 6489
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
.annotate 'line', 6490

.end # IndexExpr


.sub 'checkresult' :method
.annotate 'line', 6493
    .return('P')
.annotate 'line', 6494

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 6497
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 6498
    setattribute self, 'left', $P1
.annotate 'line', 6499
    getattribute $P2, self, 'args'
.annotate 'line', 6500
    $P2.'optimizeargs'()
.annotate 'line', 6502
    $P4 = $P1.'checkresult'()
    set $S2, $P4
    ne $S2, 'S', __label_1
.annotate 'line', 6503
    $P5 = $P2.'numargs'()
    set $I2, $P5
    eq $I2, 1, __label_2
.annotate 'line', 6504
    WSubId_1('Bad string index', self)
  __label_2: # endif
.annotate 'line', 6505
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6508
    $P4 = $P1.'isstringliteral'()
    unless $P4 goto __label_4
    $P4 = $P3.'isintegerliteral'()
  __label_4:
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 6509
    $P5 = $P3.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 6510
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_5
    set $S1, $P4
  __label_5:
.annotate 'line', 6511
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
.annotate 'line', 6512
    substr $S2, $S1, $I1, 1
.annotate 'line', 6511
    .tailcall WSubId_27($P4, $P5, $S2)
  __label_3: # endif
.annotate 'line', 6514
    new $P5, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'StringIndexExpr'($P6, $P7, $P1, $P3)
    set $P4, $P5
    .return($P4)
  __label_1: # endif
.annotate 'line', 6517
    .return(self)
.annotate 'line', 6518

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6521
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6522
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6523
    getattribute $P1, self, 'left'
.annotate 'line', 6524
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6525
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 6526
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 6524
    setattribute self, 'regleft', $P3
.annotate 'line', 6527
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
.annotate 'line', 6528

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6531
    getattribute $P1, self, 'regleft'
.annotate 'line', 6532
    getattribute $P2, self, 'argregs'
.annotate 'line', 6533
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6534
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6535
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6536
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6537
    __ARG_1.'print'(']')
.annotate 'line', 6538

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6541
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6542
    self.'annotate'(__ARG_1)
.annotate 'line', 6543
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6544
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6545
    __ARG_1.'say'('')
.annotate 'line', 6546

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 6549
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6550
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6551
    .return($S1)
.annotate 'line', 6552

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6555
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6556
    self.'annotate'(__ARG_1)
.annotate 'line', 6557
    __ARG_1.'print'('    ')
.annotate 'line', 6558
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6559
    __ARG_1.'say'(' = ', __ARG_3)
.annotate 'line', 6560

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6563
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6564
    null $S1
.annotate 'line', 6565
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 6566
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6567
    __ARG_1.'emitnull'($S1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6570
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6571
    self.'annotate'(__ARG_1)
.annotate 'line', 6572
    __ARG_1.'print'('    ')
.annotate 'line', 6573
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6574
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6575
    .return($S1)
.annotate 'line', 6576

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6478
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6480
    addattribute $P0, 'left'
.annotate 'line', 6481
    addattribute $P0, 'regleft'
.annotate 'line', 6482
    addattribute $P0, 'args'
.annotate 'line', 6483
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 6587
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6588
    $P1 = __ARG_1.'get'()
.annotate 'line', 6589
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6590
    __ARG_1.'unget'($P1)
.annotate 'line', 6591
    $P3 = WSubId_50(__ARG_1, __ARG_2, WSubId_51, ']')
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 6593

.end # ArrayExpr


.sub 'checkresult' :method
.annotate 'line', 6594
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 6597
    getattribute $P1, self, 'values'
    WSubId_52($P1)
.annotate 'line', 6598
    .return(self)
.annotate 'line', 6599

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6602
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6603
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 6604

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6610
    self.'emit_init'(__ARG_1, '')
.annotate 'line', 6611

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6614
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6615
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6616
    .return($S1)
.annotate 'line', 6617

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 6620
    self.'annotate'(__ARG_1)
.annotate 'line', 6621
    getattribute $P1, self, 'values'
.annotate 'line', 6622
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 6623
    eq __ARG_2, '', __label_3
.annotate 'line', 6624
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6625
    le $I1, 0, __label_4
.annotate 'line', 6626
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 6628
    new $P4, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P4.'CollectValues'($P5, __ARG_1)
    set $P2, $P4
.annotate 'line', 6629
    null $I2
.annotate 'line', 6630
    if_null $P1, __label_6
    iter $P6, $P1
    set $P6, 0
  __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P3, $P6
.annotate 'line', 6631
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6632
    eq __ARG_2, '', __label_8
.annotate 'line', 6633
    self.'annotate'(__ARG_1)
.annotate 'line', 6634
    $P4 = WSubId_26("    %0[%1] = %2", __ARG_2, $I2, $S1)
    __ARG_1.'say'($P4)
.annotate 'line', 6635
    inc $I2
  __label_8: # endif
    goto __label_5
  __label_6: # endfor
.annotate 'line', 6638

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6581
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6583
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 6650
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6651
    $P1 = __ARG_1.'get'()
.annotate 'line', 6652
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6653
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6654
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 6655
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6657
    $P4 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 6658
    WSubId_68(':', __ARG_1)
.annotate 'line', 6659
    $P5 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 6660
    push $P2, $P4
.annotate 'line', 6661
    push $P3, $P5
  __label_4: # continue
.annotate 'line', 6663
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6664
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6665
    WSubId_54("',' or '}'", $P1)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 6667
    setattribute self, 'keys', $P2
.annotate 'line', 6668
    setattribute self, 'values', $P3
.annotate 'line', 6669

.end # HashExpr


.sub 'checkresult' :method
.annotate 'line', 6670
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 6673
    getattribute $P1, self, 'keys'
    WSubId_52($P1)
.annotate 'line', 6674
    getattribute $P1, self, 'values'
    WSubId_52($P1)
.annotate 'line', 6675
    .return(self)
.annotate 'line', 6676

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6679
    self.'annotate'(__ARG_1)
.annotate 'line', 6684
    eq __ARG_2, '', __label_1
.annotate 'line', 6685
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6687
    getattribute $P1, self, 'keys'
.annotate 'line', 6688
    getattribute $P2, self, 'values'
.annotate 'line', 6689
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
.annotate 'line', 6690
    set $I1, $P1
.annotate 'line', 6691
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 6692
    $P4 = $P1[$I2]
.annotate 'line', 6693
    null $S1
.annotate 'line', 6694
    $P5 = $P4.'isidentifier'()
    unless $P5 goto __label_7
    $P6 = $P4.'checkIdentifier'()
    set $S4, $P6
    iseq $I3, $S4, ''
    box $P5, $I3
  __label_7:
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 6695
    $P7 = $P4.'getName'()
    null $S2
    if_null $P7, __label_8
    set $S2, $P7
  __label_8:
.annotate 'line', 6696
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6697
    __ARG_1.'emitget_hll_global'($S1, $S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 6700
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6702
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 6703
    eq __ARG_2, '', __label_10
.annotate 'line', 6704
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_10: # endif
  __label_2: # for iteration
.annotate 'line', 6691
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 6706

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6709
    self.'emit'(__ARG_1, '')
.annotate 'line', 6710

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6713
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6714
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6715
    .return($S1)
.annotate 'line', 6716

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6643
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6645
    addattribute $P0, 'keys'
.annotate 'line', 6646
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 6729
    .return('P')

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
.annotate 'line', 6734
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
.annotate 'line', 6735

.end # parseinitializer


.sub 'numargs' :method
.annotate 'line', 6738
    getattribute $P1, self, 'initializer'
.annotate 'line', 6739
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)
.annotate 'line', 6740

.end # numargs


.sub 'optimize_initializer' :method
.annotate 'line', 6743
    getattribute $P1, self, 'initializer'
.annotate 'line', 6744
    if_null $P1, __label_1
.annotate 'line', 6745
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 6746

.end # optimize_initializer


.sub 'optimize' :method
.annotate 'line', 6749
    self.'optimize_initializer'()
.annotate 'line', 6750
    .return(self)
.annotate 'line', 6751

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6754
    getattribute $P1, self, 'initializer'
.annotate 'line', 6755
    if_null $P1, __label_1
.annotate 'line', 6756
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6757
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6758
    if_null $P1, __label_2
.annotate 'line', 6759
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6760
    __ARG_1.'say'(")")
.annotate 'line', 6761

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6721
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6723
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'warn_class_unknown' :subid('WSubId_83')
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6768
    concat $S1, "class ", __ARG_2
    concat $S1, $S1, " not found at compile time"
    __ARG_1.'warn'($S1, __ARG_3)
.annotate 'line', 6769

.end # warn_class_unknown

.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6777
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6779
    $P2 = __ARG_4.'isstring'()
    if $P2 goto __label_2
    $P2 = __ARG_4.'isidentifier'()
  __label_2:
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6780
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6781
    setattribute self, 'value', __ARG_4
.annotate 'line', 6782
    $P1 = __ARG_1.'get'()
.annotate 'line', 6784
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6785
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6787
    __ARG_1.'unget'($P1)
  __label_4: # endif
.annotate 'line', 6788

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6791
    getattribute $P1, self, 'value'
.annotate 'line', 6792
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6795
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6796
    isnull $I1, $P2
    not $I1
    box $P3, $I1
    unless $P3 goto __label_3
    $P3 = $P2.'isconst'()
  __label_3:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 6797
    $P1 = $P2.'getvalue'()
.annotate 'line', 6798
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 6799
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 6800
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 6803
    self.'optimize_initializer'()
.annotate 'line', 6804
    .return(self)
.annotate 'line', 6805

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6808
    self.'annotate'(__ARG_1)
.annotate 'line', 6810
    getattribute $P1, self, 'initializer'
.annotate 'line', 6811
    getattribute $P2, self, 'value'
.annotate 'line', 6812
    $P8 = self.'numargs'()
    set $I1, $P8
.annotate 'line', 6815
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6816
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6818
    set $S1, ''
.annotate 'line', 6819
    set $S2, __ARG_2
.annotate 'line', 6820
    null $S3
    if $I1 == -1 goto __label_7
    if $I1 == 0 goto __label_8
    if $I1 == 1 goto __label_9
    goto __label_5
  __label_7: # case
  __label_8: # case
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 6826
    ne $I2, 1, __label_10
.annotate 'line', 6827
    not $I4, __ARG_3
    unless $I4 goto __label_12
.annotate 'line', 6828
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_12: # endif
    goto __label_11
  __label_10: # else
.annotate 'line', 6831
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 6832
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 6833
    concat $S5, ', ', $S1
    set $S1, $S5
  __label_11: # endif
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 6837
    eq $I2, 1, __label_13
.annotate 'line', 6838
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_13: # endif
.annotate 'line', 6839
    not $I3, __ARG_3
    unless $I3 goto __label_14
.annotate 'line', 6840
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_14: # endif
  __label_6: # switch end
.annotate 'line', 6843
    ne $S2, '', __label_15
.annotate 'line', 6844
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
    if $I2 == 0 goto __label_18
    if $I2 == 1 goto __label_19
    goto __label_16
  __label_18: # case
.annotate 'line', 6849
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
  __label_20:
.annotate 'line', 6850
    get_class $P4, $S4
.annotate 'line', 6851
    unless_null $P4, __label_21
.annotate 'line', 6852
    WSubId_83(__ARG_1, $S4, $P2)
  __label_21: # endif
.annotate 'line', 6856
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 6857
    le $I1, 1, __label_22
.annotate 'line', 6858
    __ARG_1.'say'($S2, ".'", $P2, "'()")
  __label_22: # endif
    goto __label_17 # break
  __label_19: # case
.annotate 'line', 6862
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 6863
    unless_null $P5, __label_23
.annotate 'line', 6864
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 6865
    if_null $P6, __label_25
.annotate 'line', 6866
    $P7 = $P6.'getpath'()
.annotate 'line', 6867
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
    goto __label_26
  __label_25: # else
.annotate 'line', 6870
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 6871
    if_null $P5, __label_27
.annotate 'line', 6872
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_28
  __label_27: # else
.annotate 'line', 6874
    $P9 = $P2.'getidentifier'()
    WSubId_83(__ARG_1, $P9, $P2)
.annotate 'line', 6875
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
  __label_28: # endif
  __label_26: # endif
.annotate 'line', 6878
    set $S3, $P2
    goto __label_24
  __label_23: # else
.annotate 'line', 6882
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
  __label_24: # endif
    goto __label_17 # break
  __label_16: # default
.annotate 'line', 6886
    WSubId_6('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 6888
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isge $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
  __label_31:
  __label_30:
    unless $I3 goto __label_29
.annotate 'line', 6889
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6890
    not $I3, __ARG_3
    unless $I3 goto __label_32
.annotate 'line', 6891
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_32: # endif
  __label_29: # endif
.annotate 'line', 6893

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6771
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6773
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6904
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6905
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6906
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
.annotate 'line', 6907
    setattribute self, 'nskey', $P1
.annotate 'line', 6908
    $P2 = __ARG_1.'get'()
.annotate 'line', 6909
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6910
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6912
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 6913

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6916
    null $S1
.annotate 'line', 6917
    $P3 = self.'numargs'()
    set $I1, $P3
    if $I1 == -1 goto __label_3
    if $I1 == 0 goto __label_4
    if $I1 == 1 goto __label_5
    goto __label_1
  __label_3: # case
  __label_4: # case
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6922
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6923
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 6926
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_2: # switch end
.annotate 'line', 6928
    getattribute $P2, self, 'nskey'
.annotate 'line', 6930
    __ARG_1.'print'('    ')
.annotate 'line', 6931
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6932
    __ARG_1.'print'("root_")
  __label_6: # endif
.annotate 'line', 6933
    __ARG_1.'print'("new ", __ARG_2, ", ")
    null $P3
.annotate 'line', 6934
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6935
    if_null $S1, __label_7
.annotate 'line', 6936
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
.annotate 'line', 6937
    __ARG_1.'say'()
.annotate 'line', 6938

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6898
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6900
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6949
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6950
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6951
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
.annotate 'line', 6952
    setattribute self, 'nskey', $P1
.annotate 'line', 6953
    $P2 = __ARG_1.'get'()
.annotate 'line', 6954
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6955
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6957
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 6958

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6961
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6962
    set $S1, __ARG_2
.annotate 'line', 6963
    le $I1, 0, __label_1
.annotate 'line', 6964
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 6965
    getattribute $P1, self, 'nskey'
.annotate 'line', 6967
    ne $S1, '', __label_2
.annotate 'line', 6968
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6970
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 6972
    lt $I1, 0, __label_3
.annotate 'line', 6973
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 6974
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6975
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 6977

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6943
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6945
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6984
    $P1 = __ARG_1.'get'()
.annotate 'line', 6987
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6991
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6994
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6989
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6990
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6989
    .return($P3)
  __label_4: # case
.annotate 'line', 6993
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6997
    $P2 = __ARG_1.'get'()
.annotate 'line', 6998
    __ARG_1.'unget'($P2)
.annotate 'line', 6999
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 7001
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_6: # endif
  __label_2: # default
.annotate 'line', 7006
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
.annotate 'line', 7008

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_76 = "WSubId_76"
.annotate 'line', 7019
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 7020
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 7021
    $P2 = WSubId_76(__ARG_4, self)
    setattribute self, 'checked', $P2
.annotate 'line', 7022

.end # OpInstanceOfExpr


.sub 'optimize' :method
.annotate 'line', 7025
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 7026
    .return(self)
.annotate 'line', 7027

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7028
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 7031
    getattribute $P1, self, 'lexpr'
.annotate 'line', 7032
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7033
    eq $S1, 'P', __label_2
.annotate 'line', 7034
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 7035
    getattribute $P2, self, 'checked'
.annotate 'line', 7037
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 7038
    self.'annotate'(__ARG_1)
.annotate 'line', 7039
    __ARG_1.'print'('    isa ', __ARG_2, ', ', $S2, ', ')
.annotate 'line', 7040
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 7041
    __ARG_1.'say'()
.annotate 'line', 7042

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 7012
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7014
    addattribute $P0, 'lexpr'
.annotate 'line', 7015
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 7055
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 7056
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 7057
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 7058
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 7059
    .return(self)
.annotate 'line', 7060

.end # OpConditionalExpr


.sub 'optimize' :method
.annotate 'line', 7063
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7064
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 7066
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 7068
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_1: # default
.annotate 'line', 7070
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 7071
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 7072
    .return(self)
  __label_2: # switch end
.annotate 'line', 7074

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7077
    getattribute $P1, self, 'etrue'
.annotate 'line', 7078
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7079
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 7081
    .tailcall $P1.'checkresult'()
  __label_2: # endif
.annotate 'line', 7082

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7085
    getattribute $P1, self, 'owner'
.annotate 'line', 7086
    $P5 = $P1.'genlabel'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7087
    $P5 = $P1.'genlabel'()
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
  __label_2:
.annotate 'line', 7088
    getattribute $P5, self, 'condition'
    $P5.'emit_else'(__ARG_1, $S2)
.annotate 'line', 7089
    getattribute $P2, self, 'etrue'
.annotate 'line', 7090
    $P5 = self.'checkresult'()
    null $S3
    if_null $P5, __label_3
    set $S3, $P5
  __label_3:
.annotate 'line', 7091
    $P5 = $P2.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7092
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 7094
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 7095
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7096
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7097
    getattribute $P3, self, 'efalse'
.annotate 'line', 7098
    $P5 = $P3.'isnull'()
    if_null $P5, __label_6
    unless $P5 goto __label_6
.annotate 'line', 7099
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
.annotate 'line', 7101
    $P6 = $P3.'checkresult'()
    null $S4
    if_null $P6, __label_8
    set $S4, $P6
  __label_8:
.annotate 'line', 7102
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7103
    $P5 = $P3.'emit_get'(__ARG_1)
    null $S5
    if_null $P5, __label_12
    set $S5, $P5
  __label_12:
.annotate 'line', 7104
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 7108
    ne $S4, 'P', __label_13
.annotate 'line', 7109
    $P4 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 7110
    __ARG_1.'emitset'(__ARG_2, $P4)
    goto __label_14
  __label_13: # else
.annotate 'line', 7113
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
  __label_10: # endif
  __label_7: # endif
.annotate 'line', 7116
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 7117

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 7120
    getattribute $P1, self, 'owner'
.annotate 'line', 7121
    $P2 = $P1.'genlabel'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7122
    $P2 = $P1.'genlabel'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7123
    getattribute $P2, self, 'condition'
    $P2.'emit_else'(__ARG_1, $S2)
.annotate 'line', 7124
    getattribute $P2, self, 'etrue'
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 7125
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7126
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7127
    getattribute $P2, self, 'efalse'
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 7128
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 7129

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 7047
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7049
    addattribute $P0, 'condition'
.annotate 'line', 7050
    addattribute $P0, 'etrue'
.annotate 'line', 7051
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getOpCode_2' :subid('WSubId_86')
        .param pmc __ARG_1
.annotate 'line', 7174
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if_null $S1, __label_1
    length $I1, $S1
    ne $I1, 1, __label_1
    ord $I1, $S1
    if $I1 == 40 goto __label_3
    if $I1 == 91 goto __label_4
    if $I1 == 46 goto __label_5
    goto __label_1
  __label_3: # case
.annotate 'line', 7175
    .return(1)
  __label_4: # case
.annotate 'line', 7176
    .return(2)
  __label_5: # case
.annotate 'line', 7177
    .return(3)
  __label_1: # default
.annotate 'line', 7178
    .return(0)
  __label_2: # switch end
.annotate 'line', 7180

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_88')
        .param pmc __ARG_1
.annotate 'line', 7184
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '-' goto __label_3
    if $S1 == '!' goto __label_4
    if $S1 == '~' goto __label_5
    if $S1 == '++' goto __label_6
    if $S1 == '--' goto __label_7
    goto __label_1
  __label_3: # case
.annotate 'line', 7185
    .return(8)
  __label_4: # case
.annotate 'line', 7186
    .return(11)
  __label_5: # case
.annotate 'line', 7187
    .return(33)
  __label_6: # case
.annotate 'line', 7188
    .return(9)
  __label_7: # case
.annotate 'line', 7189
    .return(10)
  __label_1: # default
.annotate 'line', 7191
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(31)
    goto __label_9
  __label_8: # else
.annotate 'line', 7192
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(32)
    goto __label_11
  __label_10: # else
.annotate 'line', 7193
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_2: # switch end
.annotate 'line', 7195

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_91')
        .param pmc __ARG_1
.annotate 'line', 7199
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '*' goto __label_3
    if $S1 == '/' goto __label_4
    if $S1 == '%' goto __label_5
    if $S1 == '%%' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7200
    .return(19)
  __label_4: # case
.annotate 'line', 7201
    .return(20)
  __label_5: # case
.annotate 'line', 7202
    .return(21)
  __label_6: # case
.annotate 'line', 7203
    .return(22)
  __label_1: # default
.annotate 'line', 7204
    .return(0)
  __label_2: # switch end
.annotate 'line', 7206

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_94')
        .param pmc __ARG_1
.annotate 'line', 7210
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<<' goto __label_3
    if $S1 == '>>' goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 7211
    .return(28)
  __label_4: # case
.annotate 'line', 7212
    .return(29)
  __label_1: # default
.annotate 'line', 7213
    .return(0)
  __label_2: # switch end
.annotate 'line', 7215

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_96')
        .param pmc __ARG_1
.annotate 'line', 7219
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<' goto __label_3
    if $S1 == '>' goto __label_4
    if $S1 == '<=' goto __label_5
    if $S1 == '>=' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7220
    .return(14)
  __label_4: # case
.annotate 'line', 7221
    .return(16)
  __label_5: # case
.annotate 'line', 7222
    .return(15)
  __label_6: # case
.annotate 'line', 7223
    .return(17)
  __label_1: # default
.annotate 'line', 7225
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 7226
    .return(0)
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 7228

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_98')
        .param pmc __ARG_1
.annotate 'line', 7232
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '==' goto __label_3
    if $S1 == '!=' goto __label_4
    if $S1 == '===' goto __label_5
    if $S1 == '!==' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7233
    .return(12)
  __label_4: # case
.annotate 'line', 7234
    .return(13)
  __label_5: # case
.annotate 'line', 7235
    .return(25)
  __label_6: # case
.annotate 'line', 7236
    .return(26)
  __label_1: # default
.annotate 'line', 7237
    .return(0)
  __label_2: # switch end
.annotate 'line', 7239

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_107')
        .param pmc __ARG_1
.annotate 'line', 7243
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '=' goto __label_3
    if $S1 == '=:' goto __label_4
    if $S1 == '+=' goto __label_5
    if $S1 == '-=' goto __label_6
    if $S1 == '*=' goto __label_7
    if $S1 == '/=' goto __label_8
    if $S1 == '%=' goto __label_9
    goto __label_1
  __label_3: # case
.annotate 'line', 7244
    .return(4)
  __label_4: # case
.annotate 'line', 7245
    .return(5)
  __label_5: # case
.annotate 'line', 7246
    .return(6)
  __label_6: # case
.annotate 'line', 7247
    .return(18)
  __label_7: # case
.annotate 'line', 7248
    .return(23)
  __label_8: # case
.annotate 'line', 7249
    .return(24)
  __label_9: # case
.annotate 'line', 7250
    .return(30)
  __label_1: # default
.annotate 'line', 7251
    .return(0)
  __label_2: # switch end
.annotate 'line', 7253

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 7257
    $P1 = __ARG_1.'get'()
.annotate 'line', 7258
    null $P2
.annotate 'line', 7261
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7265
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7267
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 7269
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 7271
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 7273
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 7275
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 7277
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 7279
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 7281
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 7283
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 7262
    $P2 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 7263
    WSubId_68(')', __ARG_1)
.annotate 'line', 7264
    .return($P2)
  __label_4: # case
.annotate 'line', 7266
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 7268
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 7270
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 7272
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_25(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 7274
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 7276
    .tailcall WSubId_84(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 7278
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 7280
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 7282
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 7284
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 7286
    WSubId_54('expression', $P1)
  __label_1: # switch end
.annotate 'line', 7288

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7292
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 7293
    null $P2
.annotate 'line', 7294
    null $P3
.annotate 'line', 7295
    null $I1
  __label_2: # while
.annotate 'line', 7296
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_86($P2)
    set $I1, $P5
    unless $I1 goto __label_1
    if $I1 == 1 goto __label_5
    if $I1 == 2 goto __label_6
    if $I1 == 3 goto __label_7
    goto __label_3
  __label_5: # case
.annotate 'line', 7299
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7302
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7305
    set $P3, $P2
.annotate 'line', 7306
    $P2 = __ARG_1.'get'()
.annotate 'line', 7307
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 7308
    $P4 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 7309
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
    goto __label_9
  __label_8: # else
.annotate 'line', 7312
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7315
    WSubId_6('Unexpected code in parseExpr_2')
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7318
    __ARG_1.'unget'($P2)
.annotate 'line', 7319
    .return($P1)
.annotate 'line', 7320

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.annotate 'line', 7324
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 7325
    $P2 = __ARG_1.'get'()
.annotate 'line', 7327
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 7329
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7328
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 7330
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 7332
    __ARG_1.'unget'($P2)
.annotate 'line', 7333
    .return($P1)
  __label_1: # switch end
.annotate 'line', 7335

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_90 = "WSubId_90"
.annotate 'line', 7339
    $P1 = __ARG_1.'get'()
.annotate 'line', 7340
    $P3 = WSubId_88($P1)
    set $I1, $P3
.annotate 'line', 7341
    unless $I1 goto __label_1
.annotate 'line', 7342
    $P2 = WSubId_89(__ARG_1, __ARG_2)
    if $I1 == 8 goto __label_5
    if $I1 == 11 goto __label_6
    if $I1 == 33 goto __label_7
    if $I1 == 9 goto __label_8
    if $I1 == 10 goto __label_9
    if $I1 == 31 goto __label_10
    if $I1 == 32 goto __label_11
    goto __label_3
  __label_5: # case
.annotate 'line', 7345
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 7347
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 7349
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 7351
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 7353
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 7355
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 7357
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_3: # default
.annotate 'line', 7359
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_4: # switch end
    goto __label_2
  __label_1: # else
.annotate 'line', 7363
    __ARG_1.'unget'($P1)
.annotate 'line', 7364
    .tailcall WSubId_90(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 7366

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7370
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7371
    null $P2
.annotate 'line', 7372
    null $I1
  __label_2: # while
.annotate 'line', 7373
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_91($P2)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7374
    $P3 = WSubId_89(__ARG_1, __ARG_2)
    if $I1 == 19 goto __label_5
    if $I1 == 20 goto __label_6
    if $I1 == 21 goto __label_7
    if $I1 == 22 goto __label_8
    goto __label_3
  __label_5: # case
.annotate 'line', 7377
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7380
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7383
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7386
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7389
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7392
    __ARG_1.'unget'($P2)
.annotate 'line', 7393
    .return($P1)
.annotate 'line', 7394

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 7398
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7399
    null $P2
  __label_2: # while
.annotate 'line', 7400
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('+')
    if $P5 goto __label_3
    $P5 = $P2.'isop'('-')
  __label_3:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7401
    $P3 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7402
    null $P4
.annotate 'line', 7403
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7404
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 7406
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 7407
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7409
    __ARG_1.'unget'($P2)
.annotate 'line', 7410
    .return($P1)
.annotate 'line', 7411

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7415
    $P1 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7416
    null $P2
.annotate 'line', 7417
    null $P3
.annotate 'line', 7418
    null $I1
  __label_2: # while
.annotate 'line', 7419
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_94($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 28 goto __label_5
    if $I1 == 29 goto __label_6
    goto __label_3
  __label_5: # case
.annotate 'line', 7422
    $P2 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7423
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7426
    $P2 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7427
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7430
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7433
    __ARG_1.'unget'($P3)
.annotate 'line', 7434
    .return($P1)
.annotate 'line', 7435

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7439
    $P1 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7440
    null $P2
.annotate 'line', 7441
    null $P3
.annotate 'line', 7442
    null $I1
  __label_2: # while
.annotate 'line', 7443
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_96($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 14 goto __label_5
    if $I1 == 16 goto __label_6
    if $I1 == 15 goto __label_7
    if $I1 == 17 goto __label_8
    if $I1 == 27 goto __label_9
    goto __label_3
  __label_5: # case
.annotate 'line', 7446
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7447
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7450
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7451
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7454
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7455
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7458
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7459
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 7462
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7465
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7468
    __ARG_1.'unget'($P3)
.annotate 'line', 7469
    .return($P1)
.annotate 'line', 7470

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7474
    $P1 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7475
    null $P2
.annotate 'line', 7476
    null $P3
.annotate 'line', 7477
    null $I1
  __label_2: # while
.annotate 'line', 7478
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_98($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 12 goto __label_5
    if $I1 == 13 goto __label_6
    if $I1 == 25 goto __label_7
    if $I1 == 26 goto __label_8
    goto __label_3
  __label_5: # case
.annotate 'line', 7481
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7482
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7485
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7486
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7489
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7490
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7493
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7494
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7497
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7500
    __ARG_1.'unget'($P3)
.annotate 'line', 7501
    .return($P1)
.annotate 'line', 7502

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_99 = "WSubId_99"
.annotate 'line', 7506
    $P1 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7507
    null $P2
  __label_2: # while
.annotate 'line', 7508
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7509
    $P3 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7510
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7512
    __ARG_1.'unget'($P2)
.annotate 'line', 7513
    .return($P1)
.annotate 'line', 7514

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_100 = "WSubId_100"
.annotate 'line', 7518
    $P1 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7519
    null $P2
  __label_2: # while
.annotate 'line', 7520
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7521
    $P3 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7522
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7524
    __ARG_1.'unget'($P2)
.annotate 'line', 7525
    .return($P1)
.annotate 'line', 7526

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_101 = "WSubId_101"
.annotate 'line', 7530
    $P1 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7531
    null $P2
  __label_2: # while
.annotate 'line', 7532
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7533
    $P3 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7534
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7536
    __ARG_1.'unget'($P2)
.annotate 'line', 7537
    .return($P1)
.annotate 'line', 7538

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_102 = "WSubId_102"
.annotate 'line', 7542
    $P1 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7543
    null $P2
  __label_2: # while
.annotate 'line', 7544
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7545
    $P3 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7546
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7548
    __ARG_1.'unget'($P2)
.annotate 'line', 7549
    .return($P1)
.annotate 'line', 7550

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_102 = "WSubId_102"
.annotate 'line', 7554
    $P1 = WSubId_103(__ARG_1, __ARG_2)
.annotate 'line', 7555
    null $P2
  __label_2: # while
.annotate 'line', 7556
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7557
    $P3 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7558
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7560
    __ARG_1.'unget'($P2)
.annotate 'line', 7561
    .return($P1)
.annotate 'line', 7562

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 7566
    $P1 = WSubId_104(__ARG_1, __ARG_2)
.annotate 'line', 7567
    $P2 = __ARG_1.'get'()
.annotate 'line', 7568
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7569
    $P3 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7570
    WSubId_68(':', __ARG_1)
.annotate 'line', 7571
    $P4 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7572
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 7575
    __ARG_1.'unget'($P2)
.annotate 'line', 7576
    .return($P1)
  __label_2: # endif
.annotate 'line', 7578

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7582
    $P1 = WSubId_106(__ARG_1, __ARG_2)
.annotate 'line', 7583
    null $P2
.annotate 'line', 7584
    null $I1
  __label_2: # while
.annotate 'line', 7585
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_107($P2)
    set $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 7586
    $P3 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7587
    null $P4
    if $I1 == 4 goto __label_5
    if $I1 == 5 goto __label_6
    if $I1 == 6 goto __label_7
    if $I1 == 18 goto __label_8
    if $I1 == 23 goto __label_9
    if $I1 == 24 goto __label_10
    if $I1 == 30 goto __label_11
    goto __label_3
  __label_5: # case
.annotate 'line', 7590
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7593
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7596
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7599
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 7602
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_4 # break
  __label_10: # case
.annotate 'line', 7605
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_4 # break
  __label_11: # case
.annotate 'line', 7608
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7611
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_4: # switch end
.annotate 'line', 7613
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7614
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7616
    __ARG_1.'unget'($P2)
.annotate 'line', 7617
    .return($P1)
.annotate 'line', 7618

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_105 = "WSubId_105"
.annotate 'line', 7622
    .tailcall WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7623

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7638
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7639
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7640
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7641
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7642
    .return($S1)
.annotate 'line', 7643

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7646
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7647
    unless_null $P1, __label_1
.annotate 'line', 7648
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7649
    .return($P1)
.annotate 'line', 7650

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7634
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7659
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7660
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7661
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7662
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7663
    .return($S1)
.annotate 'line', 7664

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7667
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7668
    unless_null $P1, __label_1
.annotate 'line', 7669
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7670
    .return($P1)
.annotate 'line', 7671

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7653
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7655
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7687
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7688
    $P1 = __ARG_2.'get'()
.annotate 'line', 7689
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7690
    __ARG_2.'unget'($P1)
.annotate 'line', 7691
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 7693

.end # parse


.sub 'optimize' :method
.annotate 'line', 7696
    getattribute $P1, self, 'values'
.annotate 'line', 7697
    if_null $P1, __label_1
.annotate 'line', 7698
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7699
    .return(self)
.annotate 'line', 7700

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7704
    getattribute $P1, self, 'values'
.annotate 'line', 7705
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7708
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
.annotate 'line', 7709
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7710
    $P3 = $P2.'cantailcall'()
    unless $P3 goto __label_6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'allowtailcall'()
  __label_6:
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 7711
    self.'annotate'(__ARG_1)
.annotate 'line', 7712
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 7716
    le $I1, 0, __label_7
.annotate 'line', 7717
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7719
    self.'annotate'(__ARG_1)
.annotate 'line', 7720
    self.'emitret'(__ARG_1)
.annotate 'line', 7721
    le $I1, 0, __label_8
.annotate 'line', 7722
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 7723
    __ARG_1.'say'(')')
.annotate 'line', 7724

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7681
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7683
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7731
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 7732

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 7735
    __ARG_1.'print'('    ', '.return(')
.annotate 'line', 7736

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7727
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7743
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 7744

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 7747
    __ARG_1.'print'('    ', '.yield(')
.annotate 'line', 7748

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7739
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 7761
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7762
    setattribute self, 'name', __ARG_1
.annotate 'line', 7763
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
.annotate 'line', 7764

.end # LabelStatement


.sub 'optimize' :method
.annotate 'line', 7765
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7768
    self.'annotate'(__ARG_1)
.annotate 'line', 7769
    getattribute $P1, self, 'value'
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
.annotate 'line', 7770

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7755
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7757
    addattribute $P0, 'name'
.annotate 'line', 7758
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7784
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7785
    box $P1, __ARG_2
    setattribute self, 'label', $P1
.annotate 'line', 7786

.end # Reflabel


.sub 'optimize' :method
.annotate 'line', 7787
    .return(self)

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 7790
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7791
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7792
    .return($S2)
.annotate 'line', 7793

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7779
    addattribute $P0, 'owner'
.annotate 'line', 7780
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 7806
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7807
    $P1 = __ARG_2.'get'()
.annotate 'line', 7808
    WSubId_108($P1)
.annotate 'line', 7809
    setattribute self, 'label', $P1
.annotate 'line', 7810
    WSubId_68(';', __ARG_2)
.annotate 'line', 7811

.end # GotoStatement


.sub 'optimize' :method
.annotate 'line', 7812
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7815
    self.'annotate'(__ARG_1)
.annotate 'line', 7816
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7817
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7818
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
.annotate 'line', 7819

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7800
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7802
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 7830
    $P1 = WSubId_51(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7831

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 7834
    WSubId_68('(', __ARG_1)
.annotate 'line', 7835
    $P1 = WSubId_51(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7836
    WSubId_68(')', __ARG_1)
.annotate 'line', 7837

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7826
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Condition' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'IfStatement' ]

.sub 'IfStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_109 = "WSubId_109"
.annotate 'line', 7850
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7851
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7852
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7853
    $P1 = __ARG_2.'get'()
.annotate 'line', 7854
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7855
    $P4 = WSubId_109(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7857
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7858
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7860

.end # IfStatement


.sub 'optimize' :method
.annotate 'line', 7863
    self.'optimize_condition'()
.annotate 'line', 7864
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7865
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 7866
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 7868
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7870
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_1: # default
  __label_2: # switch end
.annotate 'line', 7872
    .return(self)
.annotate 'line', 7873

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7876
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7877
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7878
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7879
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7880
    set $S1, ''
.annotate 'line', 7881
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7882
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7883
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7884
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7885
    self.'annotate'(__ARG_1)
.annotate 'line', 7886
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7887
    $P1.'emit'(__ARG_1)
.annotate 'line', 7889
    not $I3, $I2
    unless $I3 goto __label_5
.annotate 'line', 7890
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7891
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7892
    $P2.'emit'(__ARG_1)
  __label_5: # endif
.annotate 'line', 7894
    __ARG_1.'emitlabel'($S2, 'endif')
.annotate 'line', 7895

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7844
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7846
    addattribute $P0, 'truebranch'
.annotate 'line', 7847
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
.annotate 'line', 7907
    $P2 = WSubId_109(__ARG_1, self)
    setattribute self, 'body', $P2
.annotate 'line', 7908

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
.annotate 'line', 7911
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7912
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7914
    self.'annotate'(__ARG_1)
.annotate 'line', 7915
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7916
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7917
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7918
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
.annotate 'line', 7919

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7902
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7904
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7930
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7931
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7932
    self.'parsebody'(__ARG_2)
.annotate 'line', 7933

.end # WhileStatement


.sub 'optimize' :method
.annotate 'line', 7936
    self.'optimize_condition'()
.annotate 'line', 7937
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7938
    .return(self)
.annotate 'line', 7939

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7942
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 7944
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 7947
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 7948
    __ARG_1.'comment'('while(false) optimized out')
  __label_5: # endif
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 7951
    $P3 = self.'genbreaklabel'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7952
    $P4 = self.'gencontinuelabel'()
    null $S2
    if_null $P4, __label_7
    set $S2, $P4
  __label_7:
.annotate 'line', 7954
    self.'annotate'(__ARG_1)
.annotate 'line', 7955
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7956
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7957
    getattribute $P5, self, 'body'
    $P5.'emit'(__ARG_1)
.annotate 'line', 7958
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7959
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_2: # switch end
.annotate 'line', 7961

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7926
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'DoStatement' ]

.sub 'DoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_110 = "WSubId_110"
.annotate 'line', 7972
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7973
    self.'parsebody'(__ARG_2)
.annotate 'line', 7974
    WSubId_110('while', __ARG_2)
.annotate 'line', 7975
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7976

.end # DoStatement


.sub 'optimize' :method
.annotate 'line', 7979
    self.'optimize_condition'()
.annotate 'line', 7980
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7981
    $P2 = $P1.'isempty'()
    unless $P2 goto __label_2
    $P3 = self.'getvalue'()
    set $I2, $P3
    iseq $I1, $I2, 2
    box $P2, $I1
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7982
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 7983
    setattribute self, 'body', $P1
.annotate 'line', 7984
    .return(self)
.annotate 'line', 7985

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7988
    getattribute $P1, self, 'body'
.annotate 'line', 7989
    $P2 = self.'getvalue'()
    set $I1, $P2
    if $I1 == 1 goto __label_3
    goto __label_1
  __label_3: # case
.annotate 'line', 7992
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 7995
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7996
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7997
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7999
    self.'annotate'(__ARG_1)
.annotate 'line', 8000
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 8002
    $P1.'emit'(__ARG_1)
.annotate 'line', 8003
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 8004
    eq $I1, 2, __label_7
.annotate 'line', 8005
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 8006
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_2: # switch end
.annotate 'line', 8008

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7968
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]

.sub 'ContinueStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8019
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8020
    WSubId_68(';', __ARG_2)
.annotate 'line', 8021

.end # ContinueStatement


.sub 'optimize' :method
.annotate 'line', 8022
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8025
    self.'annotate'(__ARG_1)
.annotate 'line', 8026
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8027
    __ARG_1.'emitgoto'($S1, 'continue')
.annotate 'line', 8028

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 8015
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8039
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8040
    WSubId_68(';', __ARG_2)
.annotate 'line', 8041

.end # BreakStatement


.sub 'optimize' :method
.annotate 'line', 8042
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8045
    self.'annotate'(__ARG_1)
.annotate 'line', 8046
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8047
    __ARG_1.'emitgoto'($S1, 'break')
.annotate 'line', 8048

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 8035
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8063
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8064
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 8065
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 8066
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
.annotate 'line', 8067

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_109 = "WSubId_109"
.annotate 'line', 8070
    null $P1
  __label_2: # while
.annotate 'line', 8071
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'iskeyword'('case')
    if $P3 goto __label_3
    $P3 = $P1.'iskeyword'('default')
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 8072
    $P4 = $P1.'iskeyword'('case')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8073
    getattribute $P5, self, 'case_value'
    $P6 = WSubId_51(__ARG_1, self)
    push $P5, $P6
.annotate 'line', 8074
    $P1 = __ARG_1.'get'()
.annotate 'line', 8075
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 8076
    WSubId_54("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 8077
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 8078
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'('}')
    if $P3 goto __label_10
    $P3 = $P1.'iskeyword'('case')
  __label_10:
    if $P3 goto __label_9
    $P3 = $P1.'iskeyword'('default')
  __label_9:
    isfalse $I1, $P3
    unless $I1 goto __label_7
.annotate 'line', 8079
    __ARG_1.'unget'($P1)
.annotate 'line', 8080
    $P3 = WSubId_109(__ARG_1, self)
    push $P2, $P3
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 8082
    getattribute $P3, self, 'case_st'
    push $P3, $P2
.annotate 'line', 8083
    __ARG_1.'unget'($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8086
    $P1 = __ARG_1.'get'()
.annotate 'line', 8087
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 8088
    WSubId_54("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 8089
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'('}')
    if $P3 goto __label_15
    $P3 = $P1.'iskeyword'('case')
  __label_15:
    if $P3 goto __label_14
    $P3 = $P1.'iskeyword'('default')
  __label_14:
    isfalse $I1, $P3
    unless $I1 goto __label_12
.annotate 'line', 8090
    __ARG_1.'unget'($P1)
.annotate 'line', 8091
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_109(__ARG_1, self)
    push $P3, $P4
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 8093
    __ARG_1.'unget'($P1)
  __label_5: # endif
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8096
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 8097
    WSubId_54("'}' in switch", $P1)
  __label_16: # endif
.annotate 'line', 8098

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_111 = "WSubId_111"
.annotate 'line', 8101
    getattribute $P1, self, 'case_value'
    WSubId_52($P1)
.annotate 'line', 8102
    getattribute $P1, self, 'case_st'
    WSubId_111($P1, WSubId_52)
.annotate 'line', 8103
    getattribute $P1, self, 'default_st'
    WSubId_52($P1)
.annotate 'line', 8104

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 8055
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 8057
    addattribute $P0, 'case_value'
.annotate 'line', 8058
    addattribute $P0, 'case_st'
.annotate 'line', 8059
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 8117
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8118
    $P3 = WSubId_51(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 8119
    $P1 = __ARG_2.'get'()
.annotate 'line', 8120
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8121
    WSubId_54("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 8122
    $P1 = __ARG_2.'get'()
.annotate 'line', 8123
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 8124
    WSubId_54("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 8125
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8126

.end # SwitchStatement


.sub 'optimize' :method
.annotate 'line', 8129
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 8130
    self.'optimize_cases'()
.annotate 'line', 8131
    .return(self)
.annotate 'line', 8132

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 8138
    set $S1, ''
.annotate 'line', 8139
    getattribute $P9, self, 'case_value'
    if_null $P9, __label_2
    iter $P10, $P9
    set $P10, 0
  __label_1: # for iteration
    unless $P10 goto __label_2
    shift $P1, $P10
.annotate 'line', 8140
    $P11 = $P1.'checkresult'()
    null $S2
    if_null $P11, __label_3
    set $S2, $P11
  __label_3:
.annotate 'line', 8141
    ne $S2, 'N', __label_4
.annotate 'line', 8142
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 8143
    ne $S2, 'S', __label_5
.annotate 'line', 8144
    iseq $I4, $S1, ''
    if $I4 goto __label_7
    iseq $I4, $S1, 'char'
  __label_7:
    unless $I4 goto __label_6
.annotate 'line', 8146
    $P9 = $P1.'isstringliteral'()
    unless $P9 goto __label_10
    $P11 = WSubId_28($P1)
    set $S11, $P11
    length $I6, $S11
    iseq $I5, $I6, 1
    box $P9, $I5
  __label_10:
    if_null $P9, __label_8
    unless $P9 goto __label_8
.annotate 'line', 8147
    set $S2, 'char'
    goto __label_9
  __label_8: # else
.annotate 'line', 8149
    set $S1, 'S'
  __label_9: # endif
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 8152
    ne $S1, '', __label_11
.annotate 'line', 8153
    set $S1, $S2
    goto __label_12
  __label_11: # else
.annotate 'line', 8154
    eq $S1, $S2, __label_13
.annotate 'line', 8155
    set $S1, 'P'
  __label_13: # endif
  __label_12: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8158
    getattribute $P2, self, 'condition'
.annotate 'line', 8159
    $P3 = $P2.'checkresult'()
.annotate 'line', 8163
    ne $S1, '', __label_14
.annotate 'line', 8164
    set $S1, $P3
  __label_14: # endif
.annotate 'line', 8166
    $P9 = __ARG_1.'getDebug'()
    if_null $P9, __label_15
    unless $P9 goto __label_15
.annotate 'line', 8167
    __ARG_1.'comment'('switch')
  __label_15: # endif
.annotate 'line', 8168
    $P9 = self.'genlabel'()
    null $S3
    if_null $P9, __label_16
    set $S3, $P9
  __label_16:
.annotate 'line', 8169
    null $S4
.annotate 'line', 8170
    ne $S1, 'char', __label_17
.annotate 'line', 8171
    isa $I4, $P2, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    unless $I4 goto __label_21
.annotate 'line', 8172
    getattribute $P11, $P2, 'builtin'
    $P9 = $P11.'name'()
    set $S11, $P9
    iseq $I4, $S11, "chr"
  __label_21:
    unless $I4 goto __label_19
.annotate 'line', 8173
    getattribute $P4, $P2, 'args'
.annotate 'line', 8174
    $P9 = $P4[0]
    getattribute $P5, $P9, 'arg'
.annotate 'line', 8175
    $P9 = $P5.'emit_getint'(__ARG_1)
    set $S4, $P9
    goto __label_20
  __label_19: # else
.annotate 'line', 8178
    null $S5
.annotate 'line', 8179
    set $S11, $P3
    eq $S11, 'S', __label_22
.annotate 'line', 8180
    $P9 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P9, __label_24
    set $S6, $P9
  __label_24:
.annotate 'line', 8181
    $P9 = self.'tempreg'('S')
    set $S5, $P9
.annotate 'line', 8182
    __ARG_1.'emitset'($S5, $S6)
    goto __label_23
  __label_22: # else
.annotate 'line', 8185
    $P9 = $P2.'emit_get'(__ARG_1)
    set $S5, $P9
  __label_23: # endif
.annotate 'line', 8186
    __ARG_1.'emitif_null'($S5, $S3)
.annotate 'line', 8187
    $P9 = self.'tempreg'('I')
    set $S4, $P9
.annotate 'line', 8188
    __ARG_1.'emitarg2'('length', $S4, $S5)
.annotate 'line', 8189
    __ARG_1.'emitarg3'('ne', $S4, "1", $S3)
.annotate 'line', 8190
    __ARG_1.'emitarg2'('ord', $S4, $S5)
  __label_20: # endif
    goto __label_18
  __label_17: # else
.annotate 'line', 8193
    set $S11, $P3
    ne $S11, $S1, __label_25
.annotate 'line', 8194
    $P9 = $P2.'emit_get'(__ARG_1)
    set $S4, $P9
    goto __label_26
  __label_25: # else
.annotate 'line', 8196
    $P11 = self.'tempreg'($S1)
    set $S4, $P11
.annotate 'line', 8197
    $P9 = $P2.'emit_get'(__ARG_1)
    null $S7
    if_null $P9, __label_27
    set $S7, $P9
  __label_27:
.annotate 'line', 8198
    __ARG_1.'emitset'($S4, $S7)
  __label_26: # endif
  __label_18: # endif
.annotate 'line', 8202
    self.'genbreaklabel'()
.annotate 'line', 8203
    new $P6, ['ResizableStringArray']
.annotate 'line', 8204
    null $S8
.annotate 'line', 8205
    eq $S1, 'char', __label_28
.annotate 'line', 8206
    self.'tempreg'($S1)
  __label_28: # endif
.annotate 'line', 8207
    getattribute $P9, self, 'case_value'
    if_null $P9, __label_30
    iter $P12, $P9
    set $P12, 0
  __label_29: # for iteration
    unless $P12 goto __label_30
    shift $P7, $P12
.annotate 'line', 8208
    $P11 = self.'genlabel'()
    null $S9
    if_null $P11, __label_31
    set $S9, $P11
  __label_31:
.annotate 'line', 8209
    push $P6, $S9
.annotate 'line', 8210
    null $S10
.annotate 'line', 8211
    ne $S1, 'I', __label_32
.annotate 'line', 8212
    $P9 = $P7.'emit_getint'(__ARG_1)
    set $S10, $P9
    goto __label_33
  __label_32: # else
.annotate 'line', 8213
    ne $S1, 'char', __label_34
.annotate 'line', 8214
    $P11 = WSubId_28($P7)
    set $S11, $P11
    ord $I1, $S11
.annotate 'line', 8215
    set $S10, $I1
    goto __label_35
  __label_34: # else
.annotate 'line', 8217
    $P9 = $P7.'checkresult'()
    set $S11, $P9
    ne $S1, $S11, __label_36
.annotate 'line', 8218
    $P11 = $P7.'emit_get'(__ARG_1)
    set $S10, $P11
    goto __label_37
  __label_36: # else
.annotate 'line', 8220
    $P7.'emit'(__ARG_1, $S8)
.annotate 'line', 8221
    set $S10, $S8
  __label_37: # endif
  __label_35: # endif
  __label_33: # endif
.annotate 'line', 8223
    $P9 = WSubId_26("    if %0 == %1 goto %2", $S4, $S10, $S9)
    __ARG_1.'say'($P9)
    goto __label_29
  __label_30: # endfor
.annotate 'line', 8225
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8228
    self.'annotate'(__ARG_1)
.annotate 'line', 8229
    getattribute $P8, self, 'case_st'
.annotate 'line', 8230
    set $I2, $P8
.annotate 'line', 8231
    null $I3
  __label_40: # for condition
    ge $I3, $I2, __label_39
.annotate 'line', 8232
    $P9 = $P6[$I3]
    __ARG_1.'emitlabel'($P9, 'case')
.annotate 'line', 8233
    $P9 = $P8[$I3]
    WSubId_66(__ARG_1, $P9)
  __label_38: # for iteration
.annotate 'line', 8231
    inc $I3
    goto __label_40
  __label_39: # for end
.annotate 'line', 8236
    __ARG_1.'emitlabel'($S3, 'default')
.annotate 'line', 8237
    getattribute $P9, self, 'default_st'
    WSubId_66(__ARG_1, $P9)
.annotate 'line', 8239
    getattribute $P11, self, 'start'
    $P9 = self.'getbreaklabel'($P11)
    __ARG_1.'emitlabel'($P9, 'switch end')
.annotate 'line', 8240

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 8111
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8113
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8252
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8253
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8254

.end # SwitchCaseStatement


.sub 'optimize' :method
.annotate 'line', 8257
    self.'optimize_cases'()
.annotate 'line', 8258
    .return(self)
.annotate 'line', 8259

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 8263
    self.'genbreaklabel'()
.annotate 'line', 8264
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8265
    new $P1, ['ResizableStringArray']
.annotate 'line', 8267
    $P4 = __ARG_1.'getDebug'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 8268
    __ARG_1.'comment'('switch-case')
  __label_2: # endif
.annotate 'line', 8269
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8270
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_5
    iter $P5, $P4
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P2, $P5
.annotate 'line', 8271
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_6
    set $S3, $P6
  __label_6:
.annotate 'line', 8272
    push $P1, $S3
.annotate 'line', 8273
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 8274
    __ARG_1.'emitif'($S2, $S3)
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8276
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 8279
    self.'annotate'(__ARG_1)
.annotate 'line', 8280
    getattribute $P3, self, 'case_st'
.annotate 'line', 8281
    set $I1, $P3
.annotate 'line', 8282
    null $I2
  __label_9: # for condition
    ge $I2, $I1, __label_8
.annotate 'line', 8283
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 8284
    $P4 = $P3[$I2]
    WSubId_66(__ARG_1, $P4)
  __label_7: # for iteration
.annotate 'line', 8282
    inc $I2
    goto __label_9
  __label_8: # for end
.annotate 'line', 8287
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 8288
    getattribute $P4, self, 'default_st'
    WSubId_66(__ARG_1, $P4)
.annotate 'line', 8290
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
.annotate 'line', 8291

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 8247
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 8298
    $P1 = __ARG_2.'get'()
.annotate 'line', 8299
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8300
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8301
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8302
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8303
    WSubId_54("'(' in switch", $P1)
.annotate 'line', 8304

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 8317
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8318
    $P1 = __ARG_2.'get'()
.annotate 'line', 8319
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8320
    __ARG_2.'unget'($P1)
.annotate 'line', 8321
    $P4 = WSubId_109(__ARG_2, self)
    setattribute self, 'initializer', $P4
  __label_1: # endif
.annotate 'line', 8323
    $P1 = __ARG_2.'get'()
.annotate 'line', 8324
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 8325
    __ARG_2.'unget'($P1)
.annotate 'line', 8326
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 8327
    WSubId_68(';', __ARG_2)
  __label_2: # endif
.annotate 'line', 8329
    $P1 = __ARG_2.'get'()
.annotate 'line', 8330
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 8331
    __ARG_2.'unget'($P1)
.annotate 'line', 8332
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_4: # do
.annotate 'line', 8334
    $P3 = WSubId_51(__ARG_2, self)
    push $P2, $P3
  __label_6: # continue
.annotate 'line', 8335
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_5
    if $P3 goto __label_4
  __label_5: # enddo
.annotate 'line', 8336
    setattribute self, 'iteration', $P2
.annotate 'line', 8337
    WSubId_4(')', $P1)
  __label_3: # endif
.annotate 'line', 8339
    self.'parsebody'(__ARG_2)
.annotate 'line', 8340

.end # ForStatement


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 8343
    getattribute $P1, self, 'initializer'
.annotate 'line', 8344
    if_null $P1, __label_1
.annotate 'line', 8345
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 8346
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
.annotate 'line', 8347
    self.'optimize_condition'()
.annotate 'line', 8348
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
.annotate 'line', 8349
    if_null $P1, __label_4
.annotate 'line', 8350
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8352
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 8355
    getattribute $P2, self, 'iteration'
    WSubId_52($P2)
.annotate 'line', 8356
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8357
    .return(self)
.annotate 'line', 8358

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8361
    getattribute $P1, self, 'iteration'
.annotate 'line', 8362
    isnull $I1, $P1
    not $I1
.annotate 'line', 8363
    getattribute $P3, self, 'initializer'
    isnull $I2, $P3
    unless $I2 goto __label_3
.annotate 'line', 8364
    getattribute $P4, self, 'condexpr'
    isnull $I2, $P4
  __label_3:
    unless $I2 goto __label_2
.annotate 'line', 8365
    not $I2, $I1
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 8366
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 8367
    .return()
  __label_1: # endif
.annotate 'line', 8369
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 8370
    __ARG_1.'comment'('for loop')
  __label_4: # endif
.annotate 'line', 8371
    $P3 = self.'gencontinuelabel'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 8372
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 8373
    unless $I1 goto __label_8
.annotate 'line', 8374
    $P3 = self.'genlabel'()
    set $S3, $P3
    goto __label_7
  __label_8:
.annotate 'line', 8375
    set $S3, $S1
  __label_7:
.annotate 'line', 8376
    getattribute $P3, self, 'initializer'
    if_null $P3, __label_9
.annotate 'line', 8377
    getattribute $P4, self, 'initializer'
    $P4.'emit'(__ARG_1)
  __label_9: # endif
.annotate 'line', 8379
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 8380
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_10
.annotate 'line', 8381
    self.'emit_else'(__ARG_1, $S2)
  __label_10: # endif
.annotate 'line', 8383
    getattribute $P3, self, 'body'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8384
    unless $I1 goto __label_11
.annotate 'line', 8385
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 8386
    if_null $P1, __label_13
    iter $P5, $P1
    set $P5, 0
  __label_12: # for iteration
    unless $P5 goto __label_13
    shift $P2, $P5
.annotate 'line', 8387
    $P2.'emit_void'(__ARG_1)
    goto __label_12
  __label_13: # endfor
  __label_11: # endif
.annotate 'line', 8389
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8391
    __ARG_1.'emitlabel'($S2, 'for end')
.annotate 'line', 8392

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8310
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 8312
    addattribute $P0, 'initializer'
.annotate 'line', 8313
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8407
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8408
    null $S1
    if_null __ARG_4, __label_1
    set $S1, __ARG_4
  __label_1:
.annotate 'line', 8409
    eq __ARG_5, '', __label_2
.annotate 'line', 8410
    $P1 = WSubId_112(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 8411
    self.'createvar'($S1, $S2)
.annotate 'line', 8412
    box $P1, $S2
    setattribute self, 'deftype', $P1
  __label_2: # endif
.annotate 'line', 8414
    setattribute self, 'varname', __ARG_4
.annotate 'line', 8415
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 8416
    WSubId_68(')', __ARG_2)
.annotate 'line', 8417
    self.'parsebody'(__ARG_2)
.annotate 'line', 8418

.end # ForeachStatement


.sub 'optimize' :method
.annotate 'line', 8421
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 8425
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
.annotate 'line', 8426
    $P2 = $P1.'isstringliteral'()
    unless $P2 goto __label_3
.annotate 'line', 8427
    $P3 = $P1.'get_value'()
    set $S1, $P3
    length $I2, $S1
    iseq $I1, $I2, 0
    box $P2, $I1
  __label_3:
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8428
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8430
    setattribute self, 'container', $P1
.annotate 'line', 8431
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8432
    .return(self)
.annotate 'line', 8433

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_75 = "WSubId_75"
.annotate 'line', 8436
    self.'annotate'(__ARG_1)
.annotate 'line', 8437
    null $S1
.annotate 'line', 8438
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
.annotate 'line', 8439
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8440
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 8441
    __ARG_1.'emitbox'($S1, $S2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8444
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 8446
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 8447
    unless_null $P1, __label_4
.annotate 'line', 8448
    getattribute $P2, self, 'varname'
    WSubId_75($P2, self)
  __label_4: # endif
.annotate 'line', 8450
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 8451
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 8452
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 8453
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 8454
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 8455
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 8456
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 8457
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 8458
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 8459
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 8460
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8461
    __ARG_1.'emitlabel'($S5, 'endfor')
.annotate 'line', 8462

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8399
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8401
    addattribute $P0, 'deftype'
.annotate 'line', 8402
    addattribute $P0, 'varname'
.annotate 'line', 8403
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8469
    WSubId_68('(', __ARG_2)
.annotate 'line', 8470
    $P1 = __ARG_2.'get'()
.annotate 'line', 8471
    $P2 = __ARG_2.'get'()
.annotate 'line', 8472
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 8473
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 8475
    $P3 = __ARG_2.'get'()
.annotate 'line', 8476
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8477
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 8478
    __ARG_2.'unget'($P3)
.annotate 'line', 8479
    __ARG_2.'unget'($P2)
.annotate 'line', 8480
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8482
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 8483

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 8495
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8496
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'excep', $P2
.annotate 'line', 8497

.end # ThrowStatement


.sub 'optimize' :method
.annotate 'line', 8500
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 8501
    .return(self)
.annotate 'line', 8502

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8505
    getattribute $P1, self, 'excep'
.annotate 'line', 8506
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8507
    self.'annotate'(__ARG_1)
.annotate 'line', 8508
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    if_null $S3, __label_2
    length $I1, $S3
    ne $I1, 1, __label_2
    ord $I1, $S3
    if $I1 == 80 goto __label_4
    if $I1 == 83 goto __label_5
    goto __label_2
  __label_4: # case
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 8514
    set $S2, $S1
.annotate 'line', 8515
    $P3 = self.'tempreg'('P')
    set $S1, $P3
.annotate 'line', 8516
    $P4 = WSubId_26("    root_new %0, ['parrot';'Exception']\n    %0['message'] = %1\n", $S1, $S2)
    __ARG_1.'print'($P4)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 8524
    WSubId_1("Invalid throw argument", self)
  __label_3: # switch end
.annotate 'line', 8526
    __ARG_1.'emitarg1'('throw', $S1)
.annotate 'line', 8527

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 8489
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8491
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8539
    setattribute self, 'start', __ARG_1
.annotate 'line', 8540
    self.'ModifierList'(__ARG_2, __ARG_3)
.annotate 'line', 8541

.end # TryModifierList


.sub 'allowtailcall' :method
.annotate 'line', 8544
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 8545

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8548
    $P1 = self.'getlist'()
.annotate 'line', 8549
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
.annotate 'line', 8550
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 8551
    $P7 = $P2.'numargs'()
    set $I1, $P7
    if $S1 == 'min_severity' goto __label_6
    if $S1 == 'max_severity' goto __label_7
    if $S1 == 'handle_types' goto __label_8
    if $S1 == 'handle_types_except' goto __label_9
    if $S1 == 'allowtailcall' goto __label_10
    goto __label_4
  __label_6: # case
  __label_7: # case
.annotate 'line', 8555
    eq $I1, 1, __label_11
.annotate 'line', 8556
    WSubId_1('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 8557
    $P3 = $P2.'getarg'(0)
.annotate 'line', 8559
    $P8 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 8558
    $P7 = WSubId_26("    %0.'%1'(%2)", __ARG_2, $S1, $P8)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 8563
    new $P4, ['ResizableStringArray']
.annotate 'line', 8564
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
.annotate 'line', 8565
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 8566
    $P7 = $P5.'emit_get'(__ARG_1)
    push $P4, $P7
  __label_12: # for iteration
.annotate 'line', 8564
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 8569
    join $S2, ', ', $P4
.annotate 'line', 8568
    $P7 = WSubId_26("    %0.'%1'(%2)", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_10: # case
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 8574
    concat $S3, "Modifier '", $S1
    concat $S3, $S3, "' not valid for try"
    WSubId_1($S3, self)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8577

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 8534
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 8536
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 8589
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8590
    $P1 = __ARG_2.'get'()
.annotate 'line', 8591
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8592
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8594
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8596
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 8597
    $P1 = __ARG_2.'get'()
.annotate 'line', 8598
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 8599
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 8600
    $P1 = __ARG_2.'get'()
.annotate 'line', 8601
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8602
    WSubId_54("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 8603
    $P1 = __ARG_2.'get'()
.annotate 'line', 8604
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 8605
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8606
    setattribute self, 'exname', $P1
.annotate 'line', 8607
    self.'createvar'($S1, 'P')
.annotate 'line', 8608
    $P1 = __ARG_2.'get'()
.annotate 'line', 8609
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 8610
    WSubId_54("')' in 'catch'", $P1)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 8612
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'scatch', $P3
.annotate 'line', 8613

.end # TryStatement


.sub 'allowtailcall' :method
.annotate 'line', 8616
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8617
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8619
    .return(0)
  __label_2: # endif
.annotate 'line', 8620

.end # allowtailcall


.sub 'optimize' :method
.annotate 'line', 8623
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8624
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 8625
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 8626
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 8627
    .return(self)
.annotate 'line', 8628

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8631
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8632
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8633
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 8634
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 8635
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 8636
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 8638
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 8639
    self.'annotate'(__ARG_1)
.annotate 'line', 8640
    unless $I1 goto __label_7
.annotate 'line', 8641
    __ARG_1.'comment'('try: create handler')
  __label_7: # endif
.annotate 'line', 8642
    $P1 = WSubId_26("    new %0, 'ExceptionHandler'\n    set_label %0, %1\n", $S1, $S2)
    __ARG_1.'print'($P1)
.annotate 'line', 8649
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_8
.annotate 'line', 8650
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_8: # endif
.annotate 'line', 8652
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 8653
    unless $I1 goto __label_9
.annotate 'line', 8654
    __ARG_1.'comment'('try: begin')
  __label_9: # endif
.annotate 'line', 8655
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8656
    unless $I1 goto __label_10
.annotate 'line', 8657
    __ARG_1.'comment'('try: end')
  __label_10: # endif
.annotate 'line', 8658
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8660
    self.'annotate'(__ARG_1)
.annotate 'line', 8661
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8663
    unless $I1 goto __label_11
.annotate 'line', 8664
    __ARG_1.'comment'('catch')
  __label_11: # endif
.annotate 'line', 8665
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 8666
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 8667
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 8668
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8669
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8671
    unless $I1 goto __label_12
.annotate 'line', 8672
    __ARG_1.'comment'('catch end')
  __label_12: # endif
.annotate 'line', 8673
    __ARG_1.'emitlabel'($S3)
.annotate 'line', 8674

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 8580
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8582
    addattribute $P0, 'stry'
.annotate 'line', 8583
    addattribute $P0, 'modifiers'
.annotate 'line', 8584
    addattribute $P0, 'exname'
.annotate 'line', 8585
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.annotate 'line', 8687
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8688
    setattribute self, 'name', __ARG_3
.annotate 'line', 8689
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 8690
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 8691

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 8681
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8683
    addattribute $P0, 'name'
.annotate 'line', 8684
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
.annotate 'line', 8706
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8707
    setattribute self, 'name', __ARG_3
.annotate 'line', 8708
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 8709
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 8710
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 8711

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 8698
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8700
    addattribute $P0, 'name'
.annotate 'line', 8701
    addattribute $P0, 'basetype'
.annotate 'line', 8702
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 8722
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 8723
    $P1 = __ARG_5.'get'()
.annotate 'line', 8724
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8726
    $P4 = WSubId_51(__ARG_5, self)
    setattribute self, 'init', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8729
    __ARG_5.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8730

.end # DeclareSingleStatement


.sub 'optimize' :method
.annotate 'line', 8733
    getattribute $P1, self, 'init'
.annotate 'line', 8734
    if_null $P1, __label_1
.annotate 'line', 8735
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8736
    .return(self)
.annotate 'line', 8737

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8740
    self.'annotate'(__ARG_1)
.annotate 'line', 8741
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8742
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8743
    null $S3
.annotate 'line', 8744
    getattribute $P2, self, 'basetype'
    null $S4
    if_null $P2, __label_3
    set $S4, $P2
  __label_3:
.annotate 'line', 8745
    getattribute $P1, self, 'init'
.annotate 'line', 8746
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8747
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
  __label_4: # endif
.annotate 'line', 8749
    isnull $I1, $P1
    box $P2, $I1
    if $P2 goto __label_7
    $P2 = $P1.'isnull'()
  __label_7:
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 8750
    __ARG_1.'emitnull'($S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 8752
    $P3 = $P1.'checkresult'()
    null $S5
    if_null $P3, __label_8
    set $S5, $P3
  __label_8:
.annotate 'line', 8753
    ne $S5, $S4, __label_9
.annotate 'line', 8754
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
.annotate 'line', 8756
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 8758
    $P1.'emit'(__ARG_1, $S2)
    goto __label_12
  __label_11: # else
.annotate 'line', 8760
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_13
    unless $P2 goto __label_13
    if_null $S4, __label_15
    length $I1, $S4
    ne $I1, 1, __label_15
    ord $I1, $S4
    if $I1 == 73 goto __label_17
    if $I1 == 78 goto __label_18
    if $I1 == 83 goto __label_19
    goto __label_15
  __label_17: # case
.annotate 'line', 8763
    $P3 = WSubId_29($P1)
    set $S3, $P3
.annotate 'line', 8764
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_18: # case
.annotate 'line', 8767
    $P4 = WSubId_113($P1)
    set $S3, $P4
.annotate 'line', 8768
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_19: # case
.annotate 'line', 8771
    $P5 = WSubId_28($P1)
    set $S3, $P5
.annotate 'line', 8772
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_15: # default
.annotate 'line', 8775
    WSubId_6("Wrong type", self)
  __label_16: # switch end
    goto __label_14
  __label_13: # else
    if_null $S5, __label_20
    length $I1, $S5
    ne $I1, 1, __label_20
    ord $I1, $S5
    if $I1 == 118 goto __label_22
    goto __label_20
  __label_22: # case
.annotate 'line', 8781
    WSubId_1('Invalid initialization from void value', self)
  __label_20: # default
.annotate 'line', 8783
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S3, $P2
  __label_21: # switch end
.annotate 'line', 8785
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_25
    iseq $I1, $S5, 'P'
  __label_25:
    unless $I1 goto __label_23
.annotate 'line', 8786
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_26
    set $S6, $P2
  __label_26:
.annotate 'line', 8787
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8788
    __ARG_1.'emitif_null'($S3, $S6)
.annotate 'line', 8789
    __ARG_1.'emitset'($S2, $S3)
.annotate 'line', 8790
    __ARG_1.'emitlabel'($S6)
    goto __label_24
  __label_23: # else
.annotate 'line', 8793
    __ARG_1.'emitset'($S2, $S3)
  __label_24: # endif
  __label_14: # endif
  __label_12: # endif
  __label_10: # endif
  __label_6: # endif
.annotate 'line', 8797

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8716
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8718
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]

.sub 'DeclareArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param pmc __ARG_6
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_50 = "WSubId_50"
.annotate 'line', 8812
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 8813
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 8814
    $P1 = __ARG_6.'get'()
.annotate 'line', 8815
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8817
    __ARG_6.'unget'($P1)
.annotate 'line', 8818
    $P3 = WSubId_51(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 8819
    WSubId_68(']', __ARG_6)
  __label_1: # endif
.annotate 'line', 8821
    $P1 = __ARG_6.'get'()
.annotate 'line', 8822
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8823
    $P1 = __ARG_6.'get'()
.annotate 'line', 8824
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8825
    WSubId_54("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 8826
    $P1 = __ARG_6.'get'()
.annotate 'line', 8827
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 8828
    __ARG_6.'unget'($P1)
.annotate 'line', 8829
    $P3 = WSubId_50(__ARG_6, self, WSubId_51, ']')
    setattribute self, 'initarray', $P3
  __label_5: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 8833
    __ARG_6.'unget'($P1)
  __label_3: # endif
.annotate 'line', 8834

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 8837
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8838
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8839
    getattribute $P1, self, 'initarray'
    WSubId_52($P1)
.annotate 'line', 8840
    .return(self)
.annotate 'line', 8841

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8844
    self.'annotate'(__ARG_1)
.annotate 'line', 8846
    getattribute $P1, self, 'reg'
.annotate 'line', 8847
    getattribute $P2, self, 'size'
.annotate 'line', 8848
    getattribute $P3, self, 'initarray'
.annotate 'line', 8849
    getattribute $P4, self, 'basetype'
.annotate 'line', 8850
    getattribute $P5, self, 'arraytype'
.annotate 'line', 8851
    if_null $P2, __label_1
.annotate 'line', 8854
    $P8 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 8853
    $P7 = WSubId_26("    new %0, ['Fixed%1Array'], %2", $P1, $P5, $P8)
    __ARG_1.'say'($P7)
    goto __label_2
  __label_1: # else
.annotate 'line', 8858
    $P7 = WSubId_26("    new %0, ['Resizable%1Array']", $P1, $P5)
    __ARG_1.'say'($P7)
  __label_2: # endif
.annotate 'line', 8861
    if_null $P3, __label_3
.annotate 'line', 8862
    $P7 = self.'tempreg'($P4)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 8863
    elements $I1, $P3
.annotate 'line', 8864
    unless_null $P2, __label_5
.annotate 'line', 8865
    unless $I1 goto __label_6
.annotate 'line', 8867
    __ARG_1.'emitset'($P1, $I1)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 8870
    null $I2
.annotate 'line', 8871
    if_null $P3, __label_8
    iter $P9, $P3
    set $P9, 0
  __label_7: # for iteration
    unless $P9 goto __label_8
    shift $P6, $P9
.annotate 'line', 8872
    $P6.'emit'(__ARG_1, $S1)
.annotate 'line', 8873
    $P7 = WSubId_26("    %0[%1] = %2", $P1, $I2, $S1)
    __ARG_1.'say'($P7)
.annotate 'line', 8874
    inc $I2
    goto __label_7
  __label_8: # endfor
  __label_3: # endif
.annotate 'line', 8877

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8802
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8804
    addattribute $P0, 'size'
.annotate 'line', 8805
    addattribute $P0, 'initarray'
.annotate 'line', 8806
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_115')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 8884
    null $P1
.annotate 'line', 8885
    null $P2
  __label_1: # do
.annotate 'line', 8887
    $P3 = __ARG_4.'get'()
.annotate 'line', 8888
    WSubId_108($P3)
.annotate 'line', 8889
    $P4 = __ARG_4.'get'()
.annotate 'line', 8890
    null $P5
.annotate 'line', 8891
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8892
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
.annotate 'line', 8894
    __ARG_4.'unget'($P4)
.annotate 'line', 8895
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
  __label_5: # endif
.annotate 'line', 8897
    $P2 = WSubId_114($P2, $P5)
.annotate 'line', 8898
    $P1 = __ARG_4.'get'()
  __label_3: # continue
.annotate 'line', 8899
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8900
    WSubId_4(';', $P1)
.annotate 'line', 8901
    .return($P2)
.annotate 'line', 8902

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8910
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
.annotate 'line', 8911

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8906
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8918
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
.annotate 'line', 8919

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8914
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8925
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8926

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8930
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8931

.end # newIntArray


.sub 'parseInt' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_116 = "WSubId_116"
.const 'Sub' WSubId_117 = "WSubId_117"
.annotate 'line', 8935
    .tailcall WSubId_115(WSubId_116, WSubId_117, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8936

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8944
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
.annotate 'line', 8945

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8940
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8952
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
.annotate 'line', 8953

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8948
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_118')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8959
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8960

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8964
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8965

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_119 = "WSubId_119"
.annotate 'line', 8969
    .tailcall WSubId_115(WSubId_118, WSubId_119, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8970

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8978
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
.annotate 'line', 8979

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8974
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8986
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
.annotate 'line', 8987

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8982
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_120')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8993
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8994

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_121')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8998
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8999

.end # newStringArray


.sub 'parseString' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_121 = "WSubId_121"
.annotate 'line', 9003
    .tailcall WSubId_115(WSubId_120, WSubId_121, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9004

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 9020
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9021
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 9022
    setattribute self, 'name', __ARG_4
.annotate 'line', 9023
    setattribute self, 'value', __ARG_5
.annotate 'line', 9024
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
.annotate 'line', 9025

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9028
    getattribute $P1, self, 'value'
.annotate 'line', 9029
    getattribute $P2, self, 'name'
.annotate 'line', 9030
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 9031
    $P1 = $P1.'optimize'()
.annotate 'line', 9032
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 9033
    WSubId_1('Value for const is not evaluable at compile time', self)
  __label_2: # endif
.annotate 'line', 9036
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 9037
    .return(self)
.annotate 'line', 9038

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9041
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
.annotate 'line', 9042

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9045
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9046
    getattribute $P3, self, 'data'
    $P1 = $P3.'getvalue'()
.annotate 'line', 9047
    null $S1
.annotate 'line', 9048
    getattribute $P2, self, 'type'
    set $S2, $P2
    if_null $S2, __label_2
    length $I1, $S2
    ne $I1, 1, __label_2
    ord $I1, $S2
    if $I1 == 73 goto __label_4
    if $I1 == 78 goto __label_5
    if $I1 == 83 goto __label_6
    goto __label_2
  __label_4: # case
.annotate 'line', 9049
    $P3 = $P1.'getIntegerValue'()
    set $S1, $P3
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 9050
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 9051
    $P5 = $P1.'getPirString'()
    set $S1, $P5
    goto __label_3 # break
  __label_2: # default
  __label_3: # switch end
.annotate 'line', 9054
    getattribute $P2, self, 'name'
    set $S2, $P2
.annotate 'line', 9055
    concat $S3, "Constant '", $S2
    concat $S3, $S3, "' set to: "
    concat $S3, $S3, $S1
.annotate 'line', 9054
    __ARG_1.'comment'($S3)
  __label_1: # endif
.annotate 'line', 9057

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 9010
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9012
    addattribute $P0, 'type'
.annotate 'line', 9013
    addattribute $P0, 'name'
.annotate 'line', 9014
    addattribute $P0, 'data'
.annotate 'line', 9015
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 9062
    $P1 = __ARG_2.'get'()
.annotate 'line', 9063
    $P5 = WSubId_112($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 9064
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9065
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 9067
    null $P2
  __label_5: # do
.annotate 'line', 9069
    $P1 = __ARG_2.'get'()
.annotate 'line', 9070
    set $P3, $P1
.annotate 'line', 9071
    WSubId_68('=', __ARG_2)
.annotate 'line', 9072
    $P4 = WSubId_51(__ARG_2, __ARG_3)
.annotate 'line', 9074
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 9073
    $P2 = WSubId_114($P2, $P5)
  __label_7: # continue
.annotate 'line', 9075
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 9076
    WSubId_4(';', $P1)
.annotate 'line', 9077
    .return($P2)
.annotate 'line', 9078

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 9089
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 9090
    $P1 = __ARG_2.'get'()
.annotate 'line', 9091
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9092
    $P4 = WSubId_51(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 9093
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 9095
    WSubId_4(';', $P1)
.annotate 'line', 9096

.end # VarStatement


.sub 'optimize_init' :method
.annotate 'line', 9099
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 9100
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 9101
    .return(self)
.annotate 'line', 9102

.end # optimize_init


.sub 'optimize' :method
.annotate 'line', 9105
    .tailcall self.'optimize_init'()
.annotate 'line', 9106

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9109
    self.'annotate'(__ARG_1)
.annotate 'line', 9110
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9111
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 9112
    getattribute $P1, self, 'init'
.annotate 'line', 9113
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9114
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
  __label_3: # endif
.annotate 'line', 9115
    if_null $P1, __label_4
.annotate 'line', 9116
    $P2 = $P1.'isnull'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 9117
    null $P1
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 9118
    if_null $P1, __label_6
.annotate 'line', 9119
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    if_null $S4, __label_8
    length $I1, $S4
    ne $I1, 1, __label_8
    ord $I1, $S4
    if $I1 == 80 goto __label_10
    if $I1 == 83 goto __label_11
    if $I1 == 73 goto __label_12
    if $I1 == 78 goto __label_13
    if $I1 == 118 goto __label_14
    goto __label_8
  __label_10: # case
.annotate 'line', 9121
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
  __label_13: # case
.annotate 'line', 9126
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_15
    set $S3, $P3
  __label_15:
.annotate 'line', 9127
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_9 # break
  __label_14: # case
.annotate 'line', 9130
    WSubId_1("Can't use void function as initializer", self)
  __label_8: # default
.annotate 'line', 9132
    WSubId_1("Invalid var initializer", self)
  __label_9: # switch end
    goto __label_7
  __label_6: # else
.annotate 'line', 9136
    __ARG_1.'emitnull'($S2)
  __label_7: # endif
.annotate 'line', 9137

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 9084
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 9086
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 9144
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 9145
    WSubId_68(';', __ARG_2)
.annotate 'line', 9146

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 9149
    self.'annotate'(__ARG_1)
.annotate 'line', 9150
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9151
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 9152
    getattribute $P3, self, 'name'
    $P2 = WSubId_26("var %0[] : %1", $P3, $S1)
    __ARG_1.'comment'($P2)
  __label_2: # endif
.annotate 'line', 9153
    $P1 = WSubId_26("    new %0, 'ResizablePMCArray'", $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 9154

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 9140
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 9163
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 9164
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 9165
    WSubId_68(']', __ARG_2)
.annotate 'line', 9166
    WSubId_68(';', __ARG_2)
.annotate 'line', 9167

.end # FixedVarStatement


.sub 'optimize' :method
.annotate 'line', 9170
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 9171
    .tailcall self.'optimize_init'()
.annotate 'line', 9172

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 9175
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9176
    self.'annotate'(__ARG_1)
.annotate 'line', 9177
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 9178
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 9179
    getattribute $P3, self, 'name'
    $P2 = WSubId_26("var %0[] : %1", $P3, $S2)
    __ARG_1.'comment'($P2)
  __label_3: # endif
.annotate 'line', 9180
    $P1 = WSubId_26("    new %0, 'FixedPMCArray', %1", $S2, $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 9181

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 9157
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 9159
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_108 = "WSubId_108"
.annotate 'line', 9186
    $P1 = __ARG_2.'get'()
.annotate 'line', 9187
    WSubId_108($P1)
.annotate 'line', 9188
    $P2 = __ARG_2.'get'()
.annotate 'line', 9189
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9190
    $P2 = __ARG_2.'get'()
.annotate 'line', 9191
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 9192
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
.annotate 'line', 9194
    __ARG_2.'unget'($P2)
.annotate 'line', 9195
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 9199
    __ARG_2.'unget'($P2)
.annotate 'line', 9200
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9202

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_60 = "WSubId_60"
.annotate 'line', 9206
    $P1 = __ARG_2.'get'()
.annotate 'line', 9207
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9208
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 9209
    .tailcall WSubId_60(__ARG_1, __ARG_2, __ARG_3, 1)
.annotate 'line', 9210

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9223
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 9224
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 9225
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 9226
    null $P1
  __label_2: # while
.annotate 'line', 9227
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9228
    __ARG_2.'unget'($P1)
.annotate 'line', 9229
    $P2 = WSubId_109(__ARG_2, self)
.annotate 'line', 9230
    unless_null $P2, __label_3
.annotate 'line', 9231
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 9232
    getattribute $P3, self, 'statements'
    push $P3, $P2
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9234
    setattribute self, 'end', $P1
.annotate 'line', 9235

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 9238
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9239
    getattribute $P1, self, 'labels'
.annotate 'line', 9240
    $S2 = $P1[$S1]
.annotate 'line', 9241
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9242
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 9243
    .return($S2)
.annotate 'line', 9244

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9247
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9248
    getattribute $P1, self, 'labels'
.annotate 'line', 9249
    $S2 = $P1[$S1]
.annotate 'line', 9250
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9251
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 9252
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 9253
    $P1[$S1] = $S3
.annotate 'line', 9254
    .return($S3)
.annotate 'line', 9255

.end # createlabel


.sub 'getend' :method
.annotate 'line', 9256
    getattribute $P1, self, 'end'
    .return($P1)

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9259
    $P2 = __ARG_1.'getDebug'()
    set $I1, $P2
.annotate 'line', 9260
    unless $I1 goto __label_1
.annotate 'line', 9261
    __ARG_1.'comment'('{')
  __label_1: # endif
.annotate 'line', 9262
    getattribute $P2, self, 'statements'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9263
    $P1.'emit'(__ARG_1)
.annotate 'line', 9264
    self.'freetemps'()
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9266
    unless $I1 goto __label_4
.annotate 'line', 9267
    __ARG_1.'comment'('}')
  __label_4: # endif
.annotate 'line', 9268

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 9216
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 9218
    addattribute $P0, 'end'
.annotate 'line', 9219
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
.annotate 'line', 9283
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 9285
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 9286
    new $P1, ['ResizableStringArray']
.annotate 'line', 9287
    new $P2, ['ResizableStringArray']
.annotate 'line', 9288
    setattribute self, 'tempreg', $P1
.annotate 'line', 9289
    setattribute self, 'freereg', $P2
.annotate 'line', 9290

.end # RegisterStore


.sub 'createreg' :method
.annotate 'line', 9293
    getattribute $P1, self, 'nreg'
.annotate 'line', 9294
    set $I1, $P1
.annotate 'line', 9295
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 9296
    assign $P1, $I1
.annotate 'line', 9297
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
.annotate 'line', 9298

.end # createreg


.sub 'tempreg' :method
.annotate 'line', 9301
    getattribute $P1, self, 'freereg'
.annotate 'line', 9302
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9303
    null $S1
.annotate 'line', 9304
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9305
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9307
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 9308
    push $P2, $S1
.annotate 'line', 9309
    .return($S1)
.annotate 'line', 9310

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9313
    getattribute $P1, self, 'freereg'
.annotate 'line', 9314
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9315
    elements $I1, $P2
.annotate 'line', 9316
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
.annotate 'line', 9317
    $S1 = $P2[$I2]
.annotate 'line', 9318
    push $P1, $S1
  __label_1: # for iteration
.annotate 'line', 9316
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 9320
    assign $P2, 0
.annotate 'line', 9321

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 9277
    addattribute $P0, 'type'
.annotate 'line', 9278
    addattribute $P0, 'nreg'
.annotate 'line', 9279
    addattribute $P0, 'tempreg'
.annotate 'line', 9280
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9332
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9333

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9336
    null $P1
.annotate 'line', 9337
    null $P2
.annotate 'line', 9338
    $P3 = self.'getlist'()
.annotate 'line', 9339
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
.annotate 'line', 9340
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
    if $S1 == 'named' goto __label_6
    if $S1 == 'slurpy' goto __label_7
    goto __label_4
  __label_6: # case
.annotate 'line', 9343
    set $P1, $P4
    goto __label_5 # break
  __label_7: # case
.annotate 'line', 9346
    set $P2, $P4
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 9349
    __ARG_1.'print'(' :', $S1)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9353
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 9360
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 9377
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 9358
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 9361
    null $S2
.annotate 'line', 9362
    $P7 = $P1.'numargs'()
    set $I2, $P7
    if $I2 == 0 goto __label_16
    if $I2 == 1 goto __label_17
    goto __label_14
  __label_16: # case
.annotate 'line', 9364
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_15 # break
  __label_17: # case
.annotate 'line', 9367
    $P5 = $P1.'getarg'(0)
.annotate 'line', 9368
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 9369
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 9370
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_15 # break
  __label_14: # default
.annotate 'line', 9373
    WSubId_1('Invalid modifier', __ARG_2)
  __label_15: # switch end
.annotate 'line', 9375
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 9378
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 9381

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 9328
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_112 = "WSubId_112"
.annotate 'line', 9392
    setattribute self, 'func', __ARG_1
.annotate 'line', 9393
    $P1 = __ARG_2.'get'()
.annotate 'line', 9394
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_112($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9395
    eq $S1, '', __label_2
.annotate 'line', 9396
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 9398
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 9399
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 9400
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 9401
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 9403
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 9404
    $P1 = __ARG_2.'get'()
.annotate 'line', 9405
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9406
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 9408
    __ARG_2.'unget'($P1)
  __label_5: # endif
.annotate 'line', 9409

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_122 = "WSubId_122"
.annotate 'line', 9412
    getattribute $P1, self, 'func'
.annotate 'line', 9413
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9414
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 9415
    $P5 = $P2.'gettype'()
    $P4 = WSubId_122($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 9416
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 9417
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9418
    if_null $P3, __label_3
.annotate 'line', 9419
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 9420
    __ARG_1.'say'('')
.annotate 'line', 9421

.end # emit


.sub 'get_type' :method
.annotate 'line', 9424
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 9425

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 9386
    addattribute $P0, 'func'
.annotate 'line', 9387
    addattribute $P0, 'name'
.annotate 'line', 9388
    addattribute $P0, 'modifiers'
.annotate 'line', 9389
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_123')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9431
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9432

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9443
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 9444
    setattribute self, 'name', __ARG_1
.annotate 'line', 9445

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9448
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 9449
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9450
    self.'annotate'(__ARG_1)
.annotate 'line', 9451
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 9452
    .return($S1)
.annotate 'line', 9453

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 9438
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9440
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_subid' :subid('WSubId_126')
        .param string __ARG_1
.annotate 'line', 9462
    concat $S1, ".const 'Sub' ", __ARG_1
    concat $S1, $S1, ' = "'
    concat $S1, $S1, __ARG_1
    concat $S1, $S1, "\"\n"
    .return($S1)
.annotate 'line', 9463

.end # emit_subid

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9469
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9470

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9473
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9474
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9476
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 9478
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 9479
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 9480
    le $I1, 0, __label_5
.annotate 'line', 9481
    __ARG_1.'print'('(')
.annotate 'line', 9482
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
.annotate 'line', 9483
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 9484
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 9485
    WSubId_1('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 9486
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 9487
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 9488
    __ARG_1.'print'(", ")
  __label_10: # endif
  __label_6: # for iteration
.annotate 'line', 9482
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 9490
    __ARG_1.'print'(')')
  __label_5: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9493

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 9465
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_125')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9498
    $P4 = __ARG_2.'numargs'()
    set $I1, $P4
.annotate 'line', 9499
    null $P1
.annotate 'line', 9500
    unless $I1 goto __label_1
.annotate 'line', 9501
    root_new $P4, ['parrot';'ResizablePMCArray']
    set $P1, $P4
.annotate 'line', 9502
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 9503
    $P2 = __ARG_2.'getarg'($I2)
.annotate 'line', 9505
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 9508
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 9521
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 9506
    $P4 = $P2.'get_value'()
    push $P1, $P4
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9509
    $P5 = $P2.'getName'()
    null $S1
    if_null $P5, __label_10
    set $S1, $P5
  __label_10:
    if $S1 == "int" goto __label_13
    if $S1 == "string" goto __label_14
    if $S1 == "float" goto __label_15
    if $S1 == "var" goto __label_16
    goto __label_11
  __label_13: # case
  __label_14: # case
.annotate 'line', 9512
    push $P1, $S1
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 9514
    push $P1, "num"
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 9516
    push $P1, "pmc"
    goto __label_12 # break
  __label_11: # default
.annotate 'line', 9518
    WSubId_1("unsupported multi signature", $P2)
  __label_12: # switch end
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9522
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 9523
    unless_null $P3, __label_17
.annotate 'line', 9524
    WSubId_1("class not found", $P2)
  __label_17: # endif
.annotate 'line', 9526
    $P6 = WSubId_30($P3)
    push $P1, $P6
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9529
    WSubId_1("unsupported multi signature", $P2)
  __label_5: # switch end
  __label_2: # for iteration
.annotate 'line', 9502
    inc $I2
    goto __label_4
  __label_3: # for end
  __label_1: # endif
.annotate 'line', 9533
    .return($P1)
.annotate 'line', 9534

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9556
    self.'BlockStatement'(__ARG_1, __ARG_2)
.annotate 'line', 9557
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 9558
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 9559
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 9560
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 9561
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
.annotate 'line', 9562

.end # FunctionBase


.sub 'getouter' :method
.annotate 'line', 9564
    .return(self)

.end # getouter


.sub 'allowtailcall' :method
.annotate 'line', 9567
    .return(1)
.annotate 'line', 9568

.end # allowtailcall


.sub 'makesubid' :method
.annotate 'line', 9572
    getattribute $P1, self, 'subid'
.annotate 'line', 9573
    unless_null $P1, __label_1
.annotate 'line', 9574
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 9575
    .return($P1)
.annotate 'line', 9576

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 9579
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 9580
    unless_null $P1, __label_1
.annotate 'line', 9581
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 9582
    $P1[__ARG_1] = 1
.annotate 'line', 9583

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
.annotate 'line', 9587
    issame $I1, self, __ARG_1
.annotate 'line', 9588
    .return($I1)
.annotate 'line', 9589

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_123 = "WSubId_123"
.annotate 'line', 9592
    $P1 = __ARG_1.'get'()
.annotate 'line', 9593
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9594
    __ARG_1.'unget'($P1)
.annotate 'line', 9595
    $P3 = WSubId_50(__ARG_1, self, WSubId_123, ')')
    setattribute self, 'params', $P3
  __label_1: # endif
.annotate 'line', 9597

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 9601
    getattribute $P1, self, 'localfun'
.annotate 'line', 9602
    unless_null $P1, __label_1
.annotate 'line', 9603
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9605
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 9606

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 9610
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9611
    unless_null $P1, __label_1
.annotate 'line', 9612
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'usednamespaces', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9614
    $P4 = WSubId_124($P1, __ARG_1)
    if_null $P4, __label_3
.annotate 'line', 9615
    .return()
  __label_3: # endif
.annotate 'line', 9616
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 9618

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 9621
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9622
    $P2 = $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 9623
    if_null $P2, __label_3
.annotate 'line', 9624
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9626
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 9627

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 9631
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9632
    if_null $P1, __label_1
.annotate 'line', 9633
    $P2 = $P1.'pick'('multi')
.annotate 'line', 9634
    if_null $P2, __label_2
.annotate 'line', 9636
    self.'setmulti'()
.annotate 'line', 9637
    $P5 = WSubId_125(self, $P2)
    setattribute self, 'multi_sig', $P5
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 9640
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
.annotate 'line', 9641
    $P3.'fixnamespaces'()
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9642
    getattribute $P7, self, 'body'
    $P5 = $P7.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 9643
    .return(self)
.annotate 'line', 9644

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 9648
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 9649
    unless_null $P1, __label_1
.annotate 'line', 9650
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 9651
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 9652

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 9655
    getattribute $P1, self, 'lexicals'
.annotate 'line', 9656
    unless_null $P1, __label_1
.annotate 'line', 9657
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 9658
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 9659

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
.annotate 'line', 9664
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 9665
    null $S1
.annotate 'line', 9666
    if_null $P1, __label_1
.annotate 'line', 9667
    set $S1, $P1
    goto __label_2
  __label_1: # else
.annotate 'line', 9669
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 9670
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 9671
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 9672
    self.'setlex'($S1, $S2)
.annotate 'line', 9673
    __ARG_1.'setlex'($S1)
  __label_2: # endif
.annotate 'line', 9675
    .return($S1)
.annotate 'line', 9676

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9680
    null $P1
    if_null __ARG_1, __label_1
    length $I1, __ARG_1
    ne $I1, 1, __label_1
    ord $I1, __ARG_1
    if $I1 == 73 goto __label_3
    if $I1 == 78 goto __label_4
    if $I1 == 83 goto __label_5
    if $I1 == 80 goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 9683
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 9685
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 9687
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 9689
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 9691
    concat $S2, "Invalid type in createreg: ", __ARG_1
    WSubId_6($S2)
  __label_2: # switch end
.annotate 'line', 9693
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9694
    .return($S1)
.annotate 'line', 9695

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9698
    null $P1
    if_null __ARG_1, __label_1
    length $I1, __ARG_1
    ne $I1, 1, __label_1
    ord $I1, __ARG_1
    if $I1 == 73 goto __label_3
    if $I1 == 78 goto __label_4
    if $I1 == 83 goto __label_5
    if $I1 == 80 goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 9701
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 9703
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 9705
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 9707
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 9709
    concat $S2, "Invalid type in tempreg: ", __ARG_1
    WSubId_6($S2)
  __label_2: # switch end
.annotate 'line', 9711
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9712
    .return($S1)
.annotate 'line', 9713

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9716
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 4
    getattribute $P3, self, 'regstI'
    $P2[0] = $P3
    getattribute $P4, self, 'regstN'
    $P2[1] = $P4
    getattribute $P5, self, 'regstS'
    $P2[2] = $P5
    getattribute $P6, self, 'regstP'
    $P2[3] = $P6
    if_null $P2, __label_2
    iter $P7, $P2
    set $P7, 0
  __label_1: # for iteration
    unless $P7 goto __label_2
    shift $P1, $P7
.annotate 'line', 9717
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9718

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 9721
    getattribute $P1, self, 'nlabel'
    inc $P1
    set $I1, $P1
.annotate 'line', 9722
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
.annotate 'line', 9723

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9726
    WSubId_1('break not allowed here', __ARG_1)
.annotate 'line', 9727

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9730
    WSubId_1('continue not allowed here', __ARG_1)
.annotate 'line', 9731

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_126 = "WSubId_126"
.annotate 'line', 9737
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 9738
    __ARG_1.'say'()
.annotate 'line', 9739
    __ARG_1.'print'(".sub ")
.annotate 'line', 9740
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 9741
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 9743
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 9744
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 9745
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 9747
    getattribute $P1, self, 'outer'
.annotate 'line', 9748
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_6
    getattribute $P8, self, 'usedlexicals'
    isnull $I2, $P8
    not $I2
  __label_6:
    unless $I2 goto __label_5
.annotate 'line', 9749
    getattribute $P2, $P1, 'subid'
.annotate 'line', 9750
    if_null $P2, __label_7
.annotate 'line', 9751
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 9755
    $P8 = self.'ismethod'()
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 9756
    __ARG_1.'print'(' :method')
  __label_8: # endif
.annotate 'line', 9757
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9758
    if_null $P3, __label_9
.annotate 'line', 9759
    $P3.'emit'(__ARG_1)
    goto __label_10
  __label_9: # else
.annotate 'line', 9761
    ne $S1, 'main', __label_11
.annotate 'line', 9762
    __ARG_1.'print'(' :main')
  __label_11: # endif
  __label_10: # endif
.annotate 'line', 9764
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 9765
    __ARG_1.'say'()
.annotate 'line', 9768
    getattribute $P8, self, 'params'
    WSubId_66(__ARG_1, $P8)
.annotate 'line', 9770
    getattribute $P4, self, 'lexicals'
.annotate 'line', 9771
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 9772
    isnull $I2, $P4
    not $I2
    if $I2 goto __label_13
    isnull $I2, $P5
    not $I2
  __label_13:
    unless $I2 goto __label_12
.annotate 'line', 9773
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 9775
    if_null $P4, __label_15
    iter $P10, $P4
    set $P10, 0
  __label_14: # for iteration
    unless $P10 goto __label_15
    shift $S2, $P10
.annotate 'line', 9776
    $P9 = $P4[$S2]
    $P8 = WSubId_26(".lex '%0', %1", $P9, $S2)
    __ARG_1.'say'($P8)
    goto __label_14
  __label_15: # endfor
.annotate 'line', 9778
    if_null $P5, __label_17
    iter $P11, $P5
    set $P11, 0
  __label_16: # for iteration
    unless $P11 goto __label_17
    shift $S3, $P11
.annotate 'line', 9779
    substr $S4, $S3, 0, 1
    eq $S4, '$', __label_18
.annotate 'line', 9780
    concat $S5, "    .local pmc ", $S3
    __ARG_1.'say'($S5)
  __label_18: # endif
.annotate 'line', 9781
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
    goto __label_16
  __label_17: # endfor
  __label_12: # endif
.annotate 'line', 9785
    getattribute $P9, self, 'usedsubids'
    root_new $P12, ['parrot';'ResizablePMCArray']
    $P8 = WSubId_31($P9, $P12, WSubId_126)
    join $S4, "", $P8
    __ARG_1.'print'($S4)
.annotate 'line', 9787
    $P8 = __ARG_1.'getDebug'()
    set $I1, $P8
.annotate 'line', 9788
    getattribute $P6, self, 'body'
.annotate 'line', 9789
    $P8 = $P6.'isempty'()
    if_null $P8, __label_19
    unless $P8 goto __label_19
.annotate 'line', 9790
    unless $I1 goto __label_21
.annotate 'line', 9791
    __ARG_1.'comment'('Empty body')
  __label_21: # endif
    goto __label_20
  __label_19: # else
.annotate 'line', 9794
    unless $I1 goto __label_22
.annotate 'line', 9795
    __ARG_1.'comment'('Body')
  __label_22: # endif
.annotate 'line', 9796
    $P6.'emit'(__ARG_1)
.annotate 'line', 9797
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
  __label_20: # endif
.annotate 'line', 9799
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9802
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_24
    iter $P13, $P8
    set $P13, 0
  __label_23: # for iteration
    unless $P13 goto __label_24
    shift $P7, $P13
.annotate 'line', 9803
    $P7.'emit'(__ARG_1)
    goto __label_23
  __label_24: # endfor
.annotate 'line', 9804

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 9536
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 9538
    addattribute $P0, 'name'
.annotate 'line', 9539
    addattribute $P0, 'subid'
.annotate 'line', 9540
    addattribute $P0, 'modifiers'
.annotate 'line', 9541
    addattribute $P0, 'params'
.annotate 'line', 9542
    addattribute $P0, 'body'
.annotate 'line', 9543
    addattribute $P0, 'regstI'
.annotate 'line', 9544
    addattribute $P0, 'regstN'
.annotate 'line', 9545
    addattribute $P0, 'regstS'
.annotate 'line', 9546
    addattribute $P0, 'regstP'
.annotate 'line', 9547
    addattribute $P0, 'nlabel'
.annotate 'line', 9548
    addattribute $P0, 'localfun'
.annotate 'line', 9549
    addattribute $P0, 'lexicals'
.annotate 'line', 9550
    addattribute $P0, 'usedlexicals'
.annotate 'line', 9551
    addattribute $P0, 'usedsubids'
.annotate 'line', 9552
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'get_pir_type' :subid('WSubId_127')
        .param pmc __ARG_1
.const 'Sub' WSubId_122 = "WSubId_122"
.annotate 'line', 9813
    $P1 = __ARG_1.'get_type'()
    .tailcall WSubId_122($P1)
.annotate 'line', 9814

.end # get_pir_type

.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9825
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9826
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 9827
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 9828
    self.'parse'(__ARG_2)
.annotate 'line', 9829
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
.annotate 'line', 9830

.end # FunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 9832
    .return(0)

.end # isanonymous


.sub 'getparamnum' :method
.annotate 'line', 9836
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 9837

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 9841
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 9842

.end # getlexnum


.sub 'ismethod' :method
.annotate 'line', 9843
    .return(0)

.end # ismethod


.sub 'ismulti' :method
.annotate 'line', 9847
    getattribute $P1, self, 'is_multi'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)
.annotate 'line', 9848

.end # ismulti


.sub 'setmulti' :method
.annotate 'line', 9851
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
.annotate 'line', 9852

.end # setmulti


.sub 'default_multi_sig' :method
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 9855
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9856
    $P2 = self.'ismethod'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9857
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 9858
    getattribute $P2, self, 'params'
    WSubId_31($P2, $P1, WSubId_127)
.annotate 'line', 9859
    .return($P1)
.annotate 'line', 9860

.end # default_multi_sig


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_2 = "WSubId_2"
.annotate 'line', 9863
    $P1 = __ARG_1.'get'()
.annotate 'line', 9864
    setattribute self, 'name', $P1
.annotate 'line', 9865
    $P2 = __ARG_1.'get'()
.annotate 'line', 9866
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 9867
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9868
    $P2 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 9870
    WSubId_4('(', $P2)
.annotate 'line', 9871
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9873
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 9874
    $P4 = $P3.'fullname'()
    WSubId_128(self, '__FUNCTION__', $P4)
.annotate 'line', 9876
    $P2 = __ARG_1.'get'()
.annotate 'line', 9877
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9878
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9879
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9880
    .return(self)
.annotate 'line', 9881

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.annotate 'line', 9885
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9886
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9887
    unless_null $P1, __label_2
.annotate 'line', 9888
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 9889
    join $S1, ", ", $P1
    __ARG_1.'print'(' :multi(', $S1, ')')
  __label_1: # endif
.annotate 'line', 9891

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9816
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9818
    addattribute $P0, 'paramnum'
.annotate 'line', 9819
    addattribute $P0, 'lexnum'
.annotate 'line', 9820
    addattribute $P0, 'is_multi'
.annotate 'line', 9821
    addattribute $P0, 'multi_sig'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 9902
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9903
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9904
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9905
    $P1 = self.'makesubid'()
.annotate 'line', 9906
    setattribute self, 'name', $P1
.annotate 'line', 9907
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9908
    $P2 = __ARG_2.'get'()
.annotate 'line', 9909
    WSubId_4('{', $P2)
.annotate 'line', 9910
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9911
    __ARG_3.'addlocalfunction'(self)
.annotate 'line', 9912

.end # LocalFunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 9913
    .return(1)

.end # isanonymous


.sub 'ismethod' :method
.annotate 'line', 9914
    .return(0)

.end # ismethod


.sub 'needclosure' :method
.annotate 'line', 9917
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9918
    .return(1)
  __label_1: # endif
.annotate 'line', 9919
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9920
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9921
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9922
    .return(0)
.annotate 'line', 9923

.end # needclosure


.sub 'getsubid' :method
.annotate 'line', 9926
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 9927

.end # getsubid


.sub 'getparamnum' :method
.annotate 'line', 9931
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
.annotate 'line', 9932

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 9936
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
.annotate 'line', 9937

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9940
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9941
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9942
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9944
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9945
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9946
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9947
    $P2 = $P1.'getouter'()
.annotate 'line', 9948
    getattribute $P3, self, 'outer'
.annotate 'line', 9949
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
.annotate 'line', 9950
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 9951
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9952
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 9953
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9954
    eq $S3, 'P', __label_8
.annotate 'line', 9955
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9956
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9957
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9958
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9959
    .return($P4)
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 9962
    .return(__ARG_2)
.annotate 'line', 9963

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9966
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9967
    unless_null $P1, __label_1
.annotate 'line', 9968
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9969
    unless_null $P1, __label_2
.annotate 'line', 9972
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9973
    unless_null $P1, __label_3
.annotate 'line', 9975
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
.annotate 'line', 9976
    getattribute $P2, self, 'outer'
.annotate 'line', 9977
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 9978
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9979
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9980
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9981
    self.'setusedlex'($S1, $S2)
  __label_6: # endif
  __label_5: # endif
    goto __label_4
  __label_3: # else
.annotate 'line', 9985
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 9987
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9988
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9989
    .return($P1)
.annotate 'line', 9990

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9898
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10001
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10002

.end # MethodStatement


.sub 'ismethod' :method
.annotate 'line', 10003
    .return(1)

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9997
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_112 = "WSubId_112"
.annotate 'line', 10017
    $P1 = __ARG_1.'get'()
.annotate 'line', 10018
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 10019
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 10020
    $P2 = __ARG_1.'get'()
.annotate 'line', 10021
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 10022
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_112($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 10023
    set $P1, $P2
.annotate 'line', 10024
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 10025
    $P2 = __ARG_1.'get'()
  __label_2: # endif
.annotate 'line', 10027
    setattribute self, 'name', $P1
.annotate 'line', 10028
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 10029
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 10030
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 10031
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 10033
    __ARG_1.'unget'($P2)
  __label_5: # endif
.annotate 'line', 10034

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 10037
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 10038
    getattribute $P1, self, 'modifiers'
.annotate 'line', 10039
    if_null $P1, __label_1
.annotate 'line', 10040
    getattribute $P2, self, 'name'
.annotate 'line', 10041
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
  __label_1: # endif
.annotate 'line', 10043

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 10012
    addattribute $P0, 'name'
.annotate 'line', 10013
    addattribute $P0, 'modifiers'
.annotate 'line', 10014
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_129')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10048
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
.annotate 'line', 10049

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_129 = "WSubId_129"
.annotate 'line', 10056
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_129, ')')
    setattribute self, 'params', $P2
.annotate 'line', 10057

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 10060
    __ARG_1.'print'('(')
.annotate 'line', 10061
    set $S1, ''
.annotate 'line', 10062
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10063
    __ARG_1.'print'($S1)
.annotate 'line', 10064
    $P1.'emit'(__ARG_1)
.annotate 'line', 10065
    set $S1, ', '
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10067
    __ARG_1.'print'(')')
.annotate 'line', 10068

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 10053
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 10077
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 10078
    setattribute self, 'params', __ARG_3
.annotate 'line', 10079
    setattribute self, 'expr', __ARG_4
.annotate 'line', 10080

.end # MultiAssignStatement


.sub 'optimize' :method
.annotate 'line', 10083
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 10084
    .return(self)
.annotate 'line', 10085

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 10088
    getattribute $P1, self, 'expr'
.annotate 'line', 10089
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 10090
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 10091
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 10092
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 10093
    __ARG_1.'print'('    ')
.annotate 'line', 10094
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 10095
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 10096
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 10097
    __ARG_1.'say'()
.annotate 'line', 10098

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 10071
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 10073
    addattribute $P0, 'params'
.annotate 'line', 10074
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10115
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 10116

.end # ClassSpecifier


.sub 'reftype' :method
.annotate 'line', 10117
    .return(0)

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 10121
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 10122

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 10111
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10130
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 10131
    setattribute self, 'name', __ARG_2
.annotate 'line', 10132

.end # ClassSpecifierStr


.sub 'reftype' :method
.annotate 'line', 10133
    .return(1)

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10137
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10138
    __ARG_1.'print'($S1)
.annotate 'line', 10139

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 10125
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 10127
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 10148
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 10149
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 10150
    $P2 = __ARG_1.'get'()
.annotate 'line', 10151
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 10152
    WSubId_54('literal string', $P2)
  __label_1: # endif
.annotate 'line', 10153
    $P3 = $P2.'rawstring'()
    push $P1, $P3
.annotate 'line', 10154
    $P2 = __ARG_1.'get'()
.annotate 'line', 10155
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 10156
    $P4 = $P2.'checkop'()
    set $S1, $P4
    if_null $S1, __label_3
    length $I2, $S1
    ne $I2, 1, __label_3
    ord $I2, $S1
    if $I2 == 58 goto __label_5
    if $I2 == 44 goto __label_6
    goto __label_3
  __label_5: # case
.annotate 'line', 10158
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 10162
    WSubId_55('token in class key', $P2)
  __label_4: # switch end
  __label_7: # do
.annotate 'line', 10165
    $P2 = __ARG_1.'get'()
.annotate 'line', 10166
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 10167
    WSubId_54('literal string', $P2)
  __label_10: # endif
.annotate 'line', 10168
    $P3 = $P2.'rawstring'()
    push $P1, $P3
  __label_9: # continue
.annotate 'line', 10169
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 10170
    WSubId_4(']', $P2)
  __label_2: # endif
.annotate 'line', 10172
    setattribute self, 'key', $P1
.annotate 'line', 10173

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
.annotate 'line', 10174
    .return(2)

.end # reftype


.sub 'hasHLL' :method
.annotate 'line', 10177
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 10178

.end # hasHLL


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 10182
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 10183
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 10184

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10187
    getattribute $P2, self, 'key'
    $P1 = WSubId_30($P2)
    __ARG_1.'print'($P1)
.annotate 'line', 10188

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 10142
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 10144
    addattribute $P0, 'key'
.annotate 'line', 10145
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10196
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 10197
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 10198
    null $P2
  __label_2: # while
.annotate 'line', 10199
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 10200
    $P2 = __ARG_1.'get'()
.annotate 'line', 10201
    set $S1, $P2
    push $P1, $S1
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 10203
    __ARG_1.'unget'($P2)
.annotate 'line', 10204
    setattribute self, 'key', $P1
.annotate 'line', 10205

.end # ClassSpecifierId


.sub 'reftype' :method
.annotate 'line', 10206
    .return(3)

.end # reftype


.sub 'last' :method
.annotate 'line', 10210
    getattribute $P1, self, 'key'
.annotate 'line', 10211
    $P2 = $P1[-1]
    .return($P2)
.annotate 'line', 10212

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 10215
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 10216
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 10217

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10221
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 10222
    unless_null $P1, __label_1
.annotate 'line', 10223
    getattribute $P2, self, 'key'
    join $S1, ".", $P2
    getattribute $P3, self, 'start'
    WSubId_83(__ARG_1, $S1, $P3)
.annotate 'line', 10224
    getattribute $P3, self, 'key'
    $P2 = WSubId_30($P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10226
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
.annotate 'line', 10227

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10230
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 10231
    unless_null $P1, __label_1
.annotate 'line', 10232
    getattribute $P2, self, 'key'
    join $S1, ".", $P2
    getattribute $P3, self, 'start'
    WSubId_83(__ARG_1, $S1, $P3)
.annotate 'line', 10233
    getattribute $P3, self, 'key'
    $P2 = WSubId_30($P3)
    __ARG_1.'say'("new ", __ARG_3, ", ", $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10236
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
  __label_2: # endif
.annotate 'line', 10238

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 10191
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 10193
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10251
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 10252
    setattribute self, 'name', __ARG_2
.annotate 'line', 10253
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 10254
    setattribute self, 'classns', $P1
.annotate 'line', 10255

.end # ClassBase


.sub 'getpath' :method
.annotate 'line', 10258
    getattribute $P1, self, 'classns'
    .return($P1)
.annotate 'line', 10259

.end # getpath


.sub 'getclasskey' :method
.annotate 'line', 10262
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
.annotate 'line', 10263

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 10245
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 10247
    addattribute $P0, 'name'
.annotate 'line', 10248
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]

.sub 'FunctionContainer' :method
.annotate 'line', 10271
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions', $P2
.annotate 'line', 10272

.end # FunctionContainer


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10278
    getattribute $P1, self, 'functions'
.annotate 'line', 10279
    getattribute $P3, __ARG_1, 'name'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 10280
    $P2 = $P1[$S1]
.annotate 'line', 10281
    unless_null $P2, __label_2
.annotate 'line', 10282
    $P1[$S1] = __ARG_1
    goto __label_3
  __label_2: # else
.annotate 'line', 10284
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_4
.annotate 'line', 10285
    $P2.'setmulti'()
  __label_4: # endif
.annotate 'line', 10286
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_5
.annotate 'line', 10287
    __ARG_1.'setmulti'()
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 10289

.end # addfunction


.sub 'find' :method
        .param string __ARG_1
.annotate 'line', 10292
    getattribute $P1, self, 'functions'
.annotate 'line', 10293
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 10294

.end # find

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
.annotate 'line', 10268
    addattribute $P0, 'functions'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_76 = "WSubId_76"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_55 = "WSubId_55"
.annotate 'line', 10308
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10309
    self.'VarContainer'()
.annotate 'line', 10310
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P8.'FunctionContainer'()
    set $P8, $P8
    setattribute self, 'funcont', $P8
.annotate 'line', 10311
    setattribute self, 'parent', __ARG_3
.annotate 'line', 10312
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 10313
    setattribute self, 'items', $P1
.annotate 'line', 10314
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 10315
    setattribute self, 'members', $P2
.annotate 'line', 10317
    $P3 = __ARG_4.'get'()
.annotate 'line', 10318
    $P7 = $P3.'isop'(':')
    if_null $P7, __label_1
    unless $P7 goto __label_1
.annotate 'line', 10319
    $P9 = WSubId_50(__ARG_4, self, WSubId_76)
    setattribute self, 'bases', $P9
.annotate 'line', 10320
    $P3 = __ARG_4.'get'()
  __label_1: # endif
.annotate 'line', 10322
    WSubId_4('{', $P3)
.annotate 'line', 10324
    getattribute $P8, self, 'classns'
    $P7 = $P8.'fullname'()
    WSubId_128(self, '__CLASS__', $P7)
.annotate 'line', 10326
    $P3 = __ARG_4.'get'()
  __label_4: # for condition
    $P7 = $P3.'isop'('}')
    isfalse $I1, $P7
    unless $I1 goto __label_3
.annotate 'line', 10327
    $P8 = $P3.'checkkeyword'()
    set $S1, $P8
    if $S1 == 'function' goto __label_7
    if $S1 == 'var' goto __label_8
    if $S1 == 'const' goto __label_9
    goto __label_5
  __label_7: # case
.annotate 'line', 10329
    new $P9, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P9.'MethodStatement'($P3, __ARG_4, self)
    set $P4, $P9
.annotate 'line', 10330
    self.'addmethod'($P4)
.annotate 'line', 10331
    push $P1, $P4
    goto __label_6 # break
  __label_8: # case
.annotate 'line', 10334
    $P5 = __ARG_4.'get'()
.annotate 'line', 10335
    $P10 = $P5.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 10336
    WSubId_54("member identifier", $P5)
  __label_10: # endif
.annotate 'line', 10337
    push $P2, $P5
.annotate 'line', 10338
    $P3 = __ARG_4.'get'()
.annotate 'line', 10339
    $P11 = $P3.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 10340
    WSubId_54("';' in member declaration", $P3)
  __label_11: # endif
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 10343
    $P6 = WSubId_58($P3, __ARG_4, self)
.annotate 'line', 10344
    push $P1, $P6
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 10347
    WSubId_55("item in class", $P3)
  __label_6: # switch end
  __label_2: # for iteration
.annotate 'line', 10326
    $P3 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10350

.end # ClassStatement


.sub 'addmethod' :method
        .param pmc __ARG_1
.annotate 'line', 10354
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 10355

.end # addmethod


.sub 'generatesubid' :method
.annotate 'line', 10358
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 10359

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 10362
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 10363

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 10366
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10367

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 10370
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
.annotate 'line', 10371

.end # use_builtin


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 10374
    getattribute $P1, self, 'items'
    WSubId_52($P1)
.annotate 'line', 10375
    .return(self)
.annotate 'line', 10376

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 10379
    getattribute $P3, self, 'classns'
    $P3.'emitnamespace'(__ARG_1)
.annotate 'line', 10380
    getattribute $P3, self, 'items'
    WSubId_66(__ARG_1, $P3)
.annotate 'line', 10382
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 10384
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 10385
    set $I1, 1
.annotate 'line', 10386
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10387
    $P1.'annotate'(__ARG_1)
.annotate 'line', 10388
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 10389
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 10390
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 10391
    __ARG_1.'say'()
.annotate 'line', 10392
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10394
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 10395
    __ARG_1.'annotate'($P2)
.annotate 'line', 10396
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
    goto __label_3
  __label_4: # endfor
.annotate 'line', 10399
    __ARG_1.'say'('.end')
.annotate 'line', 10400

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 10297
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 10299
    addattribute $P0, 'parent'
.annotate 'line', 10300
    addattribute $P0, 'bases'
.annotate 'line', 10301
    addattribute $P0, 'constants'
.annotate 'line', 10302
    addattribute $P0, 'items'
.annotate 'line', 10303
    addattribute $P0, 'members'
.annotate 'line', 10304
    addattribute $P0, 'funcont'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10407
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10408

.end # DeclareClassStatement


.sub 'optimize' :method
.annotate 'line', 10411
    .return(self)
.annotate 'line', 10412

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 10403
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_132')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10420
    $P1 = __ARG_2.'get'()
.annotate 'line', 10421
    $P2 = __ARG_2.'get'()
.annotate 'line', 10422
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 10423
    null $P4
  __label_3: # for condition
.annotate 'line', 10425
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 10426
    $P3.'push'($P1)
.annotate 'line', 10427
    $P1 = __ARG_2.'get'()
  __label_1: # for iteration
.annotate 'line', 10425
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10430
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 10431
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 10432
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 10433
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
    goto __label_5
  __label_4: # else
.annotate 'line', 10436
    __ARG_2.'unget'($P2)
.annotate 'line', 10437
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 10438
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 10439
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
  __label_5: # endif
.annotate 'line', 10441

.end # parseClass


.sub 'open_include' :subid('WSubId_130')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 10449
    getinterp $P1
.annotate 'line', 10454
    $P2 = $P1[9]
.annotate 'line', 10455
    $P3 = $P2[0]
.annotate 'line', 10456
    null $P4
.annotate 'line', 10457
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
.annotate 'line', 10458
    concat $S2, $S1, __ARG_1
.annotate 'line', 10459
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
.annotate 'line', 10460
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 10461
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 10462
    pop_eh
    goto __label_4
  __label_3:
.annotate 'line', 10459
    .get_results($P7)
    finalize $P7
    pop_eh
  __label_4:
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10467
    isnull $I1, $P4
    box $P6, $I1
    if $P6 goto __label_8
    $P6 = $P4.'is_closed'()
  __label_8:
    if_null $P6, __label_7
    unless $P6 goto __label_7
.annotate 'line', 10468
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 10469
    $P4.'encoding'("utf8")
.annotate 'line', 10470
    .return($P4)
.annotate 'line', 10471

.end # open_include


.sub 'include_parrot' :subid('WSubId_134')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_130 = "WSubId_130"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10475
    $P1 = __ARG_2.'get'()
.annotate 'line', 10476
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 10477
    WSubId_54('literal string', $P1)
  __label_1: # endif
.annotate 'line', 10478
    WSubId_68(';', __ARG_2)
.annotate 'line', 10480
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 10481
    $P2 = WSubId_130($S1, __ARG_1)
.annotate 'line', 10486
    $P4 = $P2.'readline'()
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
  __label_5: # for condition
    $P5 = $P2.'eof'()
    isfalse $I4, $P5
    unless $I4 goto __label_4
.annotate 'line', 10487
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
.annotate 'line', 10488
    set $I1, 12
.annotate 'line', 10489
    null $S3
  __label_9: # while
.annotate 'line', 10490
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 10491
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 10492
    set $I2, $I1
  __label_12: # while
.annotate 'line', 10493
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 10494
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 10495
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 10496
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 10498
    sub $I4, $I2, $I1
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 10499
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 10500
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 10501
    set $I1, $I2
  __label_22: # while
.annotate 'line', 10502
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 10503
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 10504
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 10505
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 10507
    sub $I4, $I2, $I1
    substr $S5, $S2, $I1, $I4
.annotate 'line', 10509
    null $I3
.annotate 'line', 10510
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 10511
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 10513
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 10514
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 10516
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 10515
    $P4 = WSubId_25(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
  __label_7: # endif
  __label_3: # for iteration
.annotate 'line', 10486
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 10520
    $P2.'close'()
.annotate 'line', 10521

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_135')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_130 = "WSubId_130"
.annotate 'line', 10527
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 10528
    WSubId_1("Must be used at root namespace level", __ARG_1)
  __label_1: # endif
.annotate 'line', 10529
    $P1 = __ARG_2.'get'()
.annotate 'line', 10530
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 10531
    WSubId_54('literal string', $P1)
  __label_2: # endif
.annotate 'line', 10532
    WSubId_68(';', __ARG_2)
.annotate 'line', 10534
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 10535
    $P2 = WSubId_130($S1, __ARG_1)
.annotate 'line', 10537
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P2, $S1, 0)
    set $P3, $P4
.annotate 'line', 10538
    __ARG_3.'parse'($P3)
.annotate 'line', 10540
    $P2.'close'()
.annotate 'line', 10541

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_133')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 10547
    $P1 = __ARG_2.'get'()
.annotate 'line', 10548
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 10549
    WSubId_72(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10550
    WSubId_68(';', __ARG_2)
.annotate 'line', 10551
    .return()
  __label_1: # endif
.annotate 'line', 10553
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
.annotate 'line', 10554
    __ARG_2.'unget'($P1)
.annotate 'line', 10555
    $P2 = WSubId_69(__ARG_2)
.annotate 'line', 10556
    elements $I1, $P2
.annotate 'line', 10557
    ge $I1, 1, __label_3
.annotate 'line', 10558
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 10559
    WSubId_68(';', __ARG_2)
.annotate 'line', 10560
    __ARG_3.'use'($P2)
.annotate 'line', 10561
    .return()
  __label_2: # endif
.annotate 'line', 10563
    $P1 = __ARG_2.'get'()
.annotate 'line', 10565
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 10572
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 10566
    __ARG_2.'warn'("using extern 'file'; is deprecated, use $loadlib instead.", $P1)
.annotate 'line', 10568
    null $S1
    if_null $P1, __label_8
    set $S1, $P1
  __label_8:
.annotate 'line', 10569
    __ARG_3.'addlib'($S1)
.annotate 'line', 10570
    WSubId_68(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 10573
    __ARG_2.'unget'($P1)
.annotate 'line', 10574
    $P3 = WSubId_69(__ARG_2)
.annotate 'line', 10575
    $P1 = __ARG_2.'get'()
.annotate 'line', 10576
    $P5 = $P1.'isop'(';')
    isfalse $I3, $P5
    unless $I3 goto __label_9
.annotate 'line', 10577
    __ARG_2.'unget'($P1)
.annotate 'line', 10578
    null $P5
    $P4 = WSubId_50(__ARG_2, $P5, WSubId_71, ';')
.annotate 'line', 10579
    __ARG_3.'addextern'($P3, $P4)
  __label_9: # endif
.annotate 'line', 10581
    join $S3, '/', $P3
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 10582
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 10585
    WSubId_54('string literal or identifier', $P1)
  __label_4: # switch end
.annotate 'line', 10587

.end # parsensUsing


.sub 'emit_push_symbols' :subid('WSubId_131')
        .param string __ARG_1
.annotate 'line', 10593
    concat $S1, "    push symbols, '", __ARG_1
    concat $S1, $S1, "'\n"
    .return($S1)
.annotate 'line', 10594

.end # emit_push_symbols

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10602
    setattribute self, 'module', __ARG_1
.annotate 'line', 10603
    setattribute self, 'names', __ARG_2
.annotate 'line', 10604

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_131 = "WSubId_131"
.annotate 'line', 10609
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 10619
    getattribute $P1, self, 'module'
    join $S1, "'; '", $P1
    concat $S2, "['parrot'; '", $S1
    concat $S2, $S2, "']"
.annotate 'line', 10618
    __ARG_1.'emitget_root_namespace'("srcns", $S2)
.annotate 'line', 10621
    getattribute $P2, self, 'names'
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P1 = WSubId_31($P2, $P3, WSubId_131)
    join $S1, "", $P1
    __ARG_1.'print'($S1)
.annotate 'line', 10622
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
.annotate 'line', 10628

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 10598
    addattribute $P0, 'module'
.annotate 'line', 10599
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
.annotate 'line', 10638
    new $P1, ['ResizableStringArray']
.annotate 'line', 10639
    unless __ARG_2 goto __label_1
.annotate 'line', 10640
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10642
    if_null __ARG_1, __label_3
.annotate 'line', 10643
    push $P1, __ARG_1
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 10645
    setattribute self, 'path', $P1
.annotate 'line', 10646

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
.annotate 'line', 10649
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 10650
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 10651
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 10652
    push $P2, __ARG_1
.annotate 'line', 10653
    setattribute $P1, 'path', $P2
.annotate 'line', 10654
    .return($P1)
.annotate 'line', 10655

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
.annotate 'line', 10658
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 10659
    getattribute $P2, self, 'hll'
.annotate 'line', 10660
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 10661
    unless_null $P2, __label_3
.annotate 'line', 10662
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 10664
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
.annotate 'line', 10665

.end # samehllas


.sub 'fullname' :method
.annotate 'line', 10668
    getattribute $P1, self, 'path'
    join $S1, '.', $P1
.annotate 'line', 10669
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
.annotate 'line', 10670
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 10672
    .return($S1)
  __label_2: # endif
.annotate 'line', 10673

.end # fullname


.sub 'getparrotkey' :method
.annotate 'line', 10676
    getattribute $P1, self, 'path'
.annotate 'line', 10677
    null $S1
.annotate 'line', 10678
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10679
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 10680
    .return($S1)
.annotate 'line', 10681

.end # getparrotkey


.sub 'getparrotrootkey' :method
.annotate 'line', 10684
    getattribute $P1, self, 'path'
.annotate 'line', 10685
    getattribute $P2, self, 'hll'
.annotate 'line', 10686
    set $S1, "[ '"
.annotate 'line', 10687
    if_null $P2, __label_1
    set $S3, $P2
.annotate 'line', 10690
    downcase $S2, $S3
    concat $S1, $S1, $S2
    goto __label_2
  __label_1: # else
.annotate 'line', 10693
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 10694
    concat $S1, $S1, "'"
.annotate 'line', 10695
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 10696
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 10697
    concat $S1, $S1, " ]"
.annotate 'line', 10698
    .return($S1)
.annotate 'line', 10699

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
.annotate 'line', 10702
    getattribute $P1, self, 'path'
.annotate 'line', 10703
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 10704
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10705
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 10706
    __ARG_1.'say'("]")
.annotate 'line', 10707

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10710
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10712
    $P3 = self.'getparrotkey'()
.annotate 'line', 10711
    $P2 = WSubId_26("    new %0, %1", __ARG_3, $P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10715
    $P5 = self.'getparrotrootkey'()
.annotate 'line', 10714
    $P4 = WSubId_26("    root_new %0, %1", __ARG_3, $P5)
    __ARG_1.'print'($P4)
  __label_2: # endif
.annotate 'line', 10716
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 10717
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 10718
    __ARG_1.'say'()
.annotate 'line', 10719

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 10722
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10723
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10725
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
.annotate 'line', 10726

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10729
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 10731
    $P5 = self.'getparrotkey'()
.annotate 'line', 10730
    $P4 = WSubId_26("    get_class %0, %1", __ARG_3, $P5)
    __ARG_1.'say'($P4)
    goto __label_2
  __label_1: # else
.annotate 'line', 10736
    getattribute $P1, self, 'hll'
.annotate 'line', 10737
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 10738
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 10739
    if_null $P1, __label_5
    set $S3, $P1
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 10740
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 10743
    join $S3, "'; '", $P2
.annotate 'line', 10741
    $P3 = WSubId_26("    get_root_global %0, ['%1'; '%2'], '%3'", __ARG_3, $S2, $S3, $S1)
    __ARG_1.'say'($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 10745
    $P4 = WSubId_26("    get_root_global %0, ['%1'], '%2'", __ARG_3, $S2, $S1)
    __ARG_1.'say'($P4)
  __label_7: # endif
.annotate 'line', 10748
    $P3 = WSubId_26("    get_class %0, %0", __ARG_3)
    __ARG_1.'say'($P3)
  __label_2: # endif
.annotate 'line', 10750

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 10753
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10754
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10756
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
.annotate 'line', 10757

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 10633
    addattribute $P0, 'hll'
.annotate 'line', 10634
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_128 = "WSubId_128"
.annotate 'line', 10776
    self.'VarContainer'()
.annotate 'line', 10777
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 10778
    unless_null __ARG_2, __label_1
.annotate 'line', 10779
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 10780
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10781
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 10782
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P2.'FunctionContainer'()
    set $P2, $P2
    setattribute self, 'funcont', $P2
.annotate 'line', 10783
    $P1 = __ARG_1.'fullname'()
    WSubId_128(self, '__NAMESPACE__', $P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 10786
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 10787
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 10788
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10789
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 10790
    getattribute $P2, __ARG_2, 'funcont'
    setattribute self, 'funcont', $P2
  __label_2: # endif
.annotate 'line', 10792
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
.annotate 'line', 10793

.end # NamespaceBase


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10796
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 10797

.end # addfunction


.sub 'fixnamespaces' :method
.annotate 'line', 10800
    null $P1
.annotate 'line', 10801
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10802
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10803
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 10804
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 10805
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
.annotate 'line', 10806

.end # fixnamespaces


.sub 'getpath' :method
.annotate 'line', 10809
    getattribute $P1, self, 'nspath'
    .return($P1)
.annotate 'line', 10810

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 10813
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 10814
    .return()
  __label_1: # endif
.annotate 'line', 10815
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10816
    $P2 = WSubId_124($P1, __ARG_1)
    if_null $P2, __label_2
.annotate 'line', 10817
    .return()
  __label_2: # endif
.annotate 'line', 10818
    push $P1, __ARG_1
.annotate 'line', 10819

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
.annotate 'line', 10822
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 10823
    if_null $P1, __label_1
.annotate 'line', 10824
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 10825
    self.'addfunction'($P1)
  __label_3: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 10828
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 10829
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 10830
    if_null $P2, __label_5
.annotate 'line', 10831
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 10832
    if_null $P1, __label_6
.annotate 'line', 10833
    self.'createvarused'($S1, $P1)
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif
.annotate 'line', 10836

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
.annotate 'line', 10839
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10840
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10841
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 10842
    .return($P2)
.annotate 'line', 10843

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
.annotate 'line', 10846
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10847
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10848
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10849
    .tailcall self.'getusedns'(__ARG_1)
.annotate 'line', 10850

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10854
    new $P3, [ 'Winxed'; 'Compiler'; 'External' ]
    $P3.'External'(__ARG_1, __ARG_2)
    set $P1, $P3
.annotate 'line', 10855
    getattribute $P2, self, 'externals'
.annotate 'line', 10856
    unless_null $P2, __label_1
.annotate 'line', 10857
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10859
    push $P2, $P1
  __label_2: # endif
.annotate 'line', 10860

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
.annotate 'line', 10864
    null $P1
.annotate 'line', 10865
    getattribute $P3, self, 'classes'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10866
    getattribute $P5, $P1, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10867
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10868
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_5
    iter $P6, $P3
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P2, $P6
.annotate 'line', 10869
    $P1 = $P2.'checkclass_base'(__ARG_1)
    if_null $P1, __label_6
.annotate 'line', 10870
    .return($P1)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P3
.annotate 'line', 10871
    .return($P3)
.annotate 'line', 10872

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
.annotate 'line', 10875
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10876
    if_null $P1, __label_1
.annotate 'line', 10877
    .return($P1)
  __label_1: # endif
.annotate 'line', 10878
    getattribute $P2, self, 'funcont'
.annotate 'line', 10879
    .tailcall $P2.'find'(__ARG_1)
.annotate 'line', 10880

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
.annotate 'line', 10885
    elements $I1, __ARG_1
.annotate 'line', 10886
    null $S1
.annotate 'line', 10887
    null $P1
.annotate 'line', 10888
    null $P2
    sub $I2, $I1, __ARG_3
    if $I2 == 0 goto __label_3
    if $I2 == 1 goto __label_4
    goto __label_1
  __label_3: # case
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 10893
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
    if __ARG_2 == 1 goto __label_7
    if __ARG_2 == 2 goto __label_8
    goto __label_5
  __label_7: # case
.annotate 'line', 10896
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 10898
    .tailcall self.'checkclass_base'($S1)
  __label_5: # default
.annotate 'line', 10901
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 10902
    .return($P1)
  __label_9: # endif
.annotate 'line', 10903
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 10904
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 10905
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_6: # switch end
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 10912
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 10913
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 10914
    isnull $I6, $P2
    not $I6
    unless $I6 goto __label_14
.annotate 'line', 10915
    add $I7, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I7)
    isnull $I6, $P1
    not $I6
  __label_14:
    unless $I6 goto __label_13
.annotate 'line', 10916
    .return($P1)
  __label_13: # endif
.annotate 'line', 10917
    $P2 = self.'getusedns'($S1)
.annotate 'line', 10918
    isnull $I8, $P2
    not $I8
    unless $I8 goto __label_16
.annotate 'line', 10919
    add $I9, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I9)
    isnull $I8, $P1
    not $I8
  __label_16:
    unless $I8 goto __label_15
.annotate 'line', 10920
    .return($P1)
  __label_15: # endif
  __label_2: # switch end
    null $P3
.annotate 'line', 10922
    .return($P3)
.annotate 'line', 10923

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10926
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P3
    $P2.'NamespaceStatement'(self, __ARG_1, $P3, __ARG_2, $P3)
    set $P1, $P2
.annotate 'line', 10927
    getattribute $P2, self, 'namespaces'
    push $P2, $P1
.annotate 'line', 10928
    .return($P1)
.annotate 'line', 10929

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10932
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 10933
    new $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
    set $P2, $P3
.annotate 'line', 10934
    getattribute $P3, self, 'namespaces'
    push $P3, $P2
.annotate 'line', 10935
    getattribute $P3, self, 'items'
    push $P3, $P2
.annotate 'line', 10936
    .return($P2)
.annotate 'line', 10937

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
.annotate 'line', 10940
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 10941

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
.annotate 'line', 10944
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 10945
    getattribute $P1, self, 'items'
    push $P1, __ARG_1
.annotate 'line', 10946

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 10949
    $P1 = __ARG_2.'get'()
.annotate 'line', 10950
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10951
    $P1 = __ARG_2.'get'()
.annotate 'line', 10953
    set $P2, self
  __label_4: # for condition
.annotate 'line', 10954
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 10955
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10956
    $P5 = __ARG_2.'get'()
    set $S1, $P5
  __label_2: # for iteration
.annotate 'line', 10954
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10959
    null $P3
.annotate 'line', 10960
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 10961
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10962
    $P1 = __ARG_2.'get'()
  __label_5: # endif
.annotate 'line', 10965
    WSubId_4('{', $P1)
.annotate 'line', 10966
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10967
    $P4.'parse'(__ARG_2)
.annotate 'line', 10968

.end # parsenamespace


.sub 'parseextern' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 10973
    $P1 = __ARG_1.'get'()
.annotate 'line', 10974
    $P3 = $P1.'iskeyword'('function')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 10975
    WSubId_1('Unsupported extern', $P1)
  __label_1: # endif
.annotate 'line', 10976
    $P1 = __ARG_1.'get'()
.annotate 'line', 10977
    WSubId_108($P1)
.annotate 'line', 10978
    WSubId_68(';', __ARG_1)
.annotate 'line', 10979
    new $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P3.'FunctionExtern'($P1, self)
    set $P2, $P3
.annotate 'line', 10980
    self.'addfunction'($P2)
.annotate 'line', 10981

.end # parseextern


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_132 = "WSubId_132"
.const 'Sub' WSubId_133 = "WSubId_133"
.const 'Sub' WSubId_134 = "WSubId_134"
.const 'Sub' WSubId_135 = "WSubId_135"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_55 = "WSubId_55"
.annotate 'line', 10984
    getattribute $P1, self, 'items'
.annotate 'line', 10985
    null $P2
.annotate 'line', 10986
    $P2 = __ARG_1.'get'()
  __label_3: # for condition
    $P5 = $P2.'iseof'()
    if $P5 goto __label_4
    $P5 = $P2.'isop'('}')
  __label_4:
    isfalse $I1, $P5
    unless $I1 goto __label_2
.annotate 'line', 10988
    $P6 = $P2.'checkkeyword'()
    set $S2, $P6
    if $S2 == 'namespace' goto __label_7
    if $S2 == 'const' goto __label_8
    if $S2 == 'function' goto __label_9
    if $S2 == 'class' goto __label_10
    if $S2 == 'extern' goto __label_11
    if $S2 == 'using' goto __label_12
    if $S2 == '$include_const' goto __label_13
    if $S2 == '$include' goto __label_14
    if $S2 == '$load' goto __label_15
    if $S2 == '$loadlib' goto __label_16
    goto __label_5
  __label_7: # case
.annotate 'line', 10990
    self.'parsenamespace'($P2, __ARG_1)
    goto __label_6 # break
  __label_8: # case
.annotate 'line', 10993
    $P3 = WSubId_58($P2, __ARG_1, self)
.annotate 'line', 10994
    push $P1, $P3
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 10997
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P7.'FunctionStatement'($P2, __ARG_1, self)
    set $P4, $P7
.annotate 'line', 10998
    getattribute $P8, $P4, 'name'
    null $S1
    if_null $P8, __label_17
    set $S1, $P8
  __label_17:
.annotate 'line', 10999
    self.'addfunction'($P4)
.annotate 'line', 11000
    push $P1, $P4
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 11003
    WSubId_132($P2, __ARG_1, self)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 11006
    self.'parseextern'(__ARG_1)
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 11009
    WSubId_133($P2, __ARG_1, self)
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 11012
    WSubId_134($P2, __ARG_1, self)
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 11015
    WSubId_135($P2, __ARG_1, self)
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 11018
    $P2 = __ARG_1.'get'()
.annotate 'line', 11019
    $P9 = $P2.'isstring'()
    isfalse $I2, $P9
    unless $I2 goto __label_18
.annotate 'line', 11020
    WSubId_54('string literal', $P2)
  __label_18: # endif
.annotate 'line', 11021
    WSubId_68(';', __ARG_1)
.annotate 'line', 11022
    new $P12, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P12.'StringLiteral'(self, $P2)
    set $P11, $P12
    $P10 = $P11.'getPirString'()
    self.'addload'($P10)
    goto __label_6 # break
  __label_16: # case
.annotate 'line', 11025
    $P2 = __ARG_1.'get'()
.annotate 'line', 11026
    $P13 = $P2.'isstring'()
    isfalse $I3, $P13
    unless $I3 goto __label_19
.annotate 'line', 11027
    WSubId_54('string literal', $P2)
  __label_19: # endif
.annotate 'line', 11028
    WSubId_68(';', __ARG_1)
.annotate 'line', 11029
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P2)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addlib'($P14)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 11032
    WSubId_55("token", $P2)
  __label_6: # switch end
  __label_1: # for iteration
.annotate 'line', 10986
    $P2 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 11035
    $P5 = $P2.'iseof'()
    if_null $P5, __label_20
    unless $P5 goto __label_20
.annotate 'line', 11036
    self.'unclosed_ns'()
    goto __label_21
  __label_20: # else
.annotate 'line', 11038
    self.'close_ns'($P2)
  __label_21: # endif
.annotate 'line', 11039

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 11042
    getattribute $P1, self, 'items'
    WSubId_52($P1)
.annotate 'line', 11043

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 11046
    $P1 = self.'getpath'()
.annotate 'line', 11048
    set $I1, 1
.annotate 'line', 11050
    getattribute $P2, self, 'externals'
.annotate 'line', 11051
    if_null $P2, __label_1
.annotate 'line', 11052
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 11053
    null $I1
.annotate 'line', 11054
    WSubId_66(__ARG_1, $P2)
  __label_1: # endif
.annotate 'line', 11057
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
.annotate 'line', 11058
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 11059
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 11060
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 11062
    unless $I1 goto __label_7
.annotate 'line', 11063
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 11064
    null $I1
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 11066
    $P3.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
.annotate 'line', 11068

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 10764
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 10766
    addattribute $P0, 'nspath'
.annotate 'line', 10767
    addattribute $P0, 'externals'
.annotate 'line', 10768
    addattribute $P0, 'namespaces'
.annotate 'line', 10769
    addattribute $P0, 'classes'
.annotate 'line', 10770
    addattribute $P0, 'funcont'
.annotate 'line', 10771
    addattribute $P0, 'items'
.annotate 'line', 10772
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 11086
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 11087
    null $I1
.annotate 'line', 11088
    if_null __ARG_5, __label_1
.annotate 'line', 11089
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 11090
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 11091
    set $I1, 1
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 11094
    unless $I1 goto __label_4
.annotate 'line', 11095
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 11096
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 11097
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 11099
    setattribute self, 'parent', __ARG_1
.annotate 'line', 11100
    setattribute self, 'start', __ARG_2
.annotate 'line', 11101
    setattribute self, 'owner', __ARG_1
.annotate 'line', 11102
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 11103

.end # NamespaceStatement


.sub 'dowarnings' :method
.annotate 'line', 11106
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 11107

.end # dowarnings


.sub 'generatesubid' :method
.annotate 'line', 11110
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 11111

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 11114
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 11115

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 11118
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
.annotate 'line', 11119

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 11122
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
.annotate 'line', 11123

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 11126
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 11127
    unless_null $P1, __label_1
.annotate 'line', 11128
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 11129
    .return($P1)
.annotate 'line', 11130

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 11133
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11134
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 11135
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 11136
    .return($P1)
.annotate 'line', 11137

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 11140
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
.annotate 'line', 11141

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1

.end # close_ns


.sub 'optimize' :method
.annotate 'line', 11148
    getattribute $P1, self, 'modifier'
.annotate 'line', 11149
    if_null $P1, __label_1
.annotate 'line', 11150
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 11151
    self.'optimize_base'()
.annotate 'line', 11152
    .return(self)
.annotate 'line', 11153

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 11156
    getattribute $P1, self, 'hll'
.annotate 'line', 11157
    if_null $P1, __label_1
.annotate 'line', 11158
    $P2 = WSubId_26(".HLL '%0'", $P1)
    __ARG_1.'say'($P2)
  __label_1: # endif
.annotate 'line', 11160
    self.'emit_base'(__ARG_1)
.annotate 'line', 11162
    if_null $P1, __label_2
.annotate 'line', 11163
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
.annotate 'line', 11164

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 11075
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 11077
    addattribute $P0, 'parent'
.annotate 'line', 11078
    addattribute $P0, 'start'
.annotate 'line', 11079
    addattribute $P0, 'name'
.annotate 'line', 11080
    addattribute $P0, 'modifier'
.annotate 'line', 11081
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_loadlib' :subid('WSubId_136')
        .param string __ARG_1
.annotate 'line', 11173
    concat $S1, '.loadlib ', __ARG_1
    .return($S1)
.annotate 'line', 11174

.end # emit_loadlib


.sub 'emit_loadbytecode' :subid('WSubId_137')
        .param string __ARG_1
.annotate 'line', 11178
    concat $S1, '    load_bytecode ', __ARG_1
    .return($S1)
.annotate 'line', 11179

.end # emit_loadbytecode

.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
.annotate 'line', 11191
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 11192
    setattribute self, 'unit', __ARG_1
.annotate 'line', 11193
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 11194
    box $P1, 0
    setattribute self, 'subidgen', $P1
.annotate 'line', 11195

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 11198
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 11199
    $P1[__ARG_1] = 1
.annotate 'line', 11200

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 11204
    getattribute $P1, self, 'subidgen'
    inc $P1
    set $I1, $P1
.annotate 'line', 11205
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
.annotate 'line', 11206

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 11210
    getattribute $P1, self, 'libs'
.annotate 'line', 11211
    unless_null $P1, __label_1
.annotate 'line', 11212
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 11213
    $P1[__ARG_1] = 1
.annotate 'line', 11214

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 11217
    getattribute $P1, self, 'loads'
.annotate 'line', 11218
    unless_null $P1, __label_1
.annotate 'line', 11219
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 11220
    $P1[__ARG_1] = 1
.annotate 'line', 11221

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 11224
    .tailcall self.'checkclass_base'(__ARG_1)
.annotate 'line', 11225

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 11228
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11229

.end # scopesearch


.sub 'unclosed_ns' :method

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 11236
    WSubId_1('Cannot close root namespace', __ARG_1)
.annotate 'line', 11237

.end # close_ns


.sub 'dowarnings' :method
.annotate 'line', 11240
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 11241

.end # dowarnings


.sub 'optimize' :method
.annotate 'line', 11244
    self.'optimize_base'()
.annotate 'line', 11245
    .return(self)
.annotate 'line', 11246

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_136 = "WSubId_136"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_137 = "WSubId_137"
.annotate 'line', 11249
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 11252
    $P4 = $P1['chomp']
    if_null $P4, __label_1
.annotate 'line', 11253
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 11257
    split $P4, " ", "acos asin atan cos exp ln sin tan pow"
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $S1, $P5
.annotate 'line', 11258
    $P6 = $P1[$S1]
    if_null $P6, __label_4
.annotate 'line', 11259
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 11263
    getattribute $P2, self, 'libs'
.annotate 'line', 11264
    if_null $P2, __label_5
.annotate 'line', 11265
    root_new $P6, ['parrot';'ResizablePMCArray']
    $P4 = WSubId_31($P2, $P6, WSubId_136)
    join $S2, "\n", $P4
    __ARG_1.'say'($S2)
  __label_5: # endif
.annotate 'line', 11267
    getattribute $P3, self, 'loads'
.annotate 'line', 11268
    if_null $P3, __label_6
.annotate 'line', 11275
    root_new $P7, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_31($P3, $P7, WSubId_137)
    join $S2, "\n", $P6
.annotate 'line', 11269
    $P4 = WSubId_26(".sub initial_load_bytecode :anon :load :init\n%0\n.end\n", $S2)
    __ARG_1.'say'($P4)
  __label_6: # endif
.annotate 'line', 11277
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_8
    isnull $I1, $P3
    not $I1
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 11278
    __ARG_1.'comment'('end libs')
  __label_7: # endif
.annotate 'line', 11280
    self.'emit_base'(__ARG_1)
.annotate 'line', 11281

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 11284
    getattribute $P1, self, 'locals'
.annotate 'line', 11285
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
.annotate 'line', 11286
    $P2 = $P1[$S1]
.annotate 'line', 11287
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 11288
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 11289
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 11291
    $P3 = $P2.'getvalue'()
.annotate 'line', 11292
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11294

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 11181
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 11183
    addattribute $P0, 'unit'
.annotate 'line', 11184
    addattribute $P0, 'bultins_used'
.annotate 'line', 11185
    addattribute $P0, 'libs'
.annotate 'line', 11186
    addattribute $P0, 'loads'
.annotate 'line', 11187
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11306
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 11307
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
.annotate 'line', 11308

.end # Builtin


.sub 'getname' :method
.annotate 'line', 11309
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
.annotate 'line', 11312
    getattribute $P1, self, 'variants'
    push $P1, __ARG_1
.annotate 'line', 11313

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 11302
    addattribute $P0, 'name'
.annotate 'line', 11303
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
.annotate 'line', 11323
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
.annotate 'line', 11324

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 11327
    getattribute $P1, self, 'entries'
.annotate 'line', 11328
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 11329
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 11330
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 11332
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
.annotate 'line', 11333

.end # add


.sub 'put' :method
        .param pmc __ARG_1
.annotate 'line', 11336
    getattribute $P1, self, 'entries'
.annotate 'line', 11337
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 11338
    $P3 = $P1[$S1]
    __ARG_1.'addfunction'($P3)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11339

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 11320
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_139 = "WSubId_139"
.annotate 'line', 11349
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 11350
    new $P4, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P4.'RootNamespace'(self)
    set $P1, $P4
.annotate 'line', 11354
    WSubId_138($P1, 'false', 0)
.annotate 'line', 11355
    WSubId_138($P1, 'true', 1)
.annotate 'line', 11360
    WSubId_128($P1, '__STAGE__', "3")
.annotate 'line', 11363
    WSubId_138($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 11366
    WSubId_138($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 11369
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 11371
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
    set $P3, $P3
.annotate 'line', 11372
    WSubId_139($P3)
.annotate 'line', 11373
    $P3.'put'($P2)
.annotate 'line', 11375
    $P1.'usenamespace'($P2)
.annotate 'line', 11377
    setattribute self, 'rootns', $P1
.annotate 'line', 11378

.end # WinxedCompileUnit


.sub 'dowarnings' :method
.annotate 'line', 11381
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
.annotate 'line', 11382

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 11385
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 11386
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
.annotate 'line', 11387

.end # parse


.sub 'optimize' :method
.annotate 'line', 11390
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
.annotate 'line', 11391

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 11394
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 11395
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 11396
    __ARG_1.'say'('')
.annotate 'line', 11398
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 11400
    __ARG_1.'comment'('End generated code')
.annotate 'line', 11401

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 11404
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 11405
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 11407
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 11409
    __ARG_1.'comment'('End')
.annotate 'line', 11410

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 11344
    addattribute $P0, 'rootns'
.annotate 'line', 11345
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
.annotate 'line', 11419
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 5
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 11420
    .return($P1)
.annotate 'line', 11421

.end # version


.sub 'version_string' :method
.annotate 'line', 11424
    $P1 = self.'version'()
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
.annotate 'line', 11425

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
        .param int __ARG_6
.annotate 'line', 11428
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 11429
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 11430
    null $P1
.annotate 'line', 11431
    unless_null __ARG_3, __label_2
.annotate 'line', 11432
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11433
    $P1.'open'('__eval__', 'w')
    goto __label_3
  __label_2: # else
.annotate 'line', 11436
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 11437
    new $P5, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P5.'Emit'($P1, __ARG_6)
    set $P2, $P5
.annotate 'line', 11438
    unless __ARG_4 goto __label_4
.annotate 'line', 11439
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 11440
    unless __ARG_5 goto __label_5
.annotate 'line', 11441
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 11442
    __ARG_1.'emit'($P2)
.annotate 'line', 11443
    $P2.'close'()
.annotate 'line', 11444
    if_null __ARG_3, __label_6
.annotate 'line', 11445
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
.annotate 'line', 11447
    $P1.'close'()
.annotate 'line', 11448
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 11449
    null $P3
    set $S2, __ARG_2
    if $S2 == 'pir' goto __label_11
    if $S2 == 'pbc' goto __label_12
    if $S2 == '' goto __label_13
    goto __label_9
  __label_11: # case
.annotate 'line', 11452
    new $P3, [ 'String' ]
.annotate 'line', 11453
    assign $P3, $S1
    goto __label_10 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 11457
    compreg $P4, 'PIR'
.annotate 'line', 11458
    $P3 = $P4($S1)
    goto __label_10 # break
  __label_9: # default
.annotate 'line', 11461
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
    die $S5
  __label_10: # switch end
.annotate 'line', 11463
    .return($P3)
  __label_7: # endif
.annotate 'line', 11465

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
.annotate 'line', 11468
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11469
    $P1.'open'('__eval__', 'w')
.annotate 'line', 11470
    new $P3, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P3.'Emit'($P1, 1)
    set $P2, $P3
.annotate 'line', 11471
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 11472
    $P2.'close'()
.annotate 'line', 11473
    $P1.'close'()
.annotate 'line', 11474
    .tailcall $P1.'read'(0)
.annotate 'line', 11475

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 11483
    unless_null __ARG_2, __label_1
.annotate 'line', 11484
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 11485
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11486
    $P1.'open'('__eval__', 'w')
.annotate 'line', 11487
    $P1.'puts'(__ARG_1)
.annotate 'line', 11488
    $P1.'close'()
.annotate 'line', 11489
    $P1.'open'('__eval__', 'r')
.annotate 'line', 11490
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, '__eval__', __ARG_6)
    set $P2, $P4
.annotate 'line', 11491
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
.annotate 'line', 11492
    $P3.'parse'($P2)
.annotate 'line', 11493
    $P1.'close'()
.annotate 'line', 11494
    $P3.'optimize'()
.annotate 'line', 11495
    ne __ARG_2, 'include', __label_2
.annotate 'line', 11496
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 11498
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 11499

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 11508
    unless_null __ARG_2, __label_1
.annotate 'line', 11509
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 11510
    new $P1, [ 'FileHandle' ]
.annotate 'line', 11511
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 11512
    $P1.'encoding'('utf8')
.annotate 'line', 11513
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, __ARG_1, __ARG_6)
    set $P2, $P4
.annotate 'line', 11514
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
.annotate 'line', 11515
    $P3.'parse'($P2)
.annotate 'line', 11516
    $P1.'close'()
.annotate 'line', 11517
    $P3.'optimize'()
.annotate 'line', 11518
    ne __ARG_2, 'include', __label_2
.annotate 'line', 11519
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 11521
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 11522

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
.annotate 'line', 11531
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 11532
    compreg 'winxed', $P1
.annotate 'line', 11533

.end # initializer

# End generated code
