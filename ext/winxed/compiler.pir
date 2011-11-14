# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ 'Winxed'; 'Compiler' ]

.sub 'isspace' :subid('WSubId_21')
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


.sub 'isidentstart' :subid('WSubId_22')
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

.sub 'Warn' :subid('WSubId_24')
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
    $P2 = __ARG_2.'show'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 130
    concat $S2, __ARG_1, ' near '
    concat $S2, $S2, $S1
    set __ARG_1, $S2
  __label_1: # endif
.annotate 'line', 132
    unless __ARG_3 goto __label_4
.annotate 'line', 133
    new $P2, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 134
    $P3 = __ARG_2.'filename'()
    $P4 = __ARG_2.'linenum'()
    $P2.'WinxedCompilerError'('internal', __ARG_1, $P3, $P4)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 135
    new $P6, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P6.'WinxedCompilerError'('internal', __ARG_1)
    set $P5, $P6
    set $P1, $P5
  __label_3:
.annotate 'line', 136
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2
.annotate 'line', 137

.end # InternalError


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 141
    $P1 = __ARG_2.'linenum'()
    set $I1, $P1
.annotate 'line', 142
    $P1 = __ARG_2.'filename'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 143
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S4, ' near ', $S3
    set $S2, $S4
.annotate 'line', 144
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
.annotate 'line', 146
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
.annotate 'line', 147
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
.annotate 'line', 144
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1
.annotate 'line', 148

.end # SyntaxError


.sub 'NoLeftSide' :subid('WSubId_73')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 152
    WSubId_1('Not a left-side expression', __ARG_1)
.annotate 'line', 153

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_54')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 157
    concat $S1, "Expected ", __ARG_1
    WSubId_1($S1, __ARG_2)
.annotate 'line', 158

.end # Expected


.sub 'Unexpected' :subid('WSubId_55')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 162
    concat $S1, "Unexpected ", __ARG_1
    WSubId_1($S1, __ARG_2)
.annotate 'line', 163

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 167
    WSubId_1("Expected identifier", __ARG_1)
.annotate 'line', 168

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 172
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_1($S1, __ARG_2)
.annotate 'line', 173

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
.annotate 'line', 177
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 178
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 179

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
.annotate 'line', 183
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 184
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 185

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_108')
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.annotate 'line', 189
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 190
    WSubId_3(__ARG_1)
  __label_1: # endif
.annotate 'line', 191

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_68')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 195
    $P1 = __ARG_2.'get'()
.annotate 'line', 196
    WSubId_4(__ARG_1, $P1)
.annotate 'line', 197

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_110')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 201
    $P1 = __ARG_2.'get'()
.annotate 'line', 202
    WSubId_5(__ARG_1, $P1)
.annotate 'line', 203

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_75')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 207
    set $S1, __ARG_1
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    WSubId_1($S2, __ARG_1)
.annotate 'line', 208

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
.annotate 'line', 220
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 221
    box $P1, __ARG_2
    setattribute self, 'line', $P1
.annotate 'line', 222

.end # Token


.sub 'iseof' :method
.annotate 'line', 224
    .return(0)

.end # iseof


.sub 'iscomment' :method
.annotate 'line', 225
    .return(0)

.end # iscomment


.sub 'isidentifier' :method
.annotate 'line', 226
    .return(0)

.end # isidentifier


.sub 'isint' :method
.annotate 'line', 227
    .return(0)

.end # isint


.sub 'isfloat' :method
.annotate 'line', 228
    .return(0)

.end # isfloat


.sub 'isstring' :method
.annotate 'line', 229
    .return(0)

.end # isstring


.sub 'issinglequoted' :method
.annotate 'line', 230
    .return(0)

.end # issinglequoted


.sub 'getintvalue' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 234
    WSubId_6('Not a literal int', self)
.annotate 'line', 235

.end # getintvalue


.sub 'rawstring' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 238
    WSubId_6('Not a literal string', self)
.annotate 'line', 239

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_3 = "WSubId_3"
.annotate 'line', 242
    WSubId_3(self)
.annotate 'line', 243

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
.annotate 'line', 244
    .return(0)

.end # iskeyword


.sub 'checkkeyword' :method
.annotate 'line', 245
    .return(0)

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
.annotate 'line', 246
    .return(0)

.end # isop


.sub 'checkop' :method
.annotate 'line', 247
    .return('')

.end # checkop


.sub 'viewable' :method
.annotate 'line', 248
    .return('(unknown)')

.end # viewable


.sub 'filename' :method
.annotate 'line', 249
    getattribute $P1, self, 'file'
    .return($P1)

.end # filename


.sub 'linenum' :method
.annotate 'line', 250
    getattribute $P1, self, 'line'
    .return($P1)

.end # linenum


.sub 'show' :method
.annotate 'line', 253
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 254
    getattribute $P1, self, 'file'
    set $S2, $P1
    getattribute $P2, self, 'line'
    set $S3, $P2
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
.annotate 'line', 255

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
.annotate 'line', 216
    addattribute $P0, 'file'
.annotate 'line', 217
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
.annotate 'line', 262
    self.'Token'(__ARG_1, 0)
.annotate 'line', 263

.end # TokenEof


.sub 'iseof' :method
.annotate 'line', 264
    .return(1)

.end # iseof


.sub 'viewable' :method
.annotate 'line', 265
    .return('(End of file)')

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 258
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 273
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 274
    box $P1, __ARG_3
    setattribute self, 'str', $P1
.annotate 'line', 275

.end # TokenWithVal


.sub 'get_string' :method :vtable
.annotate 'line', 276
    getattribute $P1, self, 'str'
    .return($P1)

.end # get_string


.sub 'viewable' :method
.annotate 'line', 279
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 280

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 268
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 270
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 287
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 288

.end # TokenComment


.sub 'iscomment' :method
.annotate 'line', 289
    .return(1)

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 283
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 296
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 297

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
.annotate 'line', 300
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
.annotate 'line', 301

.end # isop


.sub 'checkop' :method
.annotate 'line', 304
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
.annotate 'line', 305

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 292
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 312
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 313

.end # TokenIdentifier


.sub 'isidentifier' :method
.annotate 'line', 314
    .return(1)

.end # isidentifier


.sub 'getidentifier' :method
.annotate 'line', 317
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 318

.end # getidentifier


.sub 'checkkeyword' :method
.annotate 'line', 321
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
.annotate 'line', 322

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
.annotate 'line', 325
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
.annotate 'line', 326

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 308
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
.annotate 'line', 331
    .return(1)

.end # isstring


.sub 'rawstring' :method
.annotate 'line', 334
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 335

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 329
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 342
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 343

.end # TokenQuoted


.sub 'get_string' :method :vtable
.annotate 'line', 346
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
.annotate 'line', 347

.end # get_string


.sub 'viewable' :method
.annotate 'line', 350
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
.annotate 'line', 351

.end # viewable


.sub 'getasquoted' :method
.annotate 'line', 354
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 355

.end # getasquoted


.sub 'getPirString' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 358
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 359
    null $S2
.annotate 'line', 360
    new $P1, 'ExceptionHandler'
    set_label $P1, __label_2
    push_eh $P1
.annotate 'line', 361
    $P0 = new ['String']
    $P0 = $S1
    $S2 = $P0.'unescape'('utf8')
    pop_eh
    goto __label_3
  __label_2:
.annotate 'line', 360
    .get_results($P2)
    finalize $P2
    pop_eh
.annotate 'line', 364
    WSubId_1("Invalid escape sequence in literal string", self)
  __label_3:
.annotate 'line', 366
    null $I1
.annotate 'line', 367
    box $P1, $S2
    if_null $P1, __label_5
    iter $P3, $P1
    set $P3, 0
  __label_4: # for iteration
    unless $P3 goto __label_5
    shift $I2, $P3
.annotate 'line', 368
    le $I2, 127, __label_6
.annotate 'line', 369
    set $I1, 1
    goto __label_5 # break
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
.annotate 'line', 373
    escape $S1, $S2
.annotate 'line', 374
    unless $I1 goto __label_8
    set $S3, "utf8:"
    goto __label_7
  __label_8:
    set $S3, ""
  __label_7:
.annotate 'line', 375
    concat $S4, $S3, '"'
    concat $S4, $S4, $S1
    concat $S4, $S4, '"'
    .return($S4)
.annotate 'line', 376

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
.annotate 'line', 338
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 383
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 384

.end # TokenSingleQuoted


.sub 'issinglequoted' :method
.annotate 'line', 385
    .return(1)

.end # issinglequoted


.sub 'get_string' :method :vtable
.annotate 'line', 388
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
.annotate 'line', 389

.end # get_string


.sub 'viewable' :method
.annotate 'line', 392
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
.annotate 'line', 393

.end # viewable


.sub 'getasquoted' :method
.annotate 'line', 396
    set $S1, ''
.annotate 'line', 397
    getattribute $P1, self, 'str'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
.annotate 'line', 398
    if $S2 == '"' goto __label_5
    if $S2 == '\' goto __label_6
    if $S2 == "'" goto __label_7
    goto __label_4
  __label_5: # case
  __label_6: # case
  __label_7: # case
.annotate 'line', 402
    concat $S4, '\', $S2
    set $S2, $S4
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 405
    concat $S1, $S1, $S2
    goto __label_1
  __label_2: # endfor
.annotate 'line', 407
    .return($S1)
.annotate 'line', 408

.end # getasquoted


.sub 'getPirString' :method
.annotate 'line', 411
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 412
    set $S2, "'"
.annotate 'line', 413
    null $I1
.annotate 'line', 414
    box $P1, $S1
    if_null $P1, __label_3
    iter $P2, $P1
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $I2, $P2
.annotate 'line', 415
    islt $I5, $I2, 32
    if $I5 goto __label_5
    isgt $I5, $I2, 127
  __label_5:
    unless $I5 goto __label_4
.annotate 'line', 416
    set $I1, 1
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 420
    null $I3
.annotate 'line', 421
    unless $I1 goto __label_6
.annotate 'line', 422
    set $S2, '"'
.annotate 'line', 423
    set $S3, ''
.annotate 'line', 424
    box $P1, $S1
    if_null $P1, __label_8
    iter $P3, $P1
    set $P3, 0
  __label_7: # for iteration
    unless $P3 goto __label_8
    shift $S4, $P3
.annotate 'line', 425
    ne $S4, '\', __label_9
.annotate 'line', 426
    concat $S3, $S3, '\\'
    goto __label_10
  __label_9: # else
.annotate 'line', 429
    ord $I4, $S4
.annotate 'line', 430
    islt $I5, $I4, 32
    if $I5 goto __label_13
    isgt $I5, $I4, 127
  __label_13:
    unless $I5 goto __label_11
.annotate 'line', 431
    le $I4, 127, __label_14
.annotate 'line', 432
    set $I3, 1
  __label_14: # endif
.annotate 'line', 433
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_15
    set $S5, $P1
  __label_15:
.annotate 'line', 434
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
    goto __label_12
  __label_11: # else
.annotate 'line', 437
    concat $S3, $S3, $S4
  __label_12: # endif
  __label_10: # endif
    goto __label_7
  __label_8: # endfor
.annotate 'line', 440
    set $S1, $S3
  __label_6: # endif
.annotate 'line', 442
    concat $S6, $S2, $S1
    concat $S6, $S6, $S2
    set $S1, $S6
.annotate 'line', 443
    unless $I3 goto __label_16
.annotate 'line', 444
    concat $S6, 'utf8:', $S1
    set $S1, $S6
  __label_16: # endif
.annotate 'line', 445
    .return($S1)
.annotate 'line', 446

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 379
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 453
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 454

.end # TokenInteger


.sub 'isint' :method
.annotate 'line', 455
    .return(1)

.end # isint


.sub 'getintvalue' :method
.annotate 'line', 458
    getattribute $P1, self, 'str'
    set $I1, $P1
    .return($I1)
.annotate 'line', 459

.end # getintvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
.annotate 'line', 449
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 466
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 467

.end # TokenFloat


.sub 'isfloat' :method
.annotate 'line', 468
    .return(1)

.end # isfloat


.sub 'getfloatvalue' :method
.annotate 'line', 472
    getattribute $P1, self, 'str'
    set $N1, $P1
.annotate 'line', 473
    .return($N1)
.annotate 'line', 474

.end # getfloatvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
.annotate 'line', 462
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'TokenError' :subid('WSubId_7')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 484
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
.annotate 'line', 486
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
.annotate 'line', 484
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1
.annotate 'line', 487

.end # TokenError


.sub 'UnterminatedString' :subid('WSubId_8')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 491
    WSubId_7('Unterminated string', __ARG_1, __ARG_2)
.annotate 'line', 492

.end # UnterminatedString


.sub 'UnterminatedHeredoc' :subid('WSubId_9')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 496
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_2)
.annotate 'line', 497

.end # UnterminatedHeredoc


.sub 'UnclosedComment' :subid('WSubId_13')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 501
    WSubId_7("Unclosed comment", __ARG_1, __ARG_2)
.annotate 'line', 502

.end # UnclosedComment


.sub 'getquoted' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
.annotate 'line', 506
    set $S1, ''
.annotate 'line', 507
    null $S2
.annotate 'line', 508
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
.annotate 'line', 509
    if $S2 == "" goto __label_6
    if $S2 == "\n" goto __label_7
    if $S2 == '\' goto __label_8
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 512
    WSubId_8(__ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 515
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 516
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 517
    WSubId_8(__ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 518
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 521
    concat $S1, $S1, $S2
  __label_4: # switch end
  __label_1: # for iteration
.annotate 'line', 508
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 524
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 525

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
.annotate 'line', 529
    set $S1, ''
.annotate 'line', 530
    null $S2
.annotate 'line', 531
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
.annotate 'line', 532
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 533
    WSubId_8(__ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 534
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 531
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 536
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 537

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_18')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_9 = "WSubId_9"
.annotate 'line', 541
    set $S1, ''
.annotate 'line', 542
    null $S2
.annotate 'line', 543
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
.annotate 'line', 544
    if $S2 == '' goto __label_6
    if $S2 == '"' goto __label_7
    if $S2 == '\' goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 546
    WSubId_9(__ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 551
    concat $S6, '\', $S2
    set $S2, $S6
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 554
    concat $S5, $S1, $S2
    set $S1, $S5
  __label_1: # for iteration
.annotate 'line', 543
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 556
    concat $S5, $S1, ':>>'
    set $S1, $S5
.annotate 'line', 558
    set $S3, ''
.annotate 'line', 559
    null $S4
  __label_9: # do
.annotate 'line', 561
    set $S4, ''
.annotate 'line', 562
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
.annotate 'line', 563
    if $S2 == '' goto __label_17
    if $S2 == '"' goto __label_18
    if $S2 == '\' goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 565
    WSubId_9(__ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 568
    concat $S6, '\', $S2
    set $S2, $S6
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 571
    concat $S4, $S4, $S2
  __label_12: # for iteration
.annotate 'line', 562
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 573
    eq $S4, $S1, __label_20
.annotate 'line', 574
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
  __label_11: # continue
.annotate 'line', 575
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 576
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 577

.end # getheredoc


.sub 'getident' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_10 = "WSubId_10"
.annotate 'line', 581
    set $S1, __ARG_2
.annotate 'line', 582
    null $S2
.annotate 'line', 583
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    $P2 = WSubId_10($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 584
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 583
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_3
  __label_2: # for end
.annotate 'line', 585
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 586
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 587

.end # getident


.sub 'getnumber' :subid('WSubId_23')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_12 = "WSubId_12"
.annotate 'line', 591
    null $S1
.annotate 'line', 592
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 594
    concat $S1, $S1, $S2
.annotate 'line', 595
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # continue
.annotate 'line', 596
    $P1 = WSubId_11($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 597
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
.annotate 'line', 598
    null $I1
    null $I2
.annotate 'line', 599
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
    $P2 = WSubId_12($S2)
    set $I2, $P2
    lt $I2, 0, __label_8
.annotate 'line', 600
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 601
    concat $S1, $S1, $S2
  __label_7: # for iteration
.annotate 'line', 599
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 603
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 604
    set $S1, $I1
.annotate 'line', 605
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
.annotate 'line', 607
    ne $S2, '.', __label_10
  __label_12: # do
.annotate 'line', 609
    concat $S1, $S1, $S2
.annotate 'line', 610
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # continue
.annotate 'line', 611
    $P1 = WSubId_11($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 612
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
.annotate 'line', 613
    concat $S1, $S1, 'E'
.annotate 'line', 614
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
.annotate 'line', 615
    concat $S1, $S1, $S2
.annotate 'line', 616
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_17: # endif
  __label_21: # for condition
.annotate 'line', 618
    $P1 = WSubId_11($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 619
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 618
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_21
  __label_20: # for end
  __label_15: # endif
.annotate 'line', 621
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 622
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
    goto __label_11
  __label_10: # else
.annotate 'line', 625
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
.annotate 'line', 626
    concat $S1, $S1, 'E'
.annotate 'line', 627
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
.annotate 'line', 628
    concat $S1, $S1, $S2
.annotate 'line', 629
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_25: # endif
  __label_29: # for condition
.annotate 'line', 631
    $P1 = WSubId_11($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 632
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 631
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_29
  __label_28: # for end
.annotate 'line', 633
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 634
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
    goto __label_23
  __label_22: # else
.annotate 'line', 637
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 638
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
  __label_23: # endif
  __label_11: # endif
.annotate 'line', 641

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_19')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.annotate 'line', 645
    set $S1, __ARG_2
.annotate 'line', 646
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
.annotate 'line', 647
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 646
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 648
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 649

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_13 = "WSubId_13"
.annotate 'line', 653
    set $S1, __ARG_2
.annotate 'line', 654
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
  __label_7: # for condition
.annotate 'line', 656
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 657
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 656
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 658
    ne $S2, '', __label_9
.annotate 'line', 659
    WSubId_13(__ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 660
    concat $S1, $S1, $S2
.annotate 'line', 661
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 662
    ne $S2, '', __label_10
.annotate 'line', 663
    WSubId_13(__ARG_1, __ARG_3)
  __label_10: # endif
  __label_4: # continue
.annotate 'line', 664
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 665
    concat $S1, $S1, '/'
.annotate 'line', 666
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 667

.end # getcomment


.sub 'getop' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.annotate 'line', 671
    set $S1, __ARG_2
.annotate 'line', 672
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 673

.end # getop

.namespace [ 'Winxed'; 'Compiler'; 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_14 = "WSubId_14"
.const 'Sub' WSubId_15 = "WSubId_15"
.const 'Sub' WSubId_16 = "WSubId_16"
.const 'Sub' WSubId_17 = "WSubId_17"
.const 'Sub' WSubId_18 = "WSubId_18"
.const 'Sub' WSubId_19 = "WSubId_19"
.const 'Sub' WSubId_20 = "WSubId_20"
.annotate 'line', 689
    setattribute self, 'h', __ARG_1
.annotate 'line', 690
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 691
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 692
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 693
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 694
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 695
    root_new $P2, ['parrot';'Hash']
    $P2[''] = WSubId_14
    $P2['{'] = WSubId_15
    $P1['$'] = $P2
.annotate 'line', 696
    $P1['"'] = WSubId_16
.annotate 'line', 697
    $P1["'"] = WSubId_17
.annotate 'line', 698
    root_new $P3, ['parrot';'Hash']
.annotate 'line', 699
    root_new $P4, ['parrot';'Hash']
    $P4[''] = WSubId_15
    $P4['='] = WSubId_15
    $P3['='] = $P4
.annotate 'line', 700
    $P3[':'] = WSubId_15
    $P1['='] = $P3
.annotate 'line', 702
    root_new $P5, ['parrot';'Hash']
    $P5['+'] = WSubId_15
    $P5['='] = WSubId_15
    $P1['+'] = $P5
.annotate 'line', 703
    root_new $P6, ['parrot';'Hash']
    $P6['-'] = WSubId_15
    $P6['='] = WSubId_15
    $P1['-'] = $P6
.annotate 'line', 704
    root_new $P7, ['parrot';'Hash']
    $P7['='] = WSubId_15
    $P1['*'] = $P7
.annotate 'line', 705
    root_new $P8, ['parrot';'Hash']
    $P8['|'] = WSubId_15
    $P1['|'] = $P8
.annotate 'line', 706
    root_new $P9, ['parrot';'Hash']
    $P9['&'] = WSubId_15
    $P1['&'] = $P9
.annotate 'line', 707
    root_new $P10, ['parrot';'Hash']
.annotate 'line', 708
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_15
    $P11[':'] = WSubId_18
    $P10['<'] = $P11
.annotate 'line', 709
    $P10['='] = WSubId_15
    $P1['<'] = $P10
.annotate 'line', 711
    root_new $P12, ['parrot';'Hash']
    $P12['>'] = WSubId_15
    $P12['='] = WSubId_15
    $P1['>'] = $P12
.annotate 'line', 712
    root_new $P13, ['parrot';'Hash']
.annotate 'line', 713
    root_new $P14, ['parrot';'Hash']
    $P14[''] = WSubId_15
    $P14['='] = WSubId_15
    $P13['='] = $P14
    $P1['!'] = $P13
.annotate 'line', 715
    root_new $P15, ['parrot';'Hash']
    $P15['%'] = WSubId_15
    $P15['='] = WSubId_15
    $P1['%'] = $P15
.annotate 'line', 716
    root_new $P16, ['parrot';'Hash']
    $P16['='] = WSubId_15
    $P16['/'] = WSubId_19
    $P16['*'] = WSubId_20
    $P1['/'] = $P16
.annotate 'line', 717
    $P1['#'] = WSubId_19
.annotate 'line', 719
    setattribute self, 'select', $P1
.annotate 'line', 720

.end # Tokenizer


.sub 'getchar' :method
.annotate 'line', 723
    getattribute $P1, self, 'pending'
.annotate 'line', 724
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 725
    eq $S1, '', __label_2
.annotate 'line', 726
    assign $P1, ''
    goto __label_3
  __label_2: # else
.annotate 'line', 728
    getattribute $P2, self, 'h'
.annotate 'line', 729
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 730
    ne $S1, "\n", __label_4
.annotate 'line', 731
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 733
    .return($S1)
.annotate 'line', 734

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
.annotate 'line', 737
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
.annotate 'line', 738

.end # ungetchar


.sub 'get_token' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_14 = "WSubId_14"
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_23 = "WSubId_23"
.const 'Sub' WSubId_15 = "WSubId_15"
.annotate 'line', 741
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 742
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 744
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 745
    $P3 = WSubId_21($S1)
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 746
    $P4 = self.'getchar'()
    set $S1, $P4
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 747
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 748
    ne $S1, '', __label_5
.annotate 'line', 749
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
.annotate 'line', 750
    $P3 = WSubId_22($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 751
    .tailcall WSubId_14(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 752
    $P3 = WSubId_11($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 753
    .tailcall WSubId_23(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 755
    set $S2, $S1
.annotate 'line', 756
    getattribute $P1, self, 'select'
.annotate 'line', 757
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 759
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 760
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 761
    set $P1, $P2
.annotate 'line', 762
    $P2 = $P1[$S1]
.annotate 'line', 763
    unless_null $P2, __label_11
.annotate 'line', 764
    self.'ungetchar'($S1)
.annotate 'line', 765
    $P2 = $P1['']
    goto __label_12
  __label_11: # else
.annotate 'line', 768
    concat $S2, $S2, $S1
  __label_12: # endif
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 770
    if_null $P2, __label_14
.annotate 'line', 771
    $P3 = $P2(self, $S2, $I1)
    goto __label_13
  __label_14:
.annotate 'line', 772
    $P4 = WSubId_15(self, $S2, $I1)
    set $P3, $P4
  __label_13:
.annotate 'line', 770
    .return($P3)
.annotate 'line', 773

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
.annotate 'line', 776
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 777
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
.annotate 'line', 778
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 779
    .return($P1)
.annotate 'line', 780

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
.annotate 'line', 783
    getattribute $P1, self, 'stacked'
    push $P1, __ARG_1
.annotate 'line', 784

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 681
    addattribute $P0, 'h'
.annotate 'line', 682
    addattribute $P0, 'pending'
.annotate 'line', 683
    addattribute $P0, 'select'
.annotate 'line', 684
    addattribute $P0, 'stacked'
.annotate 'line', 685
    addattribute $P0, 'filename'
.annotate 'line', 686
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'typetoregcheck' :subid('WSubId_112')
        .param string __ARG_1
.annotate 'line', 812
    if __ARG_1 == 'int' goto __label_3
    if __ARG_1 == 'float' goto __label_4
    if __ARG_1 == 'string' goto __label_5
    if __ARG_1 == 'var' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 813
    .return('I')
  __label_4: # case
.annotate 'line', 814
    .return('N')
  __label_5: # case
.annotate 'line', 815
    .return('S')
  __label_6: # case
.annotate 'line', 816
    .return('P')
  __label_2: # default
.annotate 'line', 817
    .return('')
  __label_1: # switch end
.annotate 'line', 819

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_122')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 823
    if __ARG_1 == 'I' goto __label_3
    if __ARG_1 == 'N' goto __label_4
    if __ARG_1 == 'S' goto __label_5
    if __ARG_1 == 'P' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 824
    .return('int')
  __label_4: # case
.annotate 'line', 825
    .return('num')
  __label_5: # case
.annotate 'line', 826
    .return('string')
  __label_6: # case
.annotate 'line', 827
    .return('pmc')
  __label_2: # default
.annotate 'line', 828
    WSubId_6('Invalid reg type')
  __label_1: # switch end
.annotate 'line', 830

.end # typetopirname

.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 852
    setattribute self, 'handle', __ARG_1
.annotate 'line', 853
    box $P1, ""
    setattribute self, 'file', $P1
.annotate 'line', 854
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 855
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 856
    box $P1, 0
    setattribute self, 'pendingl', $P1
.annotate 'line', 857
    not $I1, __ARG_2
    new $P2, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P2
.annotate 'line', 858

.end # Emit


.sub 'setDebug' :method
.annotate 'line', 861
    box $P1, 1
    setattribute self, 'debug', $P1
.annotate 'line', 862

.end # setDebug


.sub 'getDebug' :method
.annotate 'line', 865
    getattribute $P1, self, 'debug'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 866

.end # getDebug


.sub 'disable_annotations' :method
.annotate 'line', 869
    box $P1, 1
    setattribute self, 'noan', $P1
.annotate 'line', 870

.end # disable_annotations


.sub 'close' :method
.annotate 'line', 873
    null $P1
    setattribute self, 'handle', $P1
.annotate 'line', 874

.end # close


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_24 = "WSubId_24"
.annotate 'line', 877
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 878
    WSubId_24(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 879

.end # warn


.sub 'updateannot' :method
.annotate 'line', 882
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 883
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'file', '"
.annotate 'line', 885
    getattribute $P4, self, 'file'
.annotate 'line', 883
    $P3[1] = $P4
    $P3[2] = "'\n"
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 888
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
  __label_1: # endif
.annotate 'line', 890
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 891
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'line', "
.annotate 'line', 893
    getattribute $P4, self, 'line'
.annotate 'line', 891
    $P3[1] = $P4
    $P3[2] = "\n"
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 896
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
  __label_2: # endif
.annotate 'line', 898

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
.annotate 'line', 901
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 902
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 903

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
.annotate 'line', 906
    self.'updateannot'()
.annotate 'line', 907
    self.'vprint'(__ARG_1)
.annotate 'line', 908

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
.annotate 'line', 911
    self.'updateannot'()
.annotate 'line', 912
    self.'vprint'(__ARG_1)
.annotate 'line', 913
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
.annotate 'line', 914

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 917
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
.annotate 'line', 919
    getattribute $P1, self, 'file'
.annotate 'line', 920
    getattribute $P2, self, 'line'
.annotate 'line', 921
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 922
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 923
    set $S2, $P1
    eq $S2, $S1, __label_3
.annotate 'line', 924
    assign $P1, $S1
.annotate 'line', 925
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 926
    assign $P2, 0
  __label_3: # endif
.annotate 'line', 928
    set $I2, $P2
    eq $I2, $I1, __label_4
.annotate 'line', 929
    assign $P2, $I1
.annotate 'line', 930
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
  __label_4: # endif
  __label_1: # endif
.annotate 'line', 933

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
.annotate 'line', 936
    self.'updateannot'()
.annotate 'line', 937
    getattribute $P1, self, 'handle'
    concat $S1, "# ", __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
.annotate 'line', 938

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 941
    getattribute $P1, self, 'handle'
.annotate 'line', 942
    $P1.'print'('  ')
.annotate 'line', 943
    $P1.'print'(__ARG_1)
.annotate 'line', 944
    $P1.'print'(":")
.annotate 'line', 945
    if_null __ARG_2, __label_1
.annotate 'line', 946
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 947
    $P1.'print'("\n")
.annotate 'line', 948

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 951
    getattribute $P1, self, 'handle'
.annotate 'line', 952
    $P1.'print'("    goto ")
.annotate 'line', 953
    $P1.'print'(__ARG_1)
.annotate 'line', 954
    if_null __ARG_2, __label_1
.annotate 'line', 955
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 956
    $P1.'print'("\n")
.annotate 'line', 957

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 961
    self.'say'('    ', __ARG_1, " ", __ARG_2)
.annotate 'line', 962

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 965
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 966

.end # emitarg2


.sub 'emitarg3' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 969
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 970

.end # emitarg3


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 973
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 974

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 977
    self.'say'("    if ", __ARG_1, " goto ", __ARG_2)
.annotate 'line', 978

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 981
    self.'say'("    unless ", __ARG_1, " goto ", __ARG_2)
.annotate 'line', 982

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 985
    self.'say'("    if_null ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 986

.end # emitif_null


.sub 'emitunless_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 989
    self.'say'("    unless_null ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 990

.end # emitunless_null


.sub 'emitnull' :method
        .param string __ARG_1
.annotate 'line', 993
    self.'say'("    null ", __ARG_1)
.annotate 'line', 994

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
.annotate 'line', 998
    self.'say'("    inc ", __ARG_1)
.annotate 'line', 999

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
.annotate 'line', 1002
    self.'say'("    dec ", __ARG_1)
.annotate 'line', 1003

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1006
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1007

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1010
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1011

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1014
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1015

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1018
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1019

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 1022
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 1023

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1026
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1027

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1030
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1031

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1034
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1035

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1038
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1039

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1042
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1043

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1046
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1047

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1050
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1051

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1054
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1055

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1058
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1059

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
.annotate 'line', 1062
    self.'say'("    print ", __ARG_1)
.annotate 'line', 1063

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
.annotate 'line', 1066
    self.'say'("    say ", __ARG_1)
.annotate 'line', 1067

.end # emitsay


.sub 'emitget_hll_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1070
    concat $S1, ", ", __ARG_2
    self.'say'("    get_hll_namespace ", __ARG_1, $S1)
.annotate 'line', 1071

.end # emitget_hll_namespace


.sub 'emitget_root_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1074
    concat $S1, ", ", __ARG_2
    self.'say'("    get_root_namespace ", __ARG_1, $S1)
.annotate 'line', 1075

.end # emitget_root_namespace


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
.annotate 'line', 1078
    self.'print'("    get_hll_global ", __ARG_1)
.annotate 'line', 1079
    if_null __ARG_3, __label_1
.annotate 'line', 1080
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1081
    self.'say'(", '", __ARG_2, "'")
.annotate 'line', 1082

.end # emitget_hll_global


.sub 'emitget_root_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
.annotate 'line', 1085
    self.'print'("    get_root_global ", __ARG_1)
.annotate 'line', 1086
    if_null __ARG_3, __label_1
.annotate 'line', 1087
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1088
    self.'say'(", '", __ARG_2, "'")
.annotate 'line', 1089

.end # emitget_root_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1092
    self.'say'("    find_lex ", __ARG_1, ", '", __ARG_2, "'")
.annotate 'line', 1093

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1096
    self.'say'("    store_lex '", __ARG_1, "', ", __ARG_2)
.annotate 'line', 1097

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 841
    addattribute $P0, 'handle'
.annotate 'line', 842
    addattribute $P0, 'file'
.annotate 'line', 843
    addattribute $P0, 'line'
.annotate 'line', 844
    addattribute $P0, 'pendingf'
.annotate 'line', 845
    addattribute $P0, 'pendingl'
.annotate 'line', 846
    addattribute $P0, 'debug'
.annotate 'line', 847
    addattribute $P0, 'noan'
.annotate 'line', 848
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 1122
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 1123

.end # integerValue


.sub 'floatValue' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
.annotate 'line', 1127
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 1128
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
.annotate 'line', 1129

.end # floatValue


.sub 'stringQuotedValue' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 1133
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenQuoted'($P2, $P3, __ARG_3)
.annotate 'line', 1134
    new $P3, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P3.'StringLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
.annotate 'line', 1135

.end # stringQuotedValue


.sub 'floatresult' :subid('WSubId_79')
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1143
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1144
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1145
    .return($I1)
.annotate 'line', 1146

.end # floatresult


.sub 'floatAsString' :subid('WSubId_74')
        .param num __ARG_1
.annotate 'line', 1156
    null $S1
    set $S1, __ARG_1
.annotate 'line', 1158
    box $P2, $S1
    $P1 = $P2.'is_integer'($S1)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 1159
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1160
    .return($S1)
.annotate 'line', 1161

.end # floatAsString


.sub 'createPredefConstInt' :subid('WSubId_138')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1172
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1173
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1174
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1175
    $P3 = WSubId_25(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
.annotate 'line', 1176

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_128')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1180
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1181
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1182
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1183
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1184
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1183
    $P2.'setvalue'($P3)
.annotate 'line', 1185

.end # createPredefConstString


.sub 'string_from_literal' :subid('WSubId_28')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1199
    null $S1
.annotate 'line', 1201
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1204
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1207
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1202
    getattribute $P1, __ARG_1, 'numval'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1205
    $P2 = __ARG_1.'getFloatValue'()
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1208
    $P3 = __ARG_1.'get_value'()
    set $S1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1211
    WSubId_6('wrong call to string_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1213
    .return($S1)
.annotate 'line', 1214

.end # string_from_literal


.sub 'int_from_literal' :subid('WSubId_29')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1218
    null $I1
.annotate 'line', 1220
    $I2 = __ARG_1.'isintegerliteral'()
    if $I2 goto __label_3
.annotate 'line', 1223
    $I2 = __ARG_1.'isfloatliteral'()
    if $I2 goto __label_4
.annotate 'line', 1226
    $I2 = __ARG_1.'isstringliteral'()
    if $I2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1221
    getattribute $P1, __ARG_1, 'numval'
    set $I1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1224
    $P2 = __ARG_1.'getFloatValue'()
    set $I1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1227
    $P3 = __ARG_1.'get_value'()
    set $I1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1230
    WSubId_6('wrong call to int_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1232
    .return($I1)
.annotate 'line', 1233

.end # int_from_literal


.sub 'float_from_literal' :subid('WSubId_113')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1237
    null $N1
.annotate 'line', 1239
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1240
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1243
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
  __label_4: # case
.annotate 'line', 1241
    $P1 = __ARG_1.'getFloatValue'()
    set $N1, $P1
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1244
    $P2 = __ARG_1.'get_value'()
    set $N1, $P2
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1247
    WSubId_6('wrong call to float_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1249
    .return($N1)
.annotate 'line', 1250

.end # float_from_literal

.namespace [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]

.sub 'Builtin_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1277
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1278
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1279
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1280
    split $P1, "\n", __ARG_2
    join $S1, "\n    ", $P1
    concat $S2, '    ', $S1
    set __ARG_2, $S2
.annotate 'line', 1281
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1282
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
.annotate 'line', 1283

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
.annotate 'line', 1286
    getattribute $P1, self, 'typeresult'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1288
    ne $S1, 'v', __label_2
.annotate 'line', 1289
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_4, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1290
    WSubId_1('using return value from void builtin')
  __label_4: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 1293
    isnull $I1, __ARG_4
    if $I1 goto __label_7
    iseq $I1, __ARG_4, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1294
    WSubId_6('Bad result in non void builtin')
  __label_6: # endif
  __label_3: # endif
.annotate 'line', 1297
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1298
    getattribute $P2, self, 'body'
    $P1 = WSubId_26($P2, __ARG_4, __ARG_5 :flat)
    __ARG_1.'say'($P1)
.annotate 'line', 1299

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
.annotate 'line', 1256
    addattribute $P0, 'body'
.annotate 'line', 1257
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
.annotate 'line', 1320
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1321
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1322
    new $P3, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
    $P3.'Builtin_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1324
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1325
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1326
    null $I1
.annotate 'line', 1327
    if_null __ARG_4, __label_3
.annotate 'line', 1328
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
.annotate 'line', 1329
    if __ARG_4 == '*' goto __label_6
    if __ARG_4 == '!' goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1331
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1334
    set $I1, -2
.annotate 'line', 1335
    if_null __ARG_5, __label_8
.annotate 'line', 1336
    concat $S2, "Invalid builtin '", __ARG_1
    concat $S2, $S2, '"'
    WSubId_6($S2)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1339
    set $I1, 1
.annotate 'line', 1340
    if_null __ARG_5, __label_9
.annotate 'line', 1341
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1342
    inc $I1
  __label_9: # endif
.annotate 'line', 1344
    if_null __ARG_6, __label_10
.annotate 'line', 1345
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1346
    inc $I1
  __label_10: # endif
.annotate 'line', 1348
    if_null __ARG_7, __label_11
.annotate 'line', 1349
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1350
    inc $I1
  __label_11: # endif
  __label_4: # switch end
  __label_3: # endif
.annotate 'line', 1354
    box $P1, $I1
    setattribute self, 'nparams', $P1
.annotate 'line', 1355

.end # BuiltinBase


.sub 'iscompileevaluable' :method
.annotate 'line', 1358
    .return(0)
.annotate 'line', 1359

.end # iscompileevaluable


.sub 'name' :method
.annotate 'line', 1362
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1363
    .return($S1)
.annotate 'line', 1364

.end # name


.sub 'result' :method
.annotate 'line', 1367
    getattribute $P1, self, 'typeresult'
    .return($P1)
.annotate 'line', 1368

.end # result


.sub 'params' :method
.annotate 'line', 1369
    getattribute $P1, self, 'nparams'
    .return($P1)

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1372
    null $S1
.annotate 'line', 1373
    if __ARG_1 == 0 goto __label_3
    if __ARG_1 == 1 goto __label_4
    if __ARG_1 == 2 goto __label_5
    if __ARG_1 == 3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 1374
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1375
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1376
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1377
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1379
    WSubId_6('Invalid builtin arg')
  __label_1: # switch end
.annotate 'line', 1381
    .return($S1)
.annotate 'line', 1382

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1385
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1387
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 1389
    eq $S1, '__ASSERT__', __label_3
.annotate 'line', 1390
    concat $S3, 'builtin ', $S1
    __ARG_1.'comment'($S3)
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 1393
    getattribute $P2, self, 'typeresult'
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 1394
    isne $I1, $S2, 'v'
    unless $I1 goto __label_6
    iseq $I1, __ARG_4, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 1395
    $P2 = __ARG_2.'tempreg'($S2)
    set __ARG_4, $P2
  __label_5: # endif
.annotate 'line', 1396
    getattribute $P1, self, 'body'
.annotate 'line', 1397
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 1398

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
.annotate 'line', 1304
    addattribute $P0, 'name'
.annotate 'line', 1305
    addattribute $P0, 'body'
.annotate 'line', 1306
    addattribute $P0, 'typeresult'
.annotate 'line', 1307
    addattribute $P0, 'type0'
.annotate 'line', 1308
    addattribute $P0, 'type1'
.annotate 'line', 1309
    addattribute $P0, 'type2'
.annotate 'line', 1310
    addattribute $P0, 'type3'
.annotate 'line', 1311
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
.annotate 'line', 1410
    self.'BuiltinBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 1411

.end # BuiltinFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1401
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
.annotate 'line', 1424
    self.'BuiltinBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1425
    setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1426

.end # BuiltinFunctionEval


.sub 'iscompileevaluable' :method
.annotate 'line', 1429
    .return(1)
.annotate 'line', 1430

.end # iscompileevaluable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1414
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
.annotate 'line', 1416
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]

.sub 'Builtin_typecast' :method
        .param string __ARG_1
.annotate 'line', 1438
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 1439

.end # Builtin_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 1442
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1443
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1444
    WSubId_6("Invalid Builtin_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1445
    $P1 = __ARG_5[0]
.annotate 'line', 1446
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 1448
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1449
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1450
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1453
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1454
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1456
    ne $S3, 'null', __label_9
.annotate 'line', 1457
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1459
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
.annotate 'line', 1461

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
.annotate 'line', 1435
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'builtineval_stringcast' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 1466
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1467
    $P2 = WSubId_28($P1)
    .tailcall WSubId_27(__ARG_1, __ARG_2, $P2)
.annotate 'line', 1468

.end # builtineval_stringcast


.sub 'builtineval_intcast' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1472
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1473
    $P2 = WSubId_29($P1)
    set $I1, $P2
.annotate 'line', 1474
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1475

.end # builtineval_intcast


.sub 'Builtin_varcast' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1479
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1480
    WSubId_6("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1481
    $P1 = __ARG_5[0]
.annotate 'line', 1482
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 1483
    ne $S1, 'P', __label_3
.annotate 'line', 1484
    null $S2
.annotate 'line', 1485
    null $P2
.annotate 'line', 1487
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1503
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1488
    $P7 = $P1.'getName'()
    set $S2, $P7
.annotate 'line', 1489
    $P8 = $P1.'checkIdentifier'()
    null $S3
    if_null $P8, __label_9
    set $S3, $P8
  __label_9:
.annotate 'line', 1490
    $P3 = $P1.'checkVar'()
.annotate 'line', 1491
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
.annotate 'line', 1493
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_11
  __label_10: # else
.annotate 'line', 1496
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 1
    $P7[0] = $S2
    $P2 = $P1.'scopesearch'($P7, 0)
.annotate 'line', 1497
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 1498
    getattribute $P7, $P2, 'owner'
    $P4 = $P7.'getpath'()
.annotate 'line', 1499
    $P7 = WSubId_30($P4)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
  __label_14: # endif
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1506
    new $P5, ['ResizableStringArray']
.annotate 'line', 1507
    $P1.'buildkey'($P5)
.annotate 'line', 1508
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1509
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_17
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_17:
    unless $I1 goto __label_16
.annotate 'line', 1510
    getattribute $P7, $P2, 'owner'
    $P6 = $P7.'getpath'()
.annotate 'line', 1511
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1512
    $P7 = WSubId_30($P6)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
  __label_16: # endif
.annotate 'line', 1514
    $P7 = $P5.'pop'()
    set $S2, $P7
.annotate 'line', 1515
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1516
    $P8 = WSubId_30($P5)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P8)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1519
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1520
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
    goto __label_4
  __label_3: # else
.annotate 'line', 1524
    $P7 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_18
    set $S4, $P7
  __label_18:
.annotate 'line', 1525
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1526
    ne $S4, 'null', __label_19
.annotate 'line', 1527
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_20
  __label_19: # else
.annotate 'line', 1529
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_20: # endif
  __label_4: # endif
.annotate 'line', 1531

.end # Builtin_varcast


.sub 'Builtin_say' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1535
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1536
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1537
    lt $I1, 0, __label_1
.annotate 'line', 1538
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1539
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1538
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1540
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 1543
    __ARG_1.'emitsay'("''")
  __label_2: # endif
.annotate 'line', 1544

.end # Builtin_say


.sub 'emit_printP0' :subid('WSubId_32')
        .param string __ARG_1
.annotate 'line', 1548
    concat $S1, "    print $P0, ", __ARG_1
    .return($S1)
.annotate 'line', 1549

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
.annotate 'line', 1553
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1560
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P2 = WSubId_31(__ARG_5, $P3, WSubId_32)
    join $S1, "\n", $P2
.annotate 'line', 1554
    $P1 = WSubId_26("    getstderr $P0\n%0\n    print $P0, \"\\n\"\n", $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 1561

.end # Builtin_cry


.sub 'Builtin_print' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1565
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1566
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1567
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1568

.end # Builtin_print


.sub 'Builtin_ASSERT' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 1574
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1575
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1576
    $P3 = __ARG_2.'genlabel'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 1577
    $P1 = __ARG_5[0]
.annotate 'line', 1578
    $P2 = $P1.'emit_getint'(__ARG_1)
.annotate 'line', 1579
    __ARG_1.'emitif'($P2, $S1)
.annotate 'line', 1587
    $P4 = __ARG_3.'filename'()
    $P5 = __ARG_3.'linenum'()
.annotate 'line', 1580
    $P3 = WSubId_26("    print $P0, \"Assertion failed at '%0' line \"\n    print $P0, %1\n    print $P0, \"\\n\"\n    exit 1\n", $P4, $P5)
    __ARG_1.'print'($P3)
.annotate 'line', 1588
    __ARG_1.'emitlabel'($S1)
  __label_1: # endif
.annotate 'line', 1590

.end # Builtin_ASSERT


.sub 'Builtin_invoke' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 1596
    $P1 = __ARG_5[0]
.annotate 'line', 1597
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1598
    WSubId_1("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1599
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 1600

.end # Builtin_invoke


.sub 'builtineval_length' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1604
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1605
    $P2 = WSubId_28($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1606
    length $I1, $S1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1607

.end # builtineval_length


.sub 'builtineval_bytelength' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1611
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1612
    $P2 = WSubId_28($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1613
    bytelength $I1, $S1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1614

.end # builtineval_bytelength


.sub 'builtineval_ord' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1618
    elements $I1, __ARG_3
.annotate 'line', 1619
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1620
    $P3 = WSubId_28($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1621
    null $I2
.annotate 'line', 1622
    le $I1, 1, __label_2
.annotate 'line', 1623
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1624
    $P3 = WSubId_29($P2)
    set $I2, $P3
  __label_2: # endif
.annotate 'line', 1626
    ord $I3, $S1, $I2
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I3)
.annotate 'line', 1627

.end # builtineval_ord


.sub 'builtineval_chr' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_29 = "WSubId_29"
.annotate 'line', 1631
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1632
    $P2 = WSubId_29($P1)
    set $I1, $P2
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1633

.end # builtineval_chr


.sub 'builtineval_substr' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 1637
    elements $I1, __ARG_3
.annotate 'line', 1638
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1639
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1640
    $P4 = WSubId_28($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1641
    $P4 = WSubId_29($P2)
    set $I2, $P4
.annotate 'line', 1642
    null $S2
.annotate 'line', 1643
    set $I4, __ARG_3
    le $I4, 2, __label_2
.annotate 'line', 1644
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1645
    $P4 = WSubId_29($P3)
    set $I3, $P4
.annotate 'line', 1646
    substr $S2, $S1, $I2, $I3
    goto __label_3
  __label_2: # else
.annotate 'line', 1649
    substr $S2, $S1, $I2
  __label_3: # endif
.annotate 'line', 1650
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S2)
.annotate 'line', 1651

.end # builtineval_substr


.sub 'builtineval_indexof' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1655
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1656
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1657
    $P3 = WSubId_28($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1658
    $P3 = WSubId_28($P2)
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1659
    index $I1, $S1, $S2
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1660

.end # builtineval_indexof


.sub 'builtineval_indexof_pos' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1664
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1665
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1666
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1667
    $P4 = WSubId_28($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1668
    $P4 = WSubId_28($P2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1669
    $P6 = __ARG_3[2]
    getattribute $P5, $P6, 'arg'
    $P4 = WSubId_29($P5)
    set $I1, $P4
.annotate 'line', 1670
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I2)
.annotate 'line', 1671

.end # builtineval_indexof_pos


.sub 'builtineval_escape' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 1675
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1679
    $P2 = WSubId_28($P1)
    set $S3, $P2
    escape $S2, $S3
    escape $S1, $S2
.annotate 'line', 1678
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1680

.end # builtineval_escape


.sub 'builtin_sleep' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1684
    $P1 = __ARG_5[0]
.annotate 'line', 1685
    null $S1
.annotate 'line', 1686
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 1687
    if $S2 == 'I' goto __label_4
    if $S2 == 'N' goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 1689
    $P2 = $P1.'emit_getint'(__ARG_1)
    set $S1, $P2
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 1692
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 1695
    $P4 = $P1.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 1696
    set $S1, "0"
    goto __label_7
  __label_6: # else
.annotate 'line', 1698
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 1699
    set $S1, "$N0"
.annotate 'line', 1700
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1701
    __ARG_1.'emitset'($S1, $S3)
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 1704
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1705
    __ARG_1.'emitarg1'('sleep', $S1)
.annotate 'line', 1706

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
.annotate 'line', 1710
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1712
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('I')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('int', WSubId_33, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1710
    __ARG_1.'add'($P1)
.annotate 'line', 1715
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1716
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('N')
    set $P3, $P4
    $P2.'BuiltinFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1715
    __ARG_1.'add'($P1)
.annotate 'line', 1719
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1721
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('S')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('string', WSubId_34, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1719
    __ARG_1.'add'($P1)
.annotate 'line', 1724
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1725
    $P2.'BuiltinFunction'('var', WSubId_35, 'P', '!')
    set $P1, $P2
.annotate 'line', 1724
    __ARG_1.'add'($P1)
.annotate 'line', 1728
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1732
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1736
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1740
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1744
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1745
    $P2.'BuiltinFunction'('sleep', WSubId_36, 'v', '!')
    set $P1, $P2
.annotate 'line', 1744
    __ARG_1.'add'($P1)
.annotate 'line', 1748
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1752
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1756
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1760
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1764
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1771
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1778
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1785
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1793
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1802
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1812
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1816
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1817
    $P2.'BuiltinFunctionEval'('length', WSubId_37, 'length %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1816
    __ARG_1.'add'($P1)
.annotate 'line', 1821
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1822
    $P2.'BuiltinFunctionEval'('bytelength', WSubId_38, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1821
    __ARG_1.'add'($P1)
.annotate 'line', 1826
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1827
    $P2.'BuiltinFunctionEval'('chr', WSubId_39, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
.annotate 'line', 1826
    __ARG_1.'add'($P1)
.annotate 'line', 1835
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1836
    $P2.'BuiltinFunctionEval'('ord', WSubId_40, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1835
    __ARG_1.'add'($P1)
.annotate 'line', 1840
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1841
    $P2.'BuiltinFunctionEval'('ord', WSubId_40, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1840
    __ARG_1.'add'($P1)
.annotate 'line', 1845
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1846
    $P2.'BuiltinFunctionEval'('substr', WSubId_41, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1845
    __ARG_1.'add'($P1)
.annotate 'line', 1850
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1851
    $P2.'BuiltinFunctionEval'('substr', WSubId_41, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
.annotate 'line', 1850
    __ARG_1.'add'($P1)
.annotate 'line', 1855
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1859
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1860
    $P2.'BuiltinFunctionEval'('indexof', WSubId_42, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1859
    __ARG_1.'add'($P1)
.annotate 'line', 1864
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1865
    $P2.'BuiltinFunctionEval'('indexof', WSubId_43, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1864
    __ARG_1.'add'($P1)
.annotate 'line', 1869
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1873
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1874
    $P2.'BuiltinFunctionEval'('escape', WSubId_44, 'escape %0, %1', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1873
    __ARG_1.'add'($P1)
.annotate 'line', 1878
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1886
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1894
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1901
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1908
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1912
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1916
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1920
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1924
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1931
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1938
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1942
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1946
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1950
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1954
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1958
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1962
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1966
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1970
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1974
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1978
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1982
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1986
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1990
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2003
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2007
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2011
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2015
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2019
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2023
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2027
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2031
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2035
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2039
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2043
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2050
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2057
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2061
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2065
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2069
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2073
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2077
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2078
    $P2.'BuiltinFunction'('print', WSubId_45, 'v', '*')
    set $P1, $P2
.annotate 'line', 2077
    __ARG_1.'add'($P1)
.annotate 'line', 2081
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2082
    $P2.'BuiltinFunction'('say', WSubId_46, 'v', '*')
    set $P1, $P2
.annotate 'line', 2081
    __ARG_1.'add'($P1)
.annotate 'line', 2085
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2086
    $P2.'BuiltinFunction'('cry', WSubId_47, 'v', '*')
    set $P1, $P2
.annotate 'line', 2085
    __ARG_1.'add'($P1)
.annotate 'line', 2089
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2090
    $P2.'BuiltinFunction'('__ASSERT__', WSubId_48, 'v', '!')
    set $P1, $P2
.annotate 'line', 2089
    __ARG_1.'add'($P1)
.annotate 'line', 2093
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2094
    $P2.'BuiltinFunction'('invoke', WSubId_49, 'P', '!')
    set $P1, $P2
.annotate 'line', 2093
    __ARG_1.'add'($P1)
.annotate 'line', 2097

.end # getbuiltins


.sub 'optimize_array' :subid('WSubId_52')
        .param pmc __ARG_1
.annotate 'line', 2105
    if_null __ARG_1, __label_2
    elements $I1, __ARG_1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
.annotate 'line', 2106
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 2107
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_3: # for iteration
.annotate 'line', 2106
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 2108

.end # optimize_array


.sub 'emit_array' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2112
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 2113
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2114

.end # emit_array


.sub 'parseDotted' :subid('WSubId_69')
        .param pmc __ARG_1
.annotate 'line', 2118
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2119
    $P2 = __ARG_1.'get'()
.annotate 'line', 2120
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2121
    push $P1, $P2
  __label_3: # while
.annotate 'line', 2122
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2123
    $P2 = __ARG_1.'get'()
.annotate 'line', 2124
    push $P1, $P2
    goto __label_3
  __label_2: # endwhile
  __label_1: # endif
.annotate 'line', 2127
    __ARG_1.'unget'($P2)
.annotate 'line', 2128
    .return($P1)
.annotate 'line', 2129

.end # parseDotted


.sub 'parseList' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 2137
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2138
    null $P2
  __label_1: # do
.annotate 'line', 2140
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 2141
    push $P1, $P3
  __label_3: # continue
.annotate 'line', 2142
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 2143
    unless_null __ARG_4, __label_4
.annotate 'line', 2144
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2146
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 2147
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 2148
    .return($P1)
.annotate 'line', 2149

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.annotate 'line', 2154
    $P1 = __ARG_1.'get'()
.annotate 'line', 2155
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2156
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 2157
    .return($P1)
.annotate 'line', 2158

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_70')
        .param pmc __ARG_1
.annotate 'line', 2162
    new $P1, ['ResizableStringArray']
.annotate 'line', 2163
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 2164
    $P4 = $P2.'getidentifier'()
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2165
    .return($P1)
.annotate 'line', 2166

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2179
    setattribute self, 'start', __ARG_1
.annotate 'line', 2180
    setattribute self, 'owner', __ARG_2
.annotate 'line', 2181

.end # initbase


.sub 'filename' :method
.annotate 'line', 2184
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2185
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2187
    .return("unknown")
  __label_2: # endif
.annotate 'line', 2188

.end # filename


.sub 'linenum' :method
.annotate 'line', 2191
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2192
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2194
    .return(0)
  __label_2: # endif
.annotate 'line', 2195

.end # linenum


.sub 'viewable' :method
.annotate 'line', 2198
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2199
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2201
    .return("")
  __label_2: # endif
.annotate 'line', 2202

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 2205
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 2206

.end # annotate


.sub 'getpath' :method
.annotate 'line', 2209
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()
.annotate 'line', 2210

.end # getpath


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 2213
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 2214

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 2217
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 2218

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 2221
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
.annotate 'line', 2222

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 2225
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
.annotate 'line', 2226

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 2229
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 2230

.end # scopesearch


.sub 'dowarnings' :method
.annotate 'line', 2233
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 2234

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 2174
    addattribute $P0, 'start'
.annotate 'line', 2175
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2251
    setattribute self, 'owner', __ARG_1
.annotate 'line', 2252
    setattribute self, 'e', __ARG_2
.annotate 'line', 2253

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 2257
    getattribute $P1, self, 'e'
.annotate 'line', 2258
    null $S1
.annotate 'line', 2259
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2260
    getattribute $P2, self, 'pnull'
.annotate 'line', 2261
    unless_null $P2, __label_3
.annotate 'line', 2262
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2263
    $P1.'emitnull'($S2)
.annotate 'line', 2264
    box $P2, $S2
    setattribute self, 'pnull', $P2
  __label_3: # endif
.annotate 'line', 2266
    set $S1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 2269
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2270
    .return($S1)
.annotate 'line', 2271

.end # add

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
.annotate 'line', 2246
    addattribute $P0, 'owner'
.annotate 'line', 2247
    addattribute $P0, 'e'
.annotate 'line', 2248
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2286
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_51, __ARG_3)
    setattribute self, 'args', $P2
.annotate 'line', 2287

.end # SimpleArgList


.sub 'numargs' :method
.annotate 'line', 2291
    getattribute $P1, self, 'args'
    elements $I1, $P1
    .return($I1)
.annotate 'line', 2292

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 2295
    getattribute $P1, self, 'args'
.annotate 'line', 2296
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 2297

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2301
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 2302

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 2305
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2306
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2307
    $P5 = $P2.'emit_get'(__ARG_1)
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2308
    .return($P1)
.annotate 'line', 2309

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 2312
    $P1 = self.'getargvalues'(__ARG_1)
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
.annotate 'line', 2313

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2282
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
.annotate 'line', 2325
    getattribute $P1, self, 'name'
    .return($P1)

.end # getname


.sub 'numargs' :method
.annotate 'line', 2328
    getattribute $P1, self, 'args'
.annotate 'line', 2329
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2330
    .return($I1)
.annotate 'line', 2331

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2334
    getattribute $P1, self, 'args'
.annotate 'line', 2335
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2336
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2337
    .tailcall $P1.'getarg'(__ARG_1)
.annotate 'line', 2338

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2341
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2342
    if_null __ARG_2, __label_1
.annotate 'line', 2343
    setattribute self, 'args', __ARG_2
  __label_1: # endif
.annotate 'line', 2344

.end # Modifier


.sub 'optimize' :method
.annotate 'line', 2347
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2348
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2349
    .return(self)
.annotate 'line', 2350

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2322
    addattribute $P0, 'name'
.annotate 'line', 2323
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2355
    $P1 = __ARG_1.'get'()
.annotate 'line', 2356
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2357
    $P1 = __ARG_1.'get'()
.annotate 'line', 2358
    null $P2
.annotate 'line', 2359
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2360
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2362
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2363
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
.annotate 'line', 2364

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_53 = "WSubId_53"
.annotate 'line', 2373
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_53, ']')
    setattribute self, 'list', $P2
.annotate 'line', 2374

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2377
    getattribute $P1, self, 'list'
    WSubId_52($P1)
.annotate 'line', 2378

.end # optimize


.sub 'getlist' :method
.annotate 'line', 2379
    getattribute $P1, self, 'list'
    .return($P1)

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
.annotate 'line', 2382
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 2383
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2384
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2386
    .return($P2)
.annotate 'line', 2387

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2369
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_30')
        .param pmc __ARG_1
.annotate 'line', 2396
    null $S1
.annotate 'line', 2397
    elements $I1, __ARG_1
    unless $I1 goto __label_1
.annotate 'line', 2398
    join $S2, "'; '", __ARG_1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 2399
    .return($S1)
.annotate 'line', 2400

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2404
    $P1 = __ARG_2.'get'()
.annotate 'line', 2406
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2408
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2410
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2407
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2409
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2411
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2413
    __ARG_2.'unget'($P1)
.annotate 'line', 2414
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
.annotate 'line', 2416

.end # parseUsing


.sub 'parseSig' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2420
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2421
    $P2 = __ARG_2.'get'()
.annotate 'line', 2422
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2423
    WSubId_54("'='", $P2)
  __label_1: # endif
.annotate 'line', 2424
    $P3 = WSubId_51(__ARG_2, __ARG_3)
.annotate 'line', 2425
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 2426

.end # parseSig


.sub 'parseClassSpecifier' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 2430
    $P1 = __ARG_1.'get'()
.annotate 'line', 2431
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2432
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 2433
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 2434
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 2435
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2436
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 2437
    WSubId_1('Invalid class', $P1)
.annotate 'line', 2438

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
.annotate 'line', 2442
    $P1 = __ARG_1.'get'()
.annotate 'line', 2443
    null $P2
.annotate 'line', 2444
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2445
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2446
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2447
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2448
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2449
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2450
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 2451
    $P3 = __ARG_1.'get'()
.annotate 'line', 2452
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2453
    WSubId_55("':'", $P1)
  __label_5: # endif
.annotate 'line', 2454
    .tailcall WSubId_56($P1, __ARG_1, __ARG_2)
  __label_4: # endif
.annotate 'line', 2457
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
    goto __label_7
  __label_8: # case
.annotate 'line', 2459
    .tailcall WSubId_57($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2461
    .tailcall WSubId_58($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2464
    .tailcall WSubId_59($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2467
    $P2 = __ARG_1.'get'()
.annotate 'line', 2468
    __ARG_1.'unget'($P2)
.annotate 'line', 2469
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2470
    .tailcall WSubId_60($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2473
    $P2 = __ARG_1.'get'()
.annotate 'line', 2474
    __ARG_1.'unget'($P2)
.annotate 'line', 2475
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2476
    .tailcall WSubId_61($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2479
    $P2 = __ARG_1.'get'()
.annotate 'line', 2480
    __ARG_1.'unget'($P2)
.annotate 'line', 2481
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2482
    .tailcall WSubId_62($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2485
    $P2 = __ARG_1.'get'()
.annotate 'line', 2486
    __ARG_1.'unget'($P2)
.annotate 'line', 2487
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2488
    .tailcall WSubId_63($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2491
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2493
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2495
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2497
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2499
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2501
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2503
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2505
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2507
    .tailcall WSubId_64($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2509
    .tailcall WSubId_65($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2511
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2513
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2516
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
.annotate 'line', 2517
    $P4 = __ARG_1.'get'()
.annotate 'line', 2518
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2519
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2520
    __ARG_1.'unget'($P4)
  __label_31: # endif
.annotate 'line', 2522
    __ARG_1.'unget'($P1)
.annotate 'line', 2523
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
.annotate 'line', 2524

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2534
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 2535

.end # Statement


.sub 'isempty' :method
.annotate 'line', 2536
    .return(0)

.end # isempty


.sub 'allowtailcall' :method
.annotate 'line', 2539
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
.annotate 'line', 2540

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 2543
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
.annotate 'line', 2544

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 2547
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 2548

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 2551
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
.annotate 'line', 2552

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 2555
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 2556

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2559
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
.annotate 'line', 2560

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2563
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
.annotate 'line', 2564

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2567
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2568

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2571
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2572

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2575
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
.annotate 'line', 2576

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 2579
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2580

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 2583
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
.annotate 'line', 2584

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 2587
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 2588

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 2591
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
.annotate 'line', 2592

.end # usenamespace


.sub 'getouter' :method
.annotate 'line', 2599
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
.annotate 'line', 2600

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.annotate 'line', 2603
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
.annotate 'line', 2604

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.annotate 'line', 2607
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
.annotate 'line', 2608

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2611
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2613
    .return(self)
.annotate 'line', 2614

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2530
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
.annotate 'line', 2619
    .return(1)

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2622
    WSubId_6('Attempt to annotate empty statement')
.annotate 'line', 2623

.end # annotate


.sub 'optimize' :method
.annotate 'line', 2624
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2617
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
.annotate 'line', 2637
    getattribute $P1, self, 'statements'
.annotate 'line', 2638
    elements $I1, $P1
.annotate 'line', 2639
    set $I2, 1
.annotate 'line', 2640
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
.annotate 'line', 2641
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2642
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2643
    null $I2
  __label_4: # endif
.annotate 'line', 2644
    $P1[$I3] = $P2
  __label_1: # for iteration
.annotate 'line', 2640
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2646
    unless $I2 goto __label_7
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
.annotate 'line', 2647

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2633
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2654
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2655
    setattribute self, 'statements', $P1
.annotate 'line', 2656

.end # MultiStatement


.sub 'isempty' :method
.annotate 'line', 2657
    .return(0)

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
.annotate 'line', 2660
    getattribute $P1, self, 'statements'
    push $P1, __ARG_1
.annotate 'line', 2661
    .return(self)
.annotate 'line', 2662

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 2665
    getattribute $P1, self, 'statements'
    WSubId_66(__ARG_1, $P1)
.annotate 'line', 2666

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2650
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2672
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2674
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2673
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2675
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2677
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
.annotate 'line', 2679

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2687
    null $P1
.annotate 'line', 2688
    $P2 = __ARG_1.'get'()
.annotate 'line', 2689
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2690
    $P2 = __ARG_1.'get'()
.annotate 'line', 2691
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2692
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 2695
    __ARG_1.'unget'($P2)
.annotate 'line', 2696
    $P1 = WSubId_51(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 2698
    .return($P1)
.annotate 'line', 2699

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2708
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2709
    $P1 = __ARG_2.'get'()
.annotate 'line', 2710
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2711
    unless $I1 goto __label_1
.annotate 'line', 2712
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2713
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2714
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2715
    $P1 = __ARG_2.'get'()
.annotate 'line', 2716
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
.annotate 'line', 2717
    __ARG_2.'unget'($P1)
.annotate 'line', 2718
    $P3 = WSubId_50(__ARG_2, __ARG_3, WSubId_67, '}')
    setattribute self, 'args', $P3
  __label_5: # endif
.annotate 'line', 2720
    WSubId_68(';', __ARG_2)
.annotate 'line', 2721

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2724
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 2725
    .return(self)
.annotate 'line', 2726

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2729
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2730
    self.'annotate'(__ARG_1)
.annotate 'line', 2731
    $P4 = __ARG_1.'getDebug'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 2732
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
  __label_2: # endif
.annotate 'line', 2733
    getattribute $P1, self, 'args'
.annotate 'line', 2734
    __ARG_1.'print'('    ')
.annotate 'line', 2735
    unless_null $P1, __label_3
.annotate 'line', 2736
    __ARG_1.'say'($S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2738
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2739
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
.annotate 'line', 2740
    $P4 = $P3.'emit_get'(__ARG_1)
    push $P2, $P4
    goto __label_5
  __label_6: # endfor
.annotate 'line', 2741
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
  __label_4: # endif
.annotate 'line', 2743

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2701
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2703
    addattribute $P0, 'opname'
.annotate 'line', 2704
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
.annotate 'line', 2755
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2756
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2757
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2758
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2759
    WSubId_68(';', __ARG_2)
.annotate 'line', 2760
    $P3 = WSubId_70($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2761
    .return(self)
.annotate 'line', 2762

.end # ExternStatement


.sub 'optimize' :method
.annotate 'line', 2763
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2766
    self.'annotate'(__ARG_1)
.annotate 'line', 2767
    getattribute $P1, self, 'path'
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
.annotate 'line', 2768

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2750
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2752
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_71 = "WSubId_71"
.annotate 'line', 2780
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2781
    null $P3
    $P1 = WSubId_50(__ARG_2, $P3, WSubId_71, ';')
.annotate 'line', 2782
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2783
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2784
    self.'createvarnamed'($P2, 'P', $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2786
    setattribute self, 'names', $P1
.annotate 'line', 2787

.end # StaticStatement


.sub 'optimize' :method
.annotate 'line', 2790
    .return(self)
.annotate 'line', 2791

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2794
    self.'annotate'(__ARG_1)
.annotate 'line', 2795
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 2796
    $P2 = self.'getvar'($P1)
.annotate 'line', 2797
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2799

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2775
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2777
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
.annotate 'line', 2813
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2814
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2815
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2816
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2817
    WSubId_68(';', __ARG_2)
.annotate 'line', 2818
    setattribute self, 'path', $P1
.annotate 'line', 2819

.end # UsingStatement


.sub 'optimize' :method
.annotate 'line', 2822
    getattribute $P1, self, 'path'
.annotate 'line', 2823
    $P2 = $P1[-1]
.annotate 'line', 2825
    $P3 = self.'scopesearch'($P1, 0)
.annotate 'line', 2827
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2841
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2828
    elements $I2, $P1
    unless $I2 goto __label_5
.annotate 'line', 2829
    clone $P4, $P1
.annotate 'line', 2830
    $P4.'pop'()
.annotate 'line', 2831
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2832
    if_null $P5, __label_6
.annotate 'line', 2833
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2834
    if_null $P3, __label_7
.annotate 'line', 2835
    self.'createvarused'($P2, $P3)
.annotate 'line', 2836
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_7: # endif
  __label_6: # endif
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2842
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2843
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2844
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2845
    self.'usesubid'($S1)
.annotate 'line', 2846
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2848
    self.'createvar'($P2, 'P')
.annotate 'line', 2849
    .return(self)
.annotate 'line', 2850

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2853
    getattribute $P1, self, 'path'
.annotate 'line', 2854
    $S1 = $P1[-1]
.annotate 'line', 2855
    $P2 = self.'getvar'($S1)
.annotate 'line', 2856
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
.annotate 'line', 2857
    self.'annotate'(__ARG_1)
.annotate 'line', 2858
    null $S2
.annotate 'line', 2859
    elements $I1, $P1
    le $I1, 1, __label_2
.annotate 'line', 2860
    $P1.'pop'()
.annotate 'line', 2861
    $P3 = WSubId_30($P1)
    set $S2, $P3
  __label_2: # endif
.annotate 'line', 2863
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
  __label_1: # endif
.annotate 'line', 2865

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2806
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2808
    addattribute $P0, 'path'
.annotate 'line', 2809
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
.annotate 'line', 2875
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2876
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2877
    WSubId_54('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2878
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2879
    unless_null $P2, __label_2
.annotate 'line', 2880
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2881
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2882

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2888
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2889
    WSubId_72(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2890
    WSubId_68(';', __ARG_2)
.annotate 'line', 2891

.end # UsingNamespaceStatement


.sub 'optimize' :method
.annotate 'line', 2894
    .return(self)
.annotate 'line', 2895

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2884
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2910
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2911
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2912
    WSubId_68(';', __ARG_2)
.annotate 'line', 2913

.end # ExprStatement


.sub 'optimize' :method
.annotate 'line', 2916
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2917
    .return(self)
.annotate 'line', 2918

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2921
    getattribute $P1, self, 'expr'
    $P1.'emit_void'(__ARG_1)
.annotate 'line', 2922

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2905
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2907
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
.annotate 'line', 2939
    setattribute self, 'type', __ARG_1
.annotate 'line', 2940
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2941
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2942
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2943

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
.annotate 'line', 2946
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
.annotate 'line', 2947

.end # setlex


.sub 'gettype' :method
.annotate 'line', 2948
    getattribute $P1, self, 'type'
    .return($P1)

.end # gettype


.sub 'getreg' :method
.annotate 'line', 2949
    getattribute $P1, self, 'reg'
    .return($P1)

.end # getreg


.sub 'getscope' :method
.annotate 'line', 2950
    getattribute $P1, self, 'scope'
    .return($P1)

.end # getscope


.sub 'getvalue' :method
.annotate 'line', 2951
    getattribute $P1, self, 'value'
    .return($P1)

.end # getvalue


.sub 'isconst' :method
.annotate 'line', 2952
    .return(0)

.end # isconst


.sub 'getlex' :method
.annotate 'line', 2953
    getattribute $P1, self, 'lexname'
    .return($P1)

.end # getlex


.sub 'getflags' :method
.annotate 'line', 2954
    getattribute $P1, self, 'flags'
    .return($P1)

.end # getflags


.sub 'issubid' :method
.annotate 'line', 2957
    getattribute $P1, self, 'reg'
.annotate 'line', 2958
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_1
    set $S2, $P1
    substr $S1, $S2, 0, 7
    iseq $I1, $S1, 'WSubId_'
  __label_1:
    .return($I1)
.annotate 'line', 2959

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2931
    addattribute $P0, 'type'
.annotate 'line', 2932
    addattribute $P0, 'reg'
.annotate 'line', 2933
    addattribute $P0, 'scope'
.annotate 'line', 2934
    addattribute $P0, 'flags'
.annotate 'line', 2935
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
.annotate 'line', 2967
    setattribute self, 'name', __ARG_1
.annotate 'line', 2968

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2971
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
.annotate 'line', 2972

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2964
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 2981
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
.annotate 'line', 2982

.end # VarData_const


.sub 'isconst' :method
.annotate 'line', 2983
    .return(1)

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2986
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2987
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2988
    setattribute self, 'value', __ARG_1
.annotate 'line', 2989

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2975
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2977
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'VarContainer' :method
.annotate 'line', 3000
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
.annotate 'line', 3001

.end # VarContainer


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3004
    getattribute $P1, self, 'locals'
.annotate 'line', 3005
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3006
    $P2 = $P1[$S1]
.annotate 'line', 3007
    if_null $P2, __label_2
.annotate 'line', 3008
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 3009
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 3010
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 3011
    $P1[$S1] = $P3
.annotate 'line', 3012
    .return($P3)
.annotate 'line', 3013

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3016
    getattribute $P1, self, 'locals'
.annotate 'line', 3017
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3018
    $P2 = $P1[$S1]
.annotate 'line', 3019
    if_null $P2, __label_2
.annotate 'line', 3020
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3021
    $P1[$S1] = __ARG_2
.annotate 'line', 3022

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3025
    getattribute $P1, self, 'locals'
.annotate 'line', 3026
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3027
    $P2 = $P1[$S1]
.annotate 'line', 3028
    if_null $P2, __label_2
.annotate 'line', 3029
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3030
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
.annotate 'line', 3031

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3034
    getattribute $P1, self, 'locals'
.annotate 'line', 3035
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3036
    $P2 = $P1[$S1]
.annotate 'line', 3037
    if_null $P2, __label_2
.annotate 'line', 3038
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3039
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 3040
    $P1[$S1] = $P3
.annotate 'line', 3041
    .return($P3)
.annotate 'line', 3042

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
.annotate 'line', 3045
    getattribute $P1, self, 'locals'
.annotate 'line', 3046
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
.annotate 'line', 3047

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
.annotate 'line', 3050
    null $P1
.annotate 'line', 3051
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 3052
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 3053
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 3055
    .return($P3)
.annotate 'line', 3056

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3059
    null $P1
.annotate 'line', 3060
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 3061
    .return($P1)
  __label_1: # endif
.annotate 'line', 3062
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 3063
    .return($P1)
  __label_2: # endif
.annotate 'line', 3064
    getattribute $P2, self, 'owner'
.annotate 'line', 3065
    if_null $P2, __label_3
.annotate 'line', 3066
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 3067
    .return($P3)
.annotate 'line', 3068

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
.annotate 'line', 3071
    $P1 = self.'getouter'()
.annotate 'line', 3072
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3073
    .return($S1)
.annotate 'line', 3074

.end # makelexical


.sub 'makelexicalself' :method
.annotate 'line', 3077
    set $P1, self
.annotate 'line', 3079
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 3080
    .return('__WLEX_self')
.annotate 'line', 3081

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2995
    addattribute $P0, 'locals'
.annotate 'line', 2996
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]

.sub 'BlockStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3094
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 3095
    self.'VarContainer'()
.annotate 'line', 3096

.end # BlockStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 3090
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3107
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 3108

.end # Expr


.sub 'issimple' :method
.annotate 'line', 3109
    .return(0)

.end # issimple


.sub 'isliteral' :method
.annotate 'line', 3110
    .return(0)

.end # isliteral


.sub 'isintegerliteral' :method
.annotate 'line', 3111
    .return(0)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3112
    .return(0)

.end # isintegerzero


.sub 'isfloatliteral' :method
.annotate 'line', 3113
    .return(0)

.end # isfloatliteral


.sub 'isstringliteral' :method
.annotate 'line', 3114
    .return(0)

.end # isstringliteral


.sub 'isidentifier' :method
.annotate 'line', 3115
    .return(0)

.end # isidentifier


.sub 'isnull' :method
.annotate 'line', 3116
    .return(0)

.end # isnull


.sub 'hascompilevalue' :method
.annotate 'line', 3117
    .return(0)

.end # hascompilevalue


.sub 'isnegable' :method
.annotate 'line', 3118
    .return(0)

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
.annotate 'line', 3121
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 3122

.end # tempreg


.sub 'genlabel' :method
.annotate 'line', 3125
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 3126

.end # genlabel


.sub 'optimize' :method
.annotate 'line', 3130
    .return(self)
.annotate 'line', 3131

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 3132
    .return(0)

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3135
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3136
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3137
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3138
    .return($S2)
.annotate 'line', 3139

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3142
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3143
    null $S2
.annotate 'line', 3144
    if $S1 == 'I' goto __label_4
    if $S1 == 'N' goto __label_5
    if $S1 == 'S' goto __label_6
    if $S1 == 'P' goto __label_7
    goto __label_3
  __label_4: # case
.annotate 'line', 3145
    set $S2, "$I0"
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3146
    set $S2, "$N0"
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 3147
    set $S2, "$S0"
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 3148
    set $S2, "$P0"
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3150
    concat $S4, "Unexcpected emit_void with type '", $S1
    concat $S4, $S4, "'"
    getattribute $P1, self, 'start'
    WSubId_6($S4, $P1)
  __label_2: # switch end
.annotate 'line', 3152
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3153

.end # emit_void


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3156
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3157
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 3158
    .tailcall self.'emit_get'(__ARG_1)
.annotate 'line', 3159

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 3162
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3163
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
.annotate 'line', 3164
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3165
    self.'annotate'(__ARG_1)
.annotate 'line', 3166
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 3167
    set $S1, $S2
  __label_2: # endif
.annotate 'line', 3169
    .return($S1)
.annotate 'line', 3170

.end # emit_getint


.sub 'emit_getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3173
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3174
    $P1 = self.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3175
    eq $S1, 'P', __label_3
.annotate 'line', 3176
    set $S3, $S2
.annotate 'line', 3177
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 3178
    __ARG_1.'emitbox'($S2, $S3)
  __label_3: # endif
.annotate 'line', 3180
    .return($S2)
.annotate 'line', 3181

.end # emit_getvar


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.annotate 'line', 3184
    WSubId_73(self)
.annotate 'line', 3185

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 3103
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
.annotate 'line', 3190
    .return(1)

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 3188
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 3200
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3201
    $P1 = __ARG_1.'get'()
.annotate 'line', 3202
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3203
    WSubId_54('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3204
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
.annotate 'line', 3205

.end # FunctionExpr


.sub 'checkresult' :method
.annotate 'line', 3206
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 3209
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3210
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3211
    .return(self)
.annotate 'line', 3212

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3215
    self.'annotate'(__ARG_1)
.annotate 'line', 3216
    getattribute $P1, self, 'fn'
.annotate 'line', 3217
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3218
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3219
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3221
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 3222

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3195
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3197
    addattribute $P0, 'fn'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
.annotate 'line', 3240
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3241
    .return(self)
.annotate 'line', 3242

.end # set


.sub 'optimize_condition' :method
.annotate 'line', 3245
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3246

.end # optimize_condition


.sub 'optimize' :method
.annotate 'line', 3249
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3250
    .return(self)
.annotate 'line', 3251

.end # optimize


.sub 'getvalue' :method
.annotate 'line', 3254
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3255
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3256
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
.annotate 'line', 3257
    .return(0)
.annotate 'line', 3258

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3261
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3263
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3264
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3265
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3267
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3268
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if $S2 == 'S' goto __label_7
    if $S2 == 'P' goto __label_8
    if $S2 == 'I' goto __label_9
    if $S2 == 'N' goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 3271
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3274
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3277
    WSubId_6('Invalid if condition')
  __label_5: # switch end
  __label_2: # endif
.annotate 'line', 3280

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3283
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3285
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3286
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3287
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3289
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3290
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if $S2 == 'S' goto __label_7
    if $S2 == 'P' goto __label_8
    if $S2 == 'I' goto __label_9
    if $S2 == 'N' goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 3293
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3296
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3299
    WSubId_6('Invalid if condition')
  __label_5: # switch end
  __label_2: # endif
.annotate 'line', 3302

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3237
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
.annotate 'line', 3309
    .return(1)

.end # isliteral


.sub 'hascompilevalue' :method
.annotate 'line', 3310
    .return(1)

.end # hascompilevalue


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3307
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3321
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3322
    setattribute self, 'strval', __ARG_2
.annotate 'line', 3323

.end # StringLiteral


.sub 'isstringliteral' :method
.annotate 'line', 3324
    .return(1)

.end # isstringliteral


.sub 'checkresult' :method
.annotate 'line', 3325
    .return('S')

.end # checkresult


.sub 'getPirString' :method
.annotate 'line', 3328
    getattribute $P1, self, 'strval'
.annotate 'line', 3329
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3330
    .return($S1)
.annotate 'line', 3331

.end # getPirString


.sub 'get_value' :method
.annotate 'line', 3334
    getattribute $P1, self, 'strval'
.annotate 'line', 3335
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3336
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3337
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3338
    .return($S1)
.annotate 'line', 3339

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3342
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
.annotate 'line', 3343

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3346
    .tailcall self.'getPirString'()
.annotate 'line', 3347

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3316
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3318
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3358
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3359
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3360
    set $I1, __ARG_3
.annotate 'line', 3361
    box $P1, $I1
    setattribute self, 'numval', $P1
.annotate 'line', 3362

.end # IntegerLiteral


.sub 'isintegerliteral' :method
.annotate 'line', 3363
    .return(1)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3366
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
.annotate 'line', 3367

.end # isintegerzero


.sub 'checkresult' :method
.annotate 'line', 3368
    .return('I')

.end # checkresult


.sub 'getIntegerValue' :method
.annotate 'line', 3371
    getattribute $P1, self, 'numval'
    .return($P1)
.annotate 'line', 3372

.end # getIntegerValue


.sub 'getFloatValue' :method
.annotate 'line', 3375
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3376
    .return($N1)
.annotate 'line', 3377

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3380
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3381
    if $I1 goto __label_1
.annotate 'line', 3382
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3384
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_2: # endif
.annotate 'line', 3385

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3388
    .tailcall self.'getIntegerValue'()
.annotate 'line', 3389

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3352
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3354
    addattribute $P0, 'pos'
.annotate 'line', 3355
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3399
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3400
    setattribute self, 'numval', __ARG_2
.annotate 'line', 3401

.end # FloatLiteral


.sub 'isfloatliteral' :method
.annotate 'line', 3402
    .return(1)

.end # isfloatliteral


.sub 'checkresult' :method
.annotate 'line', 3403
    .return('N')

.end # checkresult


.sub 'getFloatValue' :method
.annotate 'line', 3406
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3407
    .return($N1)
.annotate 'line', 3408

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3411
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3412
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3413

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_74 = "WSubId_74"
.annotate 'line', 3416
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3417
    .tailcall WSubId_74($N1)
.annotate 'line', 3418

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3394
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3396
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'concat_literal' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3428
    getattribute $P1, __ARG_1, 'strval'
.annotate 'line', 3429
    getattribute $P2, __ARG_2, 'strval'
.annotate 'line', 3432
    $P4 = $P1.'issinglequoted'()
    unless $P4 goto __label_3
    $P4 = $P2.'issinglequoted'()
  __label_3:
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 3434
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P6, $P1, 'file'
    getattribute $P7, $P1, 'line'
.annotate 'line', 3435
    getattribute $P8, $P1, 'str'
    set $S1, $P8
    getattribute $P9, $P2, 'str'
    set $S2, $P9
    concat $S3, $S1, $S2
    $P5.'TokenSingleQuoted'($P6, $P7, $S3)
    set $P3, $P5
    goto __label_1
  __label_2:
.annotate 'line', 3437
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P1, 'file'
    getattribute $P13, $P1, 'line'
.annotate 'line', 3438
    $P14 = $P1.'getasquoted'()
    set $S4, $P14
    $P15 = $P2.'getasquoted'()
    set $S5, $P15
    concat $S6, $S4, $S5
    $P11.'TokenQuoted'($P12, $P13, $S6)
    set $P10, $P11
    set $P3, $P10
  __label_1:
.annotate 'line', 3439
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 3440

.end # concat_literal

.namespace [ 'Winxed'; 'Compiler'; 'FunctionRef' ]

.sub 'FunctionRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3449
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3450
    setattribute self, 'sym', __ARG_3
.annotate 'line', 3451

.end # FunctionRef


.sub 'checkresult' :method
.annotate 'line', 3452
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3455
    getattribute $P1, self, 'sym'
.annotate 'line', 3456
    getattribute $P3, $P1, 'owner'
    $P2 = $P3.'getpath'()
.annotate 'line', 3457
    self.'annotate'(__ARG_1)
.annotate 'line', 3458
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'name'
    $P2.'emit_get_global'(__ARG_1, $P3, __ARG_2, $P4)
.annotate 'line', 3459

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
.annotate 'line', 3444
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3446
    addattribute $P0, 'sym'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
.annotate 'line', 3466
    .return(1)

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3469
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3470
    setattribute self, 'name', __ARG_2
.annotate 'line', 3471

.end # IdentifierExpr


.sub 'isnull' :method
.annotate 'line', 3474
    getattribute $P1, self, 'name'
.annotate 'line', 3475
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3476
    .return(0)
  __label_1: # endif
.annotate 'line', 3477
    .tailcall $P1.'iskeyword'('null')
.annotate 'line', 3478

.end # isnull


.sub 'checkresult' :method
.annotate 'line', 3481
    getattribute $P1, self, 'name'
.annotate 'line', 3482
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3483
    if_null $P2, __label_1
.annotate 'line', 3484
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
.annotate 'line', 3486
    set $S1, $P1
    if $S1 == 'self' goto __label_5
    if $S1 == 'null' goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3489
    .return('P')
  __label_4: # default
.annotate 'line', 3491
    .return('')
  __label_3: # switch end
  __label_2: # endif
.annotate 'line', 3494

.end # checkresult


.sub 'getName' :method
.annotate 'line', 3497
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3498
    .return($S1)
.annotate 'line', 3499

.end # getName


.sub 'checkVar' :method
.annotate 'line', 3502
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
.annotate 'line', 3503

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3506
    getattribute $P1, self, 'name'
.annotate 'line', 3507
    unless_null $P1, __label_1
.annotate 'line', 3508
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3509
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3510
    null $S1
.annotate 'line', 3511
    unless_null $P2, __label_2
.annotate 'line', 3512
    set $S2, $P1
    if $S2 == 'self' goto __label_6
    if $S2 == 'null' goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3515
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3517
    set $S1, ''
  __label_4: # switch end
    goto __label_3
  __label_2: # else
.annotate 'line', 3521
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3522
    .return($S1)
.annotate 'line', 3523

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_75 = "WSubId_75"
.annotate 'line', 3526
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3527
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3528
    getattribute $P2, self, 'name'
    WSubId_75($P2)
  __label_1: # endif
.annotate 'line', 3529
    .return($P1)
.annotate 'line', 3530

.end # getIdentifier


.sub 'optimize' :method
.annotate 'line', 3533
    getattribute $P1, self, 'name'
.annotate 'line', 3534
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3535
    if_null $P2, __label_1
.annotate 'line', 3536
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3537
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3538
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3539
    band $I2, $I1, 1
    unless $I2 goto __label_4
.annotate 'line', 3540
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3541
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
    goto __label_5
  __label_4: # else
.annotate 'line', 3548
    $P3 = $P2.'getreg'()
.annotate 'line', 3549
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3550
    set $S4, $P3
    box $P5, $S4
    setattribute self, 'subid', $P5
  __label_7: # endif
  __label_5: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 3554
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3556
    isnull $I2, $P4
    if $I2 goto __label_11
.annotate 'line', 3558
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I2 goto __label_12
.annotate 'line', 3568
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I2 goto __label_13
    goto __label_10
  __label_11: # case
    goto __label_9 # break
  __label_12: # case
.annotate 'line', 3559
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_14
.annotate 'line', 3560
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_16
    set $S1, $P6
  __label_16:
.annotate 'line', 3561
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3562
    self.'usesubid'($S1)
.annotate 'line', 3563
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
    goto __label_15
  __label_14: # else
.annotate 'line', 3566
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionRef'($P7, $P8, $P4)
    set $P5, $P6
    .return($P5)
  __label_15: # endif
    goto __label_9 # break
  __label_13: # case
.annotate 'line', 3569
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    $P10.'FunctionRef'($P11, $P12, $P4)
    set $P9, $P10
    .return($P9)
  __label_10: # default
  __label_9: # switch end
  __label_2: # endif
.annotate 'line', 3572
    .return(self)
.annotate 'line', 3573

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
.annotate 'line', 3576
    null $S1
.annotate 'line', 3577
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3578
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 3580
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3581
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3582
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_3:
.annotate 'line', 3583
    band $I2, $I1, 1
    unless $I2 goto __label_5
.annotate 'line', 3584
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3585
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3586
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3587
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif
.annotate 'line', 3591
    .return($S1)
.annotate 'line', 3592

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3595
    self.'annotate'(__ARG_1)
.annotate 'line', 3596
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3597
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3598

.end # emit


.sub 'emit_void' :method

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3602
    self.'annotate'(__ARG_1)
.annotate 'line', 3603
    .tailcall self.'emit_getid'(__ARG_1)
.annotate 'line', 3604

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3607
    self.'annotate'(__ARG_1)
.annotate 'line', 3608
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3609
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3610
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3611
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3612
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
.annotate 'line', 3613
    if $S1 == 'S' goto __label_8
    if $S1 == 'P' goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3616
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3619
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
    goto __label_5
  __label_4: # else
.annotate 'line', 3622
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3623
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 3625
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3626
    ne $S3, 'v', __label_13
.annotate 'line', 3627
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3628
    ne $S1, $S3, __label_14
.annotate 'line', 3629
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 3632
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3633
    self.'annotate'(__ARG_1)
.annotate 'line', 3634
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3635
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3637
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
  __label_15: # endif
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3640
    .return($S2)
.annotate 'line', 3641

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3462
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3464
    addattribute $P0, 'name'
.annotate 'line', 3465
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3651
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3652
    setattribute self, 'desc', __ARG_2
.annotate 'line', 3653

.end # LexicalVolatileExpr


.sub 'checkresult' :method
.annotate 'line', 3656
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
.annotate 'line', 3657

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3660
    getattribute $P1, self, 'desc'
.annotate 'line', 3661
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3662
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3663
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3664
    .return($S2)
.annotate 'line', 3665

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3668
    self.'annotate'(__ARG_1)
.annotate 'line', 3669
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3670
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3671

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3674
    getattribute $P1, self, 'owner'
.annotate 'line', 3675
    getattribute $P2, self, 'desc'
.annotate 'line', 3676
    $P3 = $P2.'gettype'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3677
    null $S2
.annotate 'line', 3679
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3683
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3680
    $P3 = $P1.'tempreg'($S1)
    set $S2, $P3
.annotate 'line', 3681
    __ARG_1.'emitnull'($S2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3684
    $P4 = $P1.'tempreg'($S1)
    set $S2, $P4
.annotate 'line', 3685
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3688
    ne $S1, 'P', __label_6
.annotate 'line', 3689
    $P5 = __ARG_2.'emit_getvar'(__ARG_1)
    set $S2, $P5
    goto __label_7
  __label_6: # else
.annotate 'line', 3690
    $P6 = __ARG_2.'checkresult'()
    set $S3, $P6
    ne $S1, $S3, __label_8
.annotate 'line', 3691
    $P7 = __ARG_2.'emit_get'(__ARG_1)
    set $S2, $P7
    goto __label_9
  __label_8: # else
.annotate 'line', 3693
    $P8 = $P1.'tempreg'($S1)
    set $S2, $P8
.annotate 'line', 3694
    __ARG_2.'emit'(__ARG_1, $S2)
  __label_9: # endif
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 3698
    $P3 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P3, $S2)
.annotate 'line', 3699
    .return($S2)
.annotate 'line', 3700

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3703
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
.annotate 'line', 3704

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3646
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3648
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3713
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3714

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3709
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
.annotate 'line', 3724
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3725
    $P2 = WSubId_69(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3726
    getattribute $P1, self, 'key'
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3727
    WSubId_54('namespace identifier', __ARG_3)
  __label_1: # endif
.annotate 'line', 3728

.end # OpNamespaceExpr


.sub 'checkresult' :method
.annotate 'line', 3729
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3732
    getattribute $P1, self, 'owner'
.annotate 'line', 3733
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3734
    unless_null $P2, __label_1
.annotate 'line', 3735
    getattribute $P4, self, 'start'
    WSubId_1('unknown namespace', $P4)
  __label_1: # endif
.annotate 'line', 3736
    $P3 = $P2.'getpath'()
.annotate 'line', 3737
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3738

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3719
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3721
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_76 = "WSubId_76"
.annotate 'line', 3749
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3750
    $P2 = WSubId_76(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
.annotate 'line', 3751

.end # OpClassExpr


.sub 'checkresult' :method
.annotate 'line', 3752
    .return('P')

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3755
    getattribute $P1, self, 'owner'
.annotate 'line', 3756
    getattribute $P2, self, 'clspec'
.annotate 'line', 3757
    null $P3
.annotate 'line', 3760
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
.annotate 'line', 3763
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    if $I1 goto __label_4
.annotate 'line', 3766
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 3761
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3762
    if_null $P3, __label_7
    getattribute $P4, $P3, 'path'
    goto __label_6
  __label_7:
    null $P4
  __label_6:
    .return($P4)
  __label_4: # case
.annotate 'line', 3764
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3765
    if_null $P3, __label_9
    getattribute $P5, $P3, 'path'
    goto __label_8
  __label_9:
    null $P5
  __label_8:
    .return($P5)
  __label_5: # case
.annotate 'line', 3767
    typeof $P6, $P2
    set $S1, $P6
    concat $S2, $S1, " not supported yet here"
.annotate 'line', 3768
    getattribute $P7, $P2, 'start'
.annotate 'line', 3767
    WSubId_1($S2, $P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3770
    getattribute $P4, $P2, 'start'
    WSubId_6("Unexpected class key", $P4)
.annotate 'line', 3771

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3774
    getattribute $P1, self, 'owner'
.annotate 'line', 3775
    getattribute $P2, self, 'clspec'
.annotate 'line', 3778
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 3779
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3780
    if_null $P3, __label_4
.annotate 'line', 3781
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3782
    .return()
  __label_4: # endif
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3787
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3788
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3789
    __ARG_1.'say'()
.annotate 'line', 3790

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3743
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3745
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3800
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3801
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3802

.end # OpUnaryExpr


.sub 'optimizearg' :method
.annotate 'line', 3805
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
.annotate 'line', 3806

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 3809
    self.'optimizearg'()
.annotate 'line', 3810
    .return(self)
.annotate 'line', 3811

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3795
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3797
    addattribute $P0, 'subexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3822
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3823
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3824
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3825

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3828
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3829
    .return(self)
.annotate 'line', 3830

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
.annotate 'line', 3833
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 3834

.end # setfrom


.sub 'optimizearg' :method
.annotate 'line', 3837
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3838
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3839

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 3842
    self.'optimizearg'()
.annotate 'line', 3843
    .return(self)
.annotate 'line', 3844

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
.annotate 'line', 3847
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 3848

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
.annotate 'line', 3851
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 3852

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3816
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3818
    addattribute $P0, 'lexpr'
.annotate 'line', 3819
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3861
    .return('I')
.annotate 'line', 3862

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3865
    self.'optimizearg'()
.annotate 'line', 3866
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3867
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3868
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3869
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 3870
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3871
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_25($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 3873
    .return(self)
.annotate 'line', 3874

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3857
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
.annotate 'line', 3883
    .return('I')
.annotate 'line', 3884

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3879
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3892
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3893

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3896
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3897
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3898
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3899
    self.'annotate'(__ARG_1)
.annotate 'line', 3900
    __ARG_1.'print'('    delete ')
.annotate 'line', 3901
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3902
    __ARG_1.'say'()
.annotate 'line', 3903
    __ARG_1.'emitset'(__ARG_2, '1')
    goto __label_2
  __label_1: # else
.annotate 'line', 3906
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
.annotate 'line', 3907

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3888
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3914
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3915

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3918
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3919
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3920
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3921
    self.'annotate'(__ARG_1)
.annotate 'line', 3922
    __ARG_1.'print'('    exists ', __ARG_2, ', ')
.annotate 'line', 3923
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3924
    __ARG_1.'say'()
    goto __label_2
  __label_1: # else
.annotate 'line', 3927
    WSubId_1("exists with invalid operator", self)
  __label_2: # endif
.annotate 'line', 3928

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3910
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3937
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3938

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
.annotate 'line', 3941
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 3942

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3945
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3946
    .return(self)
.annotate 'line', 3947

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 3950
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3951
    self.'optimizearg'()
.annotate 'line', 3952
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3953
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3954
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 3957
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3958
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3959
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_77($P2, $P3, $N2)
  __label_2: # endif
.annotate 'line', 3962
    .return(self)
.annotate 'line', 3963

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3966
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3967
    self.'annotate'(__ARG_1)
.annotate 'line', 3968
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
.annotate 'line', 3969

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3933
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3978
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3979

.end # OpNotExpr


.sub 'isnegable' :method
.annotate 'line', 3980
    .return(1)

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 3983
    .return('I')
.annotate 'line', 3984

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3987
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3988
    .return(self)
.annotate 'line', 3989

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3992
    self.'optimizearg'()
.annotate 'line', 3993
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3994
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3995
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3996
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 3998
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3999
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4000
    .return(self)
.annotate 'line', 4001

.end # optimize


.sub 'negated' :method
.annotate 'line', 4004
    getattribute $P1, self, 'subexpr'
    .return($P1)
.annotate 'line', 4005

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4008
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4009
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4010
    self.'annotate'(__ARG_1)
.annotate 'line', 4011
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if $S2 == 'I' goto __label_4
    if $S2 == 'P' goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 4013
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 4016
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 4019
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
.annotate 'line', 4021

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3974
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]

.sub 'OpBinNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4030
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4031

.end # OpBinNotExpr


.sub 'checkresult' :method
.annotate 'line', 4034
    .return('I')
.annotate 'line', 4035

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4038
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4039
    .return(self)
.annotate 'line', 4040

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4043
    self.'optimizearg'()
.annotate 'line', 4044
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4045
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4046
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4047
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4049
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4050
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4051
    .return(self)
.annotate 'line', 4052

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4055
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4056
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4057
    self.'annotate'(__ARG_1)
.annotate 'line', 4058
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
.annotate 'line', 4059

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 4026
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
.annotate 'line', 4068
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4069

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4072
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4073
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 4074
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 4075

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 4064
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4084
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4085
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4086

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4089
    self.'emit_get'(__ARG_1)
.annotate 'line', 4090

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 4080
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4097
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4098

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4101
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4102
    self.'annotate'(__ARG_1)
.annotate 'line', 4103
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4104
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4105
    .return($S1)
.annotate 'line', 4106

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 4093
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4113
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4114

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4117
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4118
    self.'annotate'(__ARG_1)
.annotate 'line', 4119
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4120
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4121
    .return($S1)
.annotate 'line', 4122

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 4109
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4131
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4132

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4135
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4136
    self.'annotate'(__ARG_1)
.annotate 'line', 4137
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4138
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4139
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4140
    .return($S1)
.annotate 'line', 4141

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4144
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4145
    self.'annotate'(__ARG_1)
.annotate 'line', 4146
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4147
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4148

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 4127
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4155
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4156

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4159
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4160
    self.'annotate'(__ARG_1)
.annotate 'line', 4161
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4162
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4163
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4164
    .return($S1)
.annotate 'line', 4165

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4168
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4169
    self.'annotate'(__ARG_1)
.annotate 'line', 4170
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4171
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4172

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 4151
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4183
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4184
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4185
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 4186
    .return(self)
.annotate 'line', 4187

.end # set


.sub 'checkresult' :method
.annotate 'line', 4190
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4191

.end # checkresult


.sub 'optimize_base' :method
.annotate 'line', 4194
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 4195
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 4196
    .return(self)
.annotate 'line', 4197

.end # optimize_base


.sub 'optimize' :method
.annotate 'line', 4200
    .tailcall self.'optimize_base'()
.annotate 'line', 4201

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_73 = "WSubId_73"
.annotate 'line', 4204
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4205
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
    $P2 = $P1.'isliteral'()
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4206
    WSubId_73($P1)
  __label_1: # endif
.annotate 'line', 4207

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4210
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4211
    self.'annotate'(__ARG_1)
.annotate 'line', 4212
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4213

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 4177
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4179
    addattribute $P0, 'lexpr'
.annotate 'line', 4180
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4222
    self.'annotate'(__ARG_1)
.annotate 'line', 4223
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4224
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4225

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4228
    self.'annotate'(__ARG_1)
.annotate 'line', 4229
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4230
    getattribute $P2, self, 'rexpr'
    $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4231

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 4218
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4240
    self.'annotate'(__ARG_1)
.annotate 'line', 4241
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4242
    __ARG_1.'emitassign'(__ARG_2, $S1)
.annotate 'line', 4243

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 4246
    self.'checkleft'()
.annotate 'line', 4247
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4248
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 4249
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 4250
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 4251
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 4252
    self.'annotate'(__ARG_1)
.annotate 'line', 4253
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 4254
    .return($S1)
.annotate 'line', 4255

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4258
    self.'annotate'(__ARG_1)
.annotate 'line', 4259
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4260

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 4236
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4269
    self.'checkleft'()
.annotate 'line', 4270
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4271
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4272
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4273
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4274
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4275
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 4276
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
.annotate 'line', 4278
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 4279
    null $S5
.annotate 'line', 4280
    self.'annotate'(__ARG_1)
.annotate 'line', 4281
    if $S1 == 'S' goto __label_10
    if $S1 == 'I' goto __label_11
    if $S1 == 'N' goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 4283
    eq $S2, 'S', __label_13
.annotate 'line', 4284
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4285
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4286
    set $S4, $S5
  __label_13: # endif
.annotate 'line', 4288
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 4292
    eq $S1, $S2, __label_14
.annotate 'line', 4293
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4294
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4295
    set $S4, $S5
  __label_14: # endif
.annotate 'line', 4297
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4300
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
  __label_5: # endif
.annotate 'line', 4303
    .return($S3)
.annotate 'line', 4304

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4307
    self.'emit_get'(__ARG_1)
.annotate 'line', 4308

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 4265
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 4317
    self.'checkleft'()
.annotate 'line', 4318
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4319
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4320
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4321
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4322
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4323
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4324
    null $S5
.annotate 'line', 4325
    self.'annotate'(__ARG_1)
.annotate 'line', 4326
    if $S1 == 'S' goto __label_7
    if $S1 == 'I' goto __label_8
    if $S1 == 'N' goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 4328
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4331
    eq $S1, $S2, __label_10
.annotate 'line', 4332
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4333
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4334
    set $S4, $S5
  __label_10: # endif
.annotate 'line', 4336
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 4339
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 4341
    .return($S3)
.annotate 'line', 4342

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4313
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4351
    self.'checkleft'()
.annotate 'line', 4352
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4353
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4354
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4355
    null $S2
.annotate 'line', 4356
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    if $S3 == 'S' goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 4358
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4359
    self.'annotate'(__ARG_1)
.annotate 'line', 4360
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 4363
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4364
    self.'annotate'(__ARG_1)
.annotate 'line', 4365
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_2: # switch end
.annotate 'line', 4367
    .return($S1)
.annotate 'line', 4368

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4347
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4377
    self.'checkleft'()
.annotate 'line', 4378
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4379
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4380
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4381
    self.'annotate'(__ARG_1)
.annotate 'line', 4382
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 4383
    .return($S2)
.annotate 'line', 4384

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4373
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4393
    self.'checkleft'()
.annotate 'line', 4394
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4395
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4396
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4397
    self.'annotate'(__ARG_1)
.annotate 'line', 4398
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 4399
    .return($S2)
.annotate 'line', 4400

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4389
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4412
    .return('I')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4415
    self.'optimizearg'()
.annotate 'line', 4416
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4417
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4418
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4419
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 4420
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4421
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_25($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 4423
    .return(self)
.annotate 'line', 4424

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 4427
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4428
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4429
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4430
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4431
    self.'annotate'(__ARG_1)
.annotate 'line', 4432
    null $S5
.annotate 'line', 4434
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4439
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4444
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4449
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4454
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4459
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4435
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4436
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4437
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4440
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4441
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4442
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4445
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4446
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4447
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4450
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4451
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4452
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4455
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4456
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4457
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4460
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4461
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4462
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4466
    if __ARG_3 == 0 goto __label_21
    if __ARG_3 == 1 goto __label_22
    if __ARG_3 == 2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4468
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4471
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 4474
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 4477

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4480
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4481

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4484
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
.annotate 'line', 4485

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4488
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
.annotate 'line', 4489

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4410
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
.annotate 'line', 4500
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
.annotate 'line', 4501

.end # Negable


.sub 'isnegable' :method
.annotate 'line', 4502
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4505
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4506
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4507
    .return(self)
.annotate 'line', 4508

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4496
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4522
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4523
    self.'Negable'(__ARG_3)
.annotate 'line', 4524
    setattribute self, 'expr', __ARG_2
.annotate 'line', 4525

.end # CheckerExpr


.sub 'checkresult' :method
.annotate 'line', 4526
    .return('I')

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4516
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4518
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4533
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4534

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4537
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4538
    self.'annotate'(__ARG_1)
.annotate 'line', 4539
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4540
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4541
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
.annotate 'line', 4542

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4545
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4546
    self.'annotate'(__ARG_1)
.annotate 'line', 4547
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4548
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4550
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4551

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4529
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]

.sub 'ZeroCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4558
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4559

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4562
    getattribute $P1, self, 'expr'
.annotate 'line', 4563
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4564
    self.'annotate'(__ARG_1)
.annotate 'line', 4565
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4566
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4568
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_3: # endif
.annotate 'line', 4569

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4572
    getattribute $P1, self, 'expr'
.annotate 'line', 4573
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4574
    self.'annotate'(__ARG_1)
.annotate 'line', 4575
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4576
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4578
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4579

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4554
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
.annotate 'line', 4588
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4589
    self.'Negable'(__ARG_5)
.annotate 'line', 4590

.end # OpEqualExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4593
    self.'optimizearg'()
.annotate 'line', 4594
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4595
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4596
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4597
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4598
    unless $I1 goto __label_1
.annotate 'line', 4599
    unless $I2 goto __label_2
.annotate 'line', 4600
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_25($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4602
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
  __label_1: # endif
.annotate 'line', 4604
    unless $I2 goto __label_4
.annotate 'line', 4605
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4606
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4607
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4608
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_8
    $P3 = $P2.'isliteral'()
  __label_8:
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 4609
    ne $S1, $S2, __label_9
.annotate 'line', 4610
    if $S1 == 'I' goto __label_12
    if $S1 == 'S' goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4612
    $P4 = $P1.'getIntegerValue'()
    set $I3, $P4
.annotate 'line', 4613
    $P5 = $P2.'getIntegerValue'()
    set $I4, $P5
.annotate 'line', 4614
    getattribute $P6, self, 'positive'
    if_null $P6, __label_15
    unless $P6 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4615
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    .tailcall WSubId_25($P7, $P8, $I5)
  __label_13: # case
.annotate 'line', 4617
    getattribute $P10, $P1, 'strval'
    getattribute $P9, $P10, 'str'
    null $S3
    if_null $P9, __label_16
    set $S3, $P9
  __label_16:
.annotate 'line', 4618
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_17
    set $S4, $P11
  __label_17:
.annotate 'line', 4619
    getattribute $P13, self, 'positive'
    if_null $P13, __label_19
    unless $P13 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4620
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    .tailcall WSubId_25($P14, $P15, $I6)
  __label_11: # default
  __label_10: # switch end
  __label_9: # endif
  __label_7: # endif
.annotate 'line', 4624
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4625
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4626
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4627
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4628
    .return(self)
.annotate 'line', 4629

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4632
    self.'annotate'(__ARG_1)
.annotate 'line', 4633
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'iseq'
    goto __label_1
  __label_2:
    set $S1, 'isne'
  __label_1:
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4634

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4637
    self.'annotate'(__ARG_1)
.annotate 'line', 4638
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4639

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4642
    self.'annotate'(__ARG_1)
.annotate 'line', 4643
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'eq'
    goto __label_1
  __label_2:
    set $S1, 'ne'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4644

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4647
    self.'annotate'(__ARG_1)
.annotate 'line', 4648
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'ne'
    goto __label_1
  __label_2:
    set $S1, 'eq'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4649

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4584
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
.annotate 'line', 4660
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4661
    self.'Negable'(__ARG_5)
.annotate 'line', 4662

.end # OpSameExpr


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4665
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
.annotate 'line', 4666

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4669
    self.'annotate'(__ARG_1)
.annotate 'line', 4670
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4671
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4672
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4673

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4676
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4677

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4680
    self.'annotate'(__ARG_1)
.annotate 'line', 4681
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4682
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4683
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4684

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4687
    self.'annotate'(__ARG_1)
.annotate 'line', 4688
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4689
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4690
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4691

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4655
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4657
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4698
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4701
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4702

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4705
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4706

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4709
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4710

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4713
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4714

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4717
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4718

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4696
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4725
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4728
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4729

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4732
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4733

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4736
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4737

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4740
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4741

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4744
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4745

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4723
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4752
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4755
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4756

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4759
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4760

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4763
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4764

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4767
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4768

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4771
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4772

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4750
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4779
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4782
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4783

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4786
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4787

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4790
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4791

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4794
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4795

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4798
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4799

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4777
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4808
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
.annotate 'line', 4810

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4804
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4819
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4820

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4823
    self.'optimizearg'()
.annotate 'line', 4824
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 4825
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4826
    unless $I1 goto __label_3
.annotate 'line', 4827
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4828
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_25($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4826
    .return($P1)
  __label_1: # endif
.annotate 'line', 4830
    .return(self)
.annotate 'line', 4831

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4834
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4835
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4836
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4837
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
.annotate 'line', 4838
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 4839
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 4840
    __ARG_1.'emitbinop'('and', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 4843
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 4844
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 4845
    getattribute $P5, self, 'lexpr'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 4846
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 4849
    getattribute $P3, self, 'lexpr'
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 4850
    __ARG_1.'emitunless'(__ARG_2, $S4)
.annotate 'line', 4851
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 4852
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 4853
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 4856
    getattribute $P3, self, 'rexpr'
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 4857
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 4859

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4815
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4868
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4869

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4872
    self.'optimizearg'()
.annotate 'line', 4873
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 4874
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4875
    if $I1 goto __label_3
.annotate 'line', 4876
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4877
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_25($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4875
    .return($P1)
  __label_1: # endif
.annotate 'line', 4879
    .return(self)
.annotate 'line', 4880

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4883
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4884
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4885
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4886
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    getattribute $P5, self, 'rexpr'
    $P3 = $P5.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 4887
    $P6 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 4888
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 4889
    __ARG_1.'emitbinop'('or', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 4892
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 4893
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 4894
    getattribute $P5, self, 'lexpr'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 4895
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 4898
    getattribute $P3, self, 'lexpr'
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 4899
    __ARG_1.'emitif'(__ARG_2, $S4)
.annotate 'line', 4900
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 4901
    getattribute $P5, self, 'rexpr'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 4902
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 4905
    getattribute $P3, self, 'rexpr'
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 4906
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 4908

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4864
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4913
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4923
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4924

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4927
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4928
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4929
    self.'annotate'(__ARG_1)
.annotate 'line', 4930
    __ARG_1.'emitbinop'('band', __ARG_2, $S1, $S2)
.annotate 'line', 4931

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4934
    band $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4935

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4919
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4944
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4945

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4948
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4949
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4950
    self.'annotate'(__ARG_1)
.annotate 'line', 4951
    __ARG_1.'emitbinop'('bor', __ARG_2, $S1, $S2)
.annotate 'line', 4952

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4955
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4956

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4940
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4965
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4966

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4969
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4970
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4971
    self.'annotate'(__ARG_1)
.annotate 'line', 4972
    __ARG_1.'emitbinop'('bxor', __ARG_2, $S1, $S2)
.annotate 'line', 4973

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4976
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4977

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4961
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4987
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4989
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4996
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4990
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4991
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4992
    getattribute $P3, __ARG_4, 'values'
    self.'append'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 4994
    self.'pushexpr'(__ARG_4)
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4997
    getattribute $P5, __ARG_4, 'values'
    setattribute self, 'values', $P5
.annotate 'line', 4998
    self.'unshiftexpr'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 5001
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = __ARG_3
    $P7[1] = __ARG_4
    setattribute self, 'values', $P7
  __label_1: # switch end
.annotate 'line', 5003

.end # ConcatString


.sub 'pushexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5006
    getattribute $P1, self, 'values'
.annotate 'line', 5007
    $P2 = $P1[-1]
.annotate 'line', 5008
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5009
    $P4 = WSubId_78($P2, __ARG_1)
    $P1[-1] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5011
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 5012

.end # pushexpr


.sub 'unshiftexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5015
    getattribute $P1, self, 'values'
.annotate 'line', 5016
    $P2 = $P1[0]
.annotate 'line', 5017
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5018
    $P4 = WSubId_78(__ARG_1, $P2)
    $P1[0] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5020
    'unshift'($P1, __ARG_1)
  __label_2: # endif
.annotate 'line', 5021

.end # unshiftexpr


.sub 'append' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5024
    getattribute $P1, self, 'values'
.annotate 'line', 5025
    $P2 = $P1[-1]
.annotate 'line', 5026
    $P4 = $P2.'isstringliteral'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5027
    $P3 = __ARG_1[0]
.annotate 'line', 5028
    $P4 = $P3.'isstringliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5029
    $P5 = WSubId_78($P2, $P3)
    $P1[-1] = $P5
.annotate 'line', 5030
    __ARG_1.'shift'()
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 5033
    $P1.'append'(__ARG_1)
.annotate 'line', 5034

.end # append


.sub 'checkresult' :method
.annotate 'line', 5036
    .return('S')

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
.annotate 'line', 5039
    getattribute $P1, self, 'values'
.annotate 'line', 5040
    elements $I1, $P1
.annotate 'line', 5041
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 5042
    null $I2
.annotate 'line', 5043
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5044
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 5043
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5045
    .return($P2)
.annotate 'line', 5046

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5049
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5050
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 5051

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 5054
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5055
    elements $I1, $P1
.annotate 'line', 5056
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5057
    self.'annotate'(__ARG_1)
.annotate 'line', 5058
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
.annotate 'line', 5059
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 5060
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 5059
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 5061
    .return($S1)
.annotate 'line', 5062

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5065
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5066
    elements $I1, $P1
.annotate 'line', 5067
    self.'annotate'(__ARG_1)
.annotate 'line', 5068
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5069
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 5068
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5070

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4982
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4984
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
.annotate 'line', 5079
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 5080

.end # RepeatString


.sub 'checkresult' :method
.annotate 'line', 5081
    .return('S')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5084
    getattribute $P1, self, 'rexpr'
.annotate 'line', 5085
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5086
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5087
    self.'annotate'(__ARG_1)
.annotate 'line', 5088
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
.annotate 'line', 5089

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 5075
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5098
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5099

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5102
    self.'optimizearg'()
.annotate 'line', 5103
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5104
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5105
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5106
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5107
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5108
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'S'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5109
    .tailcall WSubId_78($P1, $P2)
  __label_5: # endif
.annotate 'line', 5110
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_8
    iseq $I3, $S2, 'I'
  __label_8:
    unless $I3 goto __label_7
.annotate 'line', 5111
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5112
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5113
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_7: # endif
.annotate 'line', 5116
    $P3 = WSubId_79($S1, $S2)
    if_null $P3, __label_9
    unless $P3 goto __label_9
.annotate 'line', 5117
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5118
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5119
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_77($P3, $P4, $N3)
  __label_9: # endif
  __label_3: # endif
.annotate 'line', 5123
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'S'
  __label_11:
    unless $I3 goto __label_10
.annotate 'line', 5124
    new $P4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'ConcatString'($P5, $P6, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_10: # endif
.annotate 'line', 5126
    .return(self)
.annotate 'line', 5127

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_79 = "WSubId_79"
.annotate 'line', 5130
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5131
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5132
    ne $S1, $S2, __label_3
.annotate 'line', 5133
    .return($S1)
  __label_3: # endif
.annotate 'line', 5134
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 5135
    .return('S')
  __label_4: # endif
.annotate 'line', 5136
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 5137
    .return('S')
  __label_6: # endif
.annotate 'line', 5138
    $P1 = WSubId_79($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 5139
    .return('N')
  __label_8: # endif
.annotate 'line', 5140
    .return('I')
.annotate 'line', 5141

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5144
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5145
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5146
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5147
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5148
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5150
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5151
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5152
    ne $S1, 'S', __label_6
.annotate 'line', 5153
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
.annotate 'line', 5154
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 5155
    eq $S2, 'S', __label_11
.annotate 'line', 5156
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 5157
    set $S4, $S6
    goto __label_12
  __label_11: # else
.annotate 'line', 5160
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 5161
    set $S5, $S6
  __label_12: # endif
  __label_8: # endif
.annotate 'line', 5164
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
    goto __label_7
  __label_6: # else
.annotate 'line', 5167
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5168
    null $S7
.annotate 'line', 5169
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
.annotate 'line', 5171
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 5172
    __ARG_1.'emitset'($S7, $S4)
  __label_18: # endif
.annotate 'line', 5174
    null $S8
.annotate 'line', 5175
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
.annotate 'line', 5177
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 5178
    __ARG_1.'emitset'($S8, $S5)
  __label_20: # endif
.annotate 'line', 5180
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
    goto __label_14
  __label_13: # else
.annotate 'line', 5183
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
  __label_7: # endif
.annotate 'line', 5185

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 5094
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5194
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5195

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 5198
    self.'optimizearg'()
.annotate 'line', 5199
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5200
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5201
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5202
    $P4 = $P1.'checkresult'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5203
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 5204
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5205
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5206
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5207
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 5210
    .return(self)
.annotate 'line', 5211

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5214
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5215
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5217
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 5219
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 5221
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 5223
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 5218
    .return($S1)
  __label_6: # case
.annotate 'line', 5220
    .return('P')
  __label_8: # case
.annotate 'line', 5222
    .return('N')
  __label_10: # case
.annotate 'line', 5224
    .return('N')
  __label_4: # default
.annotate 'line', 5226
    .return('I')
  __label_3: # switch end
.annotate 'line', 5228

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5231
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5232
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5233
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5234
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5235
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5236
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5237
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5238
    null $S6
.annotate 'line', 5239
    eq $S2, $S1, __label_6
.annotate 'line', 5240
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5241
    ne $S1, 'P', __label_7
.annotate 'line', 5242
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 5244
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 5245
    set $S4, $S6
  __label_6: # endif
.annotate 'line', 5247
    eq $S3, $S1, __label_9
.annotate 'line', 5248
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5249
    ne $S1, 'P', __label_10
.annotate 'line', 5250
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 5252
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 5253
    set $S5, $S6
  __label_9: # endif
.annotate 'line', 5255
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
.annotate 'line', 5256

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 5190
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5265
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5266

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5269
    self.'optimizearg'()
.annotate 'line', 5270
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5271
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5272
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5273
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5274
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5275
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5276
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 5277
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5278
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_5: # endif
.annotate 'line', 5281
    $P3 = WSubId_79($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 5282
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5283
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5284
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_77($P3, $P4, $N3)
  __label_7: # endif
  __label_3: # endif
.annotate 'line', 5288
    ne $S1, 'S', __label_8
.annotate 'line', 5289
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 5290
    .return(self)
.annotate 'line', 5291

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5294
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5295
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5296
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5297
    ne $S1, $S2, __label_3
.annotate 'line', 5298
    .return($S1)
  __label_3: # endif
.annotate 'line', 5299
    ne $S1, 'S', __label_4
.annotate 'line', 5300
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5302
    .return('N')
  __label_5: # endif
.annotate 'line', 5303

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5306
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5307
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5308
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5309
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5310
    null $S3
    null $S4
.annotate 'line', 5311
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
.annotate 'line', 5312
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5313
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5314
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5315
    .return()
  __label_3: # endif
.annotate 'line', 5320
    ne $S1, 'N', __label_7
.annotate 'line', 5321
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5322
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5323
    null $S5
.annotate 'line', 5324
    if $S2 == 'I' goto __label_10
    if $S2 == 'N' goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5326
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5327
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5328
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5331
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5334
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5335
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 5337
    self.'annotate'(__ARG_1)
.annotate 'line', 5338
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
.annotate 'line', 5339
    .return()
  __label_7: # endif
.annotate 'line', 5342
    null $I1
    null $I2
.annotate 'line', 5343
    $P4 = $P1.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_14
    $P3 = $P1.'isidentifier'()
  __label_14:
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 5344
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S3, $P5
.annotate 'line', 5345
    $P1.'emit'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
.annotate 'line', 5348
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5349
    set $S3, $I1
  __label_13: # endif
.annotate 'line', 5351
    $P4 = $P2.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_17
    $P3 = $P2.'isidentifier'()
  __label_17:
    if_null $P3, __label_15
    unless $P3 goto __label_15
.annotate 'line', 5352
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S4, $P5
.annotate 'line', 5353
    $P2.'emit'(__ARG_1, $S4)
    goto __label_16
  __label_15: # else
.annotate 'line', 5356
    if $S2 == 'S' goto __label_20
    if $S2 == 'N' goto __label_21
    if $S2 == 'I' goto __label_22
    goto __label_19
  __label_20: # case
.annotate 'line', 5358
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5359
    $P2.'emit'(__ARG_1, $S4)
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5362
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_18 # break
  __label_22: # case
  __label_19: # default
.annotate 'line', 5366
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5367
    set $S4, $I2
    goto __label_18 # break
  __label_18: # switch end
  __label_16: # endif
.annotate 'line', 5371
    self.'annotate'(__ARG_1)
.annotate 'line', 5372
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5373

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 5261
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5382
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5383

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5386
    self.'optimizearg'()
.annotate 'line', 5387
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5388
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5389
    $P5 = $P1.'isliteral'()
    unless $P5 goto __label_2
    $P5 = $P2.'isliteral'()
  __label_2:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 5390
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 5391
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5392
    null $P3
.annotate 'line', 5393
    null $P4
.annotate 'line', 5394
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5395
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5396
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5397
    unless $I2 goto __label_7
.annotate 'line', 5398
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_25($P5, $P6, $N3)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 5401
    $P5 = WSubId_79($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
.annotate 'line', 5402
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5403
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5404
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5405
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_77($P5, $P6, $N3)
  __label_9: # endif
  __label_8: # endif
  __label_1: # endif
.annotate 'line', 5409
    .return(self)
.annotate 'line', 5410

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5413
    .return('N')
.annotate 'line', 5414

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5417
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5418
    null $P2
.annotate 'line', 5419
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5420
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
.annotate 'line', 5421
    $P2 = self.'tempreg'('N')
.annotate 'line', 5422
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5423
    set $P3, $P2
  __label_1: # endif
.annotate 'line', 5425
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5426
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5427
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
.annotate 'line', 5428
    $P2 = self.'tempreg'('N')
.annotate 'line', 5429
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5430
    set $P5, $P2
  __label_2: # endif
.annotate 'line', 5432
    self.'annotate'(__ARG_1)
.annotate 'line', 5433
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
.annotate 'line', 5434

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5378
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5443
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5444

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5447
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5448
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5449
    self.'annotate'(__ARG_1)
.annotate 'line', 5450
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5451

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5454
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5455

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5439
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5464
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5465

.end # OpCModExpr


.sub 'checkresult' :method
.annotate 'line', 5468
    .return('I')
.annotate 'line', 5469

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5472
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5473
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5474
    self.'annotate'(__ARG_1)
.annotate 'line', 5479
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5480

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5460
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5489
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5490

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5493
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5494
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5495
    self.'annotate'(__ARG_1)
.annotate 'line', 5496
    __ARG_1.'emitbinop'('shl', __ARG_2, $S1, $S2)
.annotate 'line', 5497

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5500
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5501

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5485
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5510
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5511

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5514
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5515
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5516
    self.'annotate'(__ARG_1)
.annotate 'line', 5517
    __ARG_1.'emitbinop'('shr', __ARG_2, $S1, $S2)
.annotate 'line', 5518

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5521
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5522

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5506
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5531
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 5532

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 5535
    null $I1
    null $I2
.annotate 'line', 5536
    set $S1, ''
.annotate 'line', 5537
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 5538
    $P5 = $P1.'getname'()
    set $S2, $P5
    if $S2 == 'flat' goto __label_5
    if $S2 == 'named' goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5540
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5543
    set $I2, 1
.annotate 'line', 5544
    $P6 = $P1.'numargs'()
    set $I3, $P6
    if $I3 == 0 goto __label_9
    if $I3 == 1 goto __label_10
    goto __label_8
  __label_9: # case
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 5548
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5549
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5550
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5551
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5554
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5559
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5562
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5565
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5560
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5563
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5566
    __ARG_1.'print'(' :named')
.annotate 'line', 5567
    eq $S1, '', __label_17
.annotate 'line', 5568
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5571

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5527
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5580
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5581
    setattribute self, 'modifiers', __ARG_2
.annotate 'line', 5582

.end # Argument


.sub 'optimize' :method
.annotate 'line', 5585
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5586
    .return(self)
.annotate 'line', 5587

.end # optimize


.sub 'hascompilevalue' :method
.annotate 'line', 5590
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
.annotate 'line', 5591

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5576
    addattribute $P0, 'arg'
.annotate 'line', 5577
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 5596
    null $P1
.annotate 'line', 5597
    $P2 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 5598
    $P3 = __ARG_1.'get'()
.annotate 'line', 5599
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5600
    $P3 = __ARG_1.'get'()
.annotate 'line', 5601
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 5602
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
    goto __label_4
  __label_3: # else
.annotate 'line', 5605
    WSubId_54('modifier list', $P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 5608
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5609
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
.annotate 'line', 5610

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_80 = "WSubId_80"
.annotate 'line', 5621
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5622
    setattribute self, 'start', __ARG_2
.annotate 'line', 5623
    $P1 = __ARG_3.'get'()
.annotate 'line', 5624
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 5625
    __ARG_3.'unget'($P1)
.annotate 'line', 5626
    $P3 = WSubId_50(__ARG_3, __ARG_1, WSubId_80, __ARG_4)
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 5628

.end # ArgumentList


.sub 'numargs' :method
.annotate 'line', 5631
    getattribute $P1, self, 'args'
.annotate 'line', 5632
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
    .return($I1)
.annotate 'line', 5633

.end # numargs


.sub 'getrawargs' :method
.annotate 'line', 5636
    getattribute $P1, self, 'args'
    .return($P1)
.annotate 'line', 5637

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 5640
    getattribute $P1, self, 'args'
.annotate 'line', 5641
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 5642

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
.annotate 'line', 5645
    getattribute $P1, self, 'args'
.annotate 'line', 5646
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
.annotate 'line', 5647

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 5650
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 5651
    .return(self)
.annotate 'line', 5652

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 5655
    getattribute $P1, self, 'argregs'
.annotate 'line', 5656
    unless_null $P1, __label_1
.annotate 'line', 5657
    new $P2, ['ResizableStringArray']
.annotate 'line', 5658
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 5659
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P4, $P6
.annotate 'line', 5660
    getattribute $P8, $P4, 'arg'
    $P7 = $P3.'add'($P8)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 5661
    push $P2, $S1
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5663
    setattribute self, 'argregs', $P2
  __label_1: # endif
.annotate 'line', 5665
    .return($P1)
.annotate 'line', 5666

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 5669
    getattribute $P1, self, 'args'
.annotate 'line', 5670
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5672
    set $S1, ''
.annotate 'line', 5673
    $P4 = self.'numargs'()
    set $I1, $P4
.annotate 'line', 5674
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5675
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5676
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5677
    if_null $P3, __label_4
.annotate 'line', 5678
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5679
    set $S1, ', '
  __label_1: # for iteration
.annotate 'line', 5674
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5681

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5614
    addattribute $P0, 'owner'
.annotate 'line', 5615
    addattribute $P0, 'start'
.annotate 'line', 5616
    addattribute $P0, 'args'
.annotate 'line', 5617
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_81')
        .param pmc __ARG_1
.annotate 'line', 5686
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5687
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5688
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5689
    .return(1)
.annotate 'line', 5690

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5701
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5702
    setattribute self, 'builtin', __ARG_3
.annotate 'line', 5703
    setattribute self, 'args', __ARG_4
.annotate 'line', 5704

.end # CallBuiltinExpr


.sub 'checkresult' :method
.annotate 'line', 5707
    getattribute $P1, self, 'builtin'
    .tailcall $P1.'result'()
.annotate 'line', 5708

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5711
    self.'emit'(__ARG_1, "")
.annotate 'line', 5712

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 5715
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5716
    if $S1 == 'I' goto __label_4
    if $S1 == 'N' goto __label_5
    if $S1 == 'S' goto __label_6
    if $S1 == 'P' goto __label_7
    if $S1 == 'v' goto __label_8
    goto __label_3
  __label_4: # case
  __label_5: # case
  __label_6: # case
  __label_7: # case
    goto __label_2 # break
  __label_8: # case
.annotate 'line', 5721
    getattribute $P1, self, 'start'
    WSubId_1("Can't use result of a void builtin", $P1)
  __label_3: # default
.annotate 'line', 5723
    concat $S4, "Unexpected result type '", $S1
    concat $S4, $S4, "'"
    getattribute $P2, self, 'start'
    WSubId_6($S4, $P2)
  __label_2: # switch end
.annotate 'line', 5725
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_9
    set $S2, $P1
  __label_9:
.annotate 'line', 5726
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 5727
    .return($S2)
.annotate 'line', 5728

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5731
    getattribute $P1, self, 'builtin'
.annotate 'line', 5732
    getattribute $P2, self, 'args'
.annotate 'line', 5733
    new $P3, ['ResizableStringArray']
.annotate 'line', 5734
    null $P4
.annotate 'line', 5735
    $P8 = $P1.'params'()
    set $I3, $P8
    if $I3 == -1 goto __label_3
    if $I3 == -2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5737
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P9, self, 'owner'
    $P5.'CollectValues'($P9, __ARG_1)
.annotate 'line', 5738
    if_null $P2, __label_6
    iter $P10, $P2
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P4, $P10
.annotate 'line', 5739
    getattribute $P12, $P4, 'arg'
    $P11 = $P5.'add'($P12)
    push $P3, $P11
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5742
    root_new $P6, ['parrot';'ResizablePMCArray']
.annotate 'line', 5743
    if_null $P2, __label_8
    iter $P13, $P2
    set $P13, 0
  __label_7: # for iteration
    unless $P13 goto __label_8
    shift $P4, $P13
.annotate 'line', 5744
    getattribute $P14, $P4, 'arg'
    push $P6, $P14
    goto __label_7
  __label_8: # endfor
.annotate 'line', 5745
    getattribute $P15, self, 'builtin'
    getattribute $P16, self, 'start'
    $P15.'expand'(__ARG_1, self, $P16, __ARG_2, $P6)
.annotate 'line', 5746
    .return()
  __label_2: # default
.annotate 'line', 5748
    getattribute $P17, self, 'args'
    set $I1, $P17
.annotate 'line', 5749
    new $P7, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P18, self, 'owner'
    $P7.'CollectValues'($P18, __ARG_1)
.annotate 'line', 5750
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
.annotate 'line', 5751
    $P19 = $P2[$I2]
    getattribute $P4, $P19, 'arg'
.annotate 'line', 5752
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
.annotate 'line', 5753
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
.annotate 'line', 5754
    null $S3
.annotate 'line', 5755
    $P8 = $P4.'isnull'()
    if_null $P8, __label_14
    unless $P8 goto __label_14
.annotate 'line', 5756
    if $S2 == 'I' goto __label_18
    if $S2 == 'N' goto __label_19
    if $S2 == 'S' goto __label_20
    goto __label_17
  __label_18: # case
  __label_19: # case
  __label_20: # case
.annotate 'line', 5760
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5761
    __ARG_1.'emitnull'($S3)
    goto __label_16 # break
  __label_17: # default
.annotate 'line', 5764
    $P11 = $P7.'add'($P4)
    set $S3, $P11
  __label_16: # switch end
    goto __label_15
  __label_14: # else
.annotate 'line', 5768
    iseq $I3, $S1, $S2
    if $I3 goto __label_24
    iseq $I3, $S2, '?'
  __label_24:
    if $I3 goto __label_23
.annotate 'line', 5769
    iseq $I3, $S2, 'p'
    unless $I3 goto __label_25
.annotate 'line', 5770
    iseq $I3, $S1, 'S'
    if $I3 goto __label_26
    iseq $I3, $S1, 'P'
  __label_26:
  __label_25:
  __label_23:
    unless $I3 goto __label_21
.annotate 'line', 5771
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
.annotate 'line', 5773
    ne $S2, 'p', __label_27
.annotate 'line', 5774
    set $S2, 'P'
  __label_27: # endif
.annotate 'line', 5775
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P8, __label_28
    set $S4, $P8
  __label_28:
.annotate 'line', 5776
    if $S2 == 'P' goto __label_31
    if $S2 == 'I' goto __label_32
    if $S2 == 'N' goto __label_33
    if $S2 == 'S' goto __label_34
    goto __label_30
  __label_31: # case
.annotate 'line', 5778
    if $S1 == 'I' goto __label_37
    if $S1 == 'N' goto __label_38
    if $S1 == 'S' goto __label_39
    goto __label_36
  __label_37: # case
  __label_38: # case
  __label_39: # case
.annotate 'line', 5782
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
.annotate 'line', 5783
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_35 # break
  __label_36: # default
.annotate 'line', 5786
    set $S3, $S4
  __label_35: # switch end
    goto __label_29 # break
  __label_32: # case
  __label_33: # case
  __label_34: # case
.annotate 'line', 5792
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5793
    __ARG_1.'emitset'($S3, $S4)
    goto __label_29 # break
  __label_30: # default
.annotate 'line', 5796
    set $S3, $S4
  __label_29: # switch end
  __label_22: # endif
  __label_15: # endif
.annotate 'line', 5800
    push $P3, $S3
  __label_9: # for iteration
.annotate 'line', 5750
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_1: # switch end
.annotate 'line', 5803
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)
.annotate 'line', 5804

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
.annotate 'line', 5694
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5696
    addattribute $P0, 'builtin'
.annotate 'line', 5697
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
.annotate 'line', 5811
    $P7 = __ARG_3.'getname'()
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 5812
    __ARG_1.'use_builtin'($S1)
.annotate 'line', 5813
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P7 = __ARG_4.'numargs'()
    set $I1, $P7
  __label_2:
.annotate 'line', 5814
    if $I1 goto __label_5
    root_new $P7, ['parrot';'ResizablePMCArray']
    set $P1, $P7
    goto __label_4
  __label_5:
    $P8 = __ARG_4.'getrawargs'()
    set $P1, $P8
  __label_4:
.annotate 'line', 5816
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5817
    null $P3
.annotate 'line', 5818
    if_null $P2, __label_7
    iter $P9, $P2
    set $P9, 0
  __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P4, $P9
.annotate 'line', 5819
    getattribute $P7, $P4, 'nparams'
    set $I2, $P7
.annotate 'line', 5820
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 5821
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 5822
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 5823
    set $P3, $P4
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5825
    unless_null $P3, __label_12
.annotate 'line', 5826
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5829
    $P7 = $P3.'iscompileevaluable'()
    if_null $P7, __label_13
    unless $P7 goto __label_13
.annotate 'line', 5830
    $P8 = WSubId_81($P1)
    if_null $P8, __label_14
    unless $P8 goto __label_14
.annotate 'line', 5831
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5832
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_15
    push_eh $P7
.annotate 'line', 5833
    getattribute $P10, __ARG_1, 'owner'
    getattribute $P11, __ARG_1, 'start'
    $P8 = $P5($P10, $P11, $P1)
    .return($P8)
    pop_eh
    goto __label_16
  __label_15:
.annotate 'line', 5832
    .get_results($P6)
    finalize $P6
    pop_eh
.annotate 'line', 5837
    $S2 = $P6["message"]
    concat $S3, "Compile time evaluation of builtin ", $S1
    concat $S3, $S3, " failed: '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
.annotate 'line', 5836
    WSubId_1($S3, __ARG_2)
  __label_16:
  __label_14: # endif
  __label_13: # endif
.annotate 'line', 5842
    new $P8, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P8.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P7, $P8
    .return($P7)
.annotate 'line', 5843

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5852
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5853
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5854
    $P1 = __ARG_1.'get'()
.annotate 'line', 5855
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 5856
    __ARG_1.'unget'($P1)
.annotate 'line', 5857
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 5859

.end # CallExpr


.sub 'checkresult' :method
.annotate 'line', 5860
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 5863
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 5864
    getattribute $P2, self, 'args'
.annotate 'line', 5865
    if_null $P2, __label_1
.annotate 'line', 5866
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5868
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
.annotate 'line', 5869
    $P3 = $P1.'search_nonmember'()
.annotate 'line', 5871
    isnull $I1, $P3
    if $I1 goto __label_5
.annotate 'line', 5873
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_6
.annotate 'line', 5884
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
.annotate 'line', 5887
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 5872
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_6: # case
.annotate 'line', 5874
    $P8 = $P3.'ismulti'()
    isfalse $I2, $P8
    unless $I2 goto __label_9
.annotate 'line', 5875
    $P4 = $P3.'makesubid'()
.annotate 'line', 5876
    self.'usesubid'($P4)
.annotate 'line', 5877
    new $P7, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
    $P7.'CallSubid'(self, $P1, $P2, $P4)
    set $P6, $P7
    .return($P6)
    goto __label_10
  __label_9: # else
.annotate 'line', 5880
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 5881
    .return(self)
  __label_10: # endif
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 5885
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 5886
    .return(self)
  __label_8: # case
.annotate 'line', 5888
    getattribute $P11, self, 'owner'
    getattribute $P12, $P1, 'start'
    .tailcall WSubId_82($P11, $P12, $P3, $P2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5891
    getattribute $P13, self, 'start'
    WSubId_6("unexpected type found in scope", $P13)
  __label_3: # switch end
  __label_2: # endif
.annotate 'line', 5894
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 5895
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_11: # endif
.annotate 'line', 5898
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_12
    unless $P6 goto __label_12
.annotate 'line', 5899
    $P7 = $P1.'checkIdentifier'()
    set $S1, $P7
    ne $S1, '', __label_13
.annotate 'line', 5900
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P9 = $P1.'getName'()
    $P8[0] = $P9
    $P5 = self.'scopesearch'($P8, 0)
.annotate 'line', 5901
    isnull $I1, $P5
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 5902
    getattribute $P6, self, 'owner'
    getattribute $P7, $P1, 'start'
    .tailcall WSubId_82($P6, $P7, $P5, $P2)
  __label_14: # endif
  __label_13: # endif
  __label_12: # endif
.annotate 'line', 5906
    setattribute self, 'funref', $P1
.annotate 'line', 5907
    setattribute self, 'args', $P2
.annotate 'line', 5908
    .return(self)
.annotate 'line', 5909

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 5912
    .return(1)
.annotate 'line', 5913

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 5916
    getattribute $P1, self, 'funref'
.annotate 'line', 5917
    null $S1
.annotate 'line', 5919
    $P3 = $P1.'isidentifier'()
    unless $P3 goto __label_3
    getattribute $P4, $P1, 'subid'
    isnull $I1, $P4
    box $P3, $I1
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5920
    $P5 = $P1.'checkIdentifier'()
    set $S1, $P5
.annotate 'line', 5921
    ne $S1, '', __label_4
.annotate 'line', 5922
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
.annotate 'line', 5924
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5927
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5930
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5925
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
    join $S1, "", $P3
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 5928
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5931
    WSubId_6("Builtin unexpected here", self)
  __label_6: # default
.annotate 'line', 5933
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 3
    $P6[0] = "'"
    $P7 = $P1.'getName'()
    $P6[1] = $P7
    $P6[2] = "'"
    join $S1, "", $P6
  __label_5: # switch end
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 5938
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5939
    .return($S1)
.annotate 'line', 5940

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
.annotate 'line', 5943
    getattribute $P1, self, 'args'
.annotate 'line', 5944
    if_null $P1, __label_1
.annotate 'line', 5945
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5946

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 5949
    __ARG_1.'print'('(')
.annotate 'line', 5950
    getattribute $P1, self, 'args'
.annotate 'line', 5951
    if_null $P1, __label_1
.annotate 'line', 5952
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5953
    __ARG_1.'say'(')')
.annotate 'line', 5954

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5957
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5958
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5960
    self.'annotate'(__ARG_1)
.annotate 'line', 5962
    __ARG_1.'print'('    ')
.annotate 'line', 5963
    ne __ARG_2, '.tailcall', __label_2
.annotate 'line', 5964
    __ARG_1.'print'('.tailcall ')
    goto __label_3
  __label_2: # else
.annotate 'line', 5966
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_3: # endif
.annotate 'line', 5968
    __ARG_1.'print'($S1)
.annotate 'line', 5969
    self.'emitargs'(__ARG_1)
.annotate 'line', 5970

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5973
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5974
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5975
    self.'annotate'(__ARG_1)
.annotate 'line', 5976
    __ARG_1.'print'('    ')
.annotate 'line', 5977
    __ARG_1.'print'($S1)
.annotate 'line', 5978
    self.'emitargs'(__ARG_1)
.annotate 'line', 5979

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5845
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5847
    addattribute $P0, 'funref'
.annotate 'line', 5848
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallSubid' ]

.sub 'CallSubid' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5991
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5992
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5993
    setattribute self, 'args', __ARG_3
.annotate 'line', 5994
    setattribute self, 'subid', __ARG_4
.annotate 'line', 5995

.end # CallSubid


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 5998
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 5999

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
.annotate 'line', 5986
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5988
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6007
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6008
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6009
    setattribute self, 'args', __ARG_3
.annotate 'line', 6010

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6013
    getattribute $P1, self, 'funref'
.annotate 'line', 6015
    getattribute $P2, $P1, 'left'
  __label_2: # while
.annotate 'line', 6016
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6017
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6018
    $P5 = $P2.'isidentifier'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 6019
    $P6 = $P2.'checkIdentifier'()
    null $S1
    if_null $P6, __label_4
    set $S1, $P6
  __label_4:
.annotate 'line', 6020
    isnull $I1, $S1
    if $I1 goto __label_6
    iseq $I1, $S1, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 6024
    new $P3, ['ResizableStringArray']
.annotate 'line', 6025
    $P1.'buildkey'($P3)
.annotate 'line', 6026
    $P5 = $P3.'pop'()
    null $S2
    if_null $P5, __label_7
    set $S2, $P5
  __label_7:
.annotate 'line', 6027
    $P4 = self.'tempreg'('P')
.annotate 'line', 6028
    self.'annotate'(__ARG_1)
.annotate 'line', 6029
    $P5 = WSubId_30($P3)
    __ARG_1.'emitget_hll_global'($P4, $S2, $P5)
.annotate 'line', 6030
    .return($P4)
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 6033
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 4
    $P6 = $P1.'emit_left_get'(__ARG_1)
    $P5[0] = $P6
    $P5[1] = ".'"
.annotate 'line', 6034
    $P7 = $P1.'get_member'()
.annotate 'line', 6033
    $P5[2] = $P7
    $P5[3] = "'"
    join $S3, "", $P5
    .return($S3)
.annotate 'line', 6035

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 6003
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6045
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6046
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6047
    setattribute self, 'args', __ARG_3
.annotate 'line', 6048

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6051
    getattribute $P1, self, 'funref'
.annotate 'line', 6052
    getattribute $P2, $P1, 'right'
.annotate 'line', 6053
    $P3 = $P2.'checkresult'()
.annotate 'line', 6054
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6055
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 6058
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 6059
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 6060
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
.annotate 'line', 6061

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 6041
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6071
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6072
    setattribute self, 'left', __ARG_3
.annotate 'line', 6073

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
.annotate 'line', 6076
    getattribute $P1, self, 'left'
    .tailcall $P1.'emit_getvar'(__ARG_1)
.annotate 'line', 6077

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 6066
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6068
    addattribute $P0, 'left'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6086
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6087
    setattribute self, 'right', __ARG_4
.annotate 'line', 6088

.end # MemberExpr


.sub 'checkresult' :method
.annotate 'line', 6089
    .return('P')

.end # checkresult


.sub 'search_nonmember' :method
.annotate 'line', 6095
    null $P1
.annotate 'line', 6096
    null $P2
.annotate 'line', 6097
    getattribute $P3, self, 'left'
  __label_2: # while
.annotate 'line', 6098
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6099
    getattribute $P3, $P3, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6100
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 6101
    $P4 = $P3.'checkIdentifier'()
.annotate 'line', 6102
    isnull $I1, $P4
    if $I1 goto __label_5
    set $S1, $P4
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 6103
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 6104
    self.'buildkey'($P5)
.annotate 'line', 6105
    .tailcall self.'scopesearch'($P5, 0)
  __label_4: # endif
  __label_3: # endif
    null $P6
.annotate 'line', 6108
    .return($P6)
.annotate 'line', 6109

.end # search_nonmember


.sub 'optimize' :method
.annotate 'line', 6112
    getattribute $P4, self, 'left'
    $P3 = $P4.'optimize'()
    setattribute self, 'left', $P3
.annotate 'line', 6114
    $P1 = self.'search_nonmember'()
.annotate 'line', 6116
    isnull $I1, $P1
    if $I1 goto __label_3
.annotate 'line', 6118
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
.annotate 'line', 6122
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6119
    $P2 = $P1.'ismulti'()
    if_null $P2, __label_6
    unless $P2 goto __label_6
.annotate 'line', 6120
    new $P4, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'FunctionRef'($P5, $P6, $P1)
    set $P3, $P4
    .return($P3)
  __label_6: # endif
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 6123
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6125
    .return(self)
.annotate 'line', 6126

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
.annotate 'line', 6129
    getattribute $P1, self, 'left'
.annotate 'line', 6130
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6131
    $P2 = $P1.'getName'()
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 6133
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6134
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
    push __ARG_1, $P2
.annotate 'line', 6135

.end # buildkey


.sub 'get_member' :method
.annotate 'line', 6138
    getattribute $P1, self, 'right'
    .return($P1)
.annotate 'line', 6139

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6142
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6143
    self.'annotate'(__ARG_1)
.annotate 'line', 6144
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
.annotate 'line', 6145

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6148
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6149
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6150
    .return($S1)
.annotate 'line', 6151

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6154
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6155
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6156
    self.'annotate'(__ARG_1)
.annotate 'line', 6157
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 6158

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6161
    self.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 6162

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6165
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6166
    null $S2
.annotate 'line', 6167
    ne __ARG_2, 'P', __label_2
.annotate 'line', 6169
    ne __ARG_3, 'null', __label_4
.annotate 'line', 6170
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 6171
    __ARG_1.'emitnull'(__ARG_3)
  __label_4: # endif
.annotate 'line', 6173
    set $S2, __ARG_3
    goto __label_3
  __label_2: # else
.annotate 'line', 6176
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 6177
    __ARG_1.'emitbox'($S2, __ARG_3)
  __label_3: # endif
.annotate 'line', 6179
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6180

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6183
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6184
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6185
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 6186
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
.annotate 'line', 6188
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 6189
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 6190
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 6192
    set $S2, $S3
  __label_7: # endif
  __label_4: # endif
.annotate 'line', 6194
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6195
    .return($S2)
.annotate 'line', 6196

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 6080
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6082
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6207
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6208
    setattribute self, 'right', __ARG_4
.annotate 'line', 6209

.end # MemberRefExpr


.sub 'checkresult' :method
.annotate 'line', 6210
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6213
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 6214
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 6215
    .return(self)
.annotate 'line', 6216

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 6219
    getattribute $P1, self, 'left'
.annotate 'line', 6220
    getattribute $P2, self, 'right'
.annotate 'line', 6221
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 6222
    WSubId_54("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6223
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6224
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6225
    self.'annotate'(__ARG_1)
.annotate 'line', 6226
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
.annotate 'line', 6227

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 6230
    getattribute $P1, self, 'left'
.annotate 'line', 6231
    getattribute $P2, self, 'right'
.annotate 'line', 6232
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 6233
    WSubId_54("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6234
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6235
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6236
    null $S3
.annotate 'line', 6237
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    if $S5 == 'P' goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 6239
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 6241
    ne $S3, 'null', __label_7
.annotate 'line', 6242
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 6243
    __ARG_1.'emitnull'($S3)
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 6247
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 6248
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6249
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 6252
    self.'annotate'(__ARG_1)
.annotate 'line', 6253
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 6254
    .return($S3)
.annotate 'line', 6255

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 6202
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6204
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]

.sub 'StringIndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6266
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6267
    setattribute self, 'left', __ARG_3
.annotate 'line', 6268
    setattribute self, 'arg', __ARG_4
.annotate 'line', 6269

.end # StringIndexExpr


.sub 'checkresult' :method
.annotate 'line', 6272
    .return('S')
.annotate 'line', 6273

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 6276
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6277
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6278
    self.'annotate'(__ARG_1)
.annotate 'line', 6279
    $P1 = WSubId_26("    substr %0, %1, %2, 1", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P1)
.annotate 'line', 6281

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 6260
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6262
    addattribute $P0, 'left'
.annotate 'line', 6263
    addattribute $P0, 'arg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6295
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6296
    setattribute self, 'left', __ARG_4
.annotate 'line', 6297
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
.annotate 'line', 6298

.end # IndexExpr


.sub 'checkresult' :method
.annotate 'line', 6301
    .return('P')
.annotate 'line', 6302

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 6305
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 6306
    setattribute self, 'left', $P1
.annotate 'line', 6307
    getattribute $P2, self, 'args'
.annotate 'line', 6308
    $P2.'optimizeargs'()
.annotate 'line', 6310
    $P4 = $P1.'checkresult'()
    set $S2, $P4
    ne $S2, 'S', __label_1
.annotate 'line', 6311
    $P5 = $P2.'numargs'()
    set $I2, $P5
    eq $I2, 1, __label_2
.annotate 'line', 6312
    WSubId_1('Bad string index', self)
  __label_2: # endif
.annotate 'line', 6313
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6316
    $P4 = $P1.'isstringliteral'()
    unless $P4 goto __label_4
    $P4 = $P3.'isintegerliteral'()
  __label_4:
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 6317
    $P5 = $P3.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 6318
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_5
    set $S1, $P4
  __label_5:
.annotate 'line', 6319
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
.annotate 'line', 6320
    substr $S2, $S1, $I1, 1
.annotate 'line', 6319
    .tailcall WSubId_27($P4, $P5, $S2)
  __label_3: # endif
.annotate 'line', 6322
    new $P5, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'StringIndexExpr'($P6, $P7, $P1, $P3)
    set $P4, $P5
    .return($P4)
  __label_1: # endif
.annotate 'line', 6325
    .return(self)
.annotate 'line', 6326

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6329
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6330
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6331
    getattribute $P1, self, 'left'
.annotate 'line', 6332
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6333
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 6334
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 6332
    setattribute self, 'regleft', $P3
.annotate 'line', 6335
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
.annotate 'line', 6336

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6339
    getattribute $P1, self, 'regleft'
.annotate 'line', 6340
    getattribute $P2, self, 'argregs'
.annotate 'line', 6341
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6342
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6343
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6344
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6345
    __ARG_1.'print'(']')
.annotate 'line', 6346

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6349
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6350
    self.'annotate'(__ARG_1)
.annotate 'line', 6351
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6352
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6353
    __ARG_1.'say'('')
.annotate 'line', 6354

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 6357
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6358
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6359
    .return($S1)
.annotate 'line', 6360

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6363
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6364
    self.'annotate'(__ARG_1)
.annotate 'line', 6365
    __ARG_1.'print'('    ')
.annotate 'line', 6366
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6367
    __ARG_1.'say'(' = ', __ARG_3)
.annotate 'line', 6368

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6371
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6372
    null $S1
.annotate 'line', 6373
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 6374
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6375
    __ARG_1.'emitnull'($S1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6378
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6379
    self.'annotate'(__ARG_1)
.annotate 'line', 6380
    __ARG_1.'print'('    ')
.annotate 'line', 6381
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6382
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6383
    .return($S1)
.annotate 'line', 6384

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6286
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6288
    addattribute $P0, 'left'
.annotate 'line', 6289
    addattribute $P0, 'regleft'
.annotate 'line', 6290
    addattribute $P0, 'args'
.annotate 'line', 6291
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 6395
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6396
    $P1 = __ARG_1.'get'()
.annotate 'line', 6397
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6398
    __ARG_1.'unget'($P1)
.annotate 'line', 6399
    $P3 = WSubId_50(__ARG_1, __ARG_2, WSubId_51, ']')
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 6401

.end # ArrayExpr


.sub 'checkresult' :method
.annotate 'line', 6402
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 6405
    getattribute $P1, self, 'values'
    WSubId_52($P1)
.annotate 'line', 6406
    .return(self)
.annotate 'line', 6407

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6410
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6411
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 6412

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6418
    self.'emit_init'(__ARG_1, '')
.annotate 'line', 6419

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6422
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6423
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6424
    .return($S1)
.annotate 'line', 6425

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 6428
    self.'annotate'(__ARG_1)
.annotate 'line', 6429
    getattribute $P1, self, 'values'
.annotate 'line', 6430
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 6431
    eq __ARG_2, '', __label_3
.annotate 'line', 6432
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6433
    le $I1, 0, __label_4
.annotate 'line', 6434
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 6436
    new $P2, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P4, self, 'owner'
    $P2.'CollectValues'($P4, __ARG_1)
.annotate 'line', 6437
    null $I2
.annotate 'line', 6438
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
.annotate 'line', 6439
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6440
    eq __ARG_2, '', __label_8
.annotate 'line', 6441
    self.'annotate'(__ARG_1)
.annotate 'line', 6442
    $P4 = WSubId_26("    %0[%1] = %2", __ARG_2, $I2, $S1)
    __ARG_1.'say'($P4)
.annotate 'line', 6443
    inc $I2
  __label_8: # endif
    goto __label_5
  __label_6: # endfor
.annotate 'line', 6446

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6389
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6391
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
.annotate 'line', 6458
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6459
    $P1 = __ARG_1.'get'()
.annotate 'line', 6460
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6461
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6462
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 6463
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6465
    $P4 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 6466
    WSubId_68(':', __ARG_1)
.annotate 'line', 6467
    $P5 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 6468
    push $P2, $P4
.annotate 'line', 6469
    push $P3, $P5
  __label_4: # continue
.annotate 'line', 6471
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6472
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6473
    WSubId_54("',' or '}'", $P1)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 6475
    setattribute self, 'keys', $P2
.annotate 'line', 6476
    setattribute self, 'values', $P3
.annotate 'line', 6477

.end # HashExpr


.sub 'checkresult' :method
.annotate 'line', 6478
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 6481
    getattribute $P1, self, 'keys'
    WSubId_52($P1)
.annotate 'line', 6482
    getattribute $P1, self, 'values'
    WSubId_52($P1)
.annotate 'line', 6483
    .return(self)
.annotate 'line', 6484

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6487
    self.'annotate'(__ARG_1)
.annotate 'line', 6492
    eq __ARG_2, '', __label_1
.annotate 'line', 6493
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6495
    getattribute $P1, self, 'keys'
.annotate 'line', 6496
    getattribute $P2, self, 'values'
.annotate 'line', 6497
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 6498
    set $I1, $P1
.annotate 'line', 6499
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 6500
    $P4 = $P1[$I2]
.annotate 'line', 6501
    null $S1
.annotate 'line', 6502
    $P5 = $P4.'isidentifier'()
    unless $P5 goto __label_7
    $P6 = $P4.'checkIdentifier'()
    set $S4, $P6
    iseq $I3, $S4, ''
    box $P5, $I3
  __label_7:
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 6503
    $P7 = $P4.'getName'()
    null $S2
    if_null $P7, __label_8
    set $S2, $P7
  __label_8:
.annotate 'line', 6504
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6505
    __ARG_1.'emitget_hll_global'($S1, $S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 6508
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6510
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 6511
    eq __ARG_2, '', __label_10
.annotate 'line', 6512
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_10: # endif
  __label_2: # for iteration
.annotate 'line', 6499
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 6514

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6517
    self.'emit'(__ARG_1, '')
.annotate 'line', 6518

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6521
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6522
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6523
    .return($S1)
.annotate 'line', 6524

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6451
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6453
    addattribute $P0, 'keys'
.annotate 'line', 6454
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 6537
    .return('P')

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
.annotate 'line', 6542
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
.annotate 'line', 6543

.end # parseinitializer


.sub 'numargs' :method
.annotate 'line', 6546
    getattribute $P1, self, 'initializer'
.annotate 'line', 6547
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)
.annotate 'line', 6548

.end # numargs


.sub 'optimize_initializer' :method
.annotate 'line', 6551
    getattribute $P1, self, 'initializer'
.annotate 'line', 6552
    if_null $P1, __label_1
.annotate 'line', 6553
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 6554

.end # optimize_initializer


.sub 'optimize' :method
.annotate 'line', 6557
    self.'optimize_initializer'()
.annotate 'line', 6558
    .return(self)
.annotate 'line', 6559

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6562
    getattribute $P1, self, 'initializer'
.annotate 'line', 6563
    if_null $P1, __label_1
.annotate 'line', 6564
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6565
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6566
    if_null $P1, __label_2
.annotate 'line', 6567
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6568
    __ARG_1.'say'(")")
.annotate 'line', 6569

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6529
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6531
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'warn_class_unknown' :subid('WSubId_83')
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6576
    concat $S1, "class ", __ARG_2
    concat $S1, $S1, " not found at compile time"
    __ARG_1.'warn'($S1, __ARG_3)
.annotate 'line', 6577

.end # warn_class_unknown

.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6585
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6587
    $P2 = __ARG_4.'isstring'()
    if $P2 goto __label_2
    $P2 = __ARG_4.'isidentifier'()
  __label_2:
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6588
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6589
    setattribute self, 'value', __ARG_4
.annotate 'line', 6590
    $P1 = __ARG_1.'get'()
.annotate 'line', 6592
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6593
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6595
    __ARG_1.'unget'($P1)
  __label_4: # endif
.annotate 'line', 6596

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6599
    getattribute $P1, self, 'value'
.annotate 'line', 6600
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6603
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6604
    isnull $I1, $P2
    not $I1
    box $P3, $I1
    unless $P3 goto __label_3
    $P3 = $P2.'isconst'()
  __label_3:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 6605
    $P1 = $P2.'getvalue'()
.annotate 'line', 6606
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 6607
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 6608
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 6611
    self.'optimize_initializer'()
.annotate 'line', 6612
    .return(self)
.annotate 'line', 6613

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6616
    self.'annotate'(__ARG_1)
.annotate 'line', 6618
    getattribute $P1, self, 'initializer'
.annotate 'line', 6619
    getattribute $P2, self, 'value'
.annotate 'line', 6620
    $P8 = self.'numargs'()
    set $I1, $P8
.annotate 'line', 6623
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6624
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6626
    set $S1, ''
.annotate 'line', 6627
    set $S2, __ARG_2
.annotate 'line', 6628
    null $S3
.annotate 'line', 6629
    if $I1 == -1 goto __label_7
    if $I1 == 0 goto __label_8
    if $I1 == 1 goto __label_9
    goto __label_6
  __label_7: # case
  __label_8: # case
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 6634
    ne $I2, 1, __label_10
.annotate 'line', 6635
    not $I4, __ARG_3
    unless $I4 goto __label_12
.annotate 'line', 6636
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_12: # endif
    goto __label_11
  __label_10: # else
.annotate 'line', 6639
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 6640
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 6641
    concat $S5, ', ', $S1
    set $S1, $S5
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 6645
    eq $I2, 1, __label_13
.annotate 'line', 6646
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_13: # endif
.annotate 'line', 6647
    not $I3, __ARG_3
    unless $I3 goto __label_14
.annotate 'line', 6648
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_14: # endif
  __label_5: # switch end
.annotate 'line', 6651
    ne $S2, '', __label_15
.annotate 'line', 6652
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
.annotate 'line', 6654
    if $I2 == 0 goto __label_18
    if $I2 == 1 goto __label_19
    goto __label_17
  __label_18: # case
.annotate 'line', 6657
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
  __label_20:
.annotate 'line', 6658
    get_class $P4, $S4
.annotate 'line', 6659
    unless_null $P4, __label_21
.annotate 'line', 6660
    WSubId_83(__ARG_1, $S4, $P2)
  __label_21: # endif
.annotate 'line', 6664
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 6665
    le $I1, 1, __label_22
.annotate 'line', 6666
    __ARG_1.'say'($S2, ".'", $P2, "'()")
  __label_22: # endif
    goto __label_16 # break
  __label_19: # case
.annotate 'line', 6670
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 6671
    unless_null $P5, __label_23
.annotate 'line', 6672
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 6673
    if_null $P6, __label_25
.annotate 'line', 6674
    $P7 = $P6.'getpath'()
.annotate 'line', 6675
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
    goto __label_26
  __label_25: # else
.annotate 'line', 6678
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 6679
    if_null $P5, __label_27
.annotate 'line', 6680
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_28
  __label_27: # else
.annotate 'line', 6682
    $P9 = $P2.'getidentifier'()
    WSubId_83(__ARG_1, $P9, $P2)
.annotate 'line', 6683
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
  __label_28: # endif
  __label_26: # endif
.annotate 'line', 6686
    set $S3, $P2
    goto __label_24
  __label_23: # else
.annotate 'line', 6690
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
  __label_24: # endif
    goto __label_16 # break
  __label_17: # default
.annotate 'line', 6694
    WSubId_6('Unexpected type in new')
  __label_16: # switch end
.annotate 'line', 6696
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isge $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
  __label_31:
  __label_30:
    unless $I3 goto __label_29
.annotate 'line', 6697
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6698
    not $I3, __ARG_3
    unless $I3 goto __label_32
.annotate 'line', 6699
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_32: # endif
  __label_29: # endif
.annotate 'line', 6701

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6704
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
.annotate 'line', 6705

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6579
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6581
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6716
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6717
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6718
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6719
    setattribute self, 'nskey', $P1
.annotate 'line', 6720
    $P2 = __ARG_1.'get'()
.annotate 'line', 6721
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6722
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6724
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 6725

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6728
    null $S1
.annotate 'line', 6729
    $P3 = self.'numargs'()
    set $I1, $P3
    if $I1 == -1 goto __label_3
    if $I1 == 0 goto __label_4
    if $I1 == 1 goto __label_5
    goto __label_2
  __label_3: # case
  __label_4: # case
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 6734
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6735
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6738
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_1: # switch end
.annotate 'line', 6740
    getattribute $P2, self, 'nskey'
.annotate 'line', 6742
    __ARG_1.'print'('    ')
.annotate 'line', 6743
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6744
    __ARG_1.'print'("root_")
  __label_6: # endif
.annotate 'line', 6745
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6746
    null $P3
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6747
    if_null $S1, __label_7
.annotate 'line', 6748
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
.annotate 'line', 6749
    __ARG_1.'say'()
.annotate 'line', 6750

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6710
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6712
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6761
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6762
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6763
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6764
    setattribute self, 'nskey', $P1
.annotate 'line', 6765
    $P2 = __ARG_1.'get'()
.annotate 'line', 6766
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6767
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6769
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 6770

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6773
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6774
    set $S1, __ARG_2
.annotate 'line', 6775
    le $I1, 0, __label_1
.annotate 'line', 6776
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 6777
    getattribute $P1, self, 'nskey'
.annotate 'line', 6779
    ne $S1, '', __label_2
.annotate 'line', 6780
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6782
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 6784
    lt $I1, 0, __label_3
.annotate 'line', 6785
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 6786
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6787
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 6789

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6755
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6757
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6796
    $P1 = __ARG_1.'get'()
.annotate 'line', 6799
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6803
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6806
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6801
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6802
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6801
    .return($P3)
  __label_4: # case
.annotate 'line', 6805
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6809
    $P2 = __ARG_1.'get'()
.annotate 'line', 6810
    __ARG_1.'unget'($P2)
.annotate 'line', 6811
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 6813
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6818
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
.annotate 'line', 6820

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_76 = "WSubId_76"
.annotate 'line', 6831
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6832
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6833
    $P2 = WSubId_76(__ARG_4, self)
    setattribute self, 'checked', $P2
.annotate 'line', 6834

.end # OpInstanceOfExpr


.sub 'optimize' :method
.annotate 'line', 6837
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6838
    .return(self)
.annotate 'line', 6839

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 6840
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6843
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6844
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6845
    eq $S1, 'P', __label_2
.annotate 'line', 6846
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6847
    getattribute $P2, self, 'checked'
.annotate 'line', 6849
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6850
    self.'annotate'(__ARG_1)
.annotate 'line', 6851
    __ARG_1.'print'('    isa ', __ARG_2, ', ', $S2, ', ')
.annotate 'line', 6852
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6853
    __ARG_1.'say'()
.annotate 'line', 6854

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6824
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6826
    addattribute $P0, 'lexpr'
.annotate 'line', 6827
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 6867
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6868
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6869
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6870
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6871
    .return(self)
.annotate 'line', 6872

.end # OpConditionalExpr


.sub 'optimize' :method
.annotate 'line', 6875
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 6876
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6878
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6880
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6882
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6883
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6884
    .return(self)
  __label_1: # switch end
.annotate 'line', 6886

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 6889
    getattribute $P1, self, 'etrue'
.annotate 'line', 6890
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6891
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6893
    .tailcall $P1.'checkresult'()
  __label_2: # endif
.annotate 'line', 6894

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6897
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 6898
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 6899
    getattribute $P4, self, 'condition'
    $P4.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6900
    getattribute $P1, self, 'etrue'
.annotate 'line', 6901
    $P4 = self.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
.annotate 'line', 6902
    $P4 = $P1.'isnull'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6903
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6905
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6906
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6907
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6908
    getattribute $P2, self, 'efalse'
.annotate 'line', 6909
    $P4 = $P2.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 6910
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
.annotate 'line', 6912
    $P5 = $P2.'checkresult'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
  __label_8:
.annotate 'line', 6913
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 6914
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 6915
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 6919
    ne $S4, 'P', __label_13
.annotate 'line', 6920
    $P3 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 6921
    __ARG_1.'emitset'(__ARG_2, $P3)
    goto __label_14
  __label_13: # else
.annotate 'line', 6924
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
  __label_10: # endif
  __label_7: # endif
.annotate 'line', 6927
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 6928

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6859
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6861
    addattribute $P0, 'condition'
.annotate 'line', 6862
    addattribute $P0, 'etrue'
.annotate 'line', 6863
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getOpCode_2' :subid('WSubId_86')
        .param pmc __ARG_1
.annotate 'line', 6973
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '(' goto __label_3
    if $S1 == '[' goto __label_4
    if $S1 == '.' goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6974
    .return(1)
  __label_4: # case
.annotate 'line', 6975
    .return(2)
  __label_5: # case
.annotate 'line', 6976
    .return(3)
  __label_2: # default
.annotate 'line', 6977
    .return(0)
  __label_1: # switch end
.annotate 'line', 6979

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_88')
        .param pmc __ARG_1
.annotate 'line', 6983
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '-' goto __label_3
    if $S1 == '!' goto __label_4
    if $S1 == '~' goto __label_5
    if $S1 == '++' goto __label_6
    if $S1 == '--' goto __label_7
    goto __label_2
  __label_3: # case
.annotate 'line', 6984
    .return(8)
  __label_4: # case
.annotate 'line', 6985
    .return(11)
  __label_5: # case
.annotate 'line', 6986
    .return(33)
  __label_6: # case
.annotate 'line', 6987
    .return(9)
  __label_7: # case
.annotate 'line', 6988
    .return(10)
  __label_2: # default
.annotate 'line', 6990
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(31)
    goto __label_9
  __label_8: # else
.annotate 'line', 6991
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(32)
    goto __label_11
  __label_10: # else
.annotate 'line', 6992
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_1: # switch end
.annotate 'line', 6994

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_91')
        .param pmc __ARG_1
.annotate 'line', 6998
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '*' goto __label_3
    if $S1 == '/' goto __label_4
    if $S1 == '%' goto __label_5
    if $S1 == '%%' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6999
    .return(19)
  __label_4: # case
.annotate 'line', 7000
    .return(20)
  __label_5: # case
.annotate 'line', 7001
    .return(21)
  __label_6: # case
.annotate 'line', 7002
    .return(22)
  __label_2: # default
.annotate 'line', 7003
    .return(0)
  __label_1: # switch end
.annotate 'line', 7005

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_94')
        .param pmc __ARG_1
.annotate 'line', 7009
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<<' goto __label_3
    if $S1 == '>>' goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7010
    .return(28)
  __label_4: # case
.annotate 'line', 7011
    .return(29)
  __label_2: # default
.annotate 'line', 7012
    .return(0)
  __label_1: # switch end
.annotate 'line', 7014

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_96')
        .param pmc __ARG_1
.annotate 'line', 7018
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<' goto __label_3
    if $S1 == '>' goto __label_4
    if $S1 == '<=' goto __label_5
    if $S1 == '>=' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 7019
    .return(14)
  __label_4: # case
.annotate 'line', 7020
    .return(16)
  __label_5: # case
.annotate 'line', 7021
    .return(15)
  __label_6: # case
.annotate 'line', 7022
    .return(17)
  __label_2: # default
.annotate 'line', 7024
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 7025
    .return(0)
  __label_8: # endif
  __label_1: # switch end
.annotate 'line', 7027

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_98')
        .param pmc __ARG_1
.annotate 'line', 7031
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '==' goto __label_3
    if $S1 == '!=' goto __label_4
    if $S1 == '===' goto __label_5
    if $S1 == '!==' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 7032
    .return(12)
  __label_4: # case
.annotate 'line', 7033
    .return(13)
  __label_5: # case
.annotate 'line', 7034
    .return(25)
  __label_6: # case
.annotate 'line', 7035
    .return(26)
  __label_2: # default
.annotate 'line', 7036
    .return(0)
  __label_1: # switch end
.annotate 'line', 7038

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_107')
        .param pmc __ARG_1
.annotate 'line', 7042
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '=' goto __label_3
    if $S1 == '=:' goto __label_4
    if $S1 == '+=' goto __label_5
    if $S1 == '-=' goto __label_6
    if $S1 == '*=' goto __label_7
    if $S1 == '/=' goto __label_8
    if $S1 == '%=' goto __label_9
    goto __label_2
  __label_3: # case
.annotate 'line', 7043
    .return(4)
  __label_4: # case
.annotate 'line', 7044
    .return(5)
  __label_5: # case
.annotate 'line', 7045
    .return(6)
  __label_6: # case
.annotate 'line', 7046
    .return(18)
  __label_7: # case
.annotate 'line', 7047
    .return(23)
  __label_8: # case
.annotate 'line', 7048
    .return(24)
  __label_9: # case
.annotate 'line', 7049
    .return(30)
  __label_2: # default
.annotate 'line', 7050
    .return(0)
  __label_1: # switch end
.annotate 'line', 7052

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 7056
    $P1 = __ARG_1.'get'()
.annotate 'line', 7057
    null $P2
.annotate 'line', 7060
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7064
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7066
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 7068
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 7070
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 7072
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 7074
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 7076
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 7078
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 7080
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 7082
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 7061
    $P2 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 7062
    WSubId_68(')', __ARG_1)
.annotate 'line', 7063
    .return($P2)
  __label_4: # case
.annotate 'line', 7065
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 7067
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 7069
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 7071
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_25(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 7073
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 7075
    .tailcall WSubId_84(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 7077
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 7079
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 7081
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 7083
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 7085
    WSubId_54('expression', $P1)
  __label_1: # switch end
.annotate 'line', 7087

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7091
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 7092
    null $P2
.annotate 'line', 7093
    null $P3
.annotate 'line', 7094
    null $I1
  __label_2: # while
.annotate 'line', 7095
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_86($P2)
    set $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 7096
    if $I1 == 1 goto __label_5
    if $I1 == 2 goto __label_6
    if $I1 == 3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 7098
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7101
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7104
    set $P3, $P2
.annotate 'line', 7105
    $P2 = __ARG_1.'get'()
.annotate 'line', 7106
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 7107
    $P4 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 7108
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
    goto __label_9
  __label_8: # else
.annotate 'line', 7111
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7114
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7117
    __ARG_1.'unget'($P2)
.annotate 'line', 7118
    .return($P1)
.annotate 'line', 7119

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.annotate 'line', 7123
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 7124
    $P2 = __ARG_1.'get'()
.annotate 'line', 7126
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 7128
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7127
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 7129
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 7131
    __ARG_1.'unget'($P2)
.annotate 'line', 7132
    .return($P1)
  __label_1: # switch end
.annotate 'line', 7134

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_90 = "WSubId_90"
.annotate 'line', 7138
    $P1 = __ARG_1.'get'()
.annotate 'line', 7139
    $P3 = WSubId_88($P1)
    set $I1, $P3
.annotate 'line', 7140
    unless $I1 goto __label_1
.annotate 'line', 7141
    $P2 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7142
    if $I1 == 8 goto __label_5
    if $I1 == 11 goto __label_6
    if $I1 == 33 goto __label_7
    if $I1 == 9 goto __label_8
    if $I1 == 10 goto __label_9
    if $I1 == 31 goto __label_10
    if $I1 == 32 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 7144
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 7146
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 7148
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 7150
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 7152
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 7154
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 7156
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_4: # default
.annotate 'line', 7158
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
    goto __label_2
  __label_1: # else
.annotate 'line', 7162
    __ARG_1.'unget'($P1)
.annotate 'line', 7163
    .tailcall WSubId_90(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 7165

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7169
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7170
    null $P2
.annotate 'line', 7171
    null $I1
  __label_2: # while
.annotate 'line', 7172
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_91($P2)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7173
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7174
    if $I1 == 19 goto __label_5
    if $I1 == 20 goto __label_6
    if $I1 == 21 goto __label_7
    if $I1 == 22 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 7176
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7179
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7182
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7185
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7188
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7191
    __ARG_1.'unget'($P2)
.annotate 'line', 7192
    .return($P1)
.annotate 'line', 7193

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 7197
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7198
    null $P2
  __label_2: # while
.annotate 'line', 7199
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('+')
    if $P5 goto __label_3
    $P5 = $P2.'isop'('-')
  __label_3:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7200
    $P3 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7201
    null $P4
.annotate 'line', 7202
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7203
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 7205
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 7206
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7208
    __ARG_1.'unget'($P2)
.annotate 'line', 7209
    .return($P1)
.annotate 'line', 7210

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7214
    $P1 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7215
    null $P2
.annotate 'line', 7216
    null $P3
.annotate 'line', 7217
    null $I1
  __label_2: # while
.annotate 'line', 7218
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_94($P3)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7219
    if $I1 == 28 goto __label_5
    if $I1 == 29 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 7221
    $P2 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7222
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7225
    $P2 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7226
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7229
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7232
    __ARG_1.'unget'($P3)
.annotate 'line', 7233
    .return($P1)
.annotate 'line', 7234

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7238
    $P1 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7239
    null $P2
.annotate 'line', 7240
    null $P3
.annotate 'line', 7241
    null $I1
  __label_2: # while
.annotate 'line', 7242
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_96($P3)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7243
    if $I1 == 14 goto __label_5
    if $I1 == 16 goto __label_6
    if $I1 == 15 goto __label_7
    if $I1 == 17 goto __label_8
    if $I1 == 27 goto __label_9
    goto __label_4
  __label_5: # case
.annotate 'line', 7245
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7246
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7249
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7250
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7253
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7254
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7257
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7258
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7261
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7264
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7267
    __ARG_1.'unget'($P3)
.annotate 'line', 7268
    .return($P1)
.annotate 'line', 7269

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7273
    $P1 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7274
    null $P2
.annotate 'line', 7275
    null $P3
.annotate 'line', 7276
    null $I1
  __label_2: # while
.annotate 'line', 7277
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_98($P3)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7278
    if $I1 == 12 goto __label_5
    if $I1 == 13 goto __label_6
    if $I1 == 25 goto __label_7
    if $I1 == 26 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 7280
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7281
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7284
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7285
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7288
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7289
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7292
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7293
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7296
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7299
    __ARG_1.'unget'($P3)
.annotate 'line', 7300
    .return($P1)
.annotate 'line', 7301

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_99 = "WSubId_99"
.annotate 'line', 7305
    $P1 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7306
    null $P2
  __label_2: # while
.annotate 'line', 7307
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7308
    $P3 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7309
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7311
    __ARG_1.'unget'($P2)
.annotate 'line', 7312
    .return($P1)
.annotate 'line', 7313

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_100 = "WSubId_100"
.annotate 'line', 7317
    $P1 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7318
    null $P2
  __label_2: # while
.annotate 'line', 7319
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7320
    $P3 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7321
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7323
    __ARG_1.'unget'($P2)
.annotate 'line', 7324
    .return($P1)
.annotate 'line', 7325

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_101 = "WSubId_101"
.annotate 'line', 7329
    $P1 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7330
    null $P2
  __label_2: # while
.annotate 'line', 7331
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7332
    $P3 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7333
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7335
    __ARG_1.'unget'($P2)
.annotate 'line', 7336
    .return($P1)
.annotate 'line', 7337

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_102 = "WSubId_102"
.annotate 'line', 7341
    $P1 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7342
    null $P2
  __label_2: # while
.annotate 'line', 7343
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7344
    $P3 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7345
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7347
    __ARG_1.'unget'($P2)
.annotate 'line', 7348
    .return($P1)
.annotate 'line', 7349

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_102 = "WSubId_102"
.annotate 'line', 7353
    $P1 = WSubId_103(__ARG_1, __ARG_2)
.annotate 'line', 7354
    null $P2
  __label_2: # while
.annotate 'line', 7355
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7356
    $P3 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7357
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7359
    __ARG_1.'unget'($P2)
.annotate 'line', 7360
    .return($P1)
.annotate 'line', 7361

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 7365
    $P1 = WSubId_104(__ARG_1, __ARG_2)
.annotate 'line', 7366
    $P2 = __ARG_1.'get'()
.annotate 'line', 7367
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7368
    $P3 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7369
    WSubId_68(':', __ARG_1)
.annotate 'line', 7370
    $P4 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7371
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 7374
    __ARG_1.'unget'($P2)
.annotate 'line', 7375
    .return($P1)
  __label_2: # endif
.annotate 'line', 7377

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7381
    $P1 = WSubId_106(__ARG_1, __ARG_2)
.annotate 'line', 7382
    null $P2
.annotate 'line', 7383
    null $I1
  __label_2: # while
.annotate 'line', 7384
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_107($P2)
    set $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 7385
    $P3 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7386
    null $P4
.annotate 'line', 7387
    if $I1 == 4 goto __label_5
    if $I1 == 5 goto __label_6
    if $I1 == 6 goto __label_7
    if $I1 == 18 goto __label_8
    if $I1 == 23 goto __label_9
    if $I1 == 24 goto __label_10
    if $I1 == 30 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 7389
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7392
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7395
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7398
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7401
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 7404
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 7407
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7410
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 7412
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7413
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7415
    __ARG_1.'unget'($P2)
.annotate 'line', 7416
    .return($P1)
.annotate 'line', 7417

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_105 = "WSubId_105"
.annotate 'line', 7421
    .tailcall WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7422

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7437
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7438
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7439
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7440
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7441
    .return($S1)
.annotate 'line', 7442

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7445
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7446
    unless_null $P1, __label_1
.annotate 'line', 7447
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7448
    .return($P1)
.annotate 'line', 7449

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7433
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7458
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7459
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7460
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7461
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7462
    .return($S1)
.annotate 'line', 7463

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7466
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7467
    unless_null $P1, __label_1
.annotate 'line', 7468
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7469
    .return($P1)
.annotate 'line', 7470

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7452
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7454
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7486
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7487
    $P1 = __ARG_2.'get'()
.annotate 'line', 7488
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7489
    __ARG_2.'unget'($P1)
.annotate 'line', 7490
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 7492

.end # parse


.sub 'optimize' :method
.annotate 'line', 7495
    getattribute $P1, self, 'values'
.annotate 'line', 7496
    if_null $P1, __label_1
.annotate 'line', 7497
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7498
    .return(self)
.annotate 'line', 7499

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7503
    getattribute $P1, self, 'values'
.annotate 'line', 7504
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7507
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
.annotate 'line', 7508
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7509
    $P3 = $P2.'cantailcall'()
    unless $P3 goto __label_6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'allowtailcall'()
  __label_6:
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 7510
    self.'annotate'(__ARG_1)
.annotate 'line', 7511
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 7515
    le $I1, 0, __label_7
.annotate 'line', 7516
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7518
    self.'annotate'(__ARG_1)
.annotate 'line', 7519
    self.'emitret'(__ARG_1)
.annotate 'line', 7520
    le $I1, 0, __label_8
.annotate 'line', 7521
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 7522
    __ARG_1.'say'(')')
.annotate 'line', 7523

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7480
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7482
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7530
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 7531

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 7534
    __ARG_1.'print'('    ', '.return(')
.annotate 'line', 7535

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7526
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7542
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 7543

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 7546
    __ARG_1.'print'('    ', '.yield(')
.annotate 'line', 7547

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7538
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 7560
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7561
    setattribute self, 'name', __ARG_1
.annotate 'line', 7562
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
.annotate 'line', 7563

.end # LabelStatement


.sub 'optimize' :method
.annotate 'line', 7564
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7567
    self.'annotate'(__ARG_1)
.annotate 'line', 7568
    getattribute $P1, self, 'value'
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
.annotate 'line', 7569

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7554
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7556
    addattribute $P0, 'name'
.annotate 'line', 7557
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7583
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7584
    box $P1, __ARG_2
    setattribute self, 'label', $P1
.annotate 'line', 7585

.end # Reflabel


.sub 'optimize' :method
.annotate 'line', 7586
    .return(self)

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 7589
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7590
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7591
    .return($S2)
.annotate 'line', 7592

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7578
    addattribute $P0, 'owner'
.annotate 'line', 7579
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 7605
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7606
    $P1 = __ARG_2.'get'()
.annotate 'line', 7607
    WSubId_108($P1)
.annotate 'line', 7608
    setattribute self, 'label', $P1
.annotate 'line', 7609
    WSubId_68(';', __ARG_2)
.annotate 'line', 7610

.end # GotoStatement


.sub 'optimize' :method
.annotate 'line', 7611
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7614
    self.'annotate'(__ARG_1)
.annotate 'line', 7615
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7616
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7617
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
.annotate 'line', 7618

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7599
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7601
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 7629
    $P1 = WSubId_51(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7630

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 7633
    WSubId_68('(', __ARG_1)
.annotate 'line', 7634
    $P1 = WSubId_51(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7635
    WSubId_68(')', __ARG_1)
.annotate 'line', 7636

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7625
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
.annotate 'line', 7649
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7650
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7651
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7652
    $P1 = __ARG_2.'get'()
.annotate 'line', 7653
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7654
    $P4 = WSubId_109(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7656
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7657
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7659

.end # IfStatement


.sub 'optimize' :method
.annotate 'line', 7662
    self.'optimize_condition'()
.annotate 'line', 7663
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7664
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 7665
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7667
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7669
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7671
    .return(self)
.annotate 'line', 7672

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7675
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7676
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7677
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7678
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7679
    set $S1, ''
.annotate 'line', 7680
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7681
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7682
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7683
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7684
    self.'annotate'(__ARG_1)
.annotate 'line', 7685
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7686
    $P1.'emit'(__ARG_1)
.annotate 'line', 7688
    not $I3, $I2
    unless $I3 goto __label_5
.annotate 'line', 7689
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7690
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7691
    $P2.'emit'(__ARG_1)
  __label_5: # endif
.annotate 'line', 7693
    __ARG_1.'emitlabel'($S2, 'endif')
.annotate 'line', 7694

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7643
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7645
    addattribute $P0, 'truebranch'
.annotate 'line', 7646
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
.annotate 'line', 7706
    $P2 = WSubId_109(__ARG_1, self)
    setattribute self, 'body', $P2
.annotate 'line', 7707

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
.annotate 'line', 7710
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7711
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7713
    self.'annotate'(__ARG_1)
.annotate 'line', 7714
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7715
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7716
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7717
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
.annotate 'line', 7718

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7701
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7703
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7729
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7730
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7731
    self.'parsebody'(__ARG_2)
.annotate 'line', 7732

.end # WhileStatement


.sub 'optimize' :method
.annotate 'line', 7735
    self.'optimize_condition'()
.annotate 'line', 7736
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7737
    .return(self)
.annotate 'line', 7738

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7741
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7743
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7746
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 7747
    __ARG_1.'comment'('while(false) optimized out')
  __label_5: # endif
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7750
    $P3 = self.'genbreaklabel'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7751
    $P4 = self.'gencontinuelabel'()
    null $S2
    if_null $P4, __label_7
    set $S2, $P4
  __label_7:
.annotate 'line', 7753
    self.'annotate'(__ARG_1)
.annotate 'line', 7754
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7755
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7756
    getattribute $P5, self, 'body'
    $P5.'emit'(__ARG_1)
.annotate 'line', 7757
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7758
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
.annotate 'line', 7760

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7725
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
.annotate 'line', 7771
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7772
    self.'parsebody'(__ARG_2)
.annotate 'line', 7773
    WSubId_110('while', __ARG_2)
.annotate 'line', 7774
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7775

.end # DoStatement


.sub 'optimize' :method
.annotate 'line', 7778
    self.'optimize_condition'()
.annotate 'line', 7779
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7780
    $P2 = $P1.'isempty'()
    unless $P2 goto __label_2
    $P3 = self.'getvalue'()
    set $I2, $P3
    iseq $I1, $I2, 2
    box $P2, $I1
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7781
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 7782
    setattribute self, 'body', $P1
.annotate 'line', 7783
    .return(self)
.annotate 'line', 7784

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7787
    getattribute $P1, self, 'body'
.annotate 'line', 7788
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 7789
    if $I1 == 1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7791
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7794
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7795
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7796
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7798
    self.'annotate'(__ARG_1)
.annotate 'line', 7799
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7801
    $P1.'emit'(__ARG_1)
.annotate 'line', 7802
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7803
    eq $I1, 2, __label_7
.annotate 'line', 7804
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7805
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
.annotate 'line', 7807

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7767
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
.annotate 'line', 7818
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7819
    WSubId_68(';', __ARG_2)
.annotate 'line', 7820

.end # ContinueStatement


.sub 'optimize' :method
.annotate 'line', 7821
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7824
    self.'annotate'(__ARG_1)
.annotate 'line', 7825
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7826
    __ARG_1.'emitgoto'($S1, 'continue')
.annotate 'line', 7827

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7814
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 7838
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7839
    WSubId_68(';', __ARG_2)
.annotate 'line', 7840

.end # BreakStatement


.sub 'optimize' :method
.annotate 'line', 7841
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7844
    self.'annotate'(__ARG_1)
.annotate 'line', 7845
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7846
    __ARG_1.'emitgoto'($S1, 'break')
.annotate 'line', 7847

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7834
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 7862
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7863
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7864
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7865
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
.annotate 'line', 7866

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_109 = "WSubId_109"
.annotate 'line', 7869
    null $P1
  __label_2: # while
.annotate 'line', 7870
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'iskeyword'('case')
    if $P3 goto __label_3
    $P3 = $P1.'iskeyword'('default')
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7871
    $P4 = $P1.'iskeyword'('case')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 7872
    getattribute $P5, self, 'case_value'
    $P6 = WSubId_51(__ARG_1, self)
    push $P5, $P6
.annotate 'line', 7873
    $P1 = __ARG_1.'get'()
.annotate 'line', 7874
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7875
    WSubId_54("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7876
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7877
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
.annotate 'line', 7878
    __ARG_1.'unget'($P1)
.annotate 'line', 7879
    $P3 = WSubId_109(__ARG_1, self)
    push $P2, $P3
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7881
    getattribute $P3, self, 'case_st'
    push $P3, $P2
.annotate 'line', 7882
    __ARG_1.'unget'($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7885
    $P1 = __ARG_1.'get'()
.annotate 'line', 7886
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7887
    WSubId_54("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7888
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
.annotate 'line', 7889
    __ARG_1.'unget'($P1)
.annotate 'line', 7890
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_109(__ARG_1, self)
    push $P3, $P4
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7892
    __ARG_1.'unget'($P1)
  __label_5: # endif
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7895
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7896
    WSubId_54("'}' in switch", $P1)
  __label_16: # endif
.annotate 'line', 7897

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_111 = "WSubId_111"
.annotate 'line', 7900
    getattribute $P1, self, 'case_value'
    WSubId_52($P1)
.annotate 'line', 7901
    getattribute $P1, self, 'case_st'
    WSubId_111($P1, WSubId_52)
.annotate 'line', 7902
    getattribute $P1, self, 'default_st'
    WSubId_52($P1)
.annotate 'line', 7903

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7854
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7856
    addattribute $P0, 'case_value'
.annotate 'line', 7857
    addattribute $P0, 'case_st'
.annotate 'line', 7858
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 7916
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7917
    $P3 = WSubId_51(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7918
    $P1 = __ARG_2.'get'()
.annotate 'line', 7919
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7920
    WSubId_54("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7921
    $P1 = __ARG_2.'get'()
.annotate 'line', 7922
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7923
    WSubId_54("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7924
    self.'parse_cases'(__ARG_2)
.annotate 'line', 7925

.end # SwitchStatement


.sub 'optimize' :method
.annotate 'line', 7928
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7929
    self.'optimize_cases'()
.annotate 'line', 7930
    .return(self)
.annotate 'line', 7931

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 7935
    set $S1, ''
.annotate 'line', 7936
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
.annotate 'line', 7937
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7938
    ne $S2, 'N', __label_4
.annotate 'line', 7939
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7940
    ne $S1, '', __label_5
.annotate 'line', 7941
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7942
    eq $S1, $S2, __label_7
.annotate 'line', 7943
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7946
    getattribute $P2, self, 'condition'
.annotate 'line', 7947
    $P3 = $P2.'checkresult'()
.annotate 'line', 7951
    ne $S1, '', __label_8
.annotate 'line', 7952
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7954
    $P7 = __ARG_1.'getDebug'()
    if_null $P7, __label_9
    unless $P7 goto __label_9
.annotate 'line', 7955
    __ARG_1.'comment'('switch')
  __label_9: # endif
.annotate 'line', 7956
    null $S3
.annotate 'line', 7957
    set $S9, $P3
    ne $S9, $S1, __label_10
.annotate 'line', 7958
    $P7 = $P2.'emit_get'(__ARG_1)
    set $S3, $P7
    goto __label_11
  __label_10: # else
.annotate 'line', 7960
    $P9 = self.'tempreg'($S1)
    set $S3, $P9
.annotate 'line', 7961
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7962
    __ARG_1.'emitset'($S3, $S4)
  __label_11: # endif
.annotate 'line', 7966
    self.'genbreaklabel'()
.annotate 'line', 7967
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7968
    new $P4, ['ResizableStringArray']
.annotate 'line', 7969
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7970
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
.annotate 'line', 7971
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7972
    push $P4, $S7
.annotate 'line', 7973
    null $S8
.annotate 'line', 7974
    ne $S1, 'I', __label_18
.annotate 'line', 7975
    $P7 = $P5.'emit_getint'(__ARG_1)
    set $S8, $P7
    goto __label_19
  __label_18: # else
.annotate 'line', 7976
    $P9 = $P5.'checkresult'()
    set $S9, $P9
    ne $S1, $S9, __label_20
.annotate 'line', 7977
    $P11 = $P5.'emit_get'(__ARG_1)
    set $S8, $P11
    goto __label_21
  __label_20: # else
.annotate 'line', 7979
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7980
    set $S8, $S6
  __label_21: # endif
  __label_19: # endif
.annotate 'line', 7982
    $P7 = WSubId_26("    if %0 == %1 goto %2", $S3, $S8, $S7)
    __ARG_1.'say'($P7)
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7984
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7987
    self.'annotate'(__ARG_1)
.annotate 'line', 7988
    getattribute $P6, self, 'case_st'
.annotate 'line', 7989
    set $I1, $P6
.annotate 'line', 7990
    null $I2
  __label_24: # for condition
    ge $I2, $I1, __label_23
.annotate 'line', 7991
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7992
    $P7 = $P6[$I2]
    WSubId_66(__ARG_1, $P7)
  __label_22: # for iteration
.annotate 'line', 7990
    inc $I2
    goto __label_24
  __label_23: # for end
.annotate 'line', 7995
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7996
    getattribute $P7, self, 'default_st'
    WSubId_66(__ARG_1, $P7)
.annotate 'line', 7998
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
.annotate 'line', 7999

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7910
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7912
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8011
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8012
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8013

.end # SwitchCaseStatement


.sub 'optimize' :method
.annotate 'line', 8016
    self.'optimize_cases'()
.annotate 'line', 8017
    .return(self)
.annotate 'line', 8018

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 8022
    self.'genbreaklabel'()
.annotate 'line', 8023
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8024
    new $P1, ['ResizableStringArray']
.annotate 'line', 8026
    $P4 = __ARG_1.'getDebug'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 8027
    __ARG_1.'comment'('switch-case')
  __label_2: # endif
.annotate 'line', 8028
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8029
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_5
    iter $P5, $P4
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P2, $P5
.annotate 'line', 8030
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_6
    set $S3, $P6
  __label_6:
.annotate 'line', 8031
    push $P1, $S3
.annotate 'line', 8032
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 8033
    __ARG_1.'emitif'($S2, $S3)
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8035
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 8038
    self.'annotate'(__ARG_1)
.annotate 'line', 8039
    getattribute $P3, self, 'case_st'
.annotate 'line', 8040
    set $I1, $P3
.annotate 'line', 8041
    null $I2
  __label_9: # for condition
    ge $I2, $I1, __label_8
.annotate 'line', 8042
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 8043
    $P4 = $P3[$I2]
    WSubId_66(__ARG_1, $P4)
  __label_7: # for iteration
.annotate 'line', 8041
    inc $I2
    goto __label_9
  __label_8: # for end
.annotate 'line', 8046
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 8047
    getattribute $P4, self, 'default_st'
    WSubId_66(__ARG_1, $P4)
.annotate 'line', 8049
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
.annotate 'line', 8050

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 8006
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 8057
    $P1 = __ARG_2.'get'()
.annotate 'line', 8058
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8059
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8060
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8061
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8062
    WSubId_54("'(' in switch", $P1)
.annotate 'line', 8063

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 8076
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8077
    $P1 = __ARG_2.'get'()
.annotate 'line', 8078
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8079
    __ARG_2.'unget'($P1)
.annotate 'line', 8080
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 8082
    $P1 = __ARG_2.'get'()
.annotate 'line', 8083
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 8084
    __ARG_2.'unget'($P1)
.annotate 'line', 8085
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 8086
    WSubId_68(';', __ARG_2)
  __label_2: # endif
.annotate 'line', 8088
    $P1 = __ARG_2.'get'()
.annotate 'line', 8089
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 8090
    __ARG_2.'unget'($P1)
.annotate 'line', 8091
    $P3 = WSubId_51(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 8092
    WSubId_68(')', __ARG_2)
  __label_3: # endif
.annotate 'line', 8094
    self.'parsebody'(__ARG_2)
.annotate 'line', 8095

.end # ForStatement


.sub 'optimize' :method
.annotate 'line', 8098
    getattribute $P1, self, 'initializer'
.annotate 'line', 8099
    if_null $P1, __label_1
.annotate 'line', 8100
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 8101
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
.annotate 'line', 8102
    self.'optimize_condition'()
.annotate 'line', 8103
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
.annotate 'line', 8104
    if_null $P1, __label_4
.annotate 'line', 8105
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8107
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 8110
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 8111
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 8112
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8113
    .return(self)
.annotate 'line', 8114

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8117
    getattribute $P1, self, 'iteration'
    isnull $I1, $P1
    not $I1
.annotate 'line', 8118
    getattribute $P1, self, 'initializer'
    isnull $I2, $P1
    unless $I2 goto __label_3
.annotate 'line', 8119
    getattribute $P2, self, 'condexpr'
    isnull $I2, $P2
  __label_3:
    unless $I2 goto __label_2
.annotate 'line', 8120
    not $I2, $I1
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 8121
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 8122
    .return()
  __label_1: # endif
.annotate 'line', 8124
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
.annotate 'line', 8125
    __ARG_1.'comment'('for loop')
  __label_4: # endif
.annotate 'line', 8126
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_5
    set $S1, $P1
  __label_5:
.annotate 'line', 8127
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_6
    set $S2, $P1
  __label_6:
.annotate 'line', 8128
    unless $I1 goto __label_8
.annotate 'line', 8129
    $P1 = self.'genlabel'()
    set $S3, $P1
    goto __label_7
  __label_8:
.annotate 'line', 8130
    set $S3, $S1
  __label_7:
.annotate 'line', 8131
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_9
.annotate 'line', 8132
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_9: # endif
.annotate 'line', 8134
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 8135
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_10
.annotate 'line', 8136
    self.'emit_else'(__ARG_1, $S2)
  __label_10: # endif
.annotate 'line', 8138
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8139
    unless $I1 goto __label_11
.annotate 'line', 8140
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 8141
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_12
.annotate 'line', 8142
    getattribute $P2, self, 'iteration'
    $P2.'emit_void'(__ARG_1)
  __label_12: # endif
  __label_11: # endif
.annotate 'line', 8144
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8146
    __ARG_1.'emitlabel'($S2, 'for end')
.annotate 'line', 8147

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8069
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 8071
    addattribute $P0, 'initializer'
.annotate 'line', 8072
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
.annotate 'line', 8162
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8163
    null $S1
    if_null __ARG_4, __label_1
    set $S1, __ARG_4
  __label_1:
.annotate 'line', 8164
    eq __ARG_5, '', __label_2
.annotate 'line', 8165
    $P1 = WSubId_112(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 8166
    self.'createvar'($S1, $S2)
.annotate 'line', 8167
    box $P1, $S2
    setattribute self, 'deftype', $P1
  __label_2: # endif
.annotate 'line', 8169
    setattribute self, 'varname', __ARG_4
.annotate 'line', 8170
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 8171
    WSubId_68(')', __ARG_2)
.annotate 'line', 8172
    self.'parsebody'(__ARG_2)
.annotate 'line', 8173

.end # ForeachStatement


.sub 'optimize' :method
.annotate 'line', 8176
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 8180
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
.annotate 'line', 8181
    $P2 = $P1.'isstringliteral'()
    unless $P2 goto __label_3
.annotate 'line', 8182
    $P3 = $P1.'get_value'()
    set $S1, $P3
    length $I2, $S1
    iseq $I1, $I2, 0
    box $P2, $I1
  __label_3:
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8183
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8185
    setattribute self, 'container', $P1
.annotate 'line', 8186
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8187
    .return(self)
.annotate 'line', 8188

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_75 = "WSubId_75"
.annotate 'line', 8191
    self.'annotate'(__ARG_1)
.annotate 'line', 8192
    null $S1
.annotate 'line', 8193
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
.annotate 'line', 8194
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8195
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 8196
    __ARG_1.'emitbox'($S1, $S2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8199
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 8201
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 8202
    unless_null $P1, __label_4
.annotate 'line', 8203
    getattribute $P2, self, 'varname'
    WSubId_75($P2)
  __label_4: # endif
.annotate 'line', 8205
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 8206
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 8207
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 8208
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 8209
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 8210
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 8211
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 8212
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 8213
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 8214
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 8215
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8216
    __ARG_1.'emitlabel'($S5, 'endfor')
.annotate 'line', 8217

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8154
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8156
    addattribute $P0, 'deftype'
.annotate 'line', 8157
    addattribute $P0, 'varname'
.annotate 'line', 8158
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8224
    WSubId_68('(', __ARG_2)
.annotate 'line', 8225
    $P1 = __ARG_2.'get'()
.annotate 'line', 8226
    $P2 = __ARG_2.'get'()
.annotate 'line', 8227
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 8228
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 8230
    $P3 = __ARG_2.'get'()
.annotate 'line', 8231
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8232
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 8233
    __ARG_2.'unget'($P3)
.annotate 'line', 8234
    __ARG_2.'unget'($P2)
.annotate 'line', 8235
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8237
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 8238

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 8250
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8251
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'excep', $P2
.annotate 'line', 8252

.end # ThrowStatement


.sub 'optimize' :method
.annotate 'line', 8255
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 8256
    .return(self)
.annotate 'line', 8257

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8260
    getattribute $P1, self, 'excep'
.annotate 'line', 8261
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8262
    self.'annotate'(__ARG_1)
.annotate 'line', 8263
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    if $S3 == 'P' goto __label_4
    if $S3 == 'S' goto __label_5
    goto __label_3
  __label_4: # case
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 8269
    set $S2, $S1
.annotate 'line', 8270
    $P3 = self.'tempreg'('P')
    set $S1, $P3
.annotate 'line', 8271
    $P4 = WSubId_26("    root_new %0, ['parrot';'Exception']\n    %0['message'] = %1\n", $S1, $S2)
    __ARG_1.'print'($P4)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 8279
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
.annotate 'line', 8281
    __ARG_1.'emitarg1'('throw', $S1)
.annotate 'line', 8282

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 8244
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8246
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8294
    setattribute self, 'start', __ARG_1
.annotate 'line', 8295
    self.'ModifierList'(__ARG_2, __ARG_3)
.annotate 'line', 8296

.end # TryModifierList


.sub 'allowtailcall' :method
.annotate 'line', 8299
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 8300

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8303
    $P1 = self.'getlist'()
.annotate 'line', 8304
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
.annotate 'line', 8305
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 8306
    $P7 = $P2.'numargs'()
    set $I1, $P7
.annotate 'line', 8307
    if $S1 == 'min_severity' goto __label_6
    if $S1 == 'max_severity' goto __label_7
    if $S1 == 'handle_types' goto __label_8
    if $S1 == 'handle_types_except' goto __label_9
    if $S1 == 'allowtailcall' goto __label_10
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 8310
    eq $I1, 1, __label_11
.annotate 'line', 8311
    WSubId_1('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 8312
    $P3 = $P2.'getarg'(0)
.annotate 'line', 8314
    $P8 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 8313
    $P7 = WSubId_26("    %0.'%1'(%2)", __ARG_2, $S1, $P8)
    __ARG_1.'say'($P7)
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 8318
    new $P4, ['ResizableStringArray']
.annotate 'line', 8319
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
.annotate 'line', 8320
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 8321
    $P7 = $P5.'emit_get'(__ARG_1)
    push $P4, $P7
  __label_12: # for iteration
.annotate 'line', 8319
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 8324
    join $S2, ', ', $P4
.annotate 'line', 8323
    $P7 = WSubId_26("    %0.'%1'(%2)", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P7)
    goto __label_4 # break
  __label_10: # case
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8329
    concat $S3, "Modifier '", $S1
    concat $S3, $S3, "' not valid for try"
    getattribute $P8, self, 'start'
    WSubId_1($S3, $P8)
  __label_4: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8332

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 8289
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 8291
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
.annotate 'line', 8344
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8345
    $P1 = __ARG_2.'get'()
.annotate 'line', 8346
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8347
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8349
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8351
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 8352
    $P1 = __ARG_2.'get'()
.annotate 'line', 8353
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 8354
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 8355
    $P1 = __ARG_2.'get'()
.annotate 'line', 8356
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8357
    WSubId_54("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 8358
    $P1 = __ARG_2.'get'()
.annotate 'line', 8359
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 8360
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8361
    setattribute self, 'exname', $P1
.annotate 'line', 8362
    self.'createvar'($S1, 'P')
.annotate 'line', 8363
    $P1 = __ARG_2.'get'()
.annotate 'line', 8364
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 8365
    WSubId_54("')' in 'catch'", $P1)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 8367
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'scatch', $P3
.annotate 'line', 8368

.end # TryStatement


.sub 'allowtailcall' :method
.annotate 'line', 8371
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8372
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8374
    .return(0)
  __label_2: # endif
.annotate 'line', 8375

.end # allowtailcall


.sub 'optimize' :method
.annotate 'line', 8378
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8379
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 8380
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 8381
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 8382
    .return(self)
.annotate 'line', 8383

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8386
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8387
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8388
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 8389
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 8390
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 8391
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 8393
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 8394
    self.'annotate'(__ARG_1)
.annotate 'line', 8395
    unless $I1 goto __label_7
.annotate 'line', 8396
    __ARG_1.'comment'('try: create handler')
  __label_7: # endif
.annotate 'line', 8397
    $P1 = WSubId_26("    new %0, 'ExceptionHandler'\n    set_label %0, %1\n", $S1, $S2)
    __ARG_1.'print'($P1)
.annotate 'line', 8404
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_8
.annotate 'line', 8405
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_8: # endif
.annotate 'line', 8407
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 8408
    unless $I1 goto __label_9
.annotate 'line', 8409
    __ARG_1.'comment'('try: begin')
  __label_9: # endif
.annotate 'line', 8410
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8411
    unless $I1 goto __label_10
.annotate 'line', 8412
    __ARG_1.'comment'('try: end')
  __label_10: # endif
.annotate 'line', 8413
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8415
    self.'annotate'(__ARG_1)
.annotate 'line', 8416
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8418
    unless $I1 goto __label_11
.annotate 'line', 8419
    __ARG_1.'comment'('catch')
  __label_11: # endif
.annotate 'line', 8420
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 8421
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 8422
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 8423
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8424
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8426
    unless $I1 goto __label_12
.annotate 'line', 8427
    __ARG_1.'comment'('catch end')
  __label_12: # endif
.annotate 'line', 8428
    __ARG_1.'emitlabel'($S3)
.annotate 'line', 8429

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 8335
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8337
    addattribute $P0, 'stry'
.annotate 'line', 8338
    addattribute $P0, 'modifiers'
.annotate 'line', 8339
    addattribute $P0, 'exname'
.annotate 'line', 8340
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.annotate 'line', 8442
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8443
    setattribute self, 'name', __ARG_3
.annotate 'line', 8444
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 8445
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 8446

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 8436
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8438
    addattribute $P0, 'name'
.annotate 'line', 8439
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
.annotate 'line', 8461
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8462
    setattribute self, 'name', __ARG_3
.annotate 'line', 8463
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 8464
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 8465
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 8466

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 8453
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8455
    addattribute $P0, 'name'
.annotate 'line', 8456
    addattribute $P0, 'basetype'
.annotate 'line', 8457
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
.annotate 'line', 8477
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 8478
    $P1 = __ARG_5.'get'()
.annotate 'line', 8479
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8481
    $P4 = WSubId_51(__ARG_5, self)
    setattribute self, 'init', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8484
    __ARG_5.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8485

.end # DeclareSingleStatement


.sub 'optimize' :method
.annotate 'line', 8488
    getattribute $P1, self, 'init'
.annotate 'line', 8489
    if_null $P1, __label_1
.annotate 'line', 8490
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8491
    .return(self)
.annotate 'line', 8492

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8495
    self.'annotate'(__ARG_1)
.annotate 'line', 8496
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8497
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8498
    null $S3
.annotate 'line', 8499
    getattribute $P2, self, 'basetype'
    null $S4
    if_null $P2, __label_3
    set $S4, $P2
  __label_3:
.annotate 'line', 8500
    getattribute $P1, self, 'init'
.annotate 'line', 8501
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8502
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
  __label_4: # endif
.annotate 'line', 8504
    isnull $I1, $P1
    box $P2, $I1
    if $P2 goto __label_7
    $P2 = $P1.'isnull'()
  __label_7:
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 8505
    __ARG_1.'emitnull'($S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 8507
    $P3 = $P1.'checkresult'()
    null $S5
    if_null $P3, __label_8
    set $S5, $P3
  __label_8:
.annotate 'line', 8508
    ne $S5, $S4, __label_9
.annotate 'line', 8509
    $P1.'emit'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
.annotate 'line', 8511
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 8513
    $P1.'emit'(__ARG_1, $S2)
    goto __label_12
  __label_11: # else
.annotate 'line', 8515
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 8516
    if $S4 == 'I' goto __label_17
    if $S4 == 'N' goto __label_18
    if $S4 == 'S' goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 8518
    $P3 = WSubId_29($P1)
    set $S3, $P3
.annotate 'line', 8519
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_18: # case
.annotate 'line', 8522
    $P4 = WSubId_113($P1)
    set $S3, $P4
.annotate 'line', 8523
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_19: # case
.annotate 'line', 8526
    $P5 = WSubId_28($P1)
    set $S3, $P5
.annotate 'line', 8527
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 8530
    WSubId_6("Wrong type", self)
  __label_15: # switch end
    goto __label_14
  __label_13: # else
.annotate 'line', 8534
    if $S5 == 'v' goto __label_22
    goto __label_21
  __label_22: # case
.annotate 'line', 8536
    WSubId_1('Invalid initialization from void value', self)
  __label_21: # default
.annotate 'line', 8538
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S3, $P2
  __label_20: # switch end
.annotate 'line', 8540
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_25
    iseq $I1, $S5, 'P'
  __label_25:
    unless $I1 goto __label_23
.annotate 'line', 8541
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_26
    set $S6, $P2
  __label_26:
.annotate 'line', 8542
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8543
    __ARG_1.'emitif_null'($S3, $S6)
.annotate 'line', 8544
    __ARG_1.'emitset'($S2, $S3)
.annotate 'line', 8545
    __ARG_1.'emitlabel'($S6)
    goto __label_24
  __label_23: # else
.annotate 'line', 8548
    __ARG_1.'emitset'($S2, $S3)
  __label_24: # endif
  __label_14: # endif
  __label_12: # endif
  __label_10: # endif
  __label_6: # endif
.annotate 'line', 8552

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8471
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8473
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
.annotate 'line', 8567
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 8568
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 8569
    $P1 = __ARG_6.'get'()
.annotate 'line', 8570
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8572
    __ARG_6.'unget'($P1)
.annotate 'line', 8573
    $P3 = WSubId_51(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 8574
    WSubId_68(']', __ARG_6)
  __label_1: # endif
.annotate 'line', 8576
    $P1 = __ARG_6.'get'()
.annotate 'line', 8577
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8578
    $P1 = __ARG_6.'get'()
.annotate 'line', 8579
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8580
    WSubId_54("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 8581
    $P1 = __ARG_6.'get'()
.annotate 'line', 8582
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 8583
    __ARG_6.'unget'($P1)
.annotate 'line', 8584
    $P3 = WSubId_50(__ARG_6, self, WSubId_51, ']')
    setattribute self, 'initarray', $P3
  __label_5: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 8588
    __ARG_6.'unget'($P1)
  __label_3: # endif
.annotate 'line', 8589

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 8592
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8593
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8594
    getattribute $P1, self, 'initarray'
    WSubId_52($P1)
.annotate 'line', 8595
    .return(self)
.annotate 'line', 8596

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8599
    self.'annotate'(__ARG_1)
.annotate 'line', 8601
    getattribute $P1, self, 'reg'
.annotate 'line', 8602
    getattribute $P2, self, 'size'
.annotate 'line', 8603
    getattribute $P3, self, 'initarray'
.annotate 'line', 8604
    getattribute $P4, self, 'basetype'
.annotate 'line', 8605
    getattribute $P5, self, 'arraytype'
.annotate 'line', 8606
    if_null $P2, __label_1
.annotate 'line', 8609
    $P8 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 8608
    $P7 = WSubId_26("    new %0, ['Fixed%1Array'], %2", $P1, $P5, $P8)
    __ARG_1.'say'($P7)
    goto __label_2
  __label_1: # else
.annotate 'line', 8613
    $P7 = WSubId_26("    new %0, ['Resizable%1Array']", $P1, $P5)
    __ARG_1.'say'($P7)
  __label_2: # endif
.annotate 'line', 8616
    if_null $P3, __label_3
.annotate 'line', 8617
    $P7 = self.'tempreg'($P4)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 8618
    elements $I1, $P3
.annotate 'line', 8619
    unless_null $P2, __label_5
.annotate 'line', 8620
    unless $I1 goto __label_6
.annotate 'line', 8622
    __ARG_1.'emitset'($P1, $I1)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 8625
    null $I2
.annotate 'line', 8626
    if_null $P3, __label_8
    iter $P9, $P3
    set $P9, 0
  __label_7: # for iteration
    unless $P9 goto __label_8
    shift $P6, $P9
.annotate 'line', 8627
    $P6.'emit'(__ARG_1, $S1)
.annotate 'line', 8628
    $P7 = WSubId_26("    %0[%1] = %2", $P1, $I2, $S1)
    __ARG_1.'say'($P7)
.annotate 'line', 8629
    inc $I2
    goto __label_7
  __label_8: # endfor
  __label_3: # endif
.annotate 'line', 8632

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8557
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8559
    addattribute $P0, 'size'
.annotate 'line', 8560
    addattribute $P0, 'initarray'
.annotate 'line', 8561
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
.annotate 'line', 8639
    null $P1
.annotate 'line', 8640
    null $P2
  __label_1: # do
.annotate 'line', 8642
    $P3 = __ARG_4.'get'()
.annotate 'line', 8643
    WSubId_108($P3)
.annotate 'line', 8644
    $P4 = __ARG_4.'get'()
.annotate 'line', 8645
    null $P5
.annotate 'line', 8646
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8647
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
.annotate 'line', 8649
    __ARG_4.'unget'($P4)
.annotate 'line', 8650
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
  __label_5: # endif
.annotate 'line', 8652
    $P2 = WSubId_114($P2, $P5)
.annotate 'line', 8653
    $P1 = __ARG_4.'get'()
  __label_3: # continue
.annotate 'line', 8654
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8655
    WSubId_4(';', $P1)
.annotate 'line', 8656
    .return($P2)
.annotate 'line', 8657

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8665
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
.annotate 'line', 8666

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8661
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8673
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
.annotate 'line', 8674

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8669
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8680
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8681

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8685
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8686

.end # newIntArray


.sub 'parseInt' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_116 = "WSubId_116"
.const 'Sub' WSubId_117 = "WSubId_117"
.annotate 'line', 8690
    .tailcall WSubId_115(WSubId_116, WSubId_117, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8691

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8699
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
.annotate 'line', 8700

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8695
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8707
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
.annotate 'line', 8708

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8703
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_118')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8714
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8715

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8719
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8720

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_119 = "WSubId_119"
.annotate 'line', 8724
    .tailcall WSubId_115(WSubId_118, WSubId_119, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8725

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8733
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
.annotate 'line', 8734

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8729
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8741
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
.annotate 'line', 8742

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8737
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_120')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8748
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8749

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_121')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8753
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8754

.end # newStringArray


.sub 'parseString' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_121 = "WSubId_121"
.annotate 'line', 8758
    .tailcall WSubId_115(WSubId_120, WSubId_121, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8759

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 8775
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8776
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8777
    setattribute self, 'name', __ARG_4
.annotate 'line', 8778
    setattribute self, 'value', __ARG_5
.annotate 'line', 8779
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
.annotate 'line', 8780

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8783
    getattribute $P1, self, 'value'
.annotate 'line', 8784
    getattribute $P2, self, 'name'
.annotate 'line', 8785
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8786
    $P1 = $P1.'optimize'()
.annotate 'line', 8787
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 8788
    WSubId_1('Value for const is not evaluable at compile time', self)
  __label_2: # endif
.annotate 'line', 8791
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8792
    .return(self)
.annotate 'line', 8793

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 8796
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
.annotate 'line', 8797

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8800
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8801
    getattribute $P3, self, 'data'
    $P1 = $P3.'getvalue'()
.annotate 'line', 8802
    null $S1
.annotate 'line', 8803
    getattribute $P2, self, 'type'
    set $S2, $P2
    if $S2 == 'I' goto __label_4
    if $S2 == 'N' goto __label_5
    if $S2 == 'S' goto __label_6
    goto __label_3
  __label_4: # case
.annotate 'line', 8804
    $P3 = $P1.'getIntegerValue'()
    set $S1, $P3
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 8805
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 8806
    $P5 = $P1.'getPirString'()
    set $S1, $P5
    goto __label_2 # break
  __label_3: # default
  __label_2: # switch end
.annotate 'line', 8809
    getattribute $P2, self, 'name'
    set $S2, $P2
.annotate 'line', 8810
    concat $S3, "Constant '", $S2
    concat $S3, $S3, "' set to: "
    concat $S3, $S3, $S1
.annotate 'line', 8809
    __ARG_1.'comment'($S3)
  __label_1: # endif
.annotate 'line', 8812

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8765
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8767
    addattribute $P0, 'type'
.annotate 'line', 8768
    addattribute $P0, 'name'
.annotate 'line', 8769
    addattribute $P0, 'data'
.annotate 'line', 8770
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
.annotate 'line', 8817
    $P1 = __ARG_2.'get'()
.annotate 'line', 8818
    $P5 = WSubId_112($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8819
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8820
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8822
    null $P2
  __label_5: # do
.annotate 'line', 8824
    $P1 = __ARG_2.'get'()
.annotate 'line', 8825
    set $P3, $P1
.annotate 'line', 8826
    WSubId_68('=', __ARG_2)
.annotate 'line', 8827
    $P4 = WSubId_51(__ARG_2, __ARG_3)
.annotate 'line', 8829
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8828
    $P2 = WSubId_114($P2, $P5)
  __label_7: # continue
.annotate 'line', 8830
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8831
    .return($P2)
.annotate 'line', 8832

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
.annotate 'line', 8843
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8844
    $P1 = __ARG_2.'get'()
.annotate 'line', 8845
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8846
    $P4 = WSubId_51(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8847
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 8849
    WSubId_4(';', $P1)
.annotate 'line', 8850

.end # VarStatement


.sub 'optimize_init' :method
.annotate 'line', 8853
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8854
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8855
    .return(self)
.annotate 'line', 8856

.end # optimize_init


.sub 'optimize' :method
.annotate 'line', 8859
    .tailcall self.'optimize_init'()
.annotate 'line', 8860

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8863
    self.'annotate'(__ARG_1)
.annotate 'line', 8864
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8865
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8866
    getattribute $P1, self, 'init'
.annotate 'line', 8867
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8868
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
  __label_3: # endif
.annotate 'line', 8869
    if_null $P1, __label_4
.annotate 'line', 8870
    $P2 = $P1.'isnull'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 8871
    null $P1
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 8872
    if_null $P1, __label_6
.annotate 'line', 8873
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    if $S4 == 'P' goto __label_10
    if $S4 == 'S' goto __label_11
    if $S4 == 'I' goto __label_12
    if $S4 == 'N' goto __label_13
    if $S4 == 'v' goto __label_14
    goto __label_9
  __label_10: # case
.annotate 'line', 8875
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_18
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_18:
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_17:
    unless $I1 goto __label_15
.annotate 'line', 8876
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_16
  __label_15: # else
.annotate 'line', 8878
    $P1.'emit'(__ARG_1, $S2)
  __label_16: # endif
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
  __label_13: # case
.annotate 'line', 8883
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_19
    set $S3, $P3
  __label_19:
.annotate 'line', 8884
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_8 # break
  __label_14: # case
.annotate 'line', 8887
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_9: # default
.annotate 'line', 8889
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_8: # switch end
    goto __label_7
  __label_6: # else
.annotate 'line', 8893
    __ARG_1.'emitnull'($S2)
  __label_7: # endif
.annotate 'line', 8894

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8838
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8840
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8901
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8902
    WSubId_68(';', __ARG_2)
.annotate 'line', 8903

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8906
    self.'annotate'(__ARG_1)
.annotate 'line', 8907
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8908
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 8909
    getattribute $P3, self, 'name'
    $P2 = WSubId_26("var %0[] : %1", $P3, $S1)
    __ARG_1.'comment'($P2)
  __label_2: # endif
.annotate 'line', 8910
    $P1 = WSubId_26("    new %0, 'ResizablePMCArray'", $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 8911

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8897
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
.annotate 'line', 8920
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8921
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8922
    WSubId_68(']', __ARG_2)
.annotate 'line', 8923
    WSubId_68(';', __ARG_2)
.annotate 'line', 8924

.end # FixedVarStatement


.sub 'optimize' :method
.annotate 'line', 8927
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8928
    .tailcall self.'optimize_init'()
.annotate 'line', 8929

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8932
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8933
    self.'annotate'(__ARG_1)
.annotate 'line', 8934
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8935
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 8936
    getattribute $P3, self, 'name'
    $P2 = WSubId_26("var %0[] : %1", $P3, $S2)
    __ARG_1.'comment'($P2)
  __label_3: # endif
.annotate 'line', 8937
    $P1 = WSubId_26("    new %0, 'FixedPMCArray', %1", $S2, $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 8938

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8914
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8916
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_108 = "WSubId_108"
.annotate 'line', 8943
    $P1 = __ARG_2.'get'()
.annotate 'line', 8944
    WSubId_108($P1)
.annotate 'line', 8945
    $P2 = __ARG_2.'get'()
.annotate 'line', 8946
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 8947
    $P2 = __ARG_2.'get'()
.annotate 'line', 8948
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8949
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
.annotate 'line', 8951
    __ARG_2.'unget'($P2)
.annotate 'line', 8952
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 8956
    __ARG_2.'unget'($P2)
.annotate 'line', 8957
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8959

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_60 = "WSubId_60"
.annotate 'line', 8963
    $P1 = __ARG_2.'get'()
.annotate 'line', 8964
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8965
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8966
    .tailcall WSubId_60(__ARG_1, __ARG_2, __ARG_3, 1)
.annotate 'line', 8967

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 8980
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8981
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8982
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8983
    null $P1
  __label_2: # while
.annotate 'line', 8984
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8985
    __ARG_2.'unget'($P1)
.annotate 'line', 8986
    $P2 = WSubId_109(__ARG_2, self)
.annotate 'line', 8987
    unless_null $P2, __label_3
.annotate 'line', 8988
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8989
    getattribute $P3, self, 'statements'
    push $P3, $P2
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8991
    setattribute self, 'end', $P1
.annotate 'line', 8992

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 8995
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 8996
    getattribute $P1, self, 'labels'
.annotate 'line', 8997
    $S2 = $P1[$S1]
.annotate 'line', 8998
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8999
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 9000
    .return($S2)
.annotate 'line', 9001

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9004
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9005
    getattribute $P1, self, 'labels'
.annotate 'line', 9006
    $S2 = $P1[$S1]
.annotate 'line', 9007
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9008
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 9009
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 9010
    $P1[$S1] = $S3
.annotate 'line', 9011
    .return($S3)
.annotate 'line', 9012

.end # createlabel


.sub 'getend' :method
.annotate 'line', 9013
    getattribute $P1, self, 'end'
    .return($P1)

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9016
    $P2 = __ARG_1.'getDebug'()
    set $I1, $P2
.annotate 'line', 9017
    unless $I1 goto __label_1
.annotate 'line', 9018
    __ARG_1.'comment'('{')
  __label_1: # endif
.annotate 'line', 9019
    getattribute $P2, self, 'statements'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9020
    $P1.'emit'(__ARG_1)
.annotate 'line', 9021
    self.'freetemps'()
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9023
    unless $I1 goto __label_4
.annotate 'line', 9024
    __ARG_1.'comment'('}')
  __label_4: # endif
.annotate 'line', 9025

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8973
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8975
    addattribute $P0, 'end'
.annotate 'line', 8976
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
.annotate 'line', 9040
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 9042
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 9043
    new $P1, ['ResizableStringArray']
.annotate 'line', 9044
    new $P2, ['ResizableStringArray']
.annotate 'line', 9045
    setattribute self, 'tempreg', $P1
.annotate 'line', 9046
    setattribute self, 'freereg', $P2
.annotate 'line', 9047

.end # RegisterStore


.sub 'createreg' :method
.annotate 'line', 9050
    getattribute $P1, self, 'nreg'
.annotate 'line', 9051
    set $I1, $P1
.annotate 'line', 9052
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 9053
    assign $P1, $I1
.annotate 'line', 9054
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
.annotate 'line', 9055

.end # createreg


.sub 'tempreg' :method
.annotate 'line', 9058
    getattribute $P1, self, 'freereg'
.annotate 'line', 9059
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9060
    null $S1
.annotate 'line', 9061
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9062
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9064
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 9065
    push $P2, $S1
.annotate 'line', 9066
    .return($S1)
.annotate 'line', 9067

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9070
    getattribute $P1, self, 'freereg'
.annotate 'line', 9071
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9072
    elements $I1, $P2
.annotate 'line', 9073
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
.annotate 'line', 9074
    $S1 = $P2[$I2]
.annotate 'line', 9075
    push $P1, $S1
  __label_1: # for iteration
.annotate 'line', 9073
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 9077
    assign $P2, 0
.annotate 'line', 9078

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 9034
    addattribute $P0, 'type'
.annotate 'line', 9035
    addattribute $P0, 'nreg'
.annotate 'line', 9036
    addattribute $P0, 'tempreg'
.annotate 'line', 9037
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9089
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9090

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9093
    null $P1
.annotate 'line', 9094
    null $P2
.annotate 'line', 9095
    $P3 = self.'getlist'()
.annotate 'line', 9096
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
.annotate 'line', 9097
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 9098
    if $S1 == 'named' goto __label_6
    if $S1 == 'slurpy' goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9100
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9103
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9106
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9110
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 9117
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 9134
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 9115
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 9118
    null $S2
.annotate 'line', 9119
    $P7 = $P1.'numargs'()
    set $I2, $P7
    if $I2 == 0 goto __label_16
    if $I2 == 1 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 9121
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 9124
    $P5 = $P1.'getarg'(0)
.annotate 'line', 9125
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 9126
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 9127
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 9130
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 9132
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 9135
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 9138

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 9085
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_112 = "WSubId_112"
.annotate 'line', 9149
    setattribute self, 'func', __ARG_1
.annotate 'line', 9150
    $P1 = __ARG_2.'get'()
.annotate 'line', 9151
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_112($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9152
    eq $S1, '', __label_2
.annotate 'line', 9153
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 9155
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 9156
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 9157
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S4, '__ARG_', $S3
    set $S2, $S4
.annotate 'line', 9158
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 9160
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 9161
    $P1 = __ARG_2.'get'()
.annotate 'line', 9162
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9163
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 9165
    __ARG_2.'unget'($P1)
  __label_5: # endif
.annotate 'line', 9166

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_122 = "WSubId_122"
.annotate 'line', 9169
    getattribute $P1, self, 'func'
.annotate 'line', 9170
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9171
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 9172
    $P5 = $P2.'gettype'()
    $P4 = WSubId_122($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 9173
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 9174
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9175
    if_null $P3, __label_3
.annotate 'line', 9176
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 9177
    __ARG_1.'say'('')
.annotate 'line', 9178

.end # emit


.sub 'get_type' :method
.annotate 'line', 9181
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 9182

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 9143
    addattribute $P0, 'func'
.annotate 'line', 9144
    addattribute $P0, 'name'
.annotate 'line', 9145
    addattribute $P0, 'modifiers'
.annotate 'line', 9146
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_123')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9188
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9189

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9200
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 9201
    setattribute self, 'name', __ARG_1
.annotate 'line', 9202

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9205
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 9206
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9207
    self.'annotate'(__ARG_1)
.annotate 'line', 9208
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 9209
    .return($S1)
.annotate 'line', 9210

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 9195
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9197
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_subid' :subid('WSubId_126')
        .param string __ARG_1
.annotate 'line', 9219
    concat $S1, ".const 'Sub' ", __ARG_1
    concat $S1, $S1, ' = "'
    concat $S1, $S1, __ARG_1
    concat $S1, $S1, "\"\n"
    .return($S1)
.annotate 'line', 9220

.end # emit_subid

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9226
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9227

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9230
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9231
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9233
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 9235
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 9236
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 9237
    le $I1, 0, __label_5
.annotate 'line', 9238
    __ARG_1.'print'('(')
.annotate 'line', 9239
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
.annotate 'line', 9240
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 9241
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 9242
    WSubId_1('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 9243
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 9244
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 9245
    __ARG_1.'print'(", ")
  __label_10: # endif
  __label_6: # for iteration
.annotate 'line', 9239
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 9247
    __ARG_1.'print'(')')
  __label_5: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9250

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 9222
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_125')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9255
    $P4 = __ARG_2.'numargs'()
    set $I1, $P4
.annotate 'line', 9256
    null $P1
.annotate 'line', 9257
    unless $I1 goto __label_1
.annotate 'line', 9258
    root_new $P4, ['parrot';'ResizablePMCArray']
    set $P1, $P4
.annotate 'line', 9259
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 9260
    $P2 = __ARG_2.'getarg'($I2)
.annotate 'line', 9262
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 9265
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 9272
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 9263
    $P4 = $P2.'get_value'()
    push $P1, $P4
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9266
    $P5 = $P2.'getName'()
    null $S1
    if_null $P5, __label_10
    set $S1, $P5
  __label_10:
.annotate 'line', 9267
    iseq $I4, $S1, "int"
    if $I4 goto __label_15
    iseq $I4, $S1, "float"
  __label_15:
    if $I4 goto __label_14
    iseq $I4, $S1, "string"
  __label_14:
    if $I4 goto __label_13
    iseq $I4, $S1, "var"
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9268
    push $P1, $S1
    goto __label_12
  __label_11: # else
.annotate 'line', 9270
    getattribute $P6, $P2, 'start'
    WSubId_1("unsupported multi signature", $P6)
  __label_12: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9273
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 9274
    unless_null $P3, __label_16
.annotate 'line', 9275
    getattribute $P7, $P2, 'start'
    WSubId_1("class not found", $P7)
  __label_16: # endif
.annotate 'line', 9277
    $P8 = WSubId_30($P3)
    push $P1, $P8
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9280
    getattribute $P9, $P2, 'start'
    WSubId_1("unsupported multi signature", $P9)
  __label_5: # switch end
  __label_2: # for iteration
.annotate 'line', 9259
    inc $I2
    goto __label_4
  __label_3: # for end
  __label_1: # endif
.annotate 'line', 9284
    .return($P1)
.annotate 'line', 9285

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9307
    self.'BlockStatement'(__ARG_1, __ARG_2)
.annotate 'line', 9308
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 9309
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 9310
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 9311
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 9312
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
.annotate 'line', 9313

.end # FunctionBase


.sub 'getouter' :method
.annotate 'line', 9315
    .return(self)

.end # getouter


.sub 'allowtailcall' :method
.annotate 'line', 9318
    .return(1)
.annotate 'line', 9319

.end # allowtailcall


.sub 'makesubid' :method
.annotate 'line', 9323
    getattribute $P1, self, 'subid'
.annotate 'line', 9324
    unless_null $P1, __label_1
.annotate 'line', 9325
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 9326
    .return($P1)
.annotate 'line', 9327

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 9330
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 9331
    unless_null $P1, __label_1
.annotate 'line', 9332
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 9333
    $P1[__ARG_1] = 1
.annotate 'line', 9334

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
.annotate 'line', 9338
    issame $I1, self, __ARG_1
.annotate 'line', 9339
    .return($I1)
.annotate 'line', 9340

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_123 = "WSubId_123"
.annotate 'line', 9343
    $P1 = __ARG_1.'get'()
.annotate 'line', 9344
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9345
    __ARG_1.'unget'($P1)
.annotate 'line', 9346
    $P3 = WSubId_50(__ARG_1, self, WSubId_123, ')')
    setattribute self, 'params', $P3
  __label_1: # endif
.annotate 'line', 9348

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 9352
    getattribute $P1, self, 'localfun'
.annotate 'line', 9353
    unless_null $P1, __label_1
.annotate 'line', 9354
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9356
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 9357

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 9361
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9362
    unless_null $P1, __label_1
.annotate 'line', 9363
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'usednamespaces', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9365
    $P4 = WSubId_124($P1, __ARG_1)
    if_null $P4, __label_3
.annotate 'line', 9366
    .return()
  __label_3: # endif
.annotate 'line', 9367
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 9369

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 9372
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9373
    $P2 = $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 9374
    if_null $P2, __label_3
.annotate 'line', 9375
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9377
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 9378

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 9382
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9383
    if_null $P1, __label_1
.annotate 'line', 9384
    $P2 = $P1.'pick'('multi')
.annotate 'line', 9385
    if_null $P2, __label_2
.annotate 'line', 9387
    self.'setmulti'()
.annotate 'line', 9388
    $P5 = WSubId_125(self, $P2)
    setattribute self, 'multi_sig', $P5
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 9391
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
.annotate 'line', 9392
    $P3.'fixnamespaces'()
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9393
    getattribute $P7, self, 'body'
    $P5 = $P7.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 9394
    .return(self)
.annotate 'line', 9395

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 9399
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 9400
    unless_null $P1, __label_1
.annotate 'line', 9401
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 9402
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 9403

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 9406
    getattribute $P1, self, 'lexicals'
.annotate 'line', 9407
    unless_null $P1, __label_1
.annotate 'line', 9408
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 9409
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 9410

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
.annotate 'line', 9415
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 9416
    null $S1
.annotate 'line', 9417
    if_null $P1, __label_1
.annotate 'line', 9418
    set $S1, $P1
    goto __label_2
  __label_1: # else
.annotate 'line', 9420
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 9421
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 9422
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 9423
    self.'setlex'($S1, $S2)
.annotate 'line', 9424
    __ARG_1.'setlex'($S1)
  __label_2: # endif
.annotate 'line', 9426
    .return($S1)
.annotate 'line', 9427

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9431
    null $P1
.annotate 'line', 9432
    if __ARG_1 == 'I' goto __label_3
    if __ARG_1 == 'N' goto __label_4
    if __ARG_1 == 'S' goto __label_5
    if __ARG_1 == 'P' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 9434
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9436
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9438
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9440
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9442
    concat $S3, "Invalid type in createreg: ", __ARG_1
    WSubId_6($S3)
  __label_1: # switch end
.annotate 'line', 9444
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9445
    .return($S1)
.annotate 'line', 9446

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9449
    null $P1
.annotate 'line', 9450
    if __ARG_1 == 'I' goto __label_3
    if __ARG_1 == 'N' goto __label_4
    if __ARG_1 == 'S' goto __label_5
    if __ARG_1 == 'P' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 9452
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9454
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9456
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9458
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9460
    concat $S3, "Invalid type in tempreg: ", __ARG_1
    WSubId_6($S3)
  __label_1: # switch end
.annotate 'line', 9462
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9463
    .return($S1)
.annotate 'line', 9464

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9467
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
.annotate 'line', 9468
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9469

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 9472
    getattribute $P1, self, 'nlabel'
    inc $P1
    set $I1, $P1
.annotate 'line', 9473
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
.annotate 'line', 9474

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9477
    WSubId_1('break not allowed here', __ARG_1)
.annotate 'line', 9478

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9481
    WSubId_1('continue not allowed here', __ARG_1)
.annotate 'line', 9482

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
.annotate 'line', 9488
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 9489
    __ARG_1.'say'()
.annotate 'line', 9490
    __ARG_1.'print'(".sub ")
.annotate 'line', 9491
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 9492
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 9494
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 9495
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 9496
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 9498
    getattribute $P1, self, 'outer'
.annotate 'line', 9499
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_6
    getattribute $P8, self, 'usedlexicals'
    isnull $I2, $P8
    not $I2
  __label_6:
    unless $I2 goto __label_5
.annotate 'line', 9500
    getattribute $P2, $P1, 'subid'
.annotate 'line', 9501
    if_null $P2, __label_7
.annotate 'line', 9502
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 9506
    $P8 = self.'ismethod'()
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 9507
    __ARG_1.'print'(' :method')
  __label_8: # endif
.annotate 'line', 9508
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9509
    if_null $P3, __label_9
.annotate 'line', 9510
    $P3.'emit'(__ARG_1)
    goto __label_10
  __label_9: # else
.annotate 'line', 9512
    ne $S1, 'main', __label_11
.annotate 'line', 9513
    __ARG_1.'print'(' :main')
  __label_11: # endif
  __label_10: # endif
.annotate 'line', 9515
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 9516
    __ARG_1.'say'()
.annotate 'line', 9519
    getattribute $P8, self, 'params'
    WSubId_66(__ARG_1, $P8)
.annotate 'line', 9521
    getattribute $P4, self, 'lexicals'
.annotate 'line', 9522
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 9523
    isnull $I2, $P4
    not $I2
    if $I2 goto __label_13
    isnull $I2, $P5
    not $I2
  __label_13:
    unless $I2 goto __label_12
.annotate 'line', 9524
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 9526
    if_null $P4, __label_15
    iter $P10, $P4
    set $P10, 0
  __label_14: # for iteration
    unless $P10 goto __label_15
    shift $S2, $P10
.annotate 'line', 9527
    $P9 = $P4[$S2]
    $P8 = WSubId_26(".lex '%0', %1", $P9, $S2)
    __ARG_1.'say'($P8)
    goto __label_14
  __label_15: # endfor
.annotate 'line', 9529
    if_null $P5, __label_17
    iter $P11, $P5
    set $P11, 0
  __label_16: # for iteration
    unless $P11 goto __label_17
    shift $S3, $P11
.annotate 'line', 9530
    substr $S4, $S3, 0, 1
    eq $S4, '$', __label_18
.annotate 'line', 9531
    concat $S5, "    .local pmc ", $S3
    __ARG_1.'say'($S5)
  __label_18: # endif
.annotate 'line', 9532
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
    goto __label_16
  __label_17: # endfor
  __label_12: # endif
.annotate 'line', 9536
    getattribute $P9, self, 'usedsubids'
    root_new $P12, ['parrot';'ResizablePMCArray']
    $P8 = WSubId_31($P9, $P12, WSubId_126)
    join $S4, "", $P8
    __ARG_1.'print'($S4)
.annotate 'line', 9538
    $P8 = __ARG_1.'getDebug'()
    set $I1, $P8
.annotate 'line', 9539
    getattribute $P6, self, 'body'
.annotate 'line', 9540
    $P8 = $P6.'isempty'()
    if_null $P8, __label_19
    unless $P8 goto __label_19
.annotate 'line', 9541
    unless $I1 goto __label_21
.annotate 'line', 9542
    __ARG_1.'comment'('Empty body')
  __label_21: # endif
    goto __label_20
  __label_19: # else
.annotate 'line', 9545
    unless $I1 goto __label_22
.annotate 'line', 9546
    __ARG_1.'comment'('Body')
  __label_22: # endif
.annotate 'line', 9547
    $P6.'emit'(__ARG_1)
.annotate 'line', 9548
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
  __label_20: # endif
.annotate 'line', 9550
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9553
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_24
    iter $P13, $P8
    set $P13, 0
  __label_23: # for iteration
    unless $P13 goto __label_24
    shift $P7, $P13
.annotate 'line', 9554
    $P7.'emit'(__ARG_1)
    goto __label_23
  __label_24: # endfor
.annotate 'line', 9555

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 9287
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 9289
    addattribute $P0, 'name'
.annotate 'line', 9290
    addattribute $P0, 'subid'
.annotate 'line', 9291
    addattribute $P0, 'modifiers'
.annotate 'line', 9292
    addattribute $P0, 'params'
.annotate 'line', 9293
    addattribute $P0, 'body'
.annotate 'line', 9294
    addattribute $P0, 'regstI'
.annotate 'line', 9295
    addattribute $P0, 'regstN'
.annotate 'line', 9296
    addattribute $P0, 'regstS'
.annotate 'line', 9297
    addattribute $P0, 'regstP'
.annotate 'line', 9298
    addattribute $P0, 'nlabel'
.annotate 'line', 9299
    addattribute $P0, 'localfun'
.annotate 'line', 9300
    addattribute $P0, 'lexicals'
.annotate 'line', 9301
    addattribute $P0, 'usedlexicals'
.annotate 'line', 9302
    addattribute $P0, 'usedsubids'
.annotate 'line', 9303
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'get_pir_type' :subid('WSubId_127')
        .param pmc __ARG_1
.const 'Sub' WSubId_122 = "WSubId_122"
.annotate 'line', 9564
    $P1 = __ARG_1.'get_type'()
    .tailcall WSubId_122($P1)
.annotate 'line', 9565

.end # get_pir_type

.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9576
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9577
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 9578
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 9579
    self.'parse'(__ARG_2)
.annotate 'line', 9580
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
.annotate 'line', 9581

.end # FunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 9583
    .return(0)

.end # isanonymous


.sub 'getparamnum' :method
.annotate 'line', 9587
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 9588

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 9592
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 9593

.end # getlexnum


.sub 'ismethod' :method
.annotate 'line', 9594
    .return(0)

.end # ismethod


.sub 'ismulti' :method
.annotate 'line', 9598
    getattribute $P1, self, 'is_multi'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)
.annotate 'line', 9599

.end # ismulti


.sub 'setmulti' :method
.annotate 'line', 9602
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
.annotate 'line', 9603

.end # setmulti


.sub 'default_multi_sig' :method
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 9606
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9607
    $P2 = self.'ismethod'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9608
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 9609
    getattribute $P2, self, 'params'
    WSubId_31($P2, $P1, WSubId_127)
.annotate 'line', 9610
    .return($P1)
.annotate 'line', 9611

.end # default_multi_sig


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_2 = "WSubId_2"
.annotate 'line', 9614
    $P1 = __ARG_1.'get'()
.annotate 'line', 9615
    setattribute self, 'name', $P1
.annotate 'line', 9616
    $P2 = __ARG_1.'get'()
.annotate 'line', 9617
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 9618
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9619
    $P2 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 9621
    WSubId_4('(', $P2)
.annotate 'line', 9622
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9624
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 9625
    $P4 = $P3.'fullname'()
    WSubId_128(self, '__FUNCTION__', $P4)
.annotate 'line', 9627
    $P2 = __ARG_1.'get'()
.annotate 'line', 9628
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9629
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9630
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9631
    .return(self)
.annotate 'line', 9632

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.annotate 'line', 9636
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9637
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9638
    unless_null $P1, __label_2
.annotate 'line', 9639
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 9640
    join $S1, ", ", $P1
    __ARG_1.'print'(' :multi(', $S1, ')')
  __label_1: # endif
.annotate 'line', 9642

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9567
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9569
    addattribute $P0, 'paramnum'
.annotate 'line', 9570
    addattribute $P0, 'lexnum'
.annotate 'line', 9571
    addattribute $P0, 'is_multi'
.annotate 'line', 9572
    addattribute $P0, 'multi_sig'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 9653
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9654
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9655
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9656
    $P1 = self.'makesubid'()
.annotate 'line', 9657
    setattribute self, 'name', $P1
.annotate 'line', 9658
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9659
    $P2 = __ARG_2.'get'()
.annotate 'line', 9660
    WSubId_4('{', $P2)
.annotate 'line', 9661
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9662
    __ARG_3.'addlocalfunction'(self)
.annotate 'line', 9663

.end # LocalFunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 9664
    .return(1)

.end # isanonymous


.sub 'ismethod' :method
.annotate 'line', 9665
    .return(0)

.end # ismethod


.sub 'needclosure' :method
.annotate 'line', 9668
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9669
    .return(1)
  __label_1: # endif
.annotate 'line', 9670
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9671
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9672
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9673
    .return(0)
.annotate 'line', 9674

.end # needclosure


.sub 'getsubid' :method
.annotate 'line', 9677
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 9678

.end # getsubid


.sub 'getparamnum' :method
.annotate 'line', 9682
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
.annotate 'line', 9683

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 9687
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
.annotate 'line', 9688

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9691
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9692
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9693
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9695
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9696
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9697
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9698
    $P2 = $P1.'getouter'()
.annotate 'line', 9699
    getattribute $P3, self, 'outer'
.annotate 'line', 9700
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
.annotate 'line', 9701
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 9702
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9703
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 9704
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9705
    eq $S3, 'P', __label_8
.annotate 'line', 9706
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9707
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9708
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9709
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9710
    .return($P4)
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 9713
    .return(__ARG_2)
.annotate 'line', 9714

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9717
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9718
    unless_null $P1, __label_1
.annotate 'line', 9719
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9720
    unless_null $P1, __label_2
.annotate 'line', 9723
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9724
    unless_null $P1, __label_3
.annotate 'line', 9726
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
.annotate 'line', 9727
    getattribute $P2, self, 'outer'
.annotate 'line', 9728
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 9729
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9730
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9731
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9732
    self.'setusedlex'($S1, $S2)
  __label_6: # endif
  __label_5: # endif
    goto __label_4
  __label_3: # else
.annotate 'line', 9736
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 9738
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9739
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9740
    .return($P1)
.annotate 'line', 9741

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9649
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9752
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9753

.end # MethodStatement


.sub 'ismethod' :method
.annotate 'line', 9754
    .return(1)

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9748
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_112 = "WSubId_112"
.annotate 'line', 9768
    $P1 = __ARG_1.'get'()
.annotate 'line', 9769
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9770
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9771
    $P2 = __ARG_1.'get'()
.annotate 'line', 9772
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 9773
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_112($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9774
    set $P1, $P2
.annotate 'line', 9775
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9776
    $P2 = __ARG_1.'get'()
  __label_2: # endif
.annotate 'line', 9778
    setattribute self, 'name', $P1
.annotate 'line', 9779
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9780
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9781
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9782
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9784
    __ARG_1.'unget'($P2)
  __label_5: # endif
.annotate 'line', 9785

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9788
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9789
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9790
    if_null $P1, __label_1
.annotate 'line', 9791
    getattribute $P2, self, 'name'
.annotate 'line', 9792
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
  __label_1: # endif
.annotate 'line', 9794

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9763
    addattribute $P0, 'name'
.annotate 'line', 9764
    addattribute $P0, 'modifiers'
.annotate 'line', 9765
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_129')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9799
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9800

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_129 = "WSubId_129"
.annotate 'line', 9807
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_129, ')')
    setattribute self, 'params', $P2
.annotate 'line', 9808

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9811
    __ARG_1.'print'('(')
.annotate 'line', 9812
    set $S1, ''
.annotate 'line', 9813
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9814
    __ARG_1.'print'($S1)
.annotate 'line', 9815
    $P1.'emit'(__ARG_1)
.annotate 'line', 9816
    set $S1, ', '
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9818
    __ARG_1.'print'(')')
.annotate 'line', 9819

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9804
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9828
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9829
    setattribute self, 'params', __ARG_3
.annotate 'line', 9830
    setattribute self, 'expr', __ARG_4
.annotate 'line', 9831

.end # MultiAssignStatement


.sub 'optimize' :method
.annotate 'line', 9834
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9835
    .return(self)
.annotate 'line', 9836

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9839
    getattribute $P1, self, 'expr'
.annotate 'line', 9840
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9841
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9842
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9843
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9844
    __ARG_1.'print'('    ')
.annotate 'line', 9845
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9846
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9847
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9848
    __ARG_1.'say'()
.annotate 'line', 9849

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9822
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9824
    addattribute $P0, 'params'
.annotate 'line', 9825
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9866
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 9867

.end # ClassSpecifier


.sub 'reftype' :method
.annotate 'line', 9868
    .return(0)

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 9872
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 9873

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9862
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9881
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9882
    setattribute self, 'name', __ARG_2
.annotate 'line', 9883

.end # ClassSpecifierStr


.sub 'reftype' :method
.annotate 'line', 9884
    .return(1)

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9888
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9889
    __ARG_1.'print'($S1)
.annotate 'line', 9890

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9876
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9878
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
.annotate 'line', 9899
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9900
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9901
    $P2 = __ARG_1.'get'()
.annotate 'line', 9902
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9903
    WSubId_54('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9904
    $P3 = $P2.'rawstring'()
    push $P1, $P3
.annotate 'line', 9905
    $P2 = __ARG_1.'get'()
.annotate 'line', 9906
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 9907
    $P4 = $P2.'checkop'()
    set $S1, $P4
    if $S1 == ':' goto __label_5
    if $S1 == ',' goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9909
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9913
    WSubId_55('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9916
    $P2 = __ARG_1.'get'()
.annotate 'line', 9917
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9918
    WSubId_54('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9919
    $P3 = $P2.'rawstring'()
    push $P1, $P3
  __label_9: # continue
.annotate 'line', 9920
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9921
    WSubId_4(']', $P2)
  __label_2: # endif
.annotate 'line', 9923
    setattribute self, 'key', $P1
.annotate 'line', 9924

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
.annotate 'line', 9925
    .return(2)

.end # reftype


.sub 'hasHLL' :method
.annotate 'line', 9928
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 9929

.end # hasHLL


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 9933
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9934
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 9935

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9938
    getattribute $P2, self, 'key'
    $P1 = WSubId_30($P2)
    __ARG_1.'print'($P1)
.annotate 'line', 9939

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9893
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9895
    addattribute $P0, 'key'
.annotate 'line', 9896
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9947
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9948
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 9949
    null $P2
  __label_2: # while
.annotate 'line', 9950
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9951
    $P2 = __ARG_1.'get'()
.annotate 'line', 9952
    set $S1, $P2
    push $P1, $S1
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9954
    __ARG_1.'unget'($P2)
.annotate 'line', 9955
    setattribute self, 'key', $P1
.annotate 'line', 9956

.end # ClassSpecifierId


.sub 'reftype' :method
.annotate 'line', 9957
    .return(3)

.end # reftype


.sub 'last' :method
.annotate 'line', 9961
    getattribute $P1, self, 'key'
.annotate 'line', 9962
    $P2 = $P1[-1]
    .return($P2)
.annotate 'line', 9963

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 9966
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9967
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 9968

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9972
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9973
    unless_null $P1, __label_1
.annotate 'line', 9974
    getattribute $P2, self, 'key'
    join $S1, ".", $P2
    getattribute $P3, self, 'start'
    WSubId_83(__ARG_1, $S1, $P3)
.annotate 'line', 9975
    getattribute $P3, self, 'key'
    $P2 = WSubId_30($P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 9977
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
.annotate 'line', 9978

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9981
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 9982
    unless_null $P1, __label_1
.annotate 'line', 9983
    getattribute $P2, self, 'key'
    join $S1, ".", $P2
    getattribute $P3, self, 'start'
    WSubId_83(__ARG_1, $S1, $P3)
.annotate 'line', 9984
    getattribute $P3, self, 'key'
    $P2 = WSubId_30($P3)
    __ARG_1.'say'("new ", __ARG_3, ", ", $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 9987
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
  __label_2: # endif
.annotate 'line', 9989

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9942
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9944
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10002
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 10003
    setattribute self, 'name', __ARG_2
.annotate 'line', 10004
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 10005
    setattribute self, 'classns', $P1
.annotate 'line', 10006

.end # ClassBase


.sub 'getpath' :method
.annotate 'line', 10009
    getattribute $P1, self, 'classns'
    .return($P1)
.annotate 'line', 10010

.end # getpath


.sub 'getclasskey' :method
.annotate 'line', 10013
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
.annotate 'line', 10014

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9996
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9998
    addattribute $P0, 'name'
.annotate 'line', 9999
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]

.sub 'FunctionContainer' :method
.annotate 'line', 10022
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions', $P2
.annotate 'line', 10023

.end # FunctionContainer


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10029
    getattribute $P1, self, 'functions'
.annotate 'line', 10030
    getattribute $P3, __ARG_1, 'name'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 10031
    $P2 = $P1[$S1]
.annotate 'line', 10032
    unless_null $P2, __label_2
.annotate 'line', 10033
    $P1[$S1] = __ARG_1
    goto __label_3
  __label_2: # else
.annotate 'line', 10035
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_4
.annotate 'line', 10036
    $P2.'setmulti'()
  __label_4: # endif
.annotate 'line', 10037
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_5
.annotate 'line', 10038
    __ARG_1.'setmulti'()
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 10040

.end # addfunction


.sub 'find' :method
        .param string __ARG_1
.annotate 'line', 10043
    getattribute $P1, self, 'functions'
.annotate 'line', 10044
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 10045

.end # find

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
.annotate 'line', 10019
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
.annotate 'line', 10059
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10060
    self.'VarContainer'()
.annotate 'line', 10061
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P8.'FunctionContainer'()
    set $P8, $P8
    setattribute self, 'funcont', $P8
.annotate 'line', 10062
    setattribute self, 'parent', __ARG_3
.annotate 'line', 10063
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 10064
    setattribute self, 'items', $P1
.annotate 'line', 10065
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 10066
    setattribute self, 'members', $P2
.annotate 'line', 10068
    $P3 = __ARG_4.'get'()
.annotate 'line', 10069
    $P7 = $P3.'isop'(':')
    if_null $P7, __label_1
    unless $P7 goto __label_1
.annotate 'line', 10070
    $P9 = WSubId_50(__ARG_4, self, WSubId_76)
    setattribute self, 'bases', $P9
.annotate 'line', 10071
    $P3 = __ARG_4.'get'()
  __label_1: # endif
.annotate 'line', 10073
    WSubId_4('{', $P3)
.annotate 'line', 10075
    getattribute $P8, self, 'classns'
    $P7 = $P8.'fullname'()
    WSubId_128(self, '__CLASS__', $P7)
.annotate 'line', 10077
    $P3 = __ARG_4.'get'()
  __label_4: # for condition
    $P7 = $P3.'isop'('}')
    isfalse $I1, $P7
    unless $I1 goto __label_3
.annotate 'line', 10078
    $P8 = $P3.'checkkeyword'()
    set $S1, $P8
    if $S1 == 'function' goto __label_7
    if $S1 == 'var' goto __label_8
    if $S1 == 'const' goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 10080
    new $P4, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P4.'MethodStatement'($P3, __ARG_4, self)
.annotate 'line', 10081
    self.'addmethod'($P4)
.annotate 'line', 10082
    push $P1, $P4
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10085
    $P5 = __ARG_4.'get'()
.annotate 'line', 10086
    $P9 = $P5.'isidentifier'()
    isfalse $I2, $P9
    unless $I2 goto __label_10
.annotate 'line', 10087
    WSubId_54("member identifier", $P5)
  __label_10: # endif
.annotate 'line', 10088
    push $P2, $P5
.annotate 'line', 10089
    $P3 = __ARG_4.'get'()
.annotate 'line', 10090
    $P10 = $P3.'isop'(';')
    isfalse $I3, $P10
    unless $I3 goto __label_11
.annotate 'line', 10091
    WSubId_54("';' in member declaration", $P3)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10094
    $P6 = WSubId_58($P3, __ARG_4, self)
.annotate 'line', 10095
    push $P1, $P6
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10098
    WSubId_55("item in class", $P3)
  __label_5: # switch end
  __label_2: # for iteration
.annotate 'line', 10077
    $P3 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10101

.end # ClassStatement


.sub 'addmethod' :method
        .param pmc __ARG_1
.annotate 'line', 10105
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 10106

.end # addmethod


.sub 'generatesubid' :method
.annotate 'line', 10109
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 10110

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 10113
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 10114

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 10117
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10118

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 10121
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
.annotate 'line', 10122

.end # use_builtin


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 10125
    getattribute $P1, self, 'items'
    WSubId_52($P1)
.annotate 'line', 10126
    .return(self)
.annotate 'line', 10127

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 10130
    getattribute $P3, self, 'classns'
    $P3.'emitnamespace'(__ARG_1)
.annotate 'line', 10131
    getattribute $P3, self, 'items'
    WSubId_66(__ARG_1, $P3)
.annotate 'line', 10133
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 10135
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 10136
    set $I1, 1
.annotate 'line', 10137
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10138
    $P1.'annotate'(__ARG_1)
.annotate 'line', 10139
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 10140
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 10141
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 10142
    __ARG_1.'say'()
.annotate 'line', 10143
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10145
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 10146
    __ARG_1.'annotate'($P2)
.annotate 'line', 10147
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
    goto __label_3
  __label_4: # endfor
.annotate 'line', 10150
    __ARG_1.'say'('.end')
.annotate 'line', 10151

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 10048
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 10050
    addattribute $P0, 'parent'
.annotate 'line', 10051
    addattribute $P0, 'bases'
.annotate 'line', 10052
    addattribute $P0, 'constants'
.annotate 'line', 10053
    addattribute $P0, 'items'
.annotate 'line', 10054
    addattribute $P0, 'members'
.annotate 'line', 10055
    addattribute $P0, 'funcont'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10158
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10159

.end # DeclareClassStatement


.sub 'optimize' :method
.annotate 'line', 10162
    .return(self)
.annotate 'line', 10163

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 10154
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_132')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10171
    $P1 = __ARG_2.'get'()
.annotate 'line', 10172
    $P2 = __ARG_2.'get'()
.annotate 'line', 10173
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 10174
    null $P4
  __label_3: # for condition
.annotate 'line', 10176
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 10177
    $P3.'push'($P1)
.annotate 'line', 10178
    $P1 = __ARG_2.'get'()
  __label_1: # for iteration
.annotate 'line', 10176
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10181
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 10182
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 10183
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 10184
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
    goto __label_5
  __label_4: # else
.annotate 'line', 10187
    __ARG_2.'unget'($P2)
.annotate 'line', 10188
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 10189
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 10190
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
  __label_5: # endif
.annotate 'line', 10192

.end # parseClass


.sub 'open_include' :subid('WSubId_130')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 10200
    getinterp $P1
.annotate 'line', 10205
    $P2 = $P1[9]
.annotate 'line', 10206
    $P3 = $P2[0]
.annotate 'line', 10207
    null $P4
.annotate 'line', 10208
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
.annotate 'line', 10209
    concat $S3, $S1, __ARG_1
    set $S2, $S3
.annotate 'line', 10210
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
.annotate 'line', 10211
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 10212
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 10213
    pop_eh
    goto __label_4
  __label_3:
.annotate 'line', 10210
    .get_results($P7)
    finalize $P7
    pop_eh
  __label_4:
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10218
    isnull $I1, $P4
    box $P6, $I1
    if $P6 goto __label_8
    $P6 = $P4.'is_closed'()
  __label_8:
    if_null $P6, __label_7
    unless $P6 goto __label_7
.annotate 'line', 10219
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 10220
    $P4.'encoding'("utf8")
.annotate 'line', 10221
    .return($P4)
.annotate 'line', 10222

.end # open_include


.sub 'include_parrot' :subid('WSubId_134')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_130 = "WSubId_130"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10226
    $P1 = __ARG_2.'get'()
.annotate 'line', 10227
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 10228
    WSubId_54('literal string', $P1)
  __label_1: # endif
.annotate 'line', 10229
    WSubId_68(';', __ARG_2)
.annotate 'line', 10231
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 10232
    $P2 = WSubId_130($S1, __ARG_1)
.annotate 'line', 10237
    $P4 = $P2.'readline'()
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
  __label_5: # for condition
    $P5 = $P2.'eof'()
    isfalse $I4, $P5
    unless $I4 goto __label_4
.annotate 'line', 10238
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
.annotate 'line', 10239
    set $I1, 12
.annotate 'line', 10240
    null $S3
  __label_9: # while
.annotate 'line', 10241
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 10242
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 10243
    set $I2, $I1
  __label_12: # while
.annotate 'line', 10244
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 10245
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 10246
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 10247
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 10249
    sub $I4, $I2, $I1
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 10250
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 10251
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 10252
    set $I1, $I2
  __label_22: # while
.annotate 'line', 10253
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 10254
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 10255
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 10256
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 10258
    sub $I4, $I2, $I1
    substr $S5, $S2, $I1, $I4
.annotate 'line', 10260
    null $I3
.annotate 'line', 10261
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 10262
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 10264
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 10265
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 10267
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 10266
    $P4 = WSubId_25(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
  __label_7: # endif
  __label_3: # for iteration
.annotate 'line', 10237
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 10271
    $P2.'close'()
.annotate 'line', 10272

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_135')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_130 = "WSubId_130"
.annotate 'line', 10278
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 10279
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 10280
    $P1 = __ARG_2.'get'()
.annotate 'line', 10281
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 10282
    WSubId_54('literal string', $P1)
  __label_2: # endif
.annotate 'line', 10283
    WSubId_68(';', __ARG_2)
.annotate 'line', 10285
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 10286
    $P2 = WSubId_130($S1, __ARG_1)
.annotate 'line', 10288
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 10289
    __ARG_3.'parse'($P3)
.annotate 'line', 10291
    $P2.'close'()
.annotate 'line', 10292

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
.annotate 'line', 10298
    $P1 = __ARG_2.'get'()
.annotate 'line', 10299
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 10300
    WSubId_72(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10301
    WSubId_68(';', __ARG_2)
.annotate 'line', 10302
    .return()
  __label_1: # endif
.annotate 'line', 10304
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
.annotate 'line', 10305
    __ARG_2.'unget'($P1)
.annotate 'line', 10306
    $P2 = WSubId_69(__ARG_2)
.annotate 'line', 10307
    elements $I1, $P2
.annotate 'line', 10308
    ge $I1, 1, __label_3
.annotate 'line', 10309
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 10310
    WSubId_68(';', __ARG_2)
.annotate 'line', 10311
    __ARG_3.'use'($P2)
.annotate 'line', 10312
    .return()
  __label_2: # endif
.annotate 'line', 10314
    $P1 = __ARG_2.'get'()
.annotate 'line', 10316
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 10322
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 10318
    null $S1
    if_null $P1, __label_8
    set $S1, $P1
  __label_8:
.annotate 'line', 10319
    __ARG_3.'addlib'($S1)
.annotate 'line', 10320
    WSubId_68(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 10323
    __ARG_2.'unget'($P1)
.annotate 'line', 10324
    $P3 = WSubId_69(__ARG_2)
.annotate 'line', 10325
    $P1 = __ARG_2.'get'()
.annotate 'line', 10326
    $P5 = $P1.'isop'(';')
    isfalse $I3, $P5
    unless $I3 goto __label_9
.annotate 'line', 10327
    __ARG_2.'unget'($P1)
.annotate 'line', 10328
    null $P5
    $P4 = WSubId_50(__ARG_2, $P5, WSubId_71, ';')
.annotate 'line', 10329
    __ARG_3.'addextern'($P3, $P4)
  __label_9: # endif
.annotate 'line', 10331
    join $S3, '/', $P3
    concat $S4, '"', $S3
    concat $S4, $S4, '.pbc"'
    set $S2, $S4
.annotate 'line', 10332
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 10335
    WSubId_54('string literal or identifier', $P1)
  __label_4: # switch end
.annotate 'line', 10337

.end # parsensUsing


.sub 'emit_push_symbols' :subid('WSubId_131')
        .param string __ARG_1
.annotate 'line', 10343
    concat $S1, "    push symbols, '", __ARG_1
    concat $S1, $S1, "'\n"
    .return($S1)
.annotate 'line', 10344

.end # emit_push_symbols

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10352
    setattribute self, 'module', __ARG_1
.annotate 'line', 10353
    setattribute self, 'names', __ARG_2
.annotate 'line', 10354

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_131 = "WSubId_131"
.annotate 'line', 10359
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 10369
    getattribute $P1, self, 'module'
    join $S1, "'; '", $P1
    concat $S2, "['parrot'; '", $S1
    concat $S2, $S2, "']"
.annotate 'line', 10368
    __ARG_1.'emitget_root_namespace'("srcns", $S2)
.annotate 'line', 10371
    getattribute $P2, self, 'names'
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P1 = WSubId_31($P2, $P3, WSubId_131)
    join $S1, "", $P1
    __ARG_1.'print'($S1)
.annotate 'line', 10372
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
.annotate 'line', 10378

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 10348
    addattribute $P0, 'module'
.annotate 'line', 10349
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
.annotate 'line', 10388
    new $P1, ['ResizableStringArray']
.annotate 'line', 10389
    unless __ARG_2 goto __label_1
.annotate 'line', 10390
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10392
    if_null __ARG_1, __label_3
.annotate 'line', 10393
    push $P1, __ARG_1
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 10395
    setattribute self, 'path', $P1
.annotate 'line', 10396

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
.annotate 'line', 10399
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 10400
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 10401
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 10402
    push $P2, __ARG_1
.annotate 'line', 10403
    setattribute $P1, 'path', $P2
.annotate 'line', 10404
    .return($P1)
.annotate 'line', 10405

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
.annotate 'line', 10408
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 10409
    getattribute $P2, self, 'hll'
.annotate 'line', 10410
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 10411
    unless_null $P2, __label_3
.annotate 'line', 10412
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 10414
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
.annotate 'line', 10415

.end # samehllas


.sub 'fullname' :method
.annotate 'line', 10418
    getattribute $P1, self, 'path'
    join $S1, '.', $P1
.annotate 'line', 10419
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
.annotate 'line', 10420
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 10422
    .return($S1)
  __label_2: # endif
.annotate 'line', 10423

.end # fullname


.sub 'getparrotkey' :method
.annotate 'line', 10426
    getattribute $P1, self, 'path'
.annotate 'line', 10427
    null $S1
.annotate 'line', 10428
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10429
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 10430
    .return($S1)
.annotate 'line', 10431

.end # getparrotkey


.sub 'getparrotrootkey' :method
.annotate 'line', 10434
    getattribute $P1, self, 'path'
.annotate 'line', 10435
    getattribute $P2, self, 'hll'
.annotate 'line', 10436
    set $S1, "[ '"
.annotate 'line', 10437
    if_null $P2, __label_1
.annotate 'line', 10440
    set $S3, $P2
    downcase $S2, $S3
    concat $S1, $S1, $S2
    goto __label_2
  __label_1: # else
.annotate 'line', 10443
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 10444
    concat $S1, $S1, "'"
.annotate 'line', 10445
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 10446
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 10447
    concat $S1, $S1, " ]"
.annotate 'line', 10448
    .return($S1)
.annotate 'line', 10449

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
.annotate 'line', 10452
    getattribute $P1, self, 'path'
.annotate 'line', 10453
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 10454
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10455
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 10456
    __ARG_1.'say'("]")
.annotate 'line', 10457

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10460
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10462
    $P3 = self.'getparrotkey'()
.annotate 'line', 10461
    $P2 = WSubId_26("    new %0, %1", __ARG_3, $P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10465
    $P5 = self.'getparrotrootkey'()
.annotate 'line', 10464
    $P4 = WSubId_26("    root_new %0, %1", __ARG_3, $P5)
    __ARG_1.'print'($P4)
  __label_2: # endif
.annotate 'line', 10466
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 10467
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 10468
    __ARG_1.'say'()
.annotate 'line', 10469

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 10472
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10473
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10475
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
.annotate 'line', 10476

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10479
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 10481
    $P5 = self.'getparrotkey'()
.annotate 'line', 10480
    $P4 = WSubId_26("    get_class %0, %1", __ARG_3, $P5)
    __ARG_1.'say'($P4)
    goto __label_2
  __label_1: # else
.annotate 'line', 10486
    getattribute $P1, self, 'hll'
.annotate 'line', 10487
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 10488
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 10489
    if_null $P1, __label_5
    set $S3, $P1
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 10490
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 10493
    join $S3, "'; '", $P2
.annotate 'line', 10491
    $P3 = WSubId_26("    get_root_global %0, ['%1'; '%2'], '%3'", __ARG_3, $S2, $S3, $S1)
    __ARG_1.'say'($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 10495
    $P4 = WSubId_26("    get_root_global %0, ['%1'], '%2'", __ARG_3, $S2, $S1)
    __ARG_1.'say'($P4)
  __label_7: # endif
.annotate 'line', 10498
    $P3 = WSubId_26("    get_class %0, %0", __ARG_3)
    __ARG_1.'say'($P3)
  __label_2: # endif
.annotate 'line', 10500

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 10503
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10504
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10506
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
.annotate 'line', 10507

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 10383
    addattribute $P0, 'hll'
.annotate 'line', 10384
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_128 = "WSubId_128"
.annotate 'line', 10526
    self.'VarContainer'()
.annotate 'line', 10527
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 10528
    unless_null __ARG_2, __label_1
.annotate 'line', 10529
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 10530
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10531
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 10532
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P2.'FunctionContainer'()
    set $P2, $P2
    setattribute self, 'funcont', $P2
.annotate 'line', 10533
    $P1 = __ARG_1.'fullname'()
    WSubId_128(self, '__NAMESPACE__', $P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 10536
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 10537
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 10538
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10539
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 10540
    getattribute $P2, __ARG_2, 'funcont'
    setattribute self, 'funcont', $P2
  __label_2: # endif
.annotate 'line', 10542
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
.annotate 'line', 10543

.end # NamespaceBase


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10546
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 10547

.end # addfunction


.sub 'fixnamespaces' :method
.annotate 'line', 10550
    null $P1
.annotate 'line', 10551
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10552
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10553
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 10554
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 10555
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
.annotate 'line', 10556

.end # fixnamespaces


.sub 'getpath' :method
.annotate 'line', 10559
    getattribute $P1, self, 'nspath'
    .return($P1)
.annotate 'line', 10560

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 10563
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 10564
    .return()
  __label_1: # endif
.annotate 'line', 10565
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10566
    $P2 = WSubId_124($P1, __ARG_1)
    if_null $P2, __label_2
.annotate 'line', 10567
    .return()
  __label_2: # endif
.annotate 'line', 10568
    push $P1, __ARG_1
.annotate 'line', 10569

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
.annotate 'line', 10572
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 10573
    if_null $P1, __label_1
.annotate 'line', 10574
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 10575
    self.'addfunction'($P1)
  __label_3: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 10578
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 10579
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 10580
    if_null $P2, __label_5
.annotate 'line', 10581
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 10582
    if_null $P1, __label_6
.annotate 'line', 10583
    self.'createvarused'($S1, $P1)
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif
.annotate 'line', 10586

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
.annotate 'line', 10589
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10590
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10591
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 10592
    .return($P2)
.annotate 'line', 10593

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
.annotate 'line', 10596
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10597
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10598
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10599
    .tailcall self.'getusedns'(__ARG_1)
.annotate 'line', 10600

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10604
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 10605
    getattribute $P2, self, 'externals'
.annotate 'line', 10606
    unless_null $P2, __label_1
.annotate 'line', 10607
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10609
    push $P2, $P1
  __label_2: # endif
.annotate 'line', 10610

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
.annotate 'line', 10614
    null $P1
.annotate 'line', 10615
    getattribute $P3, self, 'classes'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10616
    getattribute $P5, $P1, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10617
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10618
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_5
    iter $P6, $P3
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P2, $P6
.annotate 'line', 10619
    $P1 = $P2.'checkclass_base'(__ARG_1)
    if_null $P1, __label_6
.annotate 'line', 10620
    .return($P1)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P3
.annotate 'line', 10621
    .return($P3)
.annotate 'line', 10622

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
.annotate 'line', 10625
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10626
    if_null $P1, __label_1
.annotate 'line', 10627
    .return($P1)
  __label_1: # endif
.annotate 'line', 10628
    getattribute $P2, self, 'funcont'
.annotate 'line', 10629
    .tailcall $P2.'find'(__ARG_1)
.annotate 'line', 10630

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
.annotate 'line', 10635
    elements $I1, __ARG_1
.annotate 'line', 10636
    null $S1
.annotate 'line', 10637
    null $P1
.annotate 'line', 10638
    null $P2
.annotate 'line', 10639
    sub $I2, $I1, __ARG_3
    if $I2 == 0 goto __label_3
    if $I2 == 1 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 10643
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 10644
    if __ARG_2 == 1 goto __label_7
    if __ARG_2 == 2 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 10646
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 10648
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 10651
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 10652
    .return($P1)
  __label_9: # endif
.annotate 'line', 10653
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 10654
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 10655
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 10662
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 10663
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 10664
    isnull $I6, $P2
    not $I6
    unless $I6 goto __label_14
.annotate 'line', 10665
    add $I7, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I7)
    isnull $I6, $P1
    not $I6
  __label_14:
    unless $I6 goto __label_13
.annotate 'line', 10666
    .return($P1)
  __label_13: # endif
.annotate 'line', 10667
    $P2 = self.'getusedns'($S1)
.annotate 'line', 10668
    isnull $I8, $P2
    not $I8
    unless $I8 goto __label_16
.annotate 'line', 10669
    add $I9, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I9)
    isnull $I8, $P1
    not $I8
  __label_16:
    unless $I8 goto __label_15
.annotate 'line', 10670
    .return($P1)
  __label_15: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 10672
    .return($P3)
.annotate 'line', 10673

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10676
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 10677
    getattribute $P2, self, 'namespaces'
    push $P2, $P1
.annotate 'line', 10678
    .return($P1)
.annotate 'line', 10679

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10682
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 10683
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 10684
    getattribute $P3, self, 'namespaces'
    push $P3, $P2
.annotate 'line', 10685
    getattribute $P3, self, 'items'
    push $P3, $P2
.annotate 'line', 10686
    .return($P2)
.annotate 'line', 10687

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
.annotate 'line', 10690
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 10691

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
.annotate 'line', 10694
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 10695
    getattribute $P1, self, 'items'
    push $P1, __ARG_1
.annotate 'line', 10696

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 10699
    $P1 = __ARG_2.'get'()
.annotate 'line', 10700
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10701
    $P1 = __ARG_2.'get'()
.annotate 'line', 10703
    set $P2, self
  __label_4: # for condition
.annotate 'line', 10704
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 10705
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10706
    $P5 = __ARG_2.'get'()
    set $S1, $P5
  __label_2: # for iteration
.annotate 'line', 10704
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10709
    null $P3
.annotate 'line', 10710
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 10711
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10712
    $P1 = __ARG_2.'get'()
  __label_5: # endif
.annotate 'line', 10715
    WSubId_4('{', $P1)
.annotate 'line', 10716
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10717
    $P4.'parse'(__ARG_2)
.annotate 'line', 10718

.end # parsenamespace


.sub 'parseextern' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 10723
    $P1 = __ARG_1.'get'()
.annotate 'line', 10724
    $P3 = $P1.'iskeyword'('function')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 10725
    WSubId_1('Unsupported extern', $P1)
  __label_1: # endif
.annotate 'line', 10726
    $P1 = __ARG_1.'get'()
.annotate 'line', 10727
    WSubId_108($P1)
.annotate 'line', 10728
    WSubId_68(';', __ARG_1)
.annotate 'line', 10729
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P2.'FunctionExtern'($P1, self)
.annotate 'line', 10730
    self.'addfunction'($P2)
.annotate 'line', 10731

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
.annotate 'line', 10734
    getattribute $P1, self, 'items'
.annotate 'line', 10735
    null $P2
.annotate 'line', 10736
    $P2 = __ARG_1.'get'()
  __label_3: # for condition
    $P5 = $P2.'iseof'()
    if $P5 goto __label_4
    $P5 = $P2.'isop'('}')
  __label_4:
    isfalse $I1, $P5
    unless $I1 goto __label_2
.annotate 'line', 10738
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
    goto __label_6
  __label_7: # case
.annotate 'line', 10740
    self.'parsenamespace'($P2, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10743
    $P3 = WSubId_58($P2, __ARG_1, self)
.annotate 'line', 10744
    push $P1, $P3
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10747
    new $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P4.'FunctionStatement'($P2, __ARG_1, self)
.annotate 'line', 10748
    getattribute $P7, $P4, 'name'
    null $S1
    if_null $P7, __label_17
    set $S1, $P7
  __label_17:
.annotate 'line', 10749
    self.'addfunction'($P4)
.annotate 'line', 10750
    push $P1, $P4
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 10753
    WSubId_132($P2, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 10756
    self.'parseextern'(__ARG_1)
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 10759
    WSubId_133($P2, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 10762
    WSubId_134($P2, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 10765
    WSubId_135($P2, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 10768
    $P2 = __ARG_1.'get'()
.annotate 'line', 10769
    $P8 = $P2.'isstring'()
    isfalse $I2, $P8
    unless $I2 goto __label_18
.annotate 'line', 10770
    WSubId_54('string literal', $P2)
  __label_18: # endif
.annotate 'line', 10771
    WSubId_68(';', __ARG_1)
.annotate 'line', 10772
    new $P11, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P11.'StringLiteral'(self, $P2)
    set $P10, $P11
    $P9 = $P10.'getPirString'()
    self.'addload'($P9)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 10775
    $P2 = __ARG_1.'get'()
.annotate 'line', 10776
    $P12 = $P2.'isstring'()
    isfalse $I3, $P12
    unless $I3 goto __label_19
.annotate 'line', 10777
    WSubId_54('string literal', $P2)
  __label_19: # endif
.annotate 'line', 10778
    WSubId_68(';', __ARG_1)
.annotate 'line', 10779
    new $P15, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P15.'StringLiteral'(self, $P2)
    set $P14, $P15
    $P13 = $P14.'getPirString'()
    self.'addlib'($P13)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10782
    WSubId_55("token", $P2)
  __label_5: # switch end
  __label_1: # for iteration
.annotate 'line', 10736
    $P2 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10785
    $P5 = $P2.'iseof'()
    if_null $P5, __label_20
    unless $P5 goto __label_20
.annotate 'line', 10786
    self.'unclosed_ns'()
    goto __label_21
  __label_20: # else
.annotate 'line', 10788
    self.'close_ns'($P2)
  __label_21: # endif
.annotate 'line', 10789

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 10792
    getattribute $P1, self, 'items'
    WSubId_52($P1)
.annotate 'line', 10793

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 10796
    $P1 = self.'getpath'()
.annotate 'line', 10798
    set $I1, 1
.annotate 'line', 10800
    getattribute $P2, self, 'externals'
.annotate 'line', 10801
    if_null $P2, __label_1
.annotate 'line', 10802
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10803
    null $I1
.annotate 'line', 10804
    WSubId_66(__ARG_1, $P2)
  __label_1: # endif
.annotate 'line', 10807
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
.annotate 'line', 10808
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 10809
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 10810
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10812
    unless $I1 goto __label_7
.annotate 'line', 10813
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10814
    null $I1
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10816
    $P3.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10818

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 10514
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 10516
    addattribute $P0, 'nspath'
.annotate 'line', 10517
    addattribute $P0, 'externals'
.annotate 'line', 10518
    addattribute $P0, 'namespaces'
.annotate 'line', 10519
    addattribute $P0, 'classes'
.annotate 'line', 10520
    addattribute $P0, 'funcont'
.annotate 'line', 10521
    addattribute $P0, 'items'
.annotate 'line', 10522
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 10836
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10837
    null $I1
.annotate 'line', 10838
    if_null __ARG_5, __label_1
.annotate 'line', 10839
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 10840
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 10841
    set $I1, 1
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 10844
    unless $I1 goto __label_4
.annotate 'line', 10845
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 10846
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 10847
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10849
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10850
    setattribute self, 'start', __ARG_2
.annotate 'line', 10851
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10852
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 10853

.end # NamespaceStatement


.sub 'dowarnings' :method
.annotate 'line', 10856
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 10857

.end # dowarnings


.sub 'generatesubid' :method
.annotate 'line', 10860
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 10861

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 10864
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 10865

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 10868
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
.annotate 'line', 10869

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 10872
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
.annotate 'line', 10873

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 10876
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10877
    unless_null $P1, __label_1
.annotate 'line', 10878
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10879
    .return($P1)
.annotate 'line', 10880

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 10883
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10884
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10885
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10886
    .return($P1)
.annotate 'line', 10887

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 10890
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
.annotate 'line', 10891

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1

.end # close_ns


.sub 'optimize' :method
.annotate 'line', 10898
    getattribute $P1, self, 'modifier'
.annotate 'line', 10899
    if_null $P1, __label_1
.annotate 'line', 10900
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10901
    self.'optimize_base'()
.annotate 'line', 10902
    .return(self)
.annotate 'line', 10903

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10906
    getattribute $P1, self, 'hll'
.annotate 'line', 10907
    if_null $P1, __label_1
.annotate 'line', 10908
    $P2 = WSubId_26(".HLL '%0'", $P1)
    __ARG_1.'say'($P2)
  __label_1: # endif
.annotate 'line', 10910
    self.'emit_base'(__ARG_1)
.annotate 'line', 10912
    if_null $P1, __label_2
.annotate 'line', 10913
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
.annotate 'line', 10914

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10825
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10827
    addattribute $P0, 'parent'
.annotate 'line', 10828
    addattribute $P0, 'start'
.annotate 'line', 10829
    addattribute $P0, 'name'
.annotate 'line', 10830
    addattribute $P0, 'modifier'
.annotate 'line', 10831
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_loadlib' :subid('WSubId_136')
        .param string __ARG_1
.annotate 'line', 10923
    concat $S1, '.loadlib ', __ARG_1
    .return($S1)
.annotate 'line', 10924

.end # emit_loadlib


.sub 'emit_loadbytecode' :subid('WSubId_137')
        .param string __ARG_1
.annotate 'line', 10928
    concat $S1, '    load_bytecode ', __ARG_1
    .return($S1)
.annotate 'line', 10929

.end # emit_loadbytecode

.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
.annotate 'line', 10941
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10942
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10943
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 10944
    box $P1, 0
    setattribute self, 'subidgen', $P1
.annotate 'line', 10945

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 10948
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 10949
    $P1[__ARG_1] = 1
.annotate 'line', 10950

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 10954
    getattribute $P1, self, 'subidgen'
    inc $P1
    set $I1, $P1
.annotate 'line', 10955
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
.annotate 'line', 10956

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 10960
    getattribute $P1, self, 'libs'
.annotate 'line', 10961
    unless_null $P1, __label_1
.annotate 'line', 10962
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10963
    $P1[__ARG_1] = 1
.annotate 'line', 10964

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 10967
    getattribute $P1, self, 'loads'
.annotate 'line', 10968
    unless_null $P1, __label_1
.annotate 'line', 10969
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10970
    $P1[__ARG_1] = 1
.annotate 'line', 10971

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 10974
    .tailcall self.'checkclass_base'(__ARG_1)
.annotate 'line', 10975

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 10978
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10979

.end # scopesearch


.sub 'unclosed_ns' :method

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 10986
    WSubId_1('Cannot close root namespace', __ARG_1)
.annotate 'line', 10987

.end # close_ns


.sub 'dowarnings' :method
.annotate 'line', 10990
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 10991

.end # dowarnings


.sub 'optimize' :method
.annotate 'line', 10994
    self.'optimize_base'()
.annotate 'line', 10995
    .return(self)
.annotate 'line', 10996

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_136 = "WSubId_136"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_137 = "WSubId_137"
.annotate 'line', 10999
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 11002
    $P4 = $P1['chomp']
    if_null $P4, __label_1
.annotate 'line', 11003
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 11007
    split $P4, " ", "acos asin atan cos exp ln sin tan pow"
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $S1, $P5
.annotate 'line', 11008
    $P6 = $P1[$S1]
    if_null $P6, __label_4
.annotate 'line', 11009
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 11013
    getattribute $P2, self, 'libs'
.annotate 'line', 11014
    if_null $P2, __label_5
.annotate 'line', 11015
    root_new $P6, ['parrot';'ResizablePMCArray']
    $P4 = WSubId_31($P2, $P6, WSubId_136)
    join $S2, "\n", $P4
    __ARG_1.'say'($S2)
  __label_5: # endif
.annotate 'line', 11017
    getattribute $P3, self, 'loads'
.annotate 'line', 11018
    if_null $P3, __label_6
.annotate 'line', 11025
    root_new $P7, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_31($P3, $P7, WSubId_137)
    join $S2, "\n", $P6
.annotate 'line', 11019
    $P4 = WSubId_26(".sub initial_load_bytecode :anon :load :init\n%0\n.end\n", $S2)
    __ARG_1.'say'($P4)
  __label_6: # endif
.annotate 'line', 11027
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_8
    isnull $I1, $P3
    not $I1
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 11028
    __ARG_1.'comment'('end libs')
  __label_7: # endif
.annotate 'line', 11030
    self.'emit_base'(__ARG_1)
.annotate 'line', 11031

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 11034
    getattribute $P1, self, 'locals'
.annotate 'line', 11035
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
.annotate 'line', 11036
    $P2 = $P1[$S1]
.annotate 'line', 11037
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 11038
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 11039
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 11041
    $P3 = $P2.'getvalue'()
.annotate 'line', 11042
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11044

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10931
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10933
    addattribute $P0, 'unit'
.annotate 'line', 10934
    addattribute $P0, 'bultins_used'
.annotate 'line', 10935
    addattribute $P0, 'libs'
.annotate 'line', 10936
    addattribute $P0, 'loads'
.annotate 'line', 10937
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11056
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 11057
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
.annotate 'line', 11058

.end # Builtin


.sub 'getname' :method
.annotate 'line', 11059
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
.annotate 'line', 11062
    getattribute $P1, self, 'variants'
    push $P1, __ARG_1
.annotate 'line', 11063

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 11052
    addattribute $P0, 'name'
.annotate 'line', 11053
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
.annotate 'line', 11073
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
.annotate 'line', 11074

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 11077
    getattribute $P1, self, 'entries'
.annotate 'line', 11078
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 11079
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 11080
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 11082
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
.annotate 'line', 11083

.end # add


.sub 'put' :method
        .param pmc __ARG_1
.annotate 'line', 11086
    getattribute $P1, self, 'entries'
.annotate 'line', 11087
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 11088
    $P3 = $P1[$S1]
    __ARG_1.'addfunction'($P3)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11089

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 11070
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_139 = "WSubId_139"
.annotate 'line', 11099
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 11100
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 11104
    WSubId_138($P1, 'false', 0)
.annotate 'line', 11105
    WSubId_138($P1, 'true', 1)
.annotate 'line', 11110
    WSubId_128($P1, '__STAGE__', "3")
.annotate 'line', 11113
    WSubId_138($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 11116
    WSubId_138($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 11119
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 11121
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 11122
    WSubId_139($P3)
.annotate 'line', 11123
    $P3.'put'($P2)
.annotate 'line', 11125
    $P1.'usenamespace'($P2)
.annotate 'line', 11127
    setattribute self, 'rootns', $P1
.annotate 'line', 11128

.end # WinxedCompileUnit


.sub 'dowarnings' :method
.annotate 'line', 11131
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
.annotate 'line', 11132

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 11135
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 11136
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
.annotate 'line', 11137

.end # parse


.sub 'optimize' :method
.annotate 'line', 11140
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
.annotate 'line', 11141

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 11144
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 11145
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 11146
    __ARG_1.'say'('')
.annotate 'line', 11148
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 11150
    __ARG_1.'comment'('End generated code')
.annotate 'line', 11151

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 11154
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 11155
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 11157
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 11159
    __ARG_1.'comment'('End')
.annotate 'line', 11160

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 11094
    addattribute $P0, 'rootns'
.annotate 'line', 11095
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
.annotate 'line', 11169
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 4
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 11170
    .return($P1)
.annotate 'line', 11171

.end # version


.sub 'version_string' :method
.annotate 'line', 11174
    $P1 = self.'version'()
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
.annotate 'line', 11175

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
        .param int __ARG_6
.annotate 'line', 11178
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 11179
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 11180
    null $P1
.annotate 'line', 11181
    unless_null __ARG_3, __label_2
.annotate 'line', 11182
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11183
    $P1.'open'('__eval__', 'w')
    goto __label_3
  __label_2: # else
.annotate 'line', 11186
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 11187
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1, __ARG_6)
.annotate 'line', 11188
    unless __ARG_4 goto __label_4
.annotate 'line', 11189
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 11190
    unless __ARG_5 goto __label_5
.annotate 'line', 11191
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 11192
    __ARG_1.'emit'($P2)
.annotate 'line', 11193
    $P2.'close'()
.annotate 'line', 11194
    if_null __ARG_3, __label_6
.annotate 'line', 11195
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
.annotate 'line', 11197
    $P1.'close'()
.annotate 'line', 11198
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 11199
    null $P3
.annotate 'line', 11200
    set $S2, __ARG_2
    if $S2 == 'pir' goto __label_11
    if $S2 == 'pbc' goto __label_12
    if $S2 == '' goto __label_13
    goto __label_10
  __label_11: # case
.annotate 'line', 11202
    new $P3, [ 'String' ]
.annotate 'line', 11203
    assign $P3, $S1
    goto __label_9 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 11207
    compreg $P4, 'PIR'
.annotate 'line', 11208
    $P3 = $P4($S1)
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 11211
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
    die $S5
  __label_9: # switch end
.annotate 'line', 11213
    .return($P3)
  __label_7: # endif
.annotate 'line', 11215

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
.annotate 'line', 11218
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11219
    $P1.'open'('__eval__', 'w')
.annotate 'line', 11220
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1, 1)
.annotate 'line', 11221
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 11222
    $P2.'close'()
.annotate 'line', 11223
    $P1.'close'()
.annotate 'line', 11224
    .tailcall $P1.'read'(0)
.annotate 'line', 11225

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 11233
    unless_null __ARG_2, __label_1
.annotate 'line', 11234
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 11235
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11236
    $P1.'open'('__eval__', 'w')
.annotate 'line', 11237
    $P1.'puts'(__ARG_1)
.annotate 'line', 11238
    $P1.'close'()
.annotate 'line', 11239
    $P1.'open'('__eval__', 'r')
.annotate 'line', 11240
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 11241
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 11242
    $P3.'parse'($P2)
.annotate 'line', 11243
    $P1.'close'()
.annotate 'line', 11244
    $P3.'optimize'()
.annotate 'line', 11245
    ne __ARG_2, 'include', __label_2
.annotate 'line', 11246
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 11248
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 11249

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 11258
    unless_null __ARG_2, __label_1
.annotate 'line', 11259
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 11260
    new $P1, [ 'FileHandle' ]
.annotate 'line', 11261
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 11262
    $P1.'encoding'('utf8')
.annotate 'line', 11263
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 11264
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 11265
    $P3.'parse'($P2)
.annotate 'line', 11266
    $P1.'close'()
.annotate 'line', 11267
    $P3.'optimize'()
.annotate 'line', 11268
    ne __ARG_2, 'include', __label_2
.annotate 'line', 11269
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 11271
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 11272

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
.annotate 'line', 11281
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 11282
    compreg 'winxed', $P1
.annotate 'line', 11283

.end # initializer

# End generated code
