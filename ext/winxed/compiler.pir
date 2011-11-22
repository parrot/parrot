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
.annotate 'line', 1588
    $P4 = __ARG_3.'filename'()
    $P5 = __ARG_3.'linenum'()
.annotate 'line', 1580
    $P3 = WSubId_26("    getstderr $P0\n    print $P0, \"Assertion failed at '%0' line \"\n    print $P0, %1\n    print $P0, \"\\n\"\n    exit 1\n", $P4, $P5)
    __ARG_1.'print'($P3)
.annotate 'line', 1589
    __ARG_1.'emitlabel'($S1)
  __label_1: # endif
.annotate 'line', 1591

.end # Builtin_ASSERT


.sub 'Builtin_invoke' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 1597
    $P1 = __ARG_5[0]
.annotate 'line', 1598
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1599
    WSubId_1("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1600
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 1601

.end # Builtin_invoke


.sub 'builtineval_length' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1605
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1606
    $P2 = WSubId_28($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1607
    length $I1, $S1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1608

.end # builtineval_length


.sub 'builtineval_bytelength' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1612
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1613
    $P2 = WSubId_28($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1614
    bytelength $I1, $S1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1615

.end # builtineval_bytelength


.sub 'builtineval_ord' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1619
    elements $I1, __ARG_3
.annotate 'line', 1620
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1621
    $P3 = WSubId_28($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1622
    null $I2
.annotate 'line', 1623
    le $I1, 1, __label_2
.annotate 'line', 1624
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1625
    $P3 = WSubId_29($P2)
    set $I2, $P3
  __label_2: # endif
.annotate 'line', 1627
    ord $I3, $S1, $I2
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I3)
.annotate 'line', 1628

.end # builtineval_ord


.sub 'builtineval_chr' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_29 = "WSubId_29"
.annotate 'line', 1632
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1633
    $P2 = WSubId_29($P1)
    set $I1, $P2
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1634

.end # builtineval_chr


.sub 'builtineval_substr' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 1638
    elements $I1, __ARG_3
.annotate 'line', 1639
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1640
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1641
    $P4 = WSubId_28($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1642
    $P4 = WSubId_29($P2)
    set $I2, $P4
.annotate 'line', 1643
    null $S2
.annotate 'line', 1644
    set $I4, __ARG_3
    le $I4, 2, __label_2
.annotate 'line', 1645
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1646
    $P4 = WSubId_29($P3)
    set $I3, $P4
.annotate 'line', 1647
    substr $S2, $S1, $I2, $I3
    goto __label_3
  __label_2: # else
.annotate 'line', 1650
    substr $S2, $S1, $I2
  __label_3: # endif
.annotate 'line', 1651
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S2)
.annotate 'line', 1652

.end # builtineval_substr


.sub 'builtineval_indexof' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1656
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1657
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1658
    $P3 = WSubId_28($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1659
    $P3 = WSubId_28($P2)
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1660
    index $I1, $S1, $S2
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1661

.end # builtineval_indexof


.sub 'builtineval_indexof_pos' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1665
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1666
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1667
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1668
    $P4 = WSubId_28($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1669
    $P4 = WSubId_28($P2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1670
    $P6 = __ARG_3[2]
    getattribute $P5, $P6, 'arg'
    $P4 = WSubId_29($P5)
    set $I1, $P4
.annotate 'line', 1671
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_25(__ARG_1, __ARG_2, $I2)
.annotate 'line', 1672

.end # builtineval_indexof_pos


.sub 'builtineval_escape' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 1676
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1680
    $P2 = WSubId_28($P1)
    set $S3, $P2
    escape $S2, $S3
    escape $S1, $S2
.annotate 'line', 1679
    .tailcall WSubId_27(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1681

.end # builtineval_escape


.sub 'builtin_sleep' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1685
    $P1 = __ARG_5[0]
.annotate 'line', 1686
    null $S1
.annotate 'line', 1687
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 1688
    if $S2 == 'I' goto __label_4
    if $S2 == 'N' goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 1690
    $P2 = $P1.'emit_getint'(__ARG_1)
    set $S1, $P2
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 1693
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 1696
    $P4 = $P1.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 1697
    set $S1, "0"
    goto __label_7
  __label_6: # else
.annotate 'line', 1699
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 1700
    set $S1, "$N0"
.annotate 'line', 1701
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1702
    __ARG_1.'emitset'($S1, $S3)
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 1705
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1706
    __ARG_1.'emitarg1'('sleep', $S1)
.annotate 'line', 1707

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
.annotate 'line', 1711
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1713
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('I')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('int', WSubId_33, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1711
    __ARG_1.'add'($P1)
.annotate 'line', 1716
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1717
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('N')
    set $P3, $P4
    $P2.'BuiltinFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1716
    __ARG_1.'add'($P1)
.annotate 'line', 1720
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1722
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('S')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('string', WSubId_34, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1720
    __ARG_1.'add'($P1)
.annotate 'line', 1725
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1726
    $P2.'BuiltinFunction'('var', WSubId_35, 'P', '!')
    set $P1, $P2
.annotate 'line', 1725
    __ARG_1.'add'($P1)
.annotate 'line', 1729
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1733
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1737
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1741
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1745
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1746
    $P2.'BuiltinFunction'('sleep', WSubId_36, 'v', '!')
    set $P1, $P2
.annotate 'line', 1745
    __ARG_1.'add'($P1)
.annotate 'line', 1749
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1753
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1757
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1761
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1765
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1772
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1779
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1786
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1794
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1803
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1813
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1817
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1818
    $P2.'BuiltinFunctionEval'('length', WSubId_37, 'length %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1817
    __ARG_1.'add'($P1)
.annotate 'line', 1822
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1823
    $P2.'BuiltinFunctionEval'('bytelength', WSubId_38, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1822
    __ARG_1.'add'($P1)
.annotate 'line', 1827
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1828
    $P2.'BuiltinFunctionEval'('chr', WSubId_39, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
.annotate 'line', 1827
    __ARG_1.'add'($P1)
.annotate 'line', 1836
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1837
    $P2.'BuiltinFunctionEval'('ord', WSubId_40, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1836
    __ARG_1.'add'($P1)
.annotate 'line', 1841
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1842
    $P2.'BuiltinFunctionEval'('ord', WSubId_40, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1841
    __ARG_1.'add'($P1)
.annotate 'line', 1846
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1847
    $P2.'BuiltinFunctionEval'('substr', WSubId_41, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1846
    __ARG_1.'add'($P1)
.annotate 'line', 1851
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1852
    $P2.'BuiltinFunctionEval'('substr', WSubId_41, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
.annotate 'line', 1851
    __ARG_1.'add'($P1)
.annotate 'line', 1856
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1860
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1861
    $P2.'BuiltinFunctionEval'('indexof', WSubId_42, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1860
    __ARG_1.'add'($P1)
.annotate 'line', 1865
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1866
    $P2.'BuiltinFunctionEval'('indexof', WSubId_43, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1865
    __ARG_1.'add'($P1)
.annotate 'line', 1870
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1874
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1875
    $P2.'BuiltinFunctionEval'('escape', WSubId_44, 'escape %0, %1', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1874
    __ARG_1.'add'($P1)
.annotate 'line', 1879
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1887
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1895
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1902
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1909
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1913
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1917
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1921
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1925
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1932
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1939
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1943
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1947
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1951
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1955
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1959
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1963
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1967
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1971
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1975
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1979
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1983
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1987
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1991
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2004
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2008
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2012
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2016
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2020
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2024
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2028
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2032
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2036
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2040
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2044
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2051
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2058
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2062
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2066
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2070
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2074
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2078
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2079
    $P2.'BuiltinFunction'('print', WSubId_45, 'v', '*')
    set $P1, $P2
.annotate 'line', 2078
    __ARG_1.'add'($P1)
.annotate 'line', 2082
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2083
    $P2.'BuiltinFunction'('say', WSubId_46, 'v', '*')
    set $P1, $P2
.annotate 'line', 2082
    __ARG_1.'add'($P1)
.annotate 'line', 2086
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2087
    $P2.'BuiltinFunction'('cry', WSubId_47, 'v', '*')
    set $P1, $P2
.annotate 'line', 2086
    __ARG_1.'add'($P1)
.annotate 'line', 2090
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2091
    $P2.'BuiltinFunction'('__ASSERT__', WSubId_48, 'v', '!')
    set $P1, $P2
.annotate 'line', 2090
    __ARG_1.'add'($P1)
.annotate 'line', 2094
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2095
    $P2.'BuiltinFunction'('invoke', WSubId_49, 'P', '!')
    set $P1, $P2
.annotate 'line', 2094
    __ARG_1.'add'($P1)
.annotate 'line', 2098

.end # getbuiltins


.sub 'optimize_array' :subid('WSubId_52')
        .param pmc __ARG_1
.annotate 'line', 2106
    if_null __ARG_1, __label_2
    elements $I1, __ARG_1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
.annotate 'line', 2107
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 2108
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_3: # for iteration
.annotate 'line', 2107
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 2109

.end # optimize_array


.sub 'emit_array' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2113
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 2114
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2115

.end # emit_array


.sub 'parseDotted' :subid('WSubId_69')
        .param pmc __ARG_1
.annotate 'line', 2119
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2120
    $P2 = __ARG_1.'get'()
.annotate 'line', 2121
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2122
    push $P1, $P2
  __label_3: # while
.annotate 'line', 2123
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2124
    $P2 = __ARG_1.'get'()
.annotate 'line', 2125
    push $P1, $P2
    goto __label_3
  __label_2: # endwhile
  __label_1: # endif
.annotate 'line', 2128
    __ARG_1.'unget'($P2)
.annotate 'line', 2129
    .return($P1)
.annotate 'line', 2130

.end # parseDotted


.sub 'parseList' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 2138
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2139
    null $P2
  __label_1: # do
.annotate 'line', 2141
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 2142
    push $P1, $P3
  __label_3: # continue
.annotate 'line', 2143
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 2144
    unless_null __ARG_4, __label_4
.annotate 'line', 2145
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2147
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 2148
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 2149
    .return($P1)
.annotate 'line', 2150

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.annotate 'line', 2155
    $P1 = __ARG_1.'get'()
.annotate 'line', 2156
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2157
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 2158
    .return($P1)
.annotate 'line', 2159

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_70')
        .param pmc __ARG_1
.annotate 'line', 2163
    new $P1, ['ResizableStringArray']
.annotate 'line', 2164
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 2165
    $P4 = $P2.'getidentifier'()
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2166
    .return($P1)
.annotate 'line', 2167

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2180
    setattribute self, 'start', __ARG_1
.annotate 'line', 2181
    setattribute self, 'owner', __ARG_2
.annotate 'line', 2182

.end # initbase


.sub 'filename' :method
.annotate 'line', 2185
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2186
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2188
    .return("unknown")
  __label_2: # endif
.annotate 'line', 2189

.end # filename


.sub 'linenum' :method
.annotate 'line', 2192
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2193
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2195
    .return(0)
  __label_2: # endif
.annotate 'line', 2196

.end # linenum


.sub 'viewable' :method
.annotate 'line', 2199
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2200
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2202
    .return("")
  __label_2: # endif
.annotate 'line', 2203

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 2206
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 2207

.end # annotate


.sub 'getpath' :method
.annotate 'line', 2210
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()
.annotate 'line', 2211

.end # getpath


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 2214
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 2215

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 2218
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 2219

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 2222
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
.annotate 'line', 2223

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 2226
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
.annotate 'line', 2227

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 2230
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 2231

.end # scopesearch


.sub 'dowarnings' :method
.annotate 'line', 2234
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 2235

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 2175
    addattribute $P0, 'start'
.annotate 'line', 2176
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2252
    setattribute self, 'owner', __ARG_1
.annotate 'line', 2253
    setattribute self, 'e', __ARG_2
.annotate 'line', 2254

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 2258
    getattribute $P1, self, 'e'
.annotate 'line', 2259
    null $S1
.annotate 'line', 2260
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2261
    getattribute $P2, self, 'pnull'
.annotate 'line', 2262
    unless_null $P2, __label_3
.annotate 'line', 2263
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2264
    $P1.'emitnull'($S2)
.annotate 'line', 2265
    box $P2, $S2
    setattribute self, 'pnull', $P2
  __label_3: # endif
.annotate 'line', 2267
    set $S1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 2270
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2271
    .return($S1)
.annotate 'line', 2272

.end # add

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
.annotate 'line', 2247
    addattribute $P0, 'owner'
.annotate 'line', 2248
    addattribute $P0, 'e'
.annotate 'line', 2249
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2287
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_51, __ARG_3)
    setattribute self, 'args', $P2
.annotate 'line', 2288

.end # SimpleArgList


.sub 'numargs' :method
.annotate 'line', 2292
    getattribute $P1, self, 'args'
    elements $I1, $P1
    .return($I1)
.annotate 'line', 2293

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 2296
    getattribute $P1, self, 'args'
.annotate 'line', 2297
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 2298

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2302
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 2303

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 2306
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2307
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2308
    $P5 = $P2.'emit_get'(__ARG_1)
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2309
    .return($P1)
.annotate 'line', 2310

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 2313
    $P1 = self.'getargvalues'(__ARG_1)
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
.annotate 'line', 2314

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2283
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
.annotate 'line', 2326
    getattribute $P1, self, 'name'
    .return($P1)

.end # getname


.sub 'numargs' :method
.annotate 'line', 2329
    getattribute $P1, self, 'args'
.annotate 'line', 2330
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2331
    .return($I1)
.annotate 'line', 2332

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2335
    getattribute $P1, self, 'args'
.annotate 'line', 2336
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2337
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2338
    .tailcall $P1.'getarg'(__ARG_1)
.annotate 'line', 2339

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2342
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2343
    if_null __ARG_2, __label_1
.annotate 'line', 2344
    setattribute self, 'args', __ARG_2
  __label_1: # endif
.annotate 'line', 2345

.end # Modifier


.sub 'optimize' :method
.annotate 'line', 2348
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2349
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2350
    .return(self)
.annotate 'line', 2351

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2323
    addattribute $P0, 'name'
.annotate 'line', 2324
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2356
    $P1 = __ARG_1.'get'()
.annotate 'line', 2357
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2358
    $P1 = __ARG_1.'get'()
.annotate 'line', 2359
    null $P2
.annotate 'line', 2360
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2361
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2363
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2364
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
.annotate 'line', 2365

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_53 = "WSubId_53"
.annotate 'line', 2374
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_53, ']')
    setattribute self, 'list', $P2
.annotate 'line', 2375

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2378
    getattribute $P1, self, 'list'
    WSubId_52($P1)
.annotate 'line', 2379

.end # optimize


.sub 'getlist' :method
.annotate 'line', 2380
    getattribute $P1, self, 'list'
    .return($P1)

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
.annotate 'line', 2383
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 2384
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2385
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2387
    .return($P2)
.annotate 'line', 2388

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2370
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_30')
        .param pmc __ARG_1
.annotate 'line', 2397
    null $S1
.annotate 'line', 2398
    elements $I1, __ARG_1
    unless $I1 goto __label_1
.annotate 'line', 2399
    join $S2, "'; '", __ARG_1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 2400
    .return($S1)
.annotate 'line', 2401

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2405
    $P1 = __ARG_2.'get'()
.annotate 'line', 2407
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2409
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2411
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2408
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2410
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2412
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2414
    __ARG_2.'unget'($P1)
.annotate 'line', 2415
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
.annotate 'line', 2417

.end # parseUsing


.sub 'parseSig' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2421
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2422
    $P2 = __ARG_2.'get'()
.annotate 'line', 2423
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2424
    WSubId_54("'='", $P2)
  __label_1: # endif
.annotate 'line', 2425
    $P3 = WSubId_51(__ARG_2, __ARG_3)
.annotate 'line', 2426
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 2427

.end # parseSig


.sub 'parseClassSpecifier' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 2431
    $P1 = __ARG_1.'get'()
.annotate 'line', 2432
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2433
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 2434
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 2435
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 2436
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2437
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 2438
    WSubId_1('Invalid class', $P1)
.annotate 'line', 2439

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
.annotate 'line', 2443
    $P1 = __ARG_1.'get'()
.annotate 'line', 2444
    null $P2
.annotate 'line', 2445
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2446
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2447
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2448
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2449
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2450
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2451
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 2452
    $P3 = __ARG_1.'get'()
.annotate 'line', 2453
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2454
    WSubId_55("':'", $P1)
  __label_5: # endif
.annotate 'line', 2455
    .tailcall WSubId_56($P1, __ARG_1, __ARG_2)
  __label_4: # endif
.annotate 'line', 2458
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
.annotate 'line', 2460
    .tailcall WSubId_57($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2462
    .tailcall WSubId_58($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2465
    .tailcall WSubId_59($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2468
    $P2 = __ARG_1.'get'()
.annotate 'line', 2469
    __ARG_1.'unget'($P2)
.annotate 'line', 2470
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2471
    .tailcall WSubId_60($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2474
    $P2 = __ARG_1.'get'()
.annotate 'line', 2475
    __ARG_1.'unget'($P2)
.annotate 'line', 2476
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2477
    .tailcall WSubId_61($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2480
    $P2 = __ARG_1.'get'()
.annotate 'line', 2481
    __ARG_1.'unget'($P2)
.annotate 'line', 2482
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2483
    .tailcall WSubId_62($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2486
    $P2 = __ARG_1.'get'()
.annotate 'line', 2487
    __ARG_1.'unget'($P2)
.annotate 'line', 2488
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2489
    .tailcall WSubId_63($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2492
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2494
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2496
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2498
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2500
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2502
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2504
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2506
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2508
    .tailcall WSubId_64($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2510
    .tailcall WSubId_65($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2512
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2514
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2517
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
.annotate 'line', 2518
    $P4 = __ARG_1.'get'()
.annotate 'line', 2519
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2520
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2521
    __ARG_1.'unget'($P4)
  __label_31: # endif
.annotate 'line', 2523
    __ARG_1.'unget'($P1)
.annotate 'line', 2524
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
.annotate 'line', 2525

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2535
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 2536

.end # Statement


.sub 'isempty' :method
.annotate 'line', 2537
    .return(0)

.end # isempty


.sub 'allowtailcall' :method
.annotate 'line', 2540
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
.annotate 'line', 2541

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 2544
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
.annotate 'line', 2545

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 2548
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 2549

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 2552
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
.annotate 'line', 2553

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 2556
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 2557

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2560
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
.annotate 'line', 2561

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2564
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
.annotate 'line', 2565

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2568
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2569

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2572
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2573

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2576
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
.annotate 'line', 2577

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 2580
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2581

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 2584
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
.annotate 'line', 2585

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 2588
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 2589

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 2592
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
.annotate 'line', 2593

.end # usenamespace


.sub 'getouter' :method
.annotate 'line', 2600
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
.annotate 'line', 2601

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.annotate 'line', 2604
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
.annotate 'line', 2605

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.annotate 'line', 2608
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
.annotate 'line', 2609

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2612
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2614
    .return(self)
.annotate 'line', 2615

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2531
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
.annotate 'line', 2620
    .return(1)

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2623
    WSubId_6('Attempt to annotate empty statement')
.annotate 'line', 2624

.end # annotate


.sub 'optimize' :method
.annotate 'line', 2625
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2618
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
.annotate 'line', 2638
    getattribute $P1, self, 'statements'
.annotate 'line', 2639
    elements $I1, $P1
.annotate 'line', 2640
    set $I2, 1
.annotate 'line', 2641
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
.annotate 'line', 2642
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2643
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2644
    null $I2
  __label_4: # endif
.annotate 'line', 2645
    $P1[$I3] = $P2
  __label_1: # for iteration
.annotate 'line', 2641
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2647
    unless $I2 goto __label_7
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
.annotate 'line', 2648

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2634
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2655
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2656
    setattribute self, 'statements', $P1
.annotate 'line', 2657

.end # MultiStatement


.sub 'isempty' :method
.annotate 'line', 2658
    .return(0)

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
.annotate 'line', 2661
    getattribute $P1, self, 'statements'
    push $P1, __ARG_1
.annotate 'line', 2662
    .return(self)
.annotate 'line', 2663

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 2666
    getattribute $P1, self, 'statements'
    WSubId_66(__ARG_1, $P1)
.annotate 'line', 2667

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2651
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2673
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2675
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2674
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2676
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2678
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
.annotate 'line', 2680

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 2688
    null $P1
.annotate 'line', 2689
    $P2 = __ARG_1.'get'()
.annotate 'line', 2690
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2691
    $P2 = __ARG_1.'get'()
.annotate 'line', 2692
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2693
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 2696
    __ARG_1.'unget'($P2)
.annotate 'line', 2697
    $P1 = WSubId_51(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 2699
    .return($P1)
.annotate 'line', 2700

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2709
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2710
    $P1 = __ARG_2.'get'()
.annotate 'line', 2711
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2712
    unless $I1 goto __label_1
.annotate 'line', 2713
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2714
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2715
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2716
    $P1 = __ARG_2.'get'()
.annotate 'line', 2717
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
.annotate 'line', 2718
    __ARG_2.'unget'($P1)
.annotate 'line', 2719
    $P3 = WSubId_50(__ARG_2, __ARG_3, WSubId_67, '}')
    setattribute self, 'args', $P3
  __label_5: # endif
.annotate 'line', 2721
    WSubId_68(';', __ARG_2)
.annotate 'line', 2722

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 2725
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 2726
    .return(self)
.annotate 'line', 2727

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2730
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2731
    self.'annotate'(__ARG_1)
.annotate 'line', 2732
    $P4 = __ARG_1.'getDebug'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 2733
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
  __label_2: # endif
.annotate 'line', 2734
    getattribute $P1, self, 'args'
.annotate 'line', 2735
    __ARG_1.'print'('    ')
.annotate 'line', 2736
    unless_null $P1, __label_3
.annotate 'line', 2737
    __ARG_1.'say'($S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2739
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2740
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
.annotate 'line', 2741
    $P4 = $P3.'emit_get'(__ARG_1)
    push $P2, $P4
    goto __label_5
  __label_6: # endfor
.annotate 'line', 2742
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
  __label_4: # endif
.annotate 'line', 2744

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2702
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2704
    addattribute $P0, 'opname'
.annotate 'line', 2705
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
.annotate 'line', 2756
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2757
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2758
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2759
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2760
    WSubId_68(';', __ARG_2)
.annotate 'line', 2761
    $P3 = WSubId_70($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2762
    .return(self)
.annotate 'line', 2763

.end # ExternStatement


.sub 'optimize' :method
.annotate 'line', 2764
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2767
    self.'annotate'(__ARG_1)
.annotate 'line', 2768
    getattribute $P1, self, 'path'
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
.annotate 'line', 2769

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2751
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2753
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_71 = "WSubId_71"
.annotate 'line', 2781
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2782
    null $P3
    $P1 = WSubId_50(__ARG_2, $P3, WSubId_71, ';')
.annotate 'line', 2783
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2784
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2785
    self.'createvarnamed'($P2, 'P', $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2787
    setattribute self, 'names', $P1
.annotate 'line', 2788

.end # StaticStatement


.sub 'optimize' :method
.annotate 'line', 2791
    .return(self)
.annotate 'line', 2792

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2795
    self.'annotate'(__ARG_1)
.annotate 'line', 2796
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 2797
    $P2 = self.'getvar'($P1)
.annotate 'line', 2798
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2800

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2776
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2778
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
.annotate 'line', 2814
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2815
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2816
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2817
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2818
    WSubId_68(';', __ARG_2)
.annotate 'line', 2819
    setattribute self, 'path', $P1
.annotate 'line', 2820

.end # UsingStatement


.sub 'optimize' :method
.annotate 'line', 2823
    getattribute $P1, self, 'path'
.annotate 'line', 2824
    $P2 = $P1[-1]
.annotate 'line', 2826
    $P3 = self.'scopesearch'($P1, 0)
.annotate 'line', 2828
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2842
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2829
    elements $I2, $P1
    unless $I2 goto __label_5
.annotate 'line', 2830
    clone $P4, $P1
.annotate 'line', 2831
    $P4.'pop'()
.annotate 'line', 2832
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2833
    if_null $P5, __label_6
.annotate 'line', 2834
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2835
    if_null $P3, __label_7
.annotate 'line', 2836
    self.'createvarused'($P2, $P3)
.annotate 'line', 2837
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_7: # endif
  __label_6: # endif
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2843
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2844
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2845
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2846
    self.'usesubid'($S1)
.annotate 'line', 2847
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2849
    self.'createvar'($P2, 'P')
.annotate 'line', 2850
    .return(self)
.annotate 'line', 2851

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2854
    getattribute $P1, self, 'path'
.annotate 'line', 2855
    $S1 = $P1[-1]
.annotate 'line', 2856
    $P2 = self.'getvar'($S1)
.annotate 'line', 2857
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
.annotate 'line', 2858
    self.'annotate'(__ARG_1)
.annotate 'line', 2859
    null $S2
.annotate 'line', 2860
    elements $I1, $P1
    le $I1, 1, __label_2
.annotate 'line', 2861
    $P1.'pop'()
.annotate 'line', 2862
    $P3 = WSubId_30($P1)
    set $S2, $P3
  __label_2: # endif
.annotate 'line', 2864
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
  __label_1: # endif
.annotate 'line', 2866

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2807
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2809
    addattribute $P0, 'path'
.annotate 'line', 2810
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
.annotate 'line', 2876
    $P1 = WSubId_69(__ARG_2)
.annotate 'line', 2877
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2878
    WSubId_54('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2879
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2880
    unless_null $P2, __label_2
.annotate 'line', 2881
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2882
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2883

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2889
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2890
    WSubId_72(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2891
    WSubId_68(';', __ARG_2)
.annotate 'line', 2892

.end # UsingNamespaceStatement


.sub 'optimize' :method
.annotate 'line', 2895
    .return(self)
.annotate 'line', 2896

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2885
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
.annotate 'line', 2911
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2912
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2913
    WSubId_68(';', __ARG_2)
.annotate 'line', 2914

.end # ExprStatement


.sub 'optimize' :method
.annotate 'line', 2917
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2918
    .return(self)
.annotate 'line', 2919

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2922
    getattribute $P1, self, 'expr'
    $P1.'emit_void'(__ARG_1)
.annotate 'line', 2923

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2906
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2908
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
.annotate 'line', 2940
    setattribute self, 'type', __ARG_1
.annotate 'line', 2941
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2942
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2943
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2944

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
.annotate 'line', 2947
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
.annotate 'line', 2948

.end # setlex


.sub 'gettype' :method
.annotate 'line', 2949
    getattribute $P1, self, 'type'
    .return($P1)

.end # gettype


.sub 'getreg' :method
.annotate 'line', 2950
    getattribute $P1, self, 'reg'
    .return($P1)

.end # getreg


.sub 'getscope' :method
.annotate 'line', 2951
    getattribute $P1, self, 'scope'
    .return($P1)

.end # getscope


.sub 'getvalue' :method
.annotate 'line', 2952
    getattribute $P1, self, 'value'
    .return($P1)

.end # getvalue


.sub 'isconst' :method
.annotate 'line', 2953
    .return(0)

.end # isconst


.sub 'getlex' :method
.annotate 'line', 2954
    getattribute $P1, self, 'lexname'
    .return($P1)

.end # getlex


.sub 'getflags' :method
.annotate 'line', 2955
    getattribute $P1, self, 'flags'
    .return($P1)

.end # getflags


.sub 'issubid' :method
.annotate 'line', 2958
    getattribute $P1, self, 'reg'
.annotate 'line', 2959
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_1
    set $S2, $P1
    substr $S1, $S2, 0, 7
    iseq $I1, $S1, 'WSubId_'
  __label_1:
    .return($I1)
.annotate 'line', 2960

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2932
    addattribute $P0, 'type'
.annotate 'line', 2933
    addattribute $P0, 'reg'
.annotate 'line', 2934
    addattribute $P0, 'scope'
.annotate 'line', 2935
    addattribute $P0, 'flags'
.annotate 'line', 2936
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
.annotate 'line', 2968
    setattribute self, 'name', __ARG_1
.annotate 'line', 2969

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2972
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
.annotate 'line', 2973

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2965
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 2982
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
.annotate 'line', 2983

.end # VarData_const


.sub 'isconst' :method
.annotate 'line', 2984
    .return(1)

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 2987
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2988
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2989
    setattribute self, 'value', __ARG_1
.annotate 'line', 2990

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2976
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2978
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'VarContainer' :method
.annotate 'line', 3001
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
.annotate 'line', 3002

.end # VarContainer


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3005
    getattribute $P1, self, 'locals'
.annotate 'line', 3006
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3007
    $P2 = $P1[$S1]
.annotate 'line', 3008
    if_null $P2, __label_2
.annotate 'line', 3009
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 3010
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 3011
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 3012
    $P1[$S1] = $P3
.annotate 'line', 3013
    .return($P3)
.annotate 'line', 3014

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3017
    getattribute $P1, self, 'locals'
.annotate 'line', 3018
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3019
    $P2 = $P1[$S1]
.annotate 'line', 3020
    if_null $P2, __label_2
.annotate 'line', 3021
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3022
    $P1[$S1] = __ARG_2
.annotate 'line', 3023

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3026
    getattribute $P1, self, 'locals'
.annotate 'line', 3027
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3028
    $P2 = $P1[$S1]
.annotate 'line', 3029
    if_null $P2, __label_2
.annotate 'line', 3030
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3031
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
.annotate 'line', 3032

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3035
    getattribute $P1, self, 'locals'
.annotate 'line', 3036
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3037
    $P2 = $P1[$S1]
.annotate 'line', 3038
    if_null $P2, __label_2
.annotate 'line', 3039
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3040
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 3041
    $P1[$S1] = $P3
.annotate 'line', 3042
    .return($P3)
.annotate 'line', 3043

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
.annotate 'line', 3046
    getattribute $P1, self, 'locals'
.annotate 'line', 3047
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
.annotate 'line', 3048

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
.annotate 'line', 3051
    null $P1
.annotate 'line', 3052
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 3053
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 3054
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 3056
    .return($P3)
.annotate 'line', 3057

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3060
    null $P1
.annotate 'line', 3061
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 3062
    .return($P1)
  __label_1: # endif
.annotate 'line', 3063
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 3064
    .return($P1)
  __label_2: # endif
.annotate 'line', 3065
    getattribute $P2, self, 'owner'
.annotate 'line', 3066
    if_null $P2, __label_3
.annotate 'line', 3067
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 3068
    .return($P3)
.annotate 'line', 3069

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
.annotate 'line', 3072
    $P1 = self.'getouter'()
.annotate 'line', 3073
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3074
    .return($S1)
.annotate 'line', 3075

.end # makelexical


.sub 'makelexicalself' :method
.annotate 'line', 3078
    set $P1, self
.annotate 'line', 3080
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 3081
    .return('__WLEX_self')
.annotate 'line', 3082

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2996
    addattribute $P0, 'locals'
.annotate 'line', 2997
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]

.sub 'BlockStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3095
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 3096
    self.'VarContainer'()
.annotate 'line', 3097

.end # BlockStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 3091
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3108
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 3109

.end # Expr


.sub 'issimple' :method
.annotate 'line', 3110
    .return(0)

.end # issimple


.sub 'isliteral' :method
.annotate 'line', 3111
    .return(0)

.end # isliteral


.sub 'isintegerliteral' :method
.annotate 'line', 3112
    .return(0)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3113
    .return(0)

.end # isintegerzero


.sub 'isfloatliteral' :method
.annotate 'line', 3114
    .return(0)

.end # isfloatliteral


.sub 'isstringliteral' :method
.annotate 'line', 3115
    .return(0)

.end # isstringliteral


.sub 'isidentifier' :method
.annotate 'line', 3116
    .return(0)

.end # isidentifier


.sub 'isnull' :method
.annotate 'line', 3117
    .return(0)

.end # isnull


.sub 'hascompilevalue' :method
.annotate 'line', 3118
    .return(0)

.end # hascompilevalue


.sub 'isnegable' :method
.annotate 'line', 3119
    .return(0)

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
.annotate 'line', 3122
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 3123

.end # tempreg


.sub 'genlabel' :method
.annotate 'line', 3126
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 3127

.end # genlabel


.sub 'optimize' :method
.annotate 'line', 3131
    .return(self)
.annotate 'line', 3132

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 3133
    .return(0)

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3136
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3137
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3138
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3139
    .return($S2)
.annotate 'line', 3140

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3143
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3144
    null $S2
.annotate 'line', 3145
    if $S1 == 'I' goto __label_4
    if $S1 == 'N' goto __label_5
    if $S1 == 'S' goto __label_6
    if $S1 == 'P' goto __label_7
    goto __label_3
  __label_4: # case
.annotate 'line', 3146
    set $S2, "$I0"
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3147
    set $S2, "$N0"
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 3148
    set $S2, "$S0"
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 3149
    set $S2, "$P0"
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3151
    concat $S4, "Unexcpected emit_void with type '", $S1
    concat $S4, $S4, "'"
    getattribute $P1, self, 'start'
    WSubId_6($S4, $P1)
  __label_2: # switch end
.annotate 'line', 3153
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3154

.end # emit_void


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3157
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3158
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 3159
    .tailcall self.'emit_get'(__ARG_1)
.annotate 'line', 3160

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 3163
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3164
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
.annotate 'line', 3165
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3166
    self.'annotate'(__ARG_1)
.annotate 'line', 3167
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 3168
    set $S1, $S2
  __label_2: # endif
.annotate 'line', 3170
    .return($S1)
.annotate 'line', 3171

.end # emit_getint


.sub 'emit_getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3174
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3175
    $P1 = self.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3176
    eq $S1, 'P', __label_3
.annotate 'line', 3177
    set $S3, $S2
.annotate 'line', 3178
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 3179
    __ARG_1.'emitbox'($S2, $S3)
  __label_3: # endif
.annotate 'line', 3181
    .return($S2)
.annotate 'line', 3182

.end # emit_getvar


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.annotate 'line', 3185
    WSubId_73(self)
.annotate 'line', 3186

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 3104
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
.annotate 'line', 3191
    .return(1)

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 3189
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 3201
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3202
    $P1 = __ARG_1.'get'()
.annotate 'line', 3203
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3204
    WSubId_54('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3205
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
.annotate 'line', 3206

.end # FunctionExpr


.sub 'checkresult' :method
.annotate 'line', 3207
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 3210
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3211
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3212
    .return(self)
.annotate 'line', 3213

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3216
    self.'annotate'(__ARG_1)
.annotate 'line', 3217
    getattribute $P1, self, 'fn'
.annotate 'line', 3218
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3219
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3220
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3222
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 3223

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3196
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3198
    addattribute $P0, 'fn'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
.annotate 'line', 3241
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3242
    .return(self)
.annotate 'line', 3243

.end # set


.sub 'optimize_condition' :method
.annotate 'line', 3246
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3247

.end # optimize_condition


.sub 'optimize' :method
.annotate 'line', 3250
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3251
    .return(self)
.annotate 'line', 3252

.end # optimize


.sub 'getvalue' :method
.annotate 'line', 3255
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3256
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3257
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
.annotate 'line', 3258
    .return(0)
.annotate 'line', 3259

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3262
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3264
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3265
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3266
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3268
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3269
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if $S2 == 'S' goto __label_7
    if $S2 == 'P' goto __label_8
    if $S2 == 'I' goto __label_9
    if $S2 == 'N' goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 3272
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3275
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3278
    WSubId_6('Invalid if condition')
  __label_5: # switch end
  __label_2: # endif
.annotate 'line', 3281

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3284
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3286
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3287
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3288
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3290
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3291
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if $S2 == 'S' goto __label_7
    if $S2 == 'P' goto __label_8
    if $S2 == 'I' goto __label_9
    if $S2 == 'N' goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 3294
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3297
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3300
    WSubId_6('Invalid if condition')
  __label_5: # switch end
  __label_2: # endif
.annotate 'line', 3303

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3238
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
.annotate 'line', 3310
    .return(1)

.end # isliteral


.sub 'hascompilevalue' :method
.annotate 'line', 3311
    .return(1)

.end # hascompilevalue


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3308
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3322
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3323
    setattribute self, 'strval', __ARG_2
.annotate 'line', 3324

.end # StringLiteral


.sub 'isstringliteral' :method
.annotate 'line', 3325
    .return(1)

.end # isstringliteral


.sub 'checkresult' :method
.annotate 'line', 3326
    .return('S')

.end # checkresult


.sub 'getPirString' :method
.annotate 'line', 3329
    getattribute $P1, self, 'strval'
.annotate 'line', 3330
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3331
    .return($S1)
.annotate 'line', 3332

.end # getPirString


.sub 'get_value' :method
.annotate 'line', 3335
    getattribute $P1, self, 'strval'
.annotate 'line', 3336
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3337
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3338
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3339
    .return($S1)
.annotate 'line', 3340

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3343
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
.annotate 'line', 3344

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3347
    .tailcall self.'getPirString'()
.annotate 'line', 3348

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3317
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3319
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3359
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3360
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3361
    set $I1, __ARG_3
.annotate 'line', 3362
    box $P1, $I1
    setattribute self, 'numval', $P1
.annotate 'line', 3363

.end # IntegerLiteral


.sub 'isintegerliteral' :method
.annotate 'line', 3364
    .return(1)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3367
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
.annotate 'line', 3368

.end # isintegerzero


.sub 'checkresult' :method
.annotate 'line', 3369
    .return('I')

.end # checkresult


.sub 'getIntegerValue' :method
.annotate 'line', 3372
    getattribute $P1, self, 'numval'
    .return($P1)
.annotate 'line', 3373

.end # getIntegerValue


.sub 'getFloatValue' :method
.annotate 'line', 3376
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3377
    .return($N1)
.annotate 'line', 3378

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3381
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3382
    if $I1 goto __label_1
.annotate 'line', 3383
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3385
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_2: # endif
.annotate 'line', 3386

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3389
    .tailcall self.'getIntegerValue'()
.annotate 'line', 3390

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3353
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3355
    addattribute $P0, 'pos'
.annotate 'line', 3356
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3400
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3401
    setattribute self, 'numval', __ARG_2
.annotate 'line', 3402

.end # FloatLiteral


.sub 'isfloatliteral' :method
.annotate 'line', 3403
    .return(1)

.end # isfloatliteral


.sub 'checkresult' :method
.annotate 'line', 3404
    .return('N')

.end # checkresult


.sub 'getFloatValue' :method
.annotate 'line', 3407
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3408
    .return($N1)
.annotate 'line', 3409

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3412
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3413
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3414

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_74 = "WSubId_74"
.annotate 'line', 3417
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3418
    .tailcall WSubId_74($N1)
.annotate 'line', 3419

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3395
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3397
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'concat_literal' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3429
    getattribute $P1, __ARG_1, 'strval'
.annotate 'line', 3430
    getattribute $P2, __ARG_2, 'strval'
.annotate 'line', 3433
    $P4 = $P1.'issinglequoted'()
    unless $P4 goto __label_3
    $P4 = $P2.'issinglequoted'()
  __label_3:
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 3435
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P6, $P1, 'file'
    getattribute $P7, $P1, 'line'
.annotate 'line', 3436
    getattribute $P8, $P1, 'str'
    set $S1, $P8
    getattribute $P9, $P2, 'str'
    set $S2, $P9
    concat $S3, $S1, $S2
    $P5.'TokenSingleQuoted'($P6, $P7, $S3)
    set $P3, $P5
    goto __label_1
  __label_2:
.annotate 'line', 3438
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P1, 'file'
    getattribute $P13, $P1, 'line'
.annotate 'line', 3439
    $P14 = $P1.'getasquoted'()
    set $S4, $P14
    $P15 = $P2.'getasquoted'()
    set $S5, $P15
    concat $S6, $S4, $S5
    $P11.'TokenQuoted'($P12, $P13, $S6)
    set $P10, $P11
    set $P3, $P10
  __label_1:
.annotate 'line', 3440
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 3441

.end # concat_literal

.namespace [ 'Winxed'; 'Compiler'; 'FunctionRef' ]

.sub 'FunctionRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3450
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3451
    setattribute self, 'sym', __ARG_3
.annotate 'line', 3452

.end # FunctionRef


.sub 'checkresult' :method
.annotate 'line', 3453
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3456
    getattribute $P1, self, 'sym'
.annotate 'line', 3457
    getattribute $P3, $P1, 'owner'
    $P2 = $P3.'getpath'()
.annotate 'line', 3458
    self.'annotate'(__ARG_1)
.annotate 'line', 3459
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'name'
    $P2.'emit_get_global'(__ARG_1, $P3, __ARG_2, $P4)
.annotate 'line', 3460

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
.annotate 'line', 3445
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3447
    addattribute $P0, 'sym'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
.annotate 'line', 3467
    .return(1)

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3470
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3471
    setattribute self, 'name', __ARG_2
.annotate 'line', 3472

.end # IdentifierExpr


.sub 'isnull' :method
.annotate 'line', 3475
    getattribute $P1, self, 'name'
.annotate 'line', 3476
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3477
    .return(0)
  __label_1: # endif
.annotate 'line', 3478
    .tailcall $P1.'iskeyword'('null')
.annotate 'line', 3479

.end # isnull


.sub 'checkresult' :method
.annotate 'line', 3482
    getattribute $P1, self, 'name'
.annotate 'line', 3483
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3484
    if_null $P2, __label_1
.annotate 'line', 3485
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
.annotate 'line', 3487
    set $S1, $P1
    if $S1 == 'self' goto __label_5
    if $S1 == 'null' goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3490
    .return('P')
  __label_4: # default
.annotate 'line', 3492
    .return('')
  __label_3: # switch end
  __label_2: # endif
.annotate 'line', 3495

.end # checkresult


.sub 'getName' :method
.annotate 'line', 3498
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3499
    .return($S1)
.annotate 'line', 3500

.end # getName


.sub 'checkVar' :method
.annotate 'line', 3503
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
.annotate 'line', 3504

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3507
    getattribute $P1, self, 'name'
.annotate 'line', 3508
    unless_null $P1, __label_1
.annotate 'line', 3509
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3510
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3511
    null $S1
.annotate 'line', 3512
    unless_null $P2, __label_2
.annotate 'line', 3513
    set $S2, $P1
    if $S2 == 'self' goto __label_6
    if $S2 == 'null' goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3516
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3518
    set $S1, ''
  __label_4: # switch end
    goto __label_3
  __label_2: # else
.annotate 'line', 3522
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3523
    .return($S1)
.annotate 'line', 3524

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_75 = "WSubId_75"
.annotate 'line', 3527
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3528
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3529
    getattribute $P2, self, 'name'
    WSubId_75($P2)
  __label_1: # endif
.annotate 'line', 3530
    .return($P1)
.annotate 'line', 3531

.end # getIdentifier


.sub 'optimize' :method
.annotate 'line', 3534
    getattribute $P1, self, 'name'
.annotate 'line', 3535
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3536
    if_null $P2, __label_1
.annotate 'line', 3537
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3538
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3539
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3540
    band $I2, $I1, 1
    unless $I2 goto __label_4
.annotate 'line', 3541
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3542
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
    goto __label_5
  __label_4: # else
.annotate 'line', 3549
    $P3 = $P2.'getreg'()
.annotate 'line', 3550
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3551
    set $S4, $P3
    box $P5, $S4
    setattribute self, 'subid', $P5
  __label_7: # endif
  __label_5: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 3555
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3557
    isnull $I2, $P4
    if $I2 goto __label_11
.annotate 'line', 3559
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I2 goto __label_12
.annotate 'line', 3569
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I2 goto __label_13
    goto __label_10
  __label_11: # case
    goto __label_9 # break
  __label_12: # case
.annotate 'line', 3560
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_14
.annotate 'line', 3561
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_16
    set $S1, $P6
  __label_16:
.annotate 'line', 3562
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3563
    self.'usesubid'($S1)
.annotate 'line', 3564
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
    goto __label_15
  __label_14: # else
.annotate 'line', 3567
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionRef'($P7, $P8, $P4)
    set $P5, $P6
    .return($P5)
  __label_15: # endif
    goto __label_9 # break
  __label_13: # case
.annotate 'line', 3570
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    $P10.'FunctionRef'($P11, $P12, $P4)
    set $P9, $P10
    .return($P9)
  __label_10: # default
  __label_9: # switch end
  __label_2: # endif
.annotate 'line', 3573
    .return(self)
.annotate 'line', 3574

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
.annotate 'line', 3577
    null $S1
.annotate 'line', 3578
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3579
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 3581
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3582
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3583
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_3:
.annotate 'line', 3584
    band $I2, $I1, 1
    unless $I2 goto __label_5
.annotate 'line', 3585
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3586
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3587
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3588
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif
.annotate 'line', 3592
    .return($S1)
.annotate 'line', 3593

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3596
    self.'annotate'(__ARG_1)
.annotate 'line', 3597
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3598
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3599

.end # emit


.sub 'emit_void' :method

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3603
    self.'annotate'(__ARG_1)
.annotate 'line', 3604
    .tailcall self.'emit_getid'(__ARG_1)
.annotate 'line', 3605

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3608
    self.'annotate'(__ARG_1)
.annotate 'line', 3609
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3610
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3611
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3612
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3613
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
.annotate 'line', 3614
    if $S1 == 'S' goto __label_8
    if $S1 == 'P' goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3617
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3620
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
    goto __label_5
  __label_4: # else
.annotate 'line', 3623
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3624
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 3626
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3627
    ne $S3, 'v', __label_13
.annotate 'line', 3628
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3629
    ne $S1, $S3, __label_14
.annotate 'line', 3630
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 3633
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3634
    self.'annotate'(__ARG_1)
.annotate 'line', 3635
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3636
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3638
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
  __label_15: # endif
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3641
    .return($S2)
.annotate 'line', 3642

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3463
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3465
    addattribute $P0, 'name'
.annotate 'line', 3466
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3652
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3653
    setattribute self, 'desc', __ARG_2
.annotate 'line', 3654

.end # LexicalVolatileExpr


.sub 'checkresult' :method
.annotate 'line', 3657
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
.annotate 'line', 3658

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3661
    getattribute $P1, self, 'desc'
.annotate 'line', 3662
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3663
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3664
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3665
    .return($S2)
.annotate 'line', 3666

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3669
    self.'annotate'(__ARG_1)
.annotate 'line', 3670
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3671
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3672

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3675
    getattribute $P1, self, 'owner'
.annotate 'line', 3676
    getattribute $P2, self, 'desc'
.annotate 'line', 3677
    $P3 = $P2.'gettype'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3678
    null $S2
.annotate 'line', 3680
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3684
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3681
    $P3 = $P1.'tempreg'($S1)
    set $S2, $P3
.annotate 'line', 3682
    __ARG_1.'emitnull'($S2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3685
    $P4 = $P1.'tempreg'($S1)
    set $S2, $P4
.annotate 'line', 3686
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3689
    ne $S1, 'P', __label_6
.annotate 'line', 3690
    $P5 = __ARG_2.'emit_getvar'(__ARG_1)
    set $S2, $P5
    goto __label_7
  __label_6: # else
.annotate 'line', 3691
    $P6 = __ARG_2.'checkresult'()
    set $S3, $P6
    ne $S1, $S3, __label_8
.annotate 'line', 3692
    $P7 = __ARG_2.'emit_get'(__ARG_1)
    set $S2, $P7
    goto __label_9
  __label_8: # else
.annotate 'line', 3694
    $P8 = $P1.'tempreg'($S1)
    set $S2, $P8
.annotate 'line', 3695
    __ARG_2.'emit'(__ARG_1, $S2)
  __label_9: # endif
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 3699
    $P3 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P3, $S2)
.annotate 'line', 3700
    .return($S2)
.annotate 'line', 3701

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3704
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
.annotate 'line', 3705

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3647
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3649
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3714
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3715

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3710
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
.annotate 'line', 3725
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3726
    $P2 = WSubId_69(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3727
    getattribute $P1, self, 'key'
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3728
    WSubId_54('namespace identifier', __ARG_3)
  __label_1: # endif
.annotate 'line', 3729

.end # OpNamespaceExpr


.sub 'checkresult' :method
.annotate 'line', 3730
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3733
    getattribute $P1, self, 'owner'
.annotate 'line', 3734
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3735
    unless_null $P2, __label_1
.annotate 'line', 3736
    getattribute $P4, self, 'start'
    WSubId_1('unknown namespace', $P4)
  __label_1: # endif
.annotate 'line', 3737
    $P3 = $P2.'getpath'()
.annotate 'line', 3738
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3739

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3720
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3722
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_76 = "WSubId_76"
.annotate 'line', 3750
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3751
    $P2 = WSubId_76(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
.annotate 'line', 3752

.end # OpClassExpr


.sub 'checkresult' :method
.annotate 'line', 3753
    .return('P')

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 3756
    getattribute $P1, self, 'owner'
.annotate 'line', 3757
    getattribute $P2, self, 'clspec'
.annotate 'line', 3758
    null $P3
.annotate 'line', 3761
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
.annotate 'line', 3764
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    if $I1 goto __label_4
.annotate 'line', 3767
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 3762
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3763
    if_null $P3, __label_7
    getattribute $P4, $P3, 'path'
    goto __label_6
  __label_7:
    null $P4
  __label_6:
    .return($P4)
  __label_4: # case
.annotate 'line', 3765
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3766
    if_null $P3, __label_9
    getattribute $P5, $P3, 'path'
    goto __label_8
  __label_9:
    null $P5
  __label_8:
    .return($P5)
  __label_5: # case
.annotate 'line', 3768
    typeof $P6, $P2
    set $S1, $P6
    concat $S2, $S1, " not supported yet here"
.annotate 'line', 3769
    getattribute $P7, $P2, 'start'
.annotate 'line', 3768
    WSubId_1($S2, $P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3771
    getattribute $P4, $P2, 'start'
    WSubId_6("Unexpected class key", $P4)
.annotate 'line', 3772

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3775
    getattribute $P1, self, 'owner'
.annotate 'line', 3776
    getattribute $P2, self, 'clspec'
.annotate 'line', 3779
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 3780
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3781
    if_null $P3, __label_4
.annotate 'line', 3782
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3783
    .return()
  __label_4: # endif
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3788
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3789
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3790
    __ARG_1.'say'()
.annotate 'line', 3791

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3744
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3746
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3801
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3802
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3803

.end # OpUnaryExpr


.sub 'optimizearg' :method
.annotate 'line', 3806
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
.annotate 'line', 3807

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 3810
    self.'optimizearg'()
.annotate 'line', 3811
    .return(self)
.annotate 'line', 3812

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3796
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3798
    addattribute $P0, 'subexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3823
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3824
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3825
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3826

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3829
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3830
    .return(self)
.annotate 'line', 3831

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
.annotate 'line', 3834
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 3835

.end # setfrom


.sub 'optimizearg' :method
.annotate 'line', 3838
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3839
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3840

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 3843
    self.'optimizearg'()
.annotate 'line', 3844
    .return(self)
.annotate 'line', 3845

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
.annotate 'line', 3848
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 3849

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
.annotate 'line', 3852
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 3853

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3817
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3819
    addattribute $P0, 'lexpr'
.annotate 'line', 3820
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3862
    .return('I')
.annotate 'line', 3863

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3866
    self.'optimizearg'()
.annotate 'line', 3867
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3868
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3869
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3870
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 3871
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3872
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_25($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 3874
    .return(self)
.annotate 'line', 3875

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3858
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
.annotate 'line', 3884
    .return('I')
.annotate 'line', 3885

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3880
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3893
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3894

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3897
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3898
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3899
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3900
    self.'annotate'(__ARG_1)
.annotate 'line', 3901
    __ARG_1.'print'('    delete ')
.annotate 'line', 3902
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3903
    __ARG_1.'say'()
.annotate 'line', 3904
    __ARG_1.'emitset'(__ARG_2, '1')
    goto __label_2
  __label_1: # else
.annotate 'line', 3907
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
.annotate 'line', 3908

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3889
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3915
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3916

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 3919
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3920
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3921
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3922
    self.'annotate'(__ARG_1)
.annotate 'line', 3923
    __ARG_1.'print'('    exists ', __ARG_2, ', ')
.annotate 'line', 3924
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3925
    __ARG_1.'say'()
    goto __label_2
  __label_1: # else
.annotate 'line', 3928
    WSubId_1("exists with invalid operator", self)
  __label_2: # endif
.annotate 'line', 3929

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3911
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3938
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3939

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
.annotate 'line', 3942
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 3943

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3946
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3947
    .return(self)
.annotate 'line', 3948

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 3951
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3952
    self.'optimizearg'()
.annotate 'line', 3953
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3954
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3955
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 3958
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3959
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3960
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_77($P2, $P3, $N2)
  __label_2: # endif
.annotate 'line', 3963
    .return(self)
.annotate 'line', 3964

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3967
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3968
    self.'annotate'(__ARG_1)
.annotate 'line', 3969
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
.annotate 'line', 3970

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3934
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3979
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3980

.end # OpNotExpr


.sub 'isnegable' :method
.annotate 'line', 3981
    .return(1)

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 3984
    .return('I')
.annotate 'line', 3985

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3988
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3989
    .return(self)
.annotate 'line', 3990

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3993
    self.'optimizearg'()
.annotate 'line', 3994
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3995
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3996
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3997
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 3999
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4000
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4001
    .return(self)
.annotate 'line', 4002

.end # optimize


.sub 'negated' :method
.annotate 'line', 4005
    getattribute $P1, self, 'subexpr'
    .return($P1)
.annotate 'line', 4006

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4009
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4010
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4011
    self.'annotate'(__ARG_1)
.annotate 'line', 4012
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if $S2 == 'I' goto __label_4
    if $S2 == 'P' goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 4014
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 4017
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 4020
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
.annotate 'line', 4022

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3975
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]

.sub 'OpBinNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4031
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4032

.end # OpBinNotExpr


.sub 'checkresult' :method
.annotate 'line', 4035
    .return('I')
.annotate 'line', 4036

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4039
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4040
    .return(self)
.annotate 'line', 4041

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4044
    self.'optimizearg'()
.annotate 'line', 4045
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4046
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4047
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4048
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_25($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4050
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4051
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4052
    .return(self)
.annotate 'line', 4053

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4056
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4057
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4058
    self.'annotate'(__ARG_1)
.annotate 'line', 4059
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
.annotate 'line', 4060

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 4027
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
.annotate 'line', 4069
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4070

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4073
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4074
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 4075
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 4076

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 4065
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4085
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4086
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4087

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4090
    self.'emit_get'(__ARG_1)
.annotate 'line', 4091

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 4081
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4098
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4099

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4102
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4103
    self.'annotate'(__ARG_1)
.annotate 'line', 4104
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4105
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4106
    .return($S1)
.annotate 'line', 4107

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 4094
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4114
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4115

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4118
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4119
    self.'annotate'(__ARG_1)
.annotate 'line', 4120
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4121
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4122
    .return($S1)
.annotate 'line', 4123

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 4110
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4132
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4133

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4136
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4137
    self.'annotate'(__ARG_1)
.annotate 'line', 4138
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4139
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4140
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4141
    .return($S1)
.annotate 'line', 4142

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4145
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4146
    self.'annotate'(__ARG_1)
.annotate 'line', 4147
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4148
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4149

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 4128
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4156
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4157

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4160
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4161
    self.'annotate'(__ARG_1)
.annotate 'line', 4162
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4163
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4164
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4165
    .return($S1)
.annotate 'line', 4166

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4169
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4170
    self.'annotate'(__ARG_1)
.annotate 'line', 4171
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4172
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4173

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 4152
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4184
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4185
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4186
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 4187
    .return(self)
.annotate 'line', 4188

.end # set


.sub 'checkresult' :method
.annotate 'line', 4191
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4192

.end # checkresult


.sub 'optimize_base' :method
.annotate 'line', 4195
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 4196
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 4197
    .return(self)
.annotate 'line', 4198

.end # optimize_base


.sub 'optimize' :method
.annotate 'line', 4201
    .tailcall self.'optimize_base'()
.annotate 'line', 4202

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_73 = "WSubId_73"
.annotate 'line', 4205
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4206
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
    $P2 = $P1.'isliteral'()
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4207
    WSubId_73($P1)
  __label_1: # endif
.annotate 'line', 4208

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4211
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4212
    self.'annotate'(__ARG_1)
.annotate 'line', 4213
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4214

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 4178
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4180
    addattribute $P0, 'lexpr'
.annotate 'line', 4181
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4223
    self.'annotate'(__ARG_1)
.annotate 'line', 4224
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4225
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4226

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4229
    self.'annotate'(__ARG_1)
.annotate 'line', 4230
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4231
    getattribute $P2, self, 'rexpr'
    $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4232

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 4219
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4241
    self.'annotate'(__ARG_1)
.annotate 'line', 4242
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4243
    __ARG_1.'emitassign'(__ARG_2, $S1)
.annotate 'line', 4244

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 4247
    self.'checkleft'()
.annotate 'line', 4248
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4249
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 4250
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 4251
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 4252
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 4253
    self.'annotate'(__ARG_1)
.annotate 'line', 4254
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 4255
    .return($S1)
.annotate 'line', 4256

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4259
    self.'annotate'(__ARG_1)
.annotate 'line', 4260
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4261

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 4237
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4270
    self.'checkleft'()
.annotate 'line', 4271
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4272
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4273
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4274
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4275
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4276
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 4277
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
.annotate 'line', 4279
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 4280
    null $S5
.annotate 'line', 4281
    self.'annotate'(__ARG_1)
.annotate 'line', 4282
    if $S1 == 'S' goto __label_10
    if $S1 == 'I' goto __label_11
    if $S1 == 'N' goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 4284
    eq $S2, 'S', __label_13
.annotate 'line', 4285
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4286
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4287
    set $S4, $S5
  __label_13: # endif
.annotate 'line', 4289
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 4293
    eq $S1, $S2, __label_14
.annotate 'line', 4294
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4295
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4296
    set $S4, $S5
  __label_14: # endif
.annotate 'line', 4298
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4301
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
  __label_5: # endif
.annotate 'line', 4304
    .return($S3)
.annotate 'line', 4305

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4308
    self.'emit_get'(__ARG_1)
.annotate 'line', 4309

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 4266
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 4318
    self.'checkleft'()
.annotate 'line', 4319
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4320
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4321
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4322
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4323
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4324
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4325
    null $S5
.annotate 'line', 4326
    self.'annotate'(__ARG_1)
.annotate 'line', 4327
    if $S1 == 'S' goto __label_7
    if $S1 == 'I' goto __label_8
    if $S1 == 'N' goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 4329
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4332
    eq $S1, $S2, __label_10
.annotate 'line', 4333
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4334
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4335
    set $S4, $S5
  __label_10: # endif
.annotate 'line', 4337
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 4340
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 4342
    .return($S3)
.annotate 'line', 4343

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4314
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4352
    self.'checkleft'()
.annotate 'line', 4353
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4354
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4355
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4356
    null $S2
.annotate 'line', 4357
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    if $S3 == 'S' goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 4359
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4360
    self.'annotate'(__ARG_1)
.annotate 'line', 4361
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 4364
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4365
    self.'annotate'(__ARG_1)
.annotate 'line', 4366
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_2: # switch end
.annotate 'line', 4368
    .return($S1)
.annotate 'line', 4369

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4348
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4378
    self.'checkleft'()
.annotate 'line', 4379
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4380
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4381
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4382
    self.'annotate'(__ARG_1)
.annotate 'line', 4383
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 4384
    .return($S2)
.annotate 'line', 4385

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4374
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4394
    self.'checkleft'()
.annotate 'line', 4395
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4396
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4397
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4398
    self.'annotate'(__ARG_1)
.annotate 'line', 4399
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 4400
    .return($S2)
.annotate 'line', 4401

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4390
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4413
    .return('I')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4416
    self.'optimizearg'()
.annotate 'line', 4417
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4418
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4419
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4420
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 4421
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4422
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_25($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 4424
    .return(self)
.annotate 'line', 4425

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 4428
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4429
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4430
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4431
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4432
    self.'annotate'(__ARG_1)
.annotate 'line', 4433
    null $S5
.annotate 'line', 4435
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4440
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4445
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4450
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4455
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4460
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4436
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4437
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4438
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4441
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4442
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4443
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4446
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4447
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4448
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4451
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4452
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4453
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4456
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4457
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4458
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4461
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4462
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4463
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4467
    if __ARG_3 == 0 goto __label_21
    if __ARG_3 == 1 goto __label_22
    if __ARG_3 == 2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4469
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4472
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 4475
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 4478

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4481
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4482

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4485
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
.annotate 'line', 4486

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4489
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
.annotate 'line', 4490

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4411
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
.annotate 'line', 4501
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
.annotate 'line', 4502

.end # Negable


.sub 'isnegable' :method
.annotate 'line', 4503
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4506
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4507
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4508
    .return(self)
.annotate 'line', 4509

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4497
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4523
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4524
    self.'Negable'(__ARG_3)
.annotate 'line', 4525
    setattribute self, 'expr', __ARG_2
.annotate 'line', 4526

.end # CheckerExpr


.sub 'checkresult' :method
.annotate 'line', 4527
    .return('I')

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4517
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4519
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4534
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4535

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4538
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4539
    self.'annotate'(__ARG_1)
.annotate 'line', 4540
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4541
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4542
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
.annotate 'line', 4543

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4546
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4547
    self.'annotate'(__ARG_1)
.annotate 'line', 4548
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4549
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4551
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4552

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4530
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]

.sub 'ZeroCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4559
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4560

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4563
    getattribute $P1, self, 'expr'
.annotate 'line', 4564
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4565
    self.'annotate'(__ARG_1)
.annotate 'line', 4566
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4567
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4569
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_3: # endif
.annotate 'line', 4570

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4573
    getattribute $P1, self, 'expr'
.annotate 'line', 4574
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4575
    self.'annotate'(__ARG_1)
.annotate 'line', 4576
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4577
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4579
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4580

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4555
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
.annotate 'line', 4589
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4590
    self.'Negable'(__ARG_5)
.annotate 'line', 4591

.end # OpEqualExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4594
    self.'optimizearg'()
.annotate 'line', 4595
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4596
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4597
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4598
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4599
    unless $I1 goto __label_1
.annotate 'line', 4600
    unless $I2 goto __label_2
.annotate 'line', 4601
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_25($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4603
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
  __label_1: # endif
.annotate 'line', 4605
    unless $I2 goto __label_4
.annotate 'line', 4606
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4607
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4608
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4609
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_8
    $P3 = $P2.'isliteral'()
  __label_8:
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 4610
    ne $S1, $S2, __label_9
.annotate 'line', 4611
    if $S1 == 'I' goto __label_12
    if $S1 == 'S' goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4613
    $P4 = $P1.'getIntegerValue'()
    set $I3, $P4
.annotate 'line', 4614
    $P5 = $P2.'getIntegerValue'()
    set $I4, $P5
.annotate 'line', 4615
    getattribute $P6, self, 'positive'
    if_null $P6, __label_15
    unless $P6 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4616
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    .tailcall WSubId_25($P7, $P8, $I5)
  __label_13: # case
.annotate 'line', 4618
    getattribute $P10, $P1, 'strval'
    getattribute $P9, $P10, 'str'
    null $S3
    if_null $P9, __label_16
    set $S3, $P9
  __label_16:
.annotate 'line', 4619
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_17
    set $S4, $P11
  __label_17:
.annotate 'line', 4620
    getattribute $P13, self, 'positive'
    if_null $P13, __label_19
    unless $P13 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4621
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    .tailcall WSubId_25($P14, $P15, $I6)
  __label_11: # default
  __label_10: # switch end
  __label_9: # endif
  __label_7: # endif
.annotate 'line', 4625
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4626
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4627
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4628
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4629
    .return(self)
.annotate 'line', 4630

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4633
    self.'annotate'(__ARG_1)
.annotate 'line', 4634
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'iseq'
    goto __label_1
  __label_2:
    set $S1, 'isne'
  __label_1:
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4635

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4638
    self.'annotate'(__ARG_1)
.annotate 'line', 4639
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4640

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4643
    self.'annotate'(__ARG_1)
.annotate 'line', 4644
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'eq'
    goto __label_1
  __label_2:
    set $S1, 'ne'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4645

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4648
    self.'annotate'(__ARG_1)
.annotate 'line', 4649
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'ne'
    goto __label_1
  __label_2:
    set $S1, 'eq'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4650

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4585
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
.annotate 'line', 4661
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4662
    self.'Negable'(__ARG_5)
.annotate 'line', 4663

.end # OpSameExpr


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4666
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
.annotate 'line', 4667

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4670
    self.'annotate'(__ARG_1)
.annotate 'line', 4671
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4672
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4673
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4674

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4677
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4678

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4681
    self.'annotate'(__ARG_1)
.annotate 'line', 4682
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4683
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4684
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4685

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4688
    self.'annotate'(__ARG_1)
.annotate 'line', 4689
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4690
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4691
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4692

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4656
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4658
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4699
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4702
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4703

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4706
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4707

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4710
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4711

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4714
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4715

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4718
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4719

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4697
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4726
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4729
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4730

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4733
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4734

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4737
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4738

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4741
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4742

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4745
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4746

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4724
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4753
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4756
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4757

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4760
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4761

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4764
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4765

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4768
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4769

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4772
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4773

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4751
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 4780
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4783
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4784

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4787
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4788

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4791
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4792

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4795
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4796

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4799
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4800

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4778
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4809
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
.annotate 'line', 4811

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4805
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4820
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4821

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4824
    self.'optimizearg'()
.annotate 'line', 4825
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 4826
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4827
    unless $I1 goto __label_3
.annotate 'line', 4828
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4829
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_25($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4827
    .return($P1)
  __label_1: # endif
.annotate 'line', 4831
    .return(self)
.annotate 'line', 4832

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4835
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4836
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4837
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4838
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
.annotate 'line', 4839
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 4840
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 4841
    __ARG_1.'emitbinop'('and', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 4844
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 4845
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 4846
    getattribute $P5, self, 'lexpr'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 4847
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 4850
    getattribute $P3, self, 'lexpr'
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 4851
    __ARG_1.'emitunless'(__ARG_2, $S4)
.annotate 'line', 4852
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 4853
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 4854
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 4857
    getattribute $P3, self, 'rexpr'
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 4858
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 4860

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4816
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4869
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4870

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4873
    self.'optimizearg'()
.annotate 'line', 4874
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 4875
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4876
    if $I1 goto __label_3
.annotate 'line', 4877
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4878
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_25($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4876
    .return($P1)
  __label_1: # endif
.annotate 'line', 4880
    .return(self)
.annotate 'line', 4881

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4884
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4885
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4886
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4887
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
.annotate 'line', 4888
    $P6 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 4889
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 4890
    __ARG_1.'emitbinop'('or', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 4893
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 4894
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 4895
    getattribute $P5, self, 'lexpr'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 4896
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 4899
    getattribute $P3, self, 'lexpr'
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 4900
    __ARG_1.'emitif'(__ARG_2, $S4)
.annotate 'line', 4901
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 4902
    getattribute $P5, self, 'rexpr'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 4903
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 4906
    getattribute $P3, self, 'rexpr'
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 4907
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 4909

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4865
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4914
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4924
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4925

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4928
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4929
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4930
    self.'annotate'(__ARG_1)
.annotate 'line', 4931
    __ARG_1.'emitbinop'('band', __ARG_2, $S1, $S2)
.annotate 'line', 4932

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4935
    band $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4936

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4920
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4945
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4946

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4949
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4950
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4951
    self.'annotate'(__ARG_1)
.annotate 'line', 4952
    __ARG_1.'emitbinop'('bor', __ARG_2, $S1, $S2)
.annotate 'line', 4953

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4956
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4957

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4941
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4966
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4967

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4970
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4971
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4972
    self.'annotate'(__ARG_1)
.annotate 'line', 4973
    __ARG_1.'emitbinop'('bxor', __ARG_2, $S1, $S2)
.annotate 'line', 4974

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4977
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 4978

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4962
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4988
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4990
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4997
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4991
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4992
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4993
    getattribute $P3, __ARG_4, 'values'
    self.'append'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 4995
    self.'pushexpr'(__ARG_4)
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4998
    getattribute $P5, __ARG_4, 'values'
    setattribute self, 'values', $P5
.annotate 'line', 4999
    self.'unshiftexpr'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 5002
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = __ARG_3
    $P7[1] = __ARG_4
    setattribute self, 'values', $P7
  __label_1: # switch end
.annotate 'line', 5004

.end # ConcatString


.sub 'pushexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5007
    getattribute $P1, self, 'values'
.annotate 'line', 5008
    $P2 = $P1[-1]
.annotate 'line', 5009
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5010
    $P4 = WSubId_78($P2, __ARG_1)
    $P1[-1] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5012
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 5013

.end # pushexpr


.sub 'unshiftexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5016
    getattribute $P1, self, 'values'
.annotate 'line', 5017
    $P2 = $P1[0]
.annotate 'line', 5018
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5019
    $P4 = WSubId_78(__ARG_1, $P2)
    $P1[0] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5021
    'unshift'($P1, __ARG_1)
  __label_2: # endif
.annotate 'line', 5022

.end # unshiftexpr


.sub 'append' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_78 = "WSubId_78"
.annotate 'line', 5025
    getattribute $P1, self, 'values'
.annotate 'line', 5026
    $P2 = $P1[-1]
.annotate 'line', 5027
    $P4 = $P2.'isstringliteral'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5028
    $P3 = __ARG_1[0]
.annotate 'line', 5029
    $P4 = $P3.'isstringliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5030
    $P5 = WSubId_78($P2, $P3)
    $P1[-1] = $P5
.annotate 'line', 5031
    __ARG_1.'shift'()
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 5034
    $P1.'append'(__ARG_1)
.annotate 'line', 5035

.end # append


.sub 'checkresult' :method
.annotate 'line', 5037
    .return('S')

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
.annotate 'line', 5040
    getattribute $P1, self, 'values'
.annotate 'line', 5041
    elements $I1, $P1
.annotate 'line', 5042
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 5043
    null $I2
.annotate 'line', 5044
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5045
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 5044
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5046
    .return($P2)
.annotate 'line', 5047

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5050
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5051
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 5052

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 5055
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5056
    elements $I1, $P1
.annotate 'line', 5057
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5058
    self.'annotate'(__ARG_1)
.annotate 'line', 5059
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
.annotate 'line', 5060
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 5061
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 5060
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 5062
    .return($S1)
.annotate 'line', 5063

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5066
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5067
    elements $I1, $P1
.annotate 'line', 5068
    self.'annotate'(__ARG_1)
.annotate 'line', 5069
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5070
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 5069
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5071

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4983
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4985
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
.annotate 'line', 5080
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 5081

.end # RepeatString


.sub 'checkresult' :method
.annotate 'line', 5082
    .return('S')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5085
    getattribute $P1, self, 'rexpr'
.annotate 'line', 5086
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5087
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5088
    self.'annotate'(__ARG_1)
.annotate 'line', 5089
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
.annotate 'line', 5090

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 5076
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5099
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5100

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5103
    self.'optimizearg'()
.annotate 'line', 5104
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5105
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5106
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5107
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5108
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5109
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'S'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5110
    .tailcall WSubId_78($P1, $P2)
  __label_5: # endif
.annotate 'line', 5111
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_8
    iseq $I3, $S2, 'I'
  __label_8:
    unless $I3 goto __label_7
.annotate 'line', 5112
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5113
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5114
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_7: # endif
.annotate 'line', 5117
    $P3 = WSubId_79($S1, $S2)
    if_null $P3, __label_9
    unless $P3 goto __label_9
.annotate 'line', 5118
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5119
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5120
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_77($P3, $P4, $N3)
  __label_9: # endif
  __label_3: # endif
.annotate 'line', 5124
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'S'
  __label_11:
    unless $I3 goto __label_10
.annotate 'line', 5125
    new $P4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'ConcatString'($P5, $P6, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_10: # endif
.annotate 'line', 5127
    .return(self)
.annotate 'line', 5128

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_79 = "WSubId_79"
.annotate 'line', 5131
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5132
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5133
    ne $S1, $S2, __label_3
.annotate 'line', 5134
    .return($S1)
  __label_3: # endif
.annotate 'line', 5135
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 5136
    .return('S')
  __label_4: # endif
.annotate 'line', 5137
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 5138
    .return('S')
  __label_6: # endif
.annotate 'line', 5139
    $P1 = WSubId_79($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 5140
    .return('N')
  __label_8: # endif
.annotate 'line', 5141
    .return('I')
.annotate 'line', 5142

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5145
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5146
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5147
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5148
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5149
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5151
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5152
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5153
    ne $S1, 'S', __label_6
.annotate 'line', 5154
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
.annotate 'line', 5155
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 5156
    eq $S2, 'S', __label_11
.annotate 'line', 5157
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 5158
    set $S4, $S6
    goto __label_12
  __label_11: # else
.annotate 'line', 5161
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 5162
    set $S5, $S6
  __label_12: # endif
  __label_8: # endif
.annotate 'line', 5165
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
    goto __label_7
  __label_6: # else
.annotate 'line', 5168
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5169
    null $S7
.annotate 'line', 5170
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
.annotate 'line', 5172
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 5173
    __ARG_1.'emitset'($S7, $S4)
  __label_18: # endif
.annotate 'line', 5175
    null $S8
.annotate 'line', 5176
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
.annotate 'line', 5178
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 5179
    __ARG_1.'emitset'($S8, $S5)
  __label_20: # endif
.annotate 'line', 5181
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
    goto __label_14
  __label_13: # else
.annotate 'line', 5184
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
  __label_7: # endif
.annotate 'line', 5186

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 5095
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5195
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5196

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 5199
    self.'optimizearg'()
.annotate 'line', 5200
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5201
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5202
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5203
    $P4 = $P1.'checkresult'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5204
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 5205
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5206
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5207
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5208
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 5211
    .return(self)
.annotate 'line', 5212

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5215
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5216
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5218
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 5220
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 5222
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 5224
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 5219
    .return($S1)
  __label_6: # case
.annotate 'line', 5221
    .return('P')
  __label_8: # case
.annotate 'line', 5223
    .return('N')
  __label_10: # case
.annotate 'line', 5225
    .return('N')
  __label_4: # default
.annotate 'line', 5227
    .return('I')
  __label_3: # switch end
.annotate 'line', 5229

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5232
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5233
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5234
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5235
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5236
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5237
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5238
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5239
    null $S6
.annotate 'line', 5240
    eq $S2, $S1, __label_6
.annotate 'line', 5241
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5242
    ne $S1, 'P', __label_7
.annotate 'line', 5243
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 5245
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 5246
    set $S4, $S6
  __label_6: # endif
.annotate 'line', 5248
    eq $S3, $S1, __label_9
.annotate 'line', 5249
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5250
    ne $S1, 'P', __label_10
.annotate 'line', 5251
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 5253
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 5254
    set $S5, $S6
  __label_9: # endif
.annotate 'line', 5256
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
.annotate 'line', 5257

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 5191
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5266
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5267

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5270
    self.'optimizearg'()
.annotate 'line', 5271
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5272
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5273
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5274
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5275
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5276
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5277
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 5278
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5279
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_25($P3, $P4, $I3)
  __label_5: # endif
.annotate 'line', 5282
    $P3 = WSubId_79($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 5283
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5284
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5285
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_77($P3, $P4, $N3)
  __label_7: # endif
  __label_3: # endif
.annotate 'line', 5289
    ne $S1, 'S', __label_8
.annotate 'line', 5290
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 5291
    .return(self)
.annotate 'line', 5292

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5295
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5296
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5297
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5298
    ne $S1, $S2, __label_3
.annotate 'line', 5299
    .return($S1)
  __label_3: # endif
.annotate 'line', 5300
    ne $S1, 'S', __label_4
.annotate 'line', 5301
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5303
    .return('N')
  __label_5: # endif
.annotate 'line', 5304

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5307
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5308
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5309
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5310
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5311
    null $S3
    null $S4
.annotate 'line', 5312
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
.annotate 'line', 5313
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5314
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5315
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5316
    .return()
  __label_3: # endif
.annotate 'line', 5321
    ne $S1, 'N', __label_7
.annotate 'line', 5322
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5323
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5324
    null $S5
.annotate 'line', 5325
    if $S2 == 'I' goto __label_10
    if $S2 == 'N' goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5327
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5328
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5329
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5332
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5335
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5336
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 5338
    self.'annotate'(__ARG_1)
.annotate 'line', 5339
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
.annotate 'line', 5340
    .return()
  __label_7: # endif
.annotate 'line', 5343
    null $I1
    null $I2
.annotate 'line', 5344
    $P4 = $P1.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_14
    $P3 = $P1.'isidentifier'()
  __label_14:
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 5345
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S3, $P5
.annotate 'line', 5346
    $P1.'emit'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
.annotate 'line', 5349
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5350
    set $S3, $I1
  __label_13: # endif
.annotate 'line', 5352
    $P4 = $P2.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_17
    $P3 = $P2.'isidentifier'()
  __label_17:
    if_null $P3, __label_15
    unless $P3 goto __label_15
.annotate 'line', 5353
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S4, $P5
.annotate 'line', 5354
    $P2.'emit'(__ARG_1, $S4)
    goto __label_16
  __label_15: # else
.annotate 'line', 5357
    if $S2 == 'S' goto __label_20
    if $S2 == 'N' goto __label_21
    if $S2 == 'I' goto __label_22
    goto __label_19
  __label_20: # case
.annotate 'line', 5359
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5360
    $P2.'emit'(__ARG_1, $S4)
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5363
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_18 # break
  __label_22: # case
  __label_19: # default
.annotate 'line', 5367
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5368
    set $S4, $I2
    goto __label_18 # break
  __label_18: # switch end
  __label_16: # endif
.annotate 'line', 5372
    self.'annotate'(__ARG_1)
.annotate 'line', 5373
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5374

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 5262
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5383
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5384

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_77 = "WSubId_77"
.annotate 'line', 5387
    self.'optimizearg'()
.annotate 'line', 5388
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5389
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5390
    $P5 = $P1.'isliteral'()
    unless $P5 goto __label_2
    $P5 = $P2.'isliteral'()
  __label_2:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 5391
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 5392
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5393
    null $P3
.annotate 'line', 5394
    null $P4
.annotate 'line', 5395
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5396
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5397
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5398
    unless $I2 goto __label_7
.annotate 'line', 5399
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_25($P5, $P6, $N3)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 5402
    $P5 = WSubId_79($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
.annotate 'line', 5403
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5404
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5405
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5406
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_77($P5, $P6, $N3)
  __label_9: # endif
  __label_8: # endif
  __label_1: # endif
.annotate 'line', 5410
    .return(self)
.annotate 'line', 5411

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5414
    .return('N')
.annotate 'line', 5415

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5418
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5419
    null $P2
.annotate 'line', 5420
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5421
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
.annotate 'line', 5422
    $P2 = self.'tempreg'('N')
.annotate 'line', 5423
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5424
    set $P3, $P2
  __label_1: # endif
.annotate 'line', 5426
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5427
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5428
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
.annotate 'line', 5429
    $P2 = self.'tempreg'('N')
.annotate 'line', 5430
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5431
    set $P5, $P2
  __label_2: # endif
.annotate 'line', 5433
    self.'annotate'(__ARG_1)
.annotate 'line', 5434
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
.annotate 'line', 5435

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5379
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5444
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5445

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5448
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5449
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5450
    self.'annotate'(__ARG_1)
.annotate 'line', 5451
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5452

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5455
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5456

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5440
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5465
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5466

.end # OpCModExpr


.sub 'checkresult' :method
.annotate 'line', 5469
    .return('I')
.annotate 'line', 5470

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5473
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5474
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5475
    self.'annotate'(__ARG_1)
.annotate 'line', 5480
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5481

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5461
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5490
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5491

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5494
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5495
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5496
    self.'annotate'(__ARG_1)
.annotate 'line', 5497
    __ARG_1.'emitbinop'('shl', __ARG_2, $S1, $S2)
.annotate 'line', 5498

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5501
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5502

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5486
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5511
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5512

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5515
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5516
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5517
    self.'annotate'(__ARG_1)
.annotate 'line', 5518
    __ARG_1.'emitbinop'('shr', __ARG_2, $S1, $S2)
.annotate 'line', 5519

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5522
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5523

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5507
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5532
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 5533

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 5536
    null $I1
    null $I2
.annotate 'line', 5537
    set $S1, ''
.annotate 'line', 5538
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 5539
    $P5 = $P1.'getname'()
    set $S2, $P5
    if $S2 == 'flat' goto __label_5
    if $S2 == 'named' goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5541
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5544
    set $I2, 1
.annotate 'line', 5545
    $P6 = $P1.'numargs'()
    set $I3, $P6
    if $I3 == 0 goto __label_9
    if $I3 == 1 goto __label_10
    goto __label_8
  __label_9: # case
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 5549
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5550
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5551
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5552
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5555
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5560
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5563
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5566
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5561
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5564
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5567
    __ARG_1.'print'(' :named')
.annotate 'line', 5568
    eq $S1, '', __label_17
.annotate 'line', 5569
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5572

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5528
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5581
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5582
    setattribute self, 'modifiers', __ARG_2
.annotate 'line', 5583

.end # Argument


.sub 'optimize' :method
.annotate 'line', 5586
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5587
    .return(self)
.annotate 'line', 5588

.end # optimize


.sub 'hascompilevalue' :method
.annotate 'line', 5591
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
.annotate 'line', 5592

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5577
    addattribute $P0, 'arg'
.annotate 'line', 5578
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 5597
    null $P1
.annotate 'line', 5598
    $P2 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 5599
    $P3 = __ARG_1.'get'()
.annotate 'line', 5600
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5601
    $P3 = __ARG_1.'get'()
.annotate 'line', 5602
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 5603
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
    goto __label_4
  __label_3: # else
.annotate 'line', 5606
    WSubId_54('modifier list', $P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 5609
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5610
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
.annotate 'line', 5611

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_80 = "WSubId_80"
.annotate 'line', 5622
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5623
    setattribute self, 'start', __ARG_2
.annotate 'line', 5624
    $P1 = __ARG_3.'get'()
.annotate 'line', 5625
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 5626
    __ARG_3.'unget'($P1)
.annotate 'line', 5627
    $P3 = WSubId_50(__ARG_3, __ARG_1, WSubId_80, __ARG_4)
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 5629

.end # ArgumentList


.sub 'numargs' :method
.annotate 'line', 5632
    getattribute $P1, self, 'args'
.annotate 'line', 5633
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
    .return($I1)
.annotate 'line', 5634

.end # numargs


.sub 'getrawargs' :method
.annotate 'line', 5637
    getattribute $P1, self, 'args'
    .return($P1)
.annotate 'line', 5638

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 5641
    getattribute $P1, self, 'args'
.annotate 'line', 5642
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 5643

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
.annotate 'line', 5646
    getattribute $P1, self, 'args'
.annotate 'line', 5647
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
.annotate 'line', 5648

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 5651
    getattribute $P1, self, 'args'
    WSubId_52($P1)
.annotate 'line', 5652
    .return(self)
.annotate 'line', 5653

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 5656
    getattribute $P1, self, 'argregs'
.annotate 'line', 5657
    unless_null $P1, __label_1
.annotate 'line', 5658
    new $P2, ['ResizableStringArray']
.annotate 'line', 5659
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 5660
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P4, $P6
.annotate 'line', 5661
    getattribute $P8, $P4, 'arg'
    $P7 = $P3.'add'($P8)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 5662
    push $P2, $S1
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5664
    setattribute self, 'argregs', $P2
  __label_1: # endif
.annotate 'line', 5666
    .return($P1)
.annotate 'line', 5667

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 5670
    getattribute $P1, self, 'args'
.annotate 'line', 5671
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5673
    set $S1, ''
.annotate 'line', 5674
    $P4 = self.'numargs'()
    set $I1, $P4
.annotate 'line', 5675
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5676
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5677
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5678
    if_null $P3, __label_4
.annotate 'line', 5679
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5680
    set $S1, ', '
  __label_1: # for iteration
.annotate 'line', 5675
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5682

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5615
    addattribute $P0, 'owner'
.annotate 'line', 5616
    addattribute $P0, 'start'
.annotate 'line', 5617
    addattribute $P0, 'args'
.annotate 'line', 5618
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_81')
        .param pmc __ARG_1
.annotate 'line', 5687
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5688
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5689
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5690
    .return(1)
.annotate 'line', 5691

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5702
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5703
    setattribute self, 'builtin', __ARG_3
.annotate 'line', 5704
    setattribute self, 'args', __ARG_4
.annotate 'line', 5705

.end # CallBuiltinExpr


.sub 'checkresult' :method
.annotate 'line', 5708
    getattribute $P1, self, 'builtin'
    .tailcall $P1.'result'()
.annotate 'line', 5709

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5712
    self.'emit'(__ARG_1, "")
.annotate 'line', 5713

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 5716
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5717
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
.annotate 'line', 5722
    getattribute $P1, self, 'start'
    WSubId_1("Can't use result of a void builtin", $P1)
  __label_3: # default
.annotate 'line', 5724
    concat $S4, "Unexpected result type '", $S1
    concat $S4, $S4, "'"
    getattribute $P2, self, 'start'
    WSubId_6($S4, $P2)
  __label_2: # switch end
.annotate 'line', 5726
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_9
    set $S2, $P1
  __label_9:
.annotate 'line', 5727
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 5728
    .return($S2)
.annotate 'line', 5729

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5732
    getattribute $P1, self, 'builtin'
.annotate 'line', 5733
    getattribute $P2, self, 'args'
.annotate 'line', 5734
    new $P3, ['ResizableStringArray']
.annotate 'line', 5735
    null $P4
.annotate 'line', 5736
    $P8 = $P1.'params'()
    set $I3, $P8
    if $I3 == -1 goto __label_3
    if $I3 == -2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5738
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P9, self, 'owner'
    $P5.'CollectValues'($P9, __ARG_1)
.annotate 'line', 5739
    if_null $P2, __label_6
    iter $P10, $P2
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P4, $P10
.annotate 'line', 5740
    getattribute $P12, $P4, 'arg'
    $P11 = $P5.'add'($P12)
    push $P3, $P11
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5743
    root_new $P6, ['parrot';'ResizablePMCArray']
.annotate 'line', 5744
    if_null $P2, __label_8
    iter $P13, $P2
    set $P13, 0
  __label_7: # for iteration
    unless $P13 goto __label_8
    shift $P4, $P13
.annotate 'line', 5745
    getattribute $P14, $P4, 'arg'
    push $P6, $P14
    goto __label_7
  __label_8: # endfor
.annotate 'line', 5746
    getattribute $P15, self, 'builtin'
    getattribute $P16, self, 'start'
    $P15.'expand'(__ARG_1, self, $P16, __ARG_2, $P6)
.annotate 'line', 5747
    .return()
  __label_2: # default
.annotate 'line', 5749
    getattribute $P17, self, 'args'
    set $I1, $P17
.annotate 'line', 5750
    new $P7, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P18, self, 'owner'
    $P7.'CollectValues'($P18, __ARG_1)
.annotate 'line', 5751
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
.annotate 'line', 5752
    $P19 = $P2[$I2]
    getattribute $P4, $P19, 'arg'
.annotate 'line', 5753
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
.annotate 'line', 5754
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
.annotate 'line', 5755
    null $S3
.annotate 'line', 5756
    $P8 = $P4.'isnull'()
    if_null $P8, __label_14
    unless $P8 goto __label_14
.annotate 'line', 5757
    if $S2 == 'I' goto __label_18
    if $S2 == 'N' goto __label_19
    if $S2 == 'S' goto __label_20
    goto __label_17
  __label_18: # case
  __label_19: # case
  __label_20: # case
.annotate 'line', 5761
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5762
    __ARG_1.'emitnull'($S3)
    goto __label_16 # break
  __label_17: # default
.annotate 'line', 5765
    $P11 = $P7.'add'($P4)
    set $S3, $P11
  __label_16: # switch end
    goto __label_15
  __label_14: # else
.annotate 'line', 5769
    iseq $I3, $S1, $S2
    if $I3 goto __label_24
    iseq $I3, $S2, '?'
  __label_24:
    if $I3 goto __label_23
.annotate 'line', 5770
    iseq $I3, $S2, 'p'
    unless $I3 goto __label_25
.annotate 'line', 5771
    iseq $I3, $S1, 'S'
    if $I3 goto __label_26
    iseq $I3, $S1, 'P'
  __label_26:
  __label_25:
  __label_23:
    unless $I3 goto __label_21
.annotate 'line', 5772
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
.annotate 'line', 5774
    ne $S2, 'p', __label_27
.annotate 'line', 5775
    set $S2, 'P'
  __label_27: # endif
.annotate 'line', 5776
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P8, __label_28
    set $S4, $P8
  __label_28:
.annotate 'line', 5777
    if $S2 == 'P' goto __label_31
    if $S2 == 'I' goto __label_32
    if $S2 == 'N' goto __label_33
    if $S2 == 'S' goto __label_34
    goto __label_30
  __label_31: # case
.annotate 'line', 5779
    if $S1 == 'I' goto __label_37
    if $S1 == 'N' goto __label_38
    if $S1 == 'S' goto __label_39
    goto __label_36
  __label_37: # case
  __label_38: # case
  __label_39: # case
.annotate 'line', 5783
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
.annotate 'line', 5784
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_35 # break
  __label_36: # default
.annotate 'line', 5787
    set $S3, $S4
  __label_35: # switch end
    goto __label_29 # break
  __label_32: # case
  __label_33: # case
  __label_34: # case
.annotate 'line', 5793
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5794
    __ARG_1.'emitset'($S3, $S4)
    goto __label_29 # break
  __label_30: # default
.annotate 'line', 5797
    set $S3, $S4
  __label_29: # switch end
  __label_22: # endif
  __label_15: # endif
.annotate 'line', 5801
    push $P3, $S3
  __label_9: # for iteration
.annotate 'line', 5751
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_1: # switch end
.annotate 'line', 5804
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)
.annotate 'line', 5805

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
.annotate 'line', 5695
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5697
    addattribute $P0, 'builtin'
.annotate 'line', 5698
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
.annotate 'line', 5812
    $P7 = __ARG_3.'getname'()
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 5813
    __ARG_1.'use_builtin'($S1)
.annotate 'line', 5814
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P7 = __ARG_4.'numargs'()
    set $I1, $P7
  __label_2:
.annotate 'line', 5815
    if $I1 goto __label_5
    root_new $P7, ['parrot';'ResizablePMCArray']
    set $P1, $P7
    goto __label_4
  __label_5:
    $P8 = __ARG_4.'getrawargs'()
    set $P1, $P8
  __label_4:
.annotate 'line', 5817
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5818
    null $P3
.annotate 'line', 5819
    if_null $P2, __label_7
    iter $P9, $P2
    set $P9, 0
  __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P4, $P9
.annotate 'line', 5820
    getattribute $P7, $P4, 'nparams'
    set $I2, $P7
.annotate 'line', 5821
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 5822
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 5823
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 5824
    set $P3, $P4
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5826
    unless_null $P3, __label_12
.annotate 'line', 5827
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5830
    $P7 = $P3.'iscompileevaluable'()
    if_null $P7, __label_13
    unless $P7 goto __label_13
.annotate 'line', 5831
    $P8 = WSubId_81($P1)
    if_null $P8, __label_14
    unless $P8 goto __label_14
.annotate 'line', 5832
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5833
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_15
    push_eh $P7
.annotate 'line', 5834
    getattribute $P10, __ARG_1, 'owner'
    getattribute $P11, __ARG_1, 'start'
    $P8 = $P5($P10, $P11, $P1)
    .return($P8)
    pop_eh
    goto __label_16
  __label_15:
.annotate 'line', 5833
    .get_results($P6)
    finalize $P6
    pop_eh
.annotate 'line', 5838
    $S2 = $P6["message"]
    concat $S3, "Compile time evaluation of builtin ", $S1
    concat $S3, $S3, " failed: '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
.annotate 'line', 5837
    WSubId_1($S3, __ARG_2)
  __label_16:
  __label_14: # endif
  __label_13: # endif
.annotate 'line', 5843
    new $P8, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P8.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P7, $P8
    .return($P7)
.annotate 'line', 5844

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5853
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5854
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5855
    $P1 = __ARG_1.'get'()
.annotate 'line', 5856
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 5857
    __ARG_1.'unget'($P1)
.annotate 'line', 5858
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 5860

.end # CallExpr


.sub 'checkresult' :method
.annotate 'line', 5861
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 5864
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 5865
    getattribute $P2, self, 'args'
.annotate 'line', 5866
    if_null $P2, __label_1
.annotate 'line', 5867
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5869
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
.annotate 'line', 5870
    $P3 = $P1.'search_nonmember'()
.annotate 'line', 5872
    isnull $I1, $P3
    if $I1 goto __label_5
.annotate 'line', 5874
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_6
.annotate 'line', 5885
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
.annotate 'line', 5888
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 5873
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_6: # case
.annotate 'line', 5875
    $P8 = $P3.'ismulti'()
    isfalse $I2, $P8
    unless $I2 goto __label_9
.annotate 'line', 5876
    $P4 = $P3.'makesubid'()
.annotate 'line', 5877
    self.'usesubid'($P4)
.annotate 'line', 5878
    new $P7, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
    $P7.'CallSubid'(self, $P1, $P2, $P4)
    set $P6, $P7
    .return($P6)
    goto __label_10
  __label_9: # else
.annotate 'line', 5881
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 5882
    .return(self)
  __label_10: # endif
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 5886
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 5887
    .return(self)
  __label_8: # case
.annotate 'line', 5889
    getattribute $P11, self, 'owner'
    getattribute $P12, $P1, 'start'
    .tailcall WSubId_82($P11, $P12, $P3, $P2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5892
    getattribute $P13, self, 'start'
    WSubId_6("unexpected type found in scope", $P13)
  __label_3: # switch end
  __label_2: # endif
.annotate 'line', 5895
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 5896
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_11: # endif
.annotate 'line', 5899
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_12
    unless $P6 goto __label_12
.annotate 'line', 5900
    $P7 = $P1.'checkIdentifier'()
    set $S1, $P7
    ne $S1, '', __label_13
.annotate 'line', 5901
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P9 = $P1.'getName'()
    $P8[0] = $P9
    $P5 = self.'scopesearch'($P8, 0)
.annotate 'line', 5902
    isnull $I1, $P5
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 5903
    getattribute $P6, self, 'owner'
    getattribute $P7, $P1, 'start'
    .tailcall WSubId_82($P6, $P7, $P5, $P2)
  __label_14: # endif
  __label_13: # endif
  __label_12: # endif
.annotate 'line', 5907
    setattribute self, 'funref', $P1
.annotate 'line', 5908
    setattribute self, 'args', $P2
.annotate 'line', 5909
    .return(self)
.annotate 'line', 5910

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 5913
    .return(1)
.annotate 'line', 5914

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 5917
    getattribute $P1, self, 'funref'
.annotate 'line', 5918
    null $S1
.annotate 'line', 5920
    $P3 = $P1.'isidentifier'()
    unless $P3 goto __label_3
    getattribute $P4, $P1, 'subid'
    isnull $I1, $P4
    box $P3, $I1
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5921
    $P5 = $P1.'checkIdentifier'()
    set $S1, $P5
.annotate 'line', 5922
    ne $S1, '', __label_4
.annotate 'line', 5923
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
.annotate 'line', 5925
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5928
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5931
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5926
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
    join $S1, "", $P3
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 5929
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5932
    WSubId_6("Builtin unexpected here", self)
  __label_6: # default
.annotate 'line', 5934
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
.annotate 'line', 5939
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5940
    .return($S1)
.annotate 'line', 5941

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
.annotate 'line', 5944
    getattribute $P1, self, 'args'
.annotate 'line', 5945
    if_null $P1, __label_1
.annotate 'line', 5946
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5947

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 5950
    __ARG_1.'print'('(')
.annotate 'line', 5951
    getattribute $P1, self, 'args'
.annotate 'line', 5952
    if_null $P1, __label_1
.annotate 'line', 5953
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5954
    __ARG_1.'say'(')')
.annotate 'line', 5955

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5958
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5959
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5961
    self.'annotate'(__ARG_1)
.annotate 'line', 5963
    __ARG_1.'print'('    ')
.annotate 'line', 5964
    ne __ARG_2, '.tailcall', __label_2
.annotate 'line', 5965
    __ARG_1.'print'('.tailcall ')
    goto __label_3
  __label_2: # else
.annotate 'line', 5967
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_3: # endif
.annotate 'line', 5969
    __ARG_1.'print'($S1)
.annotate 'line', 5970
    self.'emitargs'(__ARG_1)
.annotate 'line', 5971

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5974
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5975
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5976
    self.'annotate'(__ARG_1)
.annotate 'line', 5977
    __ARG_1.'print'('    ')
.annotate 'line', 5978
    __ARG_1.'print'($S1)
.annotate 'line', 5979
    self.'emitargs'(__ARG_1)
.annotate 'line', 5980

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5846
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5848
    addattribute $P0, 'funref'
.annotate 'line', 5849
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallSubid' ]

.sub 'CallSubid' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5992
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5993
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5994
    setattribute self, 'args', __ARG_3
.annotate 'line', 5995
    setattribute self, 'subid', __ARG_4
.annotate 'line', 5996

.end # CallSubid


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 5999
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 6000

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
.annotate 'line', 5987
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5989
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6008
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6009
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6010
    setattribute self, 'args', __ARG_3
.annotate 'line', 6011

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6014
    getattribute $P1, self, 'funref'
.annotate 'line', 6016
    getattribute $P2, $P1, 'left'
  __label_2: # while
.annotate 'line', 6017
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6018
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6019
    $P5 = $P2.'isidentifier'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 6020
    $P6 = $P2.'checkIdentifier'()
    null $S1
    if_null $P6, __label_4
    set $S1, $P6
  __label_4:
.annotate 'line', 6021
    isnull $I1, $S1
    if $I1 goto __label_6
    iseq $I1, $S1, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 6025
    new $P3, ['ResizableStringArray']
.annotate 'line', 6026
    $P1.'buildkey'($P3)
.annotate 'line', 6027
    $P5 = $P3.'pop'()
    null $S2
    if_null $P5, __label_7
    set $S2, $P5
  __label_7:
.annotate 'line', 6028
    $P4 = self.'tempreg'('P')
.annotate 'line', 6029
    self.'annotate'(__ARG_1)
.annotate 'line', 6030
    $P5 = WSubId_30($P3)
    __ARG_1.'emitget_hll_global'($P4, $S2, $P5)
.annotate 'line', 6031
    .return($P4)
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 6034
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 4
    $P6 = $P1.'emit_left_get'(__ARG_1)
    $P5[0] = $P6
    $P5[1] = ".'"
.annotate 'line', 6035
    $P7 = $P1.'get_member'()
.annotate 'line', 6034
    $P5[2] = $P7
    $P5[3] = "'"
    join $S3, "", $P5
    .return($S3)
.annotate 'line', 6036

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 6004
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6046
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6047
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6048
    setattribute self, 'args', __ARG_3
.annotate 'line', 6049

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6052
    getattribute $P1, self, 'funref'
.annotate 'line', 6053
    getattribute $P2, $P1, 'right'
.annotate 'line', 6054
    $P3 = $P2.'checkresult'()
.annotate 'line', 6055
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6056
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 6059
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 6060
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 6061
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
.annotate 'line', 6062

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 6042
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6072
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6073
    setattribute self, 'left', __ARG_3
.annotate 'line', 6074

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
.annotate 'line', 6077
    getattribute $P1, self, 'left'
    .tailcall $P1.'emit_getvar'(__ARG_1)
.annotate 'line', 6078

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 6067
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6069
    addattribute $P0, 'left'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6087
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6088
    setattribute self, 'right', __ARG_4
.annotate 'line', 6089

.end # MemberExpr


.sub 'checkresult' :method
.annotate 'line', 6090
    .return('P')

.end # checkresult


.sub 'search_nonmember' :method
.annotate 'line', 6096
    null $P1
.annotate 'line', 6097
    null $P2
.annotate 'line', 6098
    getattribute $P3, self, 'left'
  __label_2: # while
.annotate 'line', 6099
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6100
    getattribute $P3, $P3, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6101
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 6102
    $P4 = $P3.'checkIdentifier'()
.annotate 'line', 6103
    isnull $I1, $P4
    if $I1 goto __label_5
    set $S1, $P4
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 6104
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 6105
    self.'buildkey'($P5)
.annotate 'line', 6106
    .tailcall self.'scopesearch'($P5, 0)
  __label_4: # endif
  __label_3: # endif
    null $P6
.annotate 'line', 6109
    .return($P6)
.annotate 'line', 6110

.end # search_nonmember


.sub 'optimize' :method
.annotate 'line', 6113
    getattribute $P4, self, 'left'
    $P3 = $P4.'optimize'()
    setattribute self, 'left', $P3
.annotate 'line', 6115
    $P1 = self.'search_nonmember'()
.annotate 'line', 6117
    isnull $I1, $P1
    if $I1 goto __label_3
.annotate 'line', 6119
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
.annotate 'line', 6123
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6120
    $P2 = $P1.'ismulti'()
    if_null $P2, __label_6
    unless $P2 goto __label_6
.annotate 'line', 6121
    new $P4, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'FunctionRef'($P5, $P6, $P1)
    set $P3, $P4
    .return($P3)
  __label_6: # endif
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 6124
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6126
    .return(self)
.annotate 'line', 6127

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
.annotate 'line', 6130
    getattribute $P1, self, 'left'
.annotate 'line', 6131
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6132
    $P2 = $P1.'getName'()
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 6134
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6135
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
    push __ARG_1, $P2
.annotate 'line', 6136

.end # buildkey


.sub 'get_member' :method
.annotate 'line', 6139
    getattribute $P1, self, 'right'
    .return($P1)
.annotate 'line', 6140

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6143
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6144
    self.'annotate'(__ARG_1)
.annotate 'line', 6145
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
.annotate 'line', 6146

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6149
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6150
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6151
    .return($S1)
.annotate 'line', 6152

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6155
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6156
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6157
    self.'annotate'(__ARG_1)
.annotate 'line', 6158
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 6159

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6162
    self.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 6163

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6166
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6167
    null $S2
.annotate 'line', 6168
    ne __ARG_2, 'P', __label_2
.annotate 'line', 6170
    ne __ARG_3, 'null', __label_4
.annotate 'line', 6171
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 6172
    __ARG_1.'emitnull'(__ARG_3)
  __label_4: # endif
.annotate 'line', 6174
    set $S2, __ARG_3
    goto __label_3
  __label_2: # else
.annotate 'line', 6177
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 6178
    __ARG_1.'emitbox'($S2, __ARG_3)
  __label_3: # endif
.annotate 'line', 6180
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6181

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6184
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6185
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6186
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 6187
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
.annotate 'line', 6189
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 6190
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 6191
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 6193
    set $S2, $S3
  __label_7: # endif
  __label_4: # endif
.annotate 'line', 6195
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6196
    .return($S2)
.annotate 'line', 6197

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 6081
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6083
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6208
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6209
    setattribute self, 'right', __ARG_4
.annotate 'line', 6210

.end # MemberRefExpr


.sub 'checkresult' :method
.annotate 'line', 6211
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6214
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 6215
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 6216
    .return(self)
.annotate 'line', 6217

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 6220
    getattribute $P1, self, 'left'
.annotate 'line', 6221
    getattribute $P2, self, 'right'
.annotate 'line', 6222
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 6223
    WSubId_54("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6224
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6225
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6226
    self.'annotate'(__ARG_1)
.annotate 'line', 6227
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
.annotate 'line', 6228

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 6231
    getattribute $P1, self, 'left'
.annotate 'line', 6232
    getattribute $P2, self, 'right'
.annotate 'line', 6233
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 6234
    WSubId_54("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6235
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6236
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6237
    null $S3
.annotate 'line', 6238
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    if $S5 == 'P' goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 6240
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 6242
    ne $S3, 'null', __label_7
.annotate 'line', 6243
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 6244
    __ARG_1.'emitnull'($S3)
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 6248
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 6249
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6250
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 6253
    self.'annotate'(__ARG_1)
.annotate 'line', 6254
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 6255
    .return($S3)
.annotate 'line', 6256

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 6203
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6205
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]

.sub 'StringIndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6267
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6268
    setattribute self, 'left', __ARG_3
.annotate 'line', 6269
    setattribute self, 'arg', __ARG_4
.annotate 'line', 6270

.end # StringIndexExpr


.sub 'checkresult' :method
.annotate 'line', 6273
    .return('S')
.annotate 'line', 6274

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 6277
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6278
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6279
    self.'annotate'(__ARG_1)
.annotate 'line', 6280
    $P1 = WSubId_26("    substr %0, %1, %2, 1", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P1)
.annotate 'line', 6282

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 6261
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6263
    addattribute $P0, 'left'
.annotate 'line', 6264
    addattribute $P0, 'arg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6296
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6297
    setattribute self, 'left', __ARG_4
.annotate 'line', 6298
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
.annotate 'line', 6299

.end # IndexExpr


.sub 'checkresult' :method
.annotate 'line', 6302
    .return('P')
.annotate 'line', 6303

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 6306
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 6307
    setattribute self, 'left', $P1
.annotate 'line', 6308
    getattribute $P2, self, 'args'
.annotate 'line', 6309
    $P2.'optimizeargs'()
.annotate 'line', 6311
    $P4 = $P1.'checkresult'()
    set $S2, $P4
    ne $S2, 'S', __label_1
.annotate 'line', 6312
    $P5 = $P2.'numargs'()
    set $I2, $P5
    eq $I2, 1, __label_2
.annotate 'line', 6313
    WSubId_1('Bad string index', self)
  __label_2: # endif
.annotate 'line', 6314
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6317
    $P4 = $P1.'isstringliteral'()
    unless $P4 goto __label_4
    $P4 = $P3.'isintegerliteral'()
  __label_4:
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 6318
    $P5 = $P3.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 6319
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_5
    set $S1, $P4
  __label_5:
.annotate 'line', 6320
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
.annotate 'line', 6321
    substr $S2, $S1, $I1, 1
.annotate 'line', 6320
    .tailcall WSubId_27($P4, $P5, $S2)
  __label_3: # endif
.annotate 'line', 6323
    new $P5, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'StringIndexExpr'($P6, $P7, $P1, $P3)
    set $P4, $P5
    .return($P4)
  __label_1: # endif
.annotate 'line', 6326
    .return(self)
.annotate 'line', 6327

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6330
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6331
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6332
    getattribute $P1, self, 'left'
.annotate 'line', 6333
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6334
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 6335
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 6333
    setattribute self, 'regleft', $P3
.annotate 'line', 6336
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
.annotate 'line', 6337

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6340
    getattribute $P1, self, 'regleft'
.annotate 'line', 6341
    getattribute $P2, self, 'argregs'
.annotate 'line', 6342
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6343
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6344
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6345
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6346
    __ARG_1.'print'(']')
.annotate 'line', 6347

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6350
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6351
    self.'annotate'(__ARG_1)
.annotate 'line', 6352
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6353
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6354
    __ARG_1.'say'('')
.annotate 'line', 6355

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 6358
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6359
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6360
    .return($S1)
.annotate 'line', 6361

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6364
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6365
    self.'annotate'(__ARG_1)
.annotate 'line', 6366
    __ARG_1.'print'('    ')
.annotate 'line', 6367
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6368
    __ARG_1.'say'(' = ', __ARG_3)
.annotate 'line', 6369

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6372
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6373
    null $S1
.annotate 'line', 6374
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 6375
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6376
    __ARG_1.'emitnull'($S1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6379
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6380
    self.'annotate'(__ARG_1)
.annotate 'line', 6381
    __ARG_1.'print'('    ')
.annotate 'line', 6382
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6383
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6384
    .return($S1)
.annotate 'line', 6385

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6287
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6289
    addattribute $P0, 'left'
.annotate 'line', 6290
    addattribute $P0, 'regleft'
.annotate 'line', 6291
    addattribute $P0, 'args'
.annotate 'line', 6292
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 6396
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6397
    $P1 = __ARG_1.'get'()
.annotate 'line', 6398
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6399
    __ARG_1.'unget'($P1)
.annotate 'line', 6400
    $P3 = WSubId_50(__ARG_1, __ARG_2, WSubId_51, ']')
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 6402

.end # ArrayExpr


.sub 'checkresult' :method
.annotate 'line', 6403
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 6406
    getattribute $P1, self, 'values'
    WSubId_52($P1)
.annotate 'line', 6407
    .return(self)
.annotate 'line', 6408

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6411
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6412
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 6413

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6419
    self.'emit_init'(__ARG_1, '')
.annotate 'line', 6420

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6423
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6424
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6425
    .return($S1)
.annotate 'line', 6426

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 6429
    self.'annotate'(__ARG_1)
.annotate 'line', 6430
    getattribute $P1, self, 'values'
.annotate 'line', 6431
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 6432
    eq __ARG_2, '', __label_3
.annotate 'line', 6433
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6434
    le $I1, 0, __label_4
.annotate 'line', 6435
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 6437
    new $P2, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P4, self, 'owner'
    $P2.'CollectValues'($P4, __ARG_1)
.annotate 'line', 6438
    null $I2
.annotate 'line', 6439
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
.annotate 'line', 6440
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6441
    eq __ARG_2, '', __label_8
.annotate 'line', 6442
    self.'annotate'(__ARG_1)
.annotate 'line', 6443
    $P4 = WSubId_26("    %0[%1] = %2", __ARG_2, $I2, $S1)
    __ARG_1.'say'($P4)
.annotate 'line', 6444
    inc $I2
  __label_8: # endif
    goto __label_5
  __label_6: # endfor
.annotate 'line', 6447

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6390
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6392
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
.annotate 'line', 6459
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6460
    $P1 = __ARG_1.'get'()
.annotate 'line', 6461
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6462
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6463
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 6464
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6466
    $P4 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 6467
    WSubId_68(':', __ARG_1)
.annotate 'line', 6468
    $P5 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 6469
    push $P2, $P4
.annotate 'line', 6470
    push $P3, $P5
  __label_4: # continue
.annotate 'line', 6472
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6473
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6474
    WSubId_54("',' or '}'", $P1)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 6476
    setattribute self, 'keys', $P2
.annotate 'line', 6477
    setattribute self, 'values', $P3
.annotate 'line', 6478

.end # HashExpr


.sub 'checkresult' :method
.annotate 'line', 6479
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 6482
    getattribute $P1, self, 'keys'
    WSubId_52($P1)
.annotate 'line', 6483
    getattribute $P1, self, 'values'
    WSubId_52($P1)
.annotate 'line', 6484
    .return(self)
.annotate 'line', 6485

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6488
    self.'annotate'(__ARG_1)
.annotate 'line', 6493
    eq __ARG_2, '', __label_1
.annotate 'line', 6494
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6496
    getattribute $P1, self, 'keys'
.annotate 'line', 6497
    getattribute $P2, self, 'values'
.annotate 'line', 6498
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 6499
    set $I1, $P1
.annotate 'line', 6500
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 6501
    $P4 = $P1[$I2]
.annotate 'line', 6502
    null $S1
.annotate 'line', 6503
    $P5 = $P4.'isidentifier'()
    unless $P5 goto __label_7
    $P6 = $P4.'checkIdentifier'()
    set $S4, $P6
    iseq $I3, $S4, ''
    box $P5, $I3
  __label_7:
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 6504
    $P7 = $P4.'getName'()
    null $S2
    if_null $P7, __label_8
    set $S2, $P7
  __label_8:
.annotate 'line', 6505
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6506
    __ARG_1.'emitget_hll_global'($S1, $S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 6509
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6511
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 6512
    eq __ARG_2, '', __label_10
.annotate 'line', 6513
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_10: # endif
  __label_2: # for iteration
.annotate 'line', 6500
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 6515

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6518
    self.'emit'(__ARG_1, '')
.annotate 'line', 6519

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6522
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6523
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6524
    .return($S1)
.annotate 'line', 6525

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6452
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6454
    addattribute $P0, 'keys'
.annotate 'line', 6455
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 6538
    .return('P')

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
.annotate 'line', 6543
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
.annotate 'line', 6544

.end # parseinitializer


.sub 'numargs' :method
.annotate 'line', 6547
    getattribute $P1, self, 'initializer'
.annotate 'line', 6548
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)
.annotate 'line', 6549

.end # numargs


.sub 'optimize_initializer' :method
.annotate 'line', 6552
    getattribute $P1, self, 'initializer'
.annotate 'line', 6553
    if_null $P1, __label_1
.annotate 'line', 6554
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 6555

.end # optimize_initializer


.sub 'optimize' :method
.annotate 'line', 6558
    self.'optimize_initializer'()
.annotate 'line', 6559
    .return(self)
.annotate 'line', 6560

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6563
    getattribute $P1, self, 'initializer'
.annotate 'line', 6564
    if_null $P1, __label_1
.annotate 'line', 6565
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6566
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6567
    if_null $P1, __label_2
.annotate 'line', 6568
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6569
    __ARG_1.'say'(")")
.annotate 'line', 6570

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6530
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6532
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'warn_class_unknown' :subid('WSubId_83')
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6577
    concat $S1, "class ", __ARG_2
    concat $S1, $S1, " not found at compile time"
    __ARG_1.'warn'($S1, __ARG_3)
.annotate 'line', 6578

.end # warn_class_unknown

.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6586
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6588
    $P2 = __ARG_4.'isstring'()
    if $P2 goto __label_2
    $P2 = __ARG_4.'isidentifier'()
  __label_2:
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6589
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6590
    setattribute self, 'value', __ARG_4
.annotate 'line', 6591
    $P1 = __ARG_1.'get'()
.annotate 'line', 6593
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6594
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6596
    __ARG_1.'unget'($P1)
  __label_4: # endif
.annotate 'line', 6597

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6600
    getattribute $P1, self, 'value'
.annotate 'line', 6601
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6604
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6605
    isnull $I1, $P2
    not $I1
    box $P3, $I1
    unless $P3 goto __label_3
    $P3 = $P2.'isconst'()
  __label_3:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 6606
    $P1 = $P2.'getvalue'()
.annotate 'line', 6607
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 6608
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 6609
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 6612
    self.'optimize_initializer'()
.annotate 'line', 6613
    .return(self)
.annotate 'line', 6614

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 6617
    self.'annotate'(__ARG_1)
.annotate 'line', 6619
    getattribute $P1, self, 'initializer'
.annotate 'line', 6620
    getattribute $P2, self, 'value'
.annotate 'line', 6621
    $P8 = self.'numargs'()
    set $I1, $P8
.annotate 'line', 6624
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6625
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6627
    set $S1, ''
.annotate 'line', 6628
    set $S2, __ARG_2
.annotate 'line', 6629
    null $S3
.annotate 'line', 6630
    if $I1 == -1 goto __label_7
    if $I1 == 0 goto __label_8
    if $I1 == 1 goto __label_9
    goto __label_6
  __label_7: # case
  __label_8: # case
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 6635
    ne $I2, 1, __label_10
.annotate 'line', 6636
    not $I4, __ARG_3
    unless $I4 goto __label_12
.annotate 'line', 6637
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_12: # endif
    goto __label_11
  __label_10: # else
.annotate 'line', 6640
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 6641
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 6642
    concat $S5, ', ', $S1
    set $S1, $S5
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 6646
    eq $I2, 1, __label_13
.annotate 'line', 6647
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_13: # endif
.annotate 'line', 6648
    not $I3, __ARG_3
    unless $I3 goto __label_14
.annotate 'line', 6649
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_14: # endif
  __label_5: # switch end
.annotate 'line', 6652
    ne $S2, '', __label_15
.annotate 'line', 6653
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
.annotate 'line', 6655
    if $I2 == 0 goto __label_18
    if $I2 == 1 goto __label_19
    goto __label_17
  __label_18: # case
.annotate 'line', 6658
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
  __label_20:
.annotate 'line', 6659
    get_class $P4, $S4
.annotate 'line', 6660
    unless_null $P4, __label_21
.annotate 'line', 6661
    WSubId_83(__ARG_1, $S4, $P2)
  __label_21: # endif
.annotate 'line', 6665
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 6666
    le $I1, 1, __label_22
.annotate 'line', 6667
    __ARG_1.'say'($S2, ".'", $P2, "'()")
  __label_22: # endif
    goto __label_16 # break
  __label_19: # case
.annotate 'line', 6671
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 6672
    unless_null $P5, __label_23
.annotate 'line', 6673
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 6674
    if_null $P6, __label_25
.annotate 'line', 6675
    $P7 = $P6.'getpath'()
.annotate 'line', 6676
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
    goto __label_26
  __label_25: # else
.annotate 'line', 6679
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 6680
    if_null $P5, __label_27
.annotate 'line', 6681
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_28
  __label_27: # else
.annotate 'line', 6683
    $P9 = $P2.'getidentifier'()
    WSubId_83(__ARG_1, $P9, $P2)
.annotate 'line', 6684
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
  __label_28: # endif
  __label_26: # endif
.annotate 'line', 6687
    set $S3, $P2
    goto __label_24
  __label_23: # else
.annotate 'line', 6691
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
  __label_24: # endif
    goto __label_16 # break
  __label_17: # default
.annotate 'line', 6695
    WSubId_6('Unexpected type in new')
  __label_16: # switch end
.annotate 'line', 6697
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isge $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
  __label_31:
  __label_30:
    unless $I3 goto __label_29
.annotate 'line', 6698
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6699
    not $I3, __ARG_3
    unless $I3 goto __label_32
.annotate 'line', 6700
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_32: # endif
  __label_29: # endif
.annotate 'line', 6702

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6705
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
.annotate 'line', 6706

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6580
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6582
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6717
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6718
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6719
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6720
    setattribute self, 'nskey', $P1
.annotate 'line', 6721
    $P2 = __ARG_1.'get'()
.annotate 'line', 6722
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6723
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6725
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 6726

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6729
    null $S1
.annotate 'line', 6730
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
.annotate 'line', 6735
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6736
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6739
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_1: # switch end
.annotate 'line', 6741
    getattribute $P2, self, 'nskey'
.annotate 'line', 6743
    __ARG_1.'print'('    ')
.annotate 'line', 6744
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6745
    __ARG_1.'print'("root_")
  __label_6: # endif
.annotate 'line', 6746
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6747
    null $P3
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6748
    if_null $S1, __label_7
.annotate 'line', 6749
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
.annotate 'line', 6750
    __ARG_1.'say'()
.annotate 'line', 6751

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6711
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6713
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6762
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6763
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6764
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6765
    setattribute self, 'nskey', $P1
.annotate 'line', 6766
    $P2 = __ARG_1.'get'()
.annotate 'line', 6767
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6768
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6770
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 6771

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6774
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6775
    set $S1, __ARG_2
.annotate 'line', 6776
    le $I1, 0, __label_1
.annotate 'line', 6777
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 6778
    getattribute $P1, self, 'nskey'
.annotate 'line', 6780
    ne $S1, '', __label_2
.annotate 'line', 6781
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6783
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 6785
    lt $I1, 0, __label_3
.annotate 'line', 6786
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 6787
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6788
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 6790

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6756
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6758
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6797
    $P1 = __ARG_1.'get'()
.annotate 'line', 6800
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6804
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6807
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6802
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6803
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6802
    .return($P3)
  __label_4: # case
.annotate 'line', 6806
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6810
    $P2 = __ARG_1.'get'()
.annotate 'line', 6811
    __ARG_1.'unget'($P2)
.annotate 'line', 6812
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 6814
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6819
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
.annotate 'line', 6821

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_76 = "WSubId_76"
.annotate 'line', 6832
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6833
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6834
    $P2 = WSubId_76(__ARG_4, self)
    setattribute self, 'checked', $P2
.annotate 'line', 6835

.end # OpInstanceOfExpr


.sub 'optimize' :method
.annotate 'line', 6838
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6839
    .return(self)
.annotate 'line', 6840

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 6841
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 6844
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6845
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6846
    eq $S1, 'P', __label_2
.annotate 'line', 6847
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6848
    getattribute $P2, self, 'checked'
.annotate 'line', 6850
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6851
    self.'annotate'(__ARG_1)
.annotate 'line', 6852
    __ARG_1.'print'('    isa ', __ARG_2, ', ', $S2, ', ')
.annotate 'line', 6853
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6854
    __ARG_1.'say'()
.annotate 'line', 6855

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6825
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6827
    addattribute $P0, 'lexpr'
.annotate 'line', 6828
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 6868
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6869
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6870
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6871
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6872
    .return(self)
.annotate 'line', 6873

.end # OpConditionalExpr


.sub 'optimize' :method
.annotate 'line', 6876
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 6877
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6879
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6881
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6883
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6884
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6885
    .return(self)
  __label_1: # switch end
.annotate 'line', 6887

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 6890
    getattribute $P1, self, 'etrue'
.annotate 'line', 6891
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6892
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6894
    .tailcall $P1.'checkresult'()
  __label_2: # endif
.annotate 'line', 6895

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6898
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 6899
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 6900
    getattribute $P4, self, 'condition'
    $P4.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6901
    getattribute $P1, self, 'etrue'
.annotate 'line', 6902
    $P4 = self.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
.annotate 'line', 6903
    $P4 = $P1.'isnull'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6904
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6906
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6907
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6908
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6909
    getattribute $P2, self, 'efalse'
.annotate 'line', 6910
    $P4 = $P2.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 6911
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
.annotate 'line', 6913
    $P5 = $P2.'checkresult'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
  __label_8:
.annotate 'line', 6914
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 6915
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 6916
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 6920
    ne $S4, 'P', __label_13
.annotate 'line', 6921
    $P3 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 6922
    __ARG_1.'emitset'(__ARG_2, $P3)
    goto __label_14
  __label_13: # else
.annotate 'line', 6925
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
  __label_10: # endif
  __label_7: # endif
.annotate 'line', 6928
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 6929

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6860
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6862
    addattribute $P0, 'condition'
.annotate 'line', 6863
    addattribute $P0, 'etrue'
.annotate 'line', 6864
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getOpCode_2' :subid('WSubId_86')
        .param pmc __ARG_1
.annotate 'line', 6974
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '(' goto __label_3
    if $S1 == '[' goto __label_4
    if $S1 == '.' goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6975
    .return(1)
  __label_4: # case
.annotate 'line', 6976
    .return(2)
  __label_5: # case
.annotate 'line', 6977
    .return(3)
  __label_2: # default
.annotate 'line', 6978
    .return(0)
  __label_1: # switch end
.annotate 'line', 6980

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_88')
        .param pmc __ARG_1
.annotate 'line', 6984
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '-' goto __label_3
    if $S1 == '!' goto __label_4
    if $S1 == '~' goto __label_5
    if $S1 == '++' goto __label_6
    if $S1 == '--' goto __label_7
    goto __label_2
  __label_3: # case
.annotate 'line', 6985
    .return(8)
  __label_4: # case
.annotate 'line', 6986
    .return(11)
  __label_5: # case
.annotate 'line', 6987
    .return(33)
  __label_6: # case
.annotate 'line', 6988
    .return(9)
  __label_7: # case
.annotate 'line', 6989
    .return(10)
  __label_2: # default
.annotate 'line', 6991
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(31)
    goto __label_9
  __label_8: # else
.annotate 'line', 6992
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(32)
    goto __label_11
  __label_10: # else
.annotate 'line', 6993
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_1: # switch end
.annotate 'line', 6995

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_91')
        .param pmc __ARG_1
.annotate 'line', 6999
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '*' goto __label_3
    if $S1 == '/' goto __label_4
    if $S1 == '%' goto __label_5
    if $S1 == '%%' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 7000
    .return(19)
  __label_4: # case
.annotate 'line', 7001
    .return(20)
  __label_5: # case
.annotate 'line', 7002
    .return(21)
  __label_6: # case
.annotate 'line', 7003
    .return(22)
  __label_2: # default
.annotate 'line', 7004
    .return(0)
  __label_1: # switch end
.annotate 'line', 7006

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_94')
        .param pmc __ARG_1
.annotate 'line', 7010
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<<' goto __label_3
    if $S1 == '>>' goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7011
    .return(28)
  __label_4: # case
.annotate 'line', 7012
    .return(29)
  __label_2: # default
.annotate 'line', 7013
    .return(0)
  __label_1: # switch end
.annotate 'line', 7015

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_96')
        .param pmc __ARG_1
.annotate 'line', 7019
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<' goto __label_3
    if $S1 == '>' goto __label_4
    if $S1 == '<=' goto __label_5
    if $S1 == '>=' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 7020
    .return(14)
  __label_4: # case
.annotate 'line', 7021
    .return(16)
  __label_5: # case
.annotate 'line', 7022
    .return(15)
  __label_6: # case
.annotate 'line', 7023
    .return(17)
  __label_2: # default
.annotate 'line', 7025
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 7026
    .return(0)
  __label_8: # endif
  __label_1: # switch end
.annotate 'line', 7028

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_98')
        .param pmc __ARG_1
.annotate 'line', 7032
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '==' goto __label_3
    if $S1 == '!=' goto __label_4
    if $S1 == '===' goto __label_5
    if $S1 == '!==' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 7033
    .return(12)
  __label_4: # case
.annotate 'line', 7034
    .return(13)
  __label_5: # case
.annotate 'line', 7035
    .return(25)
  __label_6: # case
.annotate 'line', 7036
    .return(26)
  __label_2: # default
.annotate 'line', 7037
    .return(0)
  __label_1: # switch end
.annotate 'line', 7039

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_107')
        .param pmc __ARG_1
.annotate 'line', 7043
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
.annotate 'line', 7044
    .return(4)
  __label_4: # case
.annotate 'line', 7045
    .return(5)
  __label_5: # case
.annotate 'line', 7046
    .return(6)
  __label_6: # case
.annotate 'line', 7047
    .return(18)
  __label_7: # case
.annotate 'line', 7048
    .return(23)
  __label_8: # case
.annotate 'line', 7049
    .return(24)
  __label_9: # case
.annotate 'line', 7050
    .return(30)
  __label_2: # default
.annotate 'line', 7051
    .return(0)
  __label_1: # switch end
.annotate 'line', 7053

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 7057
    $P1 = __ARG_1.'get'()
.annotate 'line', 7058
    null $P2
.annotate 'line', 7061
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7065
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7067
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 7069
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 7071
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 7073
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 7075
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 7077
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 7079
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 7081
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 7083
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 7062
    $P2 = WSubId_51(__ARG_1, __ARG_2)
.annotate 'line', 7063
    WSubId_68(')', __ARG_1)
.annotate 'line', 7064
    .return($P2)
  __label_4: # case
.annotate 'line', 7066
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 7068
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 7070
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 7072
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_25(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 7074
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 7076
    .tailcall WSubId_84(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 7078
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 7080
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 7082
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 7084
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 7086
    WSubId_54('expression', $P1)
  __label_1: # switch end
.annotate 'line', 7088

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7092
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 7093
    null $P2
.annotate 'line', 7094
    null $P3
.annotate 'line', 7095
    null $I1
  __label_2: # while
.annotate 'line', 7096
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_86($P2)
    set $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 7097
    if $I1 == 1 goto __label_5
    if $I1 == 2 goto __label_6
    if $I1 == 3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 7099
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7102
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7105
    set $P3, $P2
.annotate 'line', 7106
    $P2 = __ARG_1.'get'()
.annotate 'line', 7107
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 7108
    $P4 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 7109
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
    goto __label_9
  __label_8: # else
.annotate 'line', 7112
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7115
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7118
    __ARG_1.'unget'($P2)
.annotate 'line', 7119
    .return($P1)
.annotate 'line', 7120

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.annotate 'line', 7124
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 7125
    $P2 = __ARG_1.'get'()
.annotate 'line', 7127
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 7129
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7128
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 7130
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 7132
    __ARG_1.'unget'($P2)
.annotate 'line', 7133
    .return($P1)
  __label_1: # switch end
.annotate 'line', 7135

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_90 = "WSubId_90"
.annotate 'line', 7139
    $P1 = __ARG_1.'get'()
.annotate 'line', 7140
    $P3 = WSubId_88($P1)
    set $I1, $P3
.annotate 'line', 7141
    unless $I1 goto __label_1
.annotate 'line', 7142
    $P2 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7143
    if $I1 == 8 goto __label_5
    if $I1 == 11 goto __label_6
    if $I1 == 33 goto __label_7
    if $I1 == 9 goto __label_8
    if $I1 == 10 goto __label_9
    if $I1 == 31 goto __label_10
    if $I1 == 32 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 7145
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 7147
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 7149
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 7151
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 7153
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 7155
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 7157
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_4: # default
.annotate 'line', 7159
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
    goto __label_2
  __label_1: # else
.annotate 'line', 7163
    __ARG_1.'unget'($P1)
.annotate 'line', 7164
    .tailcall WSubId_90(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 7166

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7170
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7171
    null $P2
.annotate 'line', 7172
    null $I1
  __label_2: # while
.annotate 'line', 7173
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_91($P2)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7174
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7175
    if $I1 == 19 goto __label_5
    if $I1 == 20 goto __label_6
    if $I1 == 21 goto __label_7
    if $I1 == 22 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 7177
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7180
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7183
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7186
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7189
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7192
    __ARG_1.'unget'($P2)
.annotate 'line', 7193
    .return($P1)
.annotate 'line', 7194

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 7198
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7199
    null $P2
  __label_2: # while
.annotate 'line', 7200
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('+')
    if $P5 goto __label_3
    $P5 = $P2.'isop'('-')
  __label_3:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7201
    $P3 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7202
    null $P4
.annotate 'line', 7203
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7204
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 7206
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 7207
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7209
    __ARG_1.'unget'($P2)
.annotate 'line', 7210
    .return($P1)
.annotate 'line', 7211

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7215
    $P1 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7216
    null $P2
.annotate 'line', 7217
    null $P3
.annotate 'line', 7218
    null $I1
  __label_2: # while
.annotate 'line', 7219
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_94($P3)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7220
    if $I1 == 28 goto __label_5
    if $I1 == 29 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 7222
    $P2 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7223
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7226
    $P2 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7227
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7230
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7233
    __ARG_1.'unget'($P3)
.annotate 'line', 7234
    .return($P1)
.annotate 'line', 7235

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7239
    $P1 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7240
    null $P2
.annotate 'line', 7241
    null $P3
.annotate 'line', 7242
    null $I1
  __label_2: # while
.annotate 'line', 7243
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_96($P3)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7244
    if $I1 == 14 goto __label_5
    if $I1 == 16 goto __label_6
    if $I1 == 15 goto __label_7
    if $I1 == 17 goto __label_8
    if $I1 == 27 goto __label_9
    goto __label_4
  __label_5: # case
.annotate 'line', 7246
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7247
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7250
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7251
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7254
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7255
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7258
    $P2 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7259
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7262
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7265
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7268
    __ARG_1.'unget'($P3)
.annotate 'line', 7269
    .return($P1)
.annotate 'line', 7270

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7274
    $P1 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7275
    null $P2
.annotate 'line', 7276
    null $P3
.annotate 'line', 7277
    null $I1
  __label_2: # while
.annotate 'line', 7278
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_98($P3)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7279
    if $I1 == 12 goto __label_5
    if $I1 == 13 goto __label_6
    if $I1 == 25 goto __label_7
    if $I1 == 26 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 7281
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7282
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7285
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7286
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7289
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7290
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7293
    $P2 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7294
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7297
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7300
    __ARG_1.'unget'($P3)
.annotate 'line', 7301
    .return($P1)
.annotate 'line', 7302

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_99 = "WSubId_99"
.annotate 'line', 7306
    $P1 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7307
    null $P2
  __label_2: # while
.annotate 'line', 7308
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7309
    $P3 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7310
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7312
    __ARG_1.'unget'($P2)
.annotate 'line', 7313
    .return($P1)
.annotate 'line', 7314

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_100 = "WSubId_100"
.annotate 'line', 7318
    $P1 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7319
    null $P2
  __label_2: # while
.annotate 'line', 7320
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7321
    $P3 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7322
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7324
    __ARG_1.'unget'($P2)
.annotate 'line', 7325
    .return($P1)
.annotate 'line', 7326

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_101 = "WSubId_101"
.annotate 'line', 7330
    $P1 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7331
    null $P2
  __label_2: # while
.annotate 'line', 7332
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7333
    $P3 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7334
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7336
    __ARG_1.'unget'($P2)
.annotate 'line', 7337
    .return($P1)
.annotate 'line', 7338

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_102 = "WSubId_102"
.annotate 'line', 7342
    $P1 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7343
    null $P2
  __label_2: # while
.annotate 'line', 7344
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7345
    $P3 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7346
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7348
    __ARG_1.'unget'($P2)
.annotate 'line', 7349
    .return($P1)
.annotate 'line', 7350

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_102 = "WSubId_102"
.annotate 'line', 7354
    $P1 = WSubId_103(__ARG_1, __ARG_2)
.annotate 'line', 7355
    null $P2
  __label_2: # while
.annotate 'line', 7356
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7357
    $P3 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7358
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7360
    __ARG_1.'unget'($P2)
.annotate 'line', 7361
    .return($P1)
.annotate 'line', 7362

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 7366
    $P1 = WSubId_104(__ARG_1, __ARG_2)
.annotate 'line', 7367
    $P2 = __ARG_1.'get'()
.annotate 'line', 7368
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7369
    $P3 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7370
    WSubId_68(':', __ARG_1)
.annotate 'line', 7371
    $P4 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7372
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 7375
    __ARG_1.'unget'($P2)
.annotate 'line', 7376
    .return($P1)
  __label_2: # endif
.annotate 'line', 7378

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7382
    $P1 = WSubId_106(__ARG_1, __ARG_2)
.annotate 'line', 7383
    null $P2
.annotate 'line', 7384
    null $I1
  __label_2: # while
.annotate 'line', 7385
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_107($P2)
    set $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 7386
    $P3 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7387
    null $P4
.annotate 'line', 7388
    if $I1 == 4 goto __label_5
    if $I1 == 5 goto __label_6
    if $I1 == 6 goto __label_7
    if $I1 == 18 goto __label_8
    if $I1 == 23 goto __label_9
    if $I1 == 24 goto __label_10
    if $I1 == 30 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 7390
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7393
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7396
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7399
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7402
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 7405
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 7408
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7411
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 7413
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7414
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7416
    __ARG_1.'unget'($P2)
.annotate 'line', 7417
    .return($P1)
.annotate 'line', 7418

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_105 = "WSubId_105"
.annotate 'line', 7422
    .tailcall WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7423

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7438
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7439
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7440
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7441
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7442
    .return($S1)
.annotate 'line', 7443

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7446
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7447
    unless_null $P1, __label_1
.annotate 'line', 7448
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7449
    .return($P1)
.annotate 'line', 7450

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7434
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7459
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7460
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7461
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7462
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7463
    .return($S1)
.annotate 'line', 7464

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 7467
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7468
    unless_null $P1, __label_1
.annotate 'line', 7469
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7470
    .return($P1)
.annotate 'line', 7471

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7453
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7455
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7487
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7488
    $P1 = __ARG_2.'get'()
.annotate 'line', 7489
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7490
    __ARG_2.'unget'($P1)
.annotate 'line', 7491
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 7493

.end # parse


.sub 'optimize' :method
.annotate 'line', 7496
    getattribute $P1, self, 'values'
.annotate 'line', 7497
    if_null $P1, __label_1
.annotate 'line', 7498
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7499
    .return(self)
.annotate 'line', 7500

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7504
    getattribute $P1, self, 'values'
.annotate 'line', 7505
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7508
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
.annotate 'line', 7509
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7510
    $P3 = $P2.'cantailcall'()
    unless $P3 goto __label_6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'allowtailcall'()
  __label_6:
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 7511
    self.'annotate'(__ARG_1)
.annotate 'line', 7512
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 7516
    le $I1, 0, __label_7
.annotate 'line', 7517
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7519
    self.'annotate'(__ARG_1)
.annotate 'line', 7520
    self.'emitret'(__ARG_1)
.annotate 'line', 7521
    le $I1, 0, __label_8
.annotate 'line', 7522
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 7523
    __ARG_1.'say'(')')
.annotate 'line', 7524

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7481
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7483
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7531
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 7532

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 7535
    __ARG_1.'print'('    ', '.return(')
.annotate 'line', 7536

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7527
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7543
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 7544

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 7547
    __ARG_1.'print'('    ', '.yield(')
.annotate 'line', 7548

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7539
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 7561
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7562
    setattribute self, 'name', __ARG_1
.annotate 'line', 7563
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
.annotate 'line', 7564

.end # LabelStatement


.sub 'optimize' :method
.annotate 'line', 7565
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7568
    self.'annotate'(__ARG_1)
.annotate 'line', 7569
    getattribute $P1, self, 'value'
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
.annotate 'line', 7570

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7555
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7557
    addattribute $P0, 'name'
.annotate 'line', 7558
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7584
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7585
    box $P1, __ARG_2
    setattribute self, 'label', $P1
.annotate 'line', 7586

.end # Reflabel


.sub 'optimize' :method
.annotate 'line', 7587
    .return(self)

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 7590
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7591
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7592
    .return($S2)
.annotate 'line', 7593

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7579
    addattribute $P0, 'owner'
.annotate 'line', 7580
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 7606
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7607
    $P1 = __ARG_2.'get'()
.annotate 'line', 7608
    WSubId_108($P1)
.annotate 'line', 7609
    setattribute self, 'label', $P1
.annotate 'line', 7610
    WSubId_68(';', __ARG_2)
.annotate 'line', 7611

.end # GotoStatement


.sub 'optimize' :method
.annotate 'line', 7612
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7615
    self.'annotate'(__ARG_1)
.annotate 'line', 7616
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7617
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7618
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
.annotate 'line', 7619

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7600
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7602
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 7630
    $P1 = WSubId_51(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7631

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 7634
    WSubId_68('(', __ARG_1)
.annotate 'line', 7635
    $P1 = WSubId_51(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7636
    WSubId_68(')', __ARG_1)
.annotate 'line', 7637

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7626
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
.annotate 'line', 7650
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7651
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7652
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7653
    $P1 = __ARG_2.'get'()
.annotate 'line', 7654
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7655
    $P4 = WSubId_109(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7657
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7658
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7660

.end # IfStatement


.sub 'optimize' :method
.annotate 'line', 7663
    self.'optimize_condition'()
.annotate 'line', 7664
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7665
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 7666
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7668
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7670
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7672
    .return(self)
.annotate 'line', 7673

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7676
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7677
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7678
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7679
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7680
    set $S1, ''
.annotate 'line', 7681
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7682
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7683
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7684
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7685
    self.'annotate'(__ARG_1)
.annotate 'line', 7686
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7687
    $P1.'emit'(__ARG_1)
.annotate 'line', 7689
    not $I3, $I2
    unless $I3 goto __label_5
.annotate 'line', 7690
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7691
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7692
    $P2.'emit'(__ARG_1)
  __label_5: # endif
.annotate 'line', 7694
    __ARG_1.'emitlabel'($S2, 'endif')
.annotate 'line', 7695

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7644
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7646
    addattribute $P0, 'truebranch'
.annotate 'line', 7647
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
.annotate 'line', 7707
    $P2 = WSubId_109(__ARG_1, self)
    setattribute self, 'body', $P2
.annotate 'line', 7708

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
.annotate 'line', 7711
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7712
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7714
    self.'annotate'(__ARG_1)
.annotate 'line', 7715
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7716
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7717
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7718
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
.annotate 'line', 7719

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7702
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7704
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7730
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7731
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7732
    self.'parsebody'(__ARG_2)
.annotate 'line', 7733

.end # WhileStatement


.sub 'optimize' :method
.annotate 'line', 7736
    self.'optimize_condition'()
.annotate 'line', 7737
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7738
    .return(self)
.annotate 'line', 7739

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7742
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7744
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7747
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 7748
    __ARG_1.'comment'('while(false) optimized out')
  __label_5: # endif
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7751
    $P3 = self.'genbreaklabel'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7752
    $P4 = self.'gencontinuelabel'()
    null $S2
    if_null $P4, __label_7
    set $S2, $P4
  __label_7:
.annotate 'line', 7754
    self.'annotate'(__ARG_1)
.annotate 'line', 7755
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7756
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7757
    getattribute $P5, self, 'body'
    $P5.'emit'(__ARG_1)
.annotate 'line', 7758
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7759
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
.annotate 'line', 7761

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7726
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
.annotate 'line', 7772
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7773
    self.'parsebody'(__ARG_2)
.annotate 'line', 7774
    WSubId_110('while', __ARG_2)
.annotate 'line', 7775
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7776

.end # DoStatement


.sub 'optimize' :method
.annotate 'line', 7779
    self.'optimize_condition'()
.annotate 'line', 7780
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7781
    $P2 = $P1.'isempty'()
    unless $P2 goto __label_2
    $P3 = self.'getvalue'()
    set $I2, $P3
    iseq $I1, $I2, 2
    box $P2, $I1
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7782
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 7783
    setattribute self, 'body', $P1
.annotate 'line', 7784
    .return(self)
.annotate 'line', 7785

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7788
    getattribute $P1, self, 'body'
.annotate 'line', 7789
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 7790
    if $I1 == 1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7792
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7795
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7796
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7797
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7799
    self.'annotate'(__ARG_1)
.annotate 'line', 7800
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7802
    $P1.'emit'(__ARG_1)
.annotate 'line', 7803
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7804
    eq $I1, 2, __label_7
.annotate 'line', 7805
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7806
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
.annotate 'line', 7808

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7768
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
.annotate 'line', 7819
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7820
    WSubId_68(';', __ARG_2)
.annotate 'line', 7821

.end # ContinueStatement


.sub 'optimize' :method
.annotate 'line', 7822
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7825
    self.'annotate'(__ARG_1)
.annotate 'line', 7826
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7827
    __ARG_1.'emitgoto'($S1, 'continue')
.annotate 'line', 7828

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7815
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 7839
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7840
    WSubId_68(';', __ARG_2)
.annotate 'line', 7841

.end # BreakStatement


.sub 'optimize' :method
.annotate 'line', 7842
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7845
    self.'annotate'(__ARG_1)
.annotate 'line', 7846
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7847
    __ARG_1.'emitgoto'($S1, 'break')
.annotate 'line', 7848

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7835
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 7863
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7864
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7865
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7866
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
.annotate 'line', 7867

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_109 = "WSubId_109"
.annotate 'line', 7870
    null $P1
  __label_2: # while
.annotate 'line', 7871
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'iskeyword'('case')
    if $P3 goto __label_3
    $P3 = $P1.'iskeyword'('default')
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7872
    $P4 = $P1.'iskeyword'('case')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 7873
    getattribute $P5, self, 'case_value'
    $P6 = WSubId_51(__ARG_1, self)
    push $P5, $P6
.annotate 'line', 7874
    $P1 = __ARG_1.'get'()
.annotate 'line', 7875
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7876
    WSubId_54("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7877
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7878
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
.annotate 'line', 7879
    __ARG_1.'unget'($P1)
.annotate 'line', 7880
    $P3 = WSubId_109(__ARG_1, self)
    push $P2, $P3
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7882
    getattribute $P3, self, 'case_st'
    push $P3, $P2
.annotate 'line', 7883
    __ARG_1.'unget'($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7886
    $P1 = __ARG_1.'get'()
.annotate 'line', 7887
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7888
    WSubId_54("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7889
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
.annotate 'line', 7890
    __ARG_1.'unget'($P1)
.annotate 'line', 7891
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_109(__ARG_1, self)
    push $P3, $P4
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7893
    __ARG_1.'unget'($P1)
  __label_5: # endif
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7896
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7897
    WSubId_54("'}' in switch", $P1)
  __label_16: # endif
.annotate 'line', 7898

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_111 = "WSubId_111"
.annotate 'line', 7901
    getattribute $P1, self, 'case_value'
    WSubId_52($P1)
.annotate 'line', 7902
    getattribute $P1, self, 'case_st'
    WSubId_111($P1, WSubId_52)
.annotate 'line', 7903
    getattribute $P1, self, 'default_st'
    WSubId_52($P1)
.annotate 'line', 7904

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7855
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7857
    addattribute $P0, 'case_value'
.annotate 'line', 7858
    addattribute $P0, 'case_st'
.annotate 'line', 7859
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 7917
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7918
    $P3 = WSubId_51(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7919
    $P1 = __ARG_2.'get'()
.annotate 'line', 7920
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7921
    WSubId_54("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7922
    $P1 = __ARG_2.'get'()
.annotate 'line', 7923
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7924
    WSubId_54("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7925
    self.'parse_cases'(__ARG_2)
.annotate 'line', 7926

.end # SwitchStatement


.sub 'optimize' :method
.annotate 'line', 7929
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7930
    self.'optimize_cases'()
.annotate 'line', 7931
    .return(self)
.annotate 'line', 7932

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 7936
    set $S1, ''
.annotate 'line', 7937
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
.annotate 'line', 7938
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7939
    ne $S2, 'N', __label_4
.annotate 'line', 7940
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7941
    ne $S1, '', __label_5
.annotate 'line', 7942
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7943
    eq $S1, $S2, __label_7
.annotate 'line', 7944
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7947
    getattribute $P2, self, 'condition'
.annotate 'line', 7948
    $P3 = $P2.'checkresult'()
.annotate 'line', 7952
    ne $S1, '', __label_8
.annotate 'line', 7953
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7955
    $P7 = __ARG_1.'getDebug'()
    if_null $P7, __label_9
    unless $P7 goto __label_9
.annotate 'line', 7956
    __ARG_1.'comment'('switch')
  __label_9: # endif
.annotate 'line', 7957
    null $S3
.annotate 'line', 7958
    set $S9, $P3
    ne $S9, $S1, __label_10
.annotate 'line', 7959
    $P7 = $P2.'emit_get'(__ARG_1)
    set $S3, $P7
    goto __label_11
  __label_10: # else
.annotate 'line', 7961
    $P9 = self.'tempreg'($S1)
    set $S3, $P9
.annotate 'line', 7962
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7963
    __ARG_1.'emitset'($S3, $S4)
  __label_11: # endif
.annotate 'line', 7967
    self.'genbreaklabel'()
.annotate 'line', 7968
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7969
    new $P4, ['ResizableStringArray']
.annotate 'line', 7970
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7971
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
.annotate 'line', 7972
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7973
    push $P4, $S7
.annotate 'line', 7974
    null $S8
.annotate 'line', 7975
    ne $S1, 'I', __label_18
.annotate 'line', 7976
    $P7 = $P5.'emit_getint'(__ARG_1)
    set $S8, $P7
    goto __label_19
  __label_18: # else
.annotate 'line', 7977
    $P9 = $P5.'checkresult'()
    set $S9, $P9
    ne $S1, $S9, __label_20
.annotate 'line', 7978
    $P11 = $P5.'emit_get'(__ARG_1)
    set $S8, $P11
    goto __label_21
  __label_20: # else
.annotate 'line', 7980
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7981
    set $S8, $S6
  __label_21: # endif
  __label_19: # endif
.annotate 'line', 7983
    $P7 = WSubId_26("    if %0 == %1 goto %2", $S3, $S8, $S7)
    __ARG_1.'say'($P7)
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7985
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7988
    self.'annotate'(__ARG_1)
.annotate 'line', 7989
    getattribute $P6, self, 'case_st'
.annotate 'line', 7990
    set $I1, $P6
.annotate 'line', 7991
    null $I2
  __label_24: # for condition
    ge $I2, $I1, __label_23
.annotate 'line', 7992
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7993
    $P7 = $P6[$I2]
    WSubId_66(__ARG_1, $P7)
  __label_22: # for iteration
.annotate 'line', 7991
    inc $I2
    goto __label_24
  __label_23: # for end
.annotate 'line', 7996
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7997
    getattribute $P7, self, 'default_st'
    WSubId_66(__ARG_1, $P7)
.annotate 'line', 7999
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
.annotate 'line', 8000

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7911
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7913
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8012
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8013
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8014

.end # SwitchCaseStatement


.sub 'optimize' :method
.annotate 'line', 8017
    self.'optimize_cases'()
.annotate 'line', 8018
    .return(self)
.annotate 'line', 8019

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 8023
    self.'genbreaklabel'()
.annotate 'line', 8024
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8025
    new $P1, ['ResizableStringArray']
.annotate 'line', 8027
    $P4 = __ARG_1.'getDebug'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 8028
    __ARG_1.'comment'('switch-case')
  __label_2: # endif
.annotate 'line', 8029
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8030
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_5
    iter $P5, $P4
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P2, $P5
.annotate 'line', 8031
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_6
    set $S3, $P6
  __label_6:
.annotate 'line', 8032
    push $P1, $S3
.annotate 'line', 8033
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 8034
    __ARG_1.'emitif'($S2, $S3)
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8036
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 8039
    self.'annotate'(__ARG_1)
.annotate 'line', 8040
    getattribute $P3, self, 'case_st'
.annotate 'line', 8041
    set $I1, $P3
.annotate 'line', 8042
    null $I2
  __label_9: # for condition
    ge $I2, $I1, __label_8
.annotate 'line', 8043
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 8044
    $P4 = $P3[$I2]
    WSubId_66(__ARG_1, $P4)
  __label_7: # for iteration
.annotate 'line', 8042
    inc $I2
    goto __label_9
  __label_8: # for end
.annotate 'line', 8047
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 8048
    getattribute $P4, self, 'default_st'
    WSubId_66(__ARG_1, $P4)
.annotate 'line', 8050
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
.annotate 'line', 8051

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 8007
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.annotate 'line', 8058
    $P1 = __ARG_2.'get'()
.annotate 'line', 8059
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8060
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8061
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8062
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8063
    WSubId_54("'(' in switch", $P1)
.annotate 'line', 8064

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 8077
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8078
    $P1 = __ARG_2.'get'()
.annotate 'line', 8079
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8080
    __ARG_2.'unget'($P1)
.annotate 'line', 8081
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 8083
    $P1 = __ARG_2.'get'()
.annotate 'line', 8084
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 8085
    __ARG_2.'unget'($P1)
.annotate 'line', 8086
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 8087
    WSubId_68(';', __ARG_2)
  __label_2: # endif
.annotate 'line', 8089
    $P1 = __ARG_2.'get'()
.annotate 'line', 8090
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 8091
    __ARG_2.'unget'($P1)
.annotate 'line', 8092
    $P3 = WSubId_51(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 8093
    WSubId_68(')', __ARG_2)
  __label_3: # endif
.annotate 'line', 8095
    self.'parsebody'(__ARG_2)
.annotate 'line', 8096

.end # ForStatement


.sub 'optimize' :method
.annotate 'line', 8099
    getattribute $P1, self, 'initializer'
.annotate 'line', 8100
    if_null $P1, __label_1
.annotate 'line', 8101
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 8102
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
.annotate 'line', 8103
    self.'optimize_condition'()
.annotate 'line', 8104
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
.annotate 'line', 8105
    if_null $P1, __label_4
.annotate 'line', 8106
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8108
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 8111
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 8112
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 8113
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8114
    .return(self)
.annotate 'line', 8115

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8118
    getattribute $P1, self, 'iteration'
    isnull $I1, $P1
    not $I1
.annotate 'line', 8119
    getattribute $P1, self, 'initializer'
    isnull $I2, $P1
    unless $I2 goto __label_3
.annotate 'line', 8120
    getattribute $P2, self, 'condexpr'
    isnull $I2, $P2
  __label_3:
    unless $I2 goto __label_2
.annotate 'line', 8121
    not $I2, $I1
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 8122
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 8123
    .return()
  __label_1: # endif
.annotate 'line', 8125
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
.annotate 'line', 8126
    __ARG_1.'comment'('for loop')
  __label_4: # endif
.annotate 'line', 8127
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_5
    set $S1, $P1
  __label_5:
.annotate 'line', 8128
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_6
    set $S2, $P1
  __label_6:
.annotate 'line', 8129
    unless $I1 goto __label_8
.annotate 'line', 8130
    $P1 = self.'genlabel'()
    set $S3, $P1
    goto __label_7
  __label_8:
.annotate 'line', 8131
    set $S3, $S1
  __label_7:
.annotate 'line', 8132
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_9
.annotate 'line', 8133
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_9: # endif
.annotate 'line', 8135
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 8136
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_10
.annotate 'line', 8137
    self.'emit_else'(__ARG_1, $S2)
  __label_10: # endif
.annotate 'line', 8139
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8140
    unless $I1 goto __label_11
.annotate 'line', 8141
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 8142
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_12
.annotate 'line', 8143
    getattribute $P2, self, 'iteration'
    $P2.'emit_void'(__ARG_1)
  __label_12: # endif
  __label_11: # endif
.annotate 'line', 8145
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8147
    __ARG_1.'emitlabel'($S2, 'for end')
.annotate 'line', 8148

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8070
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 8072
    addattribute $P0, 'initializer'
.annotate 'line', 8073
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
.annotate 'line', 8163
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8164
    null $S1
    if_null __ARG_4, __label_1
    set $S1, __ARG_4
  __label_1:
.annotate 'line', 8165
    eq __ARG_5, '', __label_2
.annotate 'line', 8166
    $P1 = WSubId_112(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 8167
    self.'createvar'($S1, $S2)
.annotate 'line', 8168
    box $P1, $S2
    setattribute self, 'deftype', $P1
  __label_2: # endif
.annotate 'line', 8170
    setattribute self, 'varname', __ARG_4
.annotate 'line', 8171
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 8172
    WSubId_68(')', __ARG_2)
.annotate 'line', 8173
    self.'parsebody'(__ARG_2)
.annotate 'line', 8174

.end # ForeachStatement


.sub 'optimize' :method
.annotate 'line', 8177
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 8181
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
.annotate 'line', 8182
    $P2 = $P1.'isstringliteral'()
    unless $P2 goto __label_3
.annotate 'line', 8183
    $P3 = $P1.'get_value'()
    set $S1, $P3
    length $I2, $S1
    iseq $I1, $I2, 0
    box $P2, $I1
  __label_3:
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8184
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8186
    setattribute self, 'container', $P1
.annotate 'line', 8187
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8188
    .return(self)
.annotate 'line', 8189

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_75 = "WSubId_75"
.annotate 'line', 8192
    self.'annotate'(__ARG_1)
.annotate 'line', 8193
    null $S1
.annotate 'line', 8194
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
.annotate 'line', 8195
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8196
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 8197
    __ARG_1.'emitbox'($S1, $S2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8200
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 8202
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 8203
    unless_null $P1, __label_4
.annotate 'line', 8204
    getattribute $P2, self, 'varname'
    WSubId_75($P2)
  __label_4: # endif
.annotate 'line', 8206
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 8207
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 8208
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 8209
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 8210
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 8211
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 8212
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 8213
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 8214
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 8215
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 8216
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8217
    __ARG_1.'emitlabel'($S5, 'endfor')
.annotate 'line', 8218

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8155
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8157
    addattribute $P0, 'deftype'
.annotate 'line', 8158
    addattribute $P0, 'varname'
.annotate 'line', 8159
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8225
    WSubId_68('(', __ARG_2)
.annotate 'line', 8226
    $P1 = __ARG_2.'get'()
.annotate 'line', 8227
    $P2 = __ARG_2.'get'()
.annotate 'line', 8228
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 8229
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 8231
    $P3 = __ARG_2.'get'()
.annotate 'line', 8232
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8233
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 8234
    __ARG_2.'unget'($P3)
.annotate 'line', 8235
    __ARG_2.'unget'($P2)
.annotate 'line', 8236
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8238
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 8239

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_51 = "WSubId_51"
.annotate 'line', 8251
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8252
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'excep', $P2
.annotate 'line', 8253

.end # ThrowStatement


.sub 'optimize' :method
.annotate 'line', 8256
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 8257
    .return(self)
.annotate 'line', 8258

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8261
    getattribute $P1, self, 'excep'
.annotate 'line', 8262
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8263
    self.'annotate'(__ARG_1)
.annotate 'line', 8264
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    if $S3 == 'P' goto __label_4
    if $S3 == 'S' goto __label_5
    goto __label_3
  __label_4: # case
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 8270
    set $S2, $S1
.annotate 'line', 8271
    $P3 = self.'tempreg'('P')
    set $S1, $P3
.annotate 'line', 8272
    $P4 = WSubId_26("    root_new %0, ['parrot';'Exception']\n    %0['message'] = %1\n", $S1, $S2)
    __ARG_1.'print'($P4)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 8280
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
.annotate 'line', 8282
    __ARG_1.'emitarg1'('throw', $S1)
.annotate 'line', 8283

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 8245
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8247
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8295
    setattribute self, 'start', __ARG_1
.annotate 'line', 8296
    self.'ModifierList'(__ARG_2, __ARG_3)
.annotate 'line', 8297

.end # TryModifierList


.sub 'allowtailcall' :method
.annotate 'line', 8300
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 8301

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8304
    $P1 = self.'getlist'()
.annotate 'line', 8305
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
.annotate 'line', 8306
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 8307
    $P7 = $P2.'numargs'()
    set $I1, $P7
.annotate 'line', 8308
    if $S1 == 'min_severity' goto __label_6
    if $S1 == 'max_severity' goto __label_7
    if $S1 == 'handle_types' goto __label_8
    if $S1 == 'handle_types_except' goto __label_9
    if $S1 == 'allowtailcall' goto __label_10
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 8311
    eq $I1, 1, __label_11
.annotate 'line', 8312
    WSubId_1('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 8313
    $P3 = $P2.'getarg'(0)
.annotate 'line', 8315
    $P8 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 8314
    $P7 = WSubId_26("    %0.'%1'(%2)", __ARG_2, $S1, $P8)
    __ARG_1.'say'($P7)
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 8319
    new $P4, ['ResizableStringArray']
.annotate 'line', 8320
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
.annotate 'line', 8321
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 8322
    $P7 = $P5.'emit_get'(__ARG_1)
    push $P4, $P7
  __label_12: # for iteration
.annotate 'line', 8320
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 8325
    join $S2, ', ', $P4
.annotate 'line', 8324
    $P7 = WSubId_26("    %0.'%1'(%2)", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P7)
    goto __label_4 # break
  __label_10: # case
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8330
    concat $S3, "Modifier '", $S1
    concat $S3, $S3, "' not valid for try"
    getattribute $P8, self, 'start'
    WSubId_1($S3, $P8)
  __label_4: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8333

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 8290
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 8292
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
.annotate 'line', 8345
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8346
    $P1 = __ARG_2.'get'()
.annotate 'line', 8347
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8348
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8350
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8352
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 8353
    $P1 = __ARG_2.'get'()
.annotate 'line', 8354
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 8355
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 8356
    $P1 = __ARG_2.'get'()
.annotate 'line', 8357
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8358
    WSubId_54("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 8359
    $P1 = __ARG_2.'get'()
.annotate 'line', 8360
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 8361
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8362
    setattribute self, 'exname', $P1
.annotate 'line', 8363
    self.'createvar'($S1, 'P')
.annotate 'line', 8364
    $P1 = __ARG_2.'get'()
.annotate 'line', 8365
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 8366
    WSubId_54("')' in 'catch'", $P1)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 8368
    $P3 = WSubId_109(__ARG_2, self)
    setattribute self, 'scatch', $P3
.annotate 'line', 8369

.end # TryStatement


.sub 'allowtailcall' :method
.annotate 'line', 8372
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8373
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8375
    .return(0)
  __label_2: # endif
.annotate 'line', 8376

.end # allowtailcall


.sub 'optimize' :method
.annotate 'line', 8379
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8380
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 8381
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 8382
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 8383
    .return(self)
.annotate 'line', 8384

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8387
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8388
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8389
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 8390
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 8391
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 8392
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 8394
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 8395
    self.'annotate'(__ARG_1)
.annotate 'line', 8396
    unless $I1 goto __label_7
.annotate 'line', 8397
    __ARG_1.'comment'('try: create handler')
  __label_7: # endif
.annotate 'line', 8398
    $P1 = WSubId_26("    new %0, 'ExceptionHandler'\n    set_label %0, %1\n", $S1, $S2)
    __ARG_1.'print'($P1)
.annotate 'line', 8405
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_8
.annotate 'line', 8406
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_8: # endif
.annotate 'line', 8408
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 8409
    unless $I1 goto __label_9
.annotate 'line', 8410
    __ARG_1.'comment'('try: begin')
  __label_9: # endif
.annotate 'line', 8411
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8412
    unless $I1 goto __label_10
.annotate 'line', 8413
    __ARG_1.'comment'('try: end')
  __label_10: # endif
.annotate 'line', 8414
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8416
    self.'annotate'(__ARG_1)
.annotate 'line', 8417
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8419
    unless $I1 goto __label_11
.annotate 'line', 8420
    __ARG_1.'comment'('catch')
  __label_11: # endif
.annotate 'line', 8421
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 8422
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 8423
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 8424
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8425
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8427
    unless $I1 goto __label_12
.annotate 'line', 8428
    __ARG_1.'comment'('catch end')
  __label_12: # endif
.annotate 'line', 8429
    __ARG_1.'emitlabel'($S3)
.annotate 'line', 8430

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 8336
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8338
    addattribute $P0, 'stry'
.annotate 'line', 8339
    addattribute $P0, 'modifiers'
.annotate 'line', 8340
    addattribute $P0, 'exname'
.annotate 'line', 8341
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.annotate 'line', 8443
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8444
    setattribute self, 'name', __ARG_3
.annotate 'line', 8445
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 8446
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 8447

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 8437
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8439
    addattribute $P0, 'name'
.annotate 'line', 8440
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
.annotate 'line', 8462
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8463
    setattribute self, 'name', __ARG_3
.annotate 'line', 8464
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 8465
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 8466
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 8467

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 8454
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8456
    addattribute $P0, 'name'
.annotate 'line', 8457
    addattribute $P0, 'basetype'
.annotate 'line', 8458
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
.annotate 'line', 8478
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 8479
    $P1 = __ARG_5.'get'()
.annotate 'line', 8480
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8482
    $P4 = WSubId_51(__ARG_5, self)
    setattribute self, 'init', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8485
    __ARG_5.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8486

.end # DeclareSingleStatement


.sub 'optimize' :method
.annotate 'line', 8489
    getattribute $P1, self, 'init'
.annotate 'line', 8490
    if_null $P1, __label_1
.annotate 'line', 8491
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8492
    .return(self)
.annotate 'line', 8493

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8496
    self.'annotate'(__ARG_1)
.annotate 'line', 8497
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8498
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8499
    null $S3
.annotate 'line', 8500
    getattribute $P2, self, 'basetype'
    null $S4
    if_null $P2, __label_3
    set $S4, $P2
  __label_3:
.annotate 'line', 8501
    getattribute $P1, self, 'init'
.annotate 'line', 8502
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8503
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
  __label_4: # endif
.annotate 'line', 8505
    isnull $I1, $P1
    box $P2, $I1
    if $P2 goto __label_7
    $P2 = $P1.'isnull'()
  __label_7:
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 8506
    __ARG_1.'emitnull'($S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 8508
    $P3 = $P1.'checkresult'()
    null $S5
    if_null $P3, __label_8
    set $S5, $P3
  __label_8:
.annotate 'line', 8509
    ne $S5, $S4, __label_9
.annotate 'line', 8510
    $P1.'emit'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
.annotate 'line', 8512
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 8514
    $P1.'emit'(__ARG_1, $S2)
    goto __label_12
  __label_11: # else
.annotate 'line', 8516
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 8517
    if $S4 == 'I' goto __label_17
    if $S4 == 'N' goto __label_18
    if $S4 == 'S' goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 8519
    $P3 = WSubId_29($P1)
    set $S3, $P3
.annotate 'line', 8520
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_18: # case
.annotate 'line', 8523
    $P4 = WSubId_113($P1)
    set $S3, $P4
.annotate 'line', 8524
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_19: # case
.annotate 'line', 8527
    $P5 = WSubId_28($P1)
    set $S3, $P5
.annotate 'line', 8528
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 8531
    WSubId_6("Wrong type", self)
  __label_15: # switch end
    goto __label_14
  __label_13: # else
.annotate 'line', 8535
    if $S5 == 'v' goto __label_22
    goto __label_21
  __label_22: # case
.annotate 'line', 8537
    WSubId_1('Invalid initialization from void value', self)
  __label_21: # default
.annotate 'line', 8539
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S3, $P2
  __label_20: # switch end
.annotate 'line', 8541
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_25
    iseq $I1, $S5, 'P'
  __label_25:
    unless $I1 goto __label_23
.annotate 'line', 8542
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_26
    set $S6, $P2
  __label_26:
.annotate 'line', 8543
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8544
    __ARG_1.'emitif_null'($S3, $S6)
.annotate 'line', 8545
    __ARG_1.'emitset'($S2, $S3)
.annotate 'line', 8546
    __ARG_1.'emitlabel'($S6)
    goto __label_24
  __label_23: # else
.annotate 'line', 8549
    __ARG_1.'emitset'($S2, $S3)
  __label_24: # endif
  __label_14: # endif
  __label_12: # endif
  __label_10: # endif
  __label_6: # endif
.annotate 'line', 8553

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8472
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8474
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
.annotate 'line', 8568
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 8569
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 8570
    $P1 = __ARG_6.'get'()
.annotate 'line', 8571
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8573
    __ARG_6.'unget'($P1)
.annotate 'line', 8574
    $P3 = WSubId_51(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 8575
    WSubId_68(']', __ARG_6)
  __label_1: # endif
.annotate 'line', 8577
    $P1 = __ARG_6.'get'()
.annotate 'line', 8578
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8579
    $P1 = __ARG_6.'get'()
.annotate 'line', 8580
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8581
    WSubId_54("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 8582
    $P1 = __ARG_6.'get'()
.annotate 'line', 8583
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 8584
    __ARG_6.'unget'($P1)
.annotate 'line', 8585
    $P3 = WSubId_50(__ARG_6, self, WSubId_51, ']')
    setattribute self, 'initarray', $P3
  __label_5: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 8589
    __ARG_6.'unget'($P1)
  __label_3: # endif
.annotate 'line', 8590

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 8593
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8594
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8595
    getattribute $P1, self, 'initarray'
    WSubId_52($P1)
.annotate 'line', 8596
    .return(self)
.annotate 'line', 8597

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8600
    self.'annotate'(__ARG_1)
.annotate 'line', 8602
    getattribute $P1, self, 'reg'
.annotate 'line', 8603
    getattribute $P2, self, 'size'
.annotate 'line', 8604
    getattribute $P3, self, 'initarray'
.annotate 'line', 8605
    getattribute $P4, self, 'basetype'
.annotate 'line', 8606
    getattribute $P5, self, 'arraytype'
.annotate 'line', 8607
    if_null $P2, __label_1
.annotate 'line', 8610
    $P8 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 8609
    $P7 = WSubId_26("    new %0, ['Fixed%1Array'], %2", $P1, $P5, $P8)
    __ARG_1.'say'($P7)
    goto __label_2
  __label_1: # else
.annotate 'line', 8614
    $P7 = WSubId_26("    new %0, ['Resizable%1Array']", $P1, $P5)
    __ARG_1.'say'($P7)
  __label_2: # endif
.annotate 'line', 8617
    if_null $P3, __label_3
.annotate 'line', 8618
    $P7 = self.'tempreg'($P4)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 8619
    elements $I1, $P3
.annotate 'line', 8620
    unless_null $P2, __label_5
.annotate 'line', 8621
    unless $I1 goto __label_6
.annotate 'line', 8623
    __ARG_1.'emitset'($P1, $I1)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 8626
    null $I2
.annotate 'line', 8627
    if_null $P3, __label_8
    iter $P9, $P3
    set $P9, 0
  __label_7: # for iteration
    unless $P9 goto __label_8
    shift $P6, $P9
.annotate 'line', 8628
    $P6.'emit'(__ARG_1, $S1)
.annotate 'line', 8629
    $P7 = WSubId_26("    %0[%1] = %2", $P1, $I2, $S1)
    __ARG_1.'say'($P7)
.annotate 'line', 8630
    inc $I2
    goto __label_7
  __label_8: # endfor
  __label_3: # endif
.annotate 'line', 8633

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8558
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8560
    addattribute $P0, 'size'
.annotate 'line', 8561
    addattribute $P0, 'initarray'
.annotate 'line', 8562
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
.annotate 'line', 8640
    null $P1
.annotate 'line', 8641
    null $P2
  __label_1: # do
.annotate 'line', 8643
    $P3 = __ARG_4.'get'()
.annotate 'line', 8644
    WSubId_108($P3)
.annotate 'line', 8645
    $P4 = __ARG_4.'get'()
.annotate 'line', 8646
    null $P5
.annotate 'line', 8647
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8648
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
.annotate 'line', 8650
    __ARG_4.'unget'($P4)
.annotate 'line', 8651
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
  __label_5: # endif
.annotate 'line', 8653
    $P2 = WSubId_114($P2, $P5)
.annotate 'line', 8654
    $P1 = __ARG_4.'get'()
  __label_3: # continue
.annotate 'line', 8655
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8656
    WSubId_4(';', $P1)
.annotate 'line', 8657
    .return($P2)
.annotate 'line', 8658

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8666
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
.annotate 'line', 8667

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8662
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8674
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
.annotate 'line', 8675

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8670
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8681
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8682

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8686
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8687

.end # newIntArray


.sub 'parseInt' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_116 = "WSubId_116"
.const 'Sub' WSubId_117 = "WSubId_117"
.annotate 'line', 8691
    .tailcall WSubId_115(WSubId_116, WSubId_117, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8692

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8700
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
.annotate 'line', 8701

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8696
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8708
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
.annotate 'line', 8709

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8704
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_118')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8715
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8716

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8720
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8721

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_119 = "WSubId_119"
.annotate 'line', 8725
    .tailcall WSubId_115(WSubId_118, WSubId_119, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8726

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8734
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
.annotate 'line', 8735

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8730
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8742
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
.annotate 'line', 8743

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8738
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_120')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8749
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8750

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_121')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8754
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 8755

.end # newStringArray


.sub 'parseString' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_121 = "WSubId_121"
.annotate 'line', 8759
    .tailcall WSubId_115(WSubId_120, WSubId_121, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8760

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 8776
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8777
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8778
    setattribute self, 'name', __ARG_4
.annotate 'line', 8779
    setattribute self, 'value', __ARG_5
.annotate 'line', 8780
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
.annotate 'line', 8781

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8784
    getattribute $P1, self, 'value'
.annotate 'line', 8785
    getattribute $P2, self, 'name'
.annotate 'line', 8786
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8787
    $P1 = $P1.'optimize'()
.annotate 'line', 8788
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 8789
    WSubId_1('Value for const is not evaluable at compile time', self)
  __label_2: # endif
.annotate 'line', 8792
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8793
    .return(self)
.annotate 'line', 8794

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 8797
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
.annotate 'line', 8798

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8801
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8802
    getattribute $P3, self, 'data'
    $P1 = $P3.'getvalue'()
.annotate 'line', 8803
    null $S1
.annotate 'line', 8804
    getattribute $P2, self, 'type'
    set $S2, $P2
    if $S2 == 'I' goto __label_4
    if $S2 == 'N' goto __label_5
    if $S2 == 'S' goto __label_6
    goto __label_3
  __label_4: # case
.annotate 'line', 8805
    $P3 = $P1.'getIntegerValue'()
    set $S1, $P3
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 8806
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 8807
    $P5 = $P1.'getPirString'()
    set $S1, $P5
    goto __label_2 # break
  __label_3: # default
  __label_2: # switch end
.annotate 'line', 8810
    getattribute $P2, self, 'name'
    set $S2, $P2
.annotate 'line', 8811
    concat $S3, "Constant '", $S2
    concat $S3, $S3, "' set to: "
    concat $S3, $S3, $S1
.annotate 'line', 8810
    __ARG_1.'comment'($S3)
  __label_1: # endif
.annotate 'line', 8813

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8766
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8768
    addattribute $P0, 'type'
.annotate 'line', 8769
    addattribute $P0, 'name'
.annotate 'line', 8770
    addattribute $P0, 'data'
.annotate 'line', 8771
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
.annotate 'line', 8818
    $P1 = __ARG_2.'get'()
.annotate 'line', 8819
    $P5 = WSubId_112($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8820
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8821
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8823
    null $P2
  __label_5: # do
.annotate 'line', 8825
    $P1 = __ARG_2.'get'()
.annotate 'line', 8826
    set $P3, $P1
.annotate 'line', 8827
    WSubId_68('=', __ARG_2)
.annotate 'line', 8828
    $P4 = WSubId_51(__ARG_2, __ARG_3)
.annotate 'line', 8830
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8829
    $P2 = WSubId_114($P2, $P5)
  __label_7: # continue
.annotate 'line', 8831
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8832
    .return($P2)
.annotate 'line', 8833

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
.annotate 'line', 8844
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8845
    $P1 = __ARG_2.'get'()
.annotate 'line', 8846
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8847
    $P4 = WSubId_51(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8848
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 8850
    WSubId_4(';', $P1)
.annotate 'line', 8851

.end # VarStatement


.sub 'optimize_init' :method
.annotate 'line', 8854
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8855
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8856
    .return(self)
.annotate 'line', 8857

.end # optimize_init


.sub 'optimize' :method
.annotate 'line', 8860
    .tailcall self.'optimize_init'()
.annotate 'line', 8861

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 8864
    self.'annotate'(__ARG_1)
.annotate 'line', 8865
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8866
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8867
    getattribute $P1, self, 'init'
.annotate 'line', 8868
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8869
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
  __label_3: # endif
.annotate 'line', 8870
    if_null $P1, __label_4
.annotate 'line', 8871
    $P2 = $P1.'isnull'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 8872
    null $P1
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 8873
    if_null $P1, __label_6
.annotate 'line', 8874
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    if $S4 == 'P' goto __label_10
    if $S4 == 'S' goto __label_11
    if $S4 == 'I' goto __label_12
    if $S4 == 'N' goto __label_13
    if $S4 == 'v' goto __label_14
    goto __label_9
  __label_10: # case
.annotate 'line', 8876
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_18
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_18:
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_17:
    unless $I1 goto __label_15
.annotate 'line', 8877
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_16
  __label_15: # else
.annotate 'line', 8879
    $P1.'emit'(__ARG_1, $S2)
  __label_16: # endif
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
  __label_13: # case
.annotate 'line', 8884
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_19
    set $S3, $P3
  __label_19:
.annotate 'line', 8885
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_8 # break
  __label_14: # case
.annotate 'line', 8888
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_9: # default
.annotate 'line', 8890
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_8: # switch end
    goto __label_7
  __label_6: # else
.annotate 'line', 8894
    __ARG_1.'emitnull'($S2)
  __label_7: # endif
.annotate 'line', 8895

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8839
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8841
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8902
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8903
    WSubId_68(';', __ARG_2)
.annotate 'line', 8904

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8907
    self.'annotate'(__ARG_1)
.annotate 'line', 8908
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8909
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 8910
    getattribute $P3, self, 'name'
    $P2 = WSubId_26("var %0[] : %1", $P3, $S1)
    __ARG_1.'comment'($P2)
  __label_2: # endif
.annotate 'line', 8911
    $P1 = WSubId_26("    new %0, 'ResizablePMCArray'", $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 8912

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8898
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
.annotate 'line', 8921
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8922
    $P2 = WSubId_51(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8923
    WSubId_68(']', __ARG_2)
.annotate 'line', 8924
    WSubId_68(';', __ARG_2)
.annotate 'line', 8925

.end # FixedVarStatement


.sub 'optimize' :method
.annotate 'line', 8928
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8929
    .tailcall self.'optimize_init'()
.annotate 'line', 8930

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 8933
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8934
    self.'annotate'(__ARG_1)
.annotate 'line', 8935
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8936
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 8937
    getattribute $P3, self, 'name'
    $P2 = WSubId_26("var %0[] : %1", $P3, $S2)
    __ARG_1.'comment'($P2)
  __label_3: # endif
.annotate 'line', 8938
    $P1 = WSubId_26("    new %0, 'FixedPMCArray', %1", $S2, $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 8939

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8915
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8917
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_108 = "WSubId_108"
.annotate 'line', 8944
    $P1 = __ARG_2.'get'()
.annotate 'line', 8945
    WSubId_108($P1)
.annotate 'line', 8946
    $P2 = __ARG_2.'get'()
.annotate 'line', 8947
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 8948
    $P2 = __ARG_2.'get'()
.annotate 'line', 8949
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8950
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
.annotate 'line', 8952
    __ARG_2.'unget'($P2)
.annotate 'line', 8953
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 8957
    __ARG_2.'unget'($P2)
.annotate 'line', 8958
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8960

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_60 = "WSubId_60"
.annotate 'line', 8964
    $P1 = __ARG_2.'get'()
.annotate 'line', 8965
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8966
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8967
    .tailcall WSubId_60(__ARG_1, __ARG_2, __ARG_3, 1)
.annotate 'line', 8968

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 8981
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8982
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8983
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8984
    null $P1
  __label_2: # while
.annotate 'line', 8985
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8986
    __ARG_2.'unget'($P1)
.annotate 'line', 8987
    $P2 = WSubId_109(__ARG_2, self)
.annotate 'line', 8988
    unless_null $P2, __label_3
.annotate 'line', 8989
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8990
    getattribute $P3, self, 'statements'
    push $P3, $P2
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8992
    setattribute self, 'end', $P1
.annotate 'line', 8993

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 8996
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 8997
    getattribute $P1, self, 'labels'
.annotate 'line', 8998
    $S2 = $P1[$S1]
.annotate 'line', 8999
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9000
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 9001
    .return($S2)
.annotate 'line', 9002

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9005
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9006
    getattribute $P1, self, 'labels'
.annotate 'line', 9007
    $S2 = $P1[$S1]
.annotate 'line', 9008
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9009
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 9010
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 9011
    $P1[$S1] = $S3
.annotate 'line', 9012
    .return($S3)
.annotate 'line', 9013

.end # createlabel


.sub 'getend' :method
.annotate 'line', 9014
    getattribute $P1, self, 'end'
    .return($P1)

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9017
    $P2 = __ARG_1.'getDebug'()
    set $I1, $P2
.annotate 'line', 9018
    unless $I1 goto __label_1
.annotate 'line', 9019
    __ARG_1.'comment'('{')
  __label_1: # endif
.annotate 'line', 9020
    getattribute $P2, self, 'statements'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9021
    $P1.'emit'(__ARG_1)
.annotate 'line', 9022
    self.'freetemps'()
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9024
    unless $I1 goto __label_4
.annotate 'line', 9025
    __ARG_1.'comment'('}')
  __label_4: # endif
.annotate 'line', 9026

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8974
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8976
    addattribute $P0, 'end'
.annotate 'line', 8977
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
.annotate 'line', 9041
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 9043
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 9044
    new $P1, ['ResizableStringArray']
.annotate 'line', 9045
    new $P2, ['ResizableStringArray']
.annotate 'line', 9046
    setattribute self, 'tempreg', $P1
.annotate 'line', 9047
    setattribute self, 'freereg', $P2
.annotate 'line', 9048

.end # RegisterStore


.sub 'createreg' :method
.annotate 'line', 9051
    getattribute $P1, self, 'nreg'
.annotate 'line', 9052
    set $I1, $P1
.annotate 'line', 9053
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 9054
    assign $P1, $I1
.annotate 'line', 9055
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
.annotate 'line', 9056

.end # createreg


.sub 'tempreg' :method
.annotate 'line', 9059
    getattribute $P1, self, 'freereg'
.annotate 'line', 9060
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9061
    null $S1
.annotate 'line', 9062
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9063
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9065
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 9066
    push $P2, $S1
.annotate 'line', 9067
    .return($S1)
.annotate 'line', 9068

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9071
    getattribute $P1, self, 'freereg'
.annotate 'line', 9072
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9073
    elements $I1, $P2
.annotate 'line', 9074
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
.annotate 'line', 9075
    $S1 = $P2[$I2]
.annotate 'line', 9076
    push $P1, $S1
  __label_1: # for iteration
.annotate 'line', 9074
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 9078
    assign $P2, 0
.annotate 'line', 9079

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 9035
    addattribute $P0, 'type'
.annotate 'line', 9036
    addattribute $P0, 'nreg'
.annotate 'line', 9037
    addattribute $P0, 'tempreg'
.annotate 'line', 9038
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9090
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9091

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9094
    null $P1
.annotate 'line', 9095
    null $P2
.annotate 'line', 9096
    $P3 = self.'getlist'()
.annotate 'line', 9097
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
.annotate 'line', 9098
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 9099
    if $S1 == 'named' goto __label_6
    if $S1 == 'slurpy' goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9101
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9104
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9107
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9111
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 9118
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 9135
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 9116
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 9119
    null $S2
.annotate 'line', 9120
    $P7 = $P1.'numargs'()
    set $I2, $P7
    if $I2 == 0 goto __label_16
    if $I2 == 1 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 9122
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 9125
    $P5 = $P1.'getarg'(0)
.annotate 'line', 9126
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 9127
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 9128
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 9131
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 9133
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 9136
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 9139

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 9086
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_112 = "WSubId_112"
.annotate 'line', 9150
    setattribute self, 'func', __ARG_1
.annotate 'line', 9151
    $P1 = __ARG_2.'get'()
.annotate 'line', 9152
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_112($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9153
    eq $S1, '', __label_2
.annotate 'line', 9154
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 9156
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 9157
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 9158
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S4, '__ARG_', $S3
    set $S2, $S4
.annotate 'line', 9159
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 9161
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 9162
    $P1 = __ARG_2.'get'()
.annotate 'line', 9163
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9164
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 9166
    __ARG_2.'unget'($P1)
  __label_5: # endif
.annotate 'line', 9167

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_122 = "WSubId_122"
.annotate 'line', 9170
    getattribute $P1, self, 'func'
.annotate 'line', 9171
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9172
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 9173
    $P5 = $P2.'gettype'()
    $P4 = WSubId_122($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 9174
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 9175
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9176
    if_null $P3, __label_3
.annotate 'line', 9177
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 9178
    __ARG_1.'say'('')
.annotate 'line', 9179

.end # emit


.sub 'get_type' :method
.annotate 'line', 9182
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 9183

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 9144
    addattribute $P0, 'func'
.annotate 'line', 9145
    addattribute $P0, 'name'
.annotate 'line', 9146
    addattribute $P0, 'modifiers'
.annotate 'line', 9147
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_123')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9189
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9190

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9201
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 9202
    setattribute self, 'name', __ARG_1
.annotate 'line', 9203

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9206
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 9207
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9208
    self.'annotate'(__ARG_1)
.annotate 'line', 9209
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 9210
    .return($S1)
.annotate 'line', 9211

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 9196
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9198
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_subid' :subid('WSubId_126')
        .param string __ARG_1
.annotate 'line', 9220
    concat $S1, ".const 'Sub' ", __ARG_1
    concat $S1, $S1, ' = "'
    concat $S1, $S1, __ARG_1
    concat $S1, $S1, "\"\n"
    .return($S1)
.annotate 'line', 9221

.end # emit_subid

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9227
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9228

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9231
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9232
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9234
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 9236
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 9237
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 9238
    le $I1, 0, __label_5
.annotate 'line', 9239
    __ARG_1.'print'('(')
.annotate 'line', 9240
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
.annotate 'line', 9241
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 9242
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 9243
    WSubId_1('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 9244
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 9245
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 9246
    __ARG_1.'print'(", ")
  __label_10: # endif
  __label_6: # for iteration
.annotate 'line', 9240
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 9248
    __ARG_1.'print'(')')
  __label_5: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9251

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 9223
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_125')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9256
    $P4 = __ARG_2.'numargs'()
    set $I1, $P4
.annotate 'line', 9257
    null $P1
.annotate 'line', 9258
    unless $I1 goto __label_1
.annotate 'line', 9259
    root_new $P4, ['parrot';'ResizablePMCArray']
    set $P1, $P4
.annotate 'line', 9260
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 9261
    $P2 = __ARG_2.'getarg'($I2)
.annotate 'line', 9263
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 9266
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 9273
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 9264
    $P4 = $P2.'get_value'()
    push $P1, $P4
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9267
    $P5 = $P2.'getName'()
    null $S1
    if_null $P5, __label_10
    set $S1, $P5
  __label_10:
.annotate 'line', 9268
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
.annotate 'line', 9269
    push $P1, $S1
    goto __label_12
  __label_11: # else
.annotate 'line', 9271
    getattribute $P6, $P2, 'start'
    WSubId_1("unsupported multi signature", $P6)
  __label_12: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9274
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 9275
    unless_null $P3, __label_16
.annotate 'line', 9276
    getattribute $P7, $P2, 'start'
    WSubId_1("class not found", $P7)
  __label_16: # endif
.annotate 'line', 9278
    $P8 = WSubId_30($P3)
    push $P1, $P8
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9281
    getattribute $P9, $P2, 'start'
    WSubId_1("unsupported multi signature", $P9)
  __label_5: # switch end
  __label_2: # for iteration
.annotate 'line', 9260
    inc $I2
    goto __label_4
  __label_3: # for end
  __label_1: # endif
.annotate 'line', 9285
    .return($P1)
.annotate 'line', 9286

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9308
    self.'BlockStatement'(__ARG_1, __ARG_2)
.annotate 'line', 9309
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 9310
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 9311
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 9312
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 9313
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
.annotate 'line', 9314

.end # FunctionBase


.sub 'getouter' :method
.annotate 'line', 9316
    .return(self)

.end # getouter


.sub 'allowtailcall' :method
.annotate 'line', 9319
    .return(1)
.annotate 'line', 9320

.end # allowtailcall


.sub 'makesubid' :method
.annotate 'line', 9324
    getattribute $P1, self, 'subid'
.annotate 'line', 9325
    unless_null $P1, __label_1
.annotate 'line', 9326
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 9327
    .return($P1)
.annotate 'line', 9328

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 9331
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 9332
    unless_null $P1, __label_1
.annotate 'line', 9333
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 9334
    $P1[__ARG_1] = 1
.annotate 'line', 9335

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
.annotate 'line', 9339
    issame $I1, self, __ARG_1
.annotate 'line', 9340
    .return($I1)
.annotate 'line', 9341

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_123 = "WSubId_123"
.annotate 'line', 9344
    $P1 = __ARG_1.'get'()
.annotate 'line', 9345
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9346
    __ARG_1.'unget'($P1)
.annotate 'line', 9347
    $P3 = WSubId_50(__ARG_1, self, WSubId_123, ')')
    setattribute self, 'params', $P3
  __label_1: # endif
.annotate 'line', 9349

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 9353
    getattribute $P1, self, 'localfun'
.annotate 'line', 9354
    unless_null $P1, __label_1
.annotate 'line', 9355
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9357
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 9358

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 9362
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9363
    unless_null $P1, __label_1
.annotate 'line', 9364
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'usednamespaces', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9366
    $P4 = WSubId_124($P1, __ARG_1)
    if_null $P4, __label_3
.annotate 'line', 9367
    .return()
  __label_3: # endif
.annotate 'line', 9368
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 9370

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 9373
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9374
    $P2 = $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 9375
    if_null $P2, __label_3
.annotate 'line', 9376
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9378
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 9379

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 9383
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9384
    if_null $P1, __label_1
.annotate 'line', 9385
    $P2 = $P1.'pick'('multi')
.annotate 'line', 9386
    if_null $P2, __label_2
.annotate 'line', 9388
    self.'setmulti'()
.annotate 'line', 9389
    $P5 = WSubId_125(self, $P2)
    setattribute self, 'multi_sig', $P5
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 9392
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
.annotate 'line', 9393
    $P3.'fixnamespaces'()
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9394
    getattribute $P7, self, 'body'
    $P5 = $P7.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 9395
    .return(self)
.annotate 'line', 9396

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 9400
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 9401
    unless_null $P1, __label_1
.annotate 'line', 9402
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 9403
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 9404

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 9407
    getattribute $P1, self, 'lexicals'
.annotate 'line', 9408
    unless_null $P1, __label_1
.annotate 'line', 9409
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 9410
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 9411

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
.annotate 'line', 9416
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 9417
    null $S1
.annotate 'line', 9418
    if_null $P1, __label_1
.annotate 'line', 9419
    set $S1, $P1
    goto __label_2
  __label_1: # else
.annotate 'line', 9421
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 9422
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 9423
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 9424
    self.'setlex'($S1, $S2)
.annotate 'line', 9425
    __ARG_1.'setlex'($S1)
  __label_2: # endif
.annotate 'line', 9427
    .return($S1)
.annotate 'line', 9428

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9432
    null $P1
.annotate 'line', 9433
    if __ARG_1 == 'I' goto __label_3
    if __ARG_1 == 'N' goto __label_4
    if __ARG_1 == 'S' goto __label_5
    if __ARG_1 == 'P' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 9435
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9437
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9439
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9441
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9443
    concat $S3, "Invalid type in createreg: ", __ARG_1
    WSubId_6($S3)
  __label_1: # switch end
.annotate 'line', 9445
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9446
    .return($S1)
.annotate 'line', 9447

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9450
    null $P1
.annotate 'line', 9451
    if __ARG_1 == 'I' goto __label_3
    if __ARG_1 == 'N' goto __label_4
    if __ARG_1 == 'S' goto __label_5
    if __ARG_1 == 'P' goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 9453
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9455
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9457
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9459
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9461
    concat $S3, "Invalid type in tempreg: ", __ARG_1
    WSubId_6($S3)
  __label_1: # switch end
.annotate 'line', 9463
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9464
    .return($S1)
.annotate 'line', 9465

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9468
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
.annotate 'line', 9469
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9470

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 9473
    getattribute $P1, self, 'nlabel'
    inc $P1
    set $I1, $P1
.annotate 'line', 9474
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
.annotate 'line', 9475

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9478
    WSubId_1('break not allowed here', __ARG_1)
.annotate 'line', 9479

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9482
    WSubId_1('continue not allowed here', __ARG_1)
.annotate 'line', 9483

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
.annotate 'line', 9489
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 9490
    __ARG_1.'say'()
.annotate 'line', 9491
    __ARG_1.'print'(".sub ")
.annotate 'line', 9492
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 9493
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 9495
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 9496
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 9497
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 9499
    getattribute $P1, self, 'outer'
.annotate 'line', 9500
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_6
    getattribute $P8, self, 'usedlexicals'
    isnull $I2, $P8
    not $I2
  __label_6:
    unless $I2 goto __label_5
.annotate 'line', 9501
    getattribute $P2, $P1, 'subid'
.annotate 'line', 9502
    if_null $P2, __label_7
.annotate 'line', 9503
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 9507
    $P8 = self.'ismethod'()
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 9508
    __ARG_1.'print'(' :method')
  __label_8: # endif
.annotate 'line', 9509
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9510
    if_null $P3, __label_9
.annotate 'line', 9511
    $P3.'emit'(__ARG_1)
    goto __label_10
  __label_9: # else
.annotate 'line', 9513
    ne $S1, 'main', __label_11
.annotate 'line', 9514
    __ARG_1.'print'(' :main')
  __label_11: # endif
  __label_10: # endif
.annotate 'line', 9516
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 9517
    __ARG_1.'say'()
.annotate 'line', 9520
    getattribute $P8, self, 'params'
    WSubId_66(__ARG_1, $P8)
.annotate 'line', 9522
    getattribute $P4, self, 'lexicals'
.annotate 'line', 9523
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 9524
    isnull $I2, $P4
    not $I2
    if $I2 goto __label_13
    isnull $I2, $P5
    not $I2
  __label_13:
    unless $I2 goto __label_12
.annotate 'line', 9525
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 9527
    if_null $P4, __label_15
    iter $P10, $P4
    set $P10, 0
  __label_14: # for iteration
    unless $P10 goto __label_15
    shift $S2, $P10
.annotate 'line', 9528
    $P9 = $P4[$S2]
    $P8 = WSubId_26(".lex '%0', %1", $P9, $S2)
    __ARG_1.'say'($P8)
    goto __label_14
  __label_15: # endfor
.annotate 'line', 9530
    if_null $P5, __label_17
    iter $P11, $P5
    set $P11, 0
  __label_16: # for iteration
    unless $P11 goto __label_17
    shift $S3, $P11
.annotate 'line', 9531
    substr $S4, $S3, 0, 1
    eq $S4, '$', __label_18
.annotate 'line', 9532
    concat $S5, "    .local pmc ", $S3
    __ARG_1.'say'($S5)
  __label_18: # endif
.annotate 'line', 9533
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
    goto __label_16
  __label_17: # endfor
  __label_12: # endif
.annotate 'line', 9537
    getattribute $P9, self, 'usedsubids'
    root_new $P12, ['parrot';'ResizablePMCArray']
    $P8 = WSubId_31($P9, $P12, WSubId_126)
    join $S4, "", $P8
    __ARG_1.'print'($S4)
.annotate 'line', 9539
    $P8 = __ARG_1.'getDebug'()
    set $I1, $P8
.annotate 'line', 9540
    getattribute $P6, self, 'body'
.annotate 'line', 9541
    $P8 = $P6.'isempty'()
    if_null $P8, __label_19
    unless $P8 goto __label_19
.annotate 'line', 9542
    unless $I1 goto __label_21
.annotate 'line', 9543
    __ARG_1.'comment'('Empty body')
  __label_21: # endif
    goto __label_20
  __label_19: # else
.annotate 'line', 9546
    unless $I1 goto __label_22
.annotate 'line', 9547
    __ARG_1.'comment'('Body')
  __label_22: # endif
.annotate 'line', 9548
    $P6.'emit'(__ARG_1)
.annotate 'line', 9549
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
  __label_20: # endif
.annotate 'line', 9551
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9554
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_24
    iter $P13, $P8
    set $P13, 0
  __label_23: # for iteration
    unless $P13 goto __label_24
    shift $P7, $P13
.annotate 'line', 9555
    $P7.'emit'(__ARG_1)
    goto __label_23
  __label_24: # endfor
.annotate 'line', 9556

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 9288
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 9290
    addattribute $P0, 'name'
.annotate 'line', 9291
    addattribute $P0, 'subid'
.annotate 'line', 9292
    addattribute $P0, 'modifiers'
.annotate 'line', 9293
    addattribute $P0, 'params'
.annotate 'line', 9294
    addattribute $P0, 'body'
.annotate 'line', 9295
    addattribute $P0, 'regstI'
.annotate 'line', 9296
    addattribute $P0, 'regstN'
.annotate 'line', 9297
    addattribute $P0, 'regstS'
.annotate 'line', 9298
    addattribute $P0, 'regstP'
.annotate 'line', 9299
    addattribute $P0, 'nlabel'
.annotate 'line', 9300
    addattribute $P0, 'localfun'
.annotate 'line', 9301
    addattribute $P0, 'lexicals'
.annotate 'line', 9302
    addattribute $P0, 'usedlexicals'
.annotate 'line', 9303
    addattribute $P0, 'usedsubids'
.annotate 'line', 9304
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'get_pir_type' :subid('WSubId_127')
        .param pmc __ARG_1
.const 'Sub' WSubId_122 = "WSubId_122"
.annotate 'line', 9565
    $P1 = __ARG_1.'get_type'()
    .tailcall WSubId_122($P1)
.annotate 'line', 9566

.end # get_pir_type

.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9577
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9578
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 9579
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 9580
    self.'parse'(__ARG_2)
.annotate 'line', 9581
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
.annotate 'line', 9582

.end # FunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 9584
    .return(0)

.end # isanonymous


.sub 'getparamnum' :method
.annotate 'line', 9588
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 9589

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 9593
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 9594

.end # getlexnum


.sub 'ismethod' :method
.annotate 'line', 9595
    .return(0)

.end # ismethod


.sub 'ismulti' :method
.annotate 'line', 9599
    getattribute $P1, self, 'is_multi'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)
.annotate 'line', 9600

.end # ismulti


.sub 'setmulti' :method
.annotate 'line', 9603
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
.annotate 'line', 9604

.end # setmulti


.sub 'default_multi_sig' :method
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 9607
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9608
    $P2 = self.'ismethod'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9609
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 9610
    getattribute $P2, self, 'params'
    WSubId_31($P2, $P1, WSubId_127)
.annotate 'line', 9611
    .return($P1)
.annotate 'line', 9612

.end # default_multi_sig


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_2 = "WSubId_2"
.annotate 'line', 9615
    $P1 = __ARG_1.'get'()
.annotate 'line', 9616
    setattribute self, 'name', $P1
.annotate 'line', 9617
    $P2 = __ARG_1.'get'()
.annotate 'line', 9618
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 9619
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9620
    $P2 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 9622
    WSubId_4('(', $P2)
.annotate 'line', 9623
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9625
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 9626
    $P4 = $P3.'fullname'()
    WSubId_128(self, '__FUNCTION__', $P4)
.annotate 'line', 9628
    $P2 = __ARG_1.'get'()
.annotate 'line', 9629
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9630
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9631
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9632
    .return(self)
.annotate 'line', 9633

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.annotate 'line', 9637
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9638
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9639
    unless_null $P1, __label_2
.annotate 'line', 9640
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 9641
    join $S1, ", ", $P1
    __ARG_1.'print'(' :multi(', $S1, ')')
  __label_1: # endif
.annotate 'line', 9643

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9568
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9570
    addattribute $P0, 'paramnum'
.annotate 'line', 9571
    addattribute $P0, 'lexnum'
.annotate 'line', 9572
    addattribute $P0, 'is_multi'
.annotate 'line', 9573
    addattribute $P0, 'multi_sig'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 9654
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9655
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9656
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9657
    $P1 = self.'makesubid'()
.annotate 'line', 9658
    setattribute self, 'name', $P1
.annotate 'line', 9659
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9660
    $P2 = __ARG_2.'get'()
.annotate 'line', 9661
    WSubId_4('{', $P2)
.annotate 'line', 9662
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9663
    __ARG_3.'addlocalfunction'(self)
.annotate 'line', 9664

.end # LocalFunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 9665
    .return(1)

.end # isanonymous


.sub 'ismethod' :method
.annotate 'line', 9666
    .return(0)

.end # ismethod


.sub 'needclosure' :method
.annotate 'line', 9669
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9670
    .return(1)
  __label_1: # endif
.annotate 'line', 9671
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9672
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9673
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9674
    .return(0)
.annotate 'line', 9675

.end # needclosure


.sub 'getsubid' :method
.annotate 'line', 9678
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 9679

.end # getsubid


.sub 'getparamnum' :method
.annotate 'line', 9683
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
.annotate 'line', 9684

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 9688
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
.annotate 'line', 9689

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9692
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9693
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9694
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9696
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9697
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9698
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9699
    $P2 = $P1.'getouter'()
.annotate 'line', 9700
    getattribute $P3, self, 'outer'
.annotate 'line', 9701
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
.annotate 'line', 9702
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 9703
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9704
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 9705
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9706
    eq $S3, 'P', __label_8
.annotate 'line', 9707
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9708
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9709
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9710
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9711
    .return($P4)
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 9714
    .return(__ARG_2)
.annotate 'line', 9715

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 9718
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9719
    unless_null $P1, __label_1
.annotate 'line', 9720
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9721
    unless_null $P1, __label_2
.annotate 'line', 9724
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9725
    unless_null $P1, __label_3
.annotate 'line', 9727
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
.annotate 'line', 9728
    getattribute $P2, self, 'outer'
.annotate 'line', 9729
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 9730
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9731
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9732
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9733
    self.'setusedlex'($S1, $S2)
  __label_6: # endif
  __label_5: # endif
    goto __label_4
  __label_3: # else
.annotate 'line', 9737
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 9739
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9740
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9741
    .return($P1)
.annotate 'line', 9742

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9650
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9753
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9754

.end # MethodStatement


.sub 'ismethod' :method
.annotate 'line', 9755
    .return(1)

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9749
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_112 = "WSubId_112"
.annotate 'line', 9769
    $P1 = __ARG_1.'get'()
.annotate 'line', 9770
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9771
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9772
    $P2 = __ARG_1.'get'()
.annotate 'line', 9773
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 9774
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_112($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9775
    set $P1, $P2
.annotate 'line', 9776
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9777
    $P2 = __ARG_1.'get'()
  __label_2: # endif
.annotate 'line', 9779
    setattribute self, 'name', $P1
.annotate 'line', 9780
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9781
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9782
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9783
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9785
    __ARG_1.'unget'($P2)
  __label_5: # endif
.annotate 'line', 9786

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9789
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9790
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9791
    if_null $P1, __label_1
.annotate 'line', 9792
    getattribute $P2, self, 'name'
.annotate 'line', 9793
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
  __label_1: # endif
.annotate 'line', 9795

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9764
    addattribute $P0, 'name'
.annotate 'line', 9765
    addattribute $P0, 'modifiers'
.annotate 'line', 9766
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_129')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9800
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9801

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_129 = "WSubId_129"
.annotate 'line', 9808
    $P2 = WSubId_50(__ARG_1, __ARG_2, WSubId_129, ')')
    setattribute self, 'params', $P2
.annotate 'line', 9809

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9812
    __ARG_1.'print'('(')
.annotate 'line', 9813
    set $S1, ''
.annotate 'line', 9814
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9815
    __ARG_1.'print'($S1)
.annotate 'line', 9816
    $P1.'emit'(__ARG_1)
.annotate 'line', 9817
    set $S1, ', '
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9819
    __ARG_1.'print'(')')
.annotate 'line', 9820

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9805
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9829
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9830
    setattribute self, 'params', __ARG_3
.annotate 'line', 9831
    setattribute self, 'expr', __ARG_4
.annotate 'line', 9832

.end # MultiAssignStatement


.sub 'optimize' :method
.annotate 'line', 9835
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9836
    .return(self)
.annotate 'line', 9837

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 9840
    getattribute $P1, self, 'expr'
.annotate 'line', 9841
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9842
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9843
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9844
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9845
    __ARG_1.'print'('    ')
.annotate 'line', 9846
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9847
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9848
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9849
    __ARG_1.'say'()
.annotate 'line', 9850

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9823
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9825
    addattribute $P0, 'params'
.annotate 'line', 9826
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9867
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 9868

.end # ClassSpecifier


.sub 'reftype' :method
.annotate 'line', 9869
    .return(0)

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 9873
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 9874

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9863
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9882
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9883
    setattribute self, 'name', __ARG_2
.annotate 'line', 9884

.end # ClassSpecifierStr


.sub 'reftype' :method
.annotate 'line', 9885
    .return(1)

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9889
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9890
    __ARG_1.'print'($S1)
.annotate 'line', 9891

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9877
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9879
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
.annotate 'line', 9900
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9901
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9902
    $P2 = __ARG_1.'get'()
.annotate 'line', 9903
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9904
    WSubId_54('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9905
    $P3 = $P2.'rawstring'()
    push $P1, $P3
.annotate 'line', 9906
    $P2 = __ARG_1.'get'()
.annotate 'line', 9907
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 9908
    $P4 = $P2.'checkop'()
    set $S1, $P4
    if $S1 == ':' goto __label_5
    if $S1 == ',' goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9910
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9914
    WSubId_55('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9917
    $P2 = __ARG_1.'get'()
.annotate 'line', 9918
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9919
    WSubId_54('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9920
    $P3 = $P2.'rawstring'()
    push $P1, $P3
  __label_9: # continue
.annotate 'line', 9921
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9922
    WSubId_4(']', $P2)
  __label_2: # endif
.annotate 'line', 9924
    setattribute self, 'key', $P1
.annotate 'line', 9925

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
.annotate 'line', 9926
    .return(2)

.end # reftype


.sub 'hasHLL' :method
.annotate 'line', 9929
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 9930

.end # hasHLL


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 9934
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9935
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 9936

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9939
    getattribute $P2, self, 'key'
    $P1 = WSubId_30($P2)
    __ARG_1.'print'($P1)
.annotate 'line', 9940

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9894
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9896
    addattribute $P0, 'key'
.annotate 'line', 9897
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9948
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9949
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 9950
    null $P2
  __label_2: # while
.annotate 'line', 9951
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9952
    $P2 = __ARG_1.'get'()
.annotate 'line', 9953
    set $S1, $P2
    push $P1, $S1
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9955
    __ARG_1.'unget'($P2)
.annotate 'line', 9956
    setattribute self, 'key', $P1
.annotate 'line', 9957

.end # ClassSpecifierId


.sub 'reftype' :method
.annotate 'line', 9958
    .return(3)

.end # reftype


.sub 'last' :method
.annotate 'line', 9962
    getattribute $P1, self, 'key'
.annotate 'line', 9963
    $P2 = $P1[-1]
    .return($P2)
.annotate 'line', 9964

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 9967
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9968
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 9969

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9973
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9974
    unless_null $P1, __label_1
.annotate 'line', 9975
    getattribute $P2, self, 'key'
    join $S1, ".", $P2
    getattribute $P3, self, 'start'
    WSubId_83(__ARG_1, $S1, $P3)
.annotate 'line', 9976
    getattribute $P3, self, 'key'
    $P2 = WSubId_30($P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 9978
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
.annotate 'line', 9979

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9982
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 9983
    unless_null $P1, __label_1
.annotate 'line', 9984
    getattribute $P2, self, 'key'
    join $S1, ".", $P2
    getattribute $P3, self, 'start'
    WSubId_83(__ARG_1, $S1, $P3)
.annotate 'line', 9985
    getattribute $P3, self, 'key'
    $P2 = WSubId_30($P3)
    __ARG_1.'say'("new ", __ARG_3, ", ", $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 9988
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
  __label_2: # endif
.annotate 'line', 9990

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9943
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9945
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10003
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 10004
    setattribute self, 'name', __ARG_2
.annotate 'line', 10005
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 10006
    setattribute self, 'classns', $P1
.annotate 'line', 10007

.end # ClassBase


.sub 'getpath' :method
.annotate 'line', 10010
    getattribute $P1, self, 'classns'
    .return($P1)
.annotate 'line', 10011

.end # getpath


.sub 'getclasskey' :method
.annotate 'line', 10014
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
.annotate 'line', 10015

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9997
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9999
    addattribute $P0, 'name'
.annotate 'line', 10000
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]

.sub 'FunctionContainer' :method
.annotate 'line', 10023
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions', $P2
.annotate 'line', 10024

.end # FunctionContainer


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10030
    getattribute $P1, self, 'functions'
.annotate 'line', 10031
    getattribute $P3, __ARG_1, 'name'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 10032
    $P2 = $P1[$S1]
.annotate 'line', 10033
    unless_null $P2, __label_2
.annotate 'line', 10034
    $P1[$S1] = __ARG_1
    goto __label_3
  __label_2: # else
.annotate 'line', 10036
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_4
.annotate 'line', 10037
    $P2.'setmulti'()
  __label_4: # endif
.annotate 'line', 10038
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_5
.annotate 'line', 10039
    __ARG_1.'setmulti'()
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 10041

.end # addfunction


.sub 'find' :method
        .param string __ARG_1
.annotate 'line', 10044
    getattribute $P1, self, 'functions'
.annotate 'line', 10045
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 10046

.end # find

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
.annotate 'line', 10020
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
.annotate 'line', 10060
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10061
    self.'VarContainer'()
.annotate 'line', 10062
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P8.'FunctionContainer'()
    set $P8, $P8
    setattribute self, 'funcont', $P8
.annotate 'line', 10063
    setattribute self, 'parent', __ARG_3
.annotate 'line', 10064
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 10065
    setattribute self, 'items', $P1
.annotate 'line', 10066
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 10067
    setattribute self, 'members', $P2
.annotate 'line', 10069
    $P3 = __ARG_4.'get'()
.annotate 'line', 10070
    $P7 = $P3.'isop'(':')
    if_null $P7, __label_1
    unless $P7 goto __label_1
.annotate 'line', 10071
    $P9 = WSubId_50(__ARG_4, self, WSubId_76)
    setattribute self, 'bases', $P9
.annotate 'line', 10072
    $P3 = __ARG_4.'get'()
  __label_1: # endif
.annotate 'line', 10074
    WSubId_4('{', $P3)
.annotate 'line', 10076
    getattribute $P8, self, 'classns'
    $P7 = $P8.'fullname'()
    WSubId_128(self, '__CLASS__', $P7)
.annotate 'line', 10078
    $P3 = __ARG_4.'get'()
  __label_4: # for condition
    $P7 = $P3.'isop'('}')
    isfalse $I1, $P7
    unless $I1 goto __label_3
.annotate 'line', 10079
    $P8 = $P3.'checkkeyword'()
    set $S1, $P8
    if $S1 == 'function' goto __label_7
    if $S1 == 'var' goto __label_8
    if $S1 == 'const' goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 10081
    new $P4, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P4.'MethodStatement'($P3, __ARG_4, self)
.annotate 'line', 10082
    self.'addmethod'($P4)
.annotate 'line', 10083
    push $P1, $P4
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10086
    $P5 = __ARG_4.'get'()
.annotate 'line', 10087
    $P9 = $P5.'isidentifier'()
    isfalse $I2, $P9
    unless $I2 goto __label_10
.annotate 'line', 10088
    WSubId_54("member identifier", $P5)
  __label_10: # endif
.annotate 'line', 10089
    push $P2, $P5
.annotate 'line', 10090
    $P3 = __ARG_4.'get'()
.annotate 'line', 10091
    $P10 = $P3.'isop'(';')
    isfalse $I3, $P10
    unless $I3 goto __label_11
.annotate 'line', 10092
    WSubId_54("';' in member declaration", $P3)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10095
    $P6 = WSubId_58($P3, __ARG_4, self)
.annotate 'line', 10096
    push $P1, $P6
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10099
    WSubId_55("item in class", $P3)
  __label_5: # switch end
  __label_2: # for iteration
.annotate 'line', 10078
    $P3 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10102

.end # ClassStatement


.sub 'addmethod' :method
        .param pmc __ARG_1
.annotate 'line', 10106
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 10107

.end # addmethod


.sub 'generatesubid' :method
.annotate 'line', 10110
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 10111

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 10114
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 10115

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 10118
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10119

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 10122
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
.annotate 'line', 10123

.end # use_builtin


.sub 'optimize' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 10126
    getattribute $P1, self, 'items'
    WSubId_52($P1)
.annotate 'line', 10127
    .return(self)
.annotate 'line', 10128

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 10131
    getattribute $P3, self, 'classns'
    $P3.'emitnamespace'(__ARG_1)
.annotate 'line', 10132
    getattribute $P3, self, 'items'
    WSubId_66(__ARG_1, $P3)
.annotate 'line', 10134
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 10136
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 10137
    set $I1, 1
.annotate 'line', 10138
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10139
    $P1.'annotate'(__ARG_1)
.annotate 'line', 10140
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 10141
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 10142
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 10143
    __ARG_1.'say'()
.annotate 'line', 10144
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10146
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 10147
    __ARG_1.'annotate'($P2)
.annotate 'line', 10148
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
    goto __label_3
  __label_4: # endfor
.annotate 'line', 10151
    __ARG_1.'say'('.end')
.annotate 'line', 10152

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 10049
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 10051
    addattribute $P0, 'parent'
.annotate 'line', 10052
    addattribute $P0, 'bases'
.annotate 'line', 10053
    addattribute $P0, 'constants'
.annotate 'line', 10054
    addattribute $P0, 'items'
.annotate 'line', 10055
    addattribute $P0, 'members'
.annotate 'line', 10056
    addattribute $P0, 'funcont'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10159
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10160

.end # DeclareClassStatement


.sub 'optimize' :method
.annotate 'line', 10163
    .return(self)
.annotate 'line', 10164

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 10155
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_132')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10172
    $P1 = __ARG_2.'get'()
.annotate 'line', 10173
    $P2 = __ARG_2.'get'()
.annotate 'line', 10174
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 10175
    null $P4
  __label_3: # for condition
.annotate 'line', 10177
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 10178
    $P3.'push'($P1)
.annotate 'line', 10179
    $P1 = __ARG_2.'get'()
  __label_1: # for iteration
.annotate 'line', 10177
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10182
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 10183
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 10184
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 10185
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
    goto __label_5
  __label_4: # else
.annotate 'line', 10188
    __ARG_2.'unget'($P2)
.annotate 'line', 10189
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 10190
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 10191
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
  __label_5: # endif
.annotate 'line', 10193

.end # parseClass


.sub 'open_include' :subid('WSubId_130')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 10201
    getinterp $P1
.annotate 'line', 10206
    $P2 = $P1[9]
.annotate 'line', 10207
    $P3 = $P2[0]
.annotate 'line', 10208
    null $P4
.annotate 'line', 10209
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
.annotate 'line', 10210
    concat $S3, $S1, __ARG_1
    set $S2, $S3
.annotate 'line', 10211
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
.annotate 'line', 10212
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 10213
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 10214
    pop_eh
    goto __label_4
  __label_3:
.annotate 'line', 10211
    .get_results($P7)
    finalize $P7
    pop_eh
  __label_4:
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10219
    isnull $I1, $P4
    box $P6, $I1
    if $P6 goto __label_8
    $P6 = $P4.'is_closed'()
  __label_8:
    if_null $P6, __label_7
    unless $P6 goto __label_7
.annotate 'line', 10220
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 10221
    $P4.'encoding'("utf8")
.annotate 'line', 10222
    .return($P4)
.annotate 'line', 10223

.end # open_include


.sub 'include_parrot' :subid('WSubId_134')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_130 = "WSubId_130"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10227
    $P1 = __ARG_2.'get'()
.annotate 'line', 10228
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 10229
    WSubId_54('literal string', $P1)
  __label_1: # endif
.annotate 'line', 10230
    WSubId_68(';', __ARG_2)
.annotate 'line', 10232
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 10233
    $P2 = WSubId_130($S1, __ARG_1)
.annotate 'line', 10238
    $P4 = $P2.'readline'()
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
  __label_5: # for condition
    $P5 = $P2.'eof'()
    isfalse $I4, $P5
    unless $I4 goto __label_4
.annotate 'line', 10239
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
.annotate 'line', 10240
    set $I1, 12
.annotate 'line', 10241
    null $S3
  __label_9: # while
.annotate 'line', 10242
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 10243
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 10244
    set $I2, $I1
  __label_12: # while
.annotate 'line', 10245
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 10246
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 10247
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 10248
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 10250
    sub $I4, $I2, $I1
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 10251
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 10252
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 10253
    set $I1, $I2
  __label_22: # while
.annotate 'line', 10254
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 10255
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 10256
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 10257
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 10259
    sub $I4, $I2, $I1
    substr $S5, $S2, $I1, $I4
.annotate 'line', 10261
    null $I3
.annotate 'line', 10262
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 10263
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 10265
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 10266
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 10268
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 10267
    $P4 = WSubId_25(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
  __label_7: # endif
  __label_3: # for iteration
.annotate 'line', 10238
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 10272
    $P2.'close'()
.annotate 'line', 10273

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_135')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_130 = "WSubId_130"
.annotate 'line', 10279
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 10280
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 10281
    $P1 = __ARG_2.'get'()
.annotate 'line', 10282
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 10283
    WSubId_54('literal string', $P1)
  __label_2: # endif
.annotate 'line', 10284
    WSubId_68(';', __ARG_2)
.annotate 'line', 10286
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 10287
    $P2 = WSubId_130($S1, __ARG_1)
.annotate 'line', 10289
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 10290
    __ARG_3.'parse'($P3)
.annotate 'line', 10292
    $P2.'close'()
.annotate 'line', 10293

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
.annotate 'line', 10299
    $P1 = __ARG_2.'get'()
.annotate 'line', 10300
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 10301
    WSubId_72(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10302
    WSubId_68(';', __ARG_2)
.annotate 'line', 10303
    .return()
  __label_1: # endif
.annotate 'line', 10305
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
.annotate 'line', 10306
    __ARG_2.'unget'($P1)
.annotate 'line', 10307
    $P2 = WSubId_69(__ARG_2)
.annotate 'line', 10308
    elements $I1, $P2
.annotate 'line', 10309
    ge $I1, 1, __label_3
.annotate 'line', 10310
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 10311
    WSubId_68(';', __ARG_2)
.annotate 'line', 10312
    __ARG_3.'use'($P2)
.annotate 'line', 10313
    .return()
  __label_2: # endif
.annotate 'line', 10315
    $P1 = __ARG_2.'get'()
.annotate 'line', 10317
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 10323
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 10319
    null $S1
    if_null $P1, __label_8
    set $S1, $P1
  __label_8:
.annotate 'line', 10320
    __ARG_3.'addlib'($S1)
.annotate 'line', 10321
    WSubId_68(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 10324
    __ARG_2.'unget'($P1)
.annotate 'line', 10325
    $P3 = WSubId_69(__ARG_2)
.annotate 'line', 10326
    $P1 = __ARG_2.'get'()
.annotate 'line', 10327
    $P5 = $P1.'isop'(';')
    isfalse $I3, $P5
    unless $I3 goto __label_9
.annotate 'line', 10328
    __ARG_2.'unget'($P1)
.annotate 'line', 10329
    null $P5
    $P4 = WSubId_50(__ARG_2, $P5, WSubId_71, ';')
.annotate 'line', 10330
    __ARG_3.'addextern'($P3, $P4)
  __label_9: # endif
.annotate 'line', 10332
    join $S3, '/', $P3
    concat $S4, '"', $S3
    concat $S4, $S4, '.pbc"'
    set $S2, $S4
.annotate 'line', 10333
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 10336
    WSubId_54('string literal or identifier', $P1)
  __label_4: # switch end
.annotate 'line', 10338

.end # parsensUsing


.sub 'emit_push_symbols' :subid('WSubId_131')
        .param string __ARG_1
.annotate 'line', 10344
    concat $S1, "    push symbols, '", __ARG_1
    concat $S1, $S1, "'\n"
    .return($S1)
.annotate 'line', 10345

.end # emit_push_symbols

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10353
    setattribute self, 'module', __ARG_1
.annotate 'line', 10354
    setattribute self, 'names', __ARG_2
.annotate 'line', 10355

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_131 = "WSubId_131"
.annotate 'line', 10360
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 10370
    getattribute $P1, self, 'module'
    join $S1, "'; '", $P1
    concat $S2, "['parrot'; '", $S1
    concat $S2, $S2, "']"
.annotate 'line', 10369
    __ARG_1.'emitget_root_namespace'("srcns", $S2)
.annotate 'line', 10372
    getattribute $P2, self, 'names'
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P1 = WSubId_31($P2, $P3, WSubId_131)
    join $S1, "", $P1
    __ARG_1.'print'($S1)
.annotate 'line', 10373
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
.annotate 'line', 10379

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 10349
    addattribute $P0, 'module'
.annotate 'line', 10350
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
.annotate 'line', 10389
    new $P1, ['ResizableStringArray']
.annotate 'line', 10390
    unless __ARG_2 goto __label_1
.annotate 'line', 10391
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10393
    if_null __ARG_1, __label_3
.annotate 'line', 10394
    push $P1, __ARG_1
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 10396
    setattribute self, 'path', $P1
.annotate 'line', 10397

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
.annotate 'line', 10400
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 10401
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 10402
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 10403
    push $P2, __ARG_1
.annotate 'line', 10404
    setattribute $P1, 'path', $P2
.annotate 'line', 10405
    .return($P1)
.annotate 'line', 10406

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
.annotate 'line', 10409
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 10410
    getattribute $P2, self, 'hll'
.annotate 'line', 10411
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 10412
    unless_null $P2, __label_3
.annotate 'line', 10413
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 10415
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
.annotate 'line', 10416

.end # samehllas


.sub 'fullname' :method
.annotate 'line', 10419
    getattribute $P1, self, 'path'
    join $S1, '.', $P1
.annotate 'line', 10420
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
.annotate 'line', 10421
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 10423
    .return($S1)
  __label_2: # endif
.annotate 'line', 10424

.end # fullname


.sub 'getparrotkey' :method
.annotate 'line', 10427
    getattribute $P1, self, 'path'
.annotate 'line', 10428
    null $S1
.annotate 'line', 10429
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10430
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 10431
    .return($S1)
.annotate 'line', 10432

.end # getparrotkey


.sub 'getparrotrootkey' :method
.annotate 'line', 10435
    getattribute $P1, self, 'path'
.annotate 'line', 10436
    getattribute $P2, self, 'hll'
.annotate 'line', 10437
    set $S1, "[ '"
.annotate 'line', 10438
    if_null $P2, __label_1
.annotate 'line', 10441
    set $S3, $P2
    downcase $S2, $S3
    concat $S1, $S1, $S2
    goto __label_2
  __label_1: # else
.annotate 'line', 10444
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 10445
    concat $S1, $S1, "'"
.annotate 'line', 10446
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 10447
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 10448
    concat $S1, $S1, " ]"
.annotate 'line', 10449
    .return($S1)
.annotate 'line', 10450

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
.annotate 'line', 10453
    getattribute $P1, self, 'path'
.annotate 'line', 10454
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 10455
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10456
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 10457
    __ARG_1.'say'("]")
.annotate 'line', 10458

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10461
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10463
    $P3 = self.'getparrotkey'()
.annotate 'line', 10462
    $P2 = WSubId_26("    new %0, %1", __ARG_3, $P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10466
    $P5 = self.'getparrotrootkey'()
.annotate 'line', 10465
    $P4 = WSubId_26("    root_new %0, %1", __ARG_3, $P5)
    __ARG_1.'print'($P4)
  __label_2: # endif
.annotate 'line', 10467
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 10468
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 10469
    __ARG_1.'say'()
.annotate 'line', 10470

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 10473
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10474
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10476
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
.annotate 'line', 10477

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10480
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 10482
    $P5 = self.'getparrotkey'()
.annotate 'line', 10481
    $P4 = WSubId_26("    get_class %0, %1", __ARG_3, $P5)
    __ARG_1.'say'($P4)
    goto __label_2
  __label_1: # else
.annotate 'line', 10487
    getattribute $P1, self, 'hll'
.annotate 'line', 10488
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 10489
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 10490
    if_null $P1, __label_5
    set $S3, $P1
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 10491
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 10494
    join $S3, "'; '", $P2
.annotate 'line', 10492
    $P3 = WSubId_26("    get_root_global %0, ['%1'; '%2'], '%3'", __ARG_3, $S2, $S3, $S1)
    __ARG_1.'say'($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 10496
    $P4 = WSubId_26("    get_root_global %0, ['%1'], '%2'", __ARG_3, $S2, $S1)
    __ARG_1.'say'($P4)
  __label_7: # endif
.annotate 'line', 10499
    $P3 = WSubId_26("    get_class %0, %0", __ARG_3)
    __ARG_1.'say'($P3)
  __label_2: # endif
.annotate 'line', 10501

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 10504
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10505
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10507
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
.annotate 'line', 10508

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 10384
    addattribute $P0, 'hll'
.annotate 'line', 10385
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_128 = "WSubId_128"
.annotate 'line', 10527
    self.'VarContainer'()
.annotate 'line', 10528
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 10529
    unless_null __ARG_2, __label_1
.annotate 'line', 10530
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 10531
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10532
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 10533
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P2.'FunctionContainer'()
    set $P2, $P2
    setattribute self, 'funcont', $P2
.annotate 'line', 10534
    $P1 = __ARG_1.'fullname'()
    WSubId_128(self, '__NAMESPACE__', $P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 10537
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 10538
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 10539
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10540
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 10541
    getattribute $P2, __ARG_2, 'funcont'
    setattribute self, 'funcont', $P2
  __label_2: # endif
.annotate 'line', 10543
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
.annotate 'line', 10544

.end # NamespaceBase


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10547
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 10548

.end # addfunction


.sub 'fixnamespaces' :method
.annotate 'line', 10551
    null $P1
.annotate 'line', 10552
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10553
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10554
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 10555
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 10556
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
.annotate 'line', 10557

.end # fixnamespaces


.sub 'getpath' :method
.annotate 'line', 10560
    getattribute $P1, self, 'nspath'
    .return($P1)
.annotate 'line', 10561

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 10564
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 10565
    .return()
  __label_1: # endif
.annotate 'line', 10566
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10567
    $P2 = WSubId_124($P1, __ARG_1)
    if_null $P2, __label_2
.annotate 'line', 10568
    .return()
  __label_2: # endif
.annotate 'line', 10569
    push $P1, __ARG_1
.annotate 'line', 10570

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
.annotate 'line', 10573
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 10574
    if_null $P1, __label_1
.annotate 'line', 10575
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 10576
    self.'addfunction'($P1)
  __label_3: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 10579
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 10580
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 10581
    if_null $P2, __label_5
.annotate 'line', 10582
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 10583
    if_null $P1, __label_6
.annotate 'line', 10584
    self.'createvarused'($S1, $P1)
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif
.annotate 'line', 10587

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
.annotate 'line', 10590
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10591
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10592
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 10593
    .return($P2)
.annotate 'line', 10594

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
.annotate 'line', 10597
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10598
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10599
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10600
    .tailcall self.'getusedns'(__ARG_1)
.annotate 'line', 10601

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10605
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 10606
    getattribute $P2, self, 'externals'
.annotate 'line', 10607
    unless_null $P2, __label_1
.annotate 'line', 10608
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10610
    push $P2, $P1
  __label_2: # endif
.annotate 'line', 10611

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
.annotate 'line', 10615
    null $P1
.annotate 'line', 10616
    getattribute $P3, self, 'classes'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10617
    getattribute $P5, $P1, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10618
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10619
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_5
    iter $P6, $P3
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P2, $P6
.annotate 'line', 10620
    $P1 = $P2.'checkclass_base'(__ARG_1)
    if_null $P1, __label_6
.annotate 'line', 10621
    .return($P1)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P3
.annotate 'line', 10622
    .return($P3)
.annotate 'line', 10623

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
.annotate 'line', 10626
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10627
    if_null $P1, __label_1
.annotate 'line', 10628
    .return($P1)
  __label_1: # endif
.annotate 'line', 10629
    getattribute $P2, self, 'funcont'
.annotate 'line', 10630
    .tailcall $P2.'find'(__ARG_1)
.annotate 'line', 10631

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
.annotate 'line', 10636
    elements $I1, __ARG_1
.annotate 'line', 10637
    null $S1
.annotate 'line', 10638
    null $P1
.annotate 'line', 10639
    null $P2
.annotate 'line', 10640
    sub $I2, $I1, __ARG_3
    if $I2 == 0 goto __label_3
    if $I2 == 1 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 10644
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 10645
    if __ARG_2 == 1 goto __label_7
    if __ARG_2 == 2 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 10647
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 10649
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 10652
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 10653
    .return($P1)
  __label_9: # endif
.annotate 'line', 10654
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 10655
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 10656
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 10663
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 10664
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 10665
    isnull $I6, $P2
    not $I6
    unless $I6 goto __label_14
.annotate 'line', 10666
    add $I7, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I7)
    isnull $I6, $P1
    not $I6
  __label_14:
    unless $I6 goto __label_13
.annotate 'line', 10667
    .return($P1)
  __label_13: # endif
.annotate 'line', 10668
    $P2 = self.'getusedns'($S1)
.annotate 'line', 10669
    isnull $I8, $P2
    not $I8
    unless $I8 goto __label_16
.annotate 'line', 10670
    add $I9, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I9)
    isnull $I8, $P1
    not $I8
  __label_16:
    unless $I8 goto __label_15
.annotate 'line', 10671
    .return($P1)
  __label_15: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 10673
    .return($P3)
.annotate 'line', 10674

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10677
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 10678
    getattribute $P2, self, 'namespaces'
    push $P2, $P1
.annotate 'line', 10679
    .return($P1)
.annotate 'line', 10680

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10683
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 10684
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 10685
    getattribute $P3, self, 'namespaces'
    push $P3, $P2
.annotate 'line', 10686
    getattribute $P3, self, 'items'
    push $P3, $P2
.annotate 'line', 10687
    .return($P2)
.annotate 'line', 10688

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
.annotate 'line', 10691
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 10692

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
.annotate 'line', 10695
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 10696
    getattribute $P1, self, 'items'
    push $P1, __ARG_1
.annotate 'line', 10697

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 10700
    $P1 = __ARG_2.'get'()
.annotate 'line', 10701
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10702
    $P1 = __ARG_2.'get'()
.annotate 'line', 10704
    set $P2, self
  __label_4: # for condition
.annotate 'line', 10705
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 10706
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10707
    $P5 = __ARG_2.'get'()
    set $S1, $P5
  __label_2: # for iteration
.annotate 'line', 10705
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10710
    null $P3
.annotate 'line', 10711
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 10712
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10713
    $P1 = __ARG_2.'get'()
  __label_5: # endif
.annotate 'line', 10716
    WSubId_4('{', $P1)
.annotate 'line', 10717
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10718
    $P4.'parse'(__ARG_2)
.annotate 'line', 10719

.end # parsenamespace


.sub 'parseextern' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 10724
    $P1 = __ARG_1.'get'()
.annotate 'line', 10725
    $P3 = $P1.'iskeyword'('function')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 10726
    WSubId_1('Unsupported extern', $P1)
  __label_1: # endif
.annotate 'line', 10727
    $P1 = __ARG_1.'get'()
.annotate 'line', 10728
    WSubId_108($P1)
.annotate 'line', 10729
    WSubId_68(';', __ARG_1)
.annotate 'line', 10730
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P2.'FunctionExtern'($P1, self)
.annotate 'line', 10731
    self.'addfunction'($P2)
.annotate 'line', 10732

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
.annotate 'line', 10735
    getattribute $P1, self, 'items'
.annotate 'line', 10736
    null $P2
.annotate 'line', 10737
    $P2 = __ARG_1.'get'()
  __label_3: # for condition
    $P5 = $P2.'iseof'()
    if $P5 goto __label_4
    $P5 = $P2.'isop'('}')
  __label_4:
    isfalse $I1, $P5
    unless $I1 goto __label_2
.annotate 'line', 10739
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
.annotate 'line', 10741
    self.'parsenamespace'($P2, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10744
    $P3 = WSubId_58($P2, __ARG_1, self)
.annotate 'line', 10745
    push $P1, $P3
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10748
    new $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P4.'FunctionStatement'($P2, __ARG_1, self)
.annotate 'line', 10749
    getattribute $P7, $P4, 'name'
    null $S1
    if_null $P7, __label_17
    set $S1, $P7
  __label_17:
.annotate 'line', 10750
    self.'addfunction'($P4)
.annotate 'line', 10751
    push $P1, $P4
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 10754
    WSubId_132($P2, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 10757
    self.'parseextern'(__ARG_1)
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 10760
    WSubId_133($P2, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 10763
    WSubId_134($P2, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 10766
    WSubId_135($P2, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 10769
    $P2 = __ARG_1.'get'()
.annotate 'line', 10770
    $P8 = $P2.'isstring'()
    isfalse $I2, $P8
    unless $I2 goto __label_18
.annotate 'line', 10771
    WSubId_54('string literal', $P2)
  __label_18: # endif
.annotate 'line', 10772
    WSubId_68(';', __ARG_1)
.annotate 'line', 10773
    new $P11, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P11.'StringLiteral'(self, $P2)
    set $P10, $P11
    $P9 = $P10.'getPirString'()
    self.'addload'($P9)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 10776
    $P2 = __ARG_1.'get'()
.annotate 'line', 10777
    $P12 = $P2.'isstring'()
    isfalse $I3, $P12
    unless $I3 goto __label_19
.annotate 'line', 10778
    WSubId_54('string literal', $P2)
  __label_19: # endif
.annotate 'line', 10779
    WSubId_68(';', __ARG_1)
.annotate 'line', 10780
    new $P15, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P15.'StringLiteral'(self, $P2)
    set $P14, $P15
    $P13 = $P14.'getPirString'()
    self.'addlib'($P13)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10783
    WSubId_55("token", $P2)
  __label_5: # switch end
  __label_1: # for iteration
.annotate 'line', 10737
    $P2 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10786
    $P5 = $P2.'iseof'()
    if_null $P5, __label_20
    unless $P5 goto __label_20
.annotate 'line', 10787
    self.'unclosed_ns'()
    goto __label_21
  __label_20: # else
.annotate 'line', 10789
    self.'close_ns'($P2)
  __label_21: # endif
.annotate 'line', 10790

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_52 = "WSubId_52"
.annotate 'line', 10793
    getattribute $P1, self, 'items'
    WSubId_52($P1)
.annotate 'line', 10794

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 10797
    $P1 = self.'getpath'()
.annotate 'line', 10799
    set $I1, 1
.annotate 'line', 10801
    getattribute $P2, self, 'externals'
.annotate 'line', 10802
    if_null $P2, __label_1
.annotate 'line', 10803
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10804
    null $I1
.annotate 'line', 10805
    WSubId_66(__ARG_1, $P2)
  __label_1: # endif
.annotate 'line', 10808
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
.annotate 'line', 10809
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 10810
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 10811
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10813
    unless $I1 goto __label_7
.annotate 'line', 10814
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10815
    null $I1
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10817
    $P3.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10819

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 10515
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 10517
    addattribute $P0, 'nspath'
.annotate 'line', 10518
    addattribute $P0, 'externals'
.annotate 'line', 10519
    addattribute $P0, 'namespaces'
.annotate 'line', 10520
    addattribute $P0, 'classes'
.annotate 'line', 10521
    addattribute $P0, 'funcont'
.annotate 'line', 10522
    addattribute $P0, 'items'
.annotate 'line', 10523
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 10837
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10838
    null $I1
.annotate 'line', 10839
    if_null __ARG_5, __label_1
.annotate 'line', 10840
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 10841
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 10842
    set $I1, 1
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 10845
    unless $I1 goto __label_4
.annotate 'line', 10846
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 10847
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 10848
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10850
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10851
    setattribute self, 'start', __ARG_2
.annotate 'line', 10852
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10853
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 10854

.end # NamespaceStatement


.sub 'dowarnings' :method
.annotate 'line', 10857
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 10858

.end # dowarnings


.sub 'generatesubid' :method
.annotate 'line', 10861
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 10862

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 10865
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 10866

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 10869
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
.annotate 'line', 10870

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 10873
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
.annotate 'line', 10874

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 10877
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10878
    unless_null $P1, __label_1
.annotate 'line', 10879
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10880
    .return($P1)
.annotate 'line', 10881

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 10884
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10885
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10886
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10887
    .return($P1)
.annotate 'line', 10888

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 10891
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
.annotate 'line', 10892

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1

.end # close_ns


.sub 'optimize' :method
.annotate 'line', 10899
    getattribute $P1, self, 'modifier'
.annotate 'line', 10900
    if_null $P1, __label_1
.annotate 'line', 10901
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10902
    self.'optimize_base'()
.annotate 'line', 10903
    .return(self)
.annotate 'line', 10904

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10907
    getattribute $P1, self, 'hll'
.annotate 'line', 10908
    if_null $P1, __label_1
.annotate 'line', 10909
    $P2 = WSubId_26(".HLL '%0'", $P1)
    __ARG_1.'say'($P2)
  __label_1: # endif
.annotate 'line', 10911
    self.'emit_base'(__ARG_1)
.annotate 'line', 10913
    if_null $P1, __label_2
.annotate 'line', 10914
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
.annotate 'line', 10915

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10826
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10828
    addattribute $P0, 'parent'
.annotate 'line', 10829
    addattribute $P0, 'start'
.annotate 'line', 10830
    addattribute $P0, 'name'
.annotate 'line', 10831
    addattribute $P0, 'modifier'
.annotate 'line', 10832
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_loadlib' :subid('WSubId_136')
        .param string __ARG_1
.annotate 'line', 10924
    concat $S1, '.loadlib ', __ARG_1
    .return($S1)
.annotate 'line', 10925

.end # emit_loadlib


.sub 'emit_loadbytecode' :subid('WSubId_137')
        .param string __ARG_1
.annotate 'line', 10929
    concat $S1, '    load_bytecode ', __ARG_1
    .return($S1)
.annotate 'line', 10930

.end # emit_loadbytecode

.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
.annotate 'line', 10942
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10943
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10944
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 10945
    box $P1, 0
    setattribute self, 'subidgen', $P1
.annotate 'line', 10946

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 10949
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 10950
    $P1[__ARG_1] = 1
.annotate 'line', 10951

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 10955
    getattribute $P1, self, 'subidgen'
    inc $P1
    set $I1, $P1
.annotate 'line', 10956
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
.annotate 'line', 10957

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 10961
    getattribute $P1, self, 'libs'
.annotate 'line', 10962
    unless_null $P1, __label_1
.annotate 'line', 10963
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10964
    $P1[__ARG_1] = 1
.annotate 'line', 10965

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 10968
    getattribute $P1, self, 'loads'
.annotate 'line', 10969
    unless_null $P1, __label_1
.annotate 'line', 10970
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10971
    $P1[__ARG_1] = 1
.annotate 'line', 10972

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 10975
    .tailcall self.'checkclass_base'(__ARG_1)
.annotate 'line', 10976

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 10979
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10980

.end # scopesearch


.sub 'unclosed_ns' :method

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.annotate 'line', 10987
    WSubId_1('Cannot close root namespace', __ARG_1)
.annotate 'line', 10988

.end # close_ns


.sub 'dowarnings' :method
.annotate 'line', 10991
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 10992

.end # dowarnings


.sub 'optimize' :method
.annotate 'line', 10995
    self.'optimize_base'()
.annotate 'line', 10996
    .return(self)
.annotate 'line', 10997

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_136 = "WSubId_136"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_137 = "WSubId_137"
.annotate 'line', 11000
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 11003
    $P4 = $P1['chomp']
    if_null $P4, __label_1
.annotate 'line', 11004
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 11008
    split $P4, " ", "acos asin atan cos exp ln sin tan pow"
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $S1, $P5
.annotate 'line', 11009
    $P6 = $P1[$S1]
    if_null $P6, __label_4
.annotate 'line', 11010
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 11014
    getattribute $P2, self, 'libs'
.annotate 'line', 11015
    if_null $P2, __label_5
.annotate 'line', 11016
    root_new $P6, ['parrot';'ResizablePMCArray']
    $P4 = WSubId_31($P2, $P6, WSubId_136)
    join $S2, "\n", $P4
    __ARG_1.'say'($S2)
  __label_5: # endif
.annotate 'line', 11018
    getattribute $P3, self, 'loads'
.annotate 'line', 11019
    if_null $P3, __label_6
.annotate 'line', 11026
    root_new $P7, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_31($P3, $P7, WSubId_137)
    join $S2, "\n", $P6
.annotate 'line', 11020
    $P4 = WSubId_26(".sub initial_load_bytecode :anon :load :init\n%0\n.end\n", $S2)
    __ARG_1.'say'($P4)
  __label_6: # endif
.annotate 'line', 11028
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_8
    isnull $I1, $P3
    not $I1
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 11029
    __ARG_1.'comment'('end libs')
  __label_7: # endif
.annotate 'line', 11031
    self.'emit_base'(__ARG_1)
.annotate 'line', 11032

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 11035
    getattribute $P1, self, 'locals'
.annotate 'line', 11036
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
.annotate 'line', 11037
    $P2 = $P1[$S1]
.annotate 'line', 11038
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 11039
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 11040
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 11042
    $P3 = $P2.'getvalue'()
.annotate 'line', 11043
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11045

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10932
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10934
    addattribute $P0, 'unit'
.annotate 'line', 10935
    addattribute $P0, 'bultins_used'
.annotate 'line', 10936
    addattribute $P0, 'libs'
.annotate 'line', 10937
    addattribute $P0, 'loads'
.annotate 'line', 10938
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11057
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 11058
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
.annotate 'line', 11059

.end # Builtin


.sub 'getname' :method
.annotate 'line', 11060
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
.annotate 'line', 11063
    getattribute $P1, self, 'variants'
    push $P1, __ARG_1
.annotate 'line', 11064

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 11053
    addattribute $P0, 'name'
.annotate 'line', 11054
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
.annotate 'line', 11074
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
.annotate 'line', 11075

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 11078
    getattribute $P1, self, 'entries'
.annotate 'line', 11079
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 11080
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 11081
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 11083
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
.annotate 'line', 11084

.end # add


.sub 'put' :method
        .param pmc __ARG_1
.annotate 'line', 11087
    getattribute $P1, self, 'entries'
.annotate 'line', 11088
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 11089
    $P3 = $P1[$S1]
    __ARG_1.'addfunction'($P3)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11090

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 11071
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_139 = "WSubId_139"
.annotate 'line', 11100
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 11101
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 11105
    WSubId_138($P1, 'false', 0)
.annotate 'line', 11106
    WSubId_138($P1, 'true', 1)
.annotate 'line', 11111
    WSubId_128($P1, '__STAGE__', "3")
.annotate 'line', 11114
    WSubId_138($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 11117
    WSubId_138($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 11120
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 11122
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 11123
    WSubId_139($P3)
.annotate 'line', 11124
    $P3.'put'($P2)
.annotate 'line', 11126
    $P1.'usenamespace'($P2)
.annotate 'line', 11128
    setattribute self, 'rootns', $P1
.annotate 'line', 11129

.end # WinxedCompileUnit


.sub 'dowarnings' :method
.annotate 'line', 11132
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
.annotate 'line', 11133

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 11136
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 11137
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
.annotate 'line', 11138

.end # parse


.sub 'optimize' :method
.annotate 'line', 11141
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
.annotate 'line', 11142

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 11145
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 11146
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 11147
    __ARG_1.'say'('')
.annotate 'line', 11149
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 11151
    __ARG_1.'comment'('End generated code')
.annotate 'line', 11152

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 11155
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 11156
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 11158
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 11160
    __ARG_1.'comment'('End')
.annotate 'line', 11161

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 11095
    addattribute $P0, 'rootns'
.annotate 'line', 11096
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
.annotate 'line', 11170
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 4
    $P1[1] = $I1
    set $I1, 1
    $P1[2] = $I1
.annotate 'line', 11171
    .return($P1)
.annotate 'line', 11172

.end # version


.sub 'version_string' :method
.annotate 'line', 11175
    $P1 = self.'version'()
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
.annotate 'line', 11176

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
        .param int __ARG_6
.annotate 'line', 11179
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 11180
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 11181
    null $P1
.annotate 'line', 11182
    unless_null __ARG_3, __label_2
.annotate 'line', 11183
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11184
    $P1.'open'('__eval__', 'w')
    goto __label_3
  __label_2: # else
.annotate 'line', 11187
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 11188
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1, __ARG_6)
.annotate 'line', 11189
    unless __ARG_4 goto __label_4
.annotate 'line', 11190
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 11191
    unless __ARG_5 goto __label_5
.annotate 'line', 11192
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 11193
    __ARG_1.'emit'($P2)
.annotate 'line', 11194
    $P2.'close'()
.annotate 'line', 11195
    if_null __ARG_3, __label_6
.annotate 'line', 11196
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
.annotate 'line', 11198
    $P1.'close'()
.annotate 'line', 11199
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 11200
    null $P3
.annotate 'line', 11201
    set $S2, __ARG_2
    if $S2 == 'pir' goto __label_11
    if $S2 == 'pbc' goto __label_12
    if $S2 == '' goto __label_13
    goto __label_10
  __label_11: # case
.annotate 'line', 11203
    new $P3, [ 'String' ]
.annotate 'line', 11204
    assign $P3, $S1
    goto __label_9 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 11208
    compreg $P4, 'PIR'
.annotate 'line', 11209
    $P3 = $P4($S1)
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 11212
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
    die $S5
  __label_9: # switch end
.annotate 'line', 11214
    .return($P3)
  __label_7: # endif
.annotate 'line', 11216

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
.annotate 'line', 11219
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11220
    $P1.'open'('__eval__', 'w')
.annotate 'line', 11221
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1, 1)
.annotate 'line', 11222
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 11223
    $P2.'close'()
.annotate 'line', 11224
    $P1.'close'()
.annotate 'line', 11225
    .tailcall $P1.'read'(0)
.annotate 'line', 11226

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 11234
    unless_null __ARG_2, __label_1
.annotate 'line', 11235
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 11236
    new $P1, [ 'StringHandle' ]
.annotate 'line', 11237
    $P1.'open'('__eval__', 'w')
.annotate 'line', 11238
    $P1.'puts'(__ARG_1)
.annotate 'line', 11239
    $P1.'close'()
.annotate 'line', 11240
    $P1.'open'('__eval__', 'r')
.annotate 'line', 11241
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 11242
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 11243
    $P3.'parse'($P2)
.annotate 'line', 11244
    $P1.'close'()
.annotate 'line', 11245
    $P3.'optimize'()
.annotate 'line', 11246
    ne __ARG_2, 'include', __label_2
.annotate 'line', 11247
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 11249
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 11250

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 11259
    unless_null __ARG_2, __label_1
.annotate 'line', 11260
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 11261
    new $P1, [ 'FileHandle' ]
.annotate 'line', 11262
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 11263
    $P1.'encoding'('utf8')
.annotate 'line', 11264
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 11265
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 11266
    $P3.'parse'($P2)
.annotate 'line', 11267
    $P1.'close'()
.annotate 'line', 11268
    $P3.'optimize'()
.annotate 'line', 11269
    ne __ARG_2, 'include', __label_2
.annotate 'line', 11270
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 11272
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 11273

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
.annotate 'line', 11282
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 11283
    compreg 'winxed', $P1
.annotate 'line', 11284

.end # initializer

# End generated code
