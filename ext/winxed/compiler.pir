# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ 'Winxed'; 'Compiler' ]

.sub 'sformat' :subid('WSubId_45')
        .param string __ARG_1
        .param pmc __ARG_2 :slurpy
.annotate 'file', 'winxedst2.winxed'
.annotate 'line', 56
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 57
    $P1.'append_format'(__ARG_1, __ARG_2 :flat)
.annotate 'line', 58
    set $S1, $P1
    .return($S1)
.annotate 'line', 59

.end # sformat


.sub 'bindfirst' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2 :slurpy
.annotate 'line', 92
.lex '__WLEX_1', __ARG_1
.lex '__WLEX_2', __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
.annotate 'line', 94
    newclosure $P1, WSubId_2
    .return($P1)
.annotate 'line', 98

.end # bindfirst


.sub '' :anon :subid('WSubId_2') :outer('WSubId_1')
        .param pmc __ARG_3 :slurpy
.annotate 'line', 94
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.annotate 'line', 96
    .tailcall $P1($P2 :flat, __ARG_3 :flat)
.annotate 'line', 97

.end # WSubId_2


.sub 'bindlast' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2 :slurpy
.annotate 'line', 100
.lex '__WLEX_1', __ARG_1
.lex '__WLEX_2', __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
.annotate 'line', 102
    newclosure $P1, WSubId_4
    .return($P1)
.annotate 'line', 106

.end # bindlast


.sub '' :anon :subid('WSubId_4') :outer('WSubId_3')
        .param pmc __ARG_3 :slurpy
.annotate 'line', 102
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.annotate 'line', 104
    .tailcall $P1(__ARG_3 :flat, $P2 :flat)
.annotate 'line', 105

.end # WSubId_4


.sub 'bindmethod' :subid('WSubId_5')
        .param string __ARG_1
.annotate 'line', 108
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
.annotate 'line', 110
    newclosure $P1, WSubId_6
    .return($P1)
.annotate 'line', 114

.end # bindmethod


.sub '' :anon :subid('WSubId_6') :outer('WSubId_5')
        .param pmc __ARG_2
        .param pmc __ARG_3 :slurpy
.annotate 'line', 110
    find_lex $S1, '__WLEX_1'
.annotate 'line', 112
    find_lex $S2, '__WLEX_1'
    .tailcall __ARG_2.$S2(__ARG_3 :flat)
.annotate 'line', 113

.end # WSubId_6


.sub 'method_fun' :subid('WSubId_7')
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 116
.lex '__WLEX_1', __ARG_1
.lex '__WLEX_2', $P1
.const 'Sub' WSubId_8 = "WSubId_8"
.annotate 'line', 118
    find_method $P1, __ARG_1, __ARG_2
.annotate 'line', 119
    newclosure $P2, WSubId_8
    .return($P2)
.annotate 'line', 123

.end # method_fun


.sub '' :anon :subid('WSubId_8') :outer('WSubId_7')
        .param pmc __ARG_3 :slurpy
.annotate 'line', 119
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.annotate 'line', 121
    .tailcall $P1.$P2(__ARG_3 :flat)
.annotate 'line', 122

.end # WSubId_8


.sub 'addprefix' :subid('WSubId_9')
        .param string __ARG_1
.annotate 'line', 125
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_10 = "WSubId_10"
.annotate 'line', 127
    newclosure $P1, WSubId_10
    .return($P1)
.annotate 'line', 128

.end # addprefix


.sub '' :anon :subid('WSubId_10') :outer('WSubId_9')
        .param string __ARG_2
.annotate 'line', 127
    find_lex $S1, '__WLEX_1'
    find_lex $S2, '__WLEX_1'
    concat $S3, $S2, __ARG_2
    .return($S3)

.end # WSubId_10

.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]

.sub 'WinxedCompilerError' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
        .param int __ARG_4 :optional
.annotate 'line', 158
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 159
    box $P1, __ARG_2
    setattribute self, 'message', $P1
.annotate 'line', 160
    box $P1, __ARG_3
    setattribute self, 'filename', $P1
.annotate 'line', 161
    box $P1, __ARG_4
    setattribute self, 'line', $P1
.annotate 'line', 162

.end # WinxedCompilerError

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 147
    addattribute $P0, 'type'
.annotate 'line', 148
    addattribute $P0, 'filename'
.annotate 'line', 149
    addattribute $P0, 'line'
.annotate 'line', 150
    addattribute $P0, 'message'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Warn' :subid('WSubId_42')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.annotate 'line', 167
    getstderr $P1
.annotate 'line', 168
    $P1.'print'('WARNING: ')
.annotate 'line', 169
    $P1.'print'(__ARG_1)
.annotate 'line', 170
    if_null __ARG_2, __label_1
.annotate 'line', 171
    $P1.'print'(' near ')
.annotate 'line', 172
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
  __label_1: # endif
.annotate 'line', 174
    $P1.'print'("\n")
.annotate 'line', 175

.end # Warn


.sub 'InternalError' :subid('WSubId_30')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
.annotate 'line', 179
    unless __ARG_3 goto __label_1
.annotate 'line', 180
    __ARG_2 = __ARG_2.'getstart'()
.annotate 'line', 181
    $P2 = __ARG_2.'show'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 182
    concat $S2, __ARG_1, ' near '
    concat $S2, $S2, $S1
    set __ARG_1, $S2
  __label_1: # endif
.annotate 'line', 184
    unless __ARG_3 goto __label_4
.annotate 'line', 185
    new $P2, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 186
    $P3 = __ARG_2.'filename'()
    $P4 = __ARG_2.'linenum'()
    $P2.'WinxedCompilerError'('internal', __ARG_1, $P3, $P4)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 187
    new $P6, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P6.'WinxedCompilerError'('internal', __ARG_1)
    set $P5, $P6
    set $P1, $P5
  __label_3:
.annotate 'line', 188
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2
.annotate 'line', 189

.end # InternalError


.sub 'SyntaxError' :subid('WSubId_25')
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 193
    if_null __ARG_2, __label_1
.annotate 'line', 194
    __ARG_2 = __ARG_2.'getstart'()
  __label_1: # endif
.annotate 'line', 195
    if_null __ARG_2, __label_3
    $P1 = __ARG_2.'linenum'()
    goto __label_2
  __label_3:
    box $P1, -1
  __label_2:
    set $I1, $P1
.annotate 'line', 196
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
.annotate 'line', 197
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S2, ' near ', $S3
.annotate 'line', 198
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
.annotate 'line', 200
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
.annotate 'line', 198
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1
.annotate 'line', 202

.end # SyntaxError


.sub 'NoLeftSide' :subid('WSubId_88')
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 206
    WSubId_25('Not a left-side expression', __ARG_1)
.annotate 'line', 207

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_69')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 211
    concat $S1, "Expected ", __ARG_1
    WSubId_25($S1, __ARG_2)
.annotate 'line', 212

.end # Expected


.sub 'Unexpected' :subid('WSubId_70')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 216
    concat $S1, "Unexpected ", __ARG_1
    WSubId_25($S1, __ARG_2)
.annotate 'line', 217

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_27')
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 221
    WSubId_25("Expected identifier", __ARG_1)
.annotate 'line', 222

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_26')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 226
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_25($S1, __ARG_2)
.annotate 'line', 227

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_28')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 231
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 232
    WSubId_26(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 233

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_29')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 237
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 238
    WSubId_26(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 239

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_123')
        .param pmc __ARG_1
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 243
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 244
    WSubId_27(__ARG_1)
  __label_1: # endif
.annotate 'line', 245

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_83')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 249
    $P1 = __ARG_2.'get'()
.annotate 'line', 250
    WSubId_28(__ARG_1, $P1)
.annotate 'line', 251

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_125')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_29 = "WSubId_29"
.annotate 'line', 255
    $P1 = __ARG_2.'get'()
.annotate 'line', 256
    WSubId_29(__ARG_1, $P1)
.annotate 'line', 257

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_90')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 261
    concat $S1, "Variable '", __ARG_1
    concat $S1, $S1, "' is not defined"
    WSubId_25($S1, __ARG_2)
.annotate 'line', 262

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
.annotate 'line', 274
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 275
    box $P1, __ARG_2
    setattribute self, 'line', $P1
.annotate 'line', 276

.end # Token


.sub 'getstart' :method
.annotate 'line', 277
    .return(self)

.end # getstart


.sub 'iseof' :method
.annotate 'line', 279
    .return(0)

.end # iseof


.sub 'iscomment' :method
.annotate 'line', 280
    .return(0)

.end # iscomment


.sub 'isidentifier' :method
.annotate 'line', 281
    .return(0)

.end # isidentifier


.sub 'isint' :method
.annotate 'line', 282
    .return(0)

.end # isint


.sub 'isfloat' :method
.annotate 'line', 283
    .return(0)

.end # isfloat


.sub 'isstring' :method
.annotate 'line', 284
    .return(0)

.end # isstring


.sub 'issinglequoted' :method
.annotate 'line', 285
    .return(0)

.end # issinglequoted


.sub 'getintvalue' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 289
    WSubId_30('Not a literal int', self)
.annotate 'line', 290

.end # getintvalue


.sub 'rawstring' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 293
    WSubId_30('Not a literal string', self)
.annotate 'line', 294

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 297
    WSubId_27(self)
.annotate 'line', 298

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
.annotate 'line', 299
    .return(0)

.end # iskeyword


.sub 'checkkeyword' :method
.annotate 'line', 300
    .return(0)

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
.annotate 'line', 301
    .return(0)

.end # isop


.sub 'checkop' :method
.annotate 'line', 302
    .return('')

.end # checkop


.sub 'viewable' :method
.annotate 'line', 303
    .return('(unknown)')

.end # viewable


.sub 'filename' :method
.annotate 'line', 304
    getattribute $P1, self, 'file'
    .return($P1)

.end # filename


.sub 'linenum' :method
.annotate 'line', 305
    getattribute $P1, self, 'line'
    .return($P1)

.end # linenum


.sub 'show' :method
.annotate 'line', 308
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 309
    getattribute $P1, self, 'file'
    set $S2, $P1
    getattribute $P2, self, 'line'
    set $S3, $P2
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
.annotate 'line', 310

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
.annotate 'line', 270
    addattribute $P0, 'file'
.annotate 'line', 271
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
.annotate 'line', 317
    self.'Token'(__ARG_1, 0)
.annotate 'line', 318

.end # TokenEof


.sub 'iseof' :method
.annotate 'line', 319
    .return(1)

.end # iseof


.sub 'viewable' :method
.annotate 'line', 320
    .return('(End of file)')

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 313
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 328
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 329
    box $P1, __ARG_3
    setattribute self, 'str', $P1
.annotate 'line', 330

.end # TokenWithVal


.sub 'get_string' :method :vtable
.annotate 'line', 331
    getattribute $P1, self, 'str'
    .return($P1)

.end # get_string


.sub 'viewable' :method
.annotate 'line', 334
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 335

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 323
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 325
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 342
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 343

.end # TokenComment


.sub 'iscomment' :method
.annotate 'line', 344
    .return(1)

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 338
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 351
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 352

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
.annotate 'line', 355
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
.annotate 'line', 356

.end # isop


.sub 'checkop' :method
.annotate 'line', 359
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
.annotate 'line', 360

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 347
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 367
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 368

.end # TokenIdentifier


.sub 'isidentifier' :method
.annotate 'line', 369
    .return(1)

.end # isidentifier


.sub 'getidentifier' :method
.annotate 'line', 372
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 373

.end # getidentifier


.sub 'checkkeyword' :method
.annotate 'line', 376
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
.annotate 'line', 377

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
.annotate 'line', 380
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
.annotate 'line', 381

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 363
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
.annotate 'line', 386
    .return(1)

.end # isstring


.sub 'rawstring' :method
.annotate 'line', 389
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 390

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 384
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 397
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 398

.end # TokenQuoted


.sub 'get_string' :method :vtable
.annotate 'line', 401
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
.annotate 'line', 402

.end # get_string


.sub 'viewable' :method
.annotate 'line', 405
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
.annotate 'line', 406

.end # viewable


.sub 'getasquoted' :method
.annotate 'line', 409
    getattribute $P1, self, 'str'
    .return($P1)
.annotate 'line', 410

.end # getasquoted


.sub 'getPirString' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 413
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 414
    null $S2
.annotate 'line', 415
    new $P1, 'ExceptionHandler'
    set_label $P1, __label_2
    push_eh $P1
.annotate 'line', 416
    $P0 = new ['String']
    $P0 = $S1
    $S2 = $P0.'unescape'('utf8')
    pop_eh
    goto __label_3
  __label_2:
.annotate 'line', 415
    .get_results($P2)
    finalize $P2
    pop_eh
.annotate 'line', 419
    WSubId_25("Invalid escape sequence in literal string", self)
  __label_3:
.annotate 'line', 421
    null $I1
.annotate 'line', 422
    box $P1, $S2
    if_null $P1, __label_5
    iter $P3, $P1
    set $P3, 0
  __label_4: # for iteration
    unless $P3 goto __label_5
    shift $I2, $P3
.annotate 'line', 423
    le $I2, 127, __label_6
.annotate 'line', 424
    set $I1, 1
    goto __label_5 # break
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
.annotate 'line', 428
    escape $S1, $S2
.annotate 'line', 429
    unless $I1 goto __label_8
    set $S3, "utf8:"
    goto __label_7
  __label_8:
    set $S3, ""
  __label_7:
.annotate 'line', 430
    concat $S4, $S3, '"'
    concat $S4, $S4, $S1
    concat $S4, $S4, '"'
    .return($S4)
.annotate 'line', 431

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
.annotate 'line', 393
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 438
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 439

.end # TokenSingleQuoted


.sub 'issinglequoted' :method
.annotate 'line', 440
    .return(1)

.end # issinglequoted


.sub 'get_string' :method :vtable
.annotate 'line', 443
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
.annotate 'line', 444

.end # get_string


.sub 'viewable' :method
.annotate 'line', 447
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
.annotate 'line', 448

.end # viewable


.sub 'getasquoted' :method
.annotate 'line', 451
    set $S1, ''
.annotate 'line', 452
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
.annotate 'line', 457
    concat $S3, '\', $S2
    set $S2, $S3
    goto __label_4 # break
  __label_3: # default
  __label_4: # switch end
.annotate 'line', 460
    concat $S1, $S1, $S2
    goto __label_1
  __label_2: # endfor
.annotate 'line', 462
    .return($S1)
.annotate 'line', 463

.end # getasquoted


.sub 'getPirString' :method
.annotate 'line', 466
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 467
    set $S2, "'"
.annotate 'line', 468
    null $I1
.annotate 'line', 469
    box $P1, $S1
    if_null $P1, __label_3
    iter $P2, $P1
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $I2, $P2
.annotate 'line', 470
    islt $I5, $I2, 32
    if $I5 goto __label_5
    isgt $I5, $I2, 127
  __label_5:
    unless $I5 goto __label_4
.annotate 'line', 471
    set $I1, 1
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 475
    null $I3
.annotate 'line', 476
    unless $I1 goto __label_6
.annotate 'line', 477
    set $S2, '"'
.annotate 'line', 478
    set $S3, ''
.annotate 'line', 479
    box $P1, $S1
    if_null $P1, __label_8
    iter $P3, $P1
    set $P3, 0
  __label_7: # for iteration
    unless $P3 goto __label_8
    shift $S4, $P3
.annotate 'line', 480
    ne $S4, '\', __label_9
.annotate 'line', 481
    concat $S3, $S3, '\\'
    goto __label_10
  __label_9: # else
.annotate 'line', 484
    ord $I4, $S4
.annotate 'line', 485
    islt $I5, $I4, 32
    if $I5 goto __label_13
    isgt $I5, $I4, 127
  __label_13:
    unless $I5 goto __label_11
.annotate 'line', 486
    le $I4, 127, __label_14
.annotate 'line', 487
    set $I3, 1
  __label_14: # endif
.annotate 'line', 488
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_15
    set $S5, $P1
  __label_15:
.annotate 'line', 489
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
    goto __label_12
  __label_11: # else
.annotate 'line', 492
    concat $S3, $S3, $S4
  __label_12: # endif
  __label_10: # endif
    goto __label_7
  __label_8: # endfor
.annotate 'line', 495
    set $S1, $S3
  __label_6: # endif
.annotate 'line', 497
    concat $S6, $S2, $S1
    concat $S6, $S6, $S2
    set $S1, $S6
.annotate 'line', 498
    unless $I3 goto __label_16
.annotate 'line', 499
    concat $S6, 'utf8:', $S1
    set $S1, $S6
  __label_16: # endif
.annotate 'line', 500
    .return($S1)
.annotate 'line', 501

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 434
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 508
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 509

.end # TokenInteger


.sub 'isint' :method
.annotate 'line', 510
    .return(1)

.end # isint


.sub 'getintvalue' :method
.annotate 'line', 513
    getattribute $P1, self, 'str'
    set $I1, $P1
    .return($I1)
.annotate 'line', 514

.end # getintvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
.annotate 'line', 504
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
.annotate 'line', 521
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 522

.end # TokenFloat


.sub 'isfloat' :method
.annotate 'line', 523
    .return(1)

.end # isfloat


.sub 'getfloatvalue' :method
.annotate 'line', 526
    getattribute $P1, self, 'str'
    set $N1, $P1
    .return($N1)
.annotate 'line', 527

.end # getfloatvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
.annotate 'line', 517
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'TokenError' :subid('WSubId_31')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 537
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
.annotate 'line', 539
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
.annotate 'line', 537
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1
.annotate 'line', 540

.end # TokenError


.sub 'UnterminatedString' :subid('WSubId_32')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_31 = "WSubId_31"
.annotate 'line', 544
    WSubId_31('Unterminated string', __ARG_1, __ARG_2)
.annotate 'line', 545

.end # UnterminatedString


.sub 'UnterminatedHeredoc' :subid('WSubId_33')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_31 = "WSubId_31"
.annotate 'line', 549
    WSubId_31('Unterminated heredoc', __ARG_1, __ARG_2)
.annotate 'line', 550

.end # UnterminatedHeredoc


.sub 'UnclosedComment' :subid('WSubId_34')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_31 = "WSubId_31"
.annotate 'line', 554
    WSubId_31("Unclosed comment", __ARG_1, __ARG_2)
.annotate 'line', 555

.end # UnclosedComment


.sub 'getquoted' :subid('WSubId_37')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_32 = "WSubId_32"
.annotate 'line', 559
    set $S1, ''
.annotate 'line', 560
    null $S2
.annotate 'line', 561
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
.annotate 'line', 565
    WSubId_32(__ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 568
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 569
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 570
    WSubId_32(__ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 571
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 574
    concat $S1, $S1, $S2
  __label_5: # switch end
  __label_1: # for iteration
.annotate 'line', 561
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 577
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 578

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_38')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_32 = "WSubId_32"
.annotate 'line', 582
    set $S1, ''
.annotate 'line', 583
    null $S2
.annotate 'line', 584
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
.annotate 'line', 585
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 586
    WSubId_32(__ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 587
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 584
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 589
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 590

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_39')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_33 = "WSubId_33"
.annotate 'line', 594
    set $S1, ''
.annotate 'line', 595
    null $S2
.annotate 'line', 596
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
    if $S2 == '' goto __label_6
    if $S2 == '"' goto __label_7
    if $S2 == '\' goto __label_8
    goto __label_4
  __label_6: # case
.annotate 'line', 599
    WSubId_33(__ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 604
    concat $S6, '\', $S2
    set $S2, $S6
    goto __label_5 # break
  __label_4: # default
  __label_5: # switch end
.annotate 'line', 607
    concat $S5, $S1, $S2
    set $S1, $S5
  __label_1: # for iteration
.annotate 'line', 596
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 609
    concat $S5, $S1, ':>>'
    set $S1, $S5
.annotate 'line', 611
    set $S3, ''
.annotate 'line', 612
    null $S4
  __label_9: # do
.annotate 'line', 614
    set $S4, ''
.annotate 'line', 615
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
    if $S2 == '' goto __label_17
    if $S2 == '"' goto __label_18
    if $S2 == '\' goto __label_19
    goto __label_15
  __label_17: # case
.annotate 'line', 618
    WSubId_33(__ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 621
    concat $S6, '\', $S2
    set $S2, $S6
    goto __label_16 # break
  __label_15: # default
  __label_16: # switch end
.annotate 'line', 624
    concat $S4, $S4, $S2
  __label_12: # for iteration
.annotate 'line', 615
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 626
    eq $S4, $S1, __label_20
.annotate 'line', 627
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
  __label_11: # continue
.annotate 'line', 628
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 629
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 630

.end # getheredoc


.sub 'getident' :subid('WSubId_35')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.annotate 'line', 634
    set $S1, __ARG_2
.annotate 'line', 635
    null $S2
.annotate 'line', 636
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    set $S3, $S2
.annotate 'line', 47
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', $S3
.annotate 'line', 51
    isgt $I1, $I2, -1
    goto __label_4
  __label_4:
.annotate 'line', 47
    unless $I1 goto __label_2
.annotate 'line', 637
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 636
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 638
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 639
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 640

.end # getident


.sub 'getnumber' :subid('WSubId_43')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.annotate 'line', 644
    null $S1
.annotate 'line', 645
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 647
    concat $S1, $S1, $S2
.annotate 'line', 648
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # continue
.annotate 'line', 649
    set $S3, $S2
.annotate 'line', 27
    index $I5, '0123456789', $S3
    isgt $I4, $I5, -1
    goto __label_4
  __label_4:
    if $I4 goto __label_1
  __label_2: # enddo
.annotate 'line', 650
    iseq $I5, $S1, '0'
    unless $I5 goto __label_6
    iseq $I5, $S2, 'x'
    if $I5 goto __label_7
    iseq $I5, $S2, 'X'
  __label_7:
  __label_6:
    unless $I5 goto __label_5
.annotate 'line', 651
    null $I1
    null $I2
.annotate 'line', 652
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_10: # for condition
    set $S4, $S2
.annotate 'line', 32
    index $I3, '0123456789abcdef0123456789ABCDEF', $S4
.annotate 'line', 33
    lt $I3, 0, __label_12
    mod $I3, $I3, 16
  __label_12: # endif
.annotate 'line', 34
    set $I2, $I3
    goto __label_11
  __label_11:
.annotate 'line', 652
    lt $I2, 0, __label_9
.annotate 'line', 653
    mul $I5, $I1, 16
    add $I1, $I5, $I2
.annotate 'line', 654
    concat $S1, $S1, $S2
  __label_8: # for iteration
.annotate 'line', 652
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_10
  __label_9: # for end
.annotate 'line', 656
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 657
    set $S1, $I1
.annotate 'line', 658
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
  __label_5: # endif
.annotate 'line', 660
    ne $S2, '.', __label_13
  __label_15: # do
.annotate 'line', 662
    concat $S1, $S1, $S2
.annotate 'line', 663
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_17: # continue
.annotate 'line', 664
    set $S5, $S2
.annotate 'line', 27
    index $I5, '0123456789', $S5
    isgt $I6, $I5, -1
    goto __label_18
  __label_18:
    if $I6 goto __label_15
  __label_16: # enddo
.annotate 'line', 665
    iseq $I5, $S2, 'e'
    if $I5 goto __label_20
    iseq $I5, $S2, 'E'
  __label_20:
    unless $I5 goto __label_19
.annotate 'line', 666
    concat $S1, $S1, 'E'
.annotate 'line', 667
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I5, $S2, '+'
    if $I5 goto __label_22
    iseq $I5, $S2, '-'
  __label_22:
    unless $I5 goto __label_21
.annotate 'line', 668
    concat $S1, $S1, $S2
.annotate 'line', 669
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_21: # endif
  __label_25: # for condition
.annotate 'line', 671
    set $S6, $S2
.annotate 'line', 27
    index $I5, '0123456789', $S6
    isgt $I7, $I5, -1
    goto __label_26
  __label_26:
    unless $I7 goto __label_24
.annotate 'line', 672
    concat $S1, $S1, $S2
  __label_23: # for iteration
.annotate 'line', 671
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_25
  __label_24: # for end
  __label_19: # endif
.annotate 'line', 674
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 675
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
    goto __label_14
  __label_13: # else
.annotate 'line', 678
    iseq $I5, $S2, 'e'
    if $I5 goto __label_29
    iseq $I5, $S2, 'E'
  __label_29:
    unless $I5 goto __label_27
.annotate 'line', 679
    concat $S1, $S1, 'E'
.annotate 'line', 680
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I5, $S2, '+'
    if $I5 goto __label_31
    iseq $I5, $S2, '-'
  __label_31:
    unless $I5 goto __label_30
.annotate 'line', 681
    concat $S1, $S1, $S2
.annotate 'line', 682
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_30: # endif
  __label_34: # for condition
.annotate 'line', 684
    set $S7, $S2
.annotate 'line', 27
    index $I5, '0123456789', $S7
    isgt $I8, $I5, -1
    goto __label_35
  __label_35:
    unless $I8 goto __label_33
.annotate 'line', 685
    concat $S1, $S1, $S2
  __label_32: # for iteration
.annotate 'line', 684
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_34
  __label_33: # for end
.annotate 'line', 686
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 687
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
    goto __label_28
  __label_27: # else
.annotate 'line', 690
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 691
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
  __label_28: # endif
  __label_14: # endif
.annotate 'line', 694

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_40')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.annotate 'line', 698
    set $S1, __ARG_2
.annotate 'line', 699
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
.annotate 'line', 700
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 699
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 701
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 702

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_41')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_34 = "WSubId_34"
.annotate 'line', 706
    set $S1, __ARG_2
.annotate 'line', 707
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
  __label_7: # for condition
.annotate 'line', 709
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 710
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 709
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 711
    ne $S2, '', __label_9
.annotate 'line', 712
    WSubId_34(__ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 713
    concat $S1, $S1, $S2
.annotate 'line', 714
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 715
    ne $S2, '', __label_10
.annotate 'line', 716
    WSubId_34(__ARG_1, __ARG_3)
  __label_10: # endif
  __label_4: # continue
.annotate 'line', 717
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 718
    concat $S1, $S1, '/'
.annotate 'line', 719
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 720

.end # getcomment


.sub 'getop' :subid('WSubId_36')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.annotate 'line', 724
    set $S1, __ARG_2
.annotate 'line', 725
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 726

.end # getop

.namespace [ 'Winxed'; 'Compiler'; 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
.annotate 'line', 743
    not $I1, __ARG_3
    new $P3, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P3
.annotate 'line', 744
    setattribute self, 'h', __ARG_1
.annotate 'line', 745
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 746
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 747
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 748
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 749
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 750
    root_new $P2, ['parrot';'Hash']
    $P2[''] = WSubId_35
    $P2['{'] = WSubId_36
    $P1['$'] = $P2
    $P1['"'] = WSubId_37
    $P1["'"] = WSubId_38
.annotate 'line', 753
    root_new $P3, ['parrot';'Hash']
.annotate 'line', 754
    root_new $P4, ['parrot';'Hash']
    $P4[''] = WSubId_36
    $P4['='] = WSubId_36
    $P3['='] = $P4
    $P3[':'] = WSubId_36
    $P1['='] = $P3
.annotate 'line', 757
    root_new $P5, ['parrot';'Hash']
    $P5['+'] = WSubId_36
    $P5['='] = WSubId_36
    $P1['+'] = $P5
.annotate 'line', 758
    root_new $P6, ['parrot';'Hash']
    $P6['-'] = WSubId_36
    $P6['='] = WSubId_36
    $P1['-'] = $P6
.annotate 'line', 759
    root_new $P7, ['parrot';'Hash']
    $P7['='] = WSubId_36
    $P1['*'] = $P7
.annotate 'line', 760
    root_new $P8, ['parrot';'Hash']
    $P8['|'] = WSubId_36
    $P1['|'] = $P8
.annotate 'line', 761
    root_new $P9, ['parrot';'Hash']
    $P9['&'] = WSubId_36
    $P1['&'] = $P9
.annotate 'line', 762
    root_new $P10, ['parrot';'Hash']
.annotate 'line', 763
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_36
    $P11[':'] = WSubId_39
    $P10['<'] = $P11
    $P10['='] = WSubId_36
    $P1['<'] = $P10
.annotate 'line', 766
    root_new $P12, ['parrot';'Hash']
.annotate 'line', 767
    root_new $P13, ['parrot';'Hash']
    $P13[''] = WSubId_36
    $P13['>'] = WSubId_36
    $P12['>'] = $P13
    $P12['='] = WSubId_36
    $P1['>'] = $P12
.annotate 'line', 770
    root_new $P14, ['parrot';'Hash']
.annotate 'line', 771
    root_new $P15, ['parrot';'Hash']
    $P15[''] = WSubId_36
    $P15['='] = WSubId_36
    $P14['='] = $P15
    $P1['!'] = $P14
.annotate 'line', 773
    root_new $P16, ['parrot';'Hash']
    $P16['%'] = WSubId_36
    $P16['='] = WSubId_36
    $P1['%'] = $P16
.annotate 'line', 774
    root_new $P17, ['parrot';'Hash']
    $P17['='] = WSubId_36
    $P17['/'] = WSubId_40
    $P17['*'] = WSubId_41
    $P1['/'] = $P17
    $P1['#'] = WSubId_40
.annotate 'line', 777
    setattribute self, 'select', $P1
.annotate 'line', 778

.end # Tokenizer


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_42 = "WSubId_42"
.annotate 'line', 781
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 782
    WSubId_42(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 783

.end # warn


.sub 'getchar' :method
.annotate 'line', 786
    getattribute $P1, self, 'pending'
.annotate 'line', 787
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 788
    eq $S1, '', __label_2
.annotate 'line', 789
    assign $P1, ''
    goto __label_3
  __label_2: # else
.annotate 'line', 791
    getattribute $P2, self, 'h'
.annotate 'line', 792
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 793
    ne $S1, "\n", __label_4
.annotate 'line', 794
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 796
    .return($S1)
.annotate 'line', 797

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
.annotate 'line', 800
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
.annotate 'line', 801

.end # ungetchar


.sub 'get_token' :method
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_36 = "WSubId_36"
.annotate 'line', 804
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 805
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 807
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 808
    set $S3, $S1
.annotate 'line', 22
    iseq $I2, $S3, ' '
    if $I2 goto __label_7
    iseq $I2, $S3, "\n"
  __label_7:
    if $I2 goto __label_6
    iseq $I2, $S3, "\t"
  __label_6:
    goto __label_5
  __label_5:
    unless $I2 goto __label_3
.annotate 'line', 809
    $P3 = self.'getchar'()
    set $S1, $P3
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 810
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 811
    ne $S1, '', __label_8
.annotate 'line', 812
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 813
    set $S4, $S1
.annotate 'line', 39
    index $I4, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', $S4
.annotate 'line', 42
    isgt $I3, $I4, -1
    goto __label_10
  __label_10:
.annotate 'line', 39
    unless $I3 goto __label_9
.annotate 'line', 814
    .tailcall WSubId_35(self, $S1, $I1)
  __label_9: # endif
.annotate 'line', 815
    set $S5, $S1
.annotate 'line', 27
    index $I4, '0123456789', $S5
    isgt $I5, $I4, -1
    goto __label_12
  __label_12:
    unless $I5 goto __label_11
.annotate 'line', 816
    .tailcall WSubId_43(self, $S1, $I1)
  __label_11: # endif
.annotate 'line', 818
    set $S2, $S1
.annotate 'line', 819
    getattribute $P1, self, 'select'
.annotate 'line', 820
    $P2 = $P1[$S1]
  __label_14: # while
.annotate 'line', 822
    isnull $I4, $P2
    not $I4
    unless $I4 goto __label_15
    isa $I4, $P2, 'Hash'
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 823
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 824
    set $P1, $P2
.annotate 'line', 825
    $P2 = $P1[$S1]
.annotate 'line', 826
    unless_null $P2, __label_16
.annotate 'line', 827
    self.'ungetchar'($S1)
.annotate 'line', 828
    $P2 = $P1['']
    goto __label_17
  __label_16: # else
.annotate 'line', 831
    concat $S2, $S2, $S1
  __label_17: # endif
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 833
    if_null $P2, __label_19
.annotate 'line', 834
    $P3 = $P2(self, $S2, $I1)
    goto __label_18
  __label_19:
.annotate 'line', 835
    $P4 = WSubId_36(self, $S2, $I1)
    set $P3, $P4
  __label_18:
.annotate 'line', 833
    .return($P3)
.annotate 'line', 836

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
.annotate 'line', 839
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 840
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
.annotate 'line', 841
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 842
    .return($P1)
.annotate 'line', 843

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
.annotate 'line', 846
    getattribute $P1, self, 'stacked'
    push $P1, __ARG_1
.annotate 'line', 847

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 734
    addattribute $P0, 'warnings'
.annotate 'line', 735
    addattribute $P0, 'h'
.annotate 'line', 736
    addattribute $P0, 'pending'
.annotate 'line', 737
    addattribute $P0, 'select'
.annotate 'line', 738
    addattribute $P0, 'stacked'
.annotate 'line', 739
    addattribute $P0, 'filename'
.annotate 'line', 740
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'typetoregcheck' :subid('WSubId_126')
        .param string __ARG_1
    if __ARG_1 == 'int' goto __label_3
    if __ARG_1 == 'float' goto __label_4
    if __ARG_1 == 'string' goto __label_5
    if __ARG_1 == 'var' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 876
    .return('I')
  __label_4: # case
.annotate 'line', 877
    .return('N')
  __label_5: # case
.annotate 'line', 878
    .return('S')
  __label_6: # case
.annotate 'line', 879
    .return('P')
  __label_1: # default
.annotate 'line', 880
    .return('')
  __label_2: # switch end
.annotate 'line', 882

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_135')
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
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
.annotate 'line', 887
    .return('int')
  __label_4: # case
.annotate 'line', 888
    .return('num')
  __label_5: # case
.annotate 'line', 889
    .return('string')
  __label_6: # case
.annotate 'line', 890
    .return('pmc')
  __label_1: # default
.annotate 'line', 891
    WSubId_30('Invalid reg type')
  __label_2: # switch end
.annotate 'line', 893

.end # typetopirname

.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 915
    setattribute self, 'handle', __ARG_1
.annotate 'line', 916
    box $P1, ""
    setattribute self, 'file', $P1
.annotate 'line', 917
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 918
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 919
    box $P1, 0
    setattribute self, 'pendingl', $P1
.annotate 'line', 920
    not $I1, __ARG_2
    new $P2, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P2
.annotate 'line', 921

.end # Emit


.sub 'setDebug' :method
.annotate 'line', 924
    box $P1, 1
    setattribute self, 'debug', $P1
.annotate 'line', 925

.end # setDebug


.sub 'getDebug' :method
.annotate 'line', 928
    getattribute $P1, self, 'debug'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 929

.end # getDebug


.sub 'disable_annotations' :method
.annotate 'line', 932
    box $P1, 1
    setattribute self, 'noan', $P1
.annotate 'line', 933

.end # disable_annotations


.sub 'close' :method
.annotate 'line', 936
    null $P1
    setattribute self, 'handle', $P1
.annotate 'line', 937

.end # close


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_42 = "WSubId_42"
.annotate 'line', 940
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 941
    WSubId_42(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 942

.end # warn


.sub 'updateannot' :method
.annotate 'line', 945
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 946
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'file', '"
.annotate 'line', 948
    getattribute $P4, self, 'file'
.annotate 'line', 946
    $P3[1] = $P4
    $P3[2] = "'\n"
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 951
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
  __label_1: # endif
.annotate 'line', 953
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 954
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'line', "
.annotate 'line', 956
    getattribute $P4, self, 'line'
.annotate 'line', 954
    $P3[1] = $P4
    $P3[2] = "\n"
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 959
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
  __label_2: # endif
.annotate 'line', 961

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 964
    set $P1, __ARG_1
    getattribute $P4, self, 'handle'
    $P2 = WSubId_7($P4, "print")
.annotate 'line', 65
    if_null $P1, __label_3
    iter $P5, $P1
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
.annotate 'line', 66
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:
.annotate 'line', 965

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
.annotate 'line', 968
    self.'updateannot'()
.annotate 'line', 969
    self.'vprint'(__ARG_1)
.annotate 'line', 970

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
.annotate 'line', 973
    self.'updateannot'()
.annotate 'line', 974
    self.'vprint'(__ARG_1)
.annotate 'line', 975
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
.annotate 'line', 976

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 979
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
.annotate 'line', 981
    getattribute $P1, self, 'file'
.annotate 'line', 982
    getattribute $P2, self, 'line'
.annotate 'line', 983
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 984
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 985
    set $S2, $P1
    eq $S2, $S1, __label_3
.annotate 'line', 986
    assign $P1, $S1
.annotate 'line', 987
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 988
    assign $P2, 0
  __label_3: # endif
.annotate 'line', 990
    set $I2, $P2
    eq $I2, $I1, __label_4
.annotate 'line', 991
    assign $P2, $I1
.annotate 'line', 992
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
  __label_4: # endif
  __label_1: # endif
.annotate 'line', 995

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
.annotate 'line', 998
    self.'updateannot'()
.annotate 'line', 999
    getattribute $P1, self, 'handle'
    concat $S1, "# ", __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
.annotate 'line', 1000

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 1003
    getattribute $P1, self, 'handle'
.annotate 'line', 1004
    $P1.'print'('  ')
.annotate 'line', 1005
    $P1.'print'(__ARG_1)
.annotate 'line', 1006
    $P1.'print'(":")
.annotate 'line', 1007
    if_null __ARG_2, __label_1
.annotate 'line', 1008
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 1009
    $P1.'print'("\n")
.annotate 'line', 1010

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 1013
    getattribute $P1, self, 'handle'
.annotate 'line', 1014
    $P1.'print'("    goto ")
.annotate 'line', 1015
    $P1.'print'(__ARG_1)
.annotate 'line', 1016
    if_null __ARG_2, __label_1
.annotate 'line', 1017
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 1018
    $P1.'print'("\n")
.annotate 'line', 1019

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1023
    self.'say'('    ', __ARG_1, " ", __ARG_2)
.annotate 'line', 1024

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1027
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1028

.end # emitarg2


.sub 'emitarg3' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 1031
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 1032

.end # emitarg3


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 1035
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 1036

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1039
    self.'say'("    if ", __ARG_1, " goto ", __ARG_2)
.annotate 'line', 1040

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1043
    self.'say'("    unless ", __ARG_1, " goto ", __ARG_2)
.annotate 'line', 1044

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1047
    self.'say'("    if_null ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1048

.end # emitif_null


.sub 'emitunless_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1051
    self.'say'("    unless_null ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1052

.end # emitunless_null


.sub 'emitnull' :method
        .param string __ARG_1
.annotate 'line', 1055
    self.'say'("    null ", __ARG_1)
.annotate 'line', 1056

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
.annotate 'line', 1060
    self.'say'("    inc ", __ARG_1)
.annotate 'line', 1061

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
.annotate 'line', 1064
    self.'say'("    dec ", __ARG_1)
.annotate 'line', 1065

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1068
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1069

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1072
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1073

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1076
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1077

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1080
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1081

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 1084
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 1085

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1088
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1089

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1092
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1093

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1096
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1097

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1100
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1101

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1104
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1105

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1108
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1109

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1112
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1113

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1116
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1117

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1120
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1121

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
.annotate 'line', 1124
    self.'say'("    print ", __ARG_1)
.annotate 'line', 1125

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
.annotate 'line', 1128
    self.'say'("    say ", __ARG_1)
.annotate 'line', 1129

.end # emitsay


.sub 'emitget_hll_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1132
    concat $S1, ", ", __ARG_2
    self.'say'("    get_hll_namespace ", __ARG_1, $S1)
.annotate 'line', 1133

.end # emitget_hll_namespace


.sub 'emitget_root_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1136
    concat $S1, ", ", __ARG_2
    self.'say'("    get_root_namespace ", __ARG_1, $S1)
.annotate 'line', 1137

.end # emitget_root_namespace


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
.annotate 'line', 1140
    self.'print'("    get_hll_global ", __ARG_1)
.annotate 'line', 1141
    if_null __ARG_3, __label_1
.annotate 'line', 1142
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1143
    self.'say'(", '", __ARG_2, "'")
.annotate 'line', 1144

.end # emitget_hll_global


.sub 'emitget_root_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
.annotate 'line', 1147
    self.'print'("    get_root_global ", __ARG_1)
.annotate 'line', 1148
    if_null __ARG_3, __label_1
.annotate 'line', 1149
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1150
    self.'say'(", '", __ARG_2, "'")
.annotate 'line', 1151

.end # emitget_root_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1154
    self.'say'("    find_lex ", __ARG_1, ", '", __ARG_2, "'")
.annotate 'line', 1155

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1158
    self.'say'("    store_lex '", __ARG_1, "', ", __ARG_2)
.annotate 'line', 1159

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 904
    addattribute $P0, 'handle'
.annotate 'line', 905
    addattribute $P0, 'file'
.annotate 'line', 906
    addattribute $P0, 'line'
.annotate 'line', 907
    addattribute $P0, 'pendingf'
.annotate 'line', 908
    addattribute $P0, 'pendingl'
.annotate 'line', 909
    addattribute $P0, 'debug'
.annotate 'line', 910
    addattribute $P0, 'noan'
.annotate 'line', 911
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 1184
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 1185

.end # integerValue


.sub 'floatValue' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
.annotate 'line', 1189
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenFloat'($P3, $P4, __ARG_3)
    set $P1, $P2
.annotate 'line', 1190
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
.annotate 'line', 1191

.end # floatValue


.sub 'stringQuotedValue' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 1195
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, __ARG_3)
    set $P1, $P2
.annotate 'line', 1196
    new $P3, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P3.'StringLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
.annotate 'line', 1197

.end # stringQuotedValue


.sub 'floatresult' :subid('WSubId_94')
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1205
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1206
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1207
    .return($I1)
.annotate 'line', 1208

.end # floatresult


.sub 'floatAsString' :subid('WSubId_89')
        .param num __ARG_1
.annotate 'line', 1216
    set $S1, __ARG_1
.annotate 'line', 1217
    box $P2, $S1
    $P1 = $P2.'is_integer'($S1)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 1218
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1219
    .return($S1)
.annotate 'line', 1220

.end # floatAsString


.sub 'createPredefConstInt' :subid('WSubId_146')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1231
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P3.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
    set $P1, $P3
.annotate 'line', 1233
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1234
    $P3 = WSubId_44(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
.annotate 'line', 1235

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_139')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1239
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P3.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
    set $P1, $P3
.annotate 'line', 1241
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1242
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1243
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1242
    $P2.'setvalue'($P3)
.annotate 'line', 1244

.end # createPredefConstString


.sub 'string_from_literal' :subid('WSubId_47')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1258
    null $S1
.annotate 'line', 1260
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1263
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1266
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1261
    getattribute $P1, __ARG_1, 'numval'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1264
    $P2 = __ARG_1.'getFloatValue'()
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1267
    $P3 = __ARG_1.'get_value'()
    set $S1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1270
    WSubId_30('wrong call to string_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1272
    .return($S1)
.annotate 'line', 1273

.end # string_from_literal


.sub 'int_from_literal' :subid('WSubId_48')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1277
    null $I1
.annotate 'line', 1279
    $I2 = __ARG_1.'isintegerliteral'()
    if $I2 goto __label_3
.annotate 'line', 1282
    $I2 = __ARG_1.'isfloatliteral'()
    if $I2 goto __label_4
.annotate 'line', 1285
    $I2 = __ARG_1.'isstringliteral'()
    if $I2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1280
    getattribute $P1, __ARG_1, 'numval'
    set $I1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1283
    $P2 = __ARG_1.'getFloatValue'()
    set $I1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1286
    $P3 = __ARG_1.'get_value'()
    set $I1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1289
    WSubId_30('wrong call to int_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1291
    .return($I1)
.annotate 'line', 1292

.end # int_from_literal


.sub 'float_from_literal' :subid('WSubId_127')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1296
    null $N1
.annotate 'line', 1298
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1299
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1302
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
  __label_4: # case
.annotate 'line', 1300
    $P1 = __ARG_1.'getFloatValue'()
    set $N1, $P1
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1303
    $P2 = __ARG_1.'get_value'()
    set $N1, $P2
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1306
    WSubId_30('wrong call to float_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1308
    .return($N1)
.annotate 'line', 1309

.end # float_from_literal

.namespace [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]

.sub 'Builtin_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1336
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1337
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1338
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1339
    split $P1, "\n", __ARG_2
    join $S1, "\n    ", $P1
    concat $S2, '    ', $S1
    set __ARG_2, $S2
.annotate 'line', 1340
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1341
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
.annotate 'line', 1342

.end # Builtin_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 1345
    getattribute $P1, self, 'typeresult'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1347
    ne $S1, 'v', __label_2
.annotate 'line', 1348
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_4, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1349
    WSubId_25('using return value from void builtin', __ARG_3)
  __label_4: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 1352
    isnull $I1, __ARG_4
    if $I1 goto __label_7
    iseq $I1, __ARG_4, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1353
    WSubId_30('Bad result in non void builtin')
  __label_6: # endif
  __label_3: # endif
.annotate 'line', 1356
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1357
    getattribute $P2, self, 'body'
    $P1 = WSubId_45($P2, __ARG_4, __ARG_5 :flat)
    __ARG_1.'say'($P1)
.annotate 'line', 1358

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
.annotate 'line', 1315
    addattribute $P0, 'body'
.annotate 'line', 1316
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
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1379
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1380
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1381
    new $P3, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
    $P3.'Builtin_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1383
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1384
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1385
    null $I1
.annotate 'line', 1386
    if_null __ARG_4, __label_3
.annotate 'line', 1387
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
.annotate 'line', 1390
    set $I1, -1
    goto __label_5 # break
  __label_7: # case
.annotate 'line', 1393
    set $I1, -2
.annotate 'line', 1394
    if_null __ARG_5, __label_8
.annotate 'line', 1395
    concat $S1, "Invalid builtin '", __ARG_1
    concat $S1, $S1, '"'
    WSubId_30($S1)
  __label_8: # endif
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 1398
    set $I1, 1
.annotate 'line', 1399
    if_null __ARG_5, __label_9
.annotate 'line', 1400
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1401
    inc $I1
  __label_9: # endif
.annotate 'line', 1403
    if_null __ARG_6, __label_10
.annotate 'line', 1404
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1405
    inc $I1
  __label_10: # endif
.annotate 'line', 1407
    if_null __ARG_7, __label_11
.annotate 'line', 1408
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1409
    inc $I1
  __label_11: # endif
  __label_5: # switch end
  __label_3: # endif
.annotate 'line', 1413
    box $P1, $I1
    setattribute self, 'nparams', $P1
.annotate 'line', 1414

.end # BuiltinBase


.sub 'iscompileevaluable' :method
.annotate 'line', 1417
    .return(0)
.annotate 'line', 1418

.end # iscompileevaluable


.sub 'name' :method
.annotate 'line', 1421
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1422
    .return($S1)
.annotate 'line', 1423

.end # name


.sub 'result' :method
.annotate 'line', 1426
    getattribute $P1, self, 'typeresult'
    .return($P1)
.annotate 'line', 1427

.end # result


.sub 'params' :method
.annotate 'line', 1428
    getattribute $P1, self, 'nparams'
    .return($P1)

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1431
    null $S1
    if __ARG_1 == 0 goto __label_3
    if __ARG_1 == 1 goto __label_4
    if __ARG_1 == 2 goto __label_5
    if __ARG_1 == 3 goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 1433
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 1434
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 1435
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 1436
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 1438
    WSubId_30('Invalid builtin arg')
  __label_2: # switch end
.annotate 'line', 1440
    .return($S1)
.annotate 'line', 1441

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1444
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1446
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 1448
    eq $S1, '__ASSERT__', __label_3
.annotate 'line', 1449
    concat $S3, 'builtin ', $S1
    __ARG_1.'comment'($S3)
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 1452
    getattribute $P2, self, 'typeresult'
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 1453
    isne $I1, $S2, 'v'
    unless $I1 goto __label_6
    iseq $I1, __ARG_4, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 1454
    $P2 = __ARG_2.'tempreg'($S2)
    set __ARG_4, $P2
  __label_5: # endif
.annotate 'line', 1455
    getattribute $P1, self, 'body'
.annotate 'line', 1456
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 1457

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
.annotate 'line', 1363
    addattribute $P0, 'name'
.annotate 'line', 1364
    addattribute $P0, 'body'
.annotate 'line', 1365
    addattribute $P0, 'typeresult'
.annotate 'line', 1366
    addattribute $P0, 'type0'
.annotate 'line', 1367
    addattribute $P0, 'type1'
.annotate 'line', 1368
    addattribute $P0, 'type2'
.annotate 'line', 1369
    addattribute $P0, 'type3'
.annotate 'line', 1370
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
.annotate 'line', 1469
    self.'BuiltinBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 1470

.end # BuiltinFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1460
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
.annotate 'line', 1483
    self.'BuiltinBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1484
    setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1485

.end # BuiltinFunctionEval


.sub 'iscompileevaluable' :method
.annotate 'line', 1488
    .return(1)
.annotate 'line', 1489

.end # iscompileevaluable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1473
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
.annotate 'line', 1475
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]

.sub 'Builtin_typecast' :method
        .param string __ARG_1
.annotate 'line', 1497
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 1498

.end # Builtin_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1501
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1502
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1503
    WSubId_30("Invalid Builtin_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1504
    $P1 = __ARG_5[0]
.annotate 'line', 1505
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 1507
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1508
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1509
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1512
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1513
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1515
    ne $S3, 'null', __label_9
.annotate 'line', 1516
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1518
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
.annotate 'line', 1520

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
.annotate 'line', 1494
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'builtineval_stringcast' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
.annotate 'line', 1525
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1526
    $P2 = WSubId_47($P1)
    .tailcall WSubId_46(__ARG_1, __ARG_2, $P2)
.annotate 'line', 1527

.end # builtineval_stringcast


.sub 'builtineval_intcast' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1531
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1532
    $P2 = WSubId_48($P1)
    set $I1, $P2
.annotate 'line', 1533
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1534

.end # builtineval_intcast


.sub 'Builtin_varcast' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1538
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1539
    WSubId_30("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1540
    $P1 = __ARG_5[0]
.annotate 'line', 1541
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_2
    set $S1, $P10
  __label_2:
.annotate 'line', 1542
    ne $S1, 'P', __label_3
.annotate 'line', 1543
    null $S2
.annotate 'line', 1544
    null $P2
.annotate 'line', 1546
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1562
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1547
    $P10 = $P1.'getName'()
    set $S2, $P10
.annotate 'line', 1548
    $P11 = $P1.'checkIdentifier'()
    null $S3
    if_null $P11, __label_9
    set $S3, $P11
  __label_9:
.annotate 'line', 1549
    $P3 = $P1.'checkVar'()
.annotate 'line', 1550
    isne $I2, $S3, ''
    unless $I2 goto __label_13
    isnull $I2, $P3
    not $I2
  __label_13:
    unless $I2 goto __label_12
    $P12 = $P3.'issubid'()
    isfalse $I2, $P12
  __label_12:
    unless $I2 goto __label_10
.annotate 'line', 1552
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_11
  __label_10: # else
.annotate 'line', 1555
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 1
    $P10[0] = $S2
    $P2 = $P1.'scopesearch'($P10, 0)
.annotate 'line', 1556
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 1557
    getattribute $P10, $P2, 'owner'
    $P4 = $P10.'getpath'()
.annotate 'line', 1558
    set $P7, $P4
.annotate 'line', 2482
    null $S5
.annotate 'line', 2483
    elements $I1, $P7
    unless $I1 goto __label_17
.annotate 'line', 2484
    join $S9, "'; '", $P7
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S5, $S10
  __label_17: # endif
.annotate 'line', 2485
    set $S8, $S5
    goto __label_16
  __label_16:
.annotate 'line', 1558
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S8)
  __label_14: # endif
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1565
    new $P5, ['ResizableStringArray']
.annotate 'line', 1566
    $P1.'buildkey'($P5)
.annotate 'line', 1567
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1568
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_19
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_19:
    unless $I1 goto __label_18
.annotate 'line', 1569
    getattribute $P10, $P2, 'owner'
    $P6 = $P10.'getpath'()
.annotate 'line', 1570
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1571
    set $P8, $P6
.annotate 'line', 2482
    null $S6
.annotate 'line', 2483
    elements $I1, $P8
    unless $I1 goto __label_21
.annotate 'line', 2484
    join $S9, "'; '", $P8
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S6, $S10
  __label_21: # endif
.annotate 'line', 2485
    set $S11, $S6
    goto __label_20
  __label_20:
.annotate 'line', 1571
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S11)
  __label_18: # endif
.annotate 'line', 1573
    $P10 = $P5.'pop'()
    set $S2, $P10
.annotate 'line', 1574
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1575
    set $P9, $P5
.annotate 'line', 2482
    null $S7
.annotate 'line', 2483
    elements $I1, $P9
    unless $I1 goto __label_23
.annotate 'line', 2484
    join $S9, "'; '", $P9
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S7, $S10
  __label_23: # endif
.annotate 'line', 2485
    set $S12, $S7
    goto __label_22
  __label_22:
.annotate 'line', 1575
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S12)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1578
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1579
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
    goto __label_4
  __label_3: # else
.annotate 'line', 1583
    $P10 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_24
    set $S4, $P10
  __label_24:
.annotate 'line', 1584
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1585
    ne $S4, 'null', __label_25
.annotate 'line', 1586
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_26
  __label_25: # else
.annotate 'line', 1588
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_26: # endif
  __label_4: # endif
.annotate 'line', 1590

.end # Builtin_varcast


.sub 'Builtin_say' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1594
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1595
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1596
    lt $I1, 0, __label_1
.annotate 'line', 1597
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1598
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1597
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1599
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 1602
    __ARG_1.'emitsay'("''")
  __label_2: # endif
.annotate 'line', 1603

.end # Builtin_say


.sub 'Builtin_cry' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_9 = "WSubId_9"
.annotate 'line', 1607
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1614
    set $P1, __ARG_5
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P3 = WSubId_9("    print $P0, ")
.annotate 'line', 71
    if_null $P1, __label_3
    iter $P7, $P1
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P4, $P7
.annotate 'line', 72
    $P8 = $P3($P4)
    push $P2, $P8
    goto __label_2
  __label_3: # endfor
.annotate 'line', 73
    set $P6, $P2
    goto __label_1
  __label_1:
    set $P5, $P6
.annotate 'line', 1614
    join $S1, "\n", $P5
.annotate 'line', 1608
    $P5 = WSubId_45("    getstderr $P0\n%0\n    print $P0, \"\\n\"\n", $S1)
    __ARG_1.'say'($P5)
.annotate 'line', 1615

.end # Builtin_cry


.sub 'Builtin_print' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 1619
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1620
    set $P1, __ARG_5
    $P2 = WSubId_7(__ARG_1, "emitprint")
.annotate 'line', 65
    if_null $P1, __label_3
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
.annotate 'line', 66
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:
.annotate 'line', 1621

.end # Builtin_print


.sub 'Builtin_ASSERT' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 1627
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1628
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1629
    $P3 = __ARG_2.'genlabel'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 1630
    $P1 = __ARG_5[0]
.annotate 'line', 1631
    $P2 = $P1.'emit_getint'(__ARG_1)
.annotate 'line', 1632
    __ARG_1.'emitif'($P2, $S1)
.annotate 'line', 1641
    $P4 = __ARG_3.'filename'()
    $P5 = __ARG_3.'linenum'()
.annotate 'line', 1633
    $P3 = WSubId_45("    getstderr $P0\n    print $P0, \"Assertion failed at '%0' line \"\n    print $P0, %1\n    print $P0, \"\\n\"\n    exit 1\n", $P4, $P5)
    __ARG_1.'print'($P3)
.annotate 'line', 1642
    __ARG_1.'emitlabel'($S1)
  __label_1: # endif
.annotate 'line', 1644

.end # Builtin_ASSERT


.sub 'Builtin_invoke' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1650
    $P1 = __ARG_5[0]
.annotate 'line', 1651
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1652
    WSubId_25("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1653
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 1654

.end # Builtin_invoke


.sub 'builtineval_length' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1658
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1659
    $P2 = WSubId_47($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1660
    length $I1, $S1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1661

.end # builtineval_length


.sub 'builtineval_bytelength' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1665
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1666
    $P2 = WSubId_47($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1667
    bytelength $I1, $S1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1668

.end # builtineval_bytelength


.sub 'builtineval_ord' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1672
    elements $I1, __ARG_3
.annotate 'line', 1673
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1674
    $P3 = WSubId_47($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1675
    null $I2
.annotate 'line', 1676
    le $I1, 1, __label_2
.annotate 'line', 1677
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1678
    $P3 = WSubId_48($P2)
    set $I2, $P3
  __label_2: # endif
.annotate 'line', 1680
    ord $I3, $S1, $I2
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I3)
.annotate 'line', 1681

.end # builtineval_ord


.sub 'builtineval_chr' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_48 = "WSubId_48"
.annotate 'line', 1685
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1686
    $P2 = WSubId_48($P1)
    set $I1, $P2
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1687

.end # builtineval_chr


.sub 'builtineval_substr' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_46 = "WSubId_46"
.annotate 'line', 1691
    elements $I1, __ARG_3
.annotate 'line', 1692
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1693
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1694
    $P4 = WSubId_47($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1695
    $P4 = WSubId_48($P2)
    set $I2, $P4
.annotate 'line', 1696
    null $S2
.annotate 'line', 1697
    set $I4, __ARG_3
    le $I4, 2, __label_2
.annotate 'line', 1698
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1699
    $P4 = WSubId_48($P3)
    set $I3, $P4
.annotate 'line', 1700
    substr $S2, $S1, $I2, $I3
    goto __label_3
  __label_2: # else
.annotate 'line', 1703
    substr $S2, $S1, $I2
  __label_3: # endif
.annotate 'line', 1704
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S2)
.annotate 'line', 1705

.end # builtineval_substr


.sub 'builtineval_indexof' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1709
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1710
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1711
    $P3 = WSubId_47($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1712
    $P3 = WSubId_47($P2)
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1713
    index $I1, $S1, $S2
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1714

.end # builtineval_indexof


.sub 'builtineval_indexof_pos' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1718
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1719
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1720
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1721
    $P4 = WSubId_47($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1722
    $P4 = WSubId_47($P2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1723
    $P6 = __ARG_3[2]
    getattribute $P5, $P6, 'arg'
    $P4 = WSubId_48($P5)
    set $I1, $P4
.annotate 'line', 1724
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I2)
.annotate 'line', 1725

.end # builtineval_indexof_pos


.sub 'builtineval_escape' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
.annotate 'line', 1729
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1733
    $P2 = WSubId_47($P1)
    set $S3, $P2
    escape $S2, $S3
    escape $S1, $S2
.annotate 'line', 1732
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1734

.end # builtineval_escape


.sub 'builtin_sleep' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1738
    $P1 = __ARG_5[0]
.annotate 'line', 1739
    null $S1
.annotate 'line', 1740
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
.annotate 'line', 1743
    $P2 = $P1.'emit_getint'(__ARG_1)
    set $S1, $P2
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 1746
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 1749
    $P4 = $P1.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 1750
    set $S1, "0"
    goto __label_7
  __label_6: # else
.annotate 'line', 1752
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 1753
    set $S1, "$N0"
.annotate 'line', 1754
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1755
    __ARG_1.'emitset'($S1, $S3)
  __label_7: # endif
  __label_3: # switch end
.annotate 'line', 1758
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1759
    __ARG_1.'emitarg1'('sleep', $S1)
.annotate 'line', 1760

.end # builtin_sleep


.sub 'getbuiltins' :subid('WSubId_147')
        .param pmc __ARG_1
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_54 = "WSubId_54"
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
.annotate 'line', 1764
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1766
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('I')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('int', WSubId_49, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1764
    __ARG_1.'add'($P1)
.annotate 'line', 1769
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1770
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('N')
    set $P3, $P4
    $P2.'BuiltinFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1769
    __ARG_1.'add'($P1)
.annotate 'line', 1773
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1775
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('S')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('string', WSubId_50, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1773
    __ARG_1.'add'($P1)
.annotate 'line', 1778
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('var', WSubId_51, 'P', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1782
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1786
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1790
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1794
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1798
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sleep', WSubId_52, 'v', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1802
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1806
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1810
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1814
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1818
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1825
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1832
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1839
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1847
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1856
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1866
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1870
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('length', WSubId_53, 'length %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1875
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('bytelength', WSubId_54, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1880
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('chr', WSubId_55, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1889
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('ord', WSubId_56, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1894
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('ord', WSubId_56, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1899
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('substr', WSubId_57, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1904
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('substr', WSubId_57, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1909
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1913
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('indexof', WSubId_58, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1918
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('indexof', WSubId_59, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1923
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1927
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('escape', WSubId_60, 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1932
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1940
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1948
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1955
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1962
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1966
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1970
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1974
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1978
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1985
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1992
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1996
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unshift', 'unshift %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2000
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_var', 'pop %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2004
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_var', 'shift %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2008
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_int', 'pop %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2012
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_int', 'shift %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2016
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_float', 'pop %0, %1', 'N', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2020
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_float', 'shift %0, %1', 'N', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2024
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_string', 'pop %0, %1', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2028
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_string', 'shift %0, %1', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2032
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2036
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2040
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2044
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2048
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2052
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2056
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2060
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2064
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2068
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2072
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2076
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2080
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2093
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2097
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2101
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2105
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2109
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2113
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2117
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2121
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2125
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2129
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2133
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2140
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2147
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2151
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2155
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2159
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2163
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2167
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('print', WSubId_61, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2171
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('say', WSubId_62, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2175
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cry', WSubId_63, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2179
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('__ASSERT__', WSubId_64, 'v', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2183
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('invoke', WSubId_65, 'P', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2187

.end # getbuiltins


.sub 'parseDotted' :subid('WSubId_84')
        .param pmc __ARG_1
.annotate 'line', 2207
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2208
    $P2 = __ARG_1.'get'()
.annotate 'line', 2209
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2210
    push $P1, $P2
  __label_3: # while
.annotate 'line', 2211
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2212
    $P2 = __ARG_1.'get'()
.annotate 'line', 2213
    push $P1, $P2
    goto __label_3
  __label_2: # endwhile
  __label_1: # endif
.annotate 'line', 2216
    __ARG_1.'unget'($P2)
.annotate 'line', 2217
    .return($P1)
.annotate 'line', 2218

.end # parseDotted


.sub 'parseList' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 2226
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2227
    null $P2
  __label_1: # do
.annotate 'line', 2229
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 2230
    push $P1, $P3
  __label_3: # continue
.annotate 'line', 2231
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 2232
    unless_null __ARG_4, __label_4
.annotate 'line', 2233
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2235
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 2236
    WSubId_25("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 2237
    .return($P1)
.annotate 'line', 2238

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 2243
    $P1 = __ARG_1.'get'()
.annotate 'line', 2244
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2245
    WSubId_27($P1)
  __label_1: # endif
.annotate 'line', 2246
    .return($P1)
.annotate 'line', 2247

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_85')
        .param pmc __ARG_1
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2251
    new $P1, ['ResizableStringArray']
.annotate 'line', 2252
    set $P2, __ARG_1
    set $P3, $P1
    $P4 = WSubId_5("getidentifier")
.annotate 'line', 71
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P5, $P6
.annotate 'line', 72
    $P7 = $P4($P5)
    push $P3, $P7
    goto __label_2
  __label_3: # endfor
    goto __label_1
  __label_1:
.annotate 'line', 2253
    .return($P1)
.annotate 'line', 2254

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2267
    setattribute self, 'start', __ARG_1
.annotate 'line', 2268
    setattribute self, 'owner', __ARG_2
.annotate 'line', 2269

.end # initbase


.sub 'clone' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 2272
    typeof $P1, self
    set $S1, $P1
    concat $S2, "Cannot use ", $S1
    concat $S2, $S2, " in inline (yet)"
    WSubId_25($S2, self)
.annotate 'line', 2274

.end # clone


.sub 'getstart' :method
.annotate 'line', 2277
    getattribute $P1, self, 'start'
    .return($P1)
.annotate 'line', 2278

.end # getstart


.sub 'viewable' :method
.annotate 'line', 2281
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2282
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2284
    .return("")
  __label_2: # endif
.annotate 'line', 2285

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 2288
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 2289

.end # annotate


.sub 'getpath' :method
.annotate 'line', 2292
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()
.annotate 'line', 2293

.end # getpath


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 2296
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 2297

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 2300
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 2301

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 2304
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
.annotate 'line', 2305

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 2308
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
.annotate 'line', 2309

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 2312
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 2313

.end # scopesearch


.sub 'dowarnings' :method
.annotate 'line', 2316
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 2317

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 2262
    addattribute $P0, 'start'
.annotate 'line', 2263
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2334
    setattribute self, 'owner', __ARG_1
.annotate 'line', 2335
    setattribute self, 'e', __ARG_2
.annotate 'line', 2336

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 2340
    getattribute $P1, self, 'e'
.annotate 'line', 2341
    null $S1
.annotate 'line', 2342
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2343
    getattribute $P2, self, 'pnull'
.annotate 'line', 2344
    unless_null $P2, __label_3
.annotate 'line', 2345
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2346
    $P1.'emitnull'($S2)
.annotate 'line', 2347
    box $P2, $S2
    setattribute self, 'pnull', $P2
  __label_3: # endif
.annotate 'line', 2349
    set $S1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 2352
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2353
    .return($S1)
.annotate 'line', 2354

.end # add

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
.annotate 'line', 2329
    addattribute $P0, 'owner'
.annotate 'line', 2330
    addattribute $P0, 'e'
.annotate 'line', 2331
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 2369
    $P2 = WSubId_66(__ARG_1, __ARG_2, WSubId_67, __ARG_3)
    setattribute self, 'args', $P2
.annotate 'line', 2370

.end # SimpleArgList


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 2373
    new $P1, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2374
    getattribute $P2, self, 'args'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P6 = WSubId_3($P10, $P3)
.annotate 'line', 71
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
.annotate 'line', 72
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
.annotate 'line', 73
    set $P9, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
.annotate 'line', 132
    set $P8, $P9
.annotate 'line', 2374
    setattribute $P1, 'args', $P8
.annotate 'line', 2375
    .return($P1)
.annotate 'line', 2376

.end # clone


.sub 'numargs' :method
.annotate 'line', 2380
    getattribute $P1, self, 'args'
    elements $I1, $P1
    .return($I1)
.annotate 'line', 2381

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 2384
    getattribute $P1, self, 'args'
.annotate 'line', 2385
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 2386

.end # getarg


.sub 'optimizeargs' :method
.annotate 'line', 2390
    getattribute $P1, self, 'args'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 2391

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2394
    getattribute $P1, self, 'args'
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_5("emit_get")
    $P3 = WSubId_3($P6, __ARG_1)
.annotate 'line', 71
    if_null $P1, __label_3
    iter $P7, $P1
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P4, $P7
.annotate 'line', 72
    $P8 = $P3($P4)
    push $P2, $P8
    goto __label_2
  __label_3: # endfor
.annotate 'line', 73
    set $P5, $P2
    goto __label_1
  __label_1:
    set $P6, $P5
.annotate 'line', 2394
    .return($P6)
.annotate 'line', 2395

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 2398
    $P1 = self.'getargvalues'(__ARG_1)
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
.annotate 'line', 2399

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2365
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
.annotate 'line', 2411
    getattribute $P1, self, 'name'
    .return($P1)

.end # getname


.sub 'numargs' :method
.annotate 'line', 2414
    getattribute $P1, self, 'args'
.annotate 'line', 2415
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2416
    .return($I1)
.annotate 'line', 2417

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2420
    getattribute $P1, self, 'args'
.annotate 'line', 2421
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2422
    WSubId_30('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2423
    .tailcall $P1.'getarg'(__ARG_1)
.annotate 'line', 2424

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2427
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2428
    if_null __ARG_2, __label_1
.annotate 'line', 2429
    setattribute self, 'args', __ARG_2
  __label_1: # endif
.annotate 'line', 2430

.end # Modifier


.sub 'optimize' :method
.annotate 'line', 2433
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2434
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2435
    .return(self)
.annotate 'line', 2436

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2408
    addattribute $P0, 'name'
.annotate 'line', 2409
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2441
    $P1 = __ARG_1.'get'()
.annotate 'line', 2442
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2443
    $P1 = __ARG_1.'get'()
.annotate 'line', 2444
    null $P2
.annotate 'line', 2445
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2446
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2448
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2449
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
.annotate 'line', 2450

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2459
    $P2 = WSubId_66(__ARG_1, __ARG_2, WSubId_68, ']')
    setattribute self, 'list', $P2
.annotate 'line', 2460

.end # ModifierList


.sub 'optimize' :method
.annotate 'line', 2463
    getattribute $P1, self, 'list'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 2464

.end # optimize


.sub 'getlist' :method
.annotate 'line', 2465
    getattribute $P1, self, 'list'
    .return($P1)

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
.annotate 'line', 2468
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 2469
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2470
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2472
    .return($P2)
.annotate 'line', 2473

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2455
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseUsing' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2490
    $P1 = __ARG_2.'get'()
.annotate 'line', 2492
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2494
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2496
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2493
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2495
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2497
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2499
    __ARG_2.'unget'($P1)
.annotate 'line', 2500
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
.annotate 'line', 2502

.end # parseUsing


.sub 'parseSig' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 2506
    new $P4, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P4.'SigParameterList'(__ARG_2, __ARG_3)
    set $P1, $P4
.annotate 'line', 2507
    $P2 = __ARG_2.'get'()
.annotate 'line', 2508
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2509
    WSubId_69("'='", $P2)
  __label_1: # endif
.annotate 'line', 2510
    $P3 = WSubId_67(__ARG_2, __ARG_3)
.annotate 'line', 2511
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 2512

.end # parseSig


.sub 'parseClassSpecifier' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 2516
    $P1 = __ARG_1.'get'()
.annotate 'line', 2517
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2518
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 2519
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 2520
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 2521
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2522
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 2523
    WSubId_25('Invalid class', $P1)
.annotate 'line', 2524

.end # parseClassSpecifier


.sub 'parseStatement' :subid('WSubId_124')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_76 = "WSubId_76"
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_81 = "WSubId_81"
.annotate 'line', 2528
    $P1 = __ARG_1.'get'()
.annotate 'line', 2529
    null $P2
.annotate 'line', 2530
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2531
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2532
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2533
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2534
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2535
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2536
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 2537
    $P3 = __ARG_1.'get'()
.annotate 'line', 2538
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2539
    WSubId_70("':'", $P1)
  __label_5: # endif
.annotate 'line', 2540
    .tailcall WSubId_71($P1, __ARG_1, __ARG_2)
  __label_4: # endif
.annotate 'line', 2543
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
.annotate 'line', 2545
    .tailcall WSubId_72($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2547
    .tailcall WSubId_73($P1, __ARG_1, __ARG_2)
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 2550
    .tailcall WSubId_74($P1, __ARG_1, __ARG_2)
    goto __label_7 # break
  __label_11: # case
.annotate 'line', 2553
    $P2 = __ARG_1.'get'()
.annotate 'line', 2554
    __ARG_1.'unget'($P2)
.annotate 'line', 2555
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2556
    .tailcall WSubId_75($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_7 # break
  __label_12: # case
.annotate 'line', 2559
    $P2 = __ARG_1.'get'()
.annotate 'line', 2560
    __ARG_1.'unget'($P2)
.annotate 'line', 2561
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2562
    .tailcall WSubId_76($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 2565
    $P2 = __ARG_1.'get'()
.annotate 'line', 2566
    __ARG_1.'unget'($P2)
.annotate 'line', 2567
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2568
    .tailcall WSubId_77($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_7 # break
  __label_14: # case
.annotate 'line', 2571
    $P2 = __ARG_1.'get'()
.annotate 'line', 2572
    __ARG_1.'unget'($P2)
.annotate 'line', 2573
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2574
    .tailcall WSubId_78($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_7 # break
  __label_15: # case
.annotate 'line', 2577
    .tailcall WSubId_79($P1, __ARG_1, __ARG_2)
  __label_16: # case
.annotate 'line', 2579
    new $P11, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_17: # case
.annotate 'line', 2581
    new $P13, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_18: # case
.annotate 'line', 2583
    new $P15, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P15.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_19: # case
.annotate 'line', 2585
    new $P17, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_20: # case
.annotate 'line', 2587
    new $P19, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P19.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_21: # case
.annotate 'line', 2589
    new $P21, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_22: # case
.annotate 'line', 2591
    new $P23, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_23: # case
.annotate 'line', 2593
    .tailcall WSubId_80($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2595
    .tailcall WSubId_81($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2597
    new $P25, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P25.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_26: # case
.annotate 'line', 2599
    new $P27, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P27.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_6: # default
  __label_7: # switch end
.annotate 'line', 2602
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
.annotate 'line', 2603
    $P4 = __ARG_1.'get'()
.annotate 'line', 2604
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2605
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2606
    __ARG_1.'unget'($P4)
  __label_31: # endif
.annotate 'line', 2608
    __ARG_1.'unget'($P1)
.annotate 'line', 2609
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
.annotate 'line', 2610

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2620
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 2621

.end # Statement


.sub 'isempty' :method
.annotate 'line', 2622
    .return(0)

.end # isempty


.sub 'allowtailcall' :method
.annotate 'line', 2625
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
.annotate 'line', 2626

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 2629
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
.annotate 'line', 2630

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 2633
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 2634

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 2637
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
.annotate 'line', 2638

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 2641
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 2642

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2645
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
.annotate 'line', 2646

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2649
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
.annotate 'line', 2650

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2653
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2654

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2657
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2658

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2661
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
.annotate 'line', 2662

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 2665
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2666

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 2669
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
.annotate 'line', 2670

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 2673
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 2674

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 2677
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
.annotate 'line', 2678

.end # usenamespace


.sub 'getouter' :method
.annotate 'line', 2685
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
.annotate 'line', 2686

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.annotate 'line', 2689
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
.annotate 'line', 2690

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.annotate 'line', 2693
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
.annotate 'line', 2694

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2697
    getattribute $P1, self, 'start'
    WSubId_30('**checking**', $P1)
.annotate 'line', 2699
    .return(self)
.annotate 'line', 2700

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2616
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
.annotate 'line', 2705
    .return(1)

.end # isempty


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 2706
    .return(self)

.end # clone


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2709
    WSubId_30('Attempt to annotate empty statement')
.annotate 'line', 2710

.end # annotate


.sub 'optimize' :method
.annotate 'line', 2711
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2703
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
.annotate 'line', 2724
    getattribute $P1, self, 'statements'
.annotate 'line', 2725
    elements $I1, $P1
.annotate 'line', 2726
    set $I2, 1
.annotate 'line', 2727
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
.annotate 'line', 2728
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2729
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2730
    null $I2
  __label_4: # endif
.annotate 'line', 2731
    $P1[$I3] = $P2
  __label_1: # for iteration
.annotate 'line', 2727
    inc $I3
    goto __label_3
  __label_2: # for end
    unless $I2 goto __label_7
.annotate 'line', 2733
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
.annotate 'line', 2734

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2720
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2741
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 2
    $P2[0] = __ARG_1
    $P2[1] = __ARG_2
    setattribute self, 'statements', $P2
.annotate 'line', 2742

.end # MultiStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 2745
    new $P1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2746
    getattribute $P2, self, 'statements'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P6 = WSubId_3($P10, $P3)
.annotate 'line', 71
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
.annotate 'line', 72
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
.annotate 'line', 73
    set $P9, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
.annotate 'line', 132
    set $P8, $P9
.annotate 'line', 2746
    setattribute $P1, 'statements', $P8
.annotate 'line', 2747
    .return($P1)
.annotate 'line', 2748

.end # clone


.sub 'isempty' :method
.annotate 'line', 2750
    .return(0)

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
.annotate 'line', 2753
    getattribute $P1, self, 'statements'
    push $P1, __ARG_1
.annotate 'line', 2754
    .return(self)
.annotate 'line', 2755

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2758
    set $P1, __ARG_1
    getattribute $P2, self, 'statements'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2202
    set $P3, $P2
    $P6 = WSubId_5("emit")
    $P4 = WSubId_3($P6, $P1)
.annotate 'line', 65
    if_null $P3, __label_4
    iter $P7, $P3
    set $P7, 0
  __label_3: # for iteration
    unless $P7 goto __label_4
    shift $P5, $P7
.annotate 'line', 66
    $P4($P5)
    goto __label_3
  __label_4: # endfor
  __label_2:
  __label_1:
.annotate 'line', 2759

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2737
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parsePiropArg' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 2780
    null $P1
.annotate 'line', 2781
    $P2 = __ARG_1.'get'()
.annotate 'line', 2782
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2783
    $P2 = __ARG_1.'get'()
.annotate 'line', 2784
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2785
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 2788
    __ARG_1.'unget'($P2)
.annotate 'line', 2789
    $P1 = WSubId_67(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 2791
    .return($P1)
.annotate 'line', 2792

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 2801
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2802
    $P1 = __ARG_2.'get'()
.annotate 'line', 2803
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2804
    unless $I1 goto __label_1
.annotate 'line', 2805
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2806
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2807
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2808
    $P1 = __ARG_2.'get'()
.annotate 'line', 2809
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
.annotate 'line', 2810
    __ARG_2.'unget'($P1)
.annotate 'line', 2811
    $P3 = WSubId_66(__ARG_2, __ARG_3, WSubId_82, '}')
    setattribute self, 'args', $P3
  __label_5: # endif
.annotate 'line', 2813
    WSubId_83(';', __ARG_2)
.annotate 'line', 2814

.end # PiropStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 2817
    new $P1, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2818
    getattribute $P8, self, 'start'
    $P1.'Statement'($P8, __ARG_1)
.annotate 'line', 2819
    getattribute $P9, self, 'opname'
    setattribute $P1, 'opname', $P9
.annotate 'line', 2820
    getattribute $P2, self, 'args'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P9 = WSubId_5("clone")
    $P6 = WSubId_3($P9, $P3)
.annotate 'line', 71
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
.annotate 'line', 72
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
.annotate 'line', 73
    set $P10, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
.annotate 'line', 132
    set $P8, $P10
.annotate 'line', 2820
    setattribute $P1, 'args', $P8
.annotate 'line', 2821
    .return($P1)
.annotate 'line', 2822

.end # clone


.sub 'optimize' :method
.annotate 'line', 2825
    getattribute $P1, self, 'args'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 2826
    .return(self)
.annotate 'line', 2827

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2830
    getattribute $P6, self, 'opname'
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 2831
    self.'annotate'(__ARG_1)
.annotate 'line', 2832
    $P6 = __ARG_1.'getDebug'()
    if_null $P6, __label_2
    unless $P6 goto __label_2
.annotate 'line', 2833
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
  __label_2: # endif
.annotate 'line', 2834
    getattribute $P1, self, 'args'
.annotate 'line', 2835
    __ARG_1.'print'('    ')
.annotate 'line', 2836
    unless_null $P1, __label_3
.annotate 'line', 2837
    __ARG_1.'say'($S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2840
    set $P2, $P1
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_5("emit_get")
    $P4 = WSubId_3($P6, __ARG_1)
.annotate 'line', 71
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P5, $P8
.annotate 'line', 72
    $P9 = $P4($P5)
    push $P3, $P9
    goto __label_6
  __label_7: # endfor
.annotate 'line', 73
    set $P7, $P3
    goto __label_5
  __label_5:
    set $P6, $P7
.annotate 'line', 2839
    join $S2, ', ', $P6
    __ARG_1.'say'($S1, ' ', $S2)
  __label_4: # endif
.annotate 'line', 2842

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2794
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2796
    addattribute $P0, 'opname'
.annotate 'line', 2797
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_85 = "WSubId_85"
.annotate 'line', 2854
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2855
    $P1 = WSubId_84(__ARG_2)
.annotate 'line', 2856
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2857
    $P2 = __ARG_2.'get'()
    WSubId_27($P2)
  __label_1: # endif
.annotate 'line', 2858
    WSubId_83(';', __ARG_2)
.annotate 'line', 2859
    $P3 = WSubId_85($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2860
    .return(self)
.annotate 'line', 2861

.end # ExternStatement


.sub 'optimize' :method
.annotate 'line', 2862
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2865
    self.'annotate'(__ARG_1)
.annotate 'line', 2866
    getattribute $P1, self, 'path'
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
.annotate 'line', 2867

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2849
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2851
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_86 = "WSubId_86"
.annotate 'line', 2879
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2880
    null $P3
    $P1 = WSubId_66(__ARG_2, $P3, WSubId_86, ';')
.annotate 'line', 2881
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2882
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2883
    self.'createvarnamed'($P2, 'P', $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2885
    setattribute self, 'names', $P1
.annotate 'line', 2886

.end # StaticStatement


.sub 'optimize' :method
.annotate 'line', 2889
    .return(self)
.annotate 'line', 2890

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2893
    self.'annotate'(__ARG_1)
.annotate 'line', 2894
    getattribute $P2, self, 'names'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 2895
    $P5 = self.'getvar'($P1)
    $P4 = $P5.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P4, " = '", $P1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2897

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2874
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2876
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 2911
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2912
    $P1 = WSubId_84(__ARG_2)
.annotate 'line', 2913
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2914
    $P2 = __ARG_2.'get'()
    WSubId_27($P2)
  __label_1: # endif
.annotate 'line', 2915
    WSubId_83(';', __ARG_2)
.annotate 'line', 2916
    setattribute self, 'path', $P1
.annotate 'line', 2917

.end # UsingStatement


.sub 'optimize' :method
.annotate 'line', 2920
    getattribute $P1, self, 'path'
.annotate 'line', 2921
    $P2 = $P1[-1]
.annotate 'line', 2923
    $P3 = self.'scopesearch'($P1, 0)
.annotate 'line', 2925
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2939
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2926
    elements $I2, $P1
    unless $I2 goto __label_5
.annotate 'line', 2927
    clone $P4, $P1
.annotate 'line', 2928
    $P4.'pop'()
.annotate 'line', 2929
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2930
    if_null $P5, __label_6
.annotate 'line', 2931
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2932
    if_null $P3, __label_7
.annotate 'line', 2933
    self.'createvarused'($P2, $P3)
.annotate 'line', 2934
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_7: # endif
  __label_6: # endif
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2940
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2941
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2942
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2943
    self.'usesubid'($S1)
.annotate 'line', 2944
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2946
    self.'createvar'($P2, 'P')
.annotate 'line', 2947
    .return(self)
.annotate 'line', 2948

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2951
    getattribute $P1, self, 'path'
.annotate 'line', 2952
    $S1 = $P1[-1]
.annotate 'line', 2953
    $P2 = self.'getvar'($S1)
.annotate 'line', 2954
    getattribute $P4, self, 'subid'
    unless_null $P4, __label_1
.annotate 'line', 2955
    self.'annotate'(__ARG_1)
.annotate 'line', 2956
    null $S2
.annotate 'line', 2957
    elements $I1, $P1
    le $I1, 1, __label_2
.annotate 'line', 2958
    $P1.'pop'()
.annotate 'line', 2959
    set $P3, $P1
.annotate 'line', 2482
    null $S3
.annotate 'line', 2483
    elements $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 2484
    join $S4, "'; '", $P3
    concat $S5, "[ '", $S4
    concat $S5, $S5, "' ]"
    set $S3, $S5
  __label_4: # endif
.annotate 'line', 2485
    set $S2, $S3
    goto __label_3
  __label_3:
  __label_2: # endif
.annotate 'line', 2961
    $P4 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P4, $S1, $S2)
  __label_1: # endif
.annotate 'line', 2963

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2904
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2906
    addattribute $P0, 'path'
.annotate 'line', 2907
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 2973
    $P1 = WSubId_84(__ARG_2)
.annotate 'line', 2974
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2975
    WSubId_69('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2976
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2977
    unless_null $P2, __label_2
.annotate 'line', 2978
    WSubId_25('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2979
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2980

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 2986
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2987
    WSubId_87(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2988
    WSubId_83(';', __ARG_2)
.annotate 'line', 2989

.end # UsingNamespaceStatement


.sub 'optimize' :method
.annotate 'line', 2992
    .return(self)
.annotate 'line', 2993

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2982
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 3008
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 3009
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 3010
    null $P2
  __label_1: # do
.annotate 'line', 3012
    $P3 = WSubId_67(__ARG_2, self)
.annotate 'line', 3013
    $P1.'push'($P3)
  __label_3: # continue
.annotate 'line', 3014
    $P2 = __ARG_2.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 3015
    WSubId_28(';', $P2)
.annotate 'line', 3016
    setattribute self, 'expr', $P1
.annotate 'line', 3017

.end # ExprStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3020
    new $P1, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 3021
    getattribute $P8, self, 'start'
    $P1.'Statement'($P8, __ARG_1)
.annotate 'line', 3022
    getattribute $P2, self, 'expr'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P6 = WSubId_3($P10, $P3)
.annotate 'line', 71
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
.annotate 'line', 72
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
.annotate 'line', 73
    set $P9, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
.annotate 'line', 132
    set $P8, $P9
.annotate 'line', 3022
    setattribute $P1, 'expr', $P8
.annotate 'line', 3023
    .return($P1)
.annotate 'line', 3024

.end # clone


.sub 'optimize' :method
.annotate 'line', 3027
    getattribute $P1, self, 'expr'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 3028
    .return(self)
.annotate 'line', 3029

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 3032
    getattribute $P1, self, 'expr'
    $P4 = WSubId_5("emit_void")
    $P2 = WSubId_3($P4, __ARG_1)
.annotate 'line', 65
    if_null $P1, __label_3
    iter $P5, $P1
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
.annotate 'line', 66
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:
.annotate 'line', 3033

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 3003
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 3005
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
.annotate 'line', 3050
    setattribute self, 'type', __ARG_1
.annotate 'line', 3051
    setattribute self, 'reg', __ARG_2
.annotate 'line', 3052
    setattribute self, 'scope', __ARG_3
.annotate 'line', 3053
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 3054

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
.annotate 'line', 3057
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
.annotate 'line', 3058

.end # setlex


.sub 'gettype' :method
.annotate 'line', 3059
    getattribute $P1, self, 'type'
    .return($P1)

.end # gettype


.sub 'getreg' :method
.annotate 'line', 3060
    getattribute $P1, self, 'reg'
    .return($P1)

.end # getreg


.sub 'getscope' :method
.annotate 'line', 3061
    getattribute $P1, self, 'scope'
    .return($P1)

.end # getscope


.sub 'getvalue' :method
.annotate 'line', 3062
    getattribute $P1, self, 'value'
    .return($P1)

.end # getvalue


.sub 'isconst' :method
.annotate 'line', 3063
    .return(0)

.end # isconst


.sub 'getlex' :method
.annotate 'line', 3064
    getattribute $P1, self, 'lexname'
    .return($P1)

.end # getlex


.sub 'getflags' :method
.annotate 'line', 3065
    getattribute $P1, self, 'flags'
    .return($P1)

.end # getflags


.sub 'issubid' :method
.annotate 'line', 3068
    getattribute $P1, self, 'reg'
.annotate 'line', 3069
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_1
    set $S2, $P1
    substr $S1, $S2, 0, 7
    iseq $I1, $S1, 'WSubId_'
  __label_1:
    .return($I1)
.annotate 'line', 3070

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 3042
    addattribute $P0, 'type'
.annotate 'line', 3043
    addattribute $P0, 'reg'
.annotate 'line', 3044
    addattribute $P0, 'scope'
.annotate 'line', 3045
    addattribute $P0, 'flags'
.annotate 'line', 3046
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
.annotate 'line', 3078
    setattribute self, 'name', __ARG_1
.annotate 'line', 3079

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3082
    getattribute $P1, self, 'name'
    WSubId_30('Attempt to use unexpanded constant!!!', $P1)
.annotate 'line', 3083

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 3075
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3092
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
.annotate 'line', 3093

.end # VarData_const


.sub 'isconst' :method
.annotate 'line', 3094
    .return(1)

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3097
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 3098
    WSubId_30('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 3099
    setattribute self, 'value', __ARG_1
.annotate 'line', 3100

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 3086
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 3088
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'VarContainer' :method
.annotate 'line', 3111
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
.annotate 'line', 3112

.end # VarContainer


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3115
    getattribute $P1, self, 'locals'
.annotate 'line', 3116
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3117
    $P2 = $P1[$S1]
.annotate 'line', 3118
    if_null $P2, __label_2
.annotate 'line', 3119
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_25($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 3120
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 3121
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, $S2, self, __ARG_3)
    set $P3, $P4
.annotate 'line', 3122
    $P1[$S1] = $P3
.annotate 'line', 3123
    .return($P3)
.annotate 'line', 3124

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3127
    getattribute $P1, self, 'locals'
.annotate 'line', 3128
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3129
    $P2 = $P1[$S1]
.annotate 'line', 3130
    if_null $P2, __label_2
.annotate 'line', 3131
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3132
    $P1[$S1] = __ARG_2
.annotate 'line', 3133

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3136
    getattribute $P1, self, 'locals'
.annotate 'line', 3137
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3138
    $P2 = $P1[$S1]
.annotate 'line', 3139
    if_null $P2, __label_2
.annotate 'line', 3140
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3141
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
.annotate 'line', 3142

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3145
    getattribute $P1, self, 'locals'
.annotate 'line', 3146
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3147
    $P2 = $P1[$S1]
.annotate 'line', 3148
    if_null $P2, __label_2
.annotate 'line', 3149
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3150
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P4.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
    set $P3, $P4
.annotate 'line', 3151
    $P1[$S1] = $P3
.annotate 'line', 3152
    .return($P3)
.annotate 'line', 3153

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
.annotate 'line', 3156
    getattribute $P1, self, 'locals'
.annotate 'line', 3157
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
.annotate 'line', 3158

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
.annotate 'line', 3161
    null $P1
.annotate 'line', 3162
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 3163
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 3164
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 3166
    .return($P3)
.annotate 'line', 3167

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3170
    null $P1
.annotate 'line', 3171
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 3172
    .return($P1)
  __label_1: # endif
.annotate 'line', 3173
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 3174
    .return($P1)
  __label_2: # endif
.annotate 'line', 3175
    getattribute $P2, self, 'owner'
.annotate 'line', 3176
    if_null $P2, __label_3
.annotate 'line', 3177
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 3178
    .return($P3)
.annotate 'line', 3179

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
.annotate 'line', 3182
    $P1 = self.'getouter'()
.annotate 'line', 3183
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3184
    .return($S1)
.annotate 'line', 3185

.end # makelexical


.sub 'makelexicalself' :method
.annotate 'line', 3189
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 3190
    .return('__WLEX_self')
.annotate 'line', 3191

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 3106
    addattribute $P0, 'locals'
.annotate 'line', 3107
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]

.sub 'BlockStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3204
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 3205
    self.'VarContainer'()
.annotate 'line', 3206

.end # BlockStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 3200
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3217
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 3218

.end # Expr


.sub 'issimple' :method
.annotate 'line', 3219
    .return(0)

.end # issimple


.sub 'isliteral' :method
.annotate 'line', 3220
    .return(0)

.end # isliteral


.sub 'isintegerliteral' :method
.annotate 'line', 3221
    .return(0)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3222
    .return(0)

.end # isintegerzero


.sub 'isfloatliteral' :method
.annotate 'line', 3223
    .return(0)

.end # isfloatliteral


.sub 'isstringliteral' :method
.annotate 'line', 3224
    .return(0)

.end # isstringliteral


.sub 'isidentifier' :method
.annotate 'line', 3225
    .return(0)

.end # isidentifier


.sub 'isnull' :method
.annotate 'line', 3226
    .return(0)

.end # isnull


.sub 'hascompilevalue' :method
.annotate 'line', 3227
    .return(0)

.end # hascompilevalue


.sub 'isnegable' :method
.annotate 'line', 3228
    .return(0)

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
.annotate 'line', 3231
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 3232

.end # tempreg


.sub 'genlabel' :method
.annotate 'line', 3235
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 3236

.end # genlabel


.sub 'optimize' :method
.annotate 'line', 3240
    .return(self)
.annotate 'line', 3241

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 3242
    .return(0)

.end # cantailcall


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3247
    self.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 3248

.end # emit_init


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3251
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3252
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3253
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3254
    .return($S2)
.annotate 'line', 3255

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3258
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3259
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
.annotate 'line', 3261
    set $S2, "$I0"
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 3262
    set $S2, "$N0"
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3263
    set $S2, "$S0"
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 3264
    set $S2, "$P0"
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 3266
    concat $S3, "Unexcpected emit_void with type '", $S1
    concat $S3, $S3, "'"
    getattribute $P1, self, 'start'
    WSubId_30($S3, $P1)
  __label_3: # switch end
.annotate 'line', 3268
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3269

.end # emit_void


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3272
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3273
    WSubId_25("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 3274
    .tailcall self.'emit_get'(__ARG_1)
.annotate 'line', 3275

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 3278
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3279
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
.annotate 'line', 3280
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3281
    self.'annotate'(__ARG_1)
.annotate 'line', 3282
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 3283
    set $S1, $S2
  __label_2: # endif
.annotate 'line', 3285
    .return($S1)
.annotate 'line', 3286

.end # emit_getint


.sub 'emit_getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3289
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3290
    $P1 = self.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3291
    eq $S1, 'P', __label_3
.annotate 'line', 3292
    set $S3, $S2
.annotate 'line', 3293
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 3294
    __ARG_1.'emitbox'($S2, $S3)
  __label_3: # endif
.annotate 'line', 3296
    .return($S2)
.annotate 'line', 3297

.end # emit_getvar


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.annotate 'line', 3300
    WSubId_88(self)
.annotate 'line', 3301

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 3213
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
.annotate 'line', 3306
    .return(1)

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 3304
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FinalExpr' ]

.sub 'optimize' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3315
    typeof $P1, self
    set $S1, $P1
    concat $S2, "misuse of ", $S1
    WSubId_30($S2, self)
.annotate 'line', 3316

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
.annotate 'line', 3310
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 3326
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3327
    $P1 = __ARG_1.'get'()
.annotate 'line', 3328
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3329
    WSubId_69('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3330
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
.annotate 'line', 3331

.end # FunctionExpr


.sub 'checkresult' :method
.annotate 'line', 3332
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 3335
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3336
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3337
    .return(self)
.annotate 'line', 3338

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3341
    self.'annotate'(__ARG_1)
.annotate 'line', 3342
    getattribute $P1, self, 'fn'
.annotate 'line', 3343
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3344
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3345
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3347
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 3348

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3321
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3323
    addattribute $P0, 'fn'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
.annotate 'line', 3366
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3367
    .return(self)
.annotate 'line', 3368

.end # set


.sub 'optimize_condition' :method
.annotate 'line', 3371
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3372

.end # optimize_condition


.sub 'optimize' :method
.annotate 'line', 3375
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3376
    .return(self)
.annotate 'line', 3377

.end # optimize


.sub 'getvalue' :method
.annotate 'line', 3380
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3381
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3382
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
.annotate 'line', 3383
    .return(0)
.annotate 'line', 3384

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3387
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3389
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3390
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3391
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3393
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3394
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
.annotate 'line', 3397
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3400
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 3403
    WSubId_30('Invalid if condition')
  __label_6: # switch end
  __label_2: # endif
.annotate 'line', 3406

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3409
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3411
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3412
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3413
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3415
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3416
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
.annotate 'line', 3419
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3422
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 3425
    WSubId_30('Invalid if condition')
  __label_6: # switch end
  __label_2: # endif
.annotate 'line', 3428

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3363
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
.annotate 'line', 3435
    .return(1)

.end # isliteral


.sub 'hascompilevalue' :method
.annotate 'line', 3436
    .return(1)

.end # hascompilevalue


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3433
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3447
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3448
    setattribute self, 'strval', __ARG_2
.annotate 'line', 3449

.end # StringLiteral


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3452
    new $P2, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P3, self, 'strval'
    $P2.'StringLiteral'(__ARG_1, $P3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 3453

.end # clone


.sub 'isstringliteral' :method
.annotate 'line', 3454
    .return(1)

.end # isstringliteral


.sub 'checkresult' :method
.annotate 'line', 3455
    .return('S')

.end # checkresult


.sub 'getPirString' :method
.annotate 'line', 3458
    getattribute $P1, self, 'strval'
.annotate 'line', 3459
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3460
    .return($S1)
.annotate 'line', 3461

.end # getPirString


.sub 'get_value' :method
.annotate 'line', 3464
    getattribute $P1, self, 'strval'
.annotate 'line', 3465
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3466
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3467
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3468
    .return($S1)
.annotate 'line', 3469

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3472
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
.annotate 'line', 3473

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3476
    .tailcall self.'getPirString'()
.annotate 'line', 3477

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3442
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3444
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3488
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3489
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3490
    set $I1, __ARG_3
.annotate 'line', 3491
    box $P1, $I1
    setattribute self, 'numval', $P1
.annotate 'line', 3492

.end # IntegerLiteral


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3495
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    getattribute $P3, self, 'pos'
    getattribute $P4, self, 'numval'
    $P2.'IntegerLiteral'(__ARG_1, $P3, $P4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 3496

.end # clone


.sub 'isintegerliteral' :method
.annotate 'line', 3497
    .return(1)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3500
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
.annotate 'line', 3501

.end # isintegerzero


.sub 'checkresult' :method
.annotate 'line', 3502
    .return('I')

.end # checkresult


.sub 'getIntegerValue' :method
.annotate 'line', 3505
    getattribute $P1, self, 'numval'
    .return($P1)
.annotate 'line', 3506

.end # getIntegerValue


.sub 'getFloatValue' :method
.annotate 'line', 3509
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3510
    .return($N1)
.annotate 'line', 3511

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3514
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3515
    if $I1 goto __label_1
.annotate 'line', 3516
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3518
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_2: # endif
.annotate 'line', 3519

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3522
    .tailcall self.'getIntegerValue'()
.annotate 'line', 3523

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3482
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3484
    addattribute $P0, 'pos'
.annotate 'line', 3485
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3533
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3534
    setattribute self, 'numval', __ARG_2
.annotate 'line', 3535

.end # FloatLiteral


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3538
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    getattribute $P3, self, 'numval'
    $P2.'FloatLiteral'(__ARG_1, $P3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 3539

.end # clone


.sub 'isfloatliteral' :method
.annotate 'line', 3540
    .return(1)

.end # isfloatliteral


.sub 'checkresult' :method
.annotate 'line', 3541
    .return('N')

.end # checkresult


.sub 'getFloatValue' :method
.annotate 'line', 3544
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3545
    .return($N1)
.annotate 'line', 3546

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3549
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3550
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3551

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_89 = "WSubId_89"
.annotate 'line', 3554
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3555
    .tailcall WSubId_89($N1)
.annotate 'line', 3556

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3528
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3530
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'concat_literal' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3566
    getattribute $P1, __ARG_1, 'strval'
.annotate 'line', 3567
    getattribute $P2, __ARG_2, 'strval'
.annotate 'line', 3570
    $P4 = $P1.'issinglequoted'()
    unless $P4 goto __label_3
    $P4 = $P2.'issinglequoted'()
  __label_3:
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 3572
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P6, $P1, 'file'
    getattribute $P7, $P1, 'line'
.annotate 'line', 3573
    getattribute $P8, $P1, 'str'
    set $S1, $P8
    getattribute $P9, $P2, 'str'
    set $S2, $P9
    concat $S3, $S1, $S2
    $P5.'TokenSingleQuoted'($P6, $P7, $S3)
    set $P3, $P5
    goto __label_1
  __label_2:
.annotate 'line', 3575
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P1, 'file'
    getattribute $P13, $P1, 'line'
.annotate 'line', 3576
    $P14 = $P1.'getasquoted'()
    set $S4, $P14
    $P15 = $P2.'getasquoted'()
    set $S5, $P15
    concat $S6, $S4, $S5
    $P11.'TokenQuoted'($P12, $P13, $S6)
    set $P10, $P11
    set $P3, $P10
  __label_1:
.annotate 'line', 3577
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 3578

.end # concat_literal

.namespace [ 'Winxed'; 'Compiler'; 'FunctionId' ]

.sub 'FunctionId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.annotate 'line', 3587
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3588
    box $P1, __ARG_4
    setattribute self, 'subid', $P1
.annotate 'line', 3589

.end # FunctionId


.sub 'checkresult' :method
.annotate 'line', 3590
    .return('P')

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3593
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 3594

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3597
    getattribute $P1, self, 'subid'
    __ARG_1.'emitset'(__ARG_2, $P1)
.annotate 'line', 3598

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
.annotate 'line', 3582
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3584
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionRef' ]

.sub 'FunctionRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3606
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3607
    setattribute self, 'sym', __ARG_3
.annotate 'line', 3608

.end # FunctionRef


.sub 'checkresult' :method
.annotate 'line', 3609
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3612
    getattribute $P1, self, 'sym'
.annotate 'line', 3613
    getattribute $P3, $P1, 'owner'
    $P2 = $P3.'getpath'()
.annotate 'line', 3614
    self.'annotate'(__ARG_1)
.annotate 'line', 3615
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'name'
    $P2.'emit_get_global'(__ARG_1, $P3, __ARG_2, $P4)
.annotate 'line', 3616

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
.annotate 'line', 3601
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3603
    addattribute $P0, 'sym'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
.annotate 'line', 3622
    .return(1)

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3625
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3626
    setattribute self, 'name', __ARG_2
.annotate 'line', 3627

.end # IdentifierExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3630
    new $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3631
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 3632
    getattribute $P3, self, 'name'
    setattribute $P1, 'name', $P3
.annotate 'line', 3633
    .return($P1)
.annotate 'line', 3634

.end # clone


.sub 'isnull' :method
.annotate 'line', 3637
    getattribute $P1, self, 'name'
.annotate 'line', 3638
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3639
    .return(0)
  __label_1: # endif
.annotate 'line', 3640
    .tailcall $P1.'iskeyword'('null')
.annotate 'line', 3641

.end # isnull


.sub 'checkresult' :method
.annotate 'line', 3644
    getattribute $P1, self, 'name'
.annotate 'line', 3645
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3646
    if_null $P2, __label_1
.annotate 'line', 3647
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
    set $S1, $P1
    if $S1 == 'self' goto __label_5
    if $S1 == 'null' goto __label_6
    goto __label_3
  __label_5: # case
  __label_6: # case
.annotate 'line', 3652
    .return('P')
  __label_3: # default
.annotate 'line', 3654
    .return('')
  __label_4: # switch end
  __label_2: # endif
.annotate 'line', 3657

.end # checkresult


.sub 'getName' :method
.annotate 'line', 3660
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3661
    .return($S1)
.annotate 'line', 3662

.end # getName


.sub 'checkVar' :method
.annotate 'line', 3665
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
.annotate 'line', 3666

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3669
    getattribute $P1, self, 'name'
.annotate 'line', 3670
    unless_null $P1, __label_1
.annotate 'line', 3671
    WSubId_30('Bad thing')
  __label_1: # endif
.annotate 'line', 3672
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3673
    null $S1
.annotate 'line', 3674
    unless_null $P2, __label_2
    set $S2, $P1
    if $S2 == 'self' goto __label_6
    if $S2 == 'null' goto __label_7
    goto __label_4
  __label_6: # case
  __label_7: # case
.annotate 'line', 3678
    set $S1, $P1
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 3680
    set $S1, ''
  __label_5: # switch end
    goto __label_3
  __label_2: # else
.annotate 'line', 3684
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3685
    .return($S1)
.annotate 'line', 3686

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_90 = "WSubId_90"
.annotate 'line', 3689
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3690
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3691
    getattribute $P2, self, 'name'
    WSubId_90($P2, self)
  __label_1: # endif
.annotate 'line', 3692
    .return($P1)
.annotate 'line', 3693

.end # getIdentifier


.sub 'optimize' :method
.annotate 'line', 3696
    getattribute $P1, self, 'name'
.annotate 'line', 3697
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3698
    if_null $P2, __label_1
.annotate 'line', 3699
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3700
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3701
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3702
    band $I2, $I1, 1
    unless $I2 goto __label_4
.annotate 'line', 3703
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3704
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
    goto __label_5
  __label_4: # else
.annotate 'line', 3711
    $P3 = $P2.'getreg'()
.annotate 'line', 3712
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3713
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
.annotate 'line', 3717
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3719
    isnull $I2, $P4
    if $I2 goto __label_11
.annotate 'line', 3721
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I2 goto __label_12
.annotate 'line', 3731
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I2 goto __label_13
.annotate 'line', 3733
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    if $I2 goto __label_14
    goto __label_10
  __label_11: # case
    goto __label_9 # break
  __label_12: # case
.annotate 'line', 3722
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_15
.annotate 'line', 3723
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_17
    set $S1, $P6
  __label_17:
.annotate 'line', 3724
    self.'usesubid'($S1)
.annotate 'line', 3725
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
.annotate 'line', 3726
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionId'($P7, $P8, $P1, $S1)
    set $P5, $P6
    .return($P5)
    goto __label_16
  __label_15: # else
.annotate 'line', 3729
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionRef'($P7, $P8, $P4)
    set $P5, $P6
    .return($P5)
  __label_16: # endif
    goto __label_9 # break
  __label_13: # case
.annotate 'line', 3732
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    $P10.'FunctionRef'($P11, $P12, $P4)
    set $P9, $P10
    .return($P9)
  __label_14: # case
.annotate 'line', 3734
    new $P14, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
    getattribute $P15, self, 'owner'
    getattribute $P16, self, 'start'
    $P14.'InlineRef'($P15, $P16, $P4)
    set $P13, $P14
    .return($P13)
  __label_10: # default
  __label_9: # switch end
  __label_2: # endif
.annotate 'line', 3737
    .return(self)
.annotate 'line', 3738

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3741
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3742
    self.'annotate'(__ARG_1)
.annotate 'line', 3743
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3744

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3748
    null $S1
.annotate 'line', 3749
    $P2 = self.'getIdentifier'()
    set $S1, $P2
.annotate 'line', 3750
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3751
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_1:
.annotate 'line', 3752
    band $I2, $I1, 1
    unless $I2 goto __label_3
.annotate 'line', 3753
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 3754
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 3755
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
  __label_7:
    unless $I2 goto __label_6
.annotate 'line', 3756
    self.'annotate'(__ARG_1)
  __label_6: # endif
.annotate 'line', 3757
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 3760
    .return($S1)
.annotate 'line', 3761

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3764
    self.'annotate'(__ARG_1)
.annotate 'line', 3765
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3766
    WSubId_25("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3767
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3768
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3769
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
.annotate 'line', 3773
    __ARG_1.'emitnull'($S2)
    goto __label_7 # break
  __label_6: # default
.annotate 'line', 3776
    WSubId_25("Can't assign null to that type", self)
  __label_7: # switch end
    goto __label_5
  __label_4: # else
.annotate 'line', 3779
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3780
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 3782
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3783
    ne $S3, 'v', __label_13
.annotate 'line', 3784
    WSubId_25("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3785
    ne $S1, $S3, __label_14
.annotate 'line', 3786
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 3789
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3790
    self.'annotate'(__ARG_1)
.annotate 'line', 3791
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3792
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3794
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
  __label_15: # endif
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3797
    .return($S2)
.annotate 'line', 3798

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3619
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3621
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3808
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3809
    setattribute self, 'desc', __ARG_2
.annotate 'line', 3810

.end # LexicalVolatileExpr


.sub 'checkresult' :method
.annotate 'line', 3813
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
.annotate 'line', 3814

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3817
    getattribute $P1, self, 'desc'
.annotate 'line', 3818
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3819
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3820
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3821
    .return($S2)
.annotate 'line', 3822

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3825
    self.'annotate'(__ARG_1)
.annotate 'line', 3826
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3827
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3828

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3831
    getattribute $P1, self, 'owner'
.annotate 'line', 3832
    getattribute $P2, self, 'desc'
.annotate 'line', 3833
    $P3 = $P2.'gettype'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3834
    null $S2
.annotate 'line', 3836
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3840
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3837
    $P3 = $P1.'tempreg'($S1)
    set $S2, $P3
.annotate 'line', 3838
    __ARG_1.'emitnull'($S2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3841
    $P4 = $P1.'tempreg'($S1)
    set $S2, $P4
.annotate 'line', 3842
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3845
    ne $S1, 'P', __label_6
.annotate 'line', 3846
    $P5 = __ARG_2.'emit_getvar'(__ARG_1)
    set $S2, $P5
    goto __label_7
  __label_6: # else
.annotate 'line', 3847
    $P6 = __ARG_2.'checkresult'()
    set $S3, $P6
    ne $S1, $S3, __label_8
.annotate 'line', 3848
    $P7 = __ARG_2.'emit_get'(__ARG_1)
    set $S2, $P7
    goto __label_9
  __label_8: # else
.annotate 'line', 3850
    $P8 = $P1.'tempreg'($S1)
    set $S2, $P8
.annotate 'line', 3851
    __ARG_2.'emit'(__ARG_1, $S2)
  __label_9: # endif
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 3855
    $P3 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P3, $S2)
.annotate 'line', 3856
    .return($S2)
.annotate 'line', 3857

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3860
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
.annotate 'line', 3861

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3803
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3805
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3870
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3871

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3866
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 3881
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3882
    $P2 = WSubId_84(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3883
    getattribute $P1, self, 'key'
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3884
    WSubId_69('namespace identifier', __ARG_3)
  __label_1: # endif
.annotate 'line', 3885

.end # OpNamespaceExpr


.sub 'checkresult' :method
.annotate 'line', 3886
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3889
    getattribute $P1, self, 'owner'
.annotate 'line', 3890
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3891
    unless_null $P2, __label_1
.annotate 'line', 3892
    WSubId_25('unknown namespace', self)
  __label_1: # endif
.annotate 'line', 3893
    $P3 = $P2.'getpath'()
.annotate 'line', 3894
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3895

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3876
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3878
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_91 = "WSubId_91"
.annotate 'line', 3906
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3907
    $P2 = WSubId_91(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
.annotate 'line', 3908

.end # OpClassExpr


.sub 'checkresult' :method
.annotate 'line', 3909
    .return('P')

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3912
    getattribute $P1, self, 'owner'
.annotate 'line', 3913
    getattribute $P2, self, 'clspec'
.annotate 'line', 3914
    null $P3
.annotate 'line', 3917
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
.annotate 'line', 3920
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    if $I1 goto __label_4
.annotate 'line', 3923
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 3918
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3919
    if_null $P3, __label_7
    getattribute $P4, $P3, 'path'
    goto __label_6
  __label_7:
    null $P4
  __label_6:
    .return($P4)
  __label_4: # case
.annotate 'line', 3921
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3922
    if_null $P3, __label_9
    getattribute $P5, $P3, 'path'
    goto __label_8
  __label_9:
    null $P5
  __label_8:
    .return($P5)
  __label_5: # case
.annotate 'line', 3924
    typeof $P6, $P2
    set $S1, $P6
    concat $S2, $S1, " not supported yet here"
.annotate 'line', 3925
    getattribute $P7, $P2, 'start'
.annotate 'line', 3924
    WSubId_25($S2, $P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3927
    getattribute $P4, $P2, 'start'
    WSubId_30("Unexpected class key", $P4)
.annotate 'line', 3928

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3931
    getattribute $P1, self, 'owner'
.annotate 'line', 3932
    getattribute $P2, self, 'clspec'
.annotate 'line', 3935
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 3936
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3937
    if_null $P3, __label_4
.annotate 'line', 3938
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3939
    .return()
  __label_4: # endif
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3944
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3945
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3946
    __ARG_1.'say'()
.annotate 'line', 3947

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3900
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3902
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3957
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3958
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3959

.end # OpUnaryExpr


.sub 'cloneunary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3962
    getattribute $P1, self, 'start'
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'clone'(__ARG_2)
    __ARG_1.'OpUnaryExpr'(__ARG_2, $P1, $P2)
.annotate 'line', 3963
    .return(__ARG_1)
.annotate 'line', 3964

.end # cloneunary


.sub 'optimizearg' :method
.annotate 'line', 3967
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
.annotate 'line', 3968

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 3971
    self.'optimizearg'()
.annotate 'line', 3972
    .return(self)
.annotate 'line', 3973

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3952
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3954
    addattribute $P0, 'subexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3984
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3985
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3986
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3987

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3990
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3991
    .return(self)
.annotate 'line', 3992

.end # set


.sub 'clonebinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3995
    getattribute $P1, self, 'start'
.annotate 'line', 3996
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'clone'(__ARG_2)
    getattribute $P5, self, 'rexpr'
    $P4 = $P5.'clone'(__ARG_2)
.annotate 'line', 3995
    __ARG_1.'initbinary'(__ARG_2, $P1, $P2, $P4)
.annotate 'line', 3997
    .return(__ARG_1)
.annotate 'line', 3998

.end # clonebinary


.sub 'setfrom' :method
        .param pmc __ARG_1
.annotate 'line', 4001
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 4002

.end # setfrom


.sub 'optimizearg' :method
.annotate 'line', 4005
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 4006
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 4007

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 4010
    self.'optimizearg'()
.annotate 'line', 4011
    .return(self)
.annotate 'line', 4012

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
.annotate 'line', 4015
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 4016

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
.annotate 'line', 4019
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 4020

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3978
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3980
    addattribute $P0, 'lexpr'
.annotate 'line', 3981
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4029
    .return('I')
.annotate 'line', 4030

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4033
    self.'optimizearg'()
.annotate 'line', 4034
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4035
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4036
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4037
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 4038
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4039
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_44($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 4041
    .return(self)
.annotate 'line', 4042

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 4025
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
.annotate 'line', 4051
    .return('I')
.annotate 'line', 4052

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 4047
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4060
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4061

.end # OpDeleteExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4064
    self.'optimizearg'()
.annotate 'line', 4065
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4066
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    not $I1, $I2
    if $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    iseq $I1, $S1, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 4067
    WSubId_25("delete with invalid operator", self)
  __label_1: # endif
.annotate 'line', 4068
    .return(self)
.annotate 'line', 4069

.end # optimize


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4072
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4073
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 4074
    self.'annotate'(__ARG_1)
.annotate 'line', 4075
    __ARG_1.'print'('    delete ')
.annotate 'line', 4076
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 4077
    __ARG_1.'say'()
.annotate 'line', 4078

.end # emit_void


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4081
    self.'emit_void'(__ARG_1)
.annotate 'line', 4082
    __ARG_1.'emitset'(__ARG_2, '1')
.annotate 'line', 4083

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 4056
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4090
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4091

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4094
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4095
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 4096
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 4097
    self.'annotate'(__ARG_1)
.annotate 'line', 4098
    __ARG_1.'print'('    exists ', __ARG_2, ', ')
.annotate 'line', 4099
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 4100
    __ARG_1.'say'()
    goto __label_2
  __label_1: # else
.annotate 'line', 4103
    WSubId_25("exists with invalid operator", self)
  __label_2: # endif
.annotate 'line', 4104

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 4086
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4113
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4114

.end # OpUnaryMinusExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4117
    new $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4118

.end # clone


.sub 'checkresult' :method
.annotate 'line', 4121
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4122

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4125
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4126
    .return(self)
.annotate 'line', 4127

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 4130
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4131
    self.'optimizearg'()
.annotate 'line', 4132
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4133
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4134
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4136
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4137
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 4138
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_92($P2, $P3, $N2)
  __label_2: # endif
.annotate 'line', 4140
    .return(self)
.annotate 'line', 4141

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
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
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
.annotate 'line', 4147

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 4109
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4156
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4157

.end # OpNotExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4160
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4161

.end # clone


.sub 'isnegable' :method
.annotate 'line', 4162
    .return(1)

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 4165
    .return('I')
.annotate 'line', 4166

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4169
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4170
    .return(self)
.annotate 'line', 4171

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4174
    self.'optimizearg'()
.annotate 'line', 4175
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4176
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4177
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4178
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4180
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4181
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4182
    .return(self)
.annotate 'line', 4183

.end # optimize


.sub 'negated' :method
.annotate 'line', 4186
    getattribute $P1, self, 'subexpr'
    .return($P1)
.annotate 'line', 4187

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4190
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4191
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4192
    self.'annotate'(__ARG_1)
.annotate 'line', 4193
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
.annotate 'line', 4195
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 4198
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 4201
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_3: # switch end
.annotate 'line', 4203

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 4152
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]

.sub 'OpBinNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4212
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4213

.end # OpBinNotExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4216
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4217

.end # clone


.sub 'checkresult' :method
.annotate 'line', 4220
    .return('I')
.annotate 'line', 4221

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4224
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4225
    .return(self)
.annotate 'line', 4226

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4229
    self.'optimizearg'()
.annotate 'line', 4230
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4231
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4232
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4233
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4235
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4236
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4237
    .return(self)
.annotate 'line', 4238

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4241
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4242
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4243
    self.'annotate'(__ARG_1)
.annotate 'line', 4244
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
.annotate 'line', 4245

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 4208
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
.annotate 'line', 4254
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4255

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4258
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4259
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 4260
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 4261

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 4250
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4270
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4271
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4272

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4275
    self.'emit_get'(__ARG_1)
.annotate 'line', 4276

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 4266
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4283
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4284

.end # OpPreIncExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4287
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4288

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4291
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4292
    self.'annotate'(__ARG_1)
.annotate 'line', 4293
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4294
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4295
    .return($S1)
.annotate 'line', 4296

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 4279
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4303
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4304

.end # OpPreDecExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4307
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4308

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4311
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4312
    self.'annotate'(__ARG_1)
.annotate 'line', 4313
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4314
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4315
    .return($S1)
.annotate 'line', 4316

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 4299
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4325
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4326

.end # OpPostIncExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4329
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4330

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4333
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4334
    self.'annotate'(__ARG_1)
.annotate 'line', 4335
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_2
.annotate 'line', 4336
    $P2 = self.'tempreg'('P')
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 4337
    __ARG_1.'emitarg2'('clone', $S2, $S1)
.annotate 'line', 4338
    __ARG_1.'emitset'(__ARG_2, $S2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4341
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 4342
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4343
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4344

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4347
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4348
    self.'annotate'(__ARG_1)
.annotate 'line', 4349
    $P2 = self.'checkresult'()
    $P1 = self.'tempreg'($P2)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4350
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_3
.annotate 'line', 4351
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 4353
    __ARG_1.'emitset'($S2, $S1)
  __label_4: # endif
.annotate 'line', 4354
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4355
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4356
    .return($S2)
.annotate 'line', 4357

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4360
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4361
    self.'annotate'(__ARG_1)
.annotate 'line', 4362
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4363
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4364

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 4321
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4371
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4372

.end # OpPostDecExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4375
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4376

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4379
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4380
    self.'annotate'(__ARG_1)
.annotate 'line', 4381
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_2
.annotate 'line', 4382
    $P2 = self.'tempreg'('P')
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 4383
    __ARG_1.'emitarg2'('clone', $S2, $S1)
.annotate 'line', 4384
    __ARG_1.'emitset'(__ARG_2, $S2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4387
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 4388
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4389
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4390
    .return($S1)
.annotate 'line', 4391

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4394
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4395
    self.'annotate'(__ARG_1)
.annotate 'line', 4396
    $P2 = self.'checkresult'()
    $P1 = self.'tempreg'($P2)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4397
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_3
.annotate 'line', 4398
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 4400
    __ARG_1.'emitset'($S2, $S1)
  __label_4: # endif
.annotate 'line', 4401
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4402
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4403
    .return($S2)
.annotate 'line', 4404

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4407
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4408
    self.'annotate'(__ARG_1)
.annotate 'line', 4409
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4410
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4411

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 4367
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4422
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4423
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4424
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 4425
    .return(self)
.annotate 'line', 4426

.end # set


.sub 'cloneassign' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4429
    getattribute $P1, self, 'start'
.annotate 'line', 4430
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'clone'(__ARG_2)
    getattribute $P5, self, 'rexpr'
    $P4 = $P5.'clone'(__ARG_2)
.annotate 'line', 4429
    .tailcall __ARG_1.'set'(__ARG_2, $P1, $P2, $P4)
.annotate 'line', 4431

.end # cloneassign


.sub 'checkresult' :method
.annotate 'line', 4434
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4435

.end # checkresult


.sub 'optimize_base' :method
.annotate 'line', 4438
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 4439
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 4440
    .return(self)
.annotate 'line', 4441

.end # optimize_base


.sub 'optimize' :method
.annotate 'line', 4444
    .tailcall self.'optimize_base'()
.annotate 'line', 4445

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_88 = "WSubId_88"
.annotate 'line', 4448
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4449
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
    $P2 = $P1.'isliteral'()
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4450
    WSubId_88($P1)
  __label_1: # endif
.annotate 'line', 4451

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4454
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4455
    self.'annotate'(__ARG_1)
.annotate 'line', 4456
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4457

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4460
    self.'emit_get'(__ARG_1)
.annotate 'line', 4461

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 4416
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4418
    addattribute $P0, 'lexpr'
.annotate 'line', 4419
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4470
    new $P1, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    .tailcall self.'cloneassign'($P1, __ARG_1)
.annotate 'line', 4471

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4474
    self.'annotate'(__ARG_1)
.annotate 'line', 4475
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4476
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4477

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4480
    self.'annotate'(__ARG_1)
.annotate 'line', 4481
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4482
    getattribute $P2, self, 'rexpr'
    $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4483

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 4466
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4492
    self.'annotate'(__ARG_1)
.annotate 'line', 4493
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4494
    __ARG_1.'emitassign'(__ARG_2, $S1)
.annotate 'line', 4495

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4498
    self.'checkleft'()
.annotate 'line', 4499
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4500
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 4501
    WSubId_25("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 4502
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 4503
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 4504
    self.'annotate'(__ARG_1)
.annotate 'line', 4505
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 4506
    .return($S1)
.annotate 'line', 4507

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4510
    self.'annotate'(__ARG_1)
.annotate 'line', 4511
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4512

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 4488
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4521
    self.'checkleft'()
.annotate 'line', 4522
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4523
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4524
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4525
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4526
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4527
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 4528
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
.annotate 'line', 4530
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 4531
    null $S5
.annotate 'line', 4532
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
.annotate 'line', 4535
    eq $S2, 'S', __label_13
.annotate 'line', 4536
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4537
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4538
    set $S4, $S5
  __label_13: # endif
.annotate 'line', 4540
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 4544
    eq $S1, $S2, __label_14
.annotate 'line', 4545
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4546
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4547
    set $S4, $S5
  __label_14: # endif
.annotate 'line', 4549
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_9 # break
  __label_8: # default
.annotate 'line', 4552
    __ARG_1.'emitaddto'($S3, $S4)
  __label_9: # switch end
  __label_5: # endif
.annotate 'line', 4555
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_15
.annotate 'line', 4556
    $P1.'emit_store'(__ARG_1, $S3)
  __label_15: # endif
.annotate 'line', 4557
    .return($S3)
.annotate 'line', 4558

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 4517
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4567
    self.'checkleft'()
.annotate 'line', 4568
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4569
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4570
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4571
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4572
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4573
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4574
    null $S5
.annotate 'line', 4575
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
.annotate 'line', 4578
    WSubId_25("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4581
    eq $S1, $S2, __label_10
.annotate 'line', 4582
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4583
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4584
    set $S4, $S5
  __label_10: # endif
.annotate 'line', 4586
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 4589
    __ARG_1.'emitsubto'($S3, $S4)
  __label_6: # switch end
.annotate 'line', 4591
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 4592
    $P1.'emit_store'(__ARG_1, $S3)
  __label_11: # endif
.annotate 'line', 4593
    .return($S3)
.annotate 'line', 4594

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4563
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4603
    self.'checkleft'()
.annotate 'line', 4604
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4605
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4606
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4607
    null $S2
.annotate 'line', 4608
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    if_null $S3, __label_2
    length $I1, $S3
    ne $I1, 1, __label_2
    ord $I1, $S3
    if $I1 == 83 goto __label_4
    goto __label_2
  __label_4: # case
.annotate 'line', 4610
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4611
    self.'annotate'(__ARG_1)
.annotate 'line', 4612
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 4615
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4616
    self.'annotate'(__ARG_1)
.annotate 'line', 4617
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_3: # switch end
.annotate 'line', 4619
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_5
.annotate 'line', 4620
    $P1.'emit_store'(__ARG_1, $S1)
  __label_5: # endif
.annotate 'line', 4621
    .return($S1)
.annotate 'line', 4622

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4599
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4631
    self.'checkleft'()
.annotate 'line', 4632
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4633
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4634
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4635
    self.'annotate'(__ARG_1)
.annotate 'line', 4636
    __ARG_1.'emitarg2'('div', $S1, $S2)
.annotate 'line', 4637
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 4638
    $P1.'emit_store'(__ARG_1, $S1)
  __label_3: # endif
.annotate 'line', 4639
    .return($S1)
.annotate 'line', 4640

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4627
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4649
    self.'checkleft'()
.annotate 'line', 4650
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4651
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4652
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4653
    self.'annotate'(__ARG_1)
.annotate 'line', 4654
    __ARG_1.'emitarg2'('mod', $S1, $S2)
.annotate 'line', 4655
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 4656
    $P1.'emit_store'(__ARG_1, $S1)
  __label_3: # endif
.annotate 'line', 4657
    .return($S1)
.annotate 'line', 4658

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4645
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4670
    .return('I')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4673
    self.'optimizearg'()
.annotate 'line', 4674
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4675
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4676
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4677
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 4678
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4679
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_44($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 4681
    .return(self)
.annotate 'line', 4682

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 4685
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4686
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4687
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4688
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4689
    self.'annotate'(__ARG_1)
.annotate 'line', 4690
    null $S5
.annotate 'line', 4692
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4697
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4702
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4707
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4712
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4717
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4693
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4694
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4695
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4698
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4699
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4700
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4703
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4704
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4705
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4708
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4709
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4710
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4713
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4714
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4715
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4718
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4719
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4720
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4721
    if __ARG_3 == 0 goto __label_21
    if __ARG_3 == 1 goto __label_22
    if __ARG_3 == 2 goto __label_23
    goto __label_19
  __label_21: # case
.annotate 'line', 4726
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_22: # case
.annotate 'line', 4729
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_23: # case
.annotate 'line', 4732
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_19: # default
  __label_20: # switch end
.annotate 'line', 4735

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4738
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4739

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4742
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
.annotate 'line', 4743

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4746
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
.annotate 'line', 4747

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4668
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
.annotate 'line', 4758
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
.annotate 'line', 4759

.end # Negable


.sub 'isnegable' :method
.annotate 'line', 4760
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4763
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4764
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4765
    .return(self)
.annotate 'line', 4766

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4754
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4780
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4781
    self.'Negable'(__ARG_3)
.annotate 'line', 4782
    setattribute self, 'expr', __ARG_2
.annotate 'line', 4783

.end # CheckerExpr


.sub 'isnegable' :method
.annotate 'line', 4784
    .return(1)

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 4785
    .return('I')

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4774
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4776
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4792
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4793

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4796
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4797
    self.'annotate'(__ARG_1)
.annotate 'line', 4798
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4799
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4800
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
.annotate 'line', 4801

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4804
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4805
    self.'annotate'(__ARG_1)
.annotate 'line', 4806
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4807
    __ARG_1.'emitif_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4809
    __ARG_1.'emitunless_null'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4810

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4813
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4814
    self.'annotate'(__ARG_1)
.annotate 'line', 4815
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4816
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4818
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4819

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4788
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]

.sub 'ZeroCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4826
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4827

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4830
    getattribute $P1, self, 'expr'
.annotate 'line', 4831
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4832
    self.'annotate'(__ARG_1)
.annotate 'line', 4833
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4834
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4836
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_3: # endif
.annotate 'line', 4837

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4840
    getattribute $P1, self, 'expr'
.annotate 'line', 4841
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4842
    self.'annotate'(__ARG_1)
.annotate 'line', 4843
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4844
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4846
    __ARG_1.'emitif'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4847

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4850
    getattribute $P1, self, 'expr'
.annotate 'line', 4851
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4852
    self.'annotate'(__ARG_1)
.annotate 'line', 4853
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4854
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4856
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4857

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4822
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
.annotate 'line', 4866
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4867
    self.'Negable'(__ARG_5)
.annotate 'line', 4868

.end # OpEqualExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4871
    new $P2, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = self.'clonebinary'($P2, __ARG_1)
.annotate 'line', 4872
    getattribute $P2, self, 'positive'
    $P1.'Negable'($P2)
.annotate 'line', 4873
    .return($P1)
.annotate 'line', 4874

.end # clone


.sub 'isnegable' :method
.annotate 'line', 4875
    .return(1)

.end # isnegable


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4878
    self.'optimizearg'()
.annotate 'line', 4879
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4880
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4881
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4882
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4883
    unless $I1 goto __label_1
.annotate 'line', 4884
    unless $I2 goto __label_2
.annotate 'line', 4885
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_44($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4887
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
  __label_1: # endif
.annotate 'line', 4889
    unless $I2 goto __label_4
.annotate 'line', 4890
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4891
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4892
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4893
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_8
    $P3 = $P2.'isliteral'()
  __label_8:
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 4894
    ne $S1, $S2, __label_9
    if_null $S1, __label_10
    length $I7, $S1
    ne $I7, 1, __label_10
    ord $I7, $S1
    if $I7 == 73 goto __label_12
    if $I7 == 83 goto __label_13
    goto __label_10
  __label_12: # case
.annotate 'line', 4897
    $P4 = $P1.'getIntegerValue'()
    set $I3, $P4
.annotate 'line', 4898
    $P5 = $P2.'getIntegerValue'()
    set $I4, $P5
.annotate 'line', 4899
    getattribute $P6, self, 'positive'
    if_null $P6, __label_15
    unless $P6 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4900
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    .tailcall WSubId_44($P7, $P8, $I5)
  __label_13: # case
.annotate 'line', 4902
    getattribute $P10, $P1, 'strval'
    getattribute $P9, $P10, 'str'
    null $S3
    if_null $P9, __label_16
    set $S3, $P9
  __label_16:
.annotate 'line', 4903
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_17
    set $S4, $P11
  __label_17:
.annotate 'line', 4904
    getattribute $P13, self, 'positive'
    if_null $P13, __label_19
    unless $P13 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4905
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    .tailcall WSubId_44($P14, $P15, $I6)
  __label_10: # default
  __label_11: # switch end
  __label_9: # endif
  __label_7: # endif
.annotate 'line', 4909
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4910
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4911
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4912
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4913
    .return(self)
.annotate 'line', 4914

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4917
    self.'annotate'(__ARG_1)
.annotate 'line', 4918
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'iseq'
    goto __label_1
  __label_2:
    set $S1, 'isne'
  __label_1:
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4919

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4922
    self.'annotate'(__ARG_1)
.annotate 'line', 4923
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4924

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4927
    self.'annotate'(__ARG_1)
.annotate 'line', 4928
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'eq'
    goto __label_1
  __label_2:
    set $S1, 'ne'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4929

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4932
    self.'annotate'(__ARG_1)
.annotate 'line', 4933
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'ne'
    goto __label_1
  __label_2:
    set $S1, 'eq'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4934

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4862
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
.annotate 'line', 4945
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4946
    self.'Negable'(__ARG_5)
.annotate 'line', 4947

.end # OpSameExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4950
    new $P2, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P1 = self.'clonebinary'($P2, __ARG_1)
.annotate 'line', 4951
    getattribute $P2, self, 'positive'
    $P1.'Negable'($P2)
.annotate 'line', 4952
    .return($P1)
.annotate 'line', 4953

.end # clone


.sub 'isnegable' :method
.annotate 'line', 4954
    .return(1)

.end # isnegable


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4957
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
.annotate 'line', 4958

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4961
    self.'annotate'(__ARG_1)
.annotate 'line', 4962
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4963
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4964
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4965

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4968
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4969

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4972
    self.'annotate'(__ARG_1)
.annotate 'line', 4973
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4974
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4975
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4976

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4979
    self.'annotate'(__ARG_1)
.annotate 'line', 4980
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4981
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4982
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4983

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4940
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4942
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4992
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 4993

.end # clone


.sub 'isnegable' :method
.annotate 'line', 4994
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4997
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 4998

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5001
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5002

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5005
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5006

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5009
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5010

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5013
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5014

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4988
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5023
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5024

.end # clone


.sub 'isnegable' :method
.annotate 'line', 5025
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 5028
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 5029

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5032
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5033

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5036
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5037

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5040
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5041

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5044
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5045

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 5019
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5054
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5055

.end # clone


.sub 'isnegable' :method
.annotate 'line', 5056
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 5059
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 5060

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5063
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5064

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5067
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5068

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5071
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5072

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5075
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5076

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 5050
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5085
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5086

.end # clone


.sub 'isnegable' :method
.annotate 'line', 5087
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 5090
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 5091

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5094
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5095

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5098
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5099

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5102
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5103

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5106
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5107

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 5081
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
.annotate 'line', 5116
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
.annotate 'line', 5118

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 5112
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5127
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5128

.end # OpBoolAndExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5131
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5132

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 5135
    self.'optimizearg'()
.annotate 'line', 5136
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 5137
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5138
    unless $I1 goto __label_3
.annotate 'line', 5139
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 5140
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_44($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 5138
    .return($P1)
  __label_1: # endif
.annotate 'line', 5142
    .return(self)
.annotate 'line', 5143

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5146
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5147
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5148
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5149
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
.annotate 'line', 5150
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5151
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5152
    __ARG_1.'emitbinop'('and', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5155
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5156
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 5157
    $P4 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 5158
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 5161
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 5162
    __ARG_1.'emitunless'(__ARG_2, $S4)
.annotate 'line', 5163
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5164
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 5165
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 5168
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 5169
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5171

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5174
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5175
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5176
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5177
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
.annotate 'line', 5178
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5179
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5180
    __ARG_1.'emitbinop'('and', "$I0", $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5183
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5184
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_9
    set $S5, $P3
  __label_9:
.annotate 'line', 5185
    __ARG_1.'emitunless'($S5, $S4)
.annotate 'line', 5186
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 5187
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5189

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 5123
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5198
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5199

.end # OpBoolOrExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5202
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5203

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 5206
    self.'optimizearg'()
.annotate 'line', 5207
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 5208
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5209
    if $I1 goto __label_3
.annotate 'line', 5210
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 5211
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_44($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 5209
    .return($P1)
  __label_1: # endif
.annotate 'line', 5213
    .return(self)
.annotate 'line', 5214

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5217
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5218
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5219
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5220
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
.annotate 'line', 5221
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5222
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5223
    __ARG_1.'emitbinop'('or', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5226
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5227
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 5228
    $P4 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 5229
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 5232
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 5233
    __ARG_1.'emitif'(__ARG_2, $S4)
.annotate 'line', 5234
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5235
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 5236
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 5239
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 5240
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5242

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5245
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5246
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5247
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5248
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
.annotate 'line', 5249
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5250
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5251
    __ARG_1.'emitbinop'('or', "$I0", $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5254
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5255
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_9
    set $S5, $P3
  __label_9:
.annotate 'line', 5256
    __ARG_1.'emitif'($S5, $S4)
.annotate 'line', 5257
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 5258
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5260

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 5194
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 5265
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5275
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5276

.end # OpBinAndExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5279
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5280

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5283
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5284
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5285
    self.'annotate'(__ARG_1)
.annotate 'line', 5286
    __ARG_1.'emitbinop'('band', __ARG_2, $S1, $S2)
.annotate 'line', 5287

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5290
    band $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5291

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 5271
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5300
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5301

.end # OpBinOrExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5304
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5305

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5308
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5309
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5310
    self.'annotate'(__ARG_1)
.annotate 'line', 5311
    __ARG_1.'emitbinop'('bor', __ARG_2, $S1, $S2)
.annotate 'line', 5312

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5315
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5316

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 5296
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5325
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5326

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5329
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5330
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5331
    self.'annotate'(__ARG_1)
.annotate 'line', 5332
    __ARG_1.'emitbinop'('bxor', __ARG_2, $S1, $S2)
.annotate 'line', 5333

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5336
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5337

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 5321
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5347
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5349
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 5356
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5350
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 5351
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 5352
    getattribute $P3, __ARG_4, 'values'
    self.'append'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 5354
    self.'pushexpr'(__ARG_4)
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5357
    getattribute $P5, __ARG_4, 'values'
    setattribute self, 'values', $P5
.annotate 'line', 5358
    self.'unshiftexpr'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 5361
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = __ARG_3
    $P7[1] = __ARG_4
    setattribute self, 'values', $P7
  __label_1: # switch end
.annotate 'line', 5363

.end # ConcatString


.sub 'pushexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_93 = "WSubId_93"
.annotate 'line', 5366
    getattribute $P1, self, 'values'
.annotate 'line', 5367
    $P2 = $P1[-1]
.annotate 'line', 5368
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5369
    $P4 = WSubId_93($P2, __ARG_1)
    $P1[-1] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5371
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 5372

.end # pushexpr


.sub 'unshiftexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_93 = "WSubId_93"
.annotate 'line', 5375
    getattribute $P1, self, 'values'
.annotate 'line', 5376
    $P2 = $P1[0]
.annotate 'line', 5377
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5378
    $P4 = WSubId_93(__ARG_1, $P2)
    $P1[0] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5380
    unshift $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 5381

.end # unshiftexpr


.sub 'append' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_93 = "WSubId_93"
.annotate 'line', 5384
    getattribute $P1, self, 'values'
.annotate 'line', 5385
    $P2 = $P1[-1]
.annotate 'line', 5386
    $P4 = $P2.'isstringliteral'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5387
    $P3 = __ARG_1[0]
.annotate 'line', 5388
    $P4 = $P3.'isstringliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5389
    $P5 = WSubId_93($P2, $P3)
    $P1[-1] = $P5
.annotate 'line', 5390
    __ARG_1.'shift'()
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 5393
    $P1.'append'(__ARG_1)
.annotate 'line', 5394

.end # append


.sub 'checkresult' :method
.annotate 'line', 5396
    .return('S')

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
.annotate 'line', 5399
    getattribute $P1, self, 'values'
.annotate 'line', 5400
    elements $I1, $P1
.annotate 'line', 5401
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 5402
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5403
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 5402
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5404
    .return($P2)
.annotate 'line', 5405

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5408
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5409
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 5410

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 5413
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5414
    elements $I1, $P1
.annotate 'line', 5415
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5416
    self.'annotate'(__ARG_1)
.annotate 'line', 5417
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
.annotate 'line', 5418
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 5419
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 5418
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 5420
    .return($S1)
.annotate 'line', 5421

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5424
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5425
    elements $I1, $P1
.annotate 'line', 5426
    self.'annotate'(__ARG_1)
.annotate 'line', 5427
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
.annotate 'line', 5428
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5429
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 5428
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5430

.end # emit_init


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5433
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5434
    elements $I1, $P1
.annotate 'line', 5435
    self.'annotate'(__ARG_1)
.annotate 'line', 5436
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5437
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 5436
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5438

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 5342
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 5344
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
.annotate 'line', 5447
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 5448

.end # RepeatString


.sub 'checkresult' :method
.annotate 'line', 5449
    .return('S')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5452
    getattribute $P1, self, 'rexpr'
.annotate 'line', 5453
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5454
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5455
    self.'annotate'(__ARG_1)
.annotate 'line', 5456
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
.annotate 'line', 5457

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 5443
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5466
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5467

.end # OpAddExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5470
    new $P1, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5471

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 5474
    self.'optimizearg'()
.annotate 'line', 5475
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5476
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5477
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5478
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5479
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5480
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'S'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5481
    .tailcall WSubId_93($P1, $P2)
  __label_5: # endif
.annotate 'line', 5482
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_8
    iseq $I3, $S2, 'I'
  __label_8:
    unless $I3 goto __label_7
.annotate 'line', 5483
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5484
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5485
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_7: # endif
.annotate 'line', 5487
    $P3 = WSubId_94($S1, $S2)
    if_null $P3, __label_9
    unless $P3 goto __label_9
.annotate 'line', 5488
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5489
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5490
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_92($P3, $P4, $N3)
  __label_9: # endif
  __label_3: # endif
.annotate 'line', 5493
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'S'
  __label_11:
    unless $I3 goto __label_10
.annotate 'line', 5494
    new $P4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'ConcatString'($P5, $P6, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_10: # endif
.annotate 'line', 5496
    .return(self)
.annotate 'line', 5497

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_94 = "WSubId_94"
.annotate 'line', 5500
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5501
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5502
    ne $S1, $S2, __label_3
.annotate 'line', 5503
    .return($S1)
  __label_3: # endif
.annotate 'line', 5504
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 5505
    .return('S')
  __label_4: # endif
.annotate 'line', 5506
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 5507
    .return('S')
  __label_6: # endif
.annotate 'line', 5508
    $P1 = WSubId_94($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 5509
    .return('N')
  __label_8: # endif
.annotate 'line', 5510
    .return('I')
.annotate 'line', 5511

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5514
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5515
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5516
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5517
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5518
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5520
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5521
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5522
    ne $S1, 'S', __label_6
.annotate 'line', 5523
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
.annotate 'line', 5524
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 5525
    eq $S2, 'S', __label_11
.annotate 'line', 5526
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 5527
    set $S4, $S6
    goto __label_12
  __label_11: # else
.annotate 'line', 5530
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 5531
    set $S5, $S6
  __label_12: # endif
  __label_8: # endif
.annotate 'line', 5534
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
    goto __label_7
  __label_6: # else
.annotate 'line', 5537
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5538
    null $S7
.annotate 'line', 5539
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
.annotate 'line', 5541
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 5542
    __ARG_1.'emitset'($S7, $S4)
  __label_18: # endif
.annotate 'line', 5544
    null $S8
.annotate 'line', 5545
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
.annotate 'line', 5547
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 5548
    __ARG_1.'emitset'($S8, $S5)
  __label_20: # endif
.annotate 'line', 5550
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
    goto __label_14
  __label_13: # else
.annotate 'line', 5553
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
  __label_7: # endif
.annotate 'line', 5555

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 5462
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5564
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5565

.end # OpSubExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5568
    new $P1, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5569

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 5572
    self.'optimizearg'()
.annotate 'line', 5573
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5574
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5575
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5576
    $P4 = $P1.'checkresult'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5577
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 5578
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5579
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5580
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5581
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 5584
    .return(self)
.annotate 'line', 5585

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5588
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5589
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5591
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 5593
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 5595
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 5597
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 5592
    .return($S1)
  __label_6: # case
.annotate 'line', 5594
    .return('P')
  __label_8: # case
.annotate 'line', 5596
    .return('N')
  __label_10: # case
.annotate 'line', 5598
    .return('N')
  __label_4: # default
.annotate 'line', 5600
    .return('I')
  __label_3: # switch end
.annotate 'line', 5602

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5605
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5606
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5607
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5608
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5609
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5610
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5611
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5612
    null $S6
.annotate 'line', 5613
    eq $S2, $S1, __label_6
.annotate 'line', 5614
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5615
    ne $S1, 'P', __label_7
.annotate 'line', 5616
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 5618
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 5619
    set $S4, $S6
  __label_6: # endif
.annotate 'line', 5621
    eq $S3, $S1, __label_9
.annotate 'line', 5622
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5623
    ne $S1, 'P', __label_10
.annotate 'line', 5624
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 5626
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 5627
    set $S5, $S6
  __label_9: # endif
.annotate 'line', 5629
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
.annotate 'line', 5630

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 5560
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5639
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5640

.end # OpMulExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5643
    new $P1, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5644

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 5647
    self.'optimizearg'()
.annotate 'line', 5648
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5649
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5650
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5651
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5652
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5653
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5654
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 5655
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5656
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_5: # endif
.annotate 'line', 5658
    $P3 = WSubId_94($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 5659
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5660
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5661
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_92($P3, $P4, $N3)
  __label_7: # endif
  __label_3: # endif
.annotate 'line', 5664
    ne $S1, 'S', __label_8
.annotate 'line', 5665
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 5666
    .return(self)
.annotate 'line', 5667

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5670
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5671
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5672
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5673
    ne $S1, $S2, __label_3
.annotate 'line', 5674
    .return($S1)
  __label_3: # endif
.annotate 'line', 5675
    ne $S1, 'S', __label_4
.annotate 'line', 5676
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5678
    .return('N')
  __label_5: # endif
.annotate 'line', 5679

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5682
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5683
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5684
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5685
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5686
    null $S3
    null $S4
.annotate 'line', 5687
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
.annotate 'line', 5688
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5689
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5690
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5691
    .return()
  __label_3: # endif
.annotate 'line', 5696
    ne $S1, 'N', __label_7
.annotate 'line', 5697
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5698
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5699
    null $S5
    if_null $S2, __label_8
    length $I3, $S2
    ne $I3, 1, __label_8
    ord $I3, $S2
    if $I3 == 73 goto __label_10
    if $I3 == 78 goto __label_11
    goto __label_8
  __label_10: # case
.annotate 'line', 5702
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5703
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5704
    set $S5, $S4
    goto __label_9 # break
  __label_11: # case
.annotate 'line', 5707
    set $S5, $S4
    goto __label_9 # break
  __label_8: # default
.annotate 'line', 5710
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5711
    __ARG_1.'emitset'($S5, $S4)
  __label_9: # switch end
.annotate 'line', 5713
    self.'annotate'(__ARG_1)
.annotate 'line', 5714
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
.annotate 'line', 5715
    .return()
  __label_7: # endif
.annotate 'line', 5718
    null $I1
    null $I2
.annotate 'line', 5719
    $P4 = $P1.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_14
    $P3 = $P1.'isidentifier'()
  __label_14:
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 5720
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S3, $P5
.annotate 'line', 5721
    $P1.'emit'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
.annotate 'line', 5724
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5725
    set $S3, $I1
  __label_13: # endif
.annotate 'line', 5727
    $P4 = $P2.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_17
    $P3 = $P2.'isidentifier'()
  __label_17:
    if_null $P3, __label_15
    unless $P3 goto __label_15
.annotate 'line', 5728
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S4, $P5
.annotate 'line', 5729
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
.annotate 'line', 5734
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5735
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_21: # case
.annotate 'line', 5738
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_22: # case
  __label_18: # default
.annotate 'line', 5742
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5743
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
  __label_16: # endif
.annotate 'line', 5747
    self.'annotate'(__ARG_1)
.annotate 'line', 5748
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5749

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 5635
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5758
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5759

.end # OpDivExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5762
    new $P1, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5763

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 5766
    self.'optimizearg'()
.annotate 'line', 5767
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5768
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5769
    $P5 = $P1.'isliteral'()
    unless $P5 goto __label_2
    $P5 = $P2.'isliteral'()
  __label_2:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 5770
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 5771
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5772
    null $P3
.annotate 'line', 5773
    null $P4
.annotate 'line', 5774
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5775
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5776
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5777
    unless $I2 goto __label_7
.annotate 'line', 5778
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_44($P5, $P6, $N3)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 5780
    $P5 = WSubId_94($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
.annotate 'line', 5781
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5782
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5783
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5784
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_92($P5, $P6, $N3)
  __label_9: # endif
  __label_8: # endif
  __label_1: # endif
.annotate 'line', 5787
    .return(self)
.annotate 'line', 5788

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5791
    .return('N')
.annotate 'line', 5792

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5795
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5796
    null $P2
.annotate 'line', 5797
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5798
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
.annotate 'line', 5799
    $P2 = self.'tempreg'('N')
.annotate 'line', 5800
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5801
    set $P3, $P2
  __label_1: # endif
.annotate 'line', 5803
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5804
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5805
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
.annotate 'line', 5806
    $P2 = self.'tempreg'('N')
.annotate 'line', 5807
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5808
    set $P5, $P2
  __label_2: # endif
.annotate 'line', 5810
    self.'annotate'(__ARG_1)
.annotate 'line', 5811
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
.annotate 'line', 5812

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5754
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5821
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5822

.end # OpModExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5825
    new $P1, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5826

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5829
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5830
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5831
    self.'annotate'(__ARG_1)
.annotate 'line', 5832
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5833

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5836
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5837

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5817
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5846
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5847

.end # OpCModExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5850
    new $P1, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5851

.end # clone


.sub 'checkresult' :method
.annotate 'line', 5854
    .return('I')
.annotate 'line', 5855

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5858
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5859
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5860
    self.'annotate'(__ARG_1)
.annotate 'line', 5865
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5866

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5842
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5875
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5876

.end # OpShiftleftExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5879
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5880

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5883
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5884
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5885
    self.'annotate'(__ARG_1)
.annotate 'line', 5886
    __ARG_1.'emitbinop'('shl', __ARG_2, $S1, $S2)
.annotate 'line', 5887

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5890
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5891

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5871
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5900
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5901

.end # OpShiftrightExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5904
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5905

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5908
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5909
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5910
    self.'annotate'(__ARG_1)
.annotate 'line', 5911
    __ARG_1.'emitbinop'('shr', __ARG_2, $S1, $S2)
.annotate 'line', 5912

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5915
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5916

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5896
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]

.sub 'OpShiftlrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5925
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5926

.end # OpShiftlrightExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5929
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5930

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5933
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5934
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5935
    self.'annotate'(__ARG_1)
.annotate 'line', 5936
    __ARG_1.'emitbinop'('lsr', __ARG_2, $S1, $S2)
.annotate 'line', 5937

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5940
    lsr $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5941

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
.annotate 'line', 5921
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5950
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 5951

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 5954
    null $I1
    null $I2
.annotate 'line', 5955
    set $S1, ''
.annotate 'line', 5956
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 5957
    $P5 = $P1.'getname'()
    set $S2, $P5
    if $S2 == 'flat' goto __label_5
    if $S2 == 'named' goto __label_6
    goto __label_3
  __label_5: # case
.annotate 'line', 5959
    set $I1, 1
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 5962
    set $I2, 1
.annotate 'line', 5963
    $P6 = $P1.'numargs'()
    set $I3, $P6
    if $I3 == 0 goto __label_9
    if $I3 == 1 goto __label_10
    goto __label_7
  __label_9: # case
    goto __label_8 # break
  __label_10: # case
.annotate 'line', 5967
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5968
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5969
    WSubId_25('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5970
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_8 # break
  __label_7: # default
.annotate 'line', 5973
    WSubId_25('Invalid modifier', self)
  __label_8: # switch end
  __label_3: # default
  __label_4: # switch end
    goto __label_1
  __label_2: # endfor
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5981
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5984
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5979
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5982
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5985
    __ARG_1.'print'(' :named')
.annotate 'line', 5986
    eq $S1, '', __label_17
.annotate 'line', 5987
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5990

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5946
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5999
    setattribute self, 'arg', __ARG_1
.annotate 'line', 6000
    setattribute self, 'modifiers', __ARG_2
.annotate 'line', 6001

.end # Argument


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6004
    new $P1, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 6005
    getattribute $P4, self, 'arg'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'arg', $P3
.annotate 'line', 6006
    .return($P1)
.annotate 'line', 6007

.end # clone


.sub 'optimize' :method
.annotate 'line', 6010
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 6011
    .return(self)
.annotate 'line', 6012

.end # optimize


.sub 'hascompilevalue' :method
.annotate 'line', 6015
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
.annotate 'line', 6016

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5995
    addattribute $P0, 'arg'
.annotate 'line', 5996
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 6021
    null $P1
.annotate 'line', 6022
    $P2 = WSubId_67(__ARG_1, __ARG_2)
.annotate 'line', 6023
    $P3 = __ARG_1.'get'()
.annotate 'line', 6024
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 6025
    $P3 = __ARG_1.'get'()
.annotate 'line', 6026
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 6027
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
    goto __label_4
  __label_3: # else
.annotate 'line', 6030
    WSubId_69('modifier list', $P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 6033
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 6034
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
.annotate 'line', 6035

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_95 = "WSubId_95"
.annotate 'line', 6046
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6047
    setattribute self, 'start', __ARG_2
.annotate 'line', 6048
    $P1 = __ARG_3.'get'()
.annotate 'line', 6049
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6050
    __ARG_3.'unget'($P1)
.annotate 'line', 6051
    $P3 = WSubId_66(__ARG_3, __ARG_1, WSubId_95, __ARG_4)
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 6053

.end # ArgumentList


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6056
    new $P1, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 6057
    setattribute $P1, 'owner', __ARG_1
.annotate 'line', 6058
    getattribute $P10, self, 'start'
    setattribute $P1, 'start', $P10
.annotate 'line', 6059
    getattribute $P2, self, 'args'
.annotate 'line', 6060
    if_null $P2, __label_1
.annotate 'line', 6061
    set $P3, $P2
    set $P4, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P5, $P3
    root_new $P6, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P7 = WSubId_3($P10, $P4)
.annotate 'line', 71
    if_null $P5, __label_5
    iter $P12, $P5
    set $P12, 0
  __label_4: # for iteration
    unless $P12 goto __label_5
    shift $P8, $P12
.annotate 'line', 72
    $P13 = $P7($P8)
    push $P6, $P13
    goto __label_4
  __label_5: # endfor
.annotate 'line', 73
    set $P11, $P6
    goto __label_3
  __label_3:
    goto __label_2
  __label_2:
.annotate 'line', 132
    set $P9, $P11
.annotate 'line', 6061
    setattribute $P1, 'args', $P9
  __label_1: # endif
.annotate 'line', 6062
    .return($P1)
.annotate 'line', 6063

.end # clone


.sub 'numargs' :method
.annotate 'line', 6066
    getattribute $P1, self, 'args'
.annotate 'line', 6067
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
    .return($I1)
.annotate 'line', 6068

.end # numargs


.sub 'getrawargs' :method
.annotate 'line', 6071
    getattribute $P1, self, 'args'
    .return($P1)
.annotate 'line', 6072

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 6075
    getattribute $P1, self, 'args'
.annotate 'line', 6076
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 6077

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
.annotate 'line', 6080
    getattribute $P1, self, 'args'
.annotate 'line', 6081
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
.annotate 'line', 6082

.end # getfreearg


.sub 'optimize' :method
.annotate 'line', 6085
    getattribute $P1, self, 'args'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 6086
    .return(self)
.annotate 'line', 6087

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 6090
    getattribute $P1, self, 'argregs'
.annotate 'line', 6091
    unless_null $P1, __label_1
.annotate 'line', 6092
    new $P2, ['ResizableStringArray']
.annotate 'line', 6093
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
.annotate 'line', 6094
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P7, $P5
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P4, $P7
.annotate 'line', 6095
    getattribute $P8, $P4, 'arg'
    $P6 = $P3.'add'($P8)
    null $S1
    if_null $P6, __label_4
    set $S1, $P6
  __label_4:
.annotate 'line', 6096
    push $P2, $S1
    goto __label_2
  __label_3: # endfor
.annotate 'line', 6098
    setattribute self, 'argregs', $P2
  __label_1: # endif
.annotate 'line', 6100
    .return($P1)
.annotate 'line', 6101

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 6104
    getattribute $P1, self, 'args'
.annotate 'line', 6105
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 6107
    set $S1, ''
.annotate 'line', 6108
    $P4 = self.'numargs'()
    set $I1, $P4
.annotate 'line', 6109
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 6110
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 6111
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 6112
    if_null $P3, __label_4
.annotate 'line', 6113
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 6114
    set $S1, ', '
  __label_1: # for iteration
.annotate 'line', 6109
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 6116

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 6039
    addattribute $P0, 'owner'
.annotate 'line', 6040
    addattribute $P0, 'start'
.annotate 'line', 6041
    addattribute $P0, 'args'
.annotate 'line', 6042
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_96')
        .param pmc __ARG_1
.annotate 'line', 6121
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 6122
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 6123
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 6124
    .return(1)
.annotate 'line', 6125

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6136
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6137
    setattribute self, 'builtin', __ARG_3
.annotate 'line', 6138
    setattribute self, 'args', __ARG_4
.annotate 'line', 6139

.end # CallBuiltinExpr


.sub 'checkresult' :method
.annotate 'line', 6142
    getattribute $P1, self, 'builtin'
    .tailcall $P1.'result'()
.annotate 'line', 6143

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6146
    self.'emit'(__ARG_1, "")
.annotate 'line', 6147

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6150
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
.annotate 'line', 6156
    WSubId_25("Can't use result of a void builtin", self)
  __label_2: # default
.annotate 'line', 6158
    concat $S3, "Unexpected result type '", $S1
    concat $S3, $S3, "'"
    WSubId_30($S3, self)
  __label_3: # switch end
.annotate 'line', 6160
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_9
    set $S2, $P1
  __label_9:
.annotate 'line', 6161
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 6162
    .return($S2)
.annotate 'line', 6163

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6166
    getattribute $P1, self, 'builtin'
.annotate 'line', 6167
    getattribute $P2, self, 'args'
.annotate 'line', 6168
    new $P3, ['ResizableStringArray']
.annotate 'line', 6169
    null $P4
.annotate 'line', 6170
    $P8 = $P1.'params'()
    set $I3, $P8
    if $I3 == -1 goto __label_3
    if $I3 == -2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 6172
    new $P9, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P10, self, 'owner'
    $P9.'CollectValues'($P10, __ARG_1)
    set $P5, $P9
.annotate 'line', 6173
    if_null $P2, __label_6
    iter $P11, $P2
    set $P11, 0
  __label_5: # for iteration
    unless $P11 goto __label_6
    shift $P4, $P11
.annotate 'line', 6174
    getattribute $P13, $P4, 'arg'
    $P12 = $P5.'add'($P13)
    push $P3, $P12
    goto __label_5
  __label_6: # endfor
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 6177
    root_new $P6, ['parrot';'ResizablePMCArray']
.annotate 'line', 6178
    if_null $P2, __label_8
    iter $P14, $P2
    set $P14, 0
  __label_7: # for iteration
    unless $P14 goto __label_8
    shift $P4, $P14
.annotate 'line', 6179
    getattribute $P15, $P4, 'arg'
    push $P6, $P15
    goto __label_7
  __label_8: # endfor
.annotate 'line', 6180
    getattribute $P16, self, 'builtin'
    getattribute $P17, self, 'start'
    $P16.'expand'(__ARG_1, self, $P17, __ARG_2, $P6)
.annotate 'line', 6181
    .return()
  __label_1: # default
.annotate 'line', 6183
    getattribute $P18, self, 'args'
    set $I1, $P18
.annotate 'line', 6184
    new $P19, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P20, self, 'owner'
    $P19.'CollectValues'($P20, __ARG_1)
    set $P7, $P19
.annotate 'line', 6185
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
.annotate 'line', 6186
    $P21 = $P2[$I2]
    getattribute $P4, $P21, 'arg'
.annotate 'line', 6187
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
.annotate 'line', 6188
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
.annotate 'line', 6189
    null $S3
.annotate 'line', 6190
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
.annotate 'line', 6195
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 6196
    __ARG_1.'emitnull'($S3)
    goto __label_17 # break
  __label_16: # default
.annotate 'line', 6199
    $P10 = $P7.'add'($P4)
    set $S3, $P10
  __label_17: # switch end
    goto __label_15
  __label_14: # else
.annotate 'line', 6203
    iseq $I3, $S1, $S2
    if $I3 goto __label_24
    iseq $I3, $S2, '?'
  __label_24:
    if $I3 goto __label_23
.annotate 'line', 6204
    iseq $I3, $S2, 'p'
    unless $I3 goto __label_25
.annotate 'line', 6205
    iseq $I3, $S1, 'S'
    if $I3 goto __label_26
    iseq $I3, $S1, 'P'
  __label_26:
  __label_25:
  __label_23:
    unless $I3 goto __label_21
.annotate 'line', 6206
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
.annotate 'line', 6208
    ne $S2, 'p', __label_27
.annotate 'line', 6209
    set $S2, 'P'
  __label_27: # endif
.annotate 'line', 6210
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
.annotate 'line', 6211
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
.annotate 'line', 6217
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
.annotate 'line', 6218
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_36 # break
  __label_35: # default
.annotate 'line', 6221
    set $S3, $S4
  __label_36: # switch end
    goto __label_30 # break
  __label_32: # case
  __label_33: # case
  __label_34: # case
.annotate 'line', 6227
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 6228
    __ARG_1.'emitset'($S3, $S4)
    goto __label_30 # break
  __label_29: # default
.annotate 'line', 6231
    set $S3, $S4
  __label_30: # switch end
  __label_22: # endif
  __label_15: # endif
.annotate 'line', 6235
    push $P3, $S3
  __label_9: # for iteration
.annotate 'line', 6185
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_2: # switch end
.annotate 'line', 6238
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)
.annotate 'line', 6239

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
.annotate 'line', 6129
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 6131
    addattribute $P0, 'builtin'
.annotate 'line', 6132
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_96 = "WSubId_96"
.annotate 'line', 6246
    $P7 = __ARG_3.'getname'()
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 6247
    __ARG_1.'use_builtin'($S1)
.annotate 'line', 6248
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P7 = __ARG_4.'numargs'()
    set $I1, $P7
  __label_2:
.annotate 'line', 6249
    if $I1 goto __label_5
    root_new $P7, ['parrot';'ResizablePMCArray']
    set $P1, $P7
    goto __label_4
  __label_5:
    $P8 = __ARG_4.'getrawargs'()
    set $P1, $P8
  __label_4:
.annotate 'line', 6251
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 6252
    null $P3
.annotate 'line', 6253
    if_null $P2, __label_7
    iter $P9, $P2
    set $P9, 0
  __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P4, $P9
.annotate 'line', 6254
    getattribute $P7, $P4, 'nparams'
    set $I2, $P7
.annotate 'line', 6255
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 6256
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 6257
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 6258
    set $P3, $P4
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
.annotate 'line', 6260
    unless_null $P3, __label_12
.annotate 'line', 6261
    WSubId_25("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 6264
    $P7 = $P3.'iscompileevaluable'()
    if_null $P7, __label_13
    unless $P7 goto __label_13
.annotate 'line', 6265
    $P8 = WSubId_96($P1)
    if_null $P8, __label_14
    unless $P8 goto __label_14
.annotate 'line', 6266
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 6267
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_15
    push_eh $P7
.annotate 'line', 6268
    getattribute $P10, __ARG_1, 'owner'
    getattribute $P11, __ARG_1, 'start'
    $P8 = $P5($P10, $P11, $P1)
    .return($P8)
    pop_eh
    goto __label_16
  __label_15:
.annotate 'line', 6267
    .get_results($P6)
    finalize $P6
    pop_eh
.annotate 'line', 6272
    $S2 = $P6["message"]
    concat $S3, "Compile time evaluation of builtin ", $S1
    concat $S3, $S3, " failed: '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
.annotate 'line', 6271
    WSubId_25($S3, __ARG_2)
  __label_16:
  __label_14: # endif
  __label_13: # endif
.annotate 'line', 6277
    new $P8, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P8.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P7, $P8
    .return($P7)
.annotate 'line', 6278

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6287
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6288
    setattribute self, 'funref', __ARG_4
.annotate 'line', 6289
    $P1 = __ARG_1.'get'()
.annotate 'line', 6290
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6291
    __ARG_1.'unget'($P1)
.annotate 'line', 6292
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 6294

.end # CallExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6297
    new $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6298
    getattribute $P3, self, 'start'
    $P1.'Expr'(__ARG_1, $P3)
.annotate 'line', 6299
    getattribute $P5, self, 'funref'
    $P4 = $P5.'clone'(__ARG_1)
    setattribute $P1, 'funref', $P4
.annotate 'line', 6300
    getattribute $P2, self, 'args'
.annotate 'line', 6301
    if_null $P2, __label_1
.annotate 'line', 6302
    $P4 = $P2.'clone'(__ARG_1)
    setattribute $P1, 'args', $P4
  __label_1: # endif
.annotate 'line', 6303
    .return($P1)
.annotate 'line', 6304

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6305
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6308
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 6309
    getattribute $P2, self, 'args'
.annotate 'line', 6310
    if_null $P2, __label_1
.annotate 'line', 6311
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 6313
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
.annotate 'line', 6314
    $P3 = $P1.'search_nonmember'()
.annotate 'line', 6316
    isnull $I1, $P3
    if $I1 goto __label_5
.annotate 'line', 6318
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_6
.annotate 'line', 6329
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
.annotate 'line', 6332
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6317
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_6: # case
.annotate 'line', 6319
    $P8 = $P3.'ismulti'()
    isfalse $I2, $P8
    unless $I2 goto __label_9
.annotate 'line', 6320
    $P4 = $P3.'makesubid'()
.annotate 'line', 6321
    self.'usesubid'($P4)
.annotate 'line', 6322
    new $P7, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
    $P7.'CallSubid'(self, $P1, $P2, $P4)
    set $P6, $P7
    .return($P6)
    goto __label_10
  __label_9: # else
.annotate 'line', 6325
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 6326
    .return(self)
  __label_10: # endif
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6330
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 6331
    .return(self)
  __label_8: # case
.annotate 'line', 6333
    getattribute $P11, self, 'owner'
    getattribute $P12, $P1, 'start'
    .tailcall WSubId_97($P11, $P12, $P3, $P2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6336
    getattribute $P13, self, 'start'
    WSubId_30("unexpected type found in scope", $P13)
  __label_3: # switch end
  __label_2: # endif
.annotate 'line', 6339
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 6340
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_11: # endif
.annotate 'line', 6341
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
    unless $I1 goto __label_12
.annotate 'line', 6342
    new $P7, [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]
    $P7.'CallInlineExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_12: # endif
.annotate 'line', 6345
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_13
    unless $P6 goto __label_13
.annotate 'line', 6346
    $P7 = $P1.'checkIdentifier'()
    set $S1, $P7
    ne $S1, '', __label_14
.annotate 'line', 6347
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P9 = $P1.'getName'()
    $P8[0] = $P9
    $P5 = self.'scopesearch'($P8, 0)
.annotate 'line', 6348
    isnull $I1, $P5
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
.annotate 'line', 6349
    getattribute $P6, self, 'owner'
    getattribute $P7, $P1, 'start'
    .tailcall WSubId_97($P6, $P7, $P5, $P2)
  __label_15: # endif
  __label_14: # endif
  __label_13: # endif
.annotate 'line', 6353
    setattribute self, 'funref', $P1
.annotate 'line', 6354
    setattribute self, 'args', $P2
.annotate 'line', 6355
    .return(self)
.annotate 'line', 6356

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 6359
    .return(1)
.annotate 'line', 6360

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6363
    getattribute $P1, self, 'funref'
.annotate 'line', 6364
    null $S1
.annotate 'line', 6366
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6367
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 6368
    ne $S1, '', __label_3
.annotate 'line', 6369
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
.annotate 'line', 6371
    isnull $I1, $P2
    if $I1 goto __label_6
.annotate 'line', 6374
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
.annotate 'line', 6377
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 6372
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
    join $S1, "", $P3
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 6375
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 6378
    WSubId_30("Builtin unexpected here", self)
  __label_5: # default
.annotate 'line', 6380
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
.annotate 'line', 6385
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 6386
    .return($S1)
.annotate 'line', 6387

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
.annotate 'line', 6390
    getattribute $P1, self, 'args'
.annotate 'line', 6391
    if_null $P1, __label_1
.annotate 'line', 6392
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6393

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 6396
    __ARG_1.'print'('(')
.annotate 'line', 6397
    getattribute $P1, self, 'args'
.annotate 'line', 6398
    if_null $P1, __label_1
.annotate 'line', 6399
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6400
    __ARG_1.'say'(')')
.annotate 'line', 6401

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6404
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6405
    self.'prepareargs'(__ARG_1)
.annotate 'line', 6407
    self.'annotate'(__ARG_1)
.annotate 'line', 6409
    __ARG_1.'print'('    ')
.annotate 'line', 6410
    ne __ARG_2, '.tailcall', __label_2
.annotate 'line', 6411
    __ARG_1.'print'('.tailcall ')
    goto __label_3
  __label_2: # else
.annotate 'line', 6413
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_3: # endif
.annotate 'line', 6415
    __ARG_1.'print'($S1)
.annotate 'line', 6416
    self.'emitargs'(__ARG_1)
.annotate 'line', 6417

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6420
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6421
    self.'prepareargs'(__ARG_1)
.annotate 'line', 6422
    self.'annotate'(__ARG_1)
.annotate 'line', 6423
    __ARG_1.'print'('    ')
.annotate 'line', 6424
    __ARG_1.'print'($S1)
.annotate 'line', 6425
    self.'emitargs'(__ARG_1)
.annotate 'line', 6426

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6280
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6282
    addattribute $P0, 'funref'
.annotate 'line', 6283
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallSubid' ]

.sub 'CallSubid' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6438
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6439
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6440
    setattribute self, 'args', __ARG_3
.annotate 'line', 6441
    setattribute self, 'subid', __ARG_4
.annotate 'line', 6442

.end # CallSubid


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 6445
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 6446

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
.annotate 'line', 6433
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 6435
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6454
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6455
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6456
    setattribute self, 'args', __ARG_3
.annotate 'line', 6457

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 6460
    getattribute $P1, self, 'funref'
.annotate 'line', 6462
    getattribute $P2, $P1, 'left'
  __label_2: # while
.annotate 'line', 6463
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6464
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6465
    $P6 = $P2.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6466
    $P7 = $P2.'checkIdentifier'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 6467
    isnull $I1, $S1
    if $I1 goto __label_6
    iseq $I1, $S1, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 6471
    new $P3, ['ResizableStringArray']
.annotate 'line', 6472
    $P1.'buildkey'($P3)
.annotate 'line', 6473
    $P6 = $P3.'pop'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 6474
    $P4 = self.'tempreg'('P')
.annotate 'line', 6475
    self.'annotate'(__ARG_1)
.annotate 'line', 6476
    set $P5, $P3
.annotate 'line', 2482
    null $S3
.annotate 'line', 2483
    elements $I1, $P5
    unless $I1 goto __label_9
.annotate 'line', 2484
    join $S5, "'; '", $P5
    concat $S6, "[ '", $S5
    concat $S6, $S6, "' ]"
    set $S3, $S6
  __label_9: # endif
.annotate 'line', 2485
    set $S4, $S3
    goto __label_8
  __label_8:
.annotate 'line', 6476
    __ARG_1.'emitget_hll_global'($P4, $S2, $S4)
.annotate 'line', 6477
    .return($P4)
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 6480
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P1.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
.annotate 'line', 6481
    $P8 = $P1.'get_member'()
.annotate 'line', 6480
    $P6[2] = $P8
    $P6[3] = "'"
    join $S5, "", $P6
    .return($S5)
.annotate 'line', 6482

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 6450
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6492
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6493
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6494
    setattribute self, 'args', __ARG_3
.annotate 'line', 6495

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 6498
    getattribute $P1, self, 'funref'
.annotate 'line', 6499
    getattribute $P2, $P1, 'right'
.annotate 'line', 6500
    $P3 = $P2.'checkresult'()
.annotate 'line', 6501
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6502
    WSubId_25("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 6505
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 6506
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 6507
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
.annotate 'line', 6508

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 6488
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6518
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6519
    setattribute self, 'left', __ARG_3
.annotate 'line', 6520

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
.annotate 'line', 6523
    getattribute $P1, self, 'left'
    .tailcall $P1.'emit_getvar'(__ARG_1)
.annotate 'line', 6524

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 6513
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6515
    addattribute $P0, 'left'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6533
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6534
    setattribute self, 'right', __ARG_4
.annotate 'line', 6535

.end # MemberExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6538
    new $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 6539
    getattribute $P2, self, 'start'
    getattribute $P4, self, 'left'
    $P3 = $P4.'clone'(__ARG_1)
    $P1.'MemberExprBase'(__ARG_1, $P2, $P3)
.annotate 'line', 6540
    getattribute $P3, self, 'right'
    setattribute $P1, 'right', $P3
.annotate 'line', 6541
    .return($P1)
.annotate 'line', 6542

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6543
    .return('P')

.end # checkresult


.sub 'search_nonmember' :method
.annotate 'line', 6549
    null $P1
.annotate 'line', 6550
    null $P2
.annotate 'line', 6551
    getattribute $P3, self, 'left'
  __label_2: # while
.annotate 'line', 6552
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6553
    getattribute $P3, $P3, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6554
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 6555
    $P4 = $P3.'checkIdentifier'()
.annotate 'line', 6556
    isnull $I1, $P4
    if $I1 goto __label_5
    set $S1, $P4
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 6557
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 6558
    self.'buildkey'($P5)
.annotate 'line', 6559
    .tailcall self.'scopesearch'($P5, 0)
  __label_4: # endif
  __label_3: # endif
    null $P6
.annotate 'line', 6562
    .return($P6)
.annotate 'line', 6563

.end # search_nonmember


.sub 'optimize' :method
.annotate 'line', 6566
    getattribute $P4, self, 'left'
    $P3 = $P4.'optimize'()
    setattribute self, 'left', $P3
.annotate 'line', 6568
    $P1 = self.'search_nonmember'()
.annotate 'line', 6570
    isnull $I1, $P1
    if $I1 goto __label_3
.annotate 'line', 6572
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
.annotate 'line', 6576
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6573
    $P2 = $P1.'ismulti'()
    if_null $P2, __label_6
    unless $P2 goto __label_6
.annotate 'line', 6574
    new $P4, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'FunctionRef'($P5, $P6, $P1)
    set $P3, $P4
    .return($P3)
  __label_6: # endif
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 6577
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6579
    .return(self)
.annotate 'line', 6580

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
.annotate 'line', 6583
    getattribute $P1, self, 'left'
.annotate 'line', 6584
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6585
    $P2 = $P1.'getName'()
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 6587
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6588
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
    push __ARG_1, $P2
.annotate 'line', 6589

.end # buildkey


.sub 'get_member' :method
.annotate 'line', 6592
    getattribute $P1, self, 'right'
    .return($P1)
.annotate 'line', 6593

.end # get_member


.sub '__emit_get_left' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 6596
    getattribute $P1, self, 'left'
.annotate 'line', 6597
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    eq $S1, 'P', __label_1
.annotate 'line', 6598
    WSubId_25("non-var at left of '.'", self)
  __label_1: # endif
.annotate 'line', 6599
    .tailcall $P1.'emit_get_nonull'(__ARG_1)
.annotate 'line', 6600

.end # __emit_get_left


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6603
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6604
    self.'annotate'(__ARG_1)
.annotate 'line', 6605
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
.annotate 'line', 6606

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6609
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6610
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6611
    .return($S1)
.annotate 'line', 6612

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6615
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6616
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6617
    self.'annotate'(__ARG_1)
.annotate 'line', 6618
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 6619

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6622
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6623
    null $S2
.annotate 'line', 6624
    ne __ARG_2, 'P', __label_2
.annotate 'line', 6626
    ne __ARG_3, 'null', __label_4
.annotate 'line', 6627
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 6628
    __ARG_1.'emitnull'(__ARG_3)
  __label_4: # endif
.annotate 'line', 6630
    set $S2, __ARG_3
    goto __label_3
  __label_2: # else
.annotate 'line', 6633
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 6634
    __ARG_1.'emitbox'($S2, __ARG_3)
  __label_3: # endif
.annotate 'line', 6636
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6637

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6640
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6641
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6642
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 6643
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
.annotate 'line', 6645
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 6646
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 6647
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 6649
    set $S2, $S3
  __label_7: # endif
  __label_4: # endif
.annotate 'line', 6651
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6652
    .return($S2)
.annotate 'line', 6653

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 6527
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6529
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6664
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6665
    setattribute self, 'right', __ARG_4
.annotate 'line', 6666

.end # MemberRefExpr


.sub 'checkresult' :method
.annotate 'line', 6667
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6670
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 6671
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 6672
    .return(self)
.annotate 'line', 6673

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 6676
    getattribute $P1, self, 'left'
.annotate 'line', 6677
    getattribute $P2, self, 'right'
.annotate 'line', 6678
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 6679
    WSubId_69("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6680
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6681
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6682
    self.'annotate'(__ARG_1)
.annotate 'line', 6683
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
.annotate 'line', 6684

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 6687
    getattribute $P1, self, 'left'
.annotate 'line', 6688
    getattribute $P2, self, 'right'
.annotate 'line', 6689
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 6690
    WSubId_69("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6691
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6692
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6693
    null $S3
.annotate 'line', 6694
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    if_null $S5, __label_4
    length $I1, $S5
    ne $I1, 1, __label_4
    ord $I1, $S5
    if $I1 == 80 goto __label_6
    goto __label_4
  __label_6: # case
.annotate 'line', 6696
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 6698
    ne $S3, 'null', __label_7
.annotate 'line', 6699
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 6700
    __ARG_1.'emitnull'($S3)
  __label_7: # endif
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 6704
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 6705
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6706
    __ARG_1.'emitbox'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 6709
    self.'annotate'(__ARG_1)
.annotate 'line', 6710
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 6711
    .return($S3)
.annotate 'line', 6712

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 6659
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6661
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]

.sub 'StringIndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6723
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6724
    setattribute self, 'left', __ARG_3
.annotate 'line', 6725
    setattribute self, 'arg', __ARG_4
.annotate 'line', 6726

.end # StringIndexExpr


.sub 'checkresult' :method
.annotate 'line', 6729
    .return('S')
.annotate 'line', 6730

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 6733
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6734
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6735
    self.'annotate'(__ARG_1)
.annotate 'line', 6736
    $P1 = WSubId_45("    substr %0, %1, %2, 1", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P1)
.annotate 'line', 6738

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 6717
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6719
    addattribute $P0, 'left'
.annotate 'line', 6720
    addattribute $P0, 'arg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6752
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6753
    setattribute self, 'left', __ARG_4
.annotate 'line', 6754
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
.annotate 'line', 6755

.end # IndexExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6758
    new $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6759
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 6760
    getattribute $P4, self, 'left'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'left', $P3
.annotate 'line', 6761
    getattribute $P4, self, 'args'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'args', $P3
.annotate 'line', 6762
    .return($P1)
.annotate 'line', 6763

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6766
    .return('P')
.annotate 'line', 6767

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_46 = "WSubId_46"
.annotate 'line', 6770
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 6771
    setattribute self, 'left', $P1
.annotate 'line', 6772
    getattribute $P2, self, 'args'
.annotate 'line', 6773
    $P2.'optimizeargs'()
.annotate 'line', 6775
    $P4 = $P1.'checkresult'()
    set $S2, $P4
    ne $S2, 'S', __label_1
.annotate 'line', 6776
    $P5 = $P2.'numargs'()
    set $I2, $P5
    eq $I2, 1, __label_2
.annotate 'line', 6777
    WSubId_25('Bad string index', self)
  __label_2: # endif
.annotate 'line', 6778
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6781
    $P4 = $P1.'isstringliteral'()
    unless $P4 goto __label_4
    $P4 = $P3.'isintegerliteral'()
  __label_4:
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 6782
    $P5 = $P3.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 6783
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_5
    set $S1, $P4
  __label_5:
.annotate 'line', 6784
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
.annotate 'line', 6785
    substr $S2, $S1, $I1, 1
.annotate 'line', 6784
    .tailcall WSubId_46($P4, $P5, $S2)
  __label_3: # endif
.annotate 'line', 6787
    new $P5, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'StringIndexExpr'($P6, $P7, $P1, $P3)
    set $P4, $P5
    .return($P4)
  __label_1: # endif
.annotate 'line', 6790
    .return(self)
.annotate 'line', 6791

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6794
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6795
    getattribute $P4, self, 'start'
    WSubId_30('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6796
    getattribute $P1, self, 'left'
.annotate 'line', 6797
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6798
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 6799
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 6797
    setattribute self, 'regleft', $P3
.annotate 'line', 6800
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
.annotate 'line', 6801

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6804
    getattribute $P1, self, 'regleft'
.annotate 'line', 6805
    getattribute $P2, self, 'argregs'
.annotate 'line', 6806
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6807
    getattribute $P3, self, 'start'
    WSubId_30('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6808
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6809
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6810
    __ARG_1.'print'(']')
.annotate 'line', 6811

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6814
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6815
    self.'annotate'(__ARG_1)
.annotate 'line', 6816
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6817
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6818
    __ARG_1.'say'('')
.annotate 'line', 6819

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 6822
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6823
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6824
    .return($S1)
.annotate 'line', 6825

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6828
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6829
    self.'annotate'(__ARG_1)
.annotate 'line', 6830
    __ARG_1.'print'('    ')
.annotate 'line', 6831
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6832
    __ARG_1.'say'(' = ', __ARG_3)
.annotate 'line', 6833

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6836
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6837
    null $S1
.annotate 'line', 6838
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 6839
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6840
    __ARG_1.'emitnull'($S1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6843
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6844
    self.'annotate'(__ARG_1)
.annotate 'line', 6845
    __ARG_1.'print'('    ')
.annotate 'line', 6846
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6847
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6848
    .return($S1)
.annotate 'line', 6849

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6743
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6745
    addattribute $P0, 'left'
.annotate 'line', 6746
    addattribute $P0, 'regleft'
.annotate 'line', 6747
    addattribute $P0, 'args'
.annotate 'line', 6748
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 6860
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6861
    $P1 = __ARG_1.'get'()
.annotate 'line', 6862
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6863
    __ARG_1.'unget'($P1)
.annotate 'line', 6864
    $P3 = WSubId_66(__ARG_1, __ARG_2, WSubId_67, ']')
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 6866

.end # ArrayExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6869
    new $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6870
    getattribute $P8, self, 'start'
    $P1.'Expr'(__ARG_1, $P8)
.annotate 'line', 6871
    getattribute $P8, self, 'values'
    if_null $P8, __label_1
.annotate 'line', 6872
    getattribute $P2, self, 'values'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P11 = WSubId_5("clone")
    $P6 = WSubId_3($P11, $P3)
.annotate 'line', 71
    if_null $P4, __label_5
    iter $P12, $P4
    set $P12, 0
  __label_4: # for iteration
    unless $P12 goto __label_5
    shift $P7, $P12
.annotate 'line', 72
    $P13 = $P6($P7)
    push $P5, $P13
    goto __label_4
  __label_5: # endfor
.annotate 'line', 73
    set $P10, $P5
    goto __label_3
  __label_3:
    goto __label_2
  __label_2:
.annotate 'line', 132
    set $P8, $P10
.annotate 'line', 6872
    setattribute $P1, 'values', $P8
  __label_1: # endif
.annotate 'line', 6873
    .return($P1)
.annotate 'line', 6874

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6875
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6878
    getattribute $P1, self, 'values'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 6879
    .return(self)
.annotate 'line', 6880

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6883
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6884
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 6885

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6891
    self.'emit_init'(__ARG_1, '')
.annotate 'line', 6892

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6895
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6896
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6897
    .return($S1)
.annotate 'line', 6898

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 6901
    self.'annotate'(__ARG_1)
.annotate 'line', 6902
    getattribute $P1, self, 'values'
.annotate 'line', 6903
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 6904
    eq __ARG_2, '', __label_3
.annotate 'line', 6905
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6906
    le $I1, 0, __label_4
.annotate 'line', 6907
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 6909
    new $P4, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P4.'CollectValues'($P5, __ARG_1)
    set $P2, $P4
.annotate 'line', 6910
    null $I2
.annotate 'line', 6911
    if_null $P1, __label_6
    iter $P6, $P1
    set $P6, 0
  __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P3, $P6
.annotate 'line', 6912
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6913
    eq __ARG_2, '', __label_8
.annotate 'line', 6914
    self.'annotate'(__ARG_1)
.annotate 'line', 6915
    $P4 = WSubId_45("    %0[%1] = %2", __ARG_2, $I2, $S1)
    __ARG_1.'say'($P4)
.annotate 'line', 6916
    inc $I2
  __label_8: # endif
    goto __label_5
  __label_6: # endfor
.annotate 'line', 6919

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6854
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6856
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 6931
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6932
    $P1 = __ARG_1.'get'()
.annotate 'line', 6933
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6934
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6935
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 6936
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6938
    $P4 = WSubId_67(__ARG_1, __ARG_2)
.annotate 'line', 6939
    WSubId_83(':', __ARG_1)
.annotate 'line', 6940
    $P5 = WSubId_67(__ARG_1, __ARG_2)
.annotate 'line', 6941
    push $P2, $P4
.annotate 'line', 6942
    push $P3, $P5
  __label_4: # continue
.annotate 'line', 6944
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6945
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6946
    WSubId_69("',' or '}'", $P1)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 6948
    setattribute self, 'keys', $P2
.annotate 'line', 6949
    setattribute self, 'values', $P3
.annotate 'line', 6950

.end # HashExpr


.sub 'checkresult' :method
.annotate 'line', 6951
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6954
    getattribute $P1, self, 'keys'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P4 = $P1[$I2]
    $P3 = $P4.'optimize'()
    $P1[$I2] = $P3
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 6955
    getattribute $P2, self, 'values'
.annotate 'line', 2195
    if_null $P2, __label_9
    elements $I3, $P2
    goto __label_8
  __label_9:
    null $I3
  __label_8:
.annotate 'line', 2196
    null $I4
  __label_12: # for condition
    ge $I4, $I3, __label_11
.annotate 'line', 2197
    $P4 = $P2[$I4]
    $P3 = $P4.'optimize'()
    $P2[$I4] = $P3
  __label_10: # for iteration
.annotate 'line', 2196
    inc $I4
    goto __label_12
  __label_11: # for end
  __label_7:
.annotate 'line', 6956
    .return(self)
.annotate 'line', 6957

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6960
    self.'annotate'(__ARG_1)
.annotate 'line', 6965
    eq __ARG_2, '', __label_1
.annotate 'line', 6966
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6968
    getattribute $P1, self, 'keys'
.annotate 'line', 6969
    getattribute $P2, self, 'values'
.annotate 'line', 6970
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
.annotate 'line', 6971
    set $I1, $P1
.annotate 'line', 6972
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 6973
    $P4 = $P1[$I2]
.annotate 'line', 6974
    null $S1
.annotate 'line', 6975
    $P5 = $P4.'isidentifier'()
    unless $P5 goto __label_7
    $P6 = $P4.'checkIdentifier'()
    set $S4, $P6
    iseq $I3, $S4, ''
    box $P5, $I3
  __label_7:
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 6976
    $P7 = $P4.'getName'()
    null $S2
    if_null $P7, __label_8
    set $S2, $P7
  __label_8:
.annotate 'line', 6977
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6978
    __ARG_1.'emitget_hll_global'($S1, $S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 6981
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6983
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 6984
    eq __ARG_2, '', __label_10
.annotate 'line', 6985
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_10: # endif
  __label_2: # for iteration
.annotate 'line', 6972
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 6987

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6990
    self.'emit'(__ARG_1, '')
.annotate 'line', 6991

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6994
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6995
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6996
    .return($S1)
.annotate 'line', 6997

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6924
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6926
    addattribute $P0, 'keys'
.annotate 'line', 6927
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 7010
    .return('P')

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
.annotate 'line', 7015
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
.annotate 'line', 7016

.end # parseinitializer


.sub 'numargs' :method
.annotate 'line', 7019
    getattribute $P1, self, 'initializer'
.annotate 'line', 7020
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)
.annotate 'line', 7021

.end # numargs


.sub 'optimize_initializer' :method
.annotate 'line', 7024
    getattribute $P1, self, 'initializer'
.annotate 'line', 7025
    if_null $P1, __label_1
.annotate 'line', 7026
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7027

.end # optimize_initializer


.sub 'optimize' :method
.annotate 'line', 7030
    self.'optimize_initializer'()
.annotate 'line', 7031
    .return(self)
.annotate 'line', 7032

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 7035
    getattribute $P1, self, 'initializer'
.annotate 'line', 7036
    if_null $P1, __label_1
.annotate 'line', 7037
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 7038
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 7039
    if_null $P1, __label_2
.annotate 'line', 7040
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 7041
    __ARG_1.'say'(")")
.annotate 'line', 7042

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 7002
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7004
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'warn_class_unknown' :subid('WSubId_98')
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7049
    concat $S1, "class ", __ARG_2
    concat $S1, $S1, " not found at compile time"
    __ARG_1.'warn'($S1, __ARG_3)
.annotate 'line', 7050

.end # warn_class_unknown

.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7058
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7060
    $P2 = __ARG_4.'isstring'()
    if $P2 goto __label_2
    $P2 = __ARG_4.'isidentifier'()
  __label_2:
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7061
    WSubId_25("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 7062
    setattribute self, 'value', __ARG_4
.annotate 'line', 7063
    $P1 = __ARG_1.'get'()
.annotate 'line', 7065
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7066
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 7068
    __ARG_1.'unget'($P1)
  __label_4: # endif
.annotate 'line', 7069

.end # NewExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7072
    new $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 7073
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7074
    getattribute $P3, self, 'value'
    setattribute $P1, 'value', $P3
.annotate 'line', 7075
    getattribute $P2, self, 'initializer'
    if_null $P2, __label_1
.annotate 'line', 7076
    getattribute $P5, self, 'initializer'
    $P4 = $P5.'clone'(__ARG_1)
    setattribute $P1, 'initializer', $P4
  __label_1: # endif
.annotate 'line', 7077
    .return($P1)
.annotate 'line', 7078

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7081
    getattribute $P1, self, 'value'
.annotate 'line', 7082
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7085
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 7086
    isnull $I1, $P2
    not $I1
    box $P3, $I1
    unless $P3 goto __label_3
    $P3 = $P2.'isconst'()
  __label_3:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7087
    $P1 = $P2.'getvalue'()
.annotate 'line', 7088
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 7089
    WSubId_25('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 7090
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 7093
    self.'optimize_initializer'()
.annotate 'line', 7094
    .return(self)
.annotate 'line', 7095

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7098
    self.'annotate'(__ARG_1)
.annotate 'line', 7100
    getattribute $P1, self, 'initializer'
.annotate 'line', 7101
    getattribute $P2, self, 'value'
.annotate 'line', 7102
    $P8 = self.'numargs'()
    set $I1, $P8
.annotate 'line', 7105
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 7106
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 7108
    set $S1, ''
.annotate 'line', 7109
    set $S2, __ARG_2
.annotate 'line', 7110
    null $S3
    if $I1 == -1 goto __label_7
    if $I1 == 0 goto __label_8
    if $I1 == 1 goto __label_9
    goto __label_5
  __label_7: # case
  __label_8: # case
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 7116
    ne $I2, 1, __label_10
.annotate 'line', 7117
    not $I4, __ARG_3
    unless $I4 goto __label_12
.annotate 'line', 7118
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_12: # endif
    goto __label_11
  __label_10: # else
.annotate 'line', 7121
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 7122
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 7123
    concat $S5, ', ', $S1
    set $S1, $S5
  __label_11: # endif
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 7127
    eq $I2, 1, __label_13
.annotate 'line', 7128
    WSubId_25('Multiple init arguments not allowed here', self)
  __label_13: # endif
.annotate 'line', 7129
    not $I3, __ARG_3
    unless $I3 goto __label_14
.annotate 'line', 7130
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_14: # endif
  __label_6: # switch end
.annotate 'line', 7133
    ne $S2, '', __label_15
.annotate 'line', 7134
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
    if $I2 == 0 goto __label_18
    if $I2 == 1 goto __label_19
    goto __label_16
  __label_18: # case
.annotate 'line', 7139
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
  __label_20:
.annotate 'line', 7140
    get_class $P4, $S4
.annotate 'line', 7141
    unless_null $P4, __label_21
.annotate 'line', 7142
    WSubId_98(__ARG_1, $S4, $P2)
  __label_21: # endif
.annotate 'line', 7146
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 7147
    le $I1, 1, __label_22
.annotate 'line', 7148
    __ARG_1.'say'($S2, ".'", $P2, "'()")
  __label_22: # endif
    goto __label_17 # break
  __label_19: # case
.annotate 'line', 7152
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 7153
    unless_null $P5, __label_23
.annotate 'line', 7154
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 7155
    if_null $P6, __label_25
.annotate 'line', 7156
    $P7 = $P6.'getpath'()
.annotate 'line', 7157
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
    goto __label_26
  __label_25: # else
.annotate 'line', 7160
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 7161
    if_null $P5, __label_27
.annotate 'line', 7162
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_28
  __label_27: # else
.annotate 'line', 7164
    $P9 = $P2.'getidentifier'()
    WSubId_98(__ARG_1, $P9, $P2)
.annotate 'line', 7165
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
  __label_28: # endif
  __label_26: # endif
.annotate 'line', 7168
    set $S3, $P2
    goto __label_24
  __label_23: # else
.annotate 'line', 7172
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
  __label_24: # endif
    goto __label_17 # break
  __label_16: # default
.annotate 'line', 7176
    WSubId_30('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 7178
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isge $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
  __label_31:
  __label_30:
    unless $I3 goto __label_29
.annotate 'line', 7179
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 7180
    not $I3, __ARG_3
    unless $I3 goto __label_32
.annotate 'line', 7181
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_32: # endif
  __label_29: # endif
.annotate 'line', 7183

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 7052
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7054
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7194
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7195
    setattribute self, 'owner', __ARG_2
.annotate 'line', 7196
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
.annotate 'line', 7197
    setattribute self, 'nskey', $P1
.annotate 'line', 7198
    $P2 = __ARG_1.'get'()
.annotate 'line', 7199
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7200
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 7202
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 7203

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7206
    null $S1
.annotate 'line', 7207
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
.annotate 'line', 7212
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 7213
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 7216
    WSubId_25('Multiple init arguments not allowed here', self)
  __label_2: # switch end
.annotate 'line', 7218
    getattribute $P2, self, 'nskey'
.annotate 'line', 7220
    __ARG_1.'print'('    ')
.annotate 'line', 7221
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 7222
    __ARG_1.'print'("root_")
  __label_6: # endif
.annotate 'line', 7223
    __ARG_1.'print'("new ", __ARG_2, ", ")
    null $P3
.annotate 'line', 7224
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 7225
    if_null $S1, __label_7
.annotate 'line', 7226
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
.annotate 'line', 7227
    __ARG_1.'say'()
.annotate 'line', 7228

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 7188
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7190
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7239
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7240
    setattribute self, 'owner', __ARG_2
.annotate 'line', 7241
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
.annotate 'line', 7242
    setattribute self, 'nskey', $P1
.annotate 'line', 7243
    $P2 = __ARG_1.'get'()
.annotate 'line', 7244
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7245
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 7247
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 7248

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7251
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 7252
    set $S1, __ARG_2
.annotate 'line', 7253
    le $I1, 0, __label_1
.annotate 'line', 7254
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 7255
    getattribute $P1, self, 'nskey'
.annotate 'line', 7257
    ne $S1, '', __label_2
.annotate 'line', 7258
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7260
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 7262
    lt $I1, 0, __label_3
.annotate 'line', 7263
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 7264
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 7265
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 7267

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 7233
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7235
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7274
    $P1 = __ARG_1.'get'()
.annotate 'line', 7277
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7281
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7284
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 7279
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 7280
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 7279
    .return($P3)
  __label_4: # case
.annotate 'line', 7283
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 7287
    $P2 = __ARG_1.'get'()
.annotate 'line', 7288
    __ARG_1.'unget'($P2)
.annotate 'line', 7289
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 7291
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_6: # endif
  __label_2: # default
.annotate 'line', 7296
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
.annotate 'line', 7298

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_91 = "WSubId_91"
.annotate 'line', 7309
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 7310
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 7311
    $P2 = WSubId_91(__ARG_4, self)
    setattribute self, 'checked', $P2
.annotate 'line', 7312

.end # OpInstanceOfExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7315
    new $P1, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 7316
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7317
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'lexpr', $P3
.annotate 'line', 7318
    getattribute $P4, self, 'checked'
    $P3 = $P4.'clone'(self)
    setattribute $P1, 'checked', $P3
.annotate 'line', 7319
    .return($P1)
.annotate 'line', 7320

.end # clone


.sub 'optimize' :method
.annotate 'line', 7323
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 7324
    .return(self)
.annotate 'line', 7325

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7326
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7329
    getattribute $P1, self, 'lexpr'
.annotate 'line', 7330
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7331
    eq $S1, 'P', __label_2
.annotate 'line', 7332
    WSubId_25('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 7333
    getattribute $P2, self, 'checked'
.annotate 'line', 7335
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 7336
    self.'annotate'(__ARG_1)
.annotate 'line', 7337
    __ARG_1.'print'('    isa ', __ARG_2, ', ', $S2, ', ')
.annotate 'line', 7338
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 7339
    __ARG_1.'say'()
.annotate 'line', 7340

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 7302
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7304
    addattribute $P0, 'lexpr'
.annotate 'line', 7305
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 7353
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 7354
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 7355
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 7356
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 7357
    .return(self)
.annotate 'line', 7358

.end # OpConditionalExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7361
    new $P1, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 7362
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7363
    new $P4, [ 'Winxed'; 'Compiler'; 'Condition' ]
    getattribute $P7, self, 'condition'
    getattribute $P6, $P7, 'condexpr'
    $P5 = $P6.'clone'(__ARG_1)
    $P3 = $P4.'set'($P5)
    setattribute $P1, 'condition', $P3
.annotate 'line', 7364
    getattribute $P4, self, 'etrue'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'etrue', $P3
.annotate 'line', 7365
    getattribute $P4, self, 'efalse'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'efalse', $P3
.annotate 'line', 7366
    .return($P1)
.annotate 'line', 7367

.end # clone


.sub 'optimize' :method
.annotate 'line', 7370
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7371
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 7373
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 7375
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_1: # default
.annotate 'line', 7377
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 7378
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 7379
    .return(self)
  __label_2: # switch end
.annotate 'line', 7381

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7384
    getattribute $P1, self, 'etrue'
.annotate 'line', 7385
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7386
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 7388
    .tailcall $P1.'checkresult'()
  __label_2: # endif
.annotate 'line', 7389

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7392
    getattribute $P1, self, 'owner'
.annotate 'line', 7393
    $P5 = $P1.'genlabel'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7394
    $P5 = $P1.'genlabel'()
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
  __label_2:
.annotate 'line', 7395
    getattribute $P5, self, 'condition'
    $P5.'emit_else'(__ARG_1, $S2)
.annotate 'line', 7396
    getattribute $P2, self, 'etrue'
.annotate 'line', 7397
    $P5 = self.'checkresult'()
    null $S3
    if_null $P5, __label_3
    set $S3, $P5
  __label_3:
.annotate 'line', 7398
    $P5 = $P2.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7399
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 7401
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 7402
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7403
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7404
    getattribute $P3, self, 'efalse'
.annotate 'line', 7405
    $P5 = $P3.'isnull'()
    if_null $P5, __label_6
    unless $P5 goto __label_6
.annotate 'line', 7406
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
.annotate 'line', 7408
    $P6 = $P3.'checkresult'()
    null $S4
    if_null $P6, __label_8
    set $S4, $P6
  __label_8:
.annotate 'line', 7409
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7410
    $P5 = $P3.'emit_get'(__ARG_1)
    null $S5
    if_null $P5, __label_12
    set $S5, $P5
  __label_12:
.annotate 'line', 7411
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 7415
    ne $S4, 'P', __label_13
.annotate 'line', 7416
    $P4 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 7417
    __ARG_1.'emitset'(__ARG_2, $P4)
    goto __label_14
  __label_13: # else
.annotate 'line', 7420
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
  __label_10: # endif
  __label_7: # endif
.annotate 'line', 7423
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 7424

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 7427
    getattribute $P1, self, 'owner'
.annotate 'line', 7428
    $P2 = $P1.'genlabel'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7429
    $P2 = $P1.'genlabel'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7430
    getattribute $P2, self, 'condition'
    $P2.'emit_else'(__ARG_1, $S2)
.annotate 'line', 7431
    getattribute $P2, self, 'etrue'
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 7432
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7433
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7434
    getattribute $P2, self, 'efalse'
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 7435
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 7436

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 7345
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7347
    addattribute $P0, 'condition'
.annotate 'line', 7348
    addattribute $P0, 'etrue'
.annotate 'line', 7349
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getOpCode_2' :subid('WSubId_101')
        .param pmc __ARG_1
.annotate 'line', 7482
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
.annotate 'line', 7483
    .return(1)
  __label_4: # case
.annotate 'line', 7484
    .return(2)
  __label_5: # case
.annotate 'line', 7485
    .return(3)
  __label_1: # default
.annotate 'line', 7486
    .return(0)
  __label_2: # switch end
.annotate 'line', 7488

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_103')
        .param pmc __ARG_1
.annotate 'line', 7492
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '-' goto __label_3
    if $S1 == '!' goto __label_4
    if $S1 == '~' goto __label_5
    if $S1 == '++' goto __label_6
    if $S1 == '--' goto __label_7
    goto __label_1
  __label_3: # case
.annotate 'line', 7493
    .return(8)
  __label_4: # case
.annotate 'line', 7494
    .return(11)
  __label_5: # case
.annotate 'line', 7495
    .return(34)
  __label_6: # case
.annotate 'line', 7496
    .return(9)
  __label_7: # case
.annotate 'line', 7497
    .return(10)
  __label_1: # default
.annotate 'line', 7499
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(32)
    goto __label_9
  __label_8: # else
.annotate 'line', 7500
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(33)
    goto __label_11
  __label_10: # else
.annotate 'line', 7501
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_2: # switch end
.annotate 'line', 7503

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_106')
        .param pmc __ARG_1
.annotate 'line', 7507
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '*' goto __label_3
    if $S1 == '/' goto __label_4
    if $S1 == '%' goto __label_5
    if $S1 == '%%' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7508
    .return(19)
  __label_4: # case
.annotate 'line', 7509
    .return(20)
  __label_5: # case
.annotate 'line', 7510
    .return(21)
  __label_6: # case
.annotate 'line', 7511
    .return(22)
  __label_1: # default
.annotate 'line', 7512
    .return(0)
  __label_2: # switch end
.annotate 'line', 7514

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_109')
        .param pmc __ARG_1
.annotate 'line', 7518
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<<' goto __label_3
    if $S1 == '>>' goto __label_4
    if $S1 == '>>>' goto __label_5
    goto __label_1
  __label_3: # case
.annotate 'line', 7519
    .return(28)
  __label_4: # case
.annotate 'line', 7520
    .return(29)
  __label_5: # case
.annotate 'line', 7521
    .return(30)
  __label_1: # default
.annotate 'line', 7522
    .return(0)
  __label_2: # switch end
.annotate 'line', 7524

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_111')
        .param pmc __ARG_1
.annotate 'line', 7528
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<' goto __label_3
    if $S1 == '>' goto __label_4
    if $S1 == '<=' goto __label_5
    if $S1 == '>=' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7529
    .return(14)
  __label_4: # case
.annotate 'line', 7530
    .return(16)
  __label_5: # case
.annotate 'line', 7531
    .return(15)
  __label_6: # case
.annotate 'line', 7532
    .return(17)
  __label_1: # default
.annotate 'line', 7534
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 7535
    .return(0)
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 7537

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_113')
        .param pmc __ARG_1
.annotate 'line', 7541
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '==' goto __label_3
    if $S1 == '!=' goto __label_4
    if $S1 == '===' goto __label_5
    if $S1 == '!==' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7542
    .return(12)
  __label_4: # case
.annotate 'line', 7543
    .return(13)
  __label_5: # case
.annotate 'line', 7544
    .return(25)
  __label_6: # case
.annotate 'line', 7545
    .return(26)
  __label_1: # default
.annotate 'line', 7546
    .return(0)
  __label_2: # switch end
.annotate 'line', 7548

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_122')
        .param pmc __ARG_1
.annotate 'line', 7552
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
.annotate 'line', 7553
    .return(4)
  __label_4: # case
.annotate 'line', 7554
    .return(5)
  __label_5: # case
.annotate 'line', 7555
    .return(6)
  __label_6: # case
.annotate 'line', 7556
    .return(18)
  __label_7: # case
.annotate 'line', 7557
    .return(23)
  __label_8: # case
.annotate 'line', 7558
    .return(24)
  __label_9: # case
.annotate 'line', 7559
    .return(31)
  __label_1: # default
.annotate 'line', 7560
    .return(0)
  __label_2: # switch end
.annotate 'line', 7562

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 7566
    $P1 = __ARG_1.'get'()
.annotate 'line', 7567
    null $P2
.annotate 'line', 7570
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7574
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7576
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 7578
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 7580
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 7582
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 7584
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 7586
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 7588
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 7590
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 7592
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 7571
    $P2 = WSubId_67(__ARG_1, __ARG_2)
.annotate 'line', 7572
    WSubId_83(')', __ARG_1)
.annotate 'line', 7573
    .return($P2)
  __label_4: # case
.annotate 'line', 7575
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 7577
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 7579
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 7581
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_44(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 7583
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 7585
    .tailcall WSubId_99(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 7587
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 7589
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 7591
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 7593
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 7595
    WSubId_69('expression', $P1)
  __label_1: # switch end
.annotate 'line', 7597

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7601
    $P1 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7602
    null $P2
.annotate 'line', 7603
    null $P3
.annotate 'line', 7604
    null $I1
  __label_2: # while
.annotate 'line', 7605
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_101($P2)
    set $I1, $P5
    unless $I1 goto __label_1
    if $I1 == 1 goto __label_5
    if $I1 == 2 goto __label_6
    if $I1 == 3 goto __label_7
    goto __label_3
  __label_5: # case
.annotate 'line', 7608
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7611
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7614
    set $P3, $P2
.annotate 'line', 7615
    $P2 = __ARG_1.'get'()
.annotate 'line', 7616
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 7617
    $P4 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7618
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
    goto __label_9
  __label_8: # else
.annotate 'line', 7621
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7624
    WSubId_30('Unexpected code in parseExpr_2')
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7627
    __ARG_1.'unget'($P2)
.annotate 'line', 7628
    .return($P1)
.annotate 'line', 7629

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_102 = "WSubId_102"
.annotate 'line', 7633
    $P1 = WSubId_102(__ARG_1, __ARG_2)
.annotate 'line', 7634
    $P2 = __ARG_1.'get'()
.annotate 'line', 7636
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 7638
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7637
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 7639
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 7641
    __ARG_1.'unget'($P2)
.annotate 'line', 7642
    .return($P1)
  __label_1: # switch end
.annotate 'line', 7644

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_105 = "WSubId_105"
.annotate 'line', 7648
    $P1 = __ARG_1.'get'()
.annotate 'line', 7649
    $P3 = WSubId_103($P1)
    set $I1, $P3
.annotate 'line', 7650
    unless $I1 goto __label_1
.annotate 'line', 7651
    $P2 = WSubId_104(__ARG_1, __ARG_2)
    if $I1 == 8 goto __label_5
    if $I1 == 11 goto __label_6
    if $I1 == 34 goto __label_7
    if $I1 == 9 goto __label_8
    if $I1 == 10 goto __label_9
    if $I1 == 32 goto __label_10
    if $I1 == 33 goto __label_11
    goto __label_3
  __label_5: # case
.annotate 'line', 7654
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 7656
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 7658
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 7660
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 7662
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 7664
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 7666
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_3: # default
.annotate 'line', 7668
    WSubId_30('Invalid code in parseExpr_4', $P1)
  __label_4: # switch end
    goto __label_2
  __label_1: # else
.annotate 'line', 7672
    __ARG_1.'unget'($P1)
.annotate 'line', 7673
    .tailcall WSubId_105(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 7675

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7679
    $P1 = WSubId_104(__ARG_1, __ARG_2)
.annotate 'line', 7680
    null $P2
.annotate 'line', 7681
    null $I1
  __label_2: # while
.annotate 'line', 7682
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_106($P2)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7683
    $P3 = WSubId_104(__ARG_1, __ARG_2)
    if $I1 == 19 goto __label_5
    if $I1 == 20 goto __label_6
    if $I1 == 21 goto __label_7
    if $I1 == 22 goto __label_8
    goto __label_3
  __label_5: # case
.annotate 'line', 7686
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7689
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7692
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7695
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7698
    WSubId_30('Invalid code in parseExpr_5', $P2)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7701
    __ARG_1.'unget'($P2)
.annotate 'line', 7702
    .return($P1)
.annotate 'line', 7703

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_107 = "WSubId_107"
.annotate 'line', 7707
    $P1 = WSubId_107(__ARG_1, __ARG_2)
.annotate 'line', 7708
    null $P2
  __label_2: # while
.annotate 'line', 7709
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('+')
    if $P5 goto __label_3
    $P5 = $P2.'isop'('-')
  __label_3:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7710
    $P3 = WSubId_107(__ARG_1, __ARG_2)
.annotate 'line', 7711
    null $P4
.annotate 'line', 7712
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7713
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 7715
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 7716
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7718
    __ARG_1.'unget'($P2)
.annotate 'line', 7719
    .return($P1)
.annotate 'line', 7720

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7724
    $P1 = WSubId_108(__ARG_1, __ARG_2)
.annotate 'line', 7725
    null $P2
.annotate 'line', 7726
    null $P3
.annotate 'line', 7727
    null $I1
  __label_2: # while
.annotate 'line', 7728
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_109($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 28 goto __label_5
    if $I1 == 29 goto __label_6
    if $I1 == 30 goto __label_7
    goto __label_3
  __label_5: # case
.annotate 'line', 7731
    $P2 = WSubId_108(__ARG_1, __ARG_2)
.annotate 'line', 7732
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7735
    $P2 = WSubId_108(__ARG_1, __ARG_2)
.annotate 'line', 7736
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7739
    $P2 = WSubId_108(__ARG_1, __ARG_2)
.annotate 'line', 7740
    new $P7, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
    $P7.'OpShiftlrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7743
    WSubId_30('Invalid code in parseExpr_7', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7746
    __ARG_1.'unget'($P3)
.annotate 'line', 7747
    .return($P1)
.annotate 'line', 7748

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7752
    $P1 = WSubId_110(__ARG_1, __ARG_2)
.annotate 'line', 7753
    null $P2
.annotate 'line', 7754
    null $P3
.annotate 'line', 7755
    null $I1
  __label_2: # while
.annotate 'line', 7756
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_111($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 14 goto __label_5
    if $I1 == 16 goto __label_6
    if $I1 == 15 goto __label_7
    if $I1 == 17 goto __label_8
    if $I1 == 27 goto __label_9
    goto __label_3
  __label_5: # case
.annotate 'line', 7759
    $P2 = WSubId_110(__ARG_1, __ARG_2)
.annotate 'line', 7760
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7763
    $P2 = WSubId_110(__ARG_1, __ARG_2)
.annotate 'line', 7764
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7767
    $P2 = WSubId_110(__ARG_1, __ARG_2)
.annotate 'line', 7768
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7771
    $P2 = WSubId_110(__ARG_1, __ARG_2)
.annotate 'line', 7772
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 7775
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7778
    WSubId_30('Invalid code in parseExpr_9', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7781
    __ARG_1.'unget'($P3)
.annotate 'line', 7782
    .return($P1)
.annotate 'line', 7783

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7787
    $P1 = WSubId_112(__ARG_1, __ARG_2)
.annotate 'line', 7788
    null $P2
.annotate 'line', 7789
    null $P3
.annotate 'line', 7790
    null $I1
  __label_2: # while
.annotate 'line', 7791
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_113($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 12 goto __label_5
    if $I1 == 13 goto __label_6
    if $I1 == 25 goto __label_7
    if $I1 == 26 goto __label_8
    goto __label_3
  __label_5: # case
.annotate 'line', 7794
    $P2 = WSubId_112(__ARG_1, __ARG_2)
.annotate 'line', 7795
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7798
    $P2 = WSubId_112(__ARG_1, __ARG_2)
.annotate 'line', 7799
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7802
    $P2 = WSubId_112(__ARG_1, __ARG_2)
.annotate 'line', 7803
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7806
    $P2 = WSubId_112(__ARG_1, __ARG_2)
.annotate 'line', 7807
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7810
    WSubId_30('Invalid code in parseExpr_8', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7813
    __ARG_1.'unget'($P3)
.annotate 'line', 7814
    .return($P1)
.annotate 'line', 7815

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_115')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_114 = "WSubId_114"
.annotate 'line', 7819
    $P1 = WSubId_114(__ARG_1, __ARG_2)
.annotate 'line', 7820
    null $P2
  __label_2: # while
.annotate 'line', 7821
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7822
    $P3 = WSubId_114(__ARG_1, __ARG_2)
.annotate 'line', 7823
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7825
    __ARG_1.'unget'($P2)
.annotate 'line', 7826
    .return($P1)
.annotate 'line', 7827

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_115 = "WSubId_115"
.annotate 'line', 7831
    $P1 = WSubId_115(__ARG_1, __ARG_2)
.annotate 'line', 7832
    null $P2
  __label_2: # while
.annotate 'line', 7833
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7834
    $P3 = WSubId_115(__ARG_1, __ARG_2)
.annotate 'line', 7835
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7837
    __ARG_1.'unget'($P2)
.annotate 'line', 7838
    .return($P1)
.annotate 'line', 7839

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_116 = "WSubId_116"
.annotate 'line', 7843
    $P1 = WSubId_116(__ARG_1, __ARG_2)
.annotate 'line', 7844
    null $P2
  __label_2: # while
.annotate 'line', 7845
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7846
    $P3 = WSubId_116(__ARG_1, __ARG_2)
.annotate 'line', 7847
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7849
    __ARG_1.'unget'($P2)
.annotate 'line', 7850
    .return($P1)
.annotate 'line', 7851

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_118')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_117 = "WSubId_117"
.annotate 'line', 7855
    $P1 = WSubId_117(__ARG_1, __ARG_2)
.annotate 'line', 7856
    null $P2
  __label_2: # while
.annotate 'line', 7857
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7858
    $P3 = WSubId_117(__ARG_1, __ARG_2)
.annotate 'line', 7859
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7861
    __ARG_1.'unget'($P2)
.annotate 'line', 7862
    .return($P1)
.annotate 'line', 7863

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_117 = "WSubId_117"
.annotate 'line', 7867
    $P1 = WSubId_118(__ARG_1, __ARG_2)
.annotate 'line', 7868
    null $P2
  __label_2: # while
.annotate 'line', 7869
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7870
    $P3 = WSubId_117(__ARG_1, __ARG_2)
.annotate 'line', 7871
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7873
    __ARG_1.'unget'($P2)
.annotate 'line', 7874
    .return($P1)
.annotate 'line', 7875

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_121')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_119 = "WSubId_119"
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 7879
    $P1 = WSubId_119(__ARG_1, __ARG_2)
.annotate 'line', 7880
    $P2 = __ARG_1.'get'()
.annotate 'line', 7881
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7882
    $P3 = WSubId_120(__ARG_1, __ARG_2)
.annotate 'line', 7883
    WSubId_83(':', __ARG_1)
.annotate 'line', 7884
    $P4 = WSubId_120(__ARG_1, __ARG_2)
.annotate 'line', 7885
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 7888
    __ARG_1.'unget'($P2)
.annotate 'line', 7889
    .return($P1)
  __label_2: # endif
.annotate 'line', 7891

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_120')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_122 = "WSubId_122"
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7895
    $P1 = WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7896
    null $P2
.annotate 'line', 7897
    null $I1
  __label_2: # while
.annotate 'line', 7898
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_122($P2)
    set $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 7899
    $P3 = WSubId_120(__ARG_1, __ARG_2)
.annotate 'line', 7900
    null $P4
    if $I1 == 4 goto __label_5
    if $I1 == 5 goto __label_6
    if $I1 == 6 goto __label_7
    if $I1 == 18 goto __label_8
    if $I1 == 23 goto __label_9
    if $I1 == 24 goto __label_10
    if $I1 == 31 goto __label_11
    goto __label_3
  __label_5: # case
.annotate 'line', 7903
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7906
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7909
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7912
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 7915
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_4 # break
  __label_10: # case
.annotate 'line', 7918
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_4 # break
  __label_11: # case
.annotate 'line', 7921
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7924
    WSubId_30('Unexpected code in parseExpr_16', $P2)
  __label_4: # switch end
.annotate 'line', 7926
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7927
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7929
    __ARG_1.'unget'($P2)
.annotate 'line', 7930
    .return($P1)
.annotate 'line', 7931

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_120 = "WSubId_120"
.annotate 'line', 7935
    .tailcall WSubId_120(__ARG_1, __ARG_2)
.annotate 'line', 7936

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7951
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7952
    WSubId_30('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7953
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7954
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7955
    .return($S1)
.annotate 'line', 7956

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7959
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7960
    unless_null $P1, __label_1
.annotate 'line', 7961
    WSubId_30('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7962
    .return($P1)
.annotate 'line', 7963

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7947
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7972
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7973
    WSubId_30('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7974
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7975
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7976
    .return($S1)
.annotate 'line', 7977

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7980
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7981
    unless_null $P1, __label_1
.annotate 'line', 7982
    WSubId_30('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7983
    .return($P1)
.annotate 'line', 7984

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7966
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7968
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8000
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8001
    $P1 = __ARG_2.'get'()
.annotate 'line', 8002
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8003
    __ARG_2.'unget'($P1)
.annotate 'line', 8004
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 8006

.end # parse


.sub 'optimize' :method
.annotate 'line', 8009
    getattribute $P1, self, 'values'
.annotate 'line', 8010
    if_null $P1, __label_1
.annotate 'line', 8011
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 8012
    .return(self)
.annotate 'line', 8013

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8017
    getattribute $P1, self, 'values'
.annotate 'line', 8018
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 8021
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
.annotate 'line', 8022
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 8023
    $P3 = $P2.'cantailcall'()
    unless $P3 goto __label_6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'allowtailcall'()
  __label_6:
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 8024
    self.'annotate'(__ARG_1)
.annotate 'line', 8025
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 8029
    le $I1, 0, __label_7
.annotate 'line', 8030
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 8032
    self.'annotate'(__ARG_1)
.annotate 'line', 8033
    self.'emitret'(__ARG_1)
.annotate 'line', 8034
    le $I1, 0, __label_8
.annotate 'line', 8035
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 8036
    __ARG_1.'say'(')')
.annotate 'line', 8037

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7994
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7996
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8044
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8045

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 8048
    __ARG_1.'print'('    ', '.return(')
.annotate 'line', 8049

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 8040
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8056
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8057

.end # YieldStatement


.sub 'clone' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 8060
    WSubId_25("inlined yield not allowed", self)
.annotate 'line', 8061

.end # clone


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 8064
    __ARG_1.'print'('    ', '.yield(')
.annotate 'line', 8065

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 8052
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]

.sub 'InlineReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 8073
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8074
    $P1 = __ARG_2.'get'()
.annotate 'line', 8075
    __ARG_2.'unget'($P1)
.annotate 'line', 8076
    $P2 = $P1.'isop'(";")
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8077
    $P4 = WSubId_67(__ARG_2, __ARG_3)
    setattribute self, 'expr', $P4
  __label_1: # endif
.annotate 'line', 8078

.end # InlineReturnStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8081
    new $P1, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
.annotate 'line', 8082
    getattribute $P3, self, 'start'
    $P1.'Statement'($P3, __ARG_1)
.annotate 'line', 8083
    getattribute $P2, self, 'expr'
.annotate 'line', 8084
    if_null $P2, __label_1
.annotate 'line', 8085
    $P4 = $P2.'clone'(__ARG_1)
    setattribute $P1, 'expr', $P4
  __label_1: # endif
.annotate 'line', 8086
    .return($P1)
.annotate 'line', 8087

.end # clone


.sub 'optimize' :method
.annotate 'line', 8090
    getattribute $P1, self, 'expr'
.annotate 'line', 8091
    if_null $P1, __label_1
.annotate 'line', 8092
    $P3 = $P1.'optimize'()
    setattribute self, 'expr', $P3
  __label_1: # endif
.annotate 'line', 8093
    .return(self)
.annotate 'line', 8094

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8097
    getattribute $P4, self, 'owner'
    $P1 = $P4.'getouter'()
.annotate 'line', 8098
    getattribute $P2, self, 'expr'
.annotate 'line', 8099
    $P4 = $P1.'getrettype'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8100
    self.'annotate'(__ARG_1)
.annotate 'line', 8101
    if_null $P2, __label_2
.annotate 'line', 8102
    $P3 = $P1.'getretreg'()
.annotate 'line', 8103
    unless_null $P3, __label_3
.annotate 'line', 8104
    $P2.'emit_void'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 8106
    $P4 = $P2.'isnull'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 8107
    __ARG_1.'emitnull'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 8109
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_7
    set $S2, $P5
  __label_7:
.annotate 'line', 8110
    ne $S2, $S1, __label_8
.annotate 'line', 8111
    $P2.'emit'(__ARG_1, $P3)
    goto __label_9
  __label_8: # else
.annotate 'line', 8113
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P4, __label_10
    set $S3, $P4
  __label_10:
.annotate 'line', 8114
    self.'annotate'(__ARG_1)
.annotate 'line', 8115
    ne $S1, 'P', __label_11
.annotate 'line', 8116
    __ARG_1.'emitbox'($P3, $S3)
    goto __label_12
  __label_11: # else
.annotate 'line', 8118
    __ARG_1.'emitset'($P3, $S3)
  __label_12: # endif
  __label_9: # endif
  __label_6: # endif
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 8123
    $P4 = $P1.'getendlabel'()
    null $S4
    if_null $P4, __label_13
    set $S4, $P4
  __label_13:
.annotate 'line', 8124
    self.'annotate'(__ARG_1)
.annotate 'line', 8125
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8126

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
.annotate 'line', 8068
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8070
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseReturn' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8131
    $P1 = __ARG_3.'getouter'()
.annotate 'line', 8132
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    unless $I1 goto __label_1
.annotate 'line', 8133
    new $P3, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
    $P3.'InlineReturnStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8135
    new $P5, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P5.'ReturnStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 8136

.end # parseReturn

.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8148
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8149
    setattribute self, 'name', __ARG_1
.annotate 'line', 8150
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
.annotate 'line', 8151

.end # LabelStatement


.sub 'optimize' :method
.annotate 'line', 8152
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8155
    self.'annotate'(__ARG_1)
.annotate 'line', 8156
    getattribute $P1, self, 'value'
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
.annotate 'line', 8157

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 8142
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8144
    addattribute $P0, 'name'
.annotate 'line', 8145
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 8171
    setattribute self, 'owner', __ARG_1
.annotate 'line', 8172
    box $P1, __ARG_2
    setattribute self, 'label', $P1
.annotate 'line', 8173

.end # Reflabel


.sub 'optimize' :method
.annotate 'line', 8174
    .return(self)

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 8177
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8178
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8179
    .return($S2)
.annotate 'line', 8180

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 8166
    addattribute $P0, 'owner'
.annotate 'line', 8167
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_123 = "WSubId_123"
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 8193
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8194
    $P1 = __ARG_2.'get'()
.annotate 'line', 8195
    WSubId_123($P1)
.annotate 'line', 8196
    setattribute self, 'label', $P1
.annotate 'line', 8197
    WSubId_83(';', __ARG_2)
.annotate 'line', 8198

.end # GotoStatement


.sub 'optimize' :method
.annotate 'line', 8199
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8202
    self.'annotate'(__ARG_1)
.annotate 'line', 8203
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8204
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8205
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
.annotate 'line', 8206

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 8187
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8189
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 8217
    $P1 = WSubId_67(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 8218

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 8221
    WSubId_83('(', __ARG_1)
.annotate 'line', 8222
    $P1 = WSubId_67(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 8223
    WSubId_83(')', __ARG_1)
.annotate 'line', 8224

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 8213
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
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 8237
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8238
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8239
    $P3 = WSubId_124(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 8240
    $P1 = __ARG_2.'get'()
.annotate 'line', 8241
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8242
    $P4 = WSubId_124(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8244
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 8245
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8247

.end # IfStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8250
    new $P1, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 8251
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8252
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8253
    getattribute $P4, self, 'truebranch'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'truebranch', $P3
.annotate 'line', 8254
    getattribute $P4, self, 'falsebranch'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'falsebranch', $P3
.annotate 'line', 8255
    .return($P1)
.annotate 'line', 8256

.end # clone


.sub 'optimize' :method
.annotate 'line', 8259
    self.'optimize_condition'()
.annotate 'line', 8260
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 8261
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 8262
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 8264
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 8266
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_1: # default
  __label_2: # switch end
.annotate 'line', 8268
    .return(self)
.annotate 'line', 8269

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8272
    getattribute $P1, self, 'truebranch'
.annotate 'line', 8273
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 8274
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 8275
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 8276
    set $S1, ''
.annotate 'line', 8277
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 8278
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8279
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8280
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 8281
    self.'annotate'(__ARG_1)
.annotate 'line', 8282
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 8283
    $P1.'emit'(__ARG_1)
.annotate 'line', 8285
    not $I3, $I2
    unless $I3 goto __label_5
.annotate 'line', 8286
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8287
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 8288
    $P2.'emit'(__ARG_1)
  __label_5: # endif
.annotate 'line', 8290
    __ARG_1.'emitlabel'($S2, 'endif')
.annotate 'line', 8291

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 8231
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 8233
    addattribute $P0, 'truebranch'
.annotate 'line', 8234
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 8303
    $P2 = WSubId_124(__ARG_1, self)
    setattribute self, 'body', $P2
.annotate 'line', 8304

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
.annotate 'line', 8307
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8308
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8310
    self.'annotate'(__ARG_1)
.annotate 'line', 8311
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 8312
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8313
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8314
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
.annotate 'line', 8315

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 8298
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 8300
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8326
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8327
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8328
    self.'parsebody'(__ARG_2)
.annotate 'line', 8329

.end # WhileStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8332
    new $P1, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 8333
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8334
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8335
    getattribute $P4, self, 'body'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'body', $P3
.annotate 'line', 8336
    .return($P1)
.annotate 'line', 8337

.end # clone


.sub 'optimize' :method
.annotate 'line', 8340
    self.'optimize_condition'()
.annotate 'line', 8341
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8342
    .return(self)
.annotate 'line', 8343

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8346
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 8348
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 8351
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 8352
    __ARG_1.'comment'('while(false) optimized out')
  __label_5: # endif
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 8355
    $P3 = self.'genbreaklabel'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8356
    $P4 = self.'gencontinuelabel'()
    null $S2
    if_null $P4, __label_7
    set $S2, $P4
  __label_7:
.annotate 'line', 8358
    self.'annotate'(__ARG_1)
.annotate 'line', 8359
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 8360
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 8361
    getattribute $P5, self, 'body'
    $P5.'emit'(__ARG_1)
.annotate 'line', 8362
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8363
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_2: # switch end
.annotate 'line', 8365

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 8322
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
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 8376
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8377
    self.'parsebody'(__ARG_2)
.annotate 'line', 8378
    WSubId_125('while', __ARG_2)
.annotate 'line', 8379
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8380

.end # DoStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8383
    new $P1, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 8384
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8385
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8386
    getattribute $P4, self, 'body'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'body', $P3
.annotate 'line', 8387
    .return($P1)
.annotate 'line', 8388

.end # clone


.sub 'optimize' :method
.annotate 'line', 8391
    self.'optimize_condition'()
.annotate 'line', 8392
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 8393
    $P2 = $P1.'isempty'()
    unless $P2 goto __label_2
    $P3 = self.'getvalue'()
    set $I2, $P3
    iseq $I1, $I2, 2
    box $P2, $I1
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8394
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8395
    setattribute self, 'body', $P1
.annotate 'line', 8396
    .return(self)
.annotate 'line', 8397

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8400
    getattribute $P1, self, 'body'
.annotate 'line', 8401
    $P2 = self.'getvalue'()
    set $I1, $P2
    if $I1 == 1 goto __label_3
    goto __label_1
  __label_3: # case
.annotate 'line', 8404
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 8407
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 8408
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 8409
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 8411
    self.'annotate'(__ARG_1)
.annotate 'line', 8412
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 8414
    $P1.'emit'(__ARG_1)
.annotate 'line', 8415
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 8416
    eq $I1, 2, __label_7
.annotate 'line', 8417
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 8418
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_2: # switch end
.annotate 'line', 8420

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 8372
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
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 8431
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8432
    WSubId_83(';', __ARG_2)
.annotate 'line', 8433

.end # ContinueStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8436
    new $P1, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 8437
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8438
    .return($P1)
.annotate 'line', 8439

.end # clone


.sub 'optimize' :method
.annotate 'line', 8440
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8443
    self.'annotate'(__ARG_1)
.annotate 'line', 8444
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8445
    __ARG_1.'emitgoto'($S1, 'continue')
.annotate 'line', 8446

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 8427
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 8457
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8458
    WSubId_83(';', __ARG_2)
.annotate 'line', 8459

.end # BreakStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8462
    new $P1, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 8463
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8464
    .return($P1)
.annotate 'line', 8465

.end # clone


.sub 'optimize' :method
.annotate 'line', 8466
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8469
    self.'annotate'(__ARG_1)
.annotate 'line', 8470
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8471
    __ARG_1.'emitgoto'($S1, 'break')
.annotate 'line', 8472

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 8453
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8487
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8488
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 8489
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 8490
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
.annotate 'line', 8491

.end # SwitchBaseStatement


.sub 'cloneswitchto' :subid('WSubId_11') :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8492
.lex '__WLEX_1', __ARG_2
.const 'Sub' WSubId_12 = "WSubId_12"
.annotate 'line', 8494
    getattribute $P17, self, 'start'
    __ARG_1.'Statement'($P17, __ARG_2)
.annotate 'line', 8495
    getattribute $P1, self, 'case_value'
    set $P2, __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P3, $P1
    root_new $P4, ['parrot';'ResizablePMCArray']
    $P19 = WSubId_5("clone")
    $P5 = WSubId_3($P19, $P2)
.annotate 'line', 71
    if_null $P3, __label_4
    iter $P20, $P3
    set $P20, 0
  __label_3: # for iteration
    unless $P20 goto __label_4
    shift $P6, $P20
.annotate 'line', 72
    $P21 = $P5($P6)
    push $P4, $P21
    goto __label_3
  __label_4: # endfor
.annotate 'line', 73
    set $P18, $P4
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
.annotate 'line', 132
    set $P17, $P18
.annotate 'line', 8495
    setattribute __ARG_1, 'case_value', $P17
.annotate 'line', 8496
    getattribute $P7, self, 'case_st'
    root_new $P8, ['parrot';'ResizablePMCArray']
.annotate 'line', 8497
    newclosure $P9, WSubId_12
.annotate 'line', 71
    if_null $P7, __label_7
    iter $P23, $P7
    set $P23, 0
  __label_6: # for iteration
    unless $P23 goto __label_7
    shift $P10, $P23
.annotate 'line', 72
    $P19 = $P9($P10)
    push $P8, $P19
    goto __label_6
  __label_7: # endfor
.annotate 'line', 73
    set $P22, $P8
    goto __label_5
  __label_5:
    set $P17, $P22
.annotate 'line', 8496
    setattribute __ARG_1, 'case_st', $P17
.annotate 'line', 8498
    getattribute $P11, self, 'default_st'
    set $P12, __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P13, $P11
    root_new $P14, ['parrot';'ResizablePMCArray']
    $P19 = WSubId_5("clone")
    $P15 = WSubId_3($P19, $P12)
.annotate 'line', 71
    if_null $P13, __label_11
    iter $P25, $P13
    set $P25, 0
  __label_10: # for iteration
    unless $P25 goto __label_11
    shift $P16, $P25
.annotate 'line', 72
    $P21 = $P15($P16)
    push $P14, $P21
    goto __label_10
  __label_11: # endfor
.annotate 'line', 73
    set $P24, $P14
    goto __label_9
  __label_9:
    goto __label_8
  __label_8:
.annotate 'line', 132
    set $P17, $P24
.annotate 'line', 8498
    setattribute __ARG_1, 'default_st', $P17
.annotate 'line', 8499
    .return(__ARG_1)
.annotate 'line', 8500

.end # cloneswitchto


.sub '' :anon :subid('WSubId_12') :outer('WSubId_11')
        .param pmc __ARG_3
.annotate 'line', 8497
    find_lex $P1, '__WLEX_1'
    set $P2, __ARG_3
    set $P3, $P1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P9 = WSubId_5("clone")
    $P6 = WSubId_3($P9, $P3)
.annotate 'line', 71
    if_null $P4, __label_4
    iter $P10, $P4
    set $P10, 0
  __label_3: # for iteration
    unless $P10 goto __label_4
    shift $P7, $P10
.annotate 'line', 72
    $P11 = $P6($P7)
    push $P5, $P11
    goto __label_3
  __label_4: # endfor
.annotate 'line', 73
    set $P8, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
.annotate 'line', 132
    set $P9, $P8
.annotate 'line', 8497
    .return($P9)

.end # WSubId_12


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 8503
    null $P1
  __label_2: # while
.annotate 'line', 8504
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'iskeyword'('case')
    if $P3 goto __label_3
    $P3 = $P1.'iskeyword'('default')
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 8505
    $P4 = $P1.'iskeyword'('case')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8506
    getattribute $P5, self, 'case_value'
    $P6 = WSubId_67(__ARG_1, self)
    push $P5, $P6
.annotate 'line', 8507
    $P1 = __ARG_1.'get'()
.annotate 'line', 8508
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 8509
    WSubId_69("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 8510
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 8511
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
.annotate 'line', 8512
    __ARG_1.'unget'($P1)
.annotate 'line', 8513
    $P3 = WSubId_124(__ARG_1, self)
    push $P2, $P3
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 8515
    getattribute $P3, self, 'case_st'
    push $P3, $P2
.annotate 'line', 8516
    __ARG_1.'unget'($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8519
    $P1 = __ARG_1.'get'()
.annotate 'line', 8520
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 8521
    WSubId_69("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 8522
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
.annotate 'line', 8523
    __ARG_1.'unget'($P1)
.annotate 'line', 8524
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_124(__ARG_1, self)
    push $P3, $P4
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 8526
    __ARG_1.'unget'($P1)
  __label_5: # endif
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8529
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 8530
    WSubId_69("'}' in switch", $P1)
  __label_16: # endif
.annotate 'line', 8531

.end # parse_cases


.sub 'optimize_cases' :method
.annotate 'line', 8534
    getattribute $P2, self, 'case_value'
.annotate 'line', 2195
    if_null $P2, __label_3
    elements $I1, $P2
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P6 = $P2[$I2]
    $P5 = $P6.'optimize'()
    $P2[$I2] = $P5
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 8536
    getattribute $P5, self, 'case_st'
    if_null $P5, __label_8
    iter $P7, $P5
    set $P7, 0
  __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P1, $P7
.annotate 'line', 8537
    set $P3, $P1
.annotate 'line', 2195
    if_null $P3, __label_11
    elements $I3, $P3
    goto __label_10
  __label_11:
    null $I3
  __label_10:
.annotate 'line', 2196
    null $I4
  __label_14: # for condition
    ge $I4, $I3, __label_13
.annotate 'line', 2197
    $P6 = $P3[$I4]
    $P5 = $P6.'optimize'()
    $P3[$I4] = $P5
  __label_12: # for iteration
.annotate 'line', 2196
    inc $I4
    goto __label_14
  __label_13: # for end
  __label_9:
    goto __label_7
  __label_8: # endfor
.annotate 'line', 8538
    getattribute $P4, self, 'default_st'
.annotate 'line', 2195
    if_null $P4, __label_17
    elements $I5, $P4
    goto __label_16
  __label_17:
    null $I5
  __label_16:
.annotate 'line', 2196
    null $I6
  __label_20: # for condition
    ge $I6, $I5, __label_19
.annotate 'line', 2197
    $P6 = $P4[$I6]
    $P5 = $P6.'optimize'()
    $P4[$I6] = $P5
  __label_18: # for iteration
.annotate 'line', 2196
    inc $I6
    goto __label_20
  __label_19: # for end
  __label_15:
.annotate 'line', 8539

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 8479
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 8481
    addattribute $P0, 'case_value'
.annotate 'line', 8482
    addattribute $P0, 'case_st'
.annotate 'line', 8483
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 8552
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8553
    $P3 = WSubId_67(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 8554
    $P1 = __ARG_2.'get'()
.annotate 'line', 8555
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8556
    WSubId_69("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 8557
    $P1 = __ARG_2.'get'()
.annotate 'line', 8558
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 8559
    WSubId_69("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 8560
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8561

.end # SwitchStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8564
    new $P2, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P1 = self.'cloneswitchto'($P2, __ARG_1)
.annotate 'line', 8565
    getattribute $P4, self, 'condition'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condition', $P3
.annotate 'line', 8566
    .return($P1)
.annotate 'line', 8567

.end # clone


.sub 'optimize' :method
.annotate 'line', 8570
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 8571
    self.'optimize_cases'()
.annotate 'line', 8572
    .return(self)
.annotate 'line', 8573

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 8579
    set $S1, ''
.annotate 'line', 8580
    getattribute $P19, self, 'case_value'
    if_null $P19, __label_2
    iter $P20, $P19
    set $P20, 0
  __label_1: # for iteration
    unless $P20 goto __label_2
    shift $P1, $P20
.annotate 'line', 8581
    $P21 = $P1.'checkresult'()
    null $S2
    if_null $P21, __label_3
    set $S2, $P21
  __label_3:
.annotate 'line', 8582
    ne $S2, 'N', __label_4
.annotate 'line', 8583
    WSubId_25("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 8584
    ne $S2, 'S', __label_5
.annotate 'line', 8585
    iseq $I4, $S1, ''
    if $I4 goto __label_7
    iseq $I4, $S1, 'char'
  __label_7:
    unless $I4 goto __label_6
.annotate 'line', 8587
    $P19 = $P1.'isstringliteral'()
    unless $P19 goto __label_10
    $P21 = WSubId_47($P1)
    set $S11, $P21
    length $I6, $S11
    iseq $I5, $I6, 1
    box $P19, $I5
  __label_10:
    if_null $P19, __label_8
    unless $P19 goto __label_8
.annotate 'line', 8588
    set $S2, 'char'
    goto __label_9
  __label_8: # else
.annotate 'line', 8590
    set $S1, 'S'
  __label_9: # endif
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 8593
    ne $S1, '', __label_11
.annotate 'line', 8594
    set $S1, $S2
    goto __label_12
  __label_11: # else
.annotate 'line', 8595
    eq $S1, $S2, __label_13
.annotate 'line', 8596
    set $S1, 'P'
  __label_13: # endif
  __label_12: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8599
    getattribute $P2, self, 'condition'
.annotate 'line', 8600
    $P3 = $P2.'checkresult'()
.annotate 'line', 8604
    ne $S1, '', __label_14
.annotate 'line', 8605
    set $S1, $P3
  __label_14: # endif
.annotate 'line', 8607
    $P19 = __ARG_1.'getDebug'()
    if_null $P19, __label_15
    unless $P19 goto __label_15
.annotate 'line', 8608
    __ARG_1.'comment'('switch')
  __label_15: # endif
.annotate 'line', 8609
    $P19 = self.'genlabel'()
    null $S3
    if_null $P19, __label_16
    set $S3, $P19
  __label_16:
.annotate 'line', 8610
    null $S4
.annotate 'line', 8611
    ne $S1, 'char', __label_17
.annotate 'line', 8612
    isa $I4, $P2, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    unless $I4 goto __label_21
.annotate 'line', 8613
    getattribute $P21, $P2, 'builtin'
    $P19 = $P21.'name'()
    set $S11, $P19
    iseq $I4, $S11, "chr"
  __label_21:
    unless $I4 goto __label_19
.annotate 'line', 8614
    getattribute $P4, $P2, 'args'
.annotate 'line', 8615
    $P19 = $P4[0]
    getattribute $P5, $P19, 'arg'
.annotate 'line', 8616
    $P19 = $P5.'emit_getint'(__ARG_1)
    set $S4, $P19
    goto __label_20
  __label_19: # else
.annotate 'line', 8619
    null $S5
.annotate 'line', 8620
    set $S11, $P3
    eq $S11, 'S', __label_22
.annotate 'line', 8621
    $P19 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P19, __label_24
    set $S6, $P19
  __label_24:
.annotate 'line', 8622
    $P19 = self.'tempreg'('S')
    set $S5, $P19
.annotate 'line', 8623
    __ARG_1.'emitset'($S5, $S6)
    goto __label_23
  __label_22: # else
.annotate 'line', 8626
    $P19 = $P2.'emit_get'(__ARG_1)
    set $S5, $P19
  __label_23: # endif
.annotate 'line', 8627
    __ARG_1.'emitif_null'($S5, $S3)
.annotate 'line', 8628
    $P19 = self.'tempreg'('I')
    set $S4, $P19
.annotate 'line', 8629
    __ARG_1.'emitarg2'('length', $S4, $S5)
.annotate 'line', 8630
    __ARG_1.'emitarg3'('ne', $S4, "1", $S3)
.annotate 'line', 8631
    __ARG_1.'emitarg2'('ord', $S4, $S5)
  __label_20: # endif
    goto __label_18
  __label_17: # else
.annotate 'line', 8634
    set $S11, $P3
    ne $S11, $S1, __label_25
.annotate 'line', 8635
    $P19 = $P2.'emit_get'(__ARG_1)
    set $S4, $P19
    goto __label_26
  __label_25: # else
.annotate 'line', 8637
    $P21 = self.'tempreg'($S1)
    set $S4, $P21
.annotate 'line', 8638
    $P19 = $P2.'emit_get'(__ARG_1)
    null $S7
    if_null $P19, __label_27
    set $S7, $P19
  __label_27:
.annotate 'line', 8639
    __ARG_1.'emitset'($S4, $S7)
  __label_26: # endif
  __label_18: # endif
.annotate 'line', 8643
    self.'genbreaklabel'()
.annotate 'line', 8644
    new $P6, ['ResizableStringArray']
.annotate 'line', 8645
    null $S8
.annotate 'line', 8646
    eq $S1, 'char', __label_28
.annotate 'line', 8647
    self.'tempreg'($S1)
  __label_28: # endif
.annotate 'line', 8648
    getattribute $P19, self, 'case_value'
    if_null $P19, __label_30
    iter $P22, $P19
    set $P22, 0
  __label_29: # for iteration
    unless $P22 goto __label_30
    shift $P7, $P22
.annotate 'line', 8649
    $P21 = self.'genlabel'()
    null $S9
    if_null $P21, __label_31
    set $S9, $P21
  __label_31:
.annotate 'line', 8650
    push $P6, $S9
.annotate 'line', 8651
    null $S10
.annotate 'line', 8652
    ne $S1, 'I', __label_32
.annotate 'line', 8653
    $P19 = $P7.'emit_getint'(__ARG_1)
    set $S10, $P19
    goto __label_33
  __label_32: # else
.annotate 'line', 8654
    ne $S1, 'char', __label_34
.annotate 'line', 8655
    $P21 = WSubId_47($P7)
    set $S11, $P21
    ord $I1, $S11
.annotate 'line', 8656
    set $S10, $I1
    goto __label_35
  __label_34: # else
.annotate 'line', 8658
    $P19 = $P7.'checkresult'()
    set $S11, $P19
    ne $S1, $S11, __label_36
.annotate 'line', 8659
    $P21 = $P7.'emit_get'(__ARG_1)
    set $S10, $P21
    goto __label_37
  __label_36: # else
.annotate 'line', 8661
    $P7.'emit'(__ARG_1, $S8)
.annotate 'line', 8662
    set $S10, $S8
  __label_37: # endif
  __label_35: # endif
  __label_33: # endif
.annotate 'line', 8664
    $P19 = WSubId_45("    if %0 == %1 goto %2", $S4, $S10, $S9)
    __ARG_1.'say'($P19)
    goto __label_29
  __label_30: # endfor
.annotate 'line', 8666
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8669
    self.'annotate'(__ARG_1)
.annotate 'line', 8670
    getattribute $P8, self, 'case_st'
.annotate 'line', 8671
    set $I2, $P8
.annotate 'line', 8672
    null $I3
  __label_40: # for condition
    ge $I3, $I2, __label_39
.annotate 'line', 8673
    $P19 = $P6[$I3]
    __ARG_1.'emitlabel'($P19, 'case')
.annotate 'line', 8674
    set $P9, __ARG_1
    $P10 = $P8[$I3]
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2202
    set $P11, $P10
    $P19 = WSubId_5("emit")
    $P12 = WSubId_3($P19, $P9)
.annotate 'line', 65
    if_null $P11, __label_44
    iter $P23, $P11
    set $P23, 0
  __label_43: # for iteration
    unless $P23 goto __label_44
    shift $P13, $P23
.annotate 'line', 66
    $P12($P13)
    goto __label_43
  __label_44: # endfor
  __label_42:
  __label_41:
  __label_38: # for iteration
.annotate 'line', 8672
    inc $I3
    goto __label_40
  __label_39: # for end
.annotate 'line', 8677
    __ARG_1.'emitlabel'($S3, 'default')
.annotate 'line', 8678
    set $P14, __ARG_1
    getattribute $P15, self, 'default_st'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2202
    set $P16, $P15
    $P19 = WSubId_5("emit")
    $P17 = WSubId_3($P19, $P14)
.annotate 'line', 65
    if_null $P16, __label_48
    iter $P24, $P16
    set $P24, 0
  __label_47: # for iteration
    unless $P24 goto __label_48
    shift $P18, $P24
.annotate 'line', 66
    $P17($P18)
    goto __label_47
  __label_48: # endfor
  __label_46:
  __label_45:
.annotate 'line', 8680
    getattribute $P21, self, 'start'
    $P19 = self.'getbreaklabel'($P21)
    __ARG_1.'emitlabel'($P19, 'switch end')
.annotate 'line', 8681

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 8546
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8548
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8693
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8694
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8695

.end # SwitchCaseStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8698
    new $P1, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    .tailcall self.'cloneswitchto'($P1, __ARG_1)
.annotate 'line', 8699

.end # clone


.sub 'optimize' :method
.annotate 'line', 8702
    self.'optimize_cases'()
.annotate 'line', 8703
    .return(self)
.annotate 'line', 8704

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8708
    self.'genbreaklabel'()
.annotate 'line', 8709
    $P14 = self.'genlabel'()
    null $S1
    if_null $P14, __label_1
    set $S1, $P14
  __label_1:
.annotate 'line', 8710
    new $P1, ['ResizableStringArray']
.annotate 'line', 8712
    $P14 = __ARG_1.'getDebug'()
    if_null $P14, __label_2
    unless $P14 goto __label_2
.annotate 'line', 8713
    __ARG_1.'comment'('switch-case')
  __label_2: # endif
.annotate 'line', 8714
    $P14 = self.'tempreg'('I')
    null $S2
    if_null $P14, __label_3
    set $S2, $P14
  __label_3:
.annotate 'line', 8715
    getattribute $P14, self, 'case_value'
    if_null $P14, __label_5
    iter $P15, $P14
    set $P15, 0
  __label_4: # for iteration
    unless $P15 goto __label_5
    shift $P2, $P15
.annotate 'line', 8716
    $P16 = self.'genlabel'()
    null $S3
    if_null $P16, __label_6
    set $S3, $P16
  __label_6:
.annotate 'line', 8717
    push $P1, $S3
.annotate 'line', 8718
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 8719
    __ARG_1.'emitif'($S2, $S3)
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8721
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 8724
    self.'annotate'(__ARG_1)
.annotate 'line', 8725
    getattribute $P3, self, 'case_st'
.annotate 'line', 8726
    set $I1, $P3
.annotate 'line', 8727
    null $I2
  __label_9: # for condition
    ge $I2, $I1, __label_8
.annotate 'line', 8728
    $P14 = $P1[$I2]
    __ARG_1.'emitlabel'($P14, 'case')
.annotate 'line', 8729
    set $P4, __ARG_1
    $P5 = $P3[$I2]
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2202
    set $P6, $P5
    $P14 = WSubId_5("emit")
    $P7 = WSubId_3($P14, $P4)
.annotate 'line', 65
    if_null $P6, __label_13
    iter $P17, $P6
    set $P17, 0
  __label_12: # for iteration
    unless $P17 goto __label_13
    shift $P8, $P17
.annotate 'line', 66
    $P7($P8)
    goto __label_12
  __label_13: # endfor
  __label_11:
  __label_10:
  __label_7: # for iteration
.annotate 'line', 8727
    inc $I2
    goto __label_9
  __label_8: # for end
.annotate 'line', 8732
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 8733
    set $P9, __ARG_1
    getattribute $P10, self, 'default_st'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2202
    set $P11, $P10
    $P14 = WSubId_5("emit")
    $P12 = WSubId_3($P14, $P9)
.annotate 'line', 65
    if_null $P11, __label_17
    iter $P18, $P11
    set $P18, 0
  __label_16: # for iteration
    unless $P18 goto __label_17
    shift $P13, $P18
.annotate 'line', 66
    $P12($P13)
    goto __label_16
  __label_17: # endfor
  __label_15:
  __label_14:
.annotate 'line', 8735
    getattribute $P16, self, 'start'
    $P14 = self.'getbreaklabel'($P16)
    __ARG_1.'emitlabel'($P14, 'switch end')
.annotate 'line', 8736

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 8688
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 8743
    $P1 = __ARG_2.'get'()
.annotate 'line', 8744
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8745
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8746
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8747
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8748
    WSubId_69("'(' in switch", $P1)
.annotate 'line', 8749

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 8762
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8763
    $P1 = __ARG_2.'get'()
.annotate 'line', 8764
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8765
    __ARG_2.'unget'($P1)
.annotate 'line', 8766
    $P4 = WSubId_124(__ARG_2, self)
    setattribute self, 'initializer', $P4
  __label_1: # endif
.annotate 'line', 8768
    $P1 = __ARG_2.'get'()
.annotate 'line', 8769
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 8770
    __ARG_2.'unget'($P1)
.annotate 'line', 8771
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 8772
    WSubId_83(';', __ARG_2)
  __label_2: # endif
.annotate 'line', 8774
    $P1 = __ARG_2.'get'()
.annotate 'line', 8775
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 8776
    __ARG_2.'unget'($P1)
.annotate 'line', 8777
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_4: # do
.annotate 'line', 8779
    $P3 = WSubId_67(__ARG_2, self)
    push $P2, $P3
  __label_6: # continue
.annotate 'line', 8780
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_5
    if $P3 goto __label_4
  __label_5: # enddo
.annotate 'line', 8781
    setattribute self, 'iteration', $P2
.annotate 'line', 8782
    WSubId_28(')', $P1)
  __label_3: # endif
.annotate 'line', 8784
    self.'parsebody'(__ARG_2)
.annotate 'line', 8785

.end # ForStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8788
    new $P1, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8789
    getattribute $P8, self, 'start'
    $P1.'BlockStatement'($P8, __ARG_1)
.annotate 'line', 8790
    getattribute $P8, self, 'initializer'
    if_null $P8, __label_1
.annotate 'line', 8791
    getattribute $P11, self, 'initializer'
    $P10 = $P11.'clone'($P1)
    setattribute $P1, 'initializer', $P10
  __label_1: # endif
.annotate 'line', 8792
    getattribute $P8, self, 'condexpr'
    if_null $P8, __label_2
.annotate 'line', 8793
    getattribute $P11, self, 'condexpr'
    $P10 = $P11.'clone'($P1)
    setattribute $P1, 'condexpr', $P10
  __label_2: # endif
.annotate 'line', 8794
    getattribute $P8, self, 'iteration'
    if_null $P8, __label_3
.annotate 'line', 8795
    getattribute $P2, self, 'iteration'
    set $P3, $P1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P6 = WSubId_3($P10, $P3)
.annotate 'line', 71
    if_null $P4, __label_7
    iter $P13, $P4
    set $P13, 0
  __label_6: # for iteration
    unless $P13 goto __label_7
    shift $P7, $P13
.annotate 'line', 72
    $P11 = $P6($P7)
    push $P5, $P11
    goto __label_6
  __label_7: # endfor
.annotate 'line', 73
    set $P12, $P5
    goto __label_5
  __label_5:
    goto __label_4
  __label_4:
.annotate 'line', 132
    set $P8, $P12
.annotate 'line', 8795
    setattribute $P1, 'iteration', $P8
  __label_3: # endif
.annotate 'line', 8796
    getattribute $P10, self, 'body'
    $P9 = $P10.'clone'($P1)
    setattribute $P1, 'body', $P9
.annotate 'line', 8797
    .return($P1)
.annotate 'line', 8798

.end # clone


.sub 'optimize' :method
.annotate 'line', 8801
    getattribute $P1, self, 'initializer'
.annotate 'line', 8802
    if_null $P1, __label_1
.annotate 'line', 8803
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 8804
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_2
.annotate 'line', 8805
    self.'optimize_condition'()
.annotate 'line', 8806
    $P3 = self.'getvalue'()
    set $I3, $P3
    ne $I3, 2, __label_3
.annotate 'line', 8807
    if_null $P1, __label_4
.annotate 'line', 8808
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8810
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_5: # endif
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 8813
    getattribute $P2, self, 'iteration'
.annotate 'line', 2195
    if_null $P2, __label_8
    elements $I1, $P2
    goto __label_7
  __label_8:
    null $I1
  __label_7:
.annotate 'line', 2196
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
.annotate 'line', 2197
    $P4 = $P2[$I2]
    $P3 = $P4.'optimize'()
    $P2[$I2] = $P3
  __label_9: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_6:
.annotate 'line', 8814
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8815
    .return(self)
.annotate 'line', 8816

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8819
    getattribute $P1, self, 'iteration'
.annotate 'line', 8820
    isnull $I1, $P1
    not $I1
.annotate 'line', 8821
    getattribute $P3, self, 'initializer'
    isnull $I2, $P3
    unless $I2 goto __label_3
.annotate 'line', 8822
    getattribute $P4, self, 'condexpr'
    isnull $I2, $P4
  __label_3:
    unless $I2 goto __label_2
.annotate 'line', 8823
    not $I2, $I1
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 8824
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 8825
    .return()
  __label_1: # endif
.annotate 'line', 8827
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 8828
    __ARG_1.'comment'('for loop')
  __label_4: # endif
.annotate 'line', 8829
    $P3 = self.'gencontinuelabel'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 8830
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 8831
    unless $I1 goto __label_8
.annotate 'line', 8832
    $P3 = self.'genlabel'()
    set $S3, $P3
    goto __label_7
  __label_8:
.annotate 'line', 8833
    set $S3, $S1
  __label_7:
.annotate 'line', 8834
    getattribute $P3, self, 'initializer'
    if_null $P3, __label_9
.annotate 'line', 8835
    getattribute $P4, self, 'initializer'
    $P4.'emit'(__ARG_1)
  __label_9: # endif
.annotate 'line', 8837
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 8838
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_10
.annotate 'line', 8839
    self.'emit_else'(__ARG_1, $S2)
  __label_10: # endif
.annotate 'line', 8841
    getattribute $P3, self, 'body'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8842
    unless $I1 goto __label_11
.annotate 'line', 8843
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 8844
    if_null $P1, __label_13
    iter $P5, $P1
    set $P5, 0
  __label_12: # for iteration
    unless $P5 goto __label_13
    shift $P2, $P5
.annotate 'line', 8845
    $P2.'emit_void'(__ARG_1)
    goto __label_12
  __label_13: # endfor
  __label_11: # endif
.annotate 'line', 8847
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8849
    __ARG_1.'emitlabel'($S2, 'for end')
.annotate 'line', 8850

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8755
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 8757
    addattribute $P0, 'initializer'
.annotate 'line', 8758
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_126 = "WSubId_126"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 8865
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8866
    eq __ARG_5, '', __label_1
.annotate 'line', 8867
    $P1 = WSubId_126(__ARG_5)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 8868
    self.'createvar'(__ARG_4, $S1)
.annotate 'line', 8869
    box $P1, $S1
    setattribute self, 'deftype', $P1
  __label_1: # endif
.annotate 'line', 8871
    setattribute self, 'varname', __ARG_4
.annotate 'line', 8872
    $P2 = WSubId_67(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 8873
    WSubId_83(')', __ARG_2)
.annotate 'line', 8874
    self.'parsebody'(__ARG_2)
.annotate 'line', 8875

.end # ForeachStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8878
    new $P1, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8879
    getattribute $P4, self, 'start'
    $P1.'BlockStatement'($P4, __ARG_1)
.annotate 'line', 8880
    getattribute $P2, self, 'deftype'
.annotate 'line', 8881
    getattribute $P3, self, 'varname'
.annotate 'line', 8882
    if_null $P2, __label_1
.annotate 'line', 8883
    $P1.'createvar'($P3, $P2)
  __label_1: # endif
.annotate 'line', 8884
    setattribute $P1, 'deftype', $P2
.annotate 'line', 8885
    setattribute $P1, 'varname', $P3
.annotate 'line', 8886
    getattribute $P6, self, 'container'
    $P5 = $P6.'clone'($P1)
    setattribute $P1, 'container', $P5
.annotate 'line', 8887
    getattribute $P6, self, 'body'
    $P5 = $P6.'clone'($P1)
    setattribute $P1, 'body', $P5
.annotate 'line', 8888
    .return($P1)
.annotate 'line', 8889

.end # clone


.sub 'optimize' :method
.annotate 'line', 8892
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 8896
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
.annotate 'line', 8897
    $P2 = $P1.'isstringliteral'()
    unless $P2 goto __label_3
.annotate 'line', 8898
    $P3 = $P1.'get_value'()
    set $S1, $P3
    length $I2, $S1
    iseq $I1, $I2, 0
    box $P2, $I1
  __label_3:
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8899
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8901
    setattribute self, 'container', $P1
.annotate 'line', 8902
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8903
    .return(self)
.annotate 'line', 8904

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_90 = "WSubId_90"
.annotate 'line', 8907
    self.'annotate'(__ARG_1)
.annotate 'line', 8908
    null $S1
.annotate 'line', 8909
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
.annotate 'line', 8910
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8911
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 8912
    __ARG_1.'emitbox'($S1, $S2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8915
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 8917
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 8918
    unless_null $P1, __label_4
.annotate 'line', 8919
    getattribute $P2, self, 'varname'
    WSubId_90($P2, self)
  __label_4: # endif
.annotate 'line', 8921
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 8922
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 8923
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 8924
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 8925
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 8926
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 8927
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 8928
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 8929
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 8930
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 8931
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8932
    __ARG_1.'emitlabel'($S5, 'endfor')
.annotate 'line', 8933

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8857
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8859
    addattribute $P0, 'deftype'
.annotate 'line', 8860
    addattribute $P0, 'varname'
.annotate 'line', 8861
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 8940
    WSubId_83('(', __ARG_2)
.annotate 'line', 8941
    $P1 = __ARG_2.'get'()
.annotate 'line', 8942
    $P2 = __ARG_2.'get'()
.annotate 'line', 8943
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 8944
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 8946
    $P3 = __ARG_2.'get'()
.annotate 'line', 8947
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8948
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 8949
    __ARG_2.'unget'($P3)
.annotate 'line', 8950
    __ARG_2.'unget'($P2)
.annotate 'line', 8951
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8953
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 8954

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 8966
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8967
    $P2 = WSubId_67(__ARG_2, self)
    setattribute self, 'excep', $P2
.annotate 'line', 8968

.end # ThrowStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8971
    new $P1, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 8972
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8973
    getattribute $P4, self, 'excep'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'excep', $P3
.annotate 'line', 8974
    .return($P1)
.annotate 'line', 8975

.end # clone


.sub 'optimize' :method
.annotate 'line', 8978
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 8979
    .return(self)
.annotate 'line', 8980

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 8983
    getattribute $P1, self, 'excep'
.annotate 'line', 8984
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8985
    self.'annotate'(__ARG_1)
.annotate 'line', 8986
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
.annotate 'line', 8992
    set $S2, $S1
.annotate 'line', 8993
    $P3 = self.'tempreg'('P')
    set $S1, $P3
.annotate 'line', 8994
    $P4 = WSubId_45("    root_new %0, ['parrot';'Exception']\n    %0['message'] = %1\n", $S1, $S2)
    __ARG_1.'print'($P4)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 9002
    WSubId_25("Invalid throw argument", self)
  __label_3: # switch end
.annotate 'line', 9004
    __ARG_1.'emitarg1'('throw', $S1)
.annotate 'line', 9005

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 8960
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8962
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9017
    setattribute self, 'start', __ARG_1
.annotate 'line', 9018
    self.'ModifierList'(__ARG_2, __ARG_3)
.annotate 'line', 9019

.end # TryModifierList


.sub 'allowtailcall' :method
.annotate 'line', 9022
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 9023

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9026
    $P1 = self.'getlist'()
.annotate 'line', 9027
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
.annotate 'line', 9028
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 9029
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
.annotate 'line', 9033
    eq $I1, 1, __label_11
.annotate 'line', 9034
    WSubId_25('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 9035
    $P3 = $P2.'getarg'(0)
.annotate 'line', 9037
    $P8 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 9036
    $P7 = WSubId_45("    %0.'%1'(%2)", __ARG_2, $S1, $P8)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 9041
    new $P4, ['ResizableStringArray']
.annotate 'line', 9042
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
.annotate 'line', 9043
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 9044
    $P7 = $P5.'emit_get'(__ARG_1)
    push $P4, $P7
  __label_12: # for iteration
.annotate 'line', 9042
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 9047
    join $S2, ', ', $P4
.annotate 'line', 9046
    $P7 = WSubId_45("    %0.'%1'(%2)", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_10: # case
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 9052
    concat $S3, "Modifier '", $S1
    concat $S3, $S3, "' not valid for try"
    WSubId_25($S3, self)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9055

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 9012
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 9014
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 9067
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 9068
    $P1 = __ARG_2.'get'()
.annotate 'line', 9069
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9070
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 9072
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 9074
    $P3 = WSubId_124(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 9075
    $P1 = __ARG_2.'get'()
.annotate 'line', 9076
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 9077
    WSubId_26('catch', $P1)
  __label_3: # endif
.annotate 'line', 9078
    $P1 = __ARG_2.'get'()
.annotate 'line', 9079
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 9080
    WSubId_69("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 9081
    $P1 = __ARG_2.'get'()
.annotate 'line', 9082
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 9083
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 9084
    setattribute self, 'exname', $P1
.annotate 'line', 9085
    self.'createvar'($S1, 'P')
.annotate 'line', 9086
    $P1 = __ARG_2.'get'()
.annotate 'line', 9087
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 9088
    WSubId_69("')' in 'catch'", $P1)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 9090
    $P3 = WSubId_124(__ARG_2, self)
    setattribute self, 'scatch', $P3
.annotate 'line', 9091

.end # TryStatement


.sub 'allowtailcall' :method
.annotate 'line', 9094
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 9095
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 9097
    .return(0)
  __label_2: # endif
.annotate 'line', 9098

.end # allowtailcall


.sub 'optimize' :method
.annotate 'line', 9101
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 9102
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 9103
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 9104
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 9105
    .return(self)
.annotate 'line', 9106

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9109
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9110
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 9111
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 9112
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 9113
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 9114
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 9116
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 9117
    self.'annotate'(__ARG_1)
.annotate 'line', 9118
    unless $I1 goto __label_7
.annotate 'line', 9119
    __ARG_1.'comment'('try: create handler')
  __label_7: # endif
.annotate 'line', 9120
    $P1 = WSubId_45("    new %0, 'ExceptionHandler'\n    set_label %0, %1\n", $S1, $S2)
    __ARG_1.'print'($P1)
.annotate 'line', 9127
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_8
.annotate 'line', 9128
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_8: # endif
.annotate 'line', 9130
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 9131
    unless $I1 goto __label_9
.annotate 'line', 9132
    __ARG_1.'comment'('try: begin')
  __label_9: # endif
.annotate 'line', 9133
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9134
    unless $I1 goto __label_10
.annotate 'line', 9135
    __ARG_1.'comment'('try: end')
  __label_10: # endif
.annotate 'line', 9136
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 9138
    self.'annotate'(__ARG_1)
.annotate 'line', 9139
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 9141
    unless $I1 goto __label_11
.annotate 'line', 9142
    __ARG_1.'comment'('catch')
  __label_11: # endif
.annotate 'line', 9143
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 9144
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 9145
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 9146
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 9147
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9149
    unless $I1 goto __label_12
.annotate 'line', 9150
    __ARG_1.'comment'('catch end')
  __label_12: # endif
.annotate 'line', 9151
    __ARG_1.'emitlabel'($S3)
.annotate 'line', 9152

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 9058
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 9060
    addattribute $P0, 'stry'
.annotate 'line', 9061
    addattribute $P0, 'modifiers'
.annotate 'line', 9062
    addattribute $P0, 'exname'
.annotate 'line', 9063
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.annotate 'line', 9166
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9167
    setattribute self, 'name', __ARG_3
.annotate 'line', 9168
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 9169
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 9170
    box $P2, __ARG_4
    setattribute self, 'flags', $P2
.annotate 'line', 9171

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 9159
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9161
    addattribute $P0, 'name'
.annotate 'line', 9162
    addattribute $P0, 'reg'
.annotate 'line', 9163
    addattribute $P0, 'flags'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
.annotate 'line', 9187
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9188
    setattribute self, 'name', __ARG_3
.annotate 'line', 9189
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 9190
    box $P2, __ARG_5
    setattribute self, 'regtype', $P2
.annotate 'line', 9191
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 9192
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 9193

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 9178
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9180
    addattribute $P0, 'name'
.annotate 'line', 9181
    addattribute $P0, 'basetype'
.annotate 'line', 9182
    addattribute $P0, 'regtype'
.annotate 'line', 9183
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 9204
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 9205
    $P1 = __ARG_5.'get'()
.annotate 'line', 9206
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9208
    $P4 = WSubId_67(__ARG_5, self)
    setattribute self, 'init', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 9211
    __ARG_5.'unget'($P1)
  __label_2: # endif
.annotate 'line', 9212

.end # DeclareSingleStatement


.sub 'clonedeclare' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9215
    getattribute $P1, self, 'start'
.annotate 'line', 9216
    getattribute $P2, self, 'name'
    getattribute $P3, self, 'basetype'
    getattribute $P4, self, 'regtype'
.annotate 'line', 9215
    __ARG_1.'DeclareBase'($P1, __ARG_2, $P2, $P3, $P4)
.annotate 'line', 9217
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 9218
    getattribute $P4, self, 'init'
    $P3 = $P4.'clone'(__ARG_2)
    setattribute __ARG_1, 'init', $P3
  __label_1: # endif
.annotate 'line', 9219
    .return(__ARG_1)
.annotate 'line', 9220

.end # clonedeclare


.sub 'optimize' :method
.annotate 'line', 9223
    getattribute $P1, self, 'init'
.annotate 'line', 9224
    if_null $P1, __label_1
.annotate 'line', 9225
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 9226
    .return(self)
.annotate 'line', 9227

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_127 = "WSubId_127"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9230
    self.'annotate'(__ARG_1)
.annotate 'line', 9231
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9232
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 9233
    null $S3
.annotate 'line', 9234
    getattribute $P2, self, 'basetype'
    null $S4
    if_null $P2, __label_3
    set $S4, $P2
  __label_3:
.annotate 'line', 9235
    getattribute $P1, self, 'init'
.annotate 'line', 9236
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9237
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
  __label_4: # endif
.annotate 'line', 9239
    isnull $I1, $P1
    box $P2, $I1
    if $P2 goto __label_7
    $P2 = $P1.'isnull'()
  __label_7:
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 9240
    __ARG_1.'emitnull'($S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 9242
    $P3 = $P1.'checkresult'()
    null $S5
    if_null $P3, __label_8
    set $S5, $P3
  __label_8:
.annotate 'line', 9243
    ne $S5, $S4, __label_9
.annotate 'line', 9244
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
.annotate 'line', 9246
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 9248
    $P1.'emit'(__ARG_1, $S2)
    goto __label_12
  __label_11: # else
.annotate 'line', 9250
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
.annotate 'line', 9253
    $P3 = WSubId_48($P1)
    set $S3, $P3
.annotate 'line', 9254
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_18: # case
.annotate 'line', 9257
    $P4 = WSubId_127($P1)
    set $S3, $P4
.annotate 'line', 9258
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_19: # case
.annotate 'line', 9261
    $P5 = WSubId_47($P1)
    set $S3, $P5
.annotate 'line', 9262
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_15: # default
.annotate 'line', 9265
    WSubId_30("Wrong type", self)
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
.annotate 'line', 9271
    WSubId_25('Invalid initialization from void value', self)
  __label_20: # default
.annotate 'line', 9273
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S3, $P2
  __label_21: # switch end
.annotate 'line', 9275
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_25
    iseq $I1, $S5, 'P'
  __label_25:
    unless $I1 goto __label_23
.annotate 'line', 9276
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_26
    set $S6, $P2
  __label_26:
.annotate 'line', 9277
    __ARG_1.'emitnull'($S2)
.annotate 'line', 9278
    __ARG_1.'emitif_null'($S3, $S6)
.annotate 'line', 9279
    __ARG_1.'emitset'($S2, $S3)
.annotate 'line', 9280
    __ARG_1.'emitlabel'($S6)
    goto __label_24
  __label_23: # else
.annotate 'line', 9283
    __ARG_1.'emitset'($S2, $S3)
  __label_24: # endif
  __label_14: # endif
  __label_12: # endif
  __label_10: # endif
  __label_6: # endif
.annotate 'line', 9287

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 9198
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 9200
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
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 9302
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 9303
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 9304
    $P1 = __ARG_6.'get'()
.annotate 'line', 9305
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9307
    __ARG_6.'unget'($P1)
.annotate 'line', 9308
    $P3 = WSubId_67(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 9309
    WSubId_83(']', __ARG_6)
  __label_1: # endif
.annotate 'line', 9311
    $P1 = __ARG_6.'get'()
.annotate 'line', 9312
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9313
    $P1 = __ARG_6.'get'()
.annotate 'line', 9314
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 9315
    WSubId_69("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 9316
    $P1 = __ARG_6.'get'()
.annotate 'line', 9317
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 9318
    __ARG_6.'unget'($P1)
.annotate 'line', 9319
    $P3 = WSubId_66(__ARG_6, self, WSubId_67, ']')
    setattribute self, 'initarray', $P3
  __label_5: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 9323
    __ARG_6.'unget'($P1)
  __label_3: # endif
.annotate 'line', 9324

.end # DeclareArrayStatement


.sub 'optimize' :method
.annotate 'line', 9327
    getattribute $P2, self, 'size'
    if_null $P2, __label_1
.annotate 'line', 9328
    getattribute $P5, self, 'size'
    $P4 = $P5.'optimize'()
    setattribute self, 'size', $P4
  __label_1: # endif
.annotate 'line', 9329
    getattribute $P1, self, 'initarray'
.annotate 'line', 2195
    if_null $P1, __label_4
    elements $I1, $P1
    goto __label_3
  __label_4:
    null $I1
  __label_3:
.annotate 'line', 2196
    null $I2
  __label_7: # for condition
    ge $I2, $I1, __label_6
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_5: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_7
  __label_6: # for end
  __label_2:
.annotate 'line', 9330
    .return(self)
.annotate 'line', 9331

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9334
    self.'annotate'(__ARG_1)
.annotate 'line', 9336
    getattribute $P1, self, 'reg'
.annotate 'line', 9337
    getattribute $P2, self, 'size'
.annotate 'line', 9338
    getattribute $P3, self, 'initarray'
.annotate 'line', 9339
    getattribute $P4, self, 'basetype'
.annotate 'line', 9340
    getattribute $P5, self, 'arraytype'
.annotate 'line', 9341
    if_null $P2, __label_1
.annotate 'line', 9344
    $P8 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 9343
    $P7 = WSubId_45("    new %0, ['Fixed%1Array'], %2", $P1, $P5, $P8)
    __ARG_1.'say'($P7)
    goto __label_2
  __label_1: # else
.annotate 'line', 9348
    $P7 = WSubId_45("    new %0, ['Resizable%1Array']", $P1, $P5)
    __ARG_1.'say'($P7)
  __label_2: # endif
.annotate 'line', 9351
    if_null $P3, __label_3
.annotate 'line', 9352
    $P7 = self.'tempreg'($P4)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 9353
    elements $I1, $P3
.annotate 'line', 9354
    unless_null $P2, __label_5
.annotate 'line', 9355
    unless $I1 goto __label_6
.annotate 'line', 9357
    __ARG_1.'emitset'($P1, $I1)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 9360
    null $I2
.annotate 'line', 9361
    if_null $P3, __label_8
    iter $P9, $P3
    set $P9, 0
  __label_7: # for iteration
    unless $P9 goto __label_8
    shift $P6, $P9
.annotate 'line', 9362
    $P6.'emit'(__ARG_1, $S1)
.annotate 'line', 9363
    $P7 = WSubId_45("    %0[%1] = %2", $P1, $I2, $S1)
    __ARG_1.'say'($P7)
.annotate 'line', 9364
    inc $I2
    goto __label_7
  __label_8: # endfor
  __label_3: # endif
.annotate 'line', 9367

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 9292
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 9294
    addattribute $P0, 'size'
.annotate 'line', 9295
    addattribute $P0, 'initarray'
.annotate 'line', 9296
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_128')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_123 = "WSubId_123"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 9374
    null $P1
.annotate 'line', 9375
    null $P2
  __label_1: # do
.annotate 'line', 9377
    $P3 = __ARG_4.'get'()
.annotate 'line', 9378
    WSubId_123($P3)
.annotate 'line', 9379
    $P4 = __ARG_4.'get'()
.annotate 'line', 9380
    null $P5
.annotate 'line', 9381
    $P8 = $P4.'isop'('[')
    if_null $P8, __label_4
    unless $P8 goto __label_4
.annotate 'line', 9382
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
.annotate 'line', 9384
    __ARG_4.'unget'($P4)
.annotate 'line', 9385
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
  __label_5: # endif
.annotate 'line', 9387
    set $P6, $P2
    set $P7, $P5
.annotate 'line', 2765
    isnull $I1, $P6
    if $I1 goto __label_9
.annotate 'line', 2767
    isa $I1, $P6, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_10
    goto __label_8
  __label_9: # case
.annotate 'line', 2766
    set $P2, $P7
    goto __label_6
  __label_10: # case
.annotate 'line', 2768
    $P2 = $P6.'push'($P7)
    goto __label_6
  __label_8: # default
.annotate 'line', 2770
    new $P8, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P8.'MultiStatement'($P6, $P7)
    set $P2, $P8
    goto __label_6
  __label_7: # switch end
  __label_6:
.annotate 'line', 9388
    $P1 = __ARG_4.'get'()
  __label_3: # continue
.annotate 'line', 9389
    $P8 = $P1.'isop'(',')
    if_null $P8, __label_2
    if $P8 goto __label_1
  __label_2: # enddo
.annotate 'line', 9390
    WSubId_28(';', $P1)
.annotate 'line', 9391
    .return($P2)
.annotate 'line', 9392

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9400
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
.annotate 'line', 9401

.end # IntStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9404
    new $P1, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9405

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 9396
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9412
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
.annotate 'line', 9413

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 9408
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_129')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9419
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9420

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_130')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9424
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9425

.end # newIntArray


.sub 'parseInt' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_130 = "WSubId_130"
.annotate 'line', 9429
    .tailcall WSubId_128(WSubId_129, WSubId_130, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9430

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9438
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
.annotate 'line', 9439

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 9434
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9446
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
.annotate 'line', 9447

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 9442
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_131')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9453
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9454

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_132')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9458
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9459

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_131 = "WSubId_131"
.const 'Sub' WSubId_132 = "WSubId_132"
.annotate 'line', 9463
    .tailcall WSubId_128(WSubId_131, WSubId_132, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9464

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9472
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
.annotate 'line', 9473

.end # StringStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9476
    new $P1, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9477

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 9468
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9484
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
.annotate 'line', 9485

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 9480
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_133')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9491
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9492

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_134')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9496
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9497

.end # newStringArray


.sub 'parseString' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_133 = "WSubId_133"
.const 'Sub' WSubId_134 = "WSubId_134"
.annotate 'line', 9501
    .tailcall WSubId_128(WSubId_133, WSubId_134, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9502

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 9518
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9519
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 9520
    setattribute self, 'name', __ARG_4
.annotate 'line', 9521
    setattribute self, 'value', __ARG_5
.annotate 'line', 9522
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
.annotate 'line', 9523

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9526
    getattribute $P1, self, 'value'
.annotate 'line', 9527
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9528
    $P1 = $P1.'optimize'()
.annotate 'line', 9529
    $P2 = $P1.'hascompilevalue'()
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 9530
    WSubId_25('Value for const is not evaluable at compile time', self)
  __label_2: # endif
.annotate 'line', 9533
    getattribute $P2, self, 'data'
    $P2.'setvalue'($P1)
.annotate 'line', 9534
    .return(self)
.annotate 'line', 9535

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9538
    getattribute $P1, self, 'start'
    WSubId_30('Direct use of const', $P1)
.annotate 'line', 9539

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9542
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9543
    getattribute $P3, self, 'data'
    $P1 = $P3.'getvalue'()
.annotate 'line', 9544
    null $S1
.annotate 'line', 9545
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
.annotate 'line', 9546
    $P3 = $P1.'getIntegerValue'()
    set $S1, $P3
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 9547
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 9548
    $P5 = $P1.'getPirString'()
    set $S1, $P5
    goto __label_3 # break
  __label_2: # default
  __label_3: # switch end
.annotate 'line', 9551
    getattribute $P2, self, 'name'
    set $S2, $P2
.annotate 'line', 9552
    concat $S3, "Constant '", $S2
    concat $S3, $S3, "' set to: "
    concat $S3, $S3, $S1
.annotate 'line', 9551
    __ARG_1.'comment'($S3)
  __label_1: # endif
.annotate 'line', 9554

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 9508
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9510
    addattribute $P0, 'type'
.annotate 'line', 9511
    addattribute $P0, 'name'
.annotate 'line', 9512
    addattribute $P0, 'data'
.annotate 'line', 9513
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_126 = "WSubId_126"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 9559
    $P1 = __ARG_2.'get'()
.annotate 'line', 9560
    $P7 = WSubId_126($P1)
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 9561
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9562
    WSubId_25('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 9564
    null $P2
  __label_5: # do
.annotate 'line', 9566
    $P3 = __ARG_2.'get'()
.annotate 'line', 9567
    WSubId_83('=', __ARG_2)
.annotate 'line', 9568
    $P4 = WSubId_67(__ARG_2, __ARG_3)
.annotate 'line', 9569
    set $P5, $P2
.annotate 'line', 9570
    new $P7, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P7.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P6, $P7
.annotate 'line', 2765
    isnull $I1, $P5
    if $I1 goto __label_11
.annotate 'line', 2767
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_12
    goto __label_10
  __label_11: # case
.annotate 'line', 2766
    set $P2, $P6
    goto __label_8
  __label_12: # case
.annotate 'line', 2768
    $P2 = $P5.'push'($P6)
    goto __label_8
  __label_10: # default
.annotate 'line', 2770
    new $P8, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P8.'MultiStatement'($P5, $P6)
    set $P2, $P8
    goto __label_8
  __label_9: # switch end
  __label_8:
  __label_7: # continue
.annotate 'line', 9571
    $P1 = __ARG_2.'get'()
    $P7 = $P1.'isop'(',')
    if_null $P7, __label_6
    if $P7 goto __label_5
  __label_6: # enddo
.annotate 'line', 9572
    WSubId_28(';', $P1)
.annotate 'line', 9573
    .return($P2)
.annotate 'line', 9574

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 9585
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 9586
    $P1 = __ARG_2.'get'()
.annotate 'line', 9587
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9588
    $P4 = WSubId_67(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 9589
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 9591
    WSubId_28(';', $P1)
.annotate 'line', 9592

.end # VarStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9595
    new $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 9596
    getattribute $P2, self, 'start'
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'flags'
    $P1.'initvarbase'($P2, __ARG_1, $P3, $P4)
.annotate 'line', 9597
    getattribute $P2, self, 'init'
    if_null $P2, __label_1
.annotate 'line', 9598
    getattribute $P5, self, 'init'
    $P4 = $P5.'clone'($P1)
    setattribute $P1, 'init', $P4
  __label_1: # endif
.annotate 'line', 9599
    .return($P1)
.annotate 'line', 9600

.end # clone


.sub 'optimize_init' :method
.annotate 'line', 9603
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 9604
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 9605
    .return(self)
.annotate 'line', 9606

.end # optimize_init


.sub 'optimize' :method
.annotate 'line', 9609
    .tailcall self.'optimize_init'()
.annotate 'line', 9610

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9613
    self.'annotate'(__ARG_1)
.annotate 'line', 9614
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9615
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 9616
    getattribute $P1, self, 'init'
.annotate 'line', 9617
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9618
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
  __label_3: # endif
.annotate 'line', 9619
    if_null $P1, __label_4
.annotate 'line', 9620
    $P2 = $P1.'isnull'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 9621
    null $P1
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 9622
    if_null $P1, __label_6
.annotate 'line', 9623
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
.annotate 'line', 9625
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
  __label_13: # case
.annotate 'line', 9630
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_15
    set $S3, $P3
  __label_15:
.annotate 'line', 9631
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_9 # break
  __label_14: # case
.annotate 'line', 9634
    WSubId_25("Can't use void function as initializer", self)
  __label_8: # default
.annotate 'line', 9636
    WSubId_25("Invalid var initializer", self)
  __label_9: # switch end
    goto __label_7
  __label_6: # else
.annotate 'line', 9640
    __ARG_1.'emitnull'($S2)
  __label_7: # endif
.annotate 'line', 9641

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 9580
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 9582
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 9648
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 9649
    WSubId_83(';', __ARG_2)
.annotate 'line', 9650

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9653
    self.'annotate'(__ARG_1)
.annotate 'line', 9654
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9655
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 9656
    getattribute $P3, self, 'name'
    $P2 = WSubId_45("var %0[] : %1", $P3, $S1)
    __ARG_1.'comment'($P2)
  __label_2: # endif
.annotate 'line', 9657
    $P1 = WSubId_45("    new %0, 'ResizablePMCArray'", $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 9658

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 9644
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 9667
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 9668
    $P2 = WSubId_67(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 9669
    WSubId_83(']', __ARG_2)
.annotate 'line', 9670
    WSubId_83(';', __ARG_2)
.annotate 'line', 9671

.end # FixedVarStatement


.sub 'optimize' :method
.annotate 'line', 9674
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 9675
    .tailcall self.'optimize_init'()
.annotate 'line', 9676

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9679
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9680
    self.'annotate'(__ARG_1)
.annotate 'line', 9681
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 9682
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 9683
    getattribute $P3, self, 'name'
    $P2 = WSubId_45("var %0[] : %1", $P3, $S2)
    __ARG_1.'comment'($P2)
  __label_3: # endif
.annotate 'line', 9684
    $P1 = WSubId_45("    new %0, 'FixedPMCArray', %1", $S2, $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 9685

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 9661
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 9663
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_123 = "WSubId_123"
.annotate 'line', 9690
    $P1 = __ARG_2.'get'()
.annotate 'line', 9691
    WSubId_123($P1)
.annotate 'line', 9692
    $P2 = __ARG_2.'get'()
.annotate 'line', 9693
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9694
    $P2 = __ARG_2.'get'()
.annotate 'line', 9695
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 9696
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
.annotate 'line', 9698
    __ARG_2.'unget'($P2)
.annotate 'line', 9699
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 9703
    __ARG_2.'unget'($P2)
.annotate 'line', 9704
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9706

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_75 = "WSubId_75"
.annotate 'line', 9710
    $P1 = __ARG_2.'get'()
.annotate 'line', 9711
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9712
    WSubId_25("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 9713
    .tailcall WSubId_75(__ARG_1, __ARG_2, __ARG_3, 1)
.annotate 'line', 9714

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9727
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 9728
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 9729
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 9730
    null $P1
  __label_2: # while
.annotate 'line', 9731
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9732
    __ARG_2.'unget'($P1)
.annotate 'line', 9733
    $P2 = WSubId_124(__ARG_2, self)
.annotate 'line', 9734
    unless_null $P2, __label_3
.annotate 'line', 9735
    WSubId_30('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 9736
    getattribute $P3, self, 'statements'
    push $P3, $P2
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9738
    setattribute self, 'end', $P1
.annotate 'line', 9739

.end # CompoundStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9742
    new $P1, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 9743
    getattribute $P8, self, 'start'
    $P1.'BlockStatement'($P8, __ARG_1)
.annotate 'line', 9744
    root_new $P9, ['parrot';'Hash']
    setattribute $P1, 'labels', $P9
.annotate 'line', 9745
    getattribute $P9, self, 'end'
    setattribute $P1, 'end', $P9
.annotate 'line', 9746
    getattribute $P2, self, 'statements'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P9 = WSubId_5("clone")
    $P6 = WSubId_3($P9, $P3)
.annotate 'line', 71
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
.annotate 'line', 72
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
.annotate 'line', 73
    set $P10, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
.annotate 'line', 132
    set $P8, $P10
.annotate 'line', 9746
    setattribute $P1, 'statements', $P8
.annotate 'line', 9747
    .return($P1)
.annotate 'line', 9748

.end # clone


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 9751
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9752
    getattribute $P1, self, 'labels'
.annotate 'line', 9753
    $S2 = $P1[$S1]
.annotate 'line', 9754
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9755
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 9756
    .return($S2)
.annotate 'line', 9757

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9760
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9761
    getattribute $P1, self, 'labels'
.annotate 'line', 9762
    $S2 = $P1[$S1]
.annotate 'line', 9763
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9764
    WSubId_25('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 9765
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 9766
    $P1[$S1] = $S3
.annotate 'line', 9767
    .return($S3)
.annotate 'line', 9768

.end # createlabel


.sub 'getend' :method
.annotate 'line', 9769
    getattribute $P1, self, 'end'
    .return($P1)

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9772
    $P2 = __ARG_1.'getDebug'()
    set $I1, $P2
.annotate 'line', 9773
    unless $I1 goto __label_1
.annotate 'line', 9774
    __ARG_1.'comment'('{')
  __label_1: # endif
.annotate 'line', 9775
    getattribute $P2, self, 'statements'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9776
    $P1.'emit'(__ARG_1)
.annotate 'line', 9777
    self.'freetemps'()
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9779
    unless $I1 goto __label_4
.annotate 'line', 9780
    __ARG_1.'comment'('}')
  __label_4: # endif
.annotate 'line', 9781

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 9720
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 9722
    addattribute $P0, 'end'
.annotate 'line', 9723
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
.annotate 'line', 9796
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 9798
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 9799
    new $P1, ['ResizableStringArray']
.annotate 'line', 9800
    new $P2, ['ResizableStringArray']
.annotate 'line', 9801
    setattribute self, 'tempreg', $P1
.annotate 'line', 9802
    setattribute self, 'freereg', $P2
.annotate 'line', 9803

.end # RegisterStore


.sub 'createreg' :method
.annotate 'line', 9806
    getattribute $P1, self, 'nreg'
.annotate 'line', 9807
    set $I1, $P1
.annotate 'line', 9808
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 9809
    assign $P1, $I1
.annotate 'line', 9810
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
.annotate 'line', 9811

.end # createreg


.sub 'tempreg' :method
.annotate 'line', 9814
    getattribute $P1, self, 'freereg'
.annotate 'line', 9815
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9816
    null $S1
.annotate 'line', 9817
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9818
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9820
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 9821
    push $P2, $S1
.annotate 'line', 9822
    .return($S1)
.annotate 'line', 9823

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9826
    getattribute $P1, self, 'freereg'
.annotate 'line', 9827
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9828
    elements $I1, $P2
.annotate 'line', 9829
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
.annotate 'line', 9830
    $S1 = $P2[$I2]
.annotate 'line', 9831
    push $P1, $S1
  __label_1: # for iteration
.annotate 'line', 9829
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 9833
    assign $P2, 0
.annotate 'line', 9834

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 9790
    addattribute $P0, 'type'
.annotate 'line', 9791
    addattribute $P0, 'nreg'
.annotate 'line', 9792
    addattribute $P0, 'tempreg'
.annotate 'line', 9793
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9845
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9846

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9849
    null $P1
.annotate 'line', 9850
    null $P2
.annotate 'line', 9851
    $P3 = self.'getlist'()
.annotate 'line', 9852
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
.annotate 'line', 9853
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
    if $S1 == 'named' goto __label_6
    if $S1 == 'slurpy' goto __label_7
    goto __label_4
  __label_6: # case
.annotate 'line', 9856
    set $P1, $P4
    goto __label_5 # break
  __label_7: # case
.annotate 'line', 9859
    set $P2, $P4
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 9862
    __ARG_1.'print'(' :', $S1)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9866
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 9873
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 9890
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 9871
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 9874
    null $S2
.annotate 'line', 9875
    $P7 = $P1.'numargs'()
    set $I2, $P7
    if $I2 == 0 goto __label_16
    if $I2 == 1 goto __label_17
    goto __label_14
  __label_16: # case
.annotate 'line', 9877
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_15 # break
  __label_17: # case
.annotate 'line', 9880
    $P5 = $P1.'getarg'(0)
.annotate 'line', 9881
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 9882
    WSubId_25('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 9883
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_15 # break
  __label_14: # default
.annotate 'line', 9886
    WSubId_25('Invalid modifier', __ARG_2)
  __label_15: # switch end
.annotate 'line', 9888
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 9891
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 9894

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 9841
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_126 = "WSubId_126"
.annotate 'line', 9905
    setattribute self, 'func', __ARG_1
.annotate 'line', 9906
    $P1 = __ARG_2.'get'()
.annotate 'line', 9907
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_126($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9908
    eq $S1, '', __label_2
.annotate 'line', 9909
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 9911
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 9912
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 9913
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 9914
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 9916
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 9917
    $P1 = __ARG_2.'get'()
.annotate 'line', 9918
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9919
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 9921
    __ARG_2.'unget'($P1)
  __label_5: # endif
.annotate 'line', 9922

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_135 = "WSubId_135"
.annotate 'line', 9925
    getattribute $P1, self, 'func'
.annotate 'line', 9926
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9927
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 9928
    $P5 = $P2.'gettype'()
    $P4 = WSubId_135($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 9929
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 9930
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9931
    if_null $P3, __label_3
.annotate 'line', 9932
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 9933
    __ARG_1.'say'('')
.annotate 'line', 9934

.end # emit


.sub 'get_type' :method
.annotate 'line', 9937
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 9938

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 9899
    addattribute $P0, 'func'
.annotate 'line', 9900
    addattribute $P0, 'name'
.annotate 'line', 9901
    addattribute $P0, 'modifiers'
.annotate 'line', 9902
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_136')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9944
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9945

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9956
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 9957
    setattribute self, 'name', __ARG_1
.annotate 'line', 9958

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9961
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 9962
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9963
    self.'annotate'(__ARG_1)
.annotate 'line', 9964
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 9965
    .return($S1)
.annotate 'line', 9966

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 9951
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9953
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_subid' :subid('WSubId_138')
        .param string __ARG_1
.annotate 'line', 9975
    concat $S1, ".const 'Sub' ", __ARG_1
    concat $S1, $S1, ' = "'
    concat $S1, $S1, __ARG_1
    concat $S1, $S1, "\"\n"
    .return($S1)
.annotate 'line', 9976

.end # emit_subid

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9982
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9983

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9986
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9987
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9989
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 9991
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 9992
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 9993
    le $I1, 0, __label_5
.annotate 'line', 9994
    __ARG_1.'print'('(')
.annotate 'line', 9995
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
.annotate 'line', 9996
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 9997
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 9998
    WSubId_25('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 9999
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 10000
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 10001
    __ARG_1.'print'(", ")
  __label_10: # endif
  __label_6: # for iteration
.annotate 'line', 9995
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 10003
    __ARG_1.'print'(')')
  __label_5: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10006

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 9978
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_137')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10011
    $P5 = __ARG_2.'numargs'()
    set $I1, $P5
.annotate 'line', 10012
    null $P1
.annotate 'line', 10013
    unless $I1 goto __label_1
.annotate 'line', 10014
    root_new $P5, ['parrot';'ResizablePMCArray']
    set $P1, $P5
.annotate 'line', 10015
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 10016
    $P2 = __ARG_2.'getarg'($I2)
.annotate 'line', 10018
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 10021
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 10034
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 10019
    $P5 = $P2.'get_value'()
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10022
    $P6 = $P2.'getName'()
    null $S1
    if_null $P6, __label_10
    set $S1, $P6
  __label_10:
    if $S1 == "int" goto __label_13
    if $S1 == "string" goto __label_14
    if $S1 == "float" goto __label_15
    if $S1 == "var" goto __label_16
    goto __label_11
  __label_13: # case
  __label_14: # case
.annotate 'line', 10025
    push $P1, $S1
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 10027
    push $P1, "num"
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 10029
    push $P1, "pmc"
    goto __label_12 # break
  __label_11: # default
.annotate 'line', 10031
    WSubId_25("unsupported multi signature", $P2)
  __label_12: # switch end
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10035
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 10036
    unless_null $P3, __label_17
.annotate 'line', 10037
    WSubId_25("class not found", $P2)
  __label_17: # endif
.annotate 'line', 10039
    set $P4, $P3
.annotate 'line', 2482
    null $S2
.annotate 'line', 2483
    elements $I3, $P4
    unless $I3 goto __label_19
.annotate 'line', 2484
    join $S3, "'; '", $P4
    concat $S5, "[ '", $S3
    concat $S5, $S5, "' ]"
    set $S2, $S5
  __label_19: # endif
.annotate 'line', 2485
    set $S4, $S2
    goto __label_18
  __label_18:
.annotate 'line', 10039
    push $P1, $S4
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10042
    WSubId_25("unsupported multi signature", $P2)
  __label_5: # switch end
  __label_2: # for iteration
.annotate 'line', 10015
    inc $I2
    goto __label_4
  __label_3: # for end
  __label_1: # endif
.annotate 'line', 10046
    .return($P1)
.annotate 'line', 10047

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10069
    self.'BlockStatement'(__ARG_1, __ARG_2)
.annotate 'line', 10070
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 10071
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 10072
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 10073
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 10074
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
.annotate 'line', 10075

.end # FunctionBase


.sub 'getouter' :method
.annotate 'line', 10077
    .return(self)

.end # getouter


.sub 'allowtailcall' :method
.annotate 'line', 10080
    .return(1)
.annotate 'line', 10081

.end # allowtailcall


.sub 'makesubid' :method
.annotate 'line', 10085
    getattribute $P1, self, 'subid'
.annotate 'line', 10086
    unless_null $P1, __label_1
.annotate 'line', 10087
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 10088
    .return($P1)
.annotate 'line', 10089

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 10092
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 10093
    unless_null $P1, __label_1
.annotate 'line', 10094
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 10095
    $P1[__ARG_1] = 1
.annotate 'line', 10096

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
.annotate 'line', 10100
    issame $I1, self, __ARG_1
.annotate 'line', 10101
    .return($I1)
.annotate 'line', 10102

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_136 = "WSubId_136"
.annotate 'line', 10105
    $P1 = __ARG_1.'get'()
.annotate 'line', 10106
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 10107
    __ARG_1.'unget'($P1)
.annotate 'line', 10108
    $P3 = WSubId_66(__ARG_1, self, WSubId_136, ')')
    setattribute self, 'params', $P3
  __label_1: # endif
.annotate 'line', 10110

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10114
    getattribute $P1, self, 'localfun'
.annotate 'line', 10115
    unless_null $P1, __label_1
.annotate 'line', 10116
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 10118
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 10119

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 10123
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10124
    unless_null $P1, __label_1
.annotate 'line', 10125
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 1
    $P6[0] = __ARG_1
    setattribute self, 'usednamespaces', $P6
    goto __label_2
  __label_1: # else
.annotate 'line', 10127
    set $P2, $P1
    set $P3, __ARG_1
.annotate 'line', 78
    if_null $P2, __label_6
    iter $P8, $P2
    set $P8, 0
  __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P4, $P8
.annotate 'line', 79
    ne_addr $P4, $P3, __label_7
.annotate 'line', 80
    set $P7, $P4
    goto __label_4
  __label_7: # endif
    goto __label_5
  __label_6: # endfor
.annotate 'line', 81
    null $P7
    goto __label_4
  __label_4:
    set $P5, $P7
.annotate 'line', 10127
    if_null $P5, __label_3
.annotate 'line', 10128
    .return()
  __label_3: # endif
.annotate 'line', 10129
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 10131

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 10134
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10135
    $P2 = $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10136
    if_null $P2, __label_3
.annotate 'line', 10137
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10139
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10140

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_137 = "WSubId_137"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10144
    getattribute $P1, self, 'modifiers'
.annotate 'line', 10145
    if_null $P1, __label_1
.annotate 'line', 10146
    $P2 = $P1.'pick'('multi')
.annotate 'line', 10147
    if_null $P2, __label_2
.annotate 'line', 10149
    self.'setmulti'()
.annotate 'line', 10150
    $P7 = WSubId_137(self, $P2)
    setattribute self, 'multi_sig', $P7
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 10153
    getattribute $P3, self, 'usednamespaces'
    $P4 = WSubId_5("fixnamespaces")
.annotate 'line', 65
    if_null $P3, __label_5
    iter $P8, $P3
    set $P8, 0
  __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P5, $P8
.annotate 'line', 66
    $P4($P5)
    goto __label_4
  __label_5: # endfor
  __label_3:
.annotate 'line', 10154
    getattribute $P9, self, 'body'
    $P7 = $P9.'optimize'()
    setattribute self, 'body', $P7
.annotate 'line', 10155
    .return(self)
.annotate 'line', 10156

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 10160
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 10161
    unless_null $P1, __label_1
.annotate 'line', 10162
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 10163
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 10164

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 10167
    getattribute $P1, self, 'lexicals'
.annotate 'line', 10168
    unless_null $P1, __label_1
.annotate 'line', 10169
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 10170
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 10171

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
.annotate 'line', 10176
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 10177
    null $S1
.annotate 'line', 10178
    if_null $P1, __label_1
.annotate 'line', 10179
    set $S1, $P1
    goto __label_2
  __label_1: # else
.annotate 'line', 10181
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 10182
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 10183
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 10184
    self.'setlex'($S1, $S2)
.annotate 'line', 10185
    __ARG_1.'setlex'($S1)
  __label_2: # endif
.annotate 'line', 10187
    .return($S1)
.annotate 'line', 10188

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10192
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
.annotate 'line', 10195
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 10197
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 10199
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 10201
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 10203
    concat $S2, "Invalid type in createreg: ", __ARG_1
    WSubId_30($S2)
  __label_2: # switch end
.annotate 'line', 10205
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 10206
    .return($S1)
.annotate 'line', 10207

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10210
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
.annotate 'line', 10213
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 10215
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 10217
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 10219
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 10221
    concat $S2, "Invalid type in tempreg: ", __ARG_1
    WSubId_30($S2)
  __label_2: # switch end
.annotate 'line', 10223
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 10224
    .return($S1)
.annotate 'line', 10225

.end # tempreg


.sub 'freetemps' :method
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10228
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 4
    getattribute $P4, self, 'regstI'
    $P1[0] = $P4
    getattribute $P5, self, 'regstN'
    $P1[1] = $P5
    getattribute $P6, self, 'regstS'
    $P1[2] = $P6
    getattribute $P7, self, 'regstP'
    $P1[3] = $P7
.annotate 'line', 10229
    $P2 = WSubId_5("freetemps")
.annotate 'line', 65
    if_null $P1, __label_3
    iter $P8, $P1
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P3, $P8
.annotate 'line', 66
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:
.annotate 'line', 10230

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 10233
    getattribute $P1, self, 'nlabel'
    inc $P1
    set $I1, $P1
.annotate 'line', 10234
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
.annotate 'line', 10235

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10238
    WSubId_25('break not allowed here', __ARG_1)
.annotate 'line', 10239

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10242
    WSubId_25('continue not allowed here', __ARG_1)
.annotate 'line', 10243

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10249
    getattribute $P19, self, 'name'
    null $S1
    if_null $P19, __label_1
    set $S1, $P19
  __label_1:
.annotate 'line', 10250
    __ARG_1.'say'()
.annotate 'line', 10251
    __ARG_1.'print'(".sub ")
.annotate 'line', 10252
    $P19 = self.'isanonymous'()
    if_null $P19, __label_2
    unless $P19 goto __label_2
.annotate 'line', 10253
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 10255
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 10256
    getattribute $P19, self, 'subid'
    if_null $P19, __label_4
.annotate 'line', 10257
    getattribute $P20, self, 'subid'
    __ARG_1.'print'(" :subid('", $P20, "')")
  __label_4: # endif
.annotate 'line', 10259
    getattribute $P1, self, 'outer'
.annotate 'line', 10260
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_6
    getattribute $P19, self, 'usedlexicals'
    isnull $I2, $P19
    not $I2
  __label_6:
    unless $I2 goto __label_5
.annotate 'line', 10261
    getattribute $P2, $P1, 'subid'
.annotate 'line', 10262
    if_null $P2, __label_7
.annotate 'line', 10263
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10267
    $P19 = self.'ismethod'()
    if_null $P19, __label_8
    unless $P19 goto __label_8
.annotate 'line', 10268
    __ARG_1.'print'(' :method')
  __label_8: # endif
.annotate 'line', 10269
    getattribute $P3, self, 'modifiers'
.annotate 'line', 10270
    if_null $P3, __label_9
.annotate 'line', 10271
    $P3.'emit'(__ARG_1)
    goto __label_10
  __label_9: # else
.annotate 'line', 10273
    ne $S1, 'main', __label_11
.annotate 'line', 10274
    __ARG_1.'print'(' :main')
  __label_11: # endif
  __label_10: # endif
.annotate 'line', 10276
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 10277
    __ARG_1.'say'()
.annotate 'line', 10280
    set $P7, __ARG_1
    getattribute $P8, self, 'params'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2202
    set $P9, $P8
    $P19 = WSubId_5("emit")
    $P10 = WSubId_3($P19, $P7)
.annotate 'line', 65
    if_null $P9, __label_15
    iter $P21, $P9
    set $P21, 0
  __label_14: # for iteration
    unless $P21 goto __label_15
    shift $P11, $P21
.annotate 'line', 66
    $P10($P11)
    goto __label_14
  __label_15: # endfor
  __label_13:
  __label_12:
.annotate 'line', 10282
    getattribute $P4, self, 'lexicals'
.annotate 'line', 10283
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 10284
    isnull $I2, $P4
    not $I2
    if $I2 goto __label_17
    isnull $I2, $P5
    not $I2
  __label_17:
    unless $I2 goto __label_16
.annotate 'line', 10285
    getattribute $P19, self, 'start'
    __ARG_1.'annotate'($P19)
.annotate 'line', 10287
    if_null $P4, __label_19
    iter $P22, $P4
    set $P22, 0
  __label_18: # for iteration
    unless $P22 goto __label_19
    shift $S2, $P22
.annotate 'line', 10288
    $P20 = $P4[$S2]
    $P19 = WSubId_45(".lex '%0', %1", $P20, $S2)
    __ARG_1.'say'($P19)
    goto __label_18
  __label_19: # endfor
.annotate 'line', 10290
    if_null $P5, __label_21
    iter $P23, $P5
    set $P23, 0
  __label_20: # for iteration
    unless $P23 goto __label_21
    shift $S3, $P23
.annotate 'line', 10291
    substr $S4, $S3, 0, 1
    eq $S4, '$', __label_22
.annotate 'line', 10292
    concat $S5, "    .local pmc ", $S3
    __ARG_1.'say'($S5)
  __label_22: # endif
.annotate 'line', 10293
    $P19 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P19)
    goto __label_20
  __label_21: # endfor
  __label_16: # endif
.annotate 'line', 10297
    getattribute $P12, self, 'usedsubids'
    root_new $P13, ['parrot';'ResizablePMCArray']
    set $P14, WSubId_138
.annotate 'line', 71
    if_null $P12, __label_25
    iter $P25, $P12
    set $P25, 0
  __label_24: # for iteration
    unless $P25 goto __label_25
    shift $P15, $P25
.annotate 'line', 72
    $P19 = $P14($P15)
    push $P13, $P19
    goto __label_24
  __label_25: # endfor
.annotate 'line', 73
    set $P24, $P13
    goto __label_23
  __label_23:
    set $P19, $P24
.annotate 'line', 10297
    join $S4, "", $P19
    __ARG_1.'print'($S4)
.annotate 'line', 10299
    $P19 = __ARG_1.'getDebug'()
    set $I1, $P19
.annotate 'line', 10300
    getattribute $P6, self, 'body'
.annotate 'line', 10301
    $P19 = $P6.'isempty'()
    if_null $P19, __label_26
    unless $P19 goto __label_26
.annotate 'line', 10302
    unless $I1 goto __label_28
.annotate 'line', 10303
    __ARG_1.'comment'('Empty body')
  __label_28: # endif
    goto __label_27
  __label_26: # else
.annotate 'line', 10306
    unless $I1 goto __label_29
.annotate 'line', 10307
    __ARG_1.'comment'('Body')
  __label_29: # endif
.annotate 'line', 10308
    $P6.'emit'(__ARG_1)
.annotate 'line', 10309
    $P19 = $P6.'getend'()
    __ARG_1.'annotate'($P19)
  __label_27: # endif
.annotate 'line', 10311
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 10314
    getattribute $P16, self, 'localfun'
    $P19 = WSubId_5("emit")
    $P17 = WSubId_3($P19, __ARG_1)
.annotate 'line', 65
    if_null $P16, __label_32
    iter $P26, $P16
    set $P26, 0
  __label_31: # for iteration
    unless $P26 goto __label_32
    shift $P18, $P26
.annotate 'line', 66
    $P17($P18)
    goto __label_31
  __label_32: # endfor
  __label_30:
.annotate 'line', 10315

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 10049
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 10051
    addattribute $P0, 'name'
.annotate 'line', 10052
    addattribute $P0, 'subid'
.annotate 'line', 10053
    addattribute $P0, 'modifiers'
.annotate 'line', 10054
    addattribute $P0, 'params'
.annotate 'line', 10055
    addattribute $P0, 'body'
.annotate 'line', 10056
    addattribute $P0, 'regstI'
.annotate 'line', 10057
    addattribute $P0, 'regstN'
.annotate 'line', 10058
    addattribute $P0, 'regstS'
.annotate 'line', 10059
    addattribute $P0, 'regstP'
.annotate 'line', 10060
    addattribute $P0, 'nlabel'
.annotate 'line', 10061
    addattribute $P0, 'localfun'
.annotate 'line', 10062
    addattribute $P0, 'lexicals'
.annotate 'line', 10063
    addattribute $P0, 'usedlexicals'
.annotate 'line', 10064
    addattribute $P0, 'usedsubids'
.annotate 'line', 10065
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10331
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 10332
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 10333
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 10334
    self.'parse'(__ARG_2)
.annotate 'line', 10335
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
.annotate 'line', 10336

.end # FunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 10338
    .return(0)

.end # isanonymous


.sub 'getparamnum' :method
.annotate 'line', 10342
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 10343

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 10347
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 10348

.end # getlexnum


.sub 'ismethod' :method
.annotate 'line', 10349
    .return(0)

.end # ismethod


.sub 'ismulti' :method
.annotate 'line', 10353
    getattribute $P1, self, 'is_multi'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)
.annotate 'line', 10354

.end # ismulti


.sub 'setmulti' :method
.annotate 'line', 10357
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
.annotate 'line', 10358

.end # setmulti


.sub 'default_multi_sig' :subid('WSubId_13') :method
.const 'Sub' WSubId_14 = "WSubId_14"
.annotate 'line', 10361
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 10362
    $P6 = self.'ismethod'()
    if_null $P6, __label_1
    unless $P6 goto __label_1
.annotate 'line', 10363
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 10364
    getattribute $P2, self, 'params'
    set $P3, $P1
.annotate 'line', 10365
    set $P4, WSubId_14
.annotate 'line', 71
    if_null $P2, __label_4
    iter $P7, $P2
    set $P7, 0
  __label_3: # for iteration
    unless $P7 goto __label_4
    shift $P5, $P7
.annotate 'line', 72
    $P6 = $P4($P5)
    push $P3, $P6
    goto __label_3
  __label_4: # endfor
    goto __label_2
  __label_2:
.annotate 'line', 10370
    .return($P1)
.annotate 'line', 10371

.end # default_multi_sig


.sub '' :anon :subid('WSubId_14')
        .param pmc __ARG_1
.const 'Sub' WSubId_135 = "WSubId_135"
.annotate 'line', 10367
    $P1 = __ARG_1.'get_type'()
    .tailcall WSubId_135($P1)
.annotate 'line', 10368

.end # WSubId_14


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_139 = "WSubId_139"
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10374
    $P1 = __ARG_1.'get'()
.annotate 'line', 10375
    setattribute self, 'name', $P1
.annotate 'line', 10376
    $P2 = __ARG_1.'get'()
.annotate 'line', 10377
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 10378
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 10379
    $P2 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 10381
    WSubId_28('(', $P2)
.annotate 'line', 10382
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 10384
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 10385
    $P4 = $P3.'fullname'()
    WSubId_139(self, '__FUNCTION__', $P4)
.annotate 'line', 10387
    $P2 = __ARG_1.'get'()
.annotate 'line', 10388
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 10389
    WSubId_26('{', $P2)
  __label_2: # endif
.annotate 'line', 10390
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 10391
    .return(self)
.annotate 'line', 10392

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.annotate 'line', 10396
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 10397
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 10398
    unless_null $P1, __label_2
.annotate 'line', 10399
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 10400
    join $S1, ", ", $P1
    __ARG_1.'print'(' :multi(', $S1, ')')
  __label_1: # endif
.annotate 'line', 10402

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 10322
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 10324
    addattribute $P0, 'paramnum'
.annotate 'line', 10325
    addattribute $P0, 'lexnum'
.annotate 'line', 10326
    addattribute $P0, 'is_multi'
.annotate 'line', 10327
    addattribute $P0, 'multi_sig'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 10413
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 10414
    $P1 = __ARG_3.'getouter'()
.annotate 'line', 10415
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    unless $I1 goto __label_1
.annotate 'line', 10416
    $P4 = WSubId_25("local functions not allowed in inline", self)
    throw $P4
  __label_1: # endif
.annotate 'line', 10417
    $P1.'makesubid'()
.annotate 'line', 10418
    setattribute self, 'outer', $P1
.annotate 'line', 10419
    $P2 = self.'makesubid'()
.annotate 'line', 10420
    setattribute self, 'name', $P2
.annotate 'line', 10421
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 10422
    $P3 = __ARG_2.'get'()
.annotate 'line', 10423
    WSubId_28('{', $P3)
.annotate 'line', 10424
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P3, __ARG_2, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 10425
    __ARG_3.'addlocalfunction'(self)
.annotate 'line', 10426

.end # LocalFunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 10427
    .return(1)

.end # isanonymous


.sub 'ismethod' :method
.annotate 'line', 10428
    .return(0)

.end # ismethod


.sub 'needclosure' :method
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10431
    getattribute $P4, self, 'lexicals'
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_2
    getattribute $P5, self, 'usedlexicals'
    isnull $I1, $P5
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10432
    .return(1)
  __label_1: # endif
.annotate 'line', 10433
    getattribute $P1, self, 'localfun'
    $P2 = WSubId_5("needclosure")
.annotate 'line', 86
    if_null $P1, __label_5
    iter $P7, $P1
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P3, $P7
.annotate 'line', 87
    $P4 = $P2($P3)
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 88
    set $P6, $P3
    goto __label_3
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
.annotate 'line', 89
    null $P6
    goto __label_3
  __label_3:
    set $P4, $P6
.annotate 'line', 10433
    isnull $I1, $P4
    not $I1
    .return($I1)
.annotate 'line', 10434

.end # needclosure


.sub 'getsubid' :method
.annotate 'line', 10437
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 10438

.end # getsubid


.sub 'getparamnum' :method
.annotate 'line', 10442
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
.annotate 'line', 10443

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 10447
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
.annotate 'line', 10448

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10451
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 10452
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 10453
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 10455
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 10456
    self.'usesubid'($S1)
.annotate 'line', 10457
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 10459
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 10460
    $P2 = $P1.'getouter'()
.annotate 'line', 10461
    getattribute $P3, self, 'outer'
.annotate 'line', 10462
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
.annotate 'line', 10463
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 10464
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 10465
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 10466
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 10467
    eq $S3, 'P', __label_8
.annotate 'line', 10468
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 10469
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 10470
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 10471
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 10472
    .return($P4)
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 10475
    .return(__ARG_2)
.annotate 'line', 10476

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10479
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 10480
    unless_null $P1, __label_1
.annotate 'line', 10481
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10482
    unless_null $P1, __label_2
.annotate 'line', 10485
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 10486
    unless_null $P1, __label_3
.annotate 'line', 10488
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
.annotate 'line', 10489
    getattribute $P2, self, 'outer'
.annotate 'line', 10490
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 10491
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10492
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 10493
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 10494
    self.'setusedlex'($S1, $S2)
  __label_6: # endif
  __label_5: # endif
    goto __label_4
  __label_3: # else
.annotate 'line', 10498
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 10500
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 10501
    WSubId_30('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 10502
    .return($P1)
.annotate 'line', 10503

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 10409
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10514
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10515

.end # MethodStatement


.sub 'ismethod' :method
.annotate 'line', 10516
    .return(1)

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 10510
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineParam' ]

.sub 'InlineParam' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_126 = "WSubId_126"
.annotate 'line', 10530
    null $I1
.annotate 'line', 10531
    $P1 = __ARG_1.'get'()
.annotate 'line', 10532
    self.'initbase'($P1, __ARG_2)
.annotate 'line', 10533
    $P3 = $P1.'getidentifier'()
    set $S2, $P3
    ne $S2, "const", __label_1
.annotate 'line', 10534
    bor $I1, $I1, 1
.annotate 'line', 10535
    $P1 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 10537
    null $S1
.annotate 'line', 10538
    $P2 = __ARG_1.'get'()
.annotate 'line', 10539
    $P3 = $P2.'isop'(",")
    if $P3 goto __label_4
    $P3 = $P2.'isop'(")")
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 10540
    set $S1, '?'
.annotate 'line', 10541
    __ARG_1.'unget'($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 10544
    $P4 = $P1.'getidentifier'()
    $P3 = WSubId_126($P4)
    set $S1, $P3
.annotate 'line', 10545
    set $P1, $P2
  __label_3: # endif
.annotate 'line', 10547
    box $P3, $I1
    setattribute self, 'flags', $P3
.annotate 'line', 10548
    box $P3, $S1
    setattribute self, 'type', $P3
.annotate 'line', 10549
    setattribute self, 'name', $P1
.annotate 'line', 10550

.end # InlineParam


.sub 'isconst' :method
.annotate 'line', 10553
    getattribute $P1, self, 'flags'
    set $I2, $P1
    band $I1, $I2, 1
    .return($I1)
.annotate 'line', 10554

.end # isconst


.sub 'getname' :method
.annotate 'line', 10557
    getattribute $P1, self, 'name'
    .return($P1)
.annotate 'line', 10558

.end # getname


.sub 'gettype' :method
.annotate 'line', 10561
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 10562

.end # gettype

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineParam' ]
.annotate 'line', 10523
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 10525
    addattribute $P0, 'flags'
.annotate 'line', 10526
    addattribute $P0, 'type'
.annotate 'line', 10527
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineStatement' ]

.sub 'InlineStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_126 = "WSubId_126"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 10573
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 10574
    $P1 = __ARG_2.'get'()
.annotate 'line', 10575
    WSubId_83("(", __ARG_2)
.annotate 'line', 10576
    $P2 = __ARG_2.'get'()
.annotate 'line', 10577
    null $P3
.annotate 'line', 10578
    $P6 = $P2.'isop'(")")
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 10579
    __ARG_2.'unget'($P2)
.annotate 'line', 10580
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P3, $P6
  __label_2: # do
.annotate 'line', 10582
    new $P6, [ 'Winxed'; 'Compiler'; 'InlineParam' ]
    $P6.'InlineParam'(__ARG_2, self)
    set $P4, $P6
.annotate 'line', 10583
    $P3.'push'($P4)
  __label_4: # continue
.annotate 'line', 10584
    $P2 = __ARG_2.'get'()
    $P6 = $P2.'isop'(",")
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 10585
    WSubId_28(")", $P2)
  __label_1: # endif
.annotate 'line', 10587
    $P2 = __ARG_2.'get'()
.annotate 'line', 10588
    null $S1
.annotate 'line', 10589
    $P6 = $P2.'iskeyword'('return')
    if_null $P6, __label_5
    unless $P6 goto __label_5
.annotate 'line', 10590
    $P2 = __ARG_2.'get'()
.annotate 'line', 10591
    $P6 = $P2.'getidentifier'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 10592
    $P6 = WSubId_126($S2)
    set $S1, $P6
.annotate 'line', 10593
    ne $S1, '', __label_8
.annotate 'line', 10594
    WSubId_25("Invalid return type", $P2)
  __label_8: # endif
.annotate 'line', 10595
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # else
.annotate 'line', 10598
    set $S1, 'v'
  __label_6: # endif
.annotate 'line', 10599
    WSubId_28("{", $P2)
.annotate 'line', 10600
    __ARG_2.'unget'($P2)
.annotate 'line', 10601
    $P5 = WSubId_124(__ARG_2, self)
.annotate 'line', 10603
    setattribute self, 'name', $P1
.annotate 'line', 10604
    box $P6, $S1
    setattribute self, 'rettype', $P6
.annotate 'line', 10605
    setattribute self, 'params', $P3
.annotate 'line', 10606
    setattribute self, 'body', $P5
.annotate 'line', 10607

.end # InlineStatement


.sub 'getouter' :method
.annotate 'line', 10608
    .return(self)

.end # getouter


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 10609
    .return("FAKEREG")

.end # createreg

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
.annotate 'line', 10565
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 10567
    addattribute $P0, 'name'
.annotate 'line', 10568
    addattribute $P0, 'rettype'
.annotate 'line', 10569
    addattribute $P0, 'body'
.annotate 'line', 10570
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]

.sub 'InlinedBlock' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10624
    getattribute $P7, __ARG_2, 'start'
    self.'BlockStatement'($P7, __ARG_1)
.annotate 'line', 10625
    setattribute self, 'inliner', __ARG_2
.annotate 'line', 10626
    setattribute self, 'inlined', __ARG_1
.annotate 'line', 10627
    getattribute $P1, __ARG_1, 'params'
.annotate 'line', 10628
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 10629
    $P7 = __ARG_3.'numargs'()
    set $I2, $P7
.annotate 'line', 10630
    eq $I1, $I2, __label_3
.annotate 'line', 10631
    WSubId_25("Wrong arguments in inline expansion", __ARG_2)
  __label_3: # endif
.annotate 'line', 10632
    null $I3
  __label_6: # for condition
    ge $I3, $I1, __label_5
.annotate 'line', 10633
    $P2 = $P1[$I3]
.annotate 'line', 10634
    $P3 = $P2.'getname'()
.annotate 'line', 10635
    $P4 = __ARG_3.'getfreearg'($I3)
.annotate 'line', 10636
    $P7 = $P2.'gettype'()
    null $S1
    if_null $P7, __label_7
    set $S1, $P7
  __label_7:
.annotate 'line', 10637
    ne $S1, '?', __label_8
.annotate 'line', 10638
    $P7 = $P4.'checkresult'()
    set $S1, $P7
  __label_8: # endif
.annotate 'line', 10639
    $P7 = $P2.'isconst'()
    set $I4, $P7
.annotate 'line', 10640
    box $P7, $I4
    unless $P7 goto __label_11
    $P7 = $P4.'hascompilevalue'()
  __label_11:
    if_null $P7, __label_9
    unless $P7 goto __label_9
.annotate 'line', 10641
    $P5 = self.'createconst'($P3, $S1)
.annotate 'line', 10642
    $P5.'setvalue'($P4)
    goto __label_10
  __label_9: # else
.annotate 'line', 10645
    self.'createvar'($P3, $S1, 0)
  __label_10: # endif
  __label_4: # for iteration
.annotate 'line', 10632
    inc $I3
    goto __label_6
  __label_5: # for end
.annotate 'line', 10647
    setattribute self, 'params', $P1
.annotate 'line', 10648
    setattribute self, 'args', __ARG_3
.annotate 'line', 10649
    getattribute $P6, __ARG_1, 'body'
.annotate 'line', 10650
    $P6 = $P6.'clone'(self)
.annotate 'line', 10651
    $P6 = $P6.'optimize'()
.annotate 'line', 10652
    setattribute self, 'body', $P6
.annotate 'line', 10653

.end # InlinedBlock


.sub 'getouter' :method
.annotate 'line', 10654
    .return(self)

.end # getouter


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 10657
    getattribute $P2, self, 'inliner'
    getattribute $P1, $P2, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
.annotate 'line', 10658

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 10661
    getattribute $P1, self, 'inliner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 10662

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 10665
    getattribute $P2, self, 'inliner'
    getattribute $P1, $P2, 'owner'
    $P1.'freetemps'()
.annotate 'line', 10666

.end # freetemps


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 10669
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 10670
    unless_null $P1, __label_1
.annotate 'line', 10671
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 10672
    $P1[__ARG_1] = 1
.annotate 'line', 10673

.end # usesubid


.sub 'genlabel' :method
.annotate 'line', 10676
    getattribute $P1, self, 'inliner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 10677

.end # genlabel


.sub 'getendlabel' :method
.annotate 'line', 10681
    getattribute $P1, self, 'endlabel'
    .return($P1)
.annotate 'line', 10682

.end # getendlabel


.sub 'getrettype' :method
.annotate 'line', 10685
    getattribute $P2, self, 'inlined'
    getattribute $P1, $P2, 'rettype'
    .return($P1)
.annotate 'line', 10686

.end # getrettype


.sub 'checkresult' :method
.annotate 'line', 10689
    getattribute $P2, self, 'inlined'
    getattribute $P1, $P2, 'rettype'
    .return($P1)
.annotate 'line', 10690

.end # checkresult


.sub 'getretreg' :method
.annotate 'line', 10693
    getattribute $P1, self, 'retreg'
    .return($P1)
.annotate 'line', 10694

.end # getretreg


.sub 'emit_it' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_138 = "WSubId_138"
.annotate 'line', 10697
    $P9 = __ARG_1.'getDebug'()
    if_null $P9, __label_1
    unless $P9 goto __label_1
.annotate 'line', 10698
    __ARG_1.'comment'("inlined start")
  __label_1: # endif
.annotate 'line', 10699
    $P10 = self.'genlabel'()
    setattribute self, 'endlabel', $P10
.annotate 'line', 10700
    getattribute $P1, self, 'params'
.annotate 'line', 10701
    getattribute $P2, self, 'args'
.annotate 'line', 10702
    unless_null $P1, __label_3
    null $I1
    goto __label_2
  __label_3:
    elements $I1, $P1
  __label_2:
.annotate 'line', 10703
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 10704
    $P3 = $P1[$I2]
.annotate 'line', 10705
    $P4 = $P2.'getfreearg'($I2)
.annotate 'line', 10706
    $P9 = $P3.'isconst'()
    unless $P9 goto __label_8
    $P9 = $P4.'hascompilevalue'()
  __label_8:
    if_null $P9, __label_7
    unless $P9 goto __label_7
    goto __label_4 # continue
  __label_7: # endif
.annotate 'line', 10708
    $P9 = $P3.'gettype'()
    null $S1
    if_null $P9, __label_9
    set $S1, $P9
  __label_9:
.annotate 'line', 10709
    $P9 = $P4.'checkresult'()
    null $S2
    if_null $P9, __label_10
    set $S2, $P9
  __label_10:
.annotate 'line', 10710
    $P11 = $P3.'getname'()
    $P10 = self.'getvar'($P11)
    $P9 = $P10.'getreg'()
    null $S3
    if_null $P9, __label_11
    set $S3, $P9
  __label_11:
.annotate 'line', 10711
    iseq $I3, $S1, '?'
    if $I3 goto __label_14
    iseq $I3, $S2, $S1
  __label_14:
    unless $I3 goto __label_12
.annotate 'line', 10712
    $P4.'emit_init'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
.annotate 'line', 10714
    $P9 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 10715
    ne $S1, 'P', __label_16
.annotate 'line', 10716
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_17
  __label_16: # else
.annotate 'line', 10718
    __ARG_1.'emitset'($S3, $S4)
  __label_17: # endif
  __label_13: # endif
  __label_4: # for iteration
.annotate 'line', 10703
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 10721
    getattribute $P5, self, 'usedsubids'
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P7, WSubId_138
.annotate 'line', 71
    if_null $P5, __label_20
    iter $P13, $P5
    set $P13, 0
  __label_19: # for iteration
    unless $P13 goto __label_20
    shift $P8, $P13
.annotate 'line', 72
    $P9 = $P7($P8)
    push $P6, $P9
    goto __label_19
  __label_20: # endfor
.annotate 'line', 73
    set $P12, $P6
    goto __label_18
  __label_18:
    set $P9, $P12
.annotate 'line', 10721
    join $S5, "", $P9
    __ARG_1.'print'($S5)
.annotate 'line', 10722
    getattribute $P9, self, 'body'
    $P9.'emit'(__ARG_1)
.annotate 'line', 10723
    getattribute $P9, self, 'endlabel'
    __ARG_1.'emitlabel'($P9)
.annotate 'line', 10724

.end # emit_it


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10727
    $P1 = self.'getrettype'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10728
    box $P1, __ARG_2
    setattribute self, 'retreg', $P1
.annotate 'line', 10729
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 10730
    self.'emit_it'(__ARG_1)
.annotate 'line', 10731
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 10732
    __ARG_1.'comment'("inlined end")
  __label_2: # endif
.annotate 'line', 10733

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10736
    self.'emit_it'(__ARG_1)
.annotate 'line', 10737
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10738
    __ARG_1.'comment'("inlined end")
  __label_1: # endif
.annotate 'line', 10739

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10742
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10743
    ne $S1, 'v', __label_2
.annotate 'line', 10744
    WSubId_25("Cannot get a result from a void inline", self)
  __label_2: # endif
.annotate 'line', 10745
    $P2 = self.'createreg'($S1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 10746
    box $P2, $S2
    setattribute self, 'retreg', $P2
.annotate 'line', 10747
    self.'emit_it'(__ARG_1)
.annotate 'line', 10748
    ne $S1, 'P', __label_4
.annotate 'line', 10750
    $P1 = self.'tempreg'('P')
.annotate 'line', 10751
    __ARG_1.'emitset'($P1, $S2)
.annotate 'line', 10752
    set $S2, $P1
  __label_4: # endif
.annotate 'line', 10754
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 10755
    __ARG_1.'comment'("inlined end")
  __label_5: # endif
.annotate 'line', 10756
    .return($S2)
.annotate 'line', 10757

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]
.annotate 'line', 10612
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 10614
    addattribute $P0, 'inliner'
.annotate 'line', 10615
    addattribute $P0, 'inlined'
.annotate 'line', 10616
    addattribute $P0, 'usedsubids'
.annotate 'line', 10617
    addattribute $P0, 'params'
.annotate 'line', 10618
    addattribute $P0, 'args'
.annotate 'line', 10619
    addattribute $P0, 'body'
.annotate 'line', 10620
    addattribute $P0, 'endlabel'
.annotate 'line', 10621
    addattribute $P0, 'retreg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineRef' ]

.sub 'InlineRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10766
    self.'Expr'(__ARG_2, __ARG_1)
.annotate 'line', 10767
    setattribute self, 'inlined', __ARG_3
.annotate 'line', 10768

.end # InlineRef


.sub 'checkresult' :method
.annotate 'line', 10769
    .return('v')

.end # checkresult


.sub 'misused' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10772
    getattribute $P1, self, 'start'
    WSubId_25("inline used by reference", $P1)
.annotate 'line', 10773

.end # misused


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10776
    self.'misused'()
.annotate 'line', 10777

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 10780
    self.'misused'()
.annotate 'line', 10781

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10784
    self.'misused'()
.annotate 'line', 10785

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
.annotate 'line', 10760
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 10762
    addattribute $P0, 'inlined'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]

.sub 'CallInlineExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10793
    getattribute $P1, __ARG_2, 'start'
    self.'Expr'($P1, __ARG_1)
.annotate 'line', 10794
    new $P3, [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]
    getattribute $P4, __ARG_2, 'inlined'
    $P3.'InlinedBlock'($P4, __ARG_1, __ARG_3)
    set $P2, $P3
    setattribute self, 'block', $P2
.annotate 'line', 10795

.end # CallInlineExpr


.sub 'checkresult' :method
.annotate 'line', 10796
    getattribute $P1, self, 'block'
    .tailcall $P1.'checkresult'()

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10799
    getattribute $P1, self, 'block'
    $P1.'emit_void'(__ARG_1)
.annotate 'line', 10800

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 10803
    getattribute $P1, self, 'block'
    .tailcall $P1.'emit_get'(__ARG_1)
.annotate 'line', 10804

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10807
    getattribute $P1, self, 'block'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 10808

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]
.annotate 'line', 10788
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 10790
    addattribute $P0, 'block'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_126 = "WSubId_126"
.annotate 'line', 10822
    $P1 = __ARG_1.'get'()
.annotate 'line', 10823
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 10824
    WSubId_27($P1)
  __label_1: # endif
.annotate 'line', 10825
    $P2 = __ARG_1.'get'()
.annotate 'line', 10826
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 10827
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_126($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 10828
    set $P1, $P2
.annotate 'line', 10829
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 10830
    $P2 = __ARG_1.'get'()
  __label_2: # endif
.annotate 'line', 10832
    setattribute self, 'name', $P1
.annotate 'line', 10833
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 10834
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 10835
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 10836
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 10838
    __ARG_1.'unget'($P2)
  __label_5: # endif
.annotate 'line', 10839

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 10842
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 10843
    getattribute $P1, self, 'modifiers'
.annotate 'line', 10844
    if_null $P1, __label_1
.annotate 'line', 10845
    getattribute $P2, self, 'name'
.annotate 'line', 10846
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
  __label_1: # endif
.annotate 'line', 10848

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 10817
    addattribute $P0, 'name'
.annotate 'line', 10818
    addattribute $P0, 'modifiers'
.annotate 'line', 10819
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_140')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10853
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
.annotate 'line', 10854

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_140 = "WSubId_140"
.annotate 'line', 10861
    $P2 = WSubId_66(__ARG_1, __ARG_2, WSubId_140, ')')
    setattribute self, 'params', $P2
.annotate 'line', 10862

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 10865
    __ARG_1.'print'('(')
.annotate 'line', 10866
    set $S1, ''
.annotate 'line', 10867
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10868
    __ARG_1.'print'($S1)
.annotate 'line', 10869
    $P1.'emit'(__ARG_1)
.annotate 'line', 10870
    set $S1, ', '
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10872
    __ARG_1.'print'(')')
.annotate 'line', 10873

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 10858
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 10882
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 10883
    setattribute self, 'params', __ARG_3
.annotate 'line', 10884
    setattribute self, 'expr', __ARG_4
.annotate 'line', 10885

.end # MultiAssignStatement


.sub 'optimize' :method
.annotate 'line', 10888
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 10889
    .return(self)
.annotate 'line', 10890

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10893
    getattribute $P1, self, 'expr'
.annotate 'line', 10894
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 10895
    WSubId_25('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 10896
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 10897
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 10898
    __ARG_1.'print'('    ')
.annotate 'line', 10899
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 10900
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 10901
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 10902
    __ARG_1.'say'()
.annotate 'line', 10903

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 10876
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 10878
    addattribute $P0, 'params'
.annotate 'line', 10879
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10920
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 10921

.end # ClassSpecifier


.sub 'reftype' :method
.annotate 'line', 10922
    .return(0)

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 10926
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 10927

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 10916
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10935
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 10936
    setattribute self, 'name', __ARG_2
.annotate 'line', 10937

.end # ClassSpecifierStr


.sub 'reftype' :method
.annotate 'line', 10938
    .return(1)

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10942
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10943
    __ARG_1.'print'($S1)
.annotate 'line', 10944

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 10930
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 10932
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 10953
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 10954
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 10955
    $P2 = __ARG_1.'get'()
.annotate 'line', 10956
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 10957
    WSubId_69('literal string', $P2)
  __label_1: # endif
.annotate 'line', 10958
    $P3 = $P2.'rawstring'()
    push $P1, $P3
.annotate 'line', 10959
    $P2 = __ARG_1.'get'()
.annotate 'line', 10960
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 10961
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
.annotate 'line', 10963
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 10967
    WSubId_70('token in class key', $P2)
  __label_4: # switch end
  __label_7: # do
.annotate 'line', 10970
    $P2 = __ARG_1.'get'()
.annotate 'line', 10971
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 10972
    WSubId_69('literal string', $P2)
  __label_10: # endif
.annotate 'line', 10973
    $P3 = $P2.'rawstring'()
    push $P1, $P3
  __label_9: # continue
.annotate 'line', 10974
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 10975
    WSubId_28(']', $P2)
  __label_2: # endif
.annotate 'line', 10977
    setattribute self, 'key', $P1
.annotate 'line', 10978

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
.annotate 'line', 10979
    .return(2)

.end # reftype


.sub 'hasHLL' :method
.annotate 'line', 10982
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 10983

.end # hasHLL


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 10987
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 10988
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 10989

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10992
    getattribute $P1, self, 'key'
.annotate 'line', 2482
    null $S1
.annotate 'line', 2483
    elements $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 2484
    join $S3, "'; '", $P1
    concat $S4, "[ '", $S3
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_2: # endif
.annotate 'line', 2485
    set $S2, $S1
    goto __label_1
  __label_1:
.annotate 'line', 10992
    __ARG_1.'print'($S2)
.annotate 'line', 10993

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 10947
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 10949
    addattribute $P0, 'key'
.annotate 'line', 10950
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11001
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 11002
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 11003
    null $P2
  __label_2: # while
.annotate 'line', 11004
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 11005
    $P2 = __ARG_1.'get'()
.annotate 'line', 11006
    set $S1, $P2
    push $P1, $S1
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 11008
    __ARG_1.'unget'($P2)
.annotate 'line', 11009
    setattribute self, 'key', $P1
.annotate 'line', 11010

.end # ClassSpecifierId


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 11013
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 11014
    getattribute $P2, self, 'start'
    $P1.'ClassSpecifier'(__ARG_1, $P2)
.annotate 'line', 11015
    getattribute $P3, self, 'key'
    setattribute $P1, 'key', $P3
.annotate 'line', 11016
    .return($P1)
.annotate 'line', 11017

.end # clone


.sub 'reftype' :method
.annotate 'line', 11018
    .return(3)

.end # reftype


.sub 'last' :method
.annotate 'line', 11022
    getattribute $P1, self, 'key'
.annotate 'line', 11023
    $P2 = $P1[-1]
    .return($P2)
.annotate 'line', 11024

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 11027
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 11028
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 11029

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_98 = "WSubId_98"
.annotate 'line', 11033
    getattribute $P3, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P3, 2)
.annotate 'line', 11034
    unless_null $P1, __label_1
.annotate 'line', 11035
    getattribute $P3, self, 'key'
    join $S2, ".", $P3
    getattribute $P4, self, 'start'
    WSubId_98(__ARG_1, $S2, $P4)
.annotate 'line', 11036
    getattribute $P2, self, 'key'
.annotate 'line', 2482
    null $S1
.annotate 'line', 2483
    elements $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 2484
    join $S2, "'; '", $P2
    concat $S4, "[ '", $S2
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_4: # endif
.annotate 'line', 2485
    set $S3, $S1
    goto __label_3
  __label_3:
.annotate 'line', 11036
    __ARG_1.'print'($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11038
    $P3 = $P1.'getclasskey'()
    __ARG_1.'print'($P3)
  __label_2: # endif
.annotate 'line', 11039

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_98 = "WSubId_98"
.annotate 'line', 11042
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 11043
    unless_null $P1, __label_1
.annotate 'line', 11044
    getattribute $P3, self, 'key'
    join $S2, ".", $P3
    getattribute $P4, self, 'start'
    WSubId_98(__ARG_1, $S2, $P4)
.annotate 'line', 11045
    getattribute $P2, self, 'key'
.annotate 'line', 2482
    null $S1
.annotate 'line', 2483
    elements $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 2484
    join $S2, "'; '", $P2
    concat $S4, "[ '", $S2
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_4: # endif
.annotate 'line', 2485
    set $S3, $S1
    goto __label_3
  __label_3:
.annotate 'line', 11045
    __ARG_1.'say'("new ", __ARG_3, ", ", $S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11048
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
  __label_2: # endif
.annotate 'line', 11050

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 10996
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 10998
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11063
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 11064
    setattribute self, 'name', __ARG_2
.annotate 'line', 11065
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 11066
    setattribute self, 'classns', $P1
.annotate 'line', 11067

.end # ClassBase


.sub 'getpath' :method
.annotate 'line', 11070
    getattribute $P1, self, 'classns'
    .return($P1)
.annotate 'line', 11071

.end # getpath


.sub 'getclasskey' :method
.annotate 'line', 11074
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
.annotate 'line', 11075

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 11057
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 11059
    addattribute $P0, 'name'
.annotate 'line', 11060
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]

.sub 'FunctionContainer' :method
.annotate 'line', 11083
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions', $P2
.annotate 'line', 11084

.end # FunctionContainer


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 11090
    getattribute $P1, self, 'functions'
.annotate 'line', 11091
    getattribute $P3, __ARG_1, 'name'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 11092
    $P2 = $P1[$S1]
.annotate 'line', 11093
    unless_null $P2, __label_2
.annotate 'line', 11094
    $P1[$S1] = __ARG_1
    goto __label_3
  __label_2: # else
.annotate 'line', 11096
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_4
.annotate 'line', 11097
    $P2.'setmulti'()
  __label_4: # endif
.annotate 'line', 11098
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_5
.annotate 'line', 11099
    __ARG_1.'setmulti'()
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 11101

.end # addfunction


.sub 'find' :method
        .param string __ARG_1
.annotate 'line', 11104
    getattribute $P1, self, 'functions'
.annotate 'line', 11105
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 11106

.end # find

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
.annotate 'line', 11080
    addattribute $P0, 'functions'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_139 = "WSubId_139"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 11120
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11121
    self.'VarContainer'()
.annotate 'line', 11122
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P8.'FunctionContainer'()
    set $P8, $P8
    setattribute self, 'funcont', $P8
.annotate 'line', 11123
    setattribute self, 'parent', __ARG_3
.annotate 'line', 11124
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 11125
    setattribute self, 'items', $P1
.annotate 'line', 11126
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 11127
    setattribute self, 'members', $P2
.annotate 'line', 11129
    $P3 = __ARG_4.'get'()
.annotate 'line', 11130
    $P7 = $P3.'isop'(':')
    if_null $P7, __label_1
    unless $P7 goto __label_1
.annotate 'line', 11131
    $P9 = WSubId_66(__ARG_4, self, WSubId_91)
    setattribute self, 'bases', $P9
.annotate 'line', 11132
    $P3 = __ARG_4.'get'()
  __label_1: # endif
.annotate 'line', 11134
    WSubId_28('{', $P3)
.annotate 'line', 11136
    getattribute $P8, self, 'classns'
    $P7 = $P8.'fullname'()
    WSubId_139(self, '__CLASS__', $P7)
.annotate 'line', 11138
    $P3 = __ARG_4.'get'()
  __label_4: # for condition
    $P7 = $P3.'isop'('}')
    isfalse $I1, $P7
    unless $I1 goto __label_3
.annotate 'line', 11139
    $P8 = $P3.'checkkeyword'()
    set $S1, $P8
    if $S1 == 'function' goto __label_7
    if $S1 == 'var' goto __label_8
    if $S1 == 'const' goto __label_9
    goto __label_5
  __label_7: # case
.annotate 'line', 11141
    new $P9, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P9.'MethodStatement'($P3, __ARG_4, self)
    set $P4, $P9
.annotate 'line', 11142
    self.'addmethod'($P4)
.annotate 'line', 11143
    push $P1, $P4
    goto __label_6 # break
  __label_8: # case
.annotate 'line', 11146
    $P5 = __ARG_4.'get'()
.annotate 'line', 11147
    $P10 = $P5.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 11148
    WSubId_69("member identifier", $P5)
  __label_10: # endif
.annotate 'line', 11149
    push $P2, $P5
.annotate 'line', 11150
    $P3 = __ARG_4.'get'()
.annotate 'line', 11151
    $P11 = $P3.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 11152
    WSubId_69("';' in member declaration", $P3)
  __label_11: # endif
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 11155
    $P6 = WSubId_73($P3, __ARG_4, self)
.annotate 'line', 11156
    push $P1, $P6
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 11159
    WSubId_70("item in class", $P3)
  __label_6: # switch end
  __label_2: # for iteration
.annotate 'line', 11138
    $P3 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 11162

.end # ClassStatement


.sub 'addmethod' :method
        .param pmc __ARG_1
.annotate 'line', 11166
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 11167

.end # addmethod


.sub 'generatesubid' :method
.annotate 'line', 11170
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 11171

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 11174
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 11175

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 11178
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 11179

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 11182
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
.annotate 'line', 11183

.end # use_builtin


.sub 'optimize' :method
.annotate 'line', 11186
    getattribute $P1, self, 'items'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 11187
    .return(self)
.annotate 'line', 11188

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 11191
    getattribute $P8, self, 'classns'
    $P8.'emitnamespace'(__ARG_1)
.annotate 'line', 11192
    set $P3, __ARG_1
    getattribute $P4, self, 'items'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2202
    set $P5, $P4
    $P8 = WSubId_5("emit")
    $P6 = WSubId_3($P8, $P3)
.annotate 'line', 65
    if_null $P5, __label_4
    iter $P9, $P5
    set $P9, 0
  __label_3: # for iteration
    unless $P9 goto __label_4
    shift $P7, $P9
.annotate 'line', 66
    $P6($P7)
    goto __label_3
  __label_4: # endfor
  __label_2:
  __label_1:
.annotate 'line', 11194
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 11196
    $P8 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P8)
.annotate 'line', 11197
    set $I1, 1
.annotate 'line', 11198
    getattribute $P8, self, 'bases'
    if_null $P8, __label_6
    iter $P10, $P8
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P1, $P10
.annotate 'line', 11199
    $P1.'annotate'(__ARG_1)
.annotate 'line', 11200
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 11201
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 11202
    getattribute $P8, self, 'parent'
    $P1.'emit'(__ARG_1, $P8)
.annotate 'line', 11203
    __ARG_1.'say'()
.annotate 'line', 11204
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
    goto __label_5
  __label_6: # endfor
.annotate 'line', 11206
    getattribute $P8, self, 'members'
    if_null $P8, __label_8
    iter $P11, $P8
    set $P11, 0
  __label_7: # for iteration
    unless $P11 goto __label_8
    shift $P2, $P11
.annotate 'line', 11207
    __ARG_1.'annotate'($P2)
.annotate 'line', 11208
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
    goto __label_7
  __label_8: # endfor
.annotate 'line', 11211
    __ARG_1.'say'('.end')
.annotate 'line', 11212

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 11109
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 11111
    addattribute $P0, 'parent'
.annotate 'line', 11112
    addattribute $P0, 'bases'
.annotate 'line', 11113
    addattribute $P0, 'constants'
.annotate 'line', 11114
    addattribute $P0, 'items'
.annotate 'line', 11115
    addattribute $P0, 'members'
.annotate 'line', 11116
    addattribute $P0, 'funcont'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11219
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11220

.end # DeclareClassStatement


.sub 'optimize' :method
.annotate 'line', 11223
    .return(self)
.annotate 'line', 11224

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 11215
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_142')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11232
    $P1 = __ARG_2.'get'()
.annotate 'line', 11233
    $P2 = __ARG_2.'get'()
.annotate 'line', 11234
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 11235
    null $P4
  __label_3: # for condition
.annotate 'line', 11237
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 11238
    $P3.'push'($P1)
.annotate 'line', 11239
    $P1 = __ARG_2.'get'()
  __label_1: # for iteration
.annotate 'line', 11237
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 11242
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 11243
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 11244
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 11245
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
    goto __label_5
  __label_4: # else
.annotate 'line', 11248
    __ARG_2.'unget'($P2)
.annotate 'line', 11249
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 11250
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 11251
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
  __label_5: # endif
.annotate 'line', 11253

.end # parseClass


.sub 'open_include' :subid('WSubId_141')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 11264
    getinterp $P1
.annotate 'line', 11267
    $P2 = $P1[9]
.annotate 'line', 11268
    $P3 = $P2[0]
.annotate 'line', 11269
    null $P4
.annotate 'line', 11270
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
.annotate 'line', 11271
    concat $S2, $S1, __ARG_1
.annotate 'line', 11272
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
.annotate 'line', 11273
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 11274
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 11275
    pop_eh
    goto __label_4
  __label_3:
.annotate 'line', 11272
    .get_results($P7)
    finalize $P7
    pop_eh
  __label_4:
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11280
    isnull $I1, $P4
    box $P6, $I1
    if $P6 goto __label_8
    $P6 = $P4.'is_closed'()
  __label_8:
    if_null $P6, __label_7
    unless $P6 goto __label_7
.annotate 'line', 11281
    WSubId_25('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 11282
    $P4.'encoding'("utf8")
.annotate 'line', 11283
    .return($P4)
.annotate 'line', 11284

.end # open_include


.sub 'include_parrot' :subid('WSubId_144')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_141 = "WSubId_141"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 11288
    $P1 = __ARG_2.'get'()
.annotate 'line', 11289
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 11290
    WSubId_69('literal string', $P1)
  __label_1: # endif
.annotate 'line', 11291
    WSubId_83(';', __ARG_2)
.annotate 'line', 11293
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 11294
    $P2 = WSubId_141($S1, __ARG_1)
.annotate 'line', 11299
    $P4 = $P2.'readline'()
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
  __label_5: # for condition
    $P5 = $P2.'eof'()
    isfalse $I4, $P5
    unless $I4 goto __label_4
.annotate 'line', 11300
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
.annotate 'line', 11301
    set $I1, 12
.annotate 'line', 11302
    null $S3
  __label_9: # while
.annotate 'line', 11303
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 11304
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 11305
    set $I2, $I1
  __label_12: # while
.annotate 'line', 11306
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 11307
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 11308
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 11309
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 11311
    sub $I4, $I2, $I1
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 11312
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 11313
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 11314
    set $I1, $I2
  __label_22: # while
.annotate 'line', 11315
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 11316
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 11317
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 11318
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 11320
    sub $I4, $I2, $I1
    substr $S5, $S2, $I1, $I4
.annotate 'line', 11322
    null $I3
.annotate 'line', 11323
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 11324
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 11326
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 11327
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 11329
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 11328
    $P4 = WSubId_44(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
  __label_7: # endif
  __label_3: # for iteration
.annotate 'line', 11299
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 11333
    $P2.'close'()
.annotate 'line', 11334

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_145')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_141 = "WSubId_141"
.annotate 'line', 11340
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 11341
    WSubId_25("Must be used at root namespace level", __ARG_1)
  __label_1: # endif
.annotate 'line', 11342
    $P1 = __ARG_2.'get'()
.annotate 'line', 11343
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 11344
    WSubId_69('literal string', $P1)
  __label_2: # endif
.annotate 'line', 11345
    WSubId_83(';', __ARG_2)
.annotate 'line', 11347
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 11348
    $P2 = WSubId_141($S1, __ARG_1)
.annotate 'line', 11350
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P2, $S1, 0)
    set $P3, $P4
.annotate 'line', 11351
    __ARG_3.'parse'($P3)
.annotate 'line', 11353
    $P2.'close'()
.annotate 'line', 11354

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_143')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 11360
    $P1 = __ARG_2.'get'()
.annotate 'line', 11361
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 11362
    WSubId_87(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11363
    WSubId_83(';', __ARG_2)
.annotate 'line', 11364
    .return()
  __label_1: # endif
.annotate 'line', 11366
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
.annotate 'line', 11367
    __ARG_2.'unget'($P1)
.annotate 'line', 11368
    $P2 = WSubId_84(__ARG_2)
.annotate 'line', 11369
    elements $I1, $P2
.annotate 'line', 11370
    ge $I1, 1, __label_3
.annotate 'line', 11371
    WSubId_25('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 11372
    WSubId_83(';', __ARG_2)
.annotate 'line', 11373
    __ARG_3.'use'($P2)
.annotate 'line', 11374
    .return()
  __label_2: # endif
.annotate 'line', 11376
    $P1 = __ARG_2.'get'()
.annotate 'line', 11378
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 11385
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 11379
    __ARG_2.'warn'("using extern 'file'; is deprecated, use $loadlib instead.", $P1)
.annotate 'line', 11381
    null $S1
    if_null $P1, __label_8
    set $S1, $P1
  __label_8:
.annotate 'line', 11382
    __ARG_3.'addlib'($S1)
.annotate 'line', 11383
    WSubId_83(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 11386
    __ARG_2.'unget'($P1)
.annotate 'line', 11387
    $P3 = WSubId_84(__ARG_2)
.annotate 'line', 11388
    $P1 = __ARG_2.'get'()
.annotate 'line', 11389
    $P5 = $P1.'isop'(';')
    isfalse $I3, $P5
    unless $I3 goto __label_9
.annotate 'line', 11390
    __ARG_2.'unget'($P1)
.annotate 'line', 11391
    null $P5
    $P4 = WSubId_66(__ARG_2, $P5, WSubId_86, ';')
.annotate 'line', 11392
    __ARG_3.'addextern'($P3, $P4)
  __label_9: # endif
.annotate 'line', 11394
    join $S3, '/', $P3
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 11395
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 11398
    WSubId_69('string literal or identifier', $P1)
  __label_4: # switch end
.annotate 'line', 11400

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11410
    setattribute self, 'module', __ARG_1
.annotate 'line', 11411
    setattribute self, 'names', __ARG_2
.annotate 'line', 11412

.end # External


.sub 'emit' :subid('WSubId_15') :method
        .param pmc __ARG_1
.annotate 'line', 11413
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_16 = "WSubId_16"
.annotate 'line', 11417
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 11427
    getattribute $P4, self, 'module'
    join $S1, "'; '", $P4
    concat $S2, "['parrot'; '", $S1
    concat $S2, $S2, "']"
.annotate 'line', 11426
    __ARG_1.'emitget_root_namespace'("srcns", $S2)
.annotate 'line', 11429
    getattribute $P1, self, 'names'
.annotate 'line', 11430
    newclosure $P2, WSubId_16
.annotate 'line', 65
    if_null $P1, __label_3
    iter $P5, $P1
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
.annotate 'line', 66
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:
.annotate 'line', 11435
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
.annotate 'line', 11441

.end # emit


.sub '' :anon :subid('WSubId_16') :outer('WSubId_15')
        .param string __ARG_2
.annotate 'line', 11430
    find_lex $P1, '__WLEX_1'
.annotate 'line', 11432
    $P1.'say'("    push symbols, '", __ARG_2, "'")
.annotate 'line', 11433

.end # WSubId_16

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 11406
    addattribute $P0, 'module'
.annotate 'line', 11407
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
.annotate 'line', 11451
    new $P1, ['ResizableStringArray']
.annotate 'line', 11452
    unless __ARG_2 goto __label_1
.annotate 'line', 11453
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 11455
    if_null __ARG_1, __label_3
.annotate 'line', 11456
    push $P1, __ARG_1
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 11458
    setattribute self, 'path', $P1
.annotate 'line', 11459

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
.annotate 'line', 11462
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 11463
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 11464
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 11465
    push $P2, __ARG_1
.annotate 'line', 11466
    setattribute $P1, 'path', $P2
.annotate 'line', 11467
    .return($P1)
.annotate 'line', 11468

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
.annotate 'line', 11471
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 11472
    getattribute $P2, self, 'hll'
.annotate 'line', 11473
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 11474
    unless_null $P2, __label_3
.annotate 'line', 11475
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 11477
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
.annotate 'line', 11478

.end # samehllas


.sub 'fullname' :method
.annotate 'line', 11481
    getattribute $P1, self, 'path'
    join $S1, '.', $P1
.annotate 'line', 11482
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
.annotate 'line', 11483
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11485
    .return($S1)
  __label_2: # endif
.annotate 'line', 11486

.end # fullname


.sub 'getparrotkey' :method
.annotate 'line', 11489
    getattribute $P1, self, 'path'
.annotate 'line', 11490
    null $S1
.annotate 'line', 11491
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 11492
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 11493
    .return($S1)
.annotate 'line', 11494

.end # getparrotkey


.sub 'getparrotrootkey' :method
.annotate 'line', 11497
    getattribute $P1, self, 'path'
.annotate 'line', 11498
    getattribute $P2, self, 'hll'
.annotate 'line', 11499
    set $S1, "[ '"
.annotate 'line', 11500
    if_null $P2, __label_1
    set $S3, $P2
.annotate 'line', 11503
    downcase $S2, $S3
    concat $S1, $S1, $S2
    goto __label_2
  __label_1: # else
.annotate 'line', 11506
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 11507
    concat $S1, $S1, "'"
.annotate 'line', 11508
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 11509
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 11510
    concat $S1, $S1, " ]"
.annotate 'line', 11511
    .return($S1)
.annotate 'line', 11512

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
.annotate 'line', 11515
    getattribute $P1, self, 'path'
.annotate 'line', 11516
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 11517
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 11518
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 11519
    __ARG_1.'say'("]")
.annotate 'line', 11520

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 11523
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11525
    $P3 = self.'getparrotkey'()
.annotate 'line', 11524
    $P2 = WSubId_45("    new %0, %1", __ARG_3, $P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11528
    $P5 = self.'getparrotrootkey'()
.annotate 'line', 11527
    $P4 = WSubId_45("    root_new %0, %1", __ARG_3, $P5)
    __ARG_1.'print'($P4)
  __label_2: # endif
.annotate 'line', 11529
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 11530
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 11531
    __ARG_1.'say'()
.annotate 'line', 11532

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 11535
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11536
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11538
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
.annotate 'line', 11539

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 11542
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 11544
    $P5 = self.'getparrotkey'()
.annotate 'line', 11543
    $P4 = WSubId_45("    get_class %0, %1", __ARG_3, $P5)
    __ARG_1.'say'($P4)
    goto __label_2
  __label_1: # else
.annotate 'line', 11549
    getattribute $P1, self, 'hll'
.annotate 'line', 11550
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 11551
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 11552
    if_null $P1, __label_5
    set $S3, $P1
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 11553
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 11556
    join $S3, "'; '", $P2
.annotate 'line', 11554
    $P3 = WSubId_45("    get_root_global %0, ['%1'; '%2'], '%3'", __ARG_3, $S2, $S3, $S1)
    __ARG_1.'say'($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 11558
    $P4 = WSubId_45("    get_root_global %0, ['%1'], '%2'", __ARG_3, $S2, $S1)
    __ARG_1.'say'($P4)
  __label_7: # endif
.annotate 'line', 11561
    $P3 = WSubId_45("    get_class %0, %0", __ARG_3)
    __ARG_1.'say'($P3)
  __label_2: # endif
.annotate 'line', 11563

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 11566
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11567
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11569
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
.annotate 'line', 11570

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 11446
    addattribute $P0, 'hll'
.annotate 'line', 11447
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_139 = "WSubId_139"
.annotate 'line', 11589
    self.'VarContainer'()
.annotate 'line', 11590
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 11591
    unless_null __ARG_2, __label_1
.annotate 'line', 11592
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 11593
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 11594
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 11595
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P2.'FunctionContainer'()
    set $P2, $P2
    setattribute self, 'funcont', $P2
.annotate 'line', 11596
    $P1 = __ARG_1.'fullname'()
    WSubId_139(self, '__NAMESPACE__', $P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 11599
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 11600
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 11601
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 11602
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 11603
    getattribute $P2, __ARG_2, 'funcont'
    setattribute self, 'funcont', $P2
  __label_2: # endif
.annotate 'line', 11605
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
.annotate 'line', 11606

.end # NamespaceBase


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 11609
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 11610

.end # addfunction


.sub 'fixnamespaces' :subid('WSubId_17') :method
.annotate 'line', 11611
.lex '__WLEX_1', $P1
.const 'Sub' WSubId_5 = "WSubId_5"
.const 'Sub' WSubId_7 = "WSubId_7"
.const 'Sub' WSubId_18 = "WSubId_18"
.annotate 'line', 11613
    getattribute $P2, self, 'namespaces'
    $P3 = WSubId_5("fixnamespaces")
.annotate 'line', 65
    if_null $P2, __label_3
    iter $P8, $P2
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P4, $P8
.annotate 'line', 66
    $P3($P4)
    goto __label_2
  __label_3: # endfor
  __label_1:
.annotate 'line', 11614
    $P1 = WSubId_7(self, "usenamespace")
.annotate 'line', 11615
    getattribute $P5, self, 'usednamespaces'
.annotate 'line', 11616
    newclosure $P6, WSubId_18
.annotate 'line', 65
    if_null $P5, __label_6
    iter $P9, $P5
    set $P9, 0
  __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P7, $P9
.annotate 'line', 66
    $P6($P7)
    goto __label_5
  __label_6: # endfor
  __label_4:
.annotate 'line', 11617

.end # fixnamespaces


.sub '' :anon :subid('WSubId_18') :outer('WSubId_17')
        .param pmc __ARG_1
.annotate 'line', 11616
    find_lex $P1, '__WLEX_1'
    getattribute $P2, __ARG_1, 'usednamespaces'
    set $P3, $P1
.annotate 'line', 65
    if_null $P2, __label_3
    iter $P5, $P2
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P4, $P5
.annotate 'line', 66
    $P3($P4)
    goto __label_2
  __label_3: # endfor
  __label_1:
.annotate 'line', 11616

.end # WSubId_18


.sub 'getpath' :method
.annotate 'line', 11620
    getattribute $P1, self, 'nspath'
    .return($P1)
.annotate 'line', 11621

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 11624
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 11625
    .return()
  __label_1: # endif
.annotate 'line', 11626
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 11627
    set $P2, $P1
    set $P3, __ARG_1
.annotate 'line', 78
    if_null $P2, __label_5
    iter $P6, $P2
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P4, $P6
.annotate 'line', 79
    ne_addr $P4, $P3, __label_6
.annotate 'line', 80
    set $P5, $P4
    goto __label_3
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
.annotate 'line', 81
    null $P5
    goto __label_3
  __label_3:
    set $P7, $P5
.annotate 'line', 11627
    if_null $P7, __label_2
.annotate 'line', 11628
    .return()
  __label_2: # endif
.annotate 'line', 11629
    push $P1, __ARG_1
.annotate 'line', 11630

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
.annotate 'line', 11633
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 11634
    if_null $P1, __label_1
.annotate 'line', 11635
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 11636
    self.'addfunction'($P1)
  __label_3: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 11639
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 11640
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 11641
    if_null $P2, __label_5
.annotate 'line', 11642
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 11643
    if_null $P1, __label_6
.annotate 'line', 11644
    self.'createvarused'($S1, $P1)
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif
.annotate 'line', 11647

.end # use


.sub 'getusedns' :subid('WSubId_19') :method
        .param string __ARG_1
.annotate 'line', 11648
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_20 = "WSubId_20"
.annotate 'line', 11650
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 11651
    newclosure $P2, WSubId_20
.annotate 'line', 86
    if_null $P1, __label_3
    iter $P5, $P1
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
.annotate 'line', 87
    $P6 = $P2($P3)
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 88
    set $P4, $P3
    goto __label_1
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 89
    null $P4
    goto __label_1
  __label_1:
    set $P6, $P4
.annotate 'line', 11650
    .return($P6)
.annotate 'line', 11652

.end # getusedns


.sub '' :anon :subid('WSubId_20') :outer('WSubId_19')
        .param pmc __ARG_2
.annotate 'line', 11651
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_20


.sub 'getlocalns' :subid('WSubId_21') :method
        .param string __ARG_1
.annotate 'line', 11653
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
.annotate 'line', 11655
    getattribute $P2, self, 'namespaces'
.annotate 'line', 11656
    newclosure $P3, WSubId_22
.annotate 'line', 86
    if_null $P2, __label_3
    iter $P5, $P2
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P4, $P5
.annotate 'line', 87
    $P6 = $P3($P4)
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 88
    set $P1, $P4
    goto __label_1
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 89
    null $P1
    goto __label_1
  __label_1:
.annotate 'line', 11657
    if_null $P1, __label_5
.annotate 'line', 11658
    .return($P1)
  __label_5: # endif
.annotate 'line', 11659
    .tailcall self.'getusedns'(__ARG_1)
.annotate 'line', 11660

.end # getlocalns


.sub '' :anon :subid('WSubId_22') :outer('WSubId_21')
        .param pmc __ARG_2
.annotate 'line', 11656
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_22


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11664
    new $P3, [ 'Winxed'; 'Compiler'; 'External' ]
    $P3.'External'(__ARG_1, __ARG_2)
    set $P1, $P3
.annotate 'line', 11665
    getattribute $P2, self, 'externals'
.annotate 'line', 11666
    unless_null $P2, __label_1
.annotate 'line', 11667
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 11669
    push $P2, $P1
  __label_2: # endif
.annotate 'line', 11670

.end # addextern


.sub 'checkclass_base' :subid('WSubId_23') :method
        .param string __ARG_1
.annotate 'line', 11672
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_24 = "WSubId_24"
.annotate 'line', 11674
    getattribute $P3, self, 'classes'
.annotate 'line', 11675
    newclosure $P4, WSubId_24
.annotate 'line', 86
    if_null $P3, __label_3
    iter $P6, $P3
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P5, $P6
.annotate 'line', 87
    $P7 = $P4($P5)
    if_null $P7, __label_4
    unless $P7 goto __label_4
.annotate 'line', 88
    set $P1, $P5
    goto __label_1
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 89
    null $P1
    goto __label_1
  __label_1:
.annotate 'line', 11676
    if_null $P1, __label_5
.annotate 'line', 11677
    .return($P1)
  __label_5: # endif
.annotate 'line', 11678
    getattribute $P7, self, 'usednamespaces'
    if_null $P7, __label_7
    iter $P8, $P7
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P2, $P8
.annotate 'line', 11679
    $P1 = $P2.'checkclass_base'(__ARG_1)
    if_null $P1, __label_8
.annotate 'line', 11680
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    null $P7
.annotate 'line', 11681
    .return($P7)
.annotate 'line', 11682

.end # checkclass_base


.sub '' :anon :subid('WSubId_24') :outer('WSubId_23')
        .param pmc __ARG_2
.annotate 'line', 11675
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_24


.sub 'findsymbolbyname' :method
        .param string __ARG_1
.annotate 'line', 11685
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 11686
    if_null $P1, __label_1
.annotate 'line', 11687
    .return($P1)
  __label_1: # endif
.annotate 'line', 11688
    getattribute $P2, self, 'funcont'
.annotate 'line', 11689
    .tailcall $P2.'find'(__ARG_1)
.annotate 'line', 11690

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
.annotate 'line', 11695
    elements $I1, __ARG_1
.annotate 'line', 11696
    null $S1
.annotate 'line', 11697
    null $P1
.annotate 'line', 11698
    null $P2
    sub $I2, $I1, __ARG_3
    if $I2 == 0 goto __label_3
    if $I2 == 1 goto __label_4
    goto __label_1
  __label_3: # case
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 11703
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
    if __ARG_2 == 1 goto __label_7
    if __ARG_2 == 2 goto __label_8
    goto __label_5
  __label_7: # case
.annotate 'line', 11706
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 11708
    .tailcall self.'checkclass_base'($S1)
  __label_5: # default
.annotate 'line', 11711
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 11712
    .return($P1)
  __label_9: # endif
.annotate 'line', 11713
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 11714
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 11715
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_6: # switch end
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 11722
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 11723
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 11724
    isnull $I6, $P2
    not $I6
    unless $I6 goto __label_14
.annotate 'line', 11725
    add $I7, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I7)
    isnull $I6, $P1
    not $I6
  __label_14:
    unless $I6 goto __label_13
.annotate 'line', 11726
    .return($P1)
  __label_13: # endif
.annotate 'line', 11727
    $P2 = self.'getusedns'($S1)
.annotate 'line', 11728
    isnull $I8, $P2
    not $I8
    unless $I8 goto __label_16
.annotate 'line', 11729
    add $I9, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I9)
    isnull $I8, $P1
    not $I8
  __label_16:
    unless $I8 goto __label_15
.annotate 'line', 11730
    .return($P1)
  __label_15: # endif
  __label_2: # switch end
    null $P3
.annotate 'line', 11732
    .return($P3)
.annotate 'line', 11733

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 11736
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P3
    $P2.'NamespaceStatement'(self, __ARG_1, $P3, __ARG_2, $P3)
    set $P1, $P2
.annotate 'line', 11737
    getattribute $P2, self, 'namespaces'
    push $P2, $P1
.annotate 'line', 11738
    .return($P1)
.annotate 'line', 11739

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11742
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 11743
    new $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
    set $P2, $P3
.annotate 'line', 11744
    getattribute $P3, self, 'namespaces'
    push $P3, $P2
.annotate 'line', 11745
    getattribute $P3, self, 'items'
    push $P3, $P2
.annotate 'line', 11746
    .return($P2)
.annotate 'line', 11747

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
.annotate 'line', 11750
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 11751

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
.annotate 'line', 11754
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 11755
    getattribute $P1, self, 'items'
    push $P1, __ARG_1
.annotate 'line', 11756

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 11759
    $P1 = __ARG_2.'get'()
.annotate 'line', 11760
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 11761
    $P1 = __ARG_2.'get'()
.annotate 'line', 11763
    set $P2, self
  __label_4: # for condition
.annotate 'line', 11764
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 11765
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 11766
    $P5 = __ARG_2.'get'()
    set $S1, $P5
  __label_2: # for iteration
.annotate 'line', 11764
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 11769
    null $P3
.annotate 'line', 11770
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 11771
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 11772
    $P1 = __ARG_2.'get'()
  __label_5: # endif
.annotate 'line', 11775
    WSubId_28('{', $P1)
.annotate 'line', 11776
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 11777
    $P4.'parse'(__ARG_2)
.annotate 'line', 11778

.end # parsenamespace


.sub 'parseextern' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_123 = "WSubId_123"
.const 'Sub' WSubId_83 = "WSubId_83"
.annotate 'line', 11783
    $P1 = __ARG_1.'get'()
.annotate 'line', 11784
    $P3 = $P1.'iskeyword'('function')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 11785
    WSubId_25('Unsupported extern', $P1)
  __label_1: # endif
.annotate 'line', 11786
    $P1 = __ARG_1.'get'()
.annotate 'line', 11787
    WSubId_123($P1)
.annotate 'line', 11788
    WSubId_83(';', __ARG_1)
.annotate 'line', 11789
    new $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P3.'FunctionExtern'($P1, self)
    set $P2, $P3
.annotate 'line', 11790
    self.'addfunction'($P2)
.annotate 'line', 11791

.end # parseextern


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_142 = "WSubId_142"
.const 'Sub' WSubId_143 = "WSubId_143"
.const 'Sub' WSubId_144 = "WSubId_144"
.const 'Sub' WSubId_145 = "WSubId_145"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 11794
    getattribute $P1, self, 'items'
.annotate 'line', 11795
    null $P2
.annotate 'line', 11796
    $P2 = __ARG_1.'get'()
  __label_3: # for condition
    $P6 = $P2.'iseof'()
    if $P6 goto __label_4
    $P6 = $P2.'isop'('}')
  __label_4:
    isfalse $I1, $P6
    unless $I1 goto __label_2
.annotate 'line', 11798
    $P7 = $P2.'checkkeyword'()
    set $S2, $P7
    if $S2 == 'namespace' goto __label_7
    if $S2 == 'const' goto __label_8
    if $S2 == 'function' goto __label_9
    if $S2 == 'inline' goto __label_10
    if $S2 == 'class' goto __label_11
    if $S2 == 'extern' goto __label_12
    if $S2 == 'using' goto __label_13
    if $S2 == '$include_const' goto __label_14
    if $S2 == '$include' goto __label_15
    if $S2 == '$load' goto __label_16
    if $S2 == '$loadlib' goto __label_17
    goto __label_5
  __label_7: # case
.annotate 'line', 11800
    self.'parsenamespace'($P2, __ARG_1)
    goto __label_6 # break
  __label_8: # case
.annotate 'line', 11803
    $P3 = WSubId_73($P2, __ARG_1, self)
.annotate 'line', 11804
    push $P1, $P3
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 11807
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P8.'FunctionStatement'($P2, __ARG_1, self)
    set $P4, $P8
.annotate 'line', 11808
    getattribute $P9, $P4, 'name'
    null $S1
    if_null $P9, __label_18
    set $S1, $P9
  __label_18:
.annotate 'line', 11809
    self.'addfunction'($P4)
.annotate 'line', 11810
    push $P1, $P4
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 11813
    new $P10, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    $P10.'InlineStatement'($P2, __ARG_1, self)
    set $P5, $P10
.annotate 'line', 11814
    self.'addfunction'($P5)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 11817
    WSubId_142($P2, __ARG_1, self)
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 11820
    self.'parseextern'(__ARG_1)
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 11823
    WSubId_143($P2, __ARG_1, self)
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 11826
    WSubId_144($P2, __ARG_1, self)
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 11829
    WSubId_145($P2, __ARG_1, self)
    goto __label_6 # break
  __label_16: # case
.annotate 'line', 11832
    $P2 = __ARG_1.'get'()
.annotate 'line', 11833
    $P11 = $P2.'isstring'()
    isfalse $I2, $P11
    unless $I2 goto __label_19
.annotate 'line', 11834
    WSubId_69('string literal', $P2)
  __label_19: # endif
.annotate 'line', 11835
    WSubId_83(';', __ARG_1)
.annotate 'line', 11836
    new $P14, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P14.'StringLiteral'(self, $P2)
    set $P13, $P14
    $P12 = $P13.'getPirString'()
    self.'addload'($P12)
    goto __label_6 # break
  __label_17: # case
.annotate 'line', 11839
    $P2 = __ARG_1.'get'()
.annotate 'line', 11840
    $P15 = $P2.'isstring'()
    isfalse $I3, $P15
    unless $I3 goto __label_20
.annotate 'line', 11841
    WSubId_69('string literal', $P2)
  __label_20: # endif
.annotate 'line', 11842
    WSubId_83(';', __ARG_1)
.annotate 'line', 11843
    new $P18, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P2)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addlib'($P16)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 11846
    WSubId_70("token", $P2)
  __label_6: # switch end
  __label_1: # for iteration
.annotate 'line', 11796
    $P2 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 11849
    $P6 = $P2.'iseof'()
    if_null $P6, __label_21
    unless $P6 goto __label_21
.annotate 'line', 11850
    self.'unclosed_ns'()
    goto __label_22
  __label_21: # else
.annotate 'line', 11852
    self.'close_ns'($P2)
  __label_22: # endif
.annotate 'line', 11853

.end # parse


.sub 'optimize_base' :method
.annotate 'line', 11856
    getattribute $P1, self, 'items'
.annotate 'line', 2195
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2196
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2197
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2196
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 11857

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.annotate 'line', 11860
    $P1 = self.'getpath'()
.annotate 'line', 11862
    set $I1, 1
.annotate 'line', 11864
    getattribute $P2, self, 'externals'
.annotate 'line', 11865
    if_null $P2, __label_1
.annotate 'line', 11866
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 11867
    null $I1
.annotate 'line', 11868
    set $P4, __ARG_1
    set $P5, $P2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2202
    set $P6, $P5
    $P9 = WSubId_5("emit")
    $P7 = WSubId_3($P9, $P4)
.annotate 'line', 65
    if_null $P6, __label_5
    iter $P10, $P6
    set $P10, 0
  __label_4: # for iteration
    unless $P10 goto __label_5
    shift $P8, $P10
.annotate 'line', 66
    $P7($P8)
    goto __label_4
  __label_5: # endfor
  __label_3:
  __label_2:
  __label_1: # endif
.annotate 'line', 11871
    getattribute $P9, self, 'items'
    if_null $P9, __label_7
    iter $P11, $P9
    set $P11, 0
  __label_6: # for iteration
    unless $P11 goto __label_7
    shift $P3, $P11
.annotate 'line', 11872
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_10
.annotate 'line', 11873
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 11874
    set $I1, 1
    goto __label_9
  __label_8: # else
.annotate 'line', 11876
    unless $I1 goto __label_11
.annotate 'line', 11877
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 11878
    null $I1
  __label_11: # endif
  __label_9: # endif
.annotate 'line', 11880
    $P3.'emit'(__ARG_1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 11882

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 11577
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 11579
    addattribute $P0, 'nspath'
.annotate 'line', 11580
    addattribute $P0, 'externals'
.annotate 'line', 11581
    addattribute $P0, 'namespaces'
.annotate 'line', 11582
    addattribute $P0, 'classes'
.annotate 'line', 11583
    addattribute $P0, 'funcont'
.annotate 'line', 11584
    addattribute $P0, 'items'
.annotate 'line', 11585
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 11900
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 11901
    null $I1
.annotate 'line', 11902
    if_null __ARG_5, __label_1
.annotate 'line', 11903
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 11904
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 11905
    set $I1, 1
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 11908
    unless $I1 goto __label_4
.annotate 'line', 11909
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 11910
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 11911
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 11913
    setattribute self, 'parent', __ARG_1
.annotate 'line', 11914
    setattribute self, 'start', __ARG_2
.annotate 'line', 11915
    setattribute self, 'owner', __ARG_1
.annotate 'line', 11916
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 11917

.end # NamespaceStatement


.sub 'dowarnings' :method
.annotate 'line', 11920
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 11921

.end # dowarnings


.sub 'generatesubid' :method
.annotate 'line', 11924
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 11925

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 11928
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 11929

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 11932
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
.annotate 'line', 11933

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 11936
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
.annotate 'line', 11937

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 11940
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 11941
    unless_null $P1, __label_1
.annotate 'line', 11942
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 11943
    .return($P1)
.annotate 'line', 11944

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 11947
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11948
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 11949
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 11950
    .return($P1)
.annotate 'line', 11951

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 11954
    getattribute $P1, self, 'start'
    WSubId_25('unclosed namespace', $P1)
.annotate 'line', 11955

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1

.end # close_ns


.sub 'optimize' :method
.annotate 'line', 11962
    getattribute $P1, self, 'modifier'
.annotate 'line', 11963
    if_null $P1, __label_1
.annotate 'line', 11964
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 11965
    self.'optimize_base'()
.annotate 'line', 11966
    .return(self)
.annotate 'line', 11967

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 11970
    getattribute $P1, self, 'hll'
.annotate 'line', 11971
    if_null $P1, __label_1
.annotate 'line', 11972
    $P2 = WSubId_45(".HLL '%0'", $P1)
    __ARG_1.'say'($P2)
  __label_1: # endif
.annotate 'line', 11974
    self.'emit_base'(__ARG_1)
.annotate 'line', 11976
    if_null $P1, __label_2
.annotate 'line', 11977
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
.annotate 'line', 11978

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 11889
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 11891
    addattribute $P0, 'parent'
.annotate 'line', 11892
    addattribute $P0, 'start'
.annotate 'line', 11893
    addattribute $P0, 'name'
.annotate 'line', 11894
    addattribute $P0, 'modifier'
.annotate 'line', 11895
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
.annotate 'line', 11995
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 11996
    setattribute self, 'unit', __ARG_1
.annotate 'line', 11997
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 11998
    box $P1, 0
    setattribute self, 'subidgen', $P1
.annotate 'line', 11999

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 12002
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 12003
    $P1[__ARG_1] = 1
.annotate 'line', 12004

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 12008
    getattribute $P1, self, 'subidgen'
    inc $P1
    set $I1, $P1
.annotate 'line', 12009
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
.annotate 'line', 12010

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 12014
    getattribute $P1, self, 'libs'
.annotate 'line', 12015
    unless_null $P1, __label_1
.annotate 'line', 12016
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 12017
    $P1[__ARG_1] = 1
.annotate 'line', 12018

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 12021
    getattribute $P1, self, 'loads'
.annotate 'line', 12022
    unless_null $P1, __label_1
.annotate 'line', 12023
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 12024
    $P1[__ARG_1] = 1
.annotate 'line', 12025

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 12028
    .tailcall self.'checkclass_base'(__ARG_1)
.annotate 'line', 12029

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 12032
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 12033

.end # scopesearch


.sub 'unclosed_ns' :method

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 12040
    WSubId_25('Cannot close root namespace', __ARG_1)
.annotate 'line', 12041

.end # close_ns


.sub 'dowarnings' :method
.annotate 'line', 12044
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 12045

.end # dowarnings


.sub 'optimize' :method
.annotate 'line', 12048
    self.'optimize_base'()
.annotate 'line', 12049
    .return(self)
.annotate 'line', 12050

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 12053
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 12056
    $P12 = $P1['chomp']
    if_null $P12, __label_1
.annotate 'line', 12057
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 12061
    split $P12, " ", "acos asin atan cos exp ln sin tan pow"
    if_null $P12, __label_3
    iter $P13, $P12
    set $P13, 0
  __label_2: # for iteration
    unless $P13 goto __label_3
    shift $S1, $P13
.annotate 'line', 12062
    $P14 = $P1[$S1]
    if_null $P14, __label_4
.annotate 'line', 12063
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 12067
    getattribute $P2, self, 'libs'
.annotate 'line', 12068
    if_null $P2, __label_5
.annotate 'line', 12069
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_9(".loadlib ")
.annotate 'line', 71
    if_null $P4, __label_8
    iter $P16, $P4
    set $P16, 0
  __label_7: # for iteration
    unless $P16 goto __label_8
    shift $P7, $P16
.annotate 'line', 72
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_7
  __label_8: # endfor
.annotate 'line', 73
    set $P15, $P5
    goto __label_6
  __label_6:
    set $P12, $P15
.annotate 'line', 12069
    join $S2, "\n", $P12
    __ARG_1.'say'($S2)
  __label_5: # endif
.annotate 'line', 12071
    getattribute $P3, self, 'loads'
.annotate 'line', 12072
    if_null $P3, __label_9
.annotate 'line', 12079
    set $P8, $P3
    root_new $P9, ['parrot';'ResizablePMCArray']
.annotate 'line', 12080
    $P10 = WSubId_9('    load_bytecode ')
.annotate 'line', 71
    if_null $P8, __label_12
    iter $P18, $P8
    set $P18, 0
  __label_11: # for iteration
    unless $P18 goto __label_12
    shift $P11, $P18
.annotate 'line', 72
    $P14 = $P10($P11)
    push $P9, $P14
    goto __label_11
  __label_12: # endfor
.annotate 'line', 73
    set $P17, $P9
    goto __label_10
  __label_10:
    set $P12, $P17
.annotate 'line', 12079
    join $S2, "\n", $P12
.annotate 'line', 12073
    $P12 = WSubId_45(".sub initial_load_bytecode :anon :load :init\n%0\n.end\n", $S2)
    __ARG_1.'say'($P12)
  __label_9: # endif
.annotate 'line', 12082
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_14
    isnull $I1, $P3
    not $I1
  __label_14:
    unless $I1 goto __label_13
.annotate 'line', 12083
    __ARG_1.'comment'('end libs')
  __label_13: # endif
.annotate 'line', 12085
    self.'emit_base'(__ARG_1)
.annotate 'line', 12086

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 12089
    getattribute $P1, self, 'locals'
.annotate 'line', 12090
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
.annotate 'line', 12091
    $P2 = $P1[$S1]
.annotate 'line', 12092
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 12093
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 12094
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 12096
    $P3 = $P2.'getvalue'()
.annotate 'line', 12097
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 12099

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 11985
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 11987
    addattribute $P0, 'unit'
.annotate 'line', 11988
    addattribute $P0, 'bultins_used'
.annotate 'line', 11989
    addattribute $P0, 'libs'
.annotate 'line', 11990
    addattribute $P0, 'loads'
.annotate 'line', 11991
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 12111
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 12112
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
.annotate 'line', 12113

.end # Builtin


.sub 'getname' :method
.annotate 'line', 12114
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
.annotate 'line', 12117
    getattribute $P1, self, 'variants'
    push $P1, __ARG_1
.annotate 'line', 12118

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 12107
    addattribute $P0, 'name'
.annotate 'line', 12108
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
.annotate 'line', 12128
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
.annotate 'line', 12129

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 12132
    getattribute $P1, self, 'entries'
.annotate 'line', 12133
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 12134
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 12135
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 12137
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
.annotate 'line', 12138

.end # add


.sub 'put' :method
        .param pmc __ARG_1
.annotate 'line', 12141
    getattribute $P1, self, 'entries'
.annotate 'line', 12142
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 12143
    $P3 = $P1[$S1]
    __ARG_1.'addfunction'($P3)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 12144

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 12125
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_146 = "WSubId_146"
.const 'Sub' WSubId_139 = "WSubId_139"
.const 'Sub' WSubId_147 = "WSubId_147"
.annotate 'line', 12154
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 12155
    new $P4, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P4.'RootNamespace'(self)
    set $P1, $P4
.annotate 'line', 12159
    WSubId_146($P1, 'false', 0)
.annotate 'line', 12160
    WSubId_146($P1, 'true', 1)
.annotate 'line', 12165
    WSubId_139($P1, '__STAGE__', "4")
.annotate 'line', 12168
    WSubId_146($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 12171
    WSubId_146($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 12174
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 12176
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
    set $P3, $P3
.annotate 'line', 12177
    WSubId_147($P3)
.annotate 'line', 12178
    $P3.'put'($P2)
.annotate 'line', 12180
    $P1.'usenamespace'($P2)
.annotate 'line', 12182
    setattribute self, 'rootns', $P1
.annotate 'line', 12183

.end # WinxedCompileUnit


.sub 'dowarnings' :method
.annotate 'line', 12186
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
.annotate 'line', 12187

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 12190
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 12191
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
.annotate 'line', 12192

.end # parse


.sub 'optimize' :method
.annotate 'line', 12195
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
.annotate 'line', 12196

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 12199
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 12200
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 12201
    __ARG_1.'say'('')
.annotate 'line', 12203
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 12205
    __ARG_1.'comment'('End generated code')
.annotate 'line', 12206

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 12209
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 12210
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 12212
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 12214
    __ARG_1.'comment'('End')
.annotate 'line', 12215

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 12149
    addattribute $P0, 'rootns'
.annotate 'line', 12150
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
.annotate 'line', 12224
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 5
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 12225
    .return($P1)
.annotate 'line', 12226

.end # version


.sub 'version_string' :method
.annotate 'line', 12229
    $P1 = self.'version'()
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
.annotate 'line', 12230

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
        .param int __ARG_6
.annotate 'line', 12233
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 12234
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 12235
    null $P1
.annotate 'line', 12236
    unless_null __ARG_3, __label_2
.annotate 'line', 12237
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12238
    $P1.'open'('__eval__', 'w')
    goto __label_3
  __label_2: # else
.annotate 'line', 12241
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 12242
    new $P5, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P5.'Emit'($P1, __ARG_6)
    set $P2, $P5
.annotate 'line', 12243
    unless __ARG_4 goto __label_4
.annotate 'line', 12244
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 12245
    unless __ARG_5 goto __label_5
.annotate 'line', 12246
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 12247
    __ARG_1.'emit'($P2)
.annotate 'line', 12248
    $P2.'close'()
.annotate 'line', 12249
    if_null __ARG_3, __label_6
.annotate 'line', 12250
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
.annotate 'line', 12252
    $P1.'close'()
.annotate 'line', 12253
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 12254
    null $P3
    set $S2, __ARG_2
    if $S2 == 'pir' goto __label_11
    if $S2 == 'pbc' goto __label_12
    if $S2 == '' goto __label_13
    goto __label_9
  __label_11: # case
.annotate 'line', 12257
    new $P3, [ 'String' ]
.annotate 'line', 12258
    assign $P3, $S1
    goto __label_10 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 12262
    compreg $P4, 'PIR'
.annotate 'line', 12263
    $P3 = $P4($S1)
    goto __label_10 # break
  __label_9: # default
.annotate 'line', 12266
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
    die $S5
  __label_10: # switch end
.annotate 'line', 12268
    .return($P3)
  __label_7: # endif
.annotate 'line', 12270

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
.annotate 'line', 12273
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12274
    $P1.'open'('__eval__', 'w')
.annotate 'line', 12275
    new $P3, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P3.'Emit'($P1, 1)
    set $P2, $P3
.annotate 'line', 12276
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 12277
    $P2.'close'()
.annotate 'line', 12278
    $P1.'close'()
.annotate 'line', 12279
    .tailcall $P1.'read'(0)
.annotate 'line', 12280

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 12288
    unless_null __ARG_2, __label_1
.annotate 'line', 12289
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 12290
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12291
    $P1.'open'('__eval__', 'w')
.annotate 'line', 12292
    $P1.'puts'(__ARG_1)
.annotate 'line', 12293
    $P1.'close'()
.annotate 'line', 12294
    $P1.'open'('__eval__', 'r')
.annotate 'line', 12295
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, '__eval__', __ARG_6)
    set $P2, $P4
.annotate 'line', 12296
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
.annotate 'line', 12297
    $P3.'parse'($P2)
.annotate 'line', 12298
    $P1.'close'()
.annotate 'line', 12299
    $P3.'optimize'()
.annotate 'line', 12300
    ne __ARG_2, 'include', __label_2
.annotate 'line', 12301
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 12303
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 12304

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 12313
    unless_null __ARG_2, __label_1
.annotate 'line', 12314
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 12315
    new $P1, [ 'FileHandle' ]
.annotate 'line', 12316
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 12317
    $P1.'encoding'('utf8')
.annotate 'line', 12318
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, __ARG_1, __ARG_6)
    set $P2, $P4
.annotate 'line', 12319
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
.annotate 'line', 12320
    $P3.'parse'($P2)
.annotate 'line', 12321
    $P1.'close'()
.annotate 'line', 12322
    $P3.'optimize'()
.annotate 'line', 12323
    ne __ARG_2, 'include', __label_2
.annotate 'line', 12324
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 12326
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 12327

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
.annotate 'line', 12336
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 12337
    compreg 'winxed', $P1
.annotate 'line', 12338

.end # initializer

# End generated code
