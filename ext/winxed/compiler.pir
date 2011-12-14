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


.sub 'NoLeftSide' :subid('WSubId_89')
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 206
    WSubId_25('Not a left-side expression', __ARG_1)
.annotate 'line', 207

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_70')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 211
    concat $S1, "Expected ", __ARG_1
    WSubId_25($S1, __ARG_2)
.annotate 'line', 212

.end # Expected


.sub 'Unexpected' :subid('WSubId_71')
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


.sub 'RequireIdentifier' :subid('WSubId_124')
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


.sub 'ExpectOp' :subid('WSubId_84')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 249
    $P1 = __ARG_2.'get'()
.annotate 'line', 250
    WSubId_28(__ARG_1, $P1)
.annotate 'line', 251

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_126')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_29 = "WSubId_29"
.annotate 'line', 255
    $P1 = __ARG_2.'get'()
.annotate 'line', 256
    WSubId_29(__ARG_1, $P1)
.annotate 'line', 257

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_91')
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

.sub 'typetoregcheck' :subid('WSubId_127')
        .param string __ARG_1
    if __ARG_1 == 'int' goto __label_3
    if __ARG_1 == 'float' goto __label_4
    if __ARG_1 == 'string' goto __label_5
    if __ARG_1 == 'var' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 877
    .return('I')
  __label_4: # case
.annotate 'line', 878
    .return('N')
  __label_5: # case
.annotate 'line', 879
    .return('S')
  __label_6: # case
.annotate 'line', 880
    .return('P')
  __label_1: # default
.annotate 'line', 881
    .return('')
  __label_2: # switch end
.annotate 'line', 883

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_136')
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
.annotate 'line', 888
    .return('int')
  __label_4: # case
.annotate 'line', 889
    .return('num')
  __label_5: # case
.annotate 'line', 890
    .return('string')
  __label_6: # case
.annotate 'line', 891
    .return('pmc')
  __label_1: # default
.annotate 'line', 892
    WSubId_30('Invalid reg type')
  __label_2: # switch end
.annotate 'line', 894

.end # typetopirname

.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 916
    setattribute self, 'handle', __ARG_1
.annotate 'line', 917
    box $P1, ""
    setattribute self, 'file', $P1
.annotate 'line', 918
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 919
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 920
    box $P1, 0
    setattribute self, 'pendingl', $P1
.annotate 'line', 921
    not $I1, __ARG_2
    new $P2, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P2
.annotate 'line', 922

.end # Emit


.sub 'setDebug' :method
.annotate 'line', 925
    box $P1, 1
    setattribute self, 'debug', $P1
.annotate 'line', 926

.end # setDebug


.sub 'getDebug' :method
.annotate 'line', 929
    getattribute $P1, self, 'debug'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 930

.end # getDebug


.sub 'disable_annotations' :method
.annotate 'line', 933
    box $P1, 1
    setattribute self, 'noan', $P1
.annotate 'line', 934

.end # disable_annotations


.sub 'close' :method
.annotate 'line', 937
    null $P1
    setattribute self, 'handle', $P1
.annotate 'line', 938

.end # close


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_42 = "WSubId_42"
.annotate 'line', 941
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 942
    WSubId_42(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 943

.end # warn


.sub 'updateannot' :method
.annotate 'line', 946
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 947
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'file', '"
.annotate 'line', 949
    getattribute $P4, self, 'file'
.annotate 'line', 947
    $P3[1] = $P4
    $P3[2] = "'\n"
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 952
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
  __label_1: # endif
.annotate 'line', 954
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 955
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'line', "
.annotate 'line', 957
    getattribute $P4, self, 'line'
.annotate 'line', 955
    $P3[1] = $P4
    $P3[2] = "\n"
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 960
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
  __label_2: # endif
.annotate 'line', 962

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 965
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
.annotate 'line', 966

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
.annotate 'line', 969
    self.'updateannot'()
.annotate 'line', 970
    self.'vprint'(__ARG_1)
.annotate 'line', 971

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
.annotate 'line', 974
    self.'updateannot'()
.annotate 'line', 975
    self.'vprint'(__ARG_1)
.annotate 'line', 976
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
.annotate 'line', 977

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 980
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
.annotate 'line', 982
    getattribute $P1, self, 'file'
.annotate 'line', 983
    getattribute $P2, self, 'line'
.annotate 'line', 984
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 985
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 986
    set $S2, $P1
    eq $S2, $S1, __label_3
.annotate 'line', 987
    assign $P1, $S1
.annotate 'line', 988
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 989
    assign $P2, 0
  __label_3: # endif
.annotate 'line', 991
    set $I2, $P2
    eq $I2, $I1, __label_4
.annotate 'line', 992
    assign $P2, $I1
.annotate 'line', 993
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
  __label_4: # endif
  __label_1: # endif
.annotate 'line', 996

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
.annotate 'line', 999
    self.'updateannot'()
.annotate 'line', 1000
    getattribute $P1, self, 'handle'
    concat $S1, "# ", __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
.annotate 'line', 1001

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 1004
    getattribute $P1, self, 'handle'
.annotate 'line', 1005
    $P1.'print'('  ')
.annotate 'line', 1006
    $P1.'print'(__ARG_1)
.annotate 'line', 1007
    $P1.'print'(":")
.annotate 'line', 1008
    if_null __ARG_2, __label_1
.annotate 'line', 1009
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 1010
    $P1.'print'("\n")
.annotate 'line', 1011

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 1014
    getattribute $P1, self, 'handle'
.annotate 'line', 1015
    $P1.'print'("    goto ")
.annotate 'line', 1016
    $P1.'print'(__ARG_1)
.annotate 'line', 1017
    if_null __ARG_2, __label_1
.annotate 'line', 1018
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 1019
    $P1.'print'("\n")
.annotate 'line', 1020

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1024
    self.'say'('    ', __ARG_1, " ", __ARG_2)
.annotate 'line', 1025

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1028
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1029

.end # emitarg2


.sub 'emitarg3' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 1032
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 1033

.end # emitarg3


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 1036
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 1037

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1040
    self.'say'("    if ", __ARG_1, " goto ", __ARG_2)
.annotate 'line', 1041

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1044
    self.'say'("    unless ", __ARG_1, " goto ", __ARG_2)
.annotate 'line', 1045

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1048
    self.'say'("    if_null ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1049

.end # emitif_null


.sub 'emitunless_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1052
    self.'say'("    unless_null ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1053

.end # emitunless_null


.sub 'emitnull' :method
        .param string __ARG_1
.annotate 'line', 1056
    self.'say'("    null ", __ARG_1)
.annotate 'line', 1057

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
.annotate 'line', 1061
    self.'say'("    inc ", __ARG_1)
.annotate 'line', 1062

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
.annotate 'line', 1065
    self.'say'("    dec ", __ARG_1)
.annotate 'line', 1066

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1069
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1070

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1073
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1074

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1077
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1078

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1081
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1082

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 1085
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
.annotate 'line', 1086

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1089
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1090

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1093
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1094

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1097
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1098

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1101
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1102

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1105
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1106

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1109
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1110

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1113
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
.annotate 'line', 1114

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1117
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1118

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1121
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
.annotate 'line', 1122

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
.annotate 'line', 1125
    self.'say'("    print ", __ARG_1)
.annotate 'line', 1126

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
.annotate 'line', 1129
    self.'say'("    say ", __ARG_1)
.annotate 'line', 1130

.end # emitsay


.sub 'emitget_hll_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1133
    concat $S1, ", ", __ARG_2
    self.'say'("    get_hll_namespace ", __ARG_1, $S1)
.annotate 'line', 1134

.end # emitget_hll_namespace


.sub 'emitget_root_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1137
    concat $S1, ", ", __ARG_2
    self.'say'("    get_root_namespace ", __ARG_1, $S1)
.annotate 'line', 1138

.end # emitget_root_namespace


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
.annotate 'line', 1141
    self.'print'("    get_hll_global ", __ARG_1)
.annotate 'line', 1142
    if_null __ARG_3, __label_1
.annotate 'line', 1143
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1144
    self.'say'(", '", __ARG_2, "'")
.annotate 'line', 1145

.end # emitget_hll_global


.sub 'emitget_root_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
.annotate 'line', 1148
    self.'print'("    get_root_global ", __ARG_1)
.annotate 'line', 1149
    if_null __ARG_3, __label_1
.annotate 'line', 1150
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1151
    self.'say'(", '", __ARG_2, "'")
.annotate 'line', 1152

.end # emitget_root_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1155
    self.'say'("    find_lex ", __ARG_1, ", '", __ARG_2, "'")
.annotate 'line', 1156

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1159
    self.'say'("    store_lex '", __ARG_1, "', ", __ARG_2)
.annotate 'line', 1160

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 905
    addattribute $P0, 'handle'
.annotate 'line', 906
    addattribute $P0, 'file'
.annotate 'line', 907
    addattribute $P0, 'line'
.annotate 'line', 908
    addattribute $P0, 'pendingf'
.annotate 'line', 909
    addattribute $P0, 'pendingl'
.annotate 'line', 910
    addattribute $P0, 'debug'
.annotate 'line', 911
    addattribute $P0, 'noan'
.annotate 'line', 912
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 1185
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 1186

.end # integerValue


.sub 'floatValue' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
.annotate 'line', 1190
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenFloat'($P3, $P4, __ARG_3)
    set $P1, $P2
.annotate 'line', 1191
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
.annotate 'line', 1192

.end # floatValue


.sub 'stringQuotedValue' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 1196
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, __ARG_3)
    set $P1, $P2
.annotate 'line', 1197
    new $P3, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P3.'StringLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
.annotate 'line', 1198

.end # stringQuotedValue


.sub 'floatresult' :subid('WSubId_95')
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 1206
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1207
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1208
    .return($I1)
.annotate 'line', 1209

.end # floatresult


.sub 'floatAsString' :subid('WSubId_90')
        .param num __ARG_1
.annotate 'line', 1217
    set $S1, __ARG_1
.annotate 'line', 1218
    box $P2, $S1
    $P1 = $P2.'is_integer'($S1)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 1219
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1220
    .return($S1)
.annotate 'line', 1221

.end # floatAsString


.sub 'createPredefConstInt' :subid('WSubId_147')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1232
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P3.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
    set $P1, $P3
.annotate 'line', 1234
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1235
    $P3 = WSubId_44(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
.annotate 'line', 1236

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_140')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 1240
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P3.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
    set $P1, $P3
.annotate 'line', 1242
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1243
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1244
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1243
    $P2.'setvalue'($P3)
.annotate 'line', 1245

.end # createPredefConstString


.sub 'string_from_literal' :subid('WSubId_47')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1259
    null $S1
.annotate 'line', 1261
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1264
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1267
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1262
    getattribute $P1, __ARG_1, 'numval'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1265
    $P2 = __ARG_1.'getFloatValue'()
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1268
    $P3 = __ARG_1.'get_value'()
    set $S1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1271
    WSubId_30('wrong call to string_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1273
    .return($S1)
.annotate 'line', 1274

.end # string_from_literal


.sub 'int_from_literal' :subid('WSubId_48')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1278
    null $I1
.annotate 'line', 1280
    $I2 = __ARG_1.'isintegerliteral'()
    if $I2 goto __label_3
.annotate 'line', 1283
    $I2 = __ARG_1.'isfloatliteral'()
    if $I2 goto __label_4
.annotate 'line', 1286
    $I2 = __ARG_1.'isstringliteral'()
    if $I2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1281
    getattribute $P1, __ARG_1, 'numval'
    set $I1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1284
    $P2 = __ARG_1.'getFloatValue'()
    set $I1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1287
    $P3 = __ARG_1.'get_value'()
    set $I1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1290
    WSubId_30('wrong call to int_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1292
    .return($I1)
.annotate 'line', 1293

.end # int_from_literal


.sub 'float_from_literal' :subid('WSubId_128')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1297
    null $N1
.annotate 'line', 1299
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1300
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1303
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
  __label_4: # case
.annotate 'line', 1301
    $P1 = __ARG_1.'getFloatValue'()
    set $N1, $P1
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1304
    $P2 = __ARG_1.'get_value'()
    set $N1, $P2
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1307
    WSubId_30('wrong call to float_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1309
    .return($N1)
.annotate 'line', 1310

.end # float_from_literal

.namespace [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]

.sub 'Builtin_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1340
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1341
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1342
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1343
    split $P1, "\n", __ARG_2
    join $S1, "\n    ", $P1
    concat $S2, '    ', $S1
    set __ARG_2, $S2
.annotate 'line', 1344
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1345
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
.annotate 'line', 1346

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
.annotate 'line', 1349
    getattribute $P1, self, 'typeresult'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1351
    ne $S1, 'v', __label_2
.annotate 'line', 1352
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_4, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1353
    WSubId_25('using return value from void builtin', __ARG_3)
  __label_4: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 1356
    isnull $I1, __ARG_4
    if $I1 goto __label_7
    iseq $I1, __ARG_4, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1357
    WSubId_30('Bad result in non void builtin')
  __label_6: # endif
  __label_3: # endif
.annotate 'line', 1360
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1361
    getattribute $P2, self, 'body'
    $P1 = WSubId_45($P2, __ARG_4, __ARG_5 :flat)
    __ARG_1.'say'($P1)
.annotate 'line', 1362

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
.annotate 'line', 1316
    addattribute $P0, 'body'
.annotate 'line', 1317
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
.annotate 'line', 1383
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1384
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1385
    new $P3, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
    $P3.'Builtin_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1387
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1388
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1389
    null $I1
.annotate 'line', 1390
    if_null __ARG_4, __label_3
.annotate 'line', 1391
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
.annotate 'line', 1394
    set $I1, -1
    goto __label_5 # break
  __label_7: # case
.annotate 'line', 1397
    set $I1, -2
.annotate 'line', 1398
    if_null __ARG_5, __label_8
.annotate 'line', 1399
    concat $S1, "Invalid builtin '", __ARG_1
    concat $S1, $S1, '"'
    WSubId_30($S1)
  __label_8: # endif
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 1402
    set $I1, 1
.annotate 'line', 1403
    if_null __ARG_5, __label_9
.annotate 'line', 1404
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1405
    inc $I1
  __label_9: # endif
.annotate 'line', 1407
    if_null __ARG_6, __label_10
.annotate 'line', 1408
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1409
    inc $I1
  __label_10: # endif
.annotate 'line', 1411
    if_null __ARG_7, __label_11
.annotate 'line', 1412
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1413
    inc $I1
  __label_11: # endif
  __label_5: # switch end
  __label_3: # endif
.annotate 'line', 1417
    box $P1, $I1
    setattribute self, 'nparams', $P1
.annotate 'line', 1418

.end # BuiltinBase


.sub 'iscompileevaluable' :method
.annotate 'line', 1421
    .return(0)
.annotate 'line', 1422

.end # iscompileevaluable


.sub 'name' :method
.annotate 'line', 1425
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1426
    .return($S1)
.annotate 'line', 1427

.end # name


.sub 'result' :method
.annotate 'line', 1430
    getattribute $P1, self, 'typeresult'
    .return($P1)
.annotate 'line', 1431

.end # result


.sub 'params' :method
.annotate 'line', 1432
    getattribute $P1, self, 'nparams'
    .return($P1)

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1435
    null $S1
    if __ARG_1 == 0 goto __label_3
    if __ARG_1 == 1 goto __label_4
    if __ARG_1 == 2 goto __label_5
    if __ARG_1 == 3 goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 1437
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 1438
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 1439
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 1440
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 1442
    WSubId_30('Invalid builtin arg')
  __label_2: # switch end
.annotate 'line', 1444
    .return($S1)
.annotate 'line', 1445

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1448
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1450
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 1452
    eq $S1, '__ASSERT__', __label_3
.annotate 'line', 1453
    concat $S3, 'builtin ', $S1
    __ARG_1.'comment'($S3)
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 1456
    getattribute $P2, self, 'typeresult'
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 1457
    isne $I1, $S2, 'v'
    unless $I1 goto __label_6
    iseq $I1, __ARG_4, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 1458
    $P2 = __ARG_2.'tempreg'($S2)
    set __ARG_4, $P2
  __label_5: # endif
.annotate 'line', 1459
    getattribute $P1, self, 'body'
.annotate 'line', 1460
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 1461

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
.annotate 'line', 1367
    addattribute $P0, 'name'
.annotate 'line', 1368
    addattribute $P0, 'body'
.annotate 'line', 1369
    addattribute $P0, 'typeresult'
.annotate 'line', 1370
    addattribute $P0, 'type0'
.annotate 'line', 1371
    addattribute $P0, 'type1'
.annotate 'line', 1372
    addattribute $P0, 'type2'
.annotate 'line', 1373
    addattribute $P0, 'type3'
.annotate 'line', 1374
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
.annotate 'line', 1473
    self.'BuiltinBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
.annotate 'line', 1474

.end # BuiltinFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1464
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
.annotate 'line', 1487
    self.'BuiltinBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1488
    setattribute self, 'evalfun', __ARG_2
.annotate 'line', 1489

.end # BuiltinFunctionEval


.sub 'iscompileevaluable' :method
.annotate 'line', 1492
    .return(1)
.annotate 'line', 1493

.end # iscompileevaluable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1477
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
.annotate 'line', 1479
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]

.sub 'Builtin_typecast' :method
        .param string __ARG_1
.annotate 'line', 1501
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 1502

.end # Builtin_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1505
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1506
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1507
    WSubId_30("Invalid Builtin_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1508
    $P1 = __ARG_5[0]
.annotate 'line', 1509
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 1511
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1512
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1513
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1516
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1517
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1519
    ne $S3, 'null', __label_9
.annotate 'line', 1520
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1522
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
.annotate 'line', 1524

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
.annotate 'line', 1498
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'builtineval_stringcast' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
.annotate 'line', 1529
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1530
    $P2 = WSubId_47($P1)
    .tailcall WSubId_46(__ARG_1, __ARG_2, $P2)
.annotate 'line', 1531

.end # builtineval_stringcast


.sub 'builtineval_intcast' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1535
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1536
    $P2 = WSubId_48($P1)
    set $I1, $P2
.annotate 'line', 1537
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1538

.end # builtineval_intcast


.sub 'Builtin_varcast' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 1542
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1543
    WSubId_30("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1544
    $P1 = __ARG_5[0]
.annotate 'line', 1545
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_2
    set $S1, $P10
  __label_2:
.annotate 'line', 1546
    ne $S1, 'P', __label_3
.annotate 'line', 1547
    null $S2
.annotate 'line', 1548
    null $P2
.annotate 'line', 1550
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1566
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1551
    $P10 = $P1.'getName'()
    set $S2, $P10
.annotate 'line', 1552
    $P11 = $P1.'checkIdentifier'()
    null $S3
    if_null $P11, __label_9
    set $S3, $P11
  __label_9:
.annotate 'line', 1553
    $P3 = $P1.'checkVar'()
.annotate 'line', 1554
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
.annotate 'line', 1556
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_11
  __label_10: # else
.annotate 'line', 1559
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 1
    $P10[0] = $S2
    $P2 = $P1.'scopesearch'($P10, 0)
.annotate 'line', 1560
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 1561
    getattribute $P10, $P2, 'owner'
    $P4 = $P10.'getpath'()
.annotate 'line', 1562
    set $P7, $P4
.annotate 'line', 2519
    null $S5
.annotate 'line', 2520
    elements $I1, $P7
    unless $I1 goto __label_17
.annotate 'line', 2521
    join $S9, "'; '", $P7
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S5, $S10
  __label_17: # endif
.annotate 'line', 2522
    set $S8, $S5
    goto __label_16
  __label_16:
.annotate 'line', 1562
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S8)
  __label_14: # endif
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1569
    new $P5, ['ResizableStringArray']
.annotate 'line', 1570
    $P1.'buildkey'($P5)
.annotate 'line', 1571
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1572
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_19
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_19:
    unless $I1 goto __label_18
.annotate 'line', 1573
    getattribute $P10, $P2, 'owner'
    $P6 = $P10.'getpath'()
.annotate 'line', 1574
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1575
    set $P8, $P6
.annotate 'line', 2519
    null $S6
.annotate 'line', 2520
    elements $I1, $P8
    unless $I1 goto __label_21
.annotate 'line', 2521
    join $S9, "'; '", $P8
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S6, $S10
  __label_21: # endif
.annotate 'line', 2522
    set $S11, $S6
    goto __label_20
  __label_20:
.annotate 'line', 1575
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S11)
  __label_18: # endif
.annotate 'line', 1577
    $P10 = $P5.'pop'()
    set $S2, $P10
.annotate 'line', 1578
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1579
    set $P9, $P5
.annotate 'line', 2519
    null $S7
.annotate 'line', 2520
    elements $I1, $P9
    unless $I1 goto __label_23
.annotate 'line', 2521
    join $S9, "'; '", $P9
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S7, $S10
  __label_23: # endif
.annotate 'line', 2522
    set $S12, $S7
    goto __label_22
  __label_22:
.annotate 'line', 1579
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S12)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1582
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1583
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
    goto __label_4
  __label_3: # else
.annotate 'line', 1587
    $P10 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_24
    set $S4, $P10
  __label_24:
.annotate 'line', 1588
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1589
    ne $S4, 'null', __label_25
.annotate 'line', 1590
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_26
  __label_25: # else
.annotate 'line', 1592
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_26: # endif
  __label_4: # endif
.annotate 'line', 1594

.end # Builtin_varcast


.sub 'Builtin_say' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1598
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1599
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1600
    lt $I1, 0, __label_1
.annotate 'line', 1601
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1602
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1601
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1603
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 1606
    __ARG_1.'emitsay'("''")
  __label_2: # endif
.annotate 'line', 1607

.end # Builtin_say


.sub 'Builtin_cry' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_9 = "WSubId_9"
.annotate 'line', 1611
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1618
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
.annotate 'line', 1618
    join $S1, "\n", $P5
.annotate 'line', 1612
    $P5 = WSubId_45("    getstderr $P0\n%0\n    print $P0, \"\\n\"\n", $S1)
    __ARG_1.'say'($P5)
.annotate 'line', 1619

.end # Builtin_cry


.sub 'Builtin_print' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_7 = "WSubId_7"
.annotate 'line', 1623
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1624
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
.annotate 'line', 1625

.end # Builtin_print


.sub 'Builtin_abs' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1629
    $P1 = __ARG_5[0]
.annotate 'line', 1630
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1631
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    ne $S3, 'S', __label_2
.annotate 'line', 1632
    $P3 = __ARG_2.'tempreg'('N')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 1633
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1634
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 1635
    __ARG_1.'emitarg2'('abs', $S2, $S2)
.annotate 'line', 1636
    __ARG_1.'emitset'(__ARG_4, $S2)
    goto __label_3
  __label_2: # else
.annotate 'line', 1639
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1640
    __ARG_1.'emitarg2'('abs', __ARG_4, $S1)
  __label_3: # endif
.annotate 'line', 1642

.end # Builtin_abs


.sub 'Builtin_ASSERT' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 1648
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1649
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1650
    $P3 = __ARG_2.'genlabel'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 1651
    $P1 = __ARG_5[0]
.annotate 'line', 1652
    $P2 = $P1.'emit_getint'(__ARG_1)
.annotate 'line', 1653
    __ARG_1.'emitif'($P2, $S1)
.annotate 'line', 1662
    $P4 = __ARG_3.'filename'()
    $P5 = __ARG_3.'linenum'()
.annotate 'line', 1654
    $P3 = WSubId_45("    getstderr $P0\n    print $P0, \"Assertion failed at '%0' line \"\n    print $P0, %1\n    print $P0, \"\\n\"\n    exit 1\n", $P4, $P5)
    __ARG_1.'print'($P3)
.annotate 'line', 1663
    __ARG_1.'emitlabel'($S1)
  __label_1: # endif
.annotate 'line', 1665

.end # Builtin_ASSERT


.sub 'Builtin_invoke' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 1671
    $P1 = __ARG_5[0]
.annotate 'line', 1672
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1673
    WSubId_25("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1674
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 1675

.end # Builtin_invoke


.sub 'builtineval_length' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1679
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1680
    $P2 = WSubId_47($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1681
    length $I1, $S1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1682

.end # builtineval_length


.sub 'builtineval_bytelength' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1686
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1687
    $P2 = WSubId_47($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1688
    bytelength $I1, $S1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1689

.end # builtineval_bytelength


.sub 'builtineval_ord' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1693
    elements $I1, __ARG_3
.annotate 'line', 1694
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1695
    $P3 = WSubId_47($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1696
    null $I2
.annotate 'line', 1697
    le $I1, 1, __label_2
.annotate 'line', 1698
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1699
    $P3 = WSubId_48($P2)
    set $I2, $P3
  __label_2: # endif
.annotate 'line', 1701
    ord $I3, $S1, $I2
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I3)
.annotate 'line', 1702

.end # builtineval_ord


.sub 'builtineval_chr' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_48 = "WSubId_48"
.annotate 'line', 1706
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1707
    $P2 = WSubId_48($P1)
    set $I1, $P2
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1708

.end # builtineval_chr


.sub 'builtineval_substr' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_46 = "WSubId_46"
.annotate 'line', 1712
    elements $I1, __ARG_3
.annotate 'line', 1713
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1714
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1715
    $P4 = WSubId_47($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1716
    $P4 = WSubId_48($P2)
    set $I2, $P4
.annotate 'line', 1717
    null $S2
.annotate 'line', 1718
    set $I4, __ARG_3
    le $I4, 2, __label_2
.annotate 'line', 1719
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1720
    $P4 = WSubId_48($P3)
    set $I3, $P4
.annotate 'line', 1721
    substr $S2, $S1, $I2, $I3
    goto __label_3
  __label_2: # else
.annotate 'line', 1724
    substr $S2, $S1, $I2
  __label_3: # endif
.annotate 'line', 1725
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S2)
.annotate 'line', 1726

.end # builtineval_substr


.sub 'builtineval_indexof' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1730
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1731
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1732
    $P3 = WSubId_47($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1733
    $P3 = WSubId_47($P2)
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1734
    index $I1, $S1, $S2
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)
.annotate 'line', 1735

.end # builtineval_indexof


.sub 'builtineval_indexof_pos' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 1739
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1740
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1741
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1742
    $P4 = WSubId_47($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1743
    $P4 = WSubId_47($P2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1744
    $P6 = __ARG_3[2]
    getattribute $P5, $P6, 'arg'
    $P4 = WSubId_48($P5)
    set $I1, $P4
.annotate 'line', 1745
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I2)
.annotate 'line', 1746

.end # builtineval_indexof_pos


.sub 'builtineval_escape' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
.annotate 'line', 1750
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1754
    $P2 = WSubId_47($P1)
    set $S3, $P2
    escape $S2, $S3
    escape $S1, $S2
.annotate 'line', 1753
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S1)
.annotate 'line', 1755

.end # builtineval_escape


.sub 'builtin_sleep' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1759
    $P1 = __ARG_5[0]
.annotate 'line', 1760
    null $S1
.annotate 'line', 1761
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
.annotate 'line', 1764
    $P2 = $P1.'emit_getint'(__ARG_1)
    set $S1, $P2
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 1767
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 1770
    $P4 = $P1.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 1771
    set $S1, "0"
    goto __label_7
  __label_6: # else
.annotate 'line', 1773
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 1774
    set $S1, "$N0"
.annotate 'line', 1775
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1776
    __ARG_1.'emitset'($S1, $S3)
  __label_7: # endif
  __label_3: # switch end
.annotate 'line', 1779
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1780
    __ARG_1.'emitarg1'('sleep', $S1)
.annotate 'line', 1781

.end # builtin_sleep


.sub 'getbuiltins' :subid('WSubId_148')
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
.const 'Sub' WSubId_66 = "WSubId_66"
.annotate 'line', 1785
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1787
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('I')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('int', WSubId_49, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1785
    __ARG_1.'add'($P1)
.annotate 'line', 1790
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1791
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('N')
    set $P3, $P4
    $P2.'BuiltinFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1790
    __ARG_1.'add'($P1)
.annotate 'line', 1794
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1796
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('S')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('string', WSubId_50, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1794
    __ARG_1.'add'($P1)
.annotate 'line', 1799
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('var', WSubId_51, 'P', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1803
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1807
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1811
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1815
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1819
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sleep', WSubId_52, 'v', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1823
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1827
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1831
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1835
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1839
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1846
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1853
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1860
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1868
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1877
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1887
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1891
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('length', WSubId_53, 'length %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1896
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('bytelength', WSubId_54, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1901
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('chr', WSubId_55, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1910
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('ord', WSubId_56, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1915
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('ord', WSubId_56, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1920
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('substr', WSubId_57, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1925
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('substr', WSubId_57, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1930
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1934
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('indexof', WSubId_58, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1939
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('indexof', WSubId_59, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1944
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1948
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('escape', WSubId_60, 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1953
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1961
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1969
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1976
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1983
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1987
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1991
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1995
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1999
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2006
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2013
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2017
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unshift', 'unshift %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2021
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_var', 'pop %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2025
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_var', 'shift %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2029
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_int', 'pop %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2033
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_int', 'shift %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2037
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_float', 'pop %0, %1', 'N', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2041
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_float', 'shift %0, %1', 'N', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2045
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_string', 'pop %0, %1', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2049
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_string', 'shift %0, %1', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2053
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('abs', WSubId_61, ':', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2057
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2061
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2065
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2069
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2073
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2077
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2081
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2085
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2089
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2093
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2097
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2101
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sinh', 'sinh %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2105
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cosh', 'cosh %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2109
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tanh', 'tanh %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2113
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2117
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2130
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2134
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2138
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2142
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2146
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2150
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2154
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2158
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2162
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2166
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2170
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2177
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2184
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2188
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2192
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2196
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2200
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2204
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('print', WSubId_62, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2208
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('say', WSubId_63, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2212
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cry', WSubId_64, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2216
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('__ASSERT__', WSubId_65, 'v', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2220
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('invoke', WSubId_66, 'P', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2224

.end # getbuiltins


.sub 'parseDotted' :subid('WSubId_85')
        .param pmc __ARG_1
.annotate 'line', 2244
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2245
    $P2 = __ARG_1.'get'()
.annotate 'line', 2246
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2247
    push $P1, $P2
  __label_3: # while
.annotate 'line', 2248
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2249
    $P2 = __ARG_1.'get'()
.annotate 'line', 2250
    push $P1, $P2
    goto __label_3
  __label_2: # endwhile
  __label_1: # endif
.annotate 'line', 2253
    __ARG_1.'unget'($P2)
.annotate 'line', 2254
    .return($P1)
.annotate 'line', 2255

.end # parseDotted


.sub 'parseList' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 2263
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2264
    null $P2
  __label_1: # do
.annotate 'line', 2266
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 2267
    push $P1, $P3
  __label_3: # continue
.annotate 'line', 2268
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 2269
    unless_null __ARG_4, __label_4
.annotate 'line', 2270
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2272
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 2273
    WSubId_25("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 2274
    .return($P1)
.annotate 'line', 2275

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_27 = "WSubId_27"
.annotate 'line', 2280
    $P1 = __ARG_1.'get'()
.annotate 'line', 2281
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2282
    WSubId_27($P1)
  __label_1: # endif
.annotate 'line', 2283
    .return($P1)
.annotate 'line', 2284

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_86')
        .param pmc __ARG_1
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2288
    new $P1, ['ResizableStringArray']
.annotate 'line', 2289
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
.annotate 'line', 2290
    .return($P1)
.annotate 'line', 2291

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2304
    setattribute self, 'start', __ARG_1
.annotate 'line', 2305
    setattribute self, 'owner', __ARG_2
.annotate 'line', 2306

.end # initbase


.sub 'clone' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 2309
    typeof $P1, self
    set $S1, $P1
    concat $S2, "Cannot use ", $S1
    concat $S2, $S2, " in inline (yet)"
    WSubId_25($S2, self)
.annotate 'line', 2311

.end # clone


.sub 'getstart' :method
.annotate 'line', 2314
    getattribute $P1, self, 'start'
    .return($P1)
.annotate 'line', 2315

.end # getstart


.sub 'viewable' :method
.annotate 'line', 2318
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2319
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2321
    .return("")
  __label_2: # endif
.annotate 'line', 2322

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 2325
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 2326

.end # annotate


.sub 'getpath' :method
.annotate 'line', 2329
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()
.annotate 'line', 2330

.end # getpath


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 2333
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 2334

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 2337
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 2338

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 2341
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
.annotate 'line', 2342

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 2345
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
.annotate 'line', 2346

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 2349
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 2350

.end # scopesearch


.sub 'dowarnings' :method
.annotate 'line', 2353
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 2354

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 2299
    addattribute $P0, 'start'
.annotate 'line', 2300
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2371
    setattribute self, 'owner', __ARG_1
.annotate 'line', 2372
    setattribute self, 'e', __ARG_2
.annotate 'line', 2373

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 2377
    getattribute $P1, self, 'e'
.annotate 'line', 2378
    null $S1
.annotate 'line', 2379
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2380
    getattribute $P2, self, 'pnull'
.annotate 'line', 2381
    unless_null $P2, __label_3
.annotate 'line', 2382
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2383
    $P1.'emitnull'($S2)
.annotate 'line', 2384
    box $P2, $S2
    setattribute self, 'pnull', $P2
  __label_3: # endif
.annotate 'line', 2386
    set $S1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 2389
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2390
    .return($S1)
.annotate 'line', 2391

.end # add

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
.annotate 'line', 2366
    addattribute $P0, 'owner'
.annotate 'line', 2367
    addattribute $P0, 'e'
.annotate 'line', 2368
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2406
    $P2 = WSubId_67(__ARG_1, __ARG_2, WSubId_68, __ARG_3)
    setattribute self, 'args', $P2
.annotate 'line', 2407

.end # SimpleArgList


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 2410
    new $P1, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2411
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
.annotate 'line', 2411
    setattribute $P1, 'args', $P8
.annotate 'line', 2412
    .return($P1)
.annotate 'line', 2413

.end # clone


.sub 'numargs' :method
.annotate 'line', 2417
    getattribute $P1, self, 'args'
    elements $I1, $P1
    .return($I1)
.annotate 'line', 2418

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 2421
    getattribute $P1, self, 'args'
.annotate 'line', 2422
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 2423

.end # getarg


.sub 'optimizeargs' :method
.annotate 'line', 2427
    getattribute $P1, self, 'args'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 2428

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2431
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
.annotate 'line', 2431
    .return($P6)
.annotate 'line', 2432

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 2435
    $P1 = self.'getargvalues'(__ARG_1)
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
.annotate 'line', 2436

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2402
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
.annotate 'line', 2448
    getattribute $P1, self, 'name'
    .return($P1)

.end # getname


.sub 'numargs' :method
.annotate 'line', 2451
    getattribute $P1, self, 'args'
.annotate 'line', 2452
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2453
    .return($I1)
.annotate 'line', 2454

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2457
    getattribute $P1, self, 'args'
.annotate 'line', 2458
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2459
    WSubId_30('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2460
    .tailcall $P1.'getarg'(__ARG_1)
.annotate 'line', 2461

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2464
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2465
    if_null __ARG_2, __label_1
.annotate 'line', 2466
    setattribute self, 'args', __ARG_2
  __label_1: # endif
.annotate 'line', 2467

.end # Modifier


.sub 'optimize' :method
.annotate 'line', 2470
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2471
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2472
    .return(self)
.annotate 'line', 2473

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2445
    addattribute $P0, 'name'
.annotate 'line', 2446
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2478
    $P1 = __ARG_1.'get'()
.annotate 'line', 2479
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2480
    $P1 = __ARG_1.'get'()
.annotate 'line', 2481
    null $P2
.annotate 'line', 2482
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2483
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2485
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2486
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
.annotate 'line', 2487

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_69 = "WSubId_69"
.annotate 'line', 2496
    $P2 = WSubId_67(__ARG_1, __ARG_2, WSubId_69, ']')
    setattribute self, 'list', $P2
.annotate 'line', 2497

.end # ModifierList


.sub 'optimize' :method
.annotate 'line', 2500
    getattribute $P1, self, 'list'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 2501

.end # optimize


.sub 'getlist' :method
.annotate 'line', 2502
    getattribute $P1, self, 'list'
    .return($P1)

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
.annotate 'line', 2505
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 2506
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2507
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2509
    .return($P2)
.annotate 'line', 2510

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2492
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseUsing' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2527
    $P1 = __ARG_2.'get'()
.annotate 'line', 2529
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2531
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2533
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2530
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2532
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2534
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2536
    __ARG_2.'unget'($P1)
.annotate 'line', 2537
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
.annotate 'line', 2539

.end # parseUsing


.sub 'parseSig' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2543
    new $P4, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P4.'SigParameterList'(__ARG_2, __ARG_3)
    set $P1, $P4
.annotate 'line', 2544
    $P2 = __ARG_2.'get'()
.annotate 'line', 2545
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2546
    WSubId_70("'='", $P2)
  __label_1: # endif
.annotate 'line', 2547
    $P3 = WSubId_68(__ARG_2, __ARG_3)
.annotate 'line', 2548
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 2549

.end # parseSig


.sub 'parseClassSpecifier' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 2553
    $P1 = __ARG_1.'get'()
.annotate 'line', 2554
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2555
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 2556
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 2557
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 2558
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2559
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 2560
    WSubId_25('Invalid class', $P1)
.annotate 'line', 2561

.end # parseClassSpecifier


.sub 'parseStatement' :subid('WSubId_125')
        .param pmc __ARG_1
        .param pmc __ARG_2
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
.const 'Sub' WSubId_82 = "WSubId_82"
.annotate 'line', 2565
    $P1 = __ARG_1.'get'()
.annotate 'line', 2566
    null $P2
.annotate 'line', 2567
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2568
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2569
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2570
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2571
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2572
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2573
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 2574
    $P3 = __ARG_1.'get'()
.annotate 'line', 2575
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2576
    WSubId_71("':'", $P1)
  __label_5: # endif
.annotate 'line', 2577
    .tailcall WSubId_72($P1, __ARG_1, __ARG_2)
  __label_4: # endif
.annotate 'line', 2580
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
.annotate 'line', 2582
    .tailcall WSubId_73($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2584
    .tailcall WSubId_74($P1, __ARG_1, __ARG_2)
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 2587
    .tailcall WSubId_75($P1, __ARG_1, __ARG_2)
    goto __label_7 # break
  __label_11: # case
.annotate 'line', 2590
    $P2 = __ARG_1.'get'()
.annotate 'line', 2591
    __ARG_1.'unget'($P2)
.annotate 'line', 2592
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2593
    .tailcall WSubId_76($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_7 # break
  __label_12: # case
.annotate 'line', 2596
    $P2 = __ARG_1.'get'()
.annotate 'line', 2597
    __ARG_1.'unget'($P2)
.annotate 'line', 2598
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2599
    .tailcall WSubId_77($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 2602
    $P2 = __ARG_1.'get'()
.annotate 'line', 2603
    __ARG_1.'unget'($P2)
.annotate 'line', 2604
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2605
    .tailcall WSubId_78($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_7 # break
  __label_14: # case
.annotate 'line', 2608
    $P2 = __ARG_1.'get'()
.annotate 'line', 2609
    __ARG_1.'unget'($P2)
.annotate 'line', 2610
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2611
    .tailcall WSubId_79($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_7 # break
  __label_15: # case
.annotate 'line', 2614
    .tailcall WSubId_80($P1, __ARG_1, __ARG_2)
  __label_16: # case
.annotate 'line', 2616
    new $P11, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_17: # case
.annotate 'line', 2618
    new $P13, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_18: # case
.annotate 'line', 2620
    new $P15, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P15.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_19: # case
.annotate 'line', 2622
    new $P17, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_20: # case
.annotate 'line', 2624
    new $P19, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P19.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_21: # case
.annotate 'line', 2626
    new $P21, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_22: # case
.annotate 'line', 2628
    new $P23, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_23: # case
.annotate 'line', 2630
    .tailcall WSubId_81($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2632
    .tailcall WSubId_82($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2634
    new $P25, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P25.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_26: # case
.annotate 'line', 2636
    new $P27, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P27.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_6: # default
  __label_7: # switch end
.annotate 'line', 2639
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
.annotate 'line', 2640
    $P4 = __ARG_1.'get'()
.annotate 'line', 2641
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2642
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2643
    __ARG_1.'unget'($P4)
  __label_31: # endif
.annotate 'line', 2645
    __ARG_1.'unget'($P1)
.annotate 'line', 2646
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
.annotate 'line', 2647

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2657
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 2658

.end # Statement


.sub 'isempty' :method
.annotate 'line', 2659
    .return(0)

.end # isempty


.sub 'allowtailcall' :method
.annotate 'line', 2662
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
.annotate 'line', 2663

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 2666
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
.annotate 'line', 2667

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 2670
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 2671

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 2674
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
.annotate 'line', 2675

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 2678
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 2679

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2682
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
.annotate 'line', 2683

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.annotate 'line', 2686
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
.annotate 'line', 2687

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2690
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2691

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2694
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2695

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2698
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
.annotate 'line', 2699

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 2702
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2703

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 2706
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
.annotate 'line', 2707

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 2710
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 2711

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 2714
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
.annotate 'line', 2715

.end # usenamespace


.sub 'getouter' :method
.annotate 'line', 2722
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
.annotate 'line', 2723

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.annotate 'line', 2726
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
.annotate 'line', 2727

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.annotate 'line', 2730
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
.annotate 'line', 2731

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2734
    getattribute $P1, self, 'start'
    WSubId_30('**checking**', $P1)
.annotate 'line', 2736
    .return(self)
.annotate 'line', 2737

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2653
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
.annotate 'line', 2742
    .return(1)

.end # isempty


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 2743
    .return(self)

.end # clone


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 2746
    WSubId_30('Attempt to annotate empty statement')
.annotate 'line', 2747

.end # annotate


.sub 'optimize' :method
.annotate 'line', 2748
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2740
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
.annotate 'line', 2761
    getattribute $P1, self, 'statements'
.annotate 'line', 2762
    elements $I1, $P1
.annotate 'line', 2763
    set $I2, 1
.annotate 'line', 2764
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
.annotate 'line', 2765
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2766
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2767
    null $I2
  __label_4: # endif
.annotate 'line', 2768
    $P1[$I3] = $P2
  __label_1: # for iteration
.annotate 'line', 2764
    inc $I3
    goto __label_3
  __label_2: # for end
    unless $I2 goto __label_7
.annotate 'line', 2770
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
.annotate 'line', 2771

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2757
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2778
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 2
    $P2[0] = __ARG_1
    $P2[1] = __ARG_2
    setattribute self, 'statements', $P2
.annotate 'line', 2779

.end # MultiStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 2782
    new $P1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2783
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
.annotate 'line', 2783
    setattribute $P1, 'statements', $P8
.annotate 'line', 2784
    .return($P1)
.annotate 'line', 2785

.end # clone


.sub 'isempty' :method
.annotate 'line', 2787
    .return(0)

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
.annotate 'line', 2790
    getattribute $P1, self, 'statements'
    push $P1, __ARG_1
.annotate 'line', 2791
    .return(self)
.annotate 'line', 2792

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2795
    set $P1, __ARG_1
    getattribute $P2, self, 'statements'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2239
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
.annotate 'line', 2796

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2774
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parsePiropArg' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 2817
    null $P1
.annotate 'line', 2818
    $P2 = __ARG_1.'get'()
.annotate 'line', 2819
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 2820
    $P2 = __ARG_1.'get'()
.annotate 'line', 2821
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2822
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 2825
    __ARG_1.'unget'($P2)
.annotate 'line', 2826
    $P1 = WSubId_68(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 2828
    .return($P1)
.annotate 'line', 2829

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 2838
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2839
    $P1 = __ARG_2.'get'()
.annotate 'line', 2840
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2841
    unless $I1 goto __label_1
.annotate 'line', 2842
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2843
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2844
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2845
    $P1 = __ARG_2.'get'()
.annotate 'line', 2846
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
.annotate 'line', 2847
    __ARG_2.'unget'($P1)
.annotate 'line', 2848
    $P3 = WSubId_67(__ARG_2, __ARG_3, WSubId_83, '}')
    setattribute self, 'args', $P3
  __label_5: # endif
.annotate 'line', 2850
    WSubId_84(';', __ARG_2)
.annotate 'line', 2851

.end # PiropStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 2854
    new $P1, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2855
    getattribute $P8, self, 'start'
    $P1.'Statement'($P8, __ARG_1)
.annotate 'line', 2856
    getattribute $P9, self, 'opname'
    setattribute $P1, 'opname', $P9
.annotate 'line', 2857
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
.annotate 'line', 2857
    setattribute $P1, 'args', $P8
.annotate 'line', 2858
    .return($P1)
.annotate 'line', 2859

.end # clone


.sub 'optimize' :method
.annotate 'line', 2862
    getattribute $P1, self, 'args'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 2863
    .return(self)
.annotate 'line', 2864

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2867
    getattribute $P6, self, 'opname'
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 2868
    self.'annotate'(__ARG_1)
.annotate 'line', 2869
    $P6 = __ARG_1.'getDebug'()
    if_null $P6, __label_2
    unless $P6 goto __label_2
.annotate 'line', 2870
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
  __label_2: # endif
.annotate 'line', 2871
    getattribute $P1, self, 'args'
.annotate 'line', 2872
    __ARG_1.'print'('    ')
.annotate 'line', 2873
    unless_null $P1, __label_3
.annotate 'line', 2874
    __ARG_1.'say'($S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2877
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
.annotate 'line', 2876
    join $S2, ', ', $P6
    __ARG_1.'say'($S1, ' ', $S2)
  __label_4: # endif
.annotate 'line', 2879

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2831
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2833
    addattribute $P0, 'opname'
.annotate 'line', 2834
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_86 = "WSubId_86"
.annotate 'line', 2891
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2892
    $P1 = WSubId_85(__ARG_2)
.annotate 'line', 2893
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2894
    $P2 = __ARG_2.'get'()
    WSubId_27($P2)
  __label_1: # endif
.annotate 'line', 2895
    WSubId_84(';', __ARG_2)
.annotate 'line', 2896
    $P3 = WSubId_86($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2897
    .return(self)
.annotate 'line', 2898

.end # ExternStatement


.sub 'optimize' :method
.annotate 'line', 2899
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2902
    self.'annotate'(__ARG_1)
.annotate 'line', 2903
    getattribute $P1, self, 'path'
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
.annotate 'line', 2904

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2886
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2888
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_87 = "WSubId_87"
.annotate 'line', 2916
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2917
    null $P3
    $P1 = WSubId_67(__ARG_2, $P3, WSubId_87, ';')
.annotate 'line', 2918
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2919
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2920
    self.'createvarnamed'($P2, 'P', $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2922
    setattribute self, 'names', $P1
.annotate 'line', 2923

.end # StaticStatement


.sub 'optimize' :method
.annotate 'line', 2926
    .return(self)
.annotate 'line', 2927

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2930
    self.'annotate'(__ARG_1)
.annotate 'line', 2931
    getattribute $P2, self, 'names'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 2932
    $P5 = self.'getvar'($P1)
    $P4 = $P5.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P4, " = '", $P1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2934

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2911
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2913
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 2948
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2949
    $P1 = WSubId_85(__ARG_2)
.annotate 'line', 2950
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2951
    $P2 = __ARG_2.'get'()
    WSubId_27($P2)
  __label_1: # endif
.annotate 'line', 2952
    WSubId_84(';', __ARG_2)
.annotate 'line', 2953
    setattribute self, 'path', $P1
.annotate 'line', 2954

.end # UsingStatement


.sub 'optimize' :method
.annotate 'line', 2957
    getattribute $P1, self, 'path'
.annotate 'line', 2958
    $P2 = $P1[-1]
.annotate 'line', 2960
    $P3 = self.'scopesearch'($P1, 0)
.annotate 'line', 2962
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2976
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2963
    elements $I2, $P1
    unless $I2 goto __label_5
.annotate 'line', 2964
    clone $P4, $P1
.annotate 'line', 2965
    $P4.'pop'()
.annotate 'line', 2966
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2967
    if_null $P5, __label_6
.annotate 'line', 2968
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2969
    if_null $P3, __label_7
.annotate 'line', 2970
    self.'createvarused'($P2, $P3)
.annotate 'line', 2971
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_7: # endif
  __label_6: # endif
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2977
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2978
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2979
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2980
    self.'usesubid'($S1)
.annotate 'line', 2981
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2983
    self.'createvar'($P2, 'P')
.annotate 'line', 2984
    .return(self)
.annotate 'line', 2985

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2988
    getattribute $P1, self, 'path'
.annotate 'line', 2989
    $S1 = $P1[-1]
.annotate 'line', 2990
    $P2 = self.'getvar'($S1)
.annotate 'line', 2991
    getattribute $P4, self, 'subid'
    unless_null $P4, __label_1
.annotate 'line', 2992
    self.'annotate'(__ARG_1)
.annotate 'line', 2993
    null $S2
.annotate 'line', 2994
    elements $I1, $P1
    le $I1, 1, __label_2
.annotate 'line', 2995
    $P1.'pop'()
.annotate 'line', 2996
    set $P3, $P1
.annotate 'line', 2519
    null $S3
.annotate 'line', 2520
    elements $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 2521
    join $S4, "'; '", $P3
    concat $S5, "[ '", $S4
    concat $S5, $S5, "' ]"
    set $S3, $S5
  __label_4: # endif
.annotate 'line', 2522
    set $S2, $S3
    goto __label_3
  __label_3:
  __label_2: # endif
.annotate 'line', 2998
    $P4 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P4, $S1, $S2)
  __label_1: # endif
.annotate 'line', 3000

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2941
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2943
    addattribute $P0, 'path'
.annotate 'line', 2944
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3010
    $P1 = WSubId_85(__ARG_2)
.annotate 'line', 3011
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3012
    WSubId_70('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 3013
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 3014
    unless_null $P2, __label_2
.annotate 'line', 3015
    WSubId_25('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 3016
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 3017

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 3023
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 3024
    WSubId_88(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3025
    WSubId_84(';', __ARG_2)
.annotate 'line', 3026

.end # UsingNamespaceStatement


.sub 'optimize' :method
.annotate 'line', 3029
    .return(self)
.annotate 'line', 3030

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 3019
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 3045
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 3046
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 3047
    null $P2
  __label_1: # do
.annotate 'line', 3049
    $P3 = WSubId_68(__ARG_2, self)
.annotate 'line', 3050
    $P1.'push'($P3)
  __label_3: # continue
.annotate 'line', 3051
    $P2 = __ARG_2.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 3052
    WSubId_28(';', $P2)
.annotate 'line', 3053
    setattribute self, 'expr', $P1
.annotate 'line', 3054

.end # ExprStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3057
    new $P1, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 3058
    getattribute $P8, self, 'start'
    $P1.'Statement'($P8, __ARG_1)
.annotate 'line', 3059
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
.annotate 'line', 3059
    setattribute $P1, 'expr', $P8
.annotate 'line', 3060
    .return($P1)
.annotate 'line', 3061

.end # clone


.sub 'optimize' :method
.annotate 'line', 3064
    getattribute $P1, self, 'expr'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 3065
    .return(self)
.annotate 'line', 3066

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 3069
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
.annotate 'line', 3070

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 3040
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 3042
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
.annotate 'line', 3087
    setattribute self, 'type', __ARG_1
.annotate 'line', 3088
    setattribute self, 'reg', __ARG_2
.annotate 'line', 3089
    setattribute self, 'scope', __ARG_3
.annotate 'line', 3090
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 3091

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
.annotate 'line', 3094
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
.annotate 'line', 3095

.end # setlex


.sub 'gettype' :method
.annotate 'line', 3096
    getattribute $P1, self, 'type'
    .return($P1)

.end # gettype


.sub 'getreg' :method
.annotate 'line', 3097
    getattribute $P1, self, 'reg'
    .return($P1)

.end # getreg


.sub 'getscope' :method
.annotate 'line', 3098
    getattribute $P1, self, 'scope'
    .return($P1)

.end # getscope


.sub 'getvalue' :method
.annotate 'line', 3099
    getattribute $P1, self, 'value'
    .return($P1)

.end # getvalue


.sub 'isconst' :method
.annotate 'line', 3100
    .return(0)

.end # isconst


.sub 'getlex' :method
.annotate 'line', 3101
    getattribute $P1, self, 'lexname'
    .return($P1)

.end # getlex


.sub 'getflags' :method
.annotate 'line', 3102
    getattribute $P1, self, 'flags'
    .return($P1)

.end # getflags


.sub 'issubid' :method
.annotate 'line', 3105
    getattribute $P1, self, 'reg'
.annotate 'line', 3106
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_1
    set $S2, $P1
    substr $S1, $S2, 0, 7
    iseq $I1, $S1, 'WSubId_'
  __label_1:
    .return($I1)
.annotate 'line', 3107

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 3079
    addattribute $P0, 'type'
.annotate 'line', 3080
    addattribute $P0, 'reg'
.annotate 'line', 3081
    addattribute $P0, 'scope'
.annotate 'line', 3082
    addattribute $P0, 'flags'
.annotate 'line', 3083
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
.annotate 'line', 3115
    setattribute self, 'name', __ARG_1
.annotate 'line', 3116

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3119
    getattribute $P1, self, 'name'
    WSubId_30('Attempt to use unexpanded constant!!!', $P1)
.annotate 'line', 3120

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 3112
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3129
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
.annotate 'line', 3130

.end # VarData_const


.sub 'isconst' :method
.annotate 'line', 3131
    .return(1)

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3134
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 3135
    WSubId_30('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 3136
    setattribute self, 'value', __ARG_1
.annotate 'line', 3137

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 3123
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 3125
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'VarContainer' :method
.annotate 'line', 3148
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
.annotate 'line', 3149

.end # VarContainer


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3152
    getattribute $P1, self, 'locals'
.annotate 'line', 3153
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3154
    $P2 = $P1[$S1]
.annotate 'line', 3155
    if_null $P2, __label_2
.annotate 'line', 3156
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_25($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 3157
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 3158
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, $S2, self, __ARG_3)
    set $P3, $P4
.annotate 'line', 3159
    $P1[$S1] = $P3
.annotate 'line', 3160
    .return($P3)
.annotate 'line', 3161

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3164
    getattribute $P1, self, 'locals'
.annotate 'line', 3165
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3166
    $P2 = $P1[$S1]
.annotate 'line', 3167
    if_null $P2, __label_2
.annotate 'line', 3168
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3169
    $P1[$S1] = __ARG_2
.annotate 'line', 3170

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3173
    getattribute $P1, self, 'locals'
.annotate 'line', 3174
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3175
    $P2 = $P1[$S1]
.annotate 'line', 3176
    if_null $P2, __label_2
.annotate 'line', 3177
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3178
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
.annotate 'line', 3179

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3182
    getattribute $P1, self, 'locals'
.annotate 'line', 3183
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 3184
    $P2 = $P1[$S1]
.annotate 'line', 3185
    if_null $P2, __label_2
.annotate 'line', 3186
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 3187
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P4.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
    set $P3, $P4
.annotate 'line', 3188
    $P1[$S1] = $P3
.annotate 'line', 3189
    .return($P3)
.annotate 'line', 3190

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
.annotate 'line', 3193
    getattribute $P1, self, 'locals'
.annotate 'line', 3194
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
.annotate 'line', 3195

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
.annotate 'line', 3198
    null $P1
.annotate 'line', 3199
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 3200
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 3201
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 3203
    .return($P3)
.annotate 'line', 3204

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3207
    null $P1
.annotate 'line', 3208
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 3209
    .return($P1)
  __label_1: # endif
.annotate 'line', 3210
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 3211
    .return($P1)
  __label_2: # endif
.annotate 'line', 3212
    getattribute $P2, self, 'owner'
.annotate 'line', 3213
    if_null $P2, __label_3
.annotate 'line', 3214
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 3215
    .return($P3)
.annotate 'line', 3216

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
.annotate 'line', 3219
    $P1 = self.'getouter'()
.annotate 'line', 3220
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3221
    .return($S1)
.annotate 'line', 3222

.end # makelexical


.sub 'makelexicalself' :method
.annotate 'line', 3226
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 3227
    .return('__WLEX_self')
.annotate 'line', 3228

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 3143
    addattribute $P0, 'locals'
.annotate 'line', 3144
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]

.sub 'BlockStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3241
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 3242
    self.'VarContainer'()
.annotate 'line', 3243

.end # BlockStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 3237
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3254
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 3255

.end # Expr


.sub 'issimple' :method
.annotate 'line', 3256
    .return(0)

.end # issimple


.sub 'isliteral' :method
.annotate 'line', 3257
    .return(0)

.end # isliteral


.sub 'isintegerliteral' :method
.annotate 'line', 3258
    .return(0)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3259
    .return(0)

.end # isintegerzero


.sub 'isfloatliteral' :method
.annotate 'line', 3260
    .return(0)

.end # isfloatliteral


.sub 'isstringliteral' :method
.annotate 'line', 3261
    .return(0)

.end # isstringliteral


.sub 'isidentifier' :method
.annotate 'line', 3262
    .return(0)

.end # isidentifier


.sub 'isnull' :method
.annotate 'line', 3263
    .return(0)

.end # isnull


.sub 'hascompilevalue' :method
.annotate 'line', 3264
    .return(0)

.end # hascompilevalue


.sub 'isnegable' :method
.annotate 'line', 3265
    .return(0)

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
.annotate 'line', 3268
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 3269

.end # tempreg


.sub 'genlabel' :method
.annotate 'line', 3272
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 3273

.end # genlabel


.sub 'optimize' :method
.annotate 'line', 3277
    .return(self)
.annotate 'line', 3278

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 3279
    .return(0)

.end # cantailcall


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3284
    self.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 3285

.end # emit_init


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3288
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3289
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3290
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3291
    .return($S2)
.annotate 'line', 3292

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3295
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3296
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
.annotate 'line', 3298
    set $S2, "$I0"
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 3299
    set $S2, "$N0"
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3300
    set $S2, "$S0"
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 3301
    set $S2, "$P0"
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 3303
    concat $S3, "Unexcpected emit_void with type '", $S1
    concat $S3, $S3, "'"
    getattribute $P1, self, 'start'
    WSubId_30($S3, $P1)
  __label_3: # switch end
.annotate 'line', 3305
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3306

.end # emit_void


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3309
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3310
    WSubId_25("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 3311
    .tailcall self.'emit_get'(__ARG_1)
.annotate 'line', 3312

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 3315
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3316
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
.annotate 'line', 3317
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3318
    self.'annotate'(__ARG_1)
.annotate 'line', 3319
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 3320
    set $S1, $S2
  __label_2: # endif
.annotate 'line', 3322
    .return($S1)
.annotate 'line', 3323

.end # emit_getint


.sub 'emit_getvar' :method
        .param pmc __ARG_1
.annotate 'line', 3326
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3327
    $P1 = self.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3328
    eq $S1, 'P', __label_3
.annotate 'line', 3329
    set $S3, $S2
.annotate 'line', 3330
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 3331
    __ARG_1.'emitbox'($S2, $S3)
  __label_3: # endif
.annotate 'line', 3333
    .return($S2)
.annotate 'line', 3334

.end # emit_getvar


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
.annotate 'line', 3337
    WSubId_89(self)
.annotate 'line', 3338

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 3250
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
.annotate 'line', 3343
    .return(1)

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 3341
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FinalExpr' ]

.sub 'optimize' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3352
    typeof $P1, self
    set $S1, $P1
    concat $S2, "misuse of ", $S1
    WSubId_30($S2, self)
.annotate 'line', 3353

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
.annotate 'line', 3347
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 3363
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3364
    $P1 = __ARG_1.'get'()
.annotate 'line', 3365
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3366
    WSubId_70('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3367
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
.annotate 'line', 3368

.end # FunctionExpr


.sub 'checkresult' :method
.annotate 'line', 3369
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 3372
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3373
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3374
    .return(self)
.annotate 'line', 3375

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3378
    self.'annotate'(__ARG_1)
.annotate 'line', 3379
    getattribute $P1, self, 'fn'
.annotate 'line', 3380
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3381
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3382
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3384
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 3385

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3358
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3360
    addattribute $P0, 'fn'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
.annotate 'line', 3403
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3404
    .return(self)
.annotate 'line', 3405

.end # set


.sub 'optimize_condition' :method
.annotate 'line', 3408
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3409

.end # optimize_condition


.sub 'optimize' :method
.annotate 'line', 3412
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3413
    .return(self)
.annotate 'line', 3414

.end # optimize


.sub 'getvalue' :method
.annotate 'line', 3417
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3418
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3419
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
.annotate 'line', 3420
    .return(0)
.annotate 'line', 3421

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3424
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3426
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3427
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3428
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3430
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3431
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
.annotate 'line', 3434
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3437
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 3440
    WSubId_30('Invalid if condition')
  __label_6: # switch end
  __label_2: # endif
.annotate 'line', 3443

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3446
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3448
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3449
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3450
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3452
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 3453
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
.annotate 'line', 3456
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3459
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 3462
    WSubId_30('Invalid if condition')
  __label_6: # switch end
  __label_2: # endif
.annotate 'line', 3465

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3400
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
.annotate 'line', 3472
    .return(1)

.end # isliteral


.sub 'hascompilevalue' :method
.annotate 'line', 3473
    .return(1)

.end # hascompilevalue


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3470
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3484
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3485
    setattribute self, 'strval', __ARG_2
.annotate 'line', 3486

.end # StringLiteral


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3489
    new $P2, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P3, self, 'strval'
    $P2.'StringLiteral'(__ARG_1, $P3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 3490

.end # clone


.sub 'isstringliteral' :method
.annotate 'line', 3491
    .return(1)

.end # isstringliteral


.sub 'checkresult' :method
.annotate 'line', 3492
    .return('S')

.end # checkresult


.sub 'getPirString' :method
.annotate 'line', 3495
    getattribute $P1, self, 'strval'
.annotate 'line', 3496
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3497
    .return($S1)
.annotate 'line', 3498

.end # getPirString


.sub 'get_value' :method
.annotate 'line', 3501
    getattribute $P1, self, 'strval'
.annotate 'line', 3502
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3503
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3504
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3505
    .return($S1)
.annotate 'line', 3506

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3509
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
.annotate 'line', 3510

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3513
    .tailcall self.'getPirString'()
.annotate 'line', 3514

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3479
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3481
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3525
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3526
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3527
    set $I1, __ARG_3
.annotate 'line', 3528
    box $P1, $I1
    setattribute self, 'numval', $P1
.annotate 'line', 3529

.end # IntegerLiteral


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3532
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    getattribute $P3, self, 'pos'
    getattribute $P4, self, 'numval'
    $P2.'IntegerLiteral'(__ARG_1, $P3, $P4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 3533

.end # clone


.sub 'isintegerliteral' :method
.annotate 'line', 3534
    .return(1)

.end # isintegerliteral


.sub 'isintegerzero' :method
.annotate 'line', 3537
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
.annotate 'line', 3538

.end # isintegerzero


.sub 'checkresult' :method
.annotate 'line', 3539
    .return('I')

.end # checkresult


.sub 'getIntegerValue' :method
.annotate 'line', 3542
    getattribute $P1, self, 'numval'
    .return($P1)
.annotate 'line', 3543

.end # getIntegerValue


.sub 'getFloatValue' :method
.annotate 'line', 3546
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3547
    .return($N1)
.annotate 'line', 3548

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3551
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3552
    if $I1 goto __label_1
.annotate 'line', 3553
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3555
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_2: # endif
.annotate 'line', 3556

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3559
    .tailcall self.'getIntegerValue'()
.annotate 'line', 3560

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3519
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3521
    addattribute $P0, 'pos'
.annotate 'line', 3522
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3570
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3571
    setattribute self, 'numval', __ARG_2
.annotate 'line', 3572

.end # FloatLiteral


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3575
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    getattribute $P3, self, 'numval'
    $P2.'FloatLiteral'(__ARG_1, $P3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 3576

.end # clone


.sub 'isfloatliteral' :method
.annotate 'line', 3577
    .return(1)

.end # isfloatliteral


.sub 'checkresult' :method
.annotate 'line', 3578
    .return('N')

.end # checkresult


.sub 'getFloatValue' :method
.annotate 'line', 3581
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3582
    .return($N1)
.annotate 'line', 3583

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3586
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3587
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3588

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_90 = "WSubId_90"
.annotate 'line', 3591
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3592
    .tailcall WSubId_90($N1)
.annotate 'line', 3593

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3565
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3567
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'concat_literal' :subid('WSubId_94')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3603
    getattribute $P1, __ARG_1, 'strval'
.annotate 'line', 3604
    getattribute $P2, __ARG_2, 'strval'
.annotate 'line', 3607
    $P4 = $P1.'issinglequoted'()
    unless $P4 goto __label_3
    $P4 = $P2.'issinglequoted'()
  __label_3:
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 3609
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P6, $P1, 'file'
    getattribute $P7, $P1, 'line'
.annotate 'line', 3610
    getattribute $P8, $P1, 'str'
    set $S1, $P8
    getattribute $P9, $P2, 'str'
    set $S2, $P9
    concat $S3, $S1, $S2
    $P5.'TokenSingleQuoted'($P6, $P7, $S3)
    set $P3, $P5
    goto __label_1
  __label_2:
.annotate 'line', 3612
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P1, 'file'
    getattribute $P13, $P1, 'line'
.annotate 'line', 3613
    $P14 = $P1.'getasquoted'()
    set $S4, $P14
    $P15 = $P2.'getasquoted'()
    set $S5, $P15
    concat $S6, $S4, $S5
    $P11.'TokenQuoted'($P12, $P13, $S6)
    set $P10, $P11
    set $P3, $P10
  __label_1:
.annotate 'line', 3614
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 3615

.end # concat_literal

.namespace [ 'Winxed'; 'Compiler'; 'FunctionId' ]

.sub 'FunctionId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.annotate 'line', 3624
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3625
    box $P1, __ARG_4
    setattribute self, 'subid', $P1
.annotate 'line', 3626

.end # FunctionId


.sub 'checkresult' :method
.annotate 'line', 3627
    .return('P')

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3630
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 3631

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3634
    getattribute $P1, self, 'subid'
    __ARG_1.'emitset'(__ARG_2, $P1)
.annotate 'line', 3635

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
.annotate 'line', 3619
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3621
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionRef' ]

.sub 'FunctionRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3643
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3644
    setattribute self, 'sym', __ARG_3
.annotate 'line', 3645

.end # FunctionRef


.sub 'checkresult' :method
.annotate 'line', 3646
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3649
    getattribute $P1, self, 'sym'
.annotate 'line', 3650
    getattribute $P3, $P1, 'owner'
    $P2 = $P3.'getpath'()
.annotate 'line', 3651
    self.'annotate'(__ARG_1)
.annotate 'line', 3652
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'name'
    $P2.'emit_get_global'(__ARG_1, $P3, __ARG_2, $P4)
.annotate 'line', 3653

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
.annotate 'line', 3638
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3640
    addattribute $P0, 'sym'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
.annotate 'line', 3659
    .return(1)

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3662
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3663
    setattribute self, 'name', __ARG_2
.annotate 'line', 3664

.end # IdentifierExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 3667
    new $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3668
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 3669
    getattribute $P3, self, 'name'
    setattribute $P1, 'name', $P3
.annotate 'line', 3670
    .return($P1)
.annotate 'line', 3671

.end # clone


.sub 'isnull' :method
.annotate 'line', 3674
    getattribute $P1, self, 'name'
.annotate 'line', 3675
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3676
    .return(0)
  __label_1: # endif
.annotate 'line', 3677
    .tailcall $P1.'iskeyword'('null')
.annotate 'line', 3678

.end # isnull


.sub 'checkresult' :method
.annotate 'line', 3681
    getattribute $P1, self, 'name'
.annotate 'line', 3682
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3683
    if_null $P2, __label_1
.annotate 'line', 3684
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
    set $S1, $P1
    if $S1 == 'self' goto __label_5
    if $S1 == 'null' goto __label_6
    goto __label_3
  __label_5: # case
  __label_6: # case
.annotate 'line', 3689
    .return('P')
  __label_3: # default
.annotate 'line', 3691
    .return('')
  __label_4: # switch end
  __label_2: # endif
.annotate 'line', 3694

.end # checkresult


.sub 'getName' :method
.annotate 'line', 3697
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3698
    .return($S1)
.annotate 'line', 3699

.end # getName


.sub 'checkVar' :method
.annotate 'line', 3702
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
.annotate 'line', 3703

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3706
    getattribute $P1, self, 'name'
.annotate 'line', 3707
    unless_null $P1, __label_1
.annotate 'line', 3708
    WSubId_30('Bad thing')
  __label_1: # endif
.annotate 'line', 3709
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3710
    null $S1
.annotate 'line', 3711
    unless_null $P2, __label_2
    set $S2, $P1
    if $S2 == 'self' goto __label_6
    if $S2 == 'null' goto __label_7
    goto __label_4
  __label_6: # case
  __label_7: # case
.annotate 'line', 3715
    set $S1, $P1
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 3717
    set $S1, ''
  __label_5: # switch end
    goto __label_3
  __label_2: # else
.annotate 'line', 3721
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3722
    .return($S1)
.annotate 'line', 3723

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_91 = "WSubId_91"
.annotate 'line', 3726
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3727
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3728
    getattribute $P2, self, 'name'
    WSubId_91($P2, self)
  __label_1: # endif
.annotate 'line', 3729
    .return($P1)
.annotate 'line', 3730

.end # getIdentifier


.sub 'optimize' :method
.annotate 'line', 3733
    getattribute $P1, self, 'name'
.annotate 'line', 3734
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3735
    if_null $P2, __label_1
.annotate 'line', 3736
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3737
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3738
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3739
    band $I2, $I1, 1
    unless $I2 goto __label_4
.annotate 'line', 3740
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3741
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
    goto __label_5
  __label_4: # else
.annotate 'line', 3748
    $P3 = $P2.'getreg'()
.annotate 'line', 3749
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3750
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
.annotate 'line', 3754
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3756
    isnull $I2, $P4
    if $I2 goto __label_11
.annotate 'line', 3758
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I2 goto __label_12
.annotate 'line', 3768
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I2 goto __label_13
.annotate 'line', 3770
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    if $I2 goto __label_14
    goto __label_10
  __label_11: # case
    goto __label_9 # break
  __label_12: # case
.annotate 'line', 3759
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_15
.annotate 'line', 3760
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_17
    set $S1, $P6
  __label_17:
.annotate 'line', 3761
    self.'usesubid'($S1)
.annotate 'line', 3762
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
.annotate 'line', 3763
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionId'($P7, $P8, $P1, $S1)
    set $P5, $P6
    .return($P5)
    goto __label_16
  __label_15: # else
.annotate 'line', 3766
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionRef'($P7, $P8, $P4)
    set $P5, $P6
    .return($P5)
  __label_16: # endif
    goto __label_9 # break
  __label_13: # case
.annotate 'line', 3769
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    $P10.'FunctionRef'($P11, $P12, $P4)
    set $P9, $P10
    .return($P9)
  __label_14: # case
.annotate 'line', 3771
    new $P14, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
    getattribute $P15, self, 'owner'
    getattribute $P16, self, 'start'
    $P14.'InlineRef'($P15, $P16, $P4)
    set $P13, $P14
    .return($P13)
  __label_10: # default
  __label_9: # switch end
  __label_2: # endif
.annotate 'line', 3774
    .return(self)
.annotate 'line', 3775

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3778
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3779
    self.'annotate'(__ARG_1)
.annotate 'line', 3780
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3781

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3785
    null $S1
.annotate 'line', 3786
    $P2 = self.'getIdentifier'()
    set $S1, $P2
.annotate 'line', 3787
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3788
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_1:
.annotate 'line', 3789
    band $I2, $I1, 1
    unless $I2 goto __label_3
.annotate 'line', 3790
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 3791
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 3792
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
  __label_7:
    unless $I2 goto __label_6
.annotate 'line', 3793
    self.'annotate'(__ARG_1)
  __label_6: # endif
.annotate 'line', 3794
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 3797
    .return($S1)
.annotate 'line', 3798

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3801
    self.'annotate'(__ARG_1)
.annotate 'line', 3802
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3803
    WSubId_25("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3804
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3805
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3806
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
.annotate 'line', 3810
    __ARG_1.'emitnull'($S2)
    goto __label_7 # break
  __label_6: # default
.annotate 'line', 3813
    WSubId_25("Can't assign null to that type", self)
  __label_7: # switch end
    goto __label_5
  __label_4: # else
.annotate 'line', 3816
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3817
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 3819
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3820
    ne $S3, 'v', __label_13
.annotate 'line', 3821
    WSubId_25("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3822
    ne $S1, $S3, __label_14
.annotate 'line', 3823
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 3826
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3827
    self.'annotate'(__ARG_1)
.annotate 'line', 3828
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3829
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3831
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
  __label_15: # endif
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3834
    .return($S2)
.annotate 'line', 3835

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3656
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3658
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3845
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3846
    setattribute self, 'desc', __ARG_2
.annotate 'line', 3847

.end # LexicalVolatileExpr


.sub 'checkresult' :method
.annotate 'line', 3850
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
.annotate 'line', 3851

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3854
    getattribute $P1, self, 'desc'
.annotate 'line', 3855
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3856
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3857
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3858
    .return($S2)
.annotate 'line', 3859

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3862
    self.'annotate'(__ARG_1)
.annotate 'line', 3863
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3864
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 3865

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3868
    getattribute $P1, self, 'owner'
.annotate 'line', 3869
    getattribute $P2, self, 'desc'
.annotate 'line', 3870
    $P3 = $P2.'gettype'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3871
    null $S2
.annotate 'line', 3873
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3877
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3874
    $P3 = $P1.'tempreg'($S1)
    set $S2, $P3
.annotate 'line', 3875
    __ARG_1.'emitnull'($S2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3878
    $P4 = $P1.'tempreg'($S1)
    set $S2, $P4
.annotate 'line', 3879
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3882
    ne $S1, 'P', __label_6
.annotate 'line', 3883
    $P5 = __ARG_2.'emit_getvar'(__ARG_1)
    set $S2, $P5
    goto __label_7
  __label_6: # else
.annotate 'line', 3884
    $P6 = __ARG_2.'checkresult'()
    set $S3, $P6
    ne $S1, $S3, __label_8
.annotate 'line', 3885
    $P7 = __ARG_2.'emit_get'(__ARG_1)
    set $S2, $P7
    goto __label_9
  __label_8: # else
.annotate 'line', 3887
    $P8 = $P1.'tempreg'($S1)
    set $S2, $P8
.annotate 'line', 3888
    __ARG_2.'emit'(__ARG_1, $S2)
  __label_9: # endif
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 3892
    $P3 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P3, $S2)
.annotate 'line', 3893
    .return($S2)
.annotate 'line', 3894

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3897
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
.annotate 'line', 3898

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3840
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 3842
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3907
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3908

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3903
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 3918
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3919
    $P2 = WSubId_85(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3920
    getattribute $P1, self, 'key'
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3921
    WSubId_70('namespace identifier', __ARG_3)
  __label_1: # endif
.annotate 'line', 3922

.end # OpNamespaceExpr


.sub 'checkresult' :method
.annotate 'line', 3923
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 3926
    getattribute $P1, self, 'owner'
.annotate 'line', 3927
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3928
    unless_null $P2, __label_1
.annotate 'line', 3929
    WSubId_25('unknown namespace', self)
  __label_1: # endif
.annotate 'line', 3930
    $P3 = $P2.'getpath'()
.annotate 'line', 3931
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3932

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3913
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3915
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 3943
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3944
    $P2 = WSubId_92(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
.annotate 'line', 3945

.end # OpClassExpr


.sub 'checkresult' :method
.annotate 'line', 3946
    .return('P')

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 3949
    getattribute $P1, self, 'owner'
.annotate 'line', 3950
    getattribute $P2, self, 'clspec'
.annotate 'line', 3951
    null $P3
.annotate 'line', 3954
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
.annotate 'line', 3957
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    if $I1 goto __label_4
.annotate 'line', 3960
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 3955
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3956
    if_null $P3, __label_7
    getattribute $P4, $P3, 'path'
    goto __label_6
  __label_7:
    null $P4
  __label_6:
    .return($P4)
  __label_4: # case
.annotate 'line', 3958
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3959
    if_null $P3, __label_9
    getattribute $P5, $P3, 'path'
    goto __label_8
  __label_9:
    null $P5
  __label_8:
    .return($P5)
  __label_5: # case
.annotate 'line', 3961
    typeof $P6, $P2
    set $S1, $P6
    concat $S2, $S1, " not supported yet here"
.annotate 'line', 3962
    getattribute $P7, $P2, 'start'
.annotate 'line', 3961
    WSubId_25($S2, $P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3964
    getattribute $P4, $P2, 'start'
    WSubId_30("Unexpected class key", $P4)
.annotate 'line', 3965

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3968
    getattribute $P1, self, 'owner'
.annotate 'line', 3969
    getattribute $P2, self, 'clspec'
.annotate 'line', 3972
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 3973
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3974
    if_null $P3, __label_4
.annotate 'line', 3975
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3976
    .return()
  __label_4: # endif
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3981
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3982
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3983
    __ARG_1.'say'()
.annotate 'line', 3984

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3937
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3939
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3994
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3995
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3996

.end # OpUnaryExpr


.sub 'cloneunary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3999
    getattribute $P1, self, 'start'
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'clone'(__ARG_2)
    __ARG_1.'OpUnaryExpr'(__ARG_2, $P1, $P2)
.annotate 'line', 4000
    .return(__ARG_1)
.annotate 'line', 4001

.end # cloneunary


.sub 'optimizearg' :method
.annotate 'line', 4004
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
.annotate 'line', 4005

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 4008
    self.'optimizearg'()
.annotate 'line', 4009
    .return(self)
.annotate 'line', 4010

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3989
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3991
    addattribute $P0, 'subexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4021
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 4022
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4023
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 4024

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4027
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4028
    .return(self)
.annotate 'line', 4029

.end # set


.sub 'clonebinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4032
    getattribute $P1, self, 'start'
.annotate 'line', 4033
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'clone'(__ARG_2)
    getattribute $P5, self, 'rexpr'
    $P4 = $P5.'clone'(__ARG_2)
.annotate 'line', 4032
    __ARG_1.'initbinary'(__ARG_2, $P1, $P2, $P4)
.annotate 'line', 4034
    .return(__ARG_1)
.annotate 'line', 4035

.end # clonebinary


.sub 'setfrom' :method
        .param pmc __ARG_1
.annotate 'line', 4038
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 4039

.end # setfrom


.sub 'optimizearg' :method
.annotate 'line', 4042
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 4043
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 4044

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 4047
    self.'optimizearg'()
.annotate 'line', 4048
    .return(self)
.annotate 'line', 4049

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
.annotate 'line', 4052
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 4053

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
.annotate 'line', 4056
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
.annotate 'line', 4057

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 4015
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 4017
    addattribute $P0, 'lexpr'
.annotate 'line', 4018
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4066
    .return('I')
.annotate 'line', 4067

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4070
    self.'optimizearg'()
.annotate 'line', 4071
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4072
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4073
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4074
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 4075
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4076
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_44($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 4078
    .return(self)
.annotate 'line', 4079

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 4062
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
.annotate 'line', 4088
    .return('I')
.annotate 'line', 4089

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 4084
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4097
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4098

.end # OpDeleteExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4101
    self.'optimizearg'()
.annotate 'line', 4102
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4103
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    not $I1, $I2
    if $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    iseq $I1, $S1, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 4104
    WSubId_25("delete with invalid operator", self)
  __label_1: # endif
.annotate 'line', 4105
    .return(self)
.annotate 'line', 4106

.end # optimize


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4109
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4110
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 4111
    self.'annotate'(__ARG_1)
.annotate 'line', 4112
    __ARG_1.'print'('    delete ')
.annotate 'line', 4113
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 4114
    __ARG_1.'say'()
.annotate 'line', 4115

.end # emit_void


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4118
    self.'emit_void'(__ARG_1)
.annotate 'line', 4119
    __ARG_1.'emitset'(__ARG_2, '1')
.annotate 'line', 4120

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 4093
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4127
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4128

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4131
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4132
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 4133
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 4134
    self.'annotate'(__ARG_1)
.annotate 'line', 4135
    __ARG_1.'print'('    exists ', __ARG_2, ', ')
.annotate 'line', 4136
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 4137
    __ARG_1.'say'()
    goto __label_2
  __label_1: # else
.annotate 'line', 4140
    WSubId_25("exists with invalid operator", self)
  __label_2: # endif
.annotate 'line', 4141

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 4123
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4150
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4151

.end # OpUnaryMinusExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4154
    new $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4155

.end # clone


.sub 'checkresult' :method
.annotate 'line', 4158
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4159

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4162
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4163
    .return(self)
.annotate 'line', 4164

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_93 = "WSubId_93"
.annotate 'line', 4167
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4168
    self.'optimizearg'()
.annotate 'line', 4169
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4170
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4171
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4173
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4174
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 4175
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_93($P2, $P3, $N2)
  __label_2: # endif
.annotate 'line', 4177
    .return(self)
.annotate 'line', 4178

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4181
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4182
    self.'annotate'(__ARG_1)
.annotate 'line', 4183
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
.annotate 'line', 4184

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 4146
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4193
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4194

.end # OpNotExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4197
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4198

.end # clone


.sub 'isnegable' :method
.annotate 'line', 4199
    .return(1)

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 4202
    .return('I')
.annotate 'line', 4203

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4206
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4207
    .return(self)
.annotate 'line', 4208

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4211
    self.'optimizearg'()
.annotate 'line', 4212
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4213
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4214
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4215
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4217
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4218
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4219
    .return(self)
.annotate 'line', 4220

.end # optimize


.sub 'negated' :method
.annotate 'line', 4223
    getattribute $P1, self, 'subexpr'
    .return($P1)
.annotate 'line', 4224

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4227
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4228
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4229
    self.'annotate'(__ARG_1)
.annotate 'line', 4230
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
.annotate 'line', 4232
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 4235
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 4238
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_3: # switch end
.annotate 'line', 4240

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 4189
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]

.sub 'OpBinNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4249
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4250

.end # OpBinNotExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4253
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4254

.end # clone


.sub 'checkresult' :method
.annotate 'line', 4257
    .return('I')
.annotate 'line', 4258

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4261
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4262
    .return(self)
.annotate 'line', 4263

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4266
    self.'optimizearg'()
.annotate 'line', 4267
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4268
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4269
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4270
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
.annotate 'line', 4272
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4273
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 4274
    .return(self)
.annotate 'line', 4275

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4278
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4279
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4280
    self.'annotate'(__ARG_1)
.annotate 'line', 4281
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
.annotate 'line', 4282

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 4245
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
.annotate 'line', 4291
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4292

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4295
    getattribute $P1, self, 'subexpr'
.annotate 'line', 4296
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 4297
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 4298

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 4287
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4307
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4308
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4309

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4312
    self.'emit_get'(__ARG_1)
.annotate 'line', 4313

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 4303
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4320
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4321

.end # OpPreIncExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4324
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4325

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4328
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4329
    self.'annotate'(__ARG_1)
.annotate 'line', 4330
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4331
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4332
    .return($S1)
.annotate 'line', 4333

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 4316
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4340
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4341

.end # OpPreDecExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4344
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4345

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4348
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4349
    self.'annotate'(__ARG_1)
.annotate 'line', 4350
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4351
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4352
    .return($S1)
.annotate 'line', 4353

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 4336
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4362
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4363

.end # OpPostIncExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4366
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4367

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4370
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4371
    self.'annotate'(__ARG_1)
.annotate 'line', 4372
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_2
.annotate 'line', 4373
    $P2 = self.'tempreg'('P')
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 4374
    __ARG_1.'emitarg2'('clone', $S2, $S1)
.annotate 'line', 4375
    __ARG_1.'emitset'(__ARG_2, $S2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4378
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 4379
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4380
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4381

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4384
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4385
    self.'annotate'(__ARG_1)
.annotate 'line', 4386
    $P2 = self.'checkresult'()
    $P1 = self.'tempreg'($P2)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4387
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_3
.annotate 'line', 4388
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 4390
    __ARG_1.'emitset'($S2, $S1)
  __label_4: # endif
.annotate 'line', 4391
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4392
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4393
    .return($S2)
.annotate 'line', 4394

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4397
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4398
    self.'annotate'(__ARG_1)
.annotate 'line', 4399
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4400
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4401

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 4358
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4408
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4409

.end # OpPostDecExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4412
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)
.annotate 'line', 4413

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4416
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4417
    self.'annotate'(__ARG_1)
.annotate 'line', 4418
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_2
.annotate 'line', 4419
    $P2 = self.'tempreg'('P')
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 4420
    __ARG_1.'emitarg2'('clone', $S2, $S1)
.annotate 'line', 4421
    __ARG_1.'emitset'(__ARG_2, $S2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4424
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 4425
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4426
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4427
    .return($S1)
.annotate 'line', 4428

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4431
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4432
    self.'annotate'(__ARG_1)
.annotate 'line', 4433
    $P2 = self.'checkresult'()
    $P1 = self.'tempreg'($P2)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4434
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_3
.annotate 'line', 4435
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 4437
    __ARG_1.'emitset'($S2, $S1)
  __label_4: # endif
.annotate 'line', 4438
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4439
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4440
    .return($S2)
.annotate 'line', 4441

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4444
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4445
    self.'annotate'(__ARG_1)
.annotate 'line', 4446
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4447
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4448

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 4404
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4459
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4460
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4461
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 4462
    .return(self)
.annotate 'line', 4463

.end # set


.sub 'cloneassign' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4466
    getattribute $P1, self, 'start'
.annotate 'line', 4467
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'clone'(__ARG_2)
    getattribute $P5, self, 'rexpr'
    $P4 = $P5.'clone'(__ARG_2)
.annotate 'line', 4466
    .tailcall __ARG_1.'set'(__ARG_2, $P1, $P2, $P4)
.annotate 'line', 4468

.end # cloneassign


.sub 'checkresult' :method
.annotate 'line', 4471
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
.annotate 'line', 4472

.end # checkresult


.sub 'optimize_base' :method
.annotate 'line', 4475
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 4476
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 4477
    .return(self)
.annotate 'line', 4478

.end # optimize_base


.sub 'optimize' :method
.annotate 'line', 4481
    .tailcall self.'optimize_base'()
.annotate 'line', 4482

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_89 = "WSubId_89"
.annotate 'line', 4485
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4486
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
    $P2 = $P1.'isliteral'()
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4487
    WSubId_89($P1)
  __label_1: # endif
.annotate 'line', 4488

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4491
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4492
    self.'annotate'(__ARG_1)
.annotate 'line', 4493
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 4494

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4497
    self.'emit_get'(__ARG_1)
.annotate 'line', 4498

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 4453
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4455
    addattribute $P0, 'lexpr'
.annotate 'line', 4456
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4507
    new $P1, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    .tailcall self.'cloneassign'($P1, __ARG_1)
.annotate 'line', 4508

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4511
    self.'annotate'(__ARG_1)
.annotate 'line', 4512
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4513
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4514

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4517
    self.'annotate'(__ARG_1)
.annotate 'line', 4518
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4519
    getattribute $P2, self, 'rexpr'
    $P1.'emit_assign_get'(__ARG_1, $P2)
.annotate 'line', 4520

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 4503
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4529
    self.'annotate'(__ARG_1)
.annotate 'line', 4530
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4531
    __ARG_1.'emitassign'(__ARG_2, $S1)
.annotate 'line', 4532

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4535
    self.'checkleft'()
.annotate 'line', 4536
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4537
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 4538
    WSubId_25("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 4539
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 4540
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 4541
    self.'annotate'(__ARG_1)
.annotate 'line', 4542
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 4543
    .return($S1)
.annotate 'line', 4544

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 4547
    self.'annotate'(__ARG_1)
.annotate 'line', 4548
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4549

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 4525
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4558
    self.'checkleft'()
.annotate 'line', 4559
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4560
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4561
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4562
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4563
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4564
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 4565
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
.annotate 'line', 4567
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 4568
    null $S5
.annotate 'line', 4569
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
.annotate 'line', 4572
    eq $S2, 'S', __label_13
.annotate 'line', 4573
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4574
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4575
    set $S4, $S5
  __label_13: # endif
.annotate 'line', 4577
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 4581
    eq $S1, $S2, __label_14
.annotate 'line', 4582
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4583
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4584
    set $S4, $S5
  __label_14: # endif
.annotate 'line', 4586
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_9 # break
  __label_8: # default
.annotate 'line', 4589
    __ARG_1.'emitaddto'($S3, $S4)
  __label_9: # switch end
  __label_5: # endif
.annotate 'line', 4592
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_15
.annotate 'line', 4593
    $P1.'emit_store'(__ARG_1, $S3)
  __label_15: # endif
.annotate 'line', 4594
    .return($S3)
.annotate 'line', 4595

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 4554
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 4604
    self.'checkleft'()
.annotate 'line', 4605
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4606
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4607
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4608
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4609
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4610
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4611
    null $S5
.annotate 'line', 4612
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
.annotate 'line', 4615
    WSubId_25("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4618
    eq $S1, $S2, __label_10
.annotate 'line', 4619
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4620
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4621
    set $S4, $S5
  __label_10: # endif
.annotate 'line', 4623
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 4626
    __ARG_1.'emitsubto'($S3, $S4)
  __label_6: # switch end
.annotate 'line', 4628
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 4629
    $P1.'emit_store'(__ARG_1, $S3)
  __label_11: # endif
.annotate 'line', 4630
    .return($S3)
.annotate 'line', 4631

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4600
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4640
    self.'checkleft'()
.annotate 'line', 4641
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4642
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4643
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4644
    null $S2
.annotate 'line', 4645
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    if_null $S3, __label_2
    length $I1, $S3
    ne $I1, 1, __label_2
    ord $I1, $S3
    if $I1 == 83 goto __label_4
    goto __label_2
  __label_4: # case
.annotate 'line', 4647
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4648
    self.'annotate'(__ARG_1)
.annotate 'line', 4649
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 4652
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4653
    self.'annotate'(__ARG_1)
.annotate 'line', 4654
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_3: # switch end
.annotate 'line', 4656
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_5
.annotate 'line', 4657
    $P1.'emit_store'(__ARG_1, $S1)
  __label_5: # endif
.annotate 'line', 4658
    .return($S1)
.annotate 'line', 4659

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4636
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4668
    self.'checkleft'()
.annotate 'line', 4669
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4670
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4671
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4672
    self.'annotate'(__ARG_1)
.annotate 'line', 4673
    __ARG_1.'emitarg2'('div', $S1, $S2)
.annotate 'line', 4674
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 4675
    $P1.'emit_store'(__ARG_1, $S1)
  __label_3: # endif
.annotate 'line', 4676
    .return($S1)
.annotate 'line', 4677

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4664
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4686
    self.'checkleft'()
.annotate 'line', 4687
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4688
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4689
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4690
    self.'annotate'(__ARG_1)
.annotate 'line', 4691
    __ARG_1.'emitarg2'('mod', $S1, $S2)
.annotate 'line', 4692
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 4693
    $P1.'emit_store'(__ARG_1, $S1)
  __label_3: # endif
.annotate 'line', 4694
    .return($S1)
.annotate 'line', 4695

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4682
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4707
    .return('I')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4710
    self.'optimizearg'()
.annotate 'line', 4711
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4712
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4713
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4714
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 4715
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4716
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_44($P3, $P4, $P5)
  __label_1: # endif
.annotate 'line', 4718
    .return(self)
.annotate 'line', 4719

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 4722
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4723
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4724
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4725
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4726
    self.'annotate'(__ARG_1)
.annotate 'line', 4727
    null $S5
.annotate 'line', 4729
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4734
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4739
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4744
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4749
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4754
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4730
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4731
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4732
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4735
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4736
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4737
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4740
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4741
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4742
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4745
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4746
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4747
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4750
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4751
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4752
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4755
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4756
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4757
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4758
    if __ARG_3 == 0 goto __label_21
    if __ARG_3 == 1 goto __label_22
    if __ARG_3 == 2 goto __label_23
    goto __label_19
  __label_21: # case
.annotate 'line', 4763
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_22: # case
.annotate 'line', 4766
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_23: # case
.annotate 'line', 4769
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_19: # default
  __label_20: # switch end
.annotate 'line', 4772

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4775
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4776

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4779
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
.annotate 'line', 4780

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4783
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
.annotate 'line', 4784

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4705
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
.annotate 'line', 4795
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
.annotate 'line', 4796

.end # Negable


.sub 'isnegable' :method
.annotate 'line', 4797
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 4800
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4801
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4802
    .return(self)
.annotate 'line', 4803

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4791
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4817
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4818
    self.'Negable'(__ARG_3)
.annotate 'line', 4819
    setattribute self, 'expr', __ARG_2
.annotate 'line', 4820

.end # CheckerExpr


.sub 'isnegable' :method
.annotate 'line', 4821
    .return(1)

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 4822
    .return('I')

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4811
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4813
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4829
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4830

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4833
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4834
    self.'annotate'(__ARG_1)
.annotate 'line', 4835
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4836
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4837
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
.annotate 'line', 4838

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4841
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4842
    self.'annotate'(__ARG_1)
.annotate 'line', 4843
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4844
    __ARG_1.'emitif_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4846
    __ARG_1.'emitunless_null'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4847

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4850
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4851
    self.'annotate'(__ARG_1)
.annotate 'line', 4852
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4853
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4855
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4856

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4825
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]

.sub 'ZeroCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 4863
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4864

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4867
    getattribute $P1, self, 'expr'
.annotate 'line', 4868
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4869
    self.'annotate'(__ARG_1)
.annotate 'line', 4870
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4871
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4873
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_3: # endif
.annotate 'line', 4874

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4877
    getattribute $P1, self, 'expr'
.annotate 'line', 4878
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4879
    self.'annotate'(__ARG_1)
.annotate 'line', 4880
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4881
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4883
    __ARG_1.'emitif'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4884

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4887
    getattribute $P1, self, 'expr'
.annotate 'line', 4888
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4889
    self.'annotate'(__ARG_1)
.annotate 'line', 4890
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4891
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4893
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
.annotate 'line', 4894

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4859
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
.annotate 'line', 4903
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4904
    self.'Negable'(__ARG_5)
.annotate 'line', 4905

.end # OpEqualExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4908
    new $P2, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = self.'clonebinary'($P2, __ARG_1)
.annotate 'line', 4909
    getattribute $P2, self, 'positive'
    $P1.'Negable'($P2)
.annotate 'line', 4910
    .return($P1)
.annotate 'line', 4911

.end # clone


.sub 'isnegable' :method
.annotate 'line', 4912
    .return(1)

.end # isnegable


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 4915
    self.'optimizearg'()
.annotate 'line', 4916
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4917
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4918
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4919
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4920
    unless $I1 goto __label_1
.annotate 'line', 4921
    unless $I2 goto __label_2
.annotate 'line', 4922
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_44($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4924
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
  __label_1: # endif
.annotate 'line', 4926
    unless $I2 goto __label_4
.annotate 'line', 4927
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4928
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4929
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4930
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_8
    $P3 = $P2.'isliteral'()
  __label_8:
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 4931
    ne $S1, $S2, __label_9
    if_null $S1, __label_10
    length $I7, $S1
    ne $I7, 1, __label_10
    ord $I7, $S1
    if $I7 == 73 goto __label_12
    if $I7 == 83 goto __label_13
    goto __label_10
  __label_12: # case
.annotate 'line', 4934
    $P4 = $P1.'getIntegerValue'()
    set $I3, $P4
.annotate 'line', 4935
    $P5 = $P2.'getIntegerValue'()
    set $I4, $P5
.annotate 'line', 4936
    getattribute $P6, self, 'positive'
    if_null $P6, __label_15
    unless $P6 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4937
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    .tailcall WSubId_44($P7, $P8, $I5)
  __label_13: # case
.annotate 'line', 4939
    getattribute $P10, $P1, 'strval'
    getattribute $P9, $P10, 'str'
    null $S3
    if_null $P9, __label_16
    set $S3, $P9
  __label_16:
.annotate 'line', 4940
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_17
    set $S4, $P11
  __label_17:
.annotate 'line', 4941
    getattribute $P13, self, 'positive'
    if_null $P13, __label_19
    unless $P13 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4942
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    .tailcall WSubId_44($P14, $P15, $I6)
  __label_10: # default
  __label_11: # switch end
  __label_9: # endif
  __label_7: # endif
.annotate 'line', 4946
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4947
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4948
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4949
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4950
    .return(self)
.annotate 'line', 4951

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4954
    self.'annotate'(__ARG_1)
.annotate 'line', 4955
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'iseq'
    goto __label_1
  __label_2:
    set $S1, 'isne'
  __label_1:
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4956

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 4959
    self.'annotate'(__ARG_1)
.annotate 'line', 4960
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 4961

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4964
    self.'annotate'(__ARG_1)
.annotate 'line', 4965
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'eq'
    goto __label_1
  __label_2:
    set $S1, 'ne'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4966

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4969
    self.'annotate'(__ARG_1)
.annotate 'line', 4970
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'ne'
    goto __label_1
  __label_2:
    set $S1, 'eq'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 4971

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4899
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
.annotate 'line', 4982
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4983
    self.'Negable'(__ARG_5)
.annotate 'line', 4984

.end # OpSameExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 4987
    new $P2, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P1 = self.'clonebinary'($P2, __ARG_1)
.annotate 'line', 4988
    getattribute $P2, self, 'positive'
    $P1.'Negable'($P2)
.annotate 'line', 4989
    .return($P1)
.annotate 'line', 4990

.end # clone


.sub 'isnegable' :method
.annotate 'line', 4991
    .return(1)

.end # isnegable


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4994
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
.annotate 'line', 4995

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 4998
    self.'annotate'(__ARG_1)
.annotate 'line', 4999
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 5000
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 5001
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5002

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5005
    self.'emit_comparator'(__ARG_1, __ARG_2)
.annotate 'line', 5006

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5009
    self.'annotate'(__ARG_1)
.annotate 'line', 5010
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 5011
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 5012
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5013

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5016
    self.'annotate'(__ARG_1)
.annotate 'line', 5017
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 5018
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 5019
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5020

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4977
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4979
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5029
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5030

.end # clone


.sub 'isnegable' :method
.annotate 'line', 5031
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 5034
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 5035

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5038
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5039

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5042
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5043

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5046
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5047

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5050
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5051

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 5025
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5060
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5061

.end # clone


.sub 'isnegable' :method
.annotate 'line', 5062
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 5065
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 5066

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5069
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5070

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5073
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5074

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5077
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5078

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5081
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5082

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 5056
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5091
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5092

.end # clone


.sub 'isnegable' :method
.annotate 'line', 5093
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 5096
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 5097

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5100
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5101

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5104
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5105

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5108
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5109

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5112
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5113

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 5087
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5122
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5123

.end # clone


.sub 'isnegable' :method
.annotate 'line', 5124
    .return(1)

.end # isnegable


.sub 'negated' :method
.annotate 'line', 5127
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
.annotate 'line', 5128

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5131
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5132

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5135
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5136

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5139
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5140

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 5143
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
.annotate 'line', 5144

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 5118
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
.annotate 'line', 5153
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
.annotate 'line', 5155

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 5149
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5164
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5165

.end # OpBoolAndExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5168
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5169

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 5172
    self.'optimizearg'()
.annotate 'line', 5173
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 5174
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5175
    unless $I1 goto __label_3
.annotate 'line', 5176
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 5177
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_44($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 5175
    .return($P1)
  __label_1: # endif
.annotate 'line', 5179
    .return(self)
.annotate 'line', 5180

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5183
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5184
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5185
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5186
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
.annotate 'line', 5187
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5188
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5189
    __ARG_1.'emitbinop'('and', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5192
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5193
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 5194
    $P4 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 5195
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 5198
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 5199
    __ARG_1.'emitunless'(__ARG_2, $S4)
.annotate 'line', 5200
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5201
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 5202
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 5205
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 5206
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5208

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5211
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5212
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5213
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5214
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
.annotate 'line', 5215
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5216
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5217
    __ARG_1.'emitbinop'('and', "$I0", $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5220
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5221
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_9
    set $S5, $P3
  __label_9:
.annotate 'line', 5222
    __ARG_1.'emitunless'($S5, $S4)
.annotate 'line', 5223
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 5224
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5226

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 5160
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5235
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5236

.end # OpBoolOrExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5239
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5240

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 5243
    self.'optimizearg'()
.annotate 'line', 5244
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 5245
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5246
    if $I1 goto __label_3
.annotate 'line', 5247
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 5248
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_44($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 5246
    .return($P1)
  __label_1: # endif
.annotate 'line', 5250
    .return(self)
.annotate 'line', 5251

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5254
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5255
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5256
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5257
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
.annotate 'line', 5258
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5259
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5260
    __ARG_1.'emitbinop'('or', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5263
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5264
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 5265
    $P4 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 5266
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 5269
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
.annotate 'line', 5270
    __ARG_1.'emitif'(__ARG_2, $S4)
.annotate 'line', 5271
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5272
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
.annotate 'line', 5273
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
.annotate 'line', 5276
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
.annotate 'line', 5277
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5279

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 5282
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5283
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5284
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5285
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
.annotate 'line', 5286
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 5287
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
.annotate 'line', 5288
    __ARG_1.'emitbinop'('or', "$I0", $S2, $S3)
    goto __label_3
  __label_2: # else
.annotate 'line', 5291
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 5292
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_9
    set $S5, $P3
  __label_9:
.annotate 'line', 5293
    __ARG_1.'emitif'($S5, $S4)
.annotate 'line', 5294
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 5295
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif
.annotate 'line', 5297

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 5231
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 5302
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5312
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5313

.end # OpBinAndExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5316
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5317

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5320
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5321
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5322
    self.'annotate'(__ARG_1)
.annotate 'line', 5323
    __ARG_1.'emitbinop'('band', __ARG_2, $S1, $S2)
.annotate 'line', 5324

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5327
    band $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5328

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 5308
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5337
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5338

.end # OpBinOrExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5341
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5342

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5345
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5346
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5347
    self.'annotate'(__ARG_1)
.annotate 'line', 5348
    __ARG_1.'emitbinop'('bor', __ARG_2, $S1, $S2)
.annotate 'line', 5349

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5352
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5353

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 5333
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5362
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5363

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5366
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5367
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5368
    self.'annotate'(__ARG_1)
.annotate 'line', 5369
    __ARG_1.'emitbinop'('bxor', __ARG_2, $S1, $S2)
.annotate 'line', 5370

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5373
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5374

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 5358
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5384
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5386
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 5393
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5387
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 5388
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 5389
    getattribute $P3, __ARG_4, 'values'
    self.'append'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 5391
    self.'pushexpr'(__ARG_4)
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5394
    getattribute $P5, __ARG_4, 'values'
    setattribute self, 'values', $P5
.annotate 'line', 5395
    self.'unshiftexpr'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 5398
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = __ARG_3
    $P7[1] = __ARG_4
    setattribute self, 'values', $P7
  __label_1: # switch end
.annotate 'line', 5400

.end # ConcatString


.sub 'pushexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_94 = "WSubId_94"
.annotate 'line', 5403
    getattribute $P1, self, 'values'
.annotate 'line', 5404
    $P2 = $P1[-1]
.annotate 'line', 5405
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5406
    $P4 = WSubId_94($P2, __ARG_1)
    $P1[-1] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5408
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 5409

.end # pushexpr


.sub 'unshiftexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_94 = "WSubId_94"
.annotate 'line', 5412
    getattribute $P1, self, 'values'
.annotate 'line', 5413
    $P2 = $P1[0]
.annotate 'line', 5414
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5415
    $P4 = WSubId_94(__ARG_1, $P2)
    $P1[0] = $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 5417
    unshift $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 5418

.end # unshiftexpr


.sub 'append' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_94 = "WSubId_94"
.annotate 'line', 5421
    getattribute $P1, self, 'values'
.annotate 'line', 5422
    $P2 = $P1[-1]
.annotate 'line', 5423
    $P4 = $P2.'isstringliteral'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5424
    $P3 = __ARG_1[0]
.annotate 'line', 5425
    $P4 = $P3.'isstringliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5426
    $P5 = WSubId_94($P2, $P3)
    $P1[-1] = $P5
.annotate 'line', 5427
    __ARG_1.'shift'()
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 5430
    $P1.'append'(__ARG_1)
.annotate 'line', 5431

.end # append


.sub 'checkresult' :method
.annotate 'line', 5433
    .return('S')

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
.annotate 'line', 5436
    getattribute $P1, self, 'values'
.annotate 'line', 5437
    elements $I1, $P1
.annotate 'line', 5438
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 5439
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5440
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 5439
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5441
    .return($P2)
.annotate 'line', 5442

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5445
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5446
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 5447

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 5450
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5451
    elements $I1, $P1
.annotate 'line', 5452
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5453
    self.'annotate'(__ARG_1)
.annotate 'line', 5454
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
.annotate 'line', 5455
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 5456
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 5455
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 5457
    .return($S1)
.annotate 'line', 5458

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5461
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5462
    elements $I1, $P1
.annotate 'line', 5463
    self.'annotate'(__ARG_1)
.annotate 'line', 5464
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
.annotate 'line', 5465
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5466
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 5465
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5467

.end # emit_init


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5470
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 5471
    elements $I1, $P1
.annotate 'line', 5472
    self.'annotate'(__ARG_1)
.annotate 'line', 5473
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 5474
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 5473
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 5475

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 5379
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 5381
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
.annotate 'line', 5484
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
.annotate 'line', 5485

.end # RepeatString


.sub 'checkresult' :method
.annotate 'line', 5486
    .return('S')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5489
    getattribute $P1, self, 'rexpr'
.annotate 'line', 5490
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5491
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5492
    self.'annotate'(__ARG_1)
.annotate 'line', 5493
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
.annotate 'line', 5494

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 5480
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5503
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5504

.end # OpAddExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5507
    new $P1, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5508

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_93 = "WSubId_93"
.annotate 'line', 5511
    self.'optimizearg'()
.annotate 'line', 5512
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5513
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5514
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5515
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5516
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5517
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'S'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5518
    .tailcall WSubId_94($P1, $P2)
  __label_5: # endif
.annotate 'line', 5519
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_8
    iseq $I3, $S2, 'I'
  __label_8:
    unless $I3 goto __label_7
.annotate 'line', 5520
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5521
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5522
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_7: # endif
.annotate 'line', 5524
    $P3 = WSubId_95($S1, $S2)
    if_null $P3, __label_9
    unless $P3 goto __label_9
.annotate 'line', 5525
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5526
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5527
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_93($P3, $P4, $N3)
  __label_9: # endif
  __label_3: # endif
.annotate 'line', 5530
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'S'
  __label_11:
    unless $I3 goto __label_10
.annotate 'line', 5531
    new $P4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'ConcatString'($P5, $P6, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_10: # endif
.annotate 'line', 5533
    .return(self)
.annotate 'line', 5534

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_95 = "WSubId_95"
.annotate 'line', 5537
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5538
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5539
    ne $S1, $S2, __label_3
.annotate 'line', 5540
    .return($S1)
  __label_3: # endif
.annotate 'line', 5541
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 5542
    .return('S')
  __label_4: # endif
.annotate 'line', 5543
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 5544
    .return('S')
  __label_6: # endif
.annotate 'line', 5545
    $P1 = WSubId_95($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 5546
    .return('N')
  __label_8: # endif
.annotate 'line', 5547
    .return('I')
.annotate 'line', 5548

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5551
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5552
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5553
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5554
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5555
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5557
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5558
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5559
    ne $S1, 'S', __label_6
.annotate 'line', 5560
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
.annotate 'line', 5561
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 5562
    eq $S2, 'S', __label_11
.annotate 'line', 5563
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 5564
    set $S4, $S6
    goto __label_12
  __label_11: # else
.annotate 'line', 5567
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 5568
    set $S5, $S6
  __label_12: # endif
  __label_8: # endif
.annotate 'line', 5571
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
    goto __label_7
  __label_6: # else
.annotate 'line', 5574
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
.annotate 'line', 5575
    null $S7
.annotate 'line', 5576
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
.annotate 'line', 5578
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 5579
    __ARG_1.'emitset'($S7, $S4)
  __label_18: # endif
.annotate 'line', 5581
    null $S8
.annotate 'line', 5582
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
.annotate 'line', 5584
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 5585
    __ARG_1.'emitset'($S8, $S5)
  __label_20: # endif
.annotate 'line', 5587
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
    goto __label_14
  __label_13: # else
.annotate 'line', 5590
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
  __label_7: # endif
.annotate 'line', 5592

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 5499
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5601
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5602

.end # OpSubExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5605
    new $P1, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5606

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 5609
    self.'optimizearg'()
.annotate 'line', 5610
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5611
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5612
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5613
    $P4 = $P1.'checkresult'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5614
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 5615
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5616
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5617
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5618
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 5621
    .return(self)
.annotate 'line', 5622

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5625
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5626
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5628
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 5630
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 5632
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 5634
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 5629
    .return($S1)
  __label_6: # case
.annotate 'line', 5631
    .return('P')
  __label_8: # case
.annotate 'line', 5633
    .return('N')
  __label_10: # case
.annotate 'line', 5635
    .return('N')
  __label_4: # default
.annotate 'line', 5637
    .return('I')
  __label_3: # switch end
.annotate 'line', 5639

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5642
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5643
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5644
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5645
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5646
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5647
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5648
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5649
    null $S6
.annotate 'line', 5650
    eq $S2, $S1, __label_6
.annotate 'line', 5651
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5652
    ne $S1, 'P', __label_7
.annotate 'line', 5653
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 5655
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 5656
    set $S4, $S6
  __label_6: # endif
.annotate 'line', 5658
    eq $S3, $S1, __label_9
.annotate 'line', 5659
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5660
    ne $S1, 'P', __label_10
.annotate 'line', 5661
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 5663
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 5664
    set $S5, $S6
  __label_9: # endif
.annotate 'line', 5666
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
.annotate 'line', 5667

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 5597
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5676
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5677

.end # OpMulExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5680
    new $P1, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5681

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_93 = "WSubId_93"
.annotate 'line', 5684
    self.'optimizearg'()
.annotate 'line', 5685
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5686
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5687
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5688
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5689
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5690
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5691
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 5692
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5693
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_5: # endif
.annotate 'line', 5695
    $P3 = WSubId_95($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 5696
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5697
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5698
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_93($P3, $P4, $N3)
  __label_7: # endif
  __label_3: # endif
.annotate 'line', 5701
    ne $S1, 'S', __label_8
.annotate 'line', 5702
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 5703
    .return(self)
.annotate 'line', 5704

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5707
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5708
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5709
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5710
    ne $S1, $S2, __label_3
.annotate 'line', 5711
    .return($S1)
  __label_3: # endif
.annotate 'line', 5712
    ne $S1, 'S', __label_4
.annotate 'line', 5713
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5715
    .return('N')
  __label_5: # endif
.annotate 'line', 5716

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5719
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5720
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5721
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5722
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5723
    null $S3
    null $S4
.annotate 'line', 5724
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
.annotate 'line', 5725
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5726
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5727
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5728
    .return()
  __label_3: # endif
.annotate 'line', 5733
    ne $S1, 'N', __label_7
.annotate 'line', 5734
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5735
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5736
    null $S5
    if_null $S2, __label_8
    length $I3, $S2
    ne $I3, 1, __label_8
    ord $I3, $S2
    if $I3 == 73 goto __label_10
    if $I3 == 78 goto __label_11
    goto __label_8
  __label_10: # case
.annotate 'line', 5739
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5740
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5741
    set $S5, $S4
    goto __label_9 # break
  __label_11: # case
.annotate 'line', 5744
    set $S5, $S4
    goto __label_9 # break
  __label_8: # default
.annotate 'line', 5747
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5748
    __ARG_1.'emitset'($S5, $S4)
  __label_9: # switch end
.annotate 'line', 5750
    self.'annotate'(__ARG_1)
.annotate 'line', 5751
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
.annotate 'line', 5752
    .return()
  __label_7: # endif
.annotate 'line', 5755
    null $I1
    null $I2
.annotate 'line', 5756
    $P4 = $P1.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_14
    $P3 = $P1.'isidentifier'()
  __label_14:
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 5757
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S3, $P5
.annotate 'line', 5758
    $P1.'emit'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
.annotate 'line', 5761
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5762
    set $S3, $I1
  __label_13: # endif
.annotate 'line', 5764
    $P4 = $P2.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_17
    $P3 = $P2.'isidentifier'()
  __label_17:
    if_null $P3, __label_15
    unless $P3 goto __label_15
.annotate 'line', 5765
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S4, $P5
.annotate 'line', 5766
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
.annotate 'line', 5771
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5772
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_21: # case
.annotate 'line', 5775
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_22: # case
  __label_18: # default
.annotate 'line', 5779
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5780
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
  __label_16: # endif
.annotate 'line', 5784
    self.'annotate'(__ARG_1)
.annotate 'line', 5785
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5786

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 5672
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5795
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5796

.end # OpDivExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5799
    new $P1, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5800

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_95 = "WSubId_95"
.annotate 'line', 5803
    self.'optimizearg'()
.annotate 'line', 5804
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5805
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5806
    $P5 = $P1.'isliteral'()
    unless $P5 goto __label_2
    $P5 = $P2.'isliteral'()
  __label_2:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 5807
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 5808
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5809
    null $P3
.annotate 'line', 5810
    null $P4
.annotate 'line', 5811
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
.annotate 'line', 5812
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5813
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5814
    unless $I2 goto __label_7
.annotate 'line', 5815
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_93($P5, $P6, $N3)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 5817
    $P5 = WSubId_95($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
.annotate 'line', 5818
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5819
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5820
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5821
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_93($P5, $P6, $N3)
  __label_9: # endif
  __label_8: # endif
  __label_1: # endif
.annotate 'line', 5824
    .return(self)
.annotate 'line', 5825

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5828
    .return('N')
.annotate 'line', 5829

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5832
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5833
    null $P2
.annotate 'line', 5834
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5835
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
.annotate 'line', 5836
    $P2 = self.'tempreg'('N')
.annotate 'line', 5837
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5838
    set $P3, $P2
  __label_1: # endif
.annotate 'line', 5840
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5841
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5842
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
.annotate 'line', 5843
    $P2 = self.'tempreg'('N')
.annotate 'line', 5844
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5845
    set $P5, $P2
  __label_2: # endif
.annotate 'line', 5847
    self.'annotate'(__ARG_1)
.annotate 'line', 5848
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
.annotate 'line', 5849

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5791
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5858
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5859

.end # OpModExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5862
    new $P1, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5863

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5866
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5867
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5868
    self.'annotate'(__ARG_1)
.annotate 'line', 5869
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5870

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5873
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5874

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5854
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5883
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5884

.end # OpCModExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5887
    new $P1, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5888

.end # clone


.sub 'checkresult' :method
.annotate 'line', 5891
    .return('I')
.annotate 'line', 5892

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5895
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5896
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5897
    self.'annotate'(__ARG_1)
.annotate 'line', 5902
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
.annotate 'line', 5903

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5879
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5912
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5913

.end # OpShiftleftExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5916
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5917

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5920
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5921
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5922
    self.'annotate'(__ARG_1)
.annotate 'line', 5923
    __ARG_1.'emitbinop'('shl', __ARG_2, $S1, $S2)
.annotate 'line', 5924

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5927
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5928

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5908
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5937
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5938

.end # OpShiftrightExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5941
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5942

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5945
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5946
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5947
    self.'annotate'(__ARG_1)
.annotate 'line', 5948
    __ARG_1.'emitbinop'('shr', __ARG_2, $S1, $S2)
.annotate 'line', 5949

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5952
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5953

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5933
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]

.sub 'OpShiftlrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5962
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 5963

.end # OpShiftlrightExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 5966
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)
.annotate 'line', 5967

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5970
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5971
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5972
    self.'annotate'(__ARG_1)
.annotate 'line', 5973
    __ARG_1.'emitbinop'('lsr', __ARG_2, $S1, $S2)
.annotate 'line', 5974

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 5977
    lsr $I1, __ARG_1, __ARG_2
    .return($I1)
.annotate 'line', 5978

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
.annotate 'line', 5958
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5987
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 5988

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 5991
    null $I1
    null $I2
.annotate 'line', 5992
    set $S1, ''
.annotate 'line', 5993
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 5994
    $P5 = $P1.'getname'()
    set $S2, $P5
    if $S2 == 'flat' goto __label_5
    if $S2 == 'named' goto __label_6
    goto __label_3
  __label_5: # case
.annotate 'line', 5996
    set $I1, 1
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 5999
    set $I2, 1
.annotate 'line', 6000
    $P6 = $P1.'numargs'()
    set $I3, $P6
    if $I3 == 0 goto __label_9
    if $I3 == 1 goto __label_10
    goto __label_7
  __label_9: # case
    goto __label_8 # break
  __label_10: # case
.annotate 'line', 6004
    $P2 = $P1.'getarg'(0)
.annotate 'line', 6005
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 6006
    WSubId_25('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 6007
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_8 # break
  __label_7: # default
.annotate 'line', 6010
    WSubId_25('Invalid modifier', self)
  __label_8: # switch end
  __label_3: # default
  __label_4: # switch end
    goto __label_1
  __label_2: # endfor
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 6018
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 6021
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 6016
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 6019
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 6022
    __ARG_1.'print'(' :named')
.annotate 'line', 6023
    eq $S1, '', __label_17
.annotate 'line', 6024
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 6027

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5983
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6036
    setattribute self, 'arg', __ARG_1
.annotate 'line', 6037
    setattribute self, 'modifiers', __ARG_2
.annotate 'line', 6038

.end # Argument


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6041
    new $P1, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 6042
    getattribute $P4, self, 'arg'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'arg', $P3
.annotate 'line', 6043
    .return($P1)
.annotate 'line', 6044

.end # clone


.sub 'optimize' :method
.annotate 'line', 6047
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 6048
    .return(self)
.annotate 'line', 6049

.end # optimize


.sub 'hascompilevalue' :method
.annotate 'line', 6052
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
.annotate 'line', 6053

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 6032
    addattribute $P0, 'arg'
.annotate 'line', 6033
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 6058
    null $P1
.annotate 'line', 6059
    $P2 = WSubId_68(__ARG_1, __ARG_2)
.annotate 'line', 6060
    $P3 = __ARG_1.'get'()
.annotate 'line', 6061
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 6062
    $P3 = __ARG_1.'get'()
.annotate 'line', 6063
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 6064
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
    goto __label_4
  __label_3: # else
.annotate 'line', 6067
    WSubId_70('modifier list', $P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 6070
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 6071
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
.annotate 'line', 6072

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_96 = "WSubId_96"
.annotate 'line', 6083
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6084
    setattribute self, 'start', __ARG_2
.annotate 'line', 6085
    $P1 = __ARG_3.'get'()
.annotate 'line', 6086
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6087
    __ARG_3.'unget'($P1)
.annotate 'line', 6088
    $P3 = WSubId_67(__ARG_3, __ARG_1, WSubId_96, __ARG_4)
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 6090

.end # ArgumentList


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6093
    new $P1, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 6094
    setattribute $P1, 'owner', __ARG_1
.annotate 'line', 6095
    getattribute $P10, self, 'start'
    setattribute $P1, 'start', $P10
.annotate 'line', 6096
    getattribute $P2, self, 'args'
.annotate 'line', 6097
    if_null $P2, __label_1
.annotate 'line', 6098
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
.annotate 'line', 6098
    setattribute $P1, 'args', $P9
  __label_1: # endif
.annotate 'line', 6099
    .return($P1)
.annotate 'line', 6100

.end # clone


.sub 'numargs' :method
.annotate 'line', 6103
    getattribute $P1, self, 'args'
.annotate 'line', 6104
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
    .return($I1)
.annotate 'line', 6105

.end # numargs


.sub 'getrawargs' :method
.annotate 'line', 6108
    getattribute $P1, self, 'args'
    .return($P1)
.annotate 'line', 6109

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 6112
    getattribute $P1, self, 'args'
.annotate 'line', 6113
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 6114

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
.annotate 'line', 6117
    getattribute $P1, self, 'args'
.annotate 'line', 6118
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
.annotate 'line', 6119

.end # getfreearg


.sub 'optimize' :method
.annotate 'line', 6122
    getattribute $P1, self, 'args'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 6123
    .return(self)
.annotate 'line', 6124

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 6127
    getattribute $P1, self, 'argregs'
.annotate 'line', 6128
    unless_null $P1, __label_1
.annotate 'line', 6129
    new $P2, ['ResizableStringArray']
.annotate 'line', 6130
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
.annotate 'line', 6131
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P7, $P5
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P4, $P7
.annotate 'line', 6132
    getattribute $P8, $P4, 'arg'
    $P6 = $P3.'add'($P8)
    null $S1
    if_null $P6, __label_4
    set $S1, $P6
  __label_4:
.annotate 'line', 6133
    push $P2, $S1
    goto __label_2
  __label_3: # endfor
.annotate 'line', 6135
    setattribute self, 'argregs', $P2
  __label_1: # endif
.annotate 'line', 6137
    .return($P1)
.annotate 'line', 6138

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 6141
    getattribute $P1, self, 'args'
.annotate 'line', 6142
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 6144
    set $S1, ''
.annotate 'line', 6145
    $P4 = self.'numargs'()
    set $I1, $P4
.annotate 'line', 6146
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 6147
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 6148
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 6149
    if_null $P3, __label_4
.annotate 'line', 6150
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 6151
    set $S1, ', '
  __label_1: # for iteration
.annotate 'line', 6146
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 6153

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 6076
    addattribute $P0, 'owner'
.annotate 'line', 6077
    addattribute $P0, 'start'
.annotate 'line', 6078
    addattribute $P0, 'args'
.annotate 'line', 6079
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_97')
        .param pmc __ARG_1
.annotate 'line', 6158
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 6159
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 6160
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 6161
    .return(1)
.annotate 'line', 6162

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6173
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6174
    setattribute self, 'builtin', __ARG_3
.annotate 'line', 6175
    setattribute self, 'args', __ARG_4
.annotate 'line', 6176

.end # CallBuiltinExpr


.sub 'checkresult' :method
.annotate 'line', 6179
    getattribute $P2, self, 'builtin'
    $P1 = $P2.'result'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6180
    ne $S1, ':', __label_2
.annotate 'line', 6181
    getattribute $P4, self, 'args'
    $P3 = $P4[0]
    getattribute $P2, $P3, 'arg'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6182
    .return($S1)
.annotate 'line', 6183

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6186
    self.'emit'(__ARG_1, "")
.annotate 'line', 6187

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6190
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
.annotate 'line', 6196
    WSubId_25("Can't use result of a void builtin", self)
  __label_2: # default
.annotate 'line', 6198
    concat $S3, "Unexpected result type '", $S1
    concat $S3, $S3, "'"
    WSubId_30($S3, self)
  __label_3: # switch end
.annotate 'line', 6200
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_9
    set $S2, $P1
  __label_9:
.annotate 'line', 6201
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 6202
    .return($S2)
.annotate 'line', 6203

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6206
    getattribute $P1, self, 'builtin'
.annotate 'line', 6207
    getattribute $P2, self, 'args'
.annotate 'line', 6208
    new $P3, ['ResizableStringArray']
.annotate 'line', 6209
    null $P4
.annotate 'line', 6210
    $P8 = $P1.'params'()
    set $I3, $P8
    if $I3 == -1 goto __label_3
    if $I3 == -2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 6212
    new $P9, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P10, self, 'owner'
    $P9.'CollectValues'($P10, __ARG_1)
    set $P5, $P9
.annotate 'line', 6213
    if_null $P2, __label_6
    iter $P11, $P2
    set $P11, 0
  __label_5: # for iteration
    unless $P11 goto __label_6
    shift $P4, $P11
.annotate 'line', 6214
    getattribute $P13, $P4, 'arg'
    $P12 = $P5.'add'($P13)
    push $P3, $P12
    goto __label_5
  __label_6: # endfor
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 6217
    root_new $P6, ['parrot';'ResizablePMCArray']
.annotate 'line', 6218
    if_null $P2, __label_8
    iter $P14, $P2
    set $P14, 0
  __label_7: # for iteration
    unless $P14 goto __label_8
    shift $P4, $P14
.annotate 'line', 6219
    getattribute $P15, $P4, 'arg'
    push $P6, $P15
    goto __label_7
  __label_8: # endfor
.annotate 'line', 6220
    getattribute $P16, self, 'builtin'
    getattribute $P17, self, 'start'
    $P16.'expand'(__ARG_1, self, $P17, __ARG_2, $P6)
.annotate 'line', 6221
    .return()
  __label_1: # default
.annotate 'line', 6223
    getattribute $P18, self, 'args'
    set $I1, $P18
.annotate 'line', 6224
    new $P19, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P20, self, 'owner'
    $P19.'CollectValues'($P20, __ARG_1)
    set $P7, $P19
.annotate 'line', 6225
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
.annotate 'line', 6226
    $P21 = $P2[$I2]
    getattribute $P4, $P21, 'arg'
.annotate 'line', 6227
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
.annotate 'line', 6228
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
.annotate 'line', 6229
    null $S3
.annotate 'line', 6230
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
.annotate 'line', 6235
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 6236
    __ARG_1.'emitnull'($S3)
    goto __label_17 # break
  __label_16: # default
.annotate 'line', 6239
    $P10 = $P7.'add'($P4)
    set $S3, $P10
  __label_17: # switch end
    goto __label_15
  __label_14: # else
.annotate 'line', 6243
    iseq $I3, $S1, $S2
    if $I3 goto __label_24
    iseq $I3, $S2, '?'
  __label_24:
    if $I3 goto __label_23
.annotate 'line', 6244
    iseq $I3, $S2, 'p'
    unless $I3 goto __label_25
.annotate 'line', 6245
    iseq $I3, $S1, 'S'
    if $I3 goto __label_26
    iseq $I3, $S1, 'P'
  __label_26:
  __label_25:
  __label_23:
    unless $I3 goto __label_21
.annotate 'line', 6246
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
.annotate 'line', 6248
    ne $S2, 'p', __label_27
.annotate 'line', 6249
    set $S2, 'P'
  __label_27: # endif
.annotate 'line', 6250
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
.annotate 'line', 6251
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
.annotate 'line', 6257
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
.annotate 'line', 6258
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_36 # break
  __label_35: # default
.annotate 'line', 6261
    set $S3, $S4
  __label_36: # switch end
    goto __label_30 # break
  __label_32: # case
  __label_33: # case
  __label_34: # case
.annotate 'line', 6267
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 6268
    __ARG_1.'emitset'($S3, $S4)
    goto __label_30 # break
  __label_29: # default
.annotate 'line', 6271
    set $S3, $S4
  __label_30: # switch end
  __label_22: # endif
  __label_15: # endif
.annotate 'line', 6275
    push $P3, $S3
  __label_9: # for iteration
.annotate 'line', 6225
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_2: # switch end
.annotate 'line', 6278
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)
.annotate 'line', 6279

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
.annotate 'line', 6166
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 6168
    addattribute $P0, 'builtin'
.annotate 'line', 6169
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_97 = "WSubId_97"
.annotate 'line', 6286
    $P7 = __ARG_3.'getname'()
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 6287
    __ARG_1.'use_builtin'($S1)
.annotate 'line', 6288
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P7 = __ARG_4.'numargs'()
    set $I1, $P7
  __label_2:
.annotate 'line', 6289
    if $I1 goto __label_5
    root_new $P7, ['parrot';'ResizablePMCArray']
    set $P1, $P7
    goto __label_4
  __label_5:
    $P8 = __ARG_4.'getrawargs'()
    set $P1, $P8
  __label_4:
.annotate 'line', 6291
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 6292
    null $P3
.annotate 'line', 6293
    if_null $P2, __label_7
    iter $P9, $P2
    set $P9, 0
  __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P4, $P9
.annotate 'line', 6294
    getattribute $P7, $P4, 'nparams'
    set $I2, $P7
.annotate 'line', 6295
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 6296
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 6297
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 6298
    set $P3, $P4
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
.annotate 'line', 6300
    unless_null $P3, __label_12
.annotate 'line', 6301
    WSubId_25("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 6304
    $P7 = $P3.'iscompileevaluable'()
    if_null $P7, __label_13
    unless $P7 goto __label_13
.annotate 'line', 6305
    $P8 = WSubId_97($P1)
    if_null $P8, __label_14
    unless $P8 goto __label_14
.annotate 'line', 6306
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 6307
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_15
    push_eh $P7
.annotate 'line', 6308
    getattribute $P10, __ARG_1, 'owner'
    getattribute $P11, __ARG_1, 'start'
    $P8 = $P5($P10, $P11, $P1)
    .return($P8)
    pop_eh
    goto __label_16
  __label_15:
.annotate 'line', 6307
    .get_results($P6)
    finalize $P6
    pop_eh
.annotate 'line', 6312
    $S2 = $P6["message"]
    concat $S3, "Compile time evaluation of builtin ", $S1
    concat $S3, $S3, " failed: '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
.annotate 'line', 6311
    WSubId_25($S3, __ARG_2)
  __label_16:
  __label_14: # endif
  __label_13: # endif
.annotate 'line', 6317
    new $P8, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P8.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P7, $P8
    .return($P7)
.annotate 'line', 6318

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6327
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6328
    setattribute self, 'funref', __ARG_4
.annotate 'line', 6329
    $P1 = __ARG_1.'get'()
.annotate 'line', 6330
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6331
    __ARG_1.'unget'($P1)
.annotate 'line', 6332
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
  __label_1: # endif
.annotate 'line', 6334

.end # CallExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6337
    new $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6338
    getattribute $P3, self, 'start'
    $P1.'Expr'(__ARG_1, $P3)
.annotate 'line', 6339
    getattribute $P5, self, 'funref'
    $P4 = $P5.'clone'(__ARG_1)
    setattribute $P1, 'funref', $P4
.annotate 'line', 6340
    getattribute $P2, self, 'args'
.annotate 'line', 6341
    if_null $P2, __label_1
.annotate 'line', 6342
    $P4 = $P2.'clone'(__ARG_1)
    setattribute $P1, 'args', $P4
  __label_1: # endif
.annotate 'line', 6343
    .return($P1)
.annotate 'line', 6344

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6345
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6348
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 6349
    getattribute $P2, self, 'args'
.annotate 'line', 6350
    if_null $P2, __label_1
.annotate 'line', 6351
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 6353
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
.annotate 'line', 6354
    $P3 = $P1.'search_nonmember'()
.annotate 'line', 6356
    isnull $I1, $P3
    if $I1 goto __label_5
.annotate 'line', 6358
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_6
.annotate 'line', 6369
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
.annotate 'line', 6372
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6357
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_6: # case
.annotate 'line', 6359
    $P8 = $P3.'ismulti'()
    isfalse $I2, $P8
    unless $I2 goto __label_9
.annotate 'line', 6360
    $P4 = $P3.'makesubid'()
.annotate 'line', 6361
    self.'usesubid'($P4)
.annotate 'line', 6362
    new $P7, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
    $P7.'CallSubid'(self, $P1, $P2, $P4)
    set $P6, $P7
    .return($P6)
    goto __label_10
  __label_9: # else
.annotate 'line', 6365
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 6366
    .return(self)
  __label_10: # endif
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6370
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
.annotate 'line', 6371
    .return(self)
  __label_8: # case
.annotate 'line', 6373
    getattribute $P11, self, 'owner'
    getattribute $P12, $P1, 'start'
    .tailcall WSubId_98($P11, $P12, $P3, $P2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6376
    getattribute $P13, self, 'start'
    WSubId_30("unexpected type found in scope", $P13)
  __label_3: # switch end
  __label_2: # endif
.annotate 'line', 6379
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 6380
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_11: # endif
.annotate 'line', 6381
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
    unless $I1 goto __label_12
.annotate 'line', 6382
    new $P7, [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]
    $P7.'CallInlineExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_12: # endif
.annotate 'line', 6385
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_13
    unless $P6 goto __label_13
.annotate 'line', 6386
    $P7 = $P1.'checkIdentifier'()
    set $S1, $P7
    ne $S1, '', __label_14
.annotate 'line', 6387
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P9 = $P1.'getName'()
    $P8[0] = $P9
    $P5 = self.'scopesearch'($P8, 0)
.annotate 'line', 6388
    isnull $I1, $P5
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
.annotate 'line', 6389
    getattribute $P6, self, 'owner'
    getattribute $P7, $P1, 'start'
    .tailcall WSubId_98($P6, $P7, $P5, $P2)
  __label_15: # endif
  __label_14: # endif
  __label_13: # endif
.annotate 'line', 6393
    setattribute self, 'funref', $P1
.annotate 'line', 6394
    setattribute self, 'args', $P2
.annotate 'line', 6395
    .return(self)
.annotate 'line', 6396

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 6399
    .return(1)
.annotate 'line', 6400

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6403
    getattribute $P1, self, 'funref'
.annotate 'line', 6404
    null $S1
.annotate 'line', 6406
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6407
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 6408
    ne $S1, '', __label_3
.annotate 'line', 6409
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
.annotate 'line', 6411
    isnull $I1, $P2
    if $I1 goto __label_6
.annotate 'line', 6414
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
.annotate 'line', 6417
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 6412
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
    join $S1, "", $P3
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 6415
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 6418
    WSubId_30("Builtin unexpected here", self)
  __label_5: # default
.annotate 'line', 6420
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
.annotate 'line', 6425
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 6426
    .return($S1)
.annotate 'line', 6427

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
.annotate 'line', 6430
    getattribute $P1, self, 'args'
.annotate 'line', 6431
    if_null $P1, __label_1
.annotate 'line', 6432
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6433

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 6436
    __ARG_1.'print'('(')
.annotate 'line', 6437
    getattribute $P1, self, 'args'
.annotate 'line', 6438
    if_null $P1, __label_1
.annotate 'line', 6439
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6440
    __ARG_1.'say'(')')
.annotate 'line', 6441

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6444
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6445
    self.'prepareargs'(__ARG_1)
.annotate 'line', 6447
    self.'annotate'(__ARG_1)
.annotate 'line', 6449
    __ARG_1.'print'('    ')
.annotate 'line', 6450
    ne __ARG_2, '.tailcall', __label_2
.annotate 'line', 6451
    __ARG_1.'print'('.tailcall ')
    goto __label_3
  __label_2: # else
.annotate 'line', 6453
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_3: # endif
.annotate 'line', 6455
    __ARG_1.'print'($S1)
.annotate 'line', 6456
    self.'emitargs'(__ARG_1)
.annotate 'line', 6457

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6460
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6461
    self.'prepareargs'(__ARG_1)
.annotate 'line', 6462
    self.'annotate'(__ARG_1)
.annotate 'line', 6463
    __ARG_1.'print'('    ')
.annotate 'line', 6464
    __ARG_1.'print'($S1)
.annotate 'line', 6465
    self.'emitargs'(__ARG_1)
.annotate 'line', 6466

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6320
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6322
    addattribute $P0, 'funref'
.annotate 'line', 6323
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallSubid' ]

.sub 'CallSubid' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6478
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6479
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6480
    setattribute self, 'args', __ARG_3
.annotate 'line', 6481
    setattribute self, 'subid', __ARG_4
.annotate 'line', 6482

.end # CallSubid


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 6485
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 6486

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
.annotate 'line', 6473
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 6475
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6494
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6495
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6496
    setattribute self, 'args', __ARG_3
.annotate 'line', 6497

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 6500
    getattribute $P1, self, 'funref'
.annotate 'line', 6502
    getattribute $P2, $P1, 'left'
  __label_2: # while
.annotate 'line', 6503
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6504
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6505
    $P6 = $P2.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6506
    $P7 = $P2.'checkIdentifier'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 6507
    isnull $I1, $S1
    if $I1 goto __label_6
    iseq $I1, $S1, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 6511
    new $P3, ['ResizableStringArray']
.annotate 'line', 6512
    $P1.'buildkey'($P3)
.annotate 'line', 6513
    $P6 = $P3.'pop'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 6514
    $P4 = self.'tempreg'('P')
.annotate 'line', 6515
    self.'annotate'(__ARG_1)
.annotate 'line', 6516
    set $P5, $P3
.annotate 'line', 2519
    null $S3
.annotate 'line', 2520
    elements $I1, $P5
    unless $I1 goto __label_9
.annotate 'line', 2521
    join $S5, "'; '", $P5
    concat $S6, "[ '", $S5
    concat $S6, $S6, "' ]"
    set $S3, $S6
  __label_9: # endif
.annotate 'line', 2522
    set $S4, $S3
    goto __label_8
  __label_8:
.annotate 'line', 6516
    __ARG_1.'emitget_hll_global'($P4, $S2, $S4)
.annotate 'line', 6517
    .return($P4)
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 6520
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P1.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
.annotate 'line', 6521
    $P8 = $P1.'get_member'()
.annotate 'line', 6520
    $P6[2] = $P8
    $P6[3] = "'"
    join $S5, "", $P6
    .return($S5)
.annotate 'line', 6522

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 6490
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6532
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 6533
    setattribute self, 'funref', __ARG_2
.annotate 'line', 6534
    setattribute self, 'args', __ARG_3
.annotate 'line', 6535

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 6538
    getattribute $P1, self, 'funref'
.annotate 'line', 6539
    getattribute $P2, $P1, 'right'
.annotate 'line', 6540
    $P3 = $P2.'checkresult'()
.annotate 'line', 6541
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6542
    WSubId_25("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 6545
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 6546
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 6547
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
.annotate 'line', 6548

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 6528
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6558
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6559
    setattribute self, 'left', __ARG_3
.annotate 'line', 6560

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
.annotate 'line', 6563
    getattribute $P1, self, 'left'
    .tailcall $P1.'emit_getvar'(__ARG_1)
.annotate 'line', 6564

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 6553
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6555
    addattribute $P0, 'left'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6573
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6574
    setattribute self, 'right', __ARG_4
.annotate 'line', 6575

.end # MemberExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6578
    new $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 6579
    getattribute $P2, self, 'start'
    getattribute $P4, self, 'left'
    $P3 = $P4.'clone'(__ARG_1)
    $P1.'MemberExprBase'(__ARG_1, $P2, $P3)
.annotate 'line', 6580
    getattribute $P3, self, 'right'
    setattribute $P1, 'right', $P3
.annotate 'line', 6581
    .return($P1)
.annotate 'line', 6582

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6583
    .return('P')

.end # checkresult


.sub 'search_nonmember' :method
.annotate 'line', 6589
    null $P1
.annotate 'line', 6590
    getattribute $P2, self, 'left'
  __label_2: # while
.annotate 'line', 6591
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6592
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6593
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 6594
    $P3 = $P2.'checkIdentifier'()
.annotate 'line', 6595
    isnull $I1, $P3
    if $I1 goto __label_5
    set $S1, $P3
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 6596
    root_new $P4, ['parrot';'ResizablePMCArray']
.annotate 'line', 6597
    self.'buildkey'($P4)
.annotate 'line', 6598
    .tailcall self.'scopesearch'($P4, 0)
  __label_4: # endif
  __label_3: # endif
    null $P5
.annotate 'line', 6601
    .return($P5)
.annotate 'line', 6602

.end # search_nonmember


.sub 'optimize' :method
.annotate 'line', 6605
    getattribute $P4, self, 'left'
    $P3 = $P4.'optimize'()
    setattribute self, 'left', $P3
.annotate 'line', 6607
    $P1 = self.'search_nonmember'()
.annotate 'line', 6609
    isnull $I1, $P1
    if $I1 goto __label_3
.annotate 'line', 6611
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
.annotate 'line', 6615
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_5
.annotate 'line', 6617
    $I1 = $P1.'isconst'()
    if $I1 goto __label_6
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6612
    $P2 = $P1.'ismulti'()
    if_null $P2, __label_7
    unless $P2 goto __label_7
.annotate 'line', 6613
    new $P4, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'FunctionRef'($P5, $P6, $P1)
    set $P3, $P4
    .return($P3)
  __label_7: # endif
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 6616
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P1)
    set $P7, $P8
    .return($P7)
  __label_6: # case
.annotate 'line', 6618
    .tailcall $P1.'getvalue'()
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6620
    .return(self)
.annotate 'line', 6621

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
.annotate 'line', 6624
    getattribute $P1, self, 'left'
.annotate 'line', 6625
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6626
    $P2 = $P1.'getName'()
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 6628
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6629
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
    push __ARG_1, $P2
.annotate 'line', 6630

.end # buildkey


.sub 'get_member' :method
.annotate 'line', 6633
    getattribute $P1, self, 'right'
    .return($P1)
.annotate 'line', 6634

.end # get_member


.sub '__emit_get_left' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 6637
    getattribute $P1, self, 'left'
.annotate 'line', 6638
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    eq $S1, 'P', __label_1
.annotate 'line', 6639
    WSubId_25("non-var at left of '.'", self)
  __label_1: # endif
.annotate 'line', 6640
    .tailcall $P1.'emit_get_nonull'(__ARG_1)
.annotate 'line', 6641

.end # __emit_get_left


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6644
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6645
    self.'annotate'(__ARG_1)
.annotate 'line', 6646
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
.annotate 'line', 6647

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6650
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6651
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6652
    .return($S1)
.annotate 'line', 6653

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6656
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6657
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6658
    self.'annotate'(__ARG_1)
.annotate 'line', 6659
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 6660

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6663
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6664
    null $S2
.annotate 'line', 6665
    ne __ARG_2, 'P', __label_2
.annotate 'line', 6667
    ne __ARG_3, 'null', __label_4
.annotate 'line', 6668
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 6669
    __ARG_1.'emitnull'(__ARG_3)
  __label_4: # endif
.annotate 'line', 6671
    set $S2, __ARG_3
    goto __label_3
  __label_2: # else
.annotate 'line', 6674
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 6675
    __ARG_1.'emitbox'($S2, __ARG_3)
  __label_3: # endif
.annotate 'line', 6677
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6678

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6681
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6682
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6683
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 6684
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
.annotate 'line', 6686
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 6687
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 6688
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 6690
    set $S2, $S3
  __label_7: # endif
  __label_4: # endif
.annotate 'line', 6692
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6693
    .return($S2)
.annotate 'line', 6694

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 6567
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6569
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6705
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6706
    setattribute self, 'right', __ARG_4
.annotate 'line', 6707

.end # MemberRefExpr


.sub 'checkresult' :method
.annotate 'line', 6708
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6711
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 6712
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 6713
    .return(self)
.annotate 'line', 6714

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 6717
    getattribute $P1, self, 'left'
.annotate 'line', 6718
    getattribute $P2, self, 'right'
.annotate 'line', 6719
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 6720
    WSubId_70("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6721
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6722
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6723
    self.'annotate'(__ARG_1)
.annotate 'line', 6724
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
.annotate 'line', 6725

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 6728
    getattribute $P1, self, 'left'
.annotate 'line', 6729
    getattribute $P2, self, 'right'
.annotate 'line', 6730
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 6731
    WSubId_70("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6732
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6733
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6734
    null $S3
.annotate 'line', 6735
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    if_null $S5, __label_4
    length $I1, $S5
    ne $I1, 1, __label_4
    ord $I1, $S5
    if $I1 == 80 goto __label_6
    goto __label_4
  __label_6: # case
.annotate 'line', 6737
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 6739
    ne $S3, 'null', __label_7
.annotate 'line', 6740
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 6741
    __ARG_1.'emitnull'($S3)
  __label_7: # endif
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 6745
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 6746
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6747
    __ARG_1.'emitbox'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 6750
    self.'annotate'(__ARG_1)
.annotate 'line', 6751
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 6752
    .return($S3)
.annotate 'line', 6753

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 6700
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6702
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]

.sub 'StringIndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6764
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6765
    setattribute self, 'left', __ARG_3
.annotate 'line', 6766
    setattribute self, 'arg', __ARG_4
.annotate 'line', 6767

.end # StringIndexExpr


.sub 'checkresult' :method
.annotate 'line', 6770
    .return('S')
.annotate 'line', 6771

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 6774
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6775
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6776
    self.'annotate'(__ARG_1)
.annotate 'line', 6777
    $P1 = WSubId_45("    substr %0, %1, %2, 1", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P1)
.annotate 'line', 6779

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 6758
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6760
    addattribute $P0, 'left'
.annotate 'line', 6761
    addattribute $P0, 'arg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6793
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6794
    setattribute self, 'left', __ARG_4
.annotate 'line', 6795
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
.annotate 'line', 6796

.end # IndexExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6799
    new $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6800
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 6801
    getattribute $P4, self, 'left'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'left', $P3
.annotate 'line', 6802
    getattribute $P4, self, 'args'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'args', $P3
.annotate 'line', 6803
    .return($P1)
.annotate 'line', 6804

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6807
    .return('P')
.annotate 'line', 6808

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_46 = "WSubId_46"
.annotate 'line', 6811
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 6812
    setattribute self, 'left', $P1
.annotate 'line', 6813
    getattribute $P2, self, 'args'
.annotate 'line', 6814
    $P2.'optimizeargs'()
.annotate 'line', 6816
    $P4 = $P1.'checkresult'()
    set $S2, $P4
    if_null $S2, __label_1
    length $I2, $S2
    ne $I2, 1, __label_1
    ord $I2, $S2
    if $I2 == 83 goto __label_3
    if $I2 == 80 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 6818
    $P5 = $P2.'numargs'()
    set $I3, $P5
    eq $I3, 1, __label_5
.annotate 'line', 6819
    WSubId_25('Bad string index', self)
  __label_5: # endif
.annotate 'line', 6820
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6823
    $P6 = $P1.'isstringliteral'()
    unless $P6 goto __label_7
    $P6 = $P3.'isintegerliteral'()
  __label_7:
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 6824
    $P7 = $P3.'getIntegerValue'()
    set $I1, $P7
.annotate 'line', 6825
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_8
    set $S1, $P4
  __label_8:
.annotate 'line', 6826
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
.annotate 'line', 6827
    substr $S2, $S1, $I1, 1
.annotate 'line', 6826
    .tailcall WSubId_46($P4, $P5, $S2)
  __label_6: # endif
.annotate 'line', 6829
    new $P5, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'StringIndexExpr'($P6, $P7, $P1, $P3)
    set $P4, $P5
    .return($P4)
  __label_4: # case
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 6833
    WSubId_25("Type not valid for indexing", $P1)
  __label_2: # switch end
.annotate 'line', 6836
    .return(self)
.annotate 'line', 6837

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6840
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6841
    getattribute $P4, self, 'start'
    WSubId_30('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6842
    getattribute $P1, self, 'left'
.annotate 'line', 6843
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6844
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 6845
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 6843
    setattribute self, 'regleft', $P3
.annotate 'line', 6846
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
.annotate 'line', 6847

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6850
    getattribute $P1, self, 'regleft'
.annotate 'line', 6851
    getattribute $P2, self, 'argregs'
.annotate 'line', 6852
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6853
    getattribute $P3, self, 'start'
    WSubId_30('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6854
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6855
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6856
    __ARG_1.'print'(']')
.annotate 'line', 6857

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6860
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6861
    self.'annotate'(__ARG_1)
.annotate 'line', 6862
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6863
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6864
    __ARG_1.'say'('')
.annotate 'line', 6865

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 6868
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6869
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6870
    .return($S1)
.annotate 'line', 6871

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6874
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6875
    self.'annotate'(__ARG_1)
.annotate 'line', 6876
    __ARG_1.'print'('    ')
.annotate 'line', 6877
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6878
    __ARG_1.'say'(' = ', __ARG_3)
.annotate 'line', 6879

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6882
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6883
    null $S1
.annotate 'line', 6884
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 6885
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6886
    __ARG_1.'emitnull'($S1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6889
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6890
    self.'annotate'(__ARG_1)
.annotate 'line', 6891
    __ARG_1.'print'('    ')
.annotate 'line', 6892
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6893
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6894
    .return($S1)
.annotate 'line', 6895

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6784
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6786
    addattribute $P0, 'left'
.annotate 'line', 6787
    addattribute $P0, 'regleft'
.annotate 'line', 6788
    addattribute $P0, 'args'
.annotate 'line', 6789
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 6906
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6907
    $P1 = __ARG_1.'get'()
.annotate 'line', 6908
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6909
    __ARG_1.'unget'($P1)
.annotate 'line', 6910
    $P3 = WSubId_67(__ARG_1, __ARG_2, WSubId_68, ']')
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 6912

.end # ArrayExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6915
    new $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6916
    getattribute $P8, self, 'start'
    $P1.'Expr'(__ARG_1, $P8)
.annotate 'line', 6917
    getattribute $P8, self, 'values'
    if_null $P8, __label_1
.annotate 'line', 6918
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
.annotate 'line', 6918
    setattribute $P1, 'values', $P8
  __label_1: # endif
.annotate 'line', 6919
    .return($P1)
.annotate 'line', 6920

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6921
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6924
    getattribute $P1, self, 'values'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 6925
    .return(self)
.annotate 'line', 6926

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6929
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6930
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 6931

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6937
    self.'emit_init'(__ARG_1, '')
.annotate 'line', 6938

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6941
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6942
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6943
    .return($S1)
.annotate 'line', 6944

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 6947
    self.'annotate'(__ARG_1)
.annotate 'line', 6948
    getattribute $P1, self, 'values'
.annotate 'line', 6949
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 6950
    eq __ARG_2, '', __label_3
.annotate 'line', 6951
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6952
    le $I1, 0, __label_4
.annotate 'line', 6953
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 6955
    new $P4, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P4.'CollectValues'($P5, __ARG_1)
    set $P2, $P4
.annotate 'line', 6956
    null $I2
.annotate 'line', 6957
    if_null $P1, __label_6
    iter $P6, $P1
    set $P6, 0
  __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P3, $P6
.annotate 'line', 6958
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6959
    eq __ARG_2, '', __label_8
.annotate 'line', 6960
    self.'annotate'(__ARG_1)
.annotate 'line', 6961
    $P4 = WSubId_45("    %0[%1] = %2", __ARG_2, $I2, $S1)
    __ARG_1.'say'($P4)
.annotate 'line', 6962
    inc $I2
  __label_8: # endif
    goto __label_5
  __label_6: # endfor
.annotate 'line', 6965

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6900
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6902
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 6977
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6978
    $P1 = __ARG_1.'get'()
.annotate 'line', 6979
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6980
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6981
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 6982
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6984
    $P4 = WSubId_68(__ARG_1, __ARG_2)
.annotate 'line', 6985
    WSubId_84(':', __ARG_1)
.annotate 'line', 6986
    $P5 = WSubId_68(__ARG_1, __ARG_2)
.annotate 'line', 6987
    push $P2, $P4
.annotate 'line', 6988
    push $P3, $P5
  __label_4: # continue
.annotate 'line', 6990
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6991
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6992
    WSubId_70("',' or '}'", $P1)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 6994
    setattribute self, 'keys', $P2
.annotate 'line', 6995
    setattribute self, 'values', $P3
.annotate 'line', 6996

.end # HashExpr


.sub 'checkresult' :method
.annotate 'line', 6997
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 7000
    getattribute $P1, self, 'keys'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P4 = $P1[$I2]
    $P3 = $P4.'optimize'()
    $P1[$I2] = $P3
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 7001
    getattribute $P2, self, 'values'
.annotate 'line', 2232
    if_null $P2, __label_9
    elements $I3, $P2
    goto __label_8
  __label_9:
    null $I3
  __label_8:
.annotate 'line', 2233
    null $I4
  __label_12: # for condition
    ge $I4, $I3, __label_11
.annotate 'line', 2234
    $P4 = $P2[$I4]
    $P3 = $P4.'optimize'()
    $P2[$I4] = $P3
  __label_10: # for iteration
.annotate 'line', 2233
    inc $I4
    goto __label_12
  __label_11: # for end
  __label_7:
.annotate 'line', 7002
    .return(self)
.annotate 'line', 7003

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7006
    self.'annotate'(__ARG_1)
.annotate 'line', 7011
    eq __ARG_2, '', __label_1
.annotate 'line', 7012
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 7014
    getattribute $P1, self, 'keys'
.annotate 'line', 7015
    getattribute $P2, self, 'values'
.annotate 'line', 7016
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
.annotate 'line', 7017
    set $I1, $P1
.annotate 'line', 7018
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 7019
    $P4 = $P1[$I2]
.annotate 'line', 7020
    null $S1
.annotate 'line', 7021
    $P5 = $P4.'isidentifier'()
    unless $P5 goto __label_7
    $P6 = $P4.'checkIdentifier'()
    set $S4, $P6
    iseq $I3, $S4, ''
    box $P5, $I3
  __label_7:
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 7022
    $P7 = $P4.'getName'()
    null $S2
    if_null $P7, __label_8
    set $S2, $P7
  __label_8:
.annotate 'line', 7023
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 7024
    __ARG_1.'emitget_hll_global'($S1, $S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 7027
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 7029
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 7030
    eq __ARG_2, '', __label_10
.annotate 'line', 7031
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_10: # endif
  __label_2: # for iteration
.annotate 'line', 7018
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 7033

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 7036
    self.'emit'(__ARG_1, '')
.annotate 'line', 7037

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 7040
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7041
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 7042
    .return($S1)
.annotate 'line', 7043

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6970
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6972
    addattribute $P0, 'keys'
.annotate 'line', 6973
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 7056
    .return('P')

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
.annotate 'line', 7061
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
.annotate 'line', 7062

.end # parseinitializer


.sub 'numargs' :method
.annotate 'line', 7065
    getattribute $P1, self, 'initializer'
.annotate 'line', 7066
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)
.annotate 'line', 7067

.end # numargs


.sub 'optimize_initializer' :method
.annotate 'line', 7070
    getattribute $P1, self, 'initializer'
.annotate 'line', 7071
    if_null $P1, __label_1
.annotate 'line', 7072
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7073

.end # optimize_initializer


.sub 'optimize' :method
.annotate 'line', 7076
    self.'optimize_initializer'()
.annotate 'line', 7077
    .return(self)
.annotate 'line', 7078

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 7081
    getattribute $P1, self, 'initializer'
.annotate 'line', 7082
    if_null $P1, __label_1
.annotate 'line', 7083
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 7084
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 7085
    if_null $P1, __label_2
.annotate 'line', 7086
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 7087
    __ARG_1.'say'(")")
.annotate 'line', 7088

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 7048
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7050
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'warn_class_unknown' :subid('WSubId_99')
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7095
    concat $S1, "class ", __ARG_2
    concat $S1, $S1, " not found at compile time"
    __ARG_1.'warn'($S1, __ARG_3)
.annotate 'line', 7096

.end # warn_class_unknown

.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7104
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7106
    $P2 = __ARG_4.'isstring'()
    if $P2 goto __label_2
    $P2 = __ARG_4.'isidentifier'()
  __label_2:
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7107
    WSubId_25("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 7108
    setattribute self, 'value', __ARG_4
.annotate 'line', 7109
    $P1 = __ARG_1.'get'()
.annotate 'line', 7111
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7112
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 7114
    __ARG_1.'unget'($P1)
  __label_4: # endif
.annotate 'line', 7115

.end # NewExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7118
    new $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 7119
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7120
    getattribute $P3, self, 'value'
    setattribute $P1, 'value', $P3
.annotate 'line', 7121
    getattribute $P2, self, 'initializer'
    if_null $P2, __label_1
.annotate 'line', 7122
    getattribute $P5, self, 'initializer'
    $P4 = $P5.'clone'(__ARG_1)
    setattribute $P1, 'initializer', $P4
  __label_1: # endif
.annotate 'line', 7123
    .return($P1)
.annotate 'line', 7124

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7127
    getattribute $P1, self, 'value'
.annotate 'line', 7128
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7131
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 7132
    isnull $I1, $P2
    not $I1
    box $P3, $I1
    unless $P3 goto __label_3
    $P3 = $P2.'isconst'()
  __label_3:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7133
    $P1 = $P2.'getvalue'()
.annotate 'line', 7134
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 7135
    WSubId_25('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 7136
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 7139
    self.'optimize_initializer'()
.annotate 'line', 7140
    .return(self)
.annotate 'line', 7141

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7144
    self.'annotate'(__ARG_1)
.annotate 'line', 7146
    getattribute $P1, self, 'initializer'
.annotate 'line', 7147
    getattribute $P2, self, 'value'
.annotate 'line', 7148
    $P8 = self.'numargs'()
    set $I1, $P8
.annotate 'line', 7151
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 7152
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 7154
    set $S1, ''
.annotate 'line', 7155
    set $S2, __ARG_2
.annotate 'line', 7156
    null $S3
    if $I1 == -1 goto __label_7
    if $I1 == 0 goto __label_8
    if $I1 == 1 goto __label_9
    goto __label_5
  __label_7: # case
  __label_8: # case
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 7162
    ne $I2, 1, __label_10
.annotate 'line', 7163
    not $I4, __ARG_3
    unless $I4 goto __label_12
.annotate 'line', 7164
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_12: # endif
    goto __label_11
  __label_10: # else
.annotate 'line', 7167
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 7168
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 7169
    concat $S5, ', ', $S1
    set $S1, $S5
  __label_11: # endif
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 7173
    eq $I2, 1, __label_13
.annotate 'line', 7174
    WSubId_25('Multiple init arguments not allowed here', self)
  __label_13: # endif
.annotate 'line', 7175
    not $I3, __ARG_3
    unless $I3 goto __label_14
.annotate 'line', 7176
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_14: # endif
  __label_6: # switch end
.annotate 'line', 7179
    ne $S2, '', __label_15
.annotate 'line', 7180
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
    if $I2 == 0 goto __label_18
    if $I2 == 1 goto __label_19
    goto __label_16
  __label_18: # case
.annotate 'line', 7185
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
  __label_20:
.annotate 'line', 7186
    get_class $P4, $S4
.annotate 'line', 7187
    unless_null $P4, __label_21
.annotate 'line', 7188
    WSubId_99(__ARG_1, $S4, $P2)
  __label_21: # endif
.annotate 'line', 7192
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 7193
    le $I1, 1, __label_22
.annotate 'line', 7194
    __ARG_1.'say'($S2, ".'", $P2, "'()")
  __label_22: # endif
    goto __label_17 # break
  __label_19: # case
.annotate 'line', 7198
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 7199
    unless_null $P5, __label_23
.annotate 'line', 7200
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 7201
    if_null $P6, __label_25
.annotate 'line', 7202
    $P7 = $P6.'getpath'()
.annotate 'line', 7203
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
    goto __label_26
  __label_25: # else
.annotate 'line', 7206
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 7207
    if_null $P5, __label_27
.annotate 'line', 7208
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_28
  __label_27: # else
.annotate 'line', 7210
    $P9 = $P2.'getidentifier'()
    WSubId_99(__ARG_1, $P9, $P2)
.annotate 'line', 7211
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
  __label_28: # endif
  __label_26: # endif
.annotate 'line', 7214
    set $S3, $P2
    goto __label_24
  __label_23: # else
.annotate 'line', 7218
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
  __label_24: # endif
    goto __label_17 # break
  __label_16: # default
.annotate 'line', 7222
    WSubId_30('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 7224
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isge $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
  __label_31:
  __label_30:
    unless $I3 goto __label_29
.annotate 'line', 7225
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 7226
    not $I3, __ARG_3
    unless $I3 goto __label_32
.annotate 'line', 7227
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_32: # endif
  __label_29: # endif
.annotate 'line', 7229

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 7098
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7100
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7240
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7241
    setattribute self, 'owner', __ARG_2
.annotate 'line', 7242
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
.annotate 'line', 7243
    setattribute self, 'nskey', $P1
.annotate 'line', 7244
    $P2 = __ARG_1.'get'()
.annotate 'line', 7245
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7246
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 7248
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 7249

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7252
    null $S1
.annotate 'line', 7253
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
.annotate 'line', 7258
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 7259
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 7262
    WSubId_25('Multiple init arguments not allowed here', self)
  __label_2: # switch end
.annotate 'line', 7264
    getattribute $P2, self, 'nskey'
.annotate 'line', 7266
    __ARG_1.'print'('    ')
.annotate 'line', 7267
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 7268
    __ARG_1.'print'("root_")
  __label_6: # endif
.annotate 'line', 7269
    __ARG_1.'print'("new ", __ARG_2, ", ")
    null $P3
.annotate 'line', 7270
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 7271
    if_null $S1, __label_7
.annotate 'line', 7272
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
.annotate 'line', 7273
    __ARG_1.'say'()
.annotate 'line', 7274

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 7234
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7236
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7285
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7286
    setattribute self, 'owner', __ARG_2
.annotate 'line', 7287
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
.annotate 'line', 7288
    setattribute self, 'nskey', $P1
.annotate 'line', 7289
    $P2 = __ARG_1.'get'()
.annotate 'line', 7290
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7291
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 7293
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 7294

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7297
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 7298
    set $S1, __ARG_2
.annotate 'line', 7299
    le $I1, 0, __label_1
.annotate 'line', 7300
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 7301
    getattribute $P1, self, 'nskey'
.annotate 'line', 7303
    ne $S1, '', __label_2
.annotate 'line', 7304
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7306
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 7308
    lt $I1, 0, __label_3
.annotate 'line', 7309
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 7310
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 7311
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 7313

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 7279
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7281
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7320
    $P1 = __ARG_1.'get'()
.annotate 'line', 7323
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7327
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7330
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 7325
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 7326
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 7325
    .return($P3)
  __label_4: # case
.annotate 'line', 7329
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 7333
    $P2 = __ARG_1.'get'()
.annotate 'line', 7334
    __ARG_1.'unget'($P2)
.annotate 'line', 7335
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 7337
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_6: # endif
  __label_2: # default
.annotate 'line', 7342
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
.annotate 'line', 7344

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 7355
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 7356
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 7357
    $P2 = WSubId_92(__ARG_4, self)
    setattribute self, 'checked', $P2
.annotate 'line', 7358

.end # OpInstanceOfExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7361
    new $P1, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 7362
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7363
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'lexpr', $P3
.annotate 'line', 7364
    getattribute $P4, self, 'checked'
    $P3 = $P4.'clone'(self)
    setattribute $P1, 'checked', $P3
.annotate 'line', 7365
    .return($P1)
.annotate 'line', 7366

.end # clone


.sub 'optimize' :method
.annotate 'line', 7369
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 7370
    .return(self)
.annotate 'line', 7371

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7372
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7375
    getattribute $P1, self, 'lexpr'
.annotate 'line', 7376
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7377
    eq $S1, 'P', __label_2
.annotate 'line', 7378
    WSubId_25('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 7379
    getattribute $P2, self, 'checked'
.annotate 'line', 7381
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 7382
    self.'annotate'(__ARG_1)
.annotate 'line', 7383
    __ARG_1.'print'('    isa ', __ARG_2, ', ', $S2, ', ')
.annotate 'line', 7384
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 7385
    __ARG_1.'say'()
.annotate 'line', 7386

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 7348
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7350
    addattribute $P0, 'lexpr'
.annotate 'line', 7351
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 7399
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 7400
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 7401
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 7402
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 7403
    .return(self)
.annotate 'line', 7404

.end # OpConditionalExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7407
    new $P1, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 7408
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7409
    new $P4, [ 'Winxed'; 'Compiler'; 'Condition' ]
    getattribute $P7, self, 'condition'
    getattribute $P6, $P7, 'condexpr'
    $P5 = $P6.'clone'(__ARG_1)
    $P3 = $P4.'set'($P5)
    setattribute $P1, 'condition', $P3
.annotate 'line', 7410
    getattribute $P4, self, 'etrue'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'etrue', $P3
.annotate 'line', 7411
    getattribute $P4, self, 'efalse'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'efalse', $P3
.annotate 'line', 7412
    .return($P1)
.annotate 'line', 7413

.end # clone


.sub 'optimize' :method
.annotate 'line', 7416
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7417
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 7419
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 7421
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_1: # default
.annotate 'line', 7423
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 7424
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 7425
    .return(self)
  __label_2: # switch end
.annotate 'line', 7427

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7430
    getattribute $P1, self, 'etrue'
.annotate 'line', 7431
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7432
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 7434
    .tailcall $P1.'checkresult'()
  __label_2: # endif
.annotate 'line', 7435

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7438
    getattribute $P1, self, 'owner'
.annotate 'line', 7439
    $P5 = $P1.'genlabel'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7440
    $P5 = $P1.'genlabel'()
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
  __label_2:
.annotate 'line', 7441
    getattribute $P5, self, 'condition'
    $P5.'emit_else'(__ARG_1, $S2)
.annotate 'line', 7442
    getattribute $P2, self, 'etrue'
.annotate 'line', 7443
    $P5 = self.'checkresult'()
    null $S3
    if_null $P5, __label_3
    set $S3, $P5
  __label_3:
.annotate 'line', 7444
    $P5 = $P2.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7445
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 7447
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 7448
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7449
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7450
    getattribute $P3, self, 'efalse'
.annotate 'line', 7451
    $P5 = $P3.'isnull'()
    if_null $P5, __label_6
    unless $P5 goto __label_6
.annotate 'line', 7452
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
.annotate 'line', 7454
    $P6 = $P3.'checkresult'()
    null $S4
    if_null $P6, __label_8
    set $S4, $P6
  __label_8:
.annotate 'line', 7455
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7456
    $P5 = $P3.'emit_get'(__ARG_1)
    null $S5
    if_null $P5, __label_12
    set $S5, $P5
  __label_12:
.annotate 'line', 7457
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 7461
    ne $S4, 'P', __label_13
.annotate 'line', 7462
    $P4 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 7463
    __ARG_1.'emitset'(__ARG_2, $P4)
    goto __label_14
  __label_13: # else
.annotate 'line', 7466
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
  __label_10: # endif
  __label_7: # endif
.annotate 'line', 7469
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 7470

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 7473
    getattribute $P1, self, 'owner'
.annotate 'line', 7474
    $P2 = $P1.'genlabel'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7475
    $P2 = $P1.'genlabel'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7476
    getattribute $P2, self, 'condition'
    $P2.'emit_else'(__ARG_1, $S2)
.annotate 'line', 7477
    getattribute $P2, self, 'etrue'
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 7478
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7479
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7480
    getattribute $P2, self, 'efalse'
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 7481
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 7482

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 7391
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7393
    addattribute $P0, 'condition'
.annotate 'line', 7394
    addattribute $P0, 'etrue'
.annotate 'line', 7395
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getOpCode_2' :subid('WSubId_102')
        .param pmc __ARG_1
.annotate 'line', 7528
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
.annotate 'line', 7529
    .return(1)
  __label_4: # case
.annotate 'line', 7530
    .return(2)
  __label_5: # case
.annotate 'line', 7531
    .return(3)
  __label_1: # default
.annotate 'line', 7532
    .return(0)
  __label_2: # switch end
.annotate 'line', 7534

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_104')
        .param pmc __ARG_1
.annotate 'line', 7538
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '-' goto __label_3
    if $S1 == '!' goto __label_4
    if $S1 == '~' goto __label_5
    if $S1 == '++' goto __label_6
    if $S1 == '--' goto __label_7
    goto __label_1
  __label_3: # case
.annotate 'line', 7539
    .return(8)
  __label_4: # case
.annotate 'line', 7540
    .return(11)
  __label_5: # case
.annotate 'line', 7541
    .return(34)
  __label_6: # case
.annotate 'line', 7542
    .return(9)
  __label_7: # case
.annotate 'line', 7543
    .return(10)
  __label_1: # default
.annotate 'line', 7545
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(32)
    goto __label_9
  __label_8: # else
.annotate 'line', 7546
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(33)
    goto __label_11
  __label_10: # else
.annotate 'line', 7547
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_2: # switch end
.annotate 'line', 7549

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_107')
        .param pmc __ARG_1
.annotate 'line', 7553
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '*' goto __label_3
    if $S1 == '/' goto __label_4
    if $S1 == '%' goto __label_5
    if $S1 == '%%' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7554
    .return(19)
  __label_4: # case
.annotate 'line', 7555
    .return(20)
  __label_5: # case
.annotate 'line', 7556
    .return(21)
  __label_6: # case
.annotate 'line', 7557
    .return(22)
  __label_1: # default
.annotate 'line', 7558
    .return(0)
  __label_2: # switch end
.annotate 'line', 7560

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_110')
        .param pmc __ARG_1
.annotate 'line', 7564
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<<' goto __label_3
    if $S1 == '>>' goto __label_4
    if $S1 == '>>>' goto __label_5
    goto __label_1
  __label_3: # case
.annotate 'line', 7565
    .return(28)
  __label_4: # case
.annotate 'line', 7566
    .return(29)
  __label_5: # case
.annotate 'line', 7567
    .return(30)
  __label_1: # default
.annotate 'line', 7568
    .return(0)
  __label_2: # switch end
.annotate 'line', 7570

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_112')
        .param pmc __ARG_1
.annotate 'line', 7574
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<' goto __label_3
    if $S1 == '>' goto __label_4
    if $S1 == '<=' goto __label_5
    if $S1 == '>=' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7575
    .return(14)
  __label_4: # case
.annotate 'line', 7576
    .return(16)
  __label_5: # case
.annotate 'line', 7577
    .return(15)
  __label_6: # case
.annotate 'line', 7578
    .return(17)
  __label_1: # default
.annotate 'line', 7580
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 7581
    .return(0)
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 7583

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_114')
        .param pmc __ARG_1
.annotate 'line', 7587
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '==' goto __label_3
    if $S1 == '!=' goto __label_4
    if $S1 == '===' goto __label_5
    if $S1 == '!==' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7588
    .return(12)
  __label_4: # case
.annotate 'line', 7589
    .return(13)
  __label_5: # case
.annotate 'line', 7590
    .return(25)
  __label_6: # case
.annotate 'line', 7591
    .return(26)
  __label_1: # default
.annotate 'line', 7592
    .return(0)
  __label_2: # switch end
.annotate 'line', 7594

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_123')
        .param pmc __ARG_1
.annotate 'line', 7598
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
.annotate 'line', 7599
    .return(4)
  __label_4: # case
.annotate 'line', 7600
    .return(5)
  __label_5: # case
.annotate 'line', 7601
    .return(6)
  __label_6: # case
.annotate 'line', 7602
    .return(18)
  __label_7: # case
.annotate 'line', 7603
    .return(23)
  __label_8: # case
.annotate 'line', 7604
    .return(24)
  __label_9: # case
.annotate 'line', 7605
    .return(31)
  __label_1: # default
.annotate 'line', 7606
    .return(0)
  __label_2: # switch end
.annotate 'line', 7608

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 7612
    $P1 = __ARG_1.'get'()
.annotate 'line', 7613
    null $P2
.annotate 'line', 7616
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7620
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7622
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 7624
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 7626
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 7628
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 7630
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 7632
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 7634
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 7636
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 7638
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 7617
    $P2 = WSubId_68(__ARG_1, __ARG_2)
.annotate 'line', 7618
    WSubId_84(')', __ARG_1)
.annotate 'line', 7619
    .return($P2)
  __label_4: # case
.annotate 'line', 7621
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 7623
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 7625
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 7627
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_44(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 7629
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 7631
    .tailcall WSubId_100(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 7633
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 7635
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 7637
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 7639
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 7641
    WSubId_70('expression', $P1)
  __label_1: # switch end
.annotate 'line', 7643

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7647
    $P1 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7648
    null $P2
.annotate 'line', 7649
    null $P3
.annotate 'line', 7650
    null $I1
  __label_2: # while
.annotate 'line', 7651
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_102($P2)
    set $I1, $P5
    unless $I1 goto __label_1
    if $I1 == 1 goto __label_5
    if $I1 == 2 goto __label_6
    if $I1 == 3 goto __label_7
    goto __label_3
  __label_5: # case
.annotate 'line', 7654
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7657
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7660
    set $P3, $P2
.annotate 'line', 7661
    $P2 = __ARG_1.'get'()
.annotate 'line', 7662
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 7663
    $P4 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7664
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
    goto __label_9
  __label_8: # else
.annotate 'line', 7667
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7670
    WSubId_30('Unexpected code in parseExpr_2')
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7673
    __ARG_1.'unget'($P2)
.annotate 'line', 7674
    .return($P1)
.annotate 'line', 7675

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_103 = "WSubId_103"
.annotate 'line', 7679
    $P1 = WSubId_103(__ARG_1, __ARG_2)
.annotate 'line', 7680
    $P2 = __ARG_1.'get'()
.annotate 'line', 7682
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 7684
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7683
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 7685
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 7687
    __ARG_1.'unget'($P2)
.annotate 'line', 7688
    .return($P1)
  __label_1: # switch end
.annotate 'line', 7690

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_106 = "WSubId_106"
.annotate 'line', 7694
    $P1 = __ARG_1.'get'()
.annotate 'line', 7695
    $P3 = WSubId_104($P1)
    set $I1, $P3
.annotate 'line', 7696
    unless $I1 goto __label_1
.annotate 'line', 7697
    $P2 = WSubId_105(__ARG_1, __ARG_2)
    if $I1 == 8 goto __label_5
    if $I1 == 11 goto __label_6
    if $I1 == 34 goto __label_7
    if $I1 == 9 goto __label_8
    if $I1 == 10 goto __label_9
    if $I1 == 32 goto __label_10
    if $I1 == 33 goto __label_11
    goto __label_3
  __label_5: # case
.annotate 'line', 7700
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 7702
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 7704
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 7706
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 7708
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 7710
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 7712
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_3: # default
.annotate 'line', 7714
    WSubId_30('Invalid code in parseExpr_4', $P1)
  __label_4: # switch end
    goto __label_2
  __label_1: # else
.annotate 'line', 7718
    __ARG_1.'unget'($P1)
.annotate 'line', 7719
    .tailcall WSubId_106(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 7721

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7725
    $P1 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7726
    null $P2
.annotate 'line', 7727
    null $I1
  __label_2: # while
.annotate 'line', 7728
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_107($P2)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7729
    $P3 = WSubId_105(__ARG_1, __ARG_2)
    if $I1 == 19 goto __label_5
    if $I1 == 20 goto __label_6
    if $I1 == 21 goto __label_7
    if $I1 == 22 goto __label_8
    goto __label_3
  __label_5: # case
.annotate 'line', 7732
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7735
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7738
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7741
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7744
    WSubId_30('Invalid code in parseExpr_5', $P2)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7747
    __ARG_1.'unget'($P2)
.annotate 'line', 7748
    .return($P1)
.annotate 'line', 7749

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_108 = "WSubId_108"
.annotate 'line', 7753
    $P1 = WSubId_108(__ARG_1, __ARG_2)
.annotate 'line', 7754
    null $P2
  __label_2: # while
.annotate 'line', 7755
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('+')
    if $P5 goto __label_3
    $P5 = $P2.'isop'('-')
  __label_3:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7756
    $P3 = WSubId_108(__ARG_1, __ARG_2)
.annotate 'line', 7757
    null $P4
.annotate 'line', 7758
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7759
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 7761
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 7762
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7764
    __ARG_1.'unget'($P2)
.annotate 'line', 7765
    .return($P1)
.annotate 'line', 7766

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7770
    $P1 = WSubId_109(__ARG_1, __ARG_2)
.annotate 'line', 7771
    null $P2
.annotate 'line', 7772
    null $P3
.annotate 'line', 7773
    null $I1
  __label_2: # while
.annotate 'line', 7774
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_110($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 28 goto __label_5
    if $I1 == 29 goto __label_6
    if $I1 == 30 goto __label_7
    goto __label_3
  __label_5: # case
.annotate 'line', 7777
    $P2 = WSubId_109(__ARG_1, __ARG_2)
.annotate 'line', 7778
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7781
    $P2 = WSubId_109(__ARG_1, __ARG_2)
.annotate 'line', 7782
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7785
    $P2 = WSubId_109(__ARG_1, __ARG_2)
.annotate 'line', 7786
    new $P7, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
    $P7.'OpShiftlrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7789
    WSubId_30('Invalid code in parseExpr_7', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7792
    __ARG_1.'unget'($P3)
.annotate 'line', 7793
    .return($P1)
.annotate 'line', 7794

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7798
    $P1 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7799
    null $P2
.annotate 'line', 7800
    null $P3
.annotate 'line', 7801
    null $I1
  __label_2: # while
.annotate 'line', 7802
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_112($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 14 goto __label_5
    if $I1 == 16 goto __label_6
    if $I1 == 15 goto __label_7
    if $I1 == 17 goto __label_8
    if $I1 == 27 goto __label_9
    goto __label_3
  __label_5: # case
.annotate 'line', 7805
    $P2 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7806
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7809
    $P2 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7810
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7813
    $P2 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7814
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7817
    $P2 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7818
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 7821
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7824
    WSubId_30('Invalid code in parseExpr_9', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7827
    __ARG_1.'unget'($P3)
.annotate 'line', 7828
    .return($P1)
.annotate 'line', 7829

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_115')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7833
    $P1 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7834
    null $P2
.annotate 'line', 7835
    null $P3
.annotate 'line', 7836
    null $I1
  __label_2: # while
.annotate 'line', 7837
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_114($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 12 goto __label_5
    if $I1 == 13 goto __label_6
    if $I1 == 25 goto __label_7
    if $I1 == 26 goto __label_8
    goto __label_3
  __label_5: # case
.annotate 'line', 7840
    $P2 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7841
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7844
    $P2 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7845
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7848
    $P2 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7849
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7852
    $P2 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7853
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7856
    WSubId_30('Invalid code in parseExpr_8', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7859
    __ARG_1.'unget'($P3)
.annotate 'line', 7860
    .return($P1)
.annotate 'line', 7861

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_115 = "WSubId_115"
.annotate 'line', 7865
    $P1 = WSubId_115(__ARG_1, __ARG_2)
.annotate 'line', 7866
    null $P2
  __label_2: # while
.annotate 'line', 7867
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7868
    $P3 = WSubId_115(__ARG_1, __ARG_2)
.annotate 'line', 7869
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7871
    __ARG_1.'unget'($P2)
.annotate 'line', 7872
    .return($P1)
.annotate 'line', 7873

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_116 = "WSubId_116"
.annotate 'line', 7877
    $P1 = WSubId_116(__ARG_1, __ARG_2)
.annotate 'line', 7878
    null $P2
  __label_2: # while
.annotate 'line', 7879
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7880
    $P3 = WSubId_116(__ARG_1, __ARG_2)
.annotate 'line', 7881
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7883
    __ARG_1.'unget'($P2)
.annotate 'line', 7884
    .return($P1)
.annotate 'line', 7885

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_118')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_117 = "WSubId_117"
.annotate 'line', 7889
    $P1 = WSubId_117(__ARG_1, __ARG_2)
.annotate 'line', 7890
    null $P2
  __label_2: # while
.annotate 'line', 7891
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7892
    $P3 = WSubId_117(__ARG_1, __ARG_2)
.annotate 'line', 7893
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7895
    __ARG_1.'unget'($P2)
.annotate 'line', 7896
    .return($P1)
.annotate 'line', 7897

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_118 = "WSubId_118"
.annotate 'line', 7901
    $P1 = WSubId_118(__ARG_1, __ARG_2)
.annotate 'line', 7902
    null $P2
  __label_2: # while
.annotate 'line', 7903
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7904
    $P3 = WSubId_118(__ARG_1, __ARG_2)
.annotate 'line', 7905
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7907
    __ARG_1.'unget'($P2)
.annotate 'line', 7908
    .return($P1)
.annotate 'line', 7909

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_120')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_119 = "WSubId_119"
.const 'Sub' WSubId_118 = "WSubId_118"
.annotate 'line', 7913
    $P1 = WSubId_119(__ARG_1, __ARG_2)
.annotate 'line', 7914
    null $P2
  __label_2: # while
.annotate 'line', 7915
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7916
    $P3 = WSubId_118(__ARG_1, __ARG_2)
.annotate 'line', 7917
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7919
    __ARG_1.'unget'($P2)
.annotate 'line', 7920
    .return($P1)
.annotate 'line', 7921

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_122')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 7925
    $P1 = WSubId_120(__ARG_1, __ARG_2)
.annotate 'line', 7926
    $P2 = __ARG_1.'get'()
.annotate 'line', 7927
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7928
    $P3 = WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7929
    WSubId_84(':', __ARG_1)
.annotate 'line', 7930
    $P4 = WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7931
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 7934
    __ARG_1.'unget'($P2)
.annotate 'line', 7935
    .return($P1)
  __label_2: # endif
.annotate 'line', 7937

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_121')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_122 = "WSubId_122"
.const 'Sub' WSubId_123 = "WSubId_123"
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7941
    $P1 = WSubId_122(__ARG_1, __ARG_2)
.annotate 'line', 7942
    null $P2
.annotate 'line', 7943
    null $I1
  __label_2: # while
.annotate 'line', 7944
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_123($P2)
    set $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 7945
    $P3 = WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7946
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
.annotate 'line', 7949
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7952
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7955
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7958
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 7961
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_4 # break
  __label_10: # case
.annotate 'line', 7964
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_4 # break
  __label_11: # case
.annotate 'line', 7967
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7970
    WSubId_30('Unexpected code in parseExpr_16', $P2)
  __label_4: # switch end
.annotate 'line', 7972
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7973
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7975
    __ARG_1.'unget'($P2)
.annotate 'line', 7976
    .return($P1)
.annotate 'line', 7977

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_121 = "WSubId_121"
.annotate 'line', 7981
    .tailcall WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7982

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7997
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7998
    WSubId_30('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7999
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 8000
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 8001
    .return($S1)
.annotate 'line', 8002

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 8005
    getattribute $P1, self, 'brlabel'
.annotate 'line', 8006
    unless_null $P1, __label_1
.annotate 'line', 8007
    WSubId_30('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 8008
    .return($P1)
.annotate 'line', 8009

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7993
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 8018
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 8019
    WSubId_30('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 8020
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 8021
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 8022
    .return($S1)
.annotate 'line', 8023

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 8026
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 8027
    unless_null $P1, __label_1
.annotate 'line', 8028
    WSubId_30('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 8029
    .return($P1)
.annotate 'line', 8030

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 8012
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 8014
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8046
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8047
    $P1 = __ARG_2.'get'()
.annotate 'line', 8048
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8049
    __ARG_2.'unget'($P1)
.annotate 'line', 8050
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 8052

.end # parse


.sub 'optimize' :method
.annotate 'line', 8055
    getattribute $P1, self, 'values'
.annotate 'line', 8056
    if_null $P1, __label_1
.annotate 'line', 8057
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 8058
    .return(self)
.annotate 'line', 8059

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8063
    getattribute $P1, self, 'values'
.annotate 'line', 8064
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 8067
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
.annotate 'line', 8068
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 8069
    $P3 = $P2.'cantailcall'()
    unless $P3 goto __label_6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'allowtailcall'()
  __label_6:
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 8070
    self.'annotate'(__ARG_1)
.annotate 'line', 8071
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 8075
    le $I1, 0, __label_7
.annotate 'line', 8076
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 8078
    self.'annotate'(__ARG_1)
.annotate 'line', 8079
    self.'emitret'(__ARG_1)
.annotate 'line', 8080
    le $I1, 0, __label_8
.annotate 'line', 8081
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 8082
    __ARG_1.'say'(')')
.annotate 'line', 8083

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 8040
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8042
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8090
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8091

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 8094
    __ARG_1.'print'('    ', '.return(')
.annotate 'line', 8095

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 8086
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8102
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8103

.end # YieldStatement


.sub 'clone' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 8106
    WSubId_25("inlined yield not allowed", self)
.annotate 'line', 8107

.end # clone


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 8110
    __ARG_1.'print'('    ', '.yield(')
.annotate 'line', 8111

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 8098
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]

.sub 'InlineReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8119
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8120
    $P1 = __ARG_2.'get'()
.annotate 'line', 8121
    __ARG_2.'unget'($P1)
.annotate 'line', 8122
    $P2 = $P1.'isop'(";")
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8123
    $P4 = WSubId_68(__ARG_2, __ARG_3)
    setattribute self, 'expr', $P4
  __label_1: # endif
.annotate 'line', 8124

.end # InlineReturnStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8127
    new $P1, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
.annotate 'line', 8128
    getattribute $P3, self, 'start'
    $P1.'Statement'($P3, __ARG_1)
.annotate 'line', 8129
    getattribute $P2, self, 'expr'
.annotate 'line', 8130
    if_null $P2, __label_1
.annotate 'line', 8131
    $P4 = $P2.'clone'(__ARG_1)
    setattribute $P1, 'expr', $P4
  __label_1: # endif
.annotate 'line', 8132
    .return($P1)
.annotate 'line', 8133

.end # clone


.sub 'optimize' :method
.annotate 'line', 8136
    getattribute $P1, self, 'expr'
.annotate 'line', 8137
    if_null $P1, __label_1
.annotate 'line', 8138
    $P3 = $P1.'optimize'()
    setattribute self, 'expr', $P3
  __label_1: # endif
.annotate 'line', 8139
    .return(self)
.annotate 'line', 8140

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8143
    getattribute $P4, self, 'owner'
    $P1 = $P4.'getouter'()
.annotate 'line', 8144
    getattribute $P2, self, 'expr'
.annotate 'line', 8145
    $P4 = $P1.'getrettype'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8146
    self.'annotate'(__ARG_1)
.annotate 'line', 8147
    if_null $P2, __label_2
.annotate 'line', 8148
    $P3 = $P1.'getretreg'()
.annotate 'line', 8149
    unless_null $P3, __label_3
.annotate 'line', 8150
    $P2.'emit_void'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 8152
    $P4 = $P2.'isnull'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 8153
    __ARG_1.'emitnull'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 8155
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_7
    set $S2, $P5
  __label_7:
.annotate 'line', 8156
    ne $S2, $S1, __label_8
.annotate 'line', 8157
    $P2.'emit'(__ARG_1, $P3)
    goto __label_9
  __label_8: # else
.annotate 'line', 8159
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P4, __label_10
    set $S3, $P4
  __label_10:
.annotate 'line', 8160
    self.'annotate'(__ARG_1)
.annotate 'line', 8161
    ne $S1, 'P', __label_11
.annotate 'line', 8162
    __ARG_1.'emitbox'($P3, $S3)
    goto __label_12
  __label_11: # else
.annotate 'line', 8164
    __ARG_1.'emitset'($P3, $S3)
  __label_12: # endif
  __label_9: # endif
  __label_6: # endif
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 8169
    $P4 = $P1.'getendlabel'()
    null $S4
    if_null $P4, __label_13
    set $S4, $P4
  __label_13:
.annotate 'line', 8170
    self.'annotate'(__ARG_1)
.annotate 'line', 8171
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8172

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
.annotate 'line', 8114
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8116
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseReturn' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8177
    $P1 = __ARG_3.'getouter'()
.annotate 'line', 8178
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    unless $I1 goto __label_1
.annotate 'line', 8179
    new $P3, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
    $P3.'InlineReturnStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8181
    new $P5, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P5.'ReturnStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 8182

.end # parseReturn

.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8194
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8195
    setattribute self, 'name', __ARG_1
.annotate 'line', 8196
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
.annotate 'line', 8197

.end # LabelStatement


.sub 'optimize' :method
.annotate 'line', 8198
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8201
    self.'annotate'(__ARG_1)
.annotate 'line', 8202
    getattribute $P1, self, 'value'
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
.annotate 'line', 8203

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 8188
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8190
    addattribute $P0, 'name'
.annotate 'line', 8191
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 8217
    setattribute self, 'owner', __ARG_1
.annotate 'line', 8218
    box $P1, __ARG_2
    setattribute self, 'label', $P1
.annotate 'line', 8219

.end # Reflabel


.sub 'optimize' :method
.annotate 'line', 8220
    .return(self)

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 8223
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8224
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8225
    .return($S2)
.annotate 'line', 8226

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 8212
    addattribute $P0, 'owner'
.annotate 'line', 8213
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 8239
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8240
    $P1 = __ARG_2.'get'()
.annotate 'line', 8241
    WSubId_124($P1)
.annotate 'line', 8242
    setattribute self, 'label', $P1
.annotate 'line', 8243
    WSubId_84(';', __ARG_2)
.annotate 'line', 8244

.end # GotoStatement


.sub 'optimize' :method
.annotate 'line', 8245
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8248
    self.'annotate'(__ARG_1)
.annotate 'line', 8249
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8250
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8251
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
.annotate 'line', 8252

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 8233
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8235
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8263
    $P1 = WSubId_68(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 8264

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8267
    WSubId_84('(', __ARG_1)
.annotate 'line', 8268
    $P1 = WSubId_68(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 8269
    WSubId_84(')', __ARG_1)
.annotate 'line', 8270

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 8259
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
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 8283
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8284
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8285
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 8286
    $P1 = __ARG_2.'get'()
.annotate 'line', 8287
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8288
    $P4 = WSubId_125(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8290
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 8291
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8293

.end # IfStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8296
    new $P1, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 8297
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8298
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8299
    getattribute $P4, self, 'truebranch'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'truebranch', $P3
.annotate 'line', 8300
    getattribute $P4, self, 'falsebranch'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'falsebranch', $P3
.annotate 'line', 8301
    .return($P1)
.annotate 'line', 8302

.end # clone


.sub 'optimize' :method
.annotate 'line', 8305
    self.'optimize_condition'()
.annotate 'line', 8306
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 8307
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 8308
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 8310
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 8312
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_1: # default
  __label_2: # switch end
.annotate 'line', 8314
    .return(self)
.annotate 'line', 8315

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8318
    getattribute $P1, self, 'truebranch'
.annotate 'line', 8319
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 8320
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 8321
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 8322
    set $S1, ''
.annotate 'line', 8323
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 8324
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8325
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8326
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 8327
    self.'annotate'(__ARG_1)
.annotate 'line', 8328
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 8329
    $P1.'emit'(__ARG_1)
.annotate 'line', 8331
    not $I3, $I2
    unless $I3 goto __label_5
.annotate 'line', 8332
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8333
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 8334
    $P2.'emit'(__ARG_1)
  __label_5: # endif
.annotate 'line', 8336
    __ARG_1.'emitlabel'($S2, 'endif')
.annotate 'line', 8337

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 8277
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 8279
    addattribute $P0, 'truebranch'
.annotate 'line', 8280
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 8349
    $P2 = WSubId_125(__ARG_1, self)
    setattribute self, 'body', $P2
.annotate 'line', 8350

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
.annotate 'line', 8353
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8354
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8356
    self.'annotate'(__ARG_1)
.annotate 'line', 8357
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 8358
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8359
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8360
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
.annotate 'line', 8361

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 8344
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 8346
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8372
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8373
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8374
    self.'parsebody'(__ARG_2)
.annotate 'line', 8375

.end # WhileStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8378
    new $P1, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 8379
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8380
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8381
    getattribute $P4, self, 'body'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'body', $P3
.annotate 'line', 8382
    .return($P1)
.annotate 'line', 8383

.end # clone


.sub 'optimize' :method
.annotate 'line', 8386
    self.'optimize_condition'()
.annotate 'line', 8387
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8388
    .return(self)
.annotate 'line', 8389

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8392
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 8394
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 8397
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 8398
    __ARG_1.'comment'('while(false) optimized out')
  __label_5: # endif
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 8401
    $P3 = self.'genbreaklabel'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8402
    $P4 = self.'gencontinuelabel'()
    null $S2
    if_null $P4, __label_7
    set $S2, $P4
  __label_7:
.annotate 'line', 8404
    self.'annotate'(__ARG_1)
.annotate 'line', 8405
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 8406
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 8407
    getattribute $P5, self, 'body'
    $P5.'emit'(__ARG_1)
.annotate 'line', 8408
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8409
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_2: # switch end
.annotate 'line', 8411

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 8368
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
.const 'Sub' WSubId_126 = "WSubId_126"
.annotate 'line', 8422
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8423
    self.'parsebody'(__ARG_2)
.annotate 'line', 8424
    WSubId_126('while', __ARG_2)
.annotate 'line', 8425
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8426

.end # DoStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8429
    new $P1, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 8430
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8431
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8432
    getattribute $P4, self, 'body'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'body', $P3
.annotate 'line', 8433
    .return($P1)
.annotate 'line', 8434

.end # clone


.sub 'optimize' :method
.annotate 'line', 8437
    self.'optimize_condition'()
.annotate 'line', 8438
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 8439
    $P2 = $P1.'isempty'()
    unless $P2 goto __label_2
    $P3 = self.'getvalue'()
    set $I2, $P3
    iseq $I1, $I2, 2
    box $P2, $I1
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8440
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8441
    setattribute self, 'body', $P1
.annotate 'line', 8442
    .return(self)
.annotate 'line', 8443

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8446
    getattribute $P1, self, 'body'
.annotate 'line', 8447
    $P2 = self.'getvalue'()
    set $I1, $P2
    if $I1 == 1 goto __label_3
    goto __label_1
  __label_3: # case
.annotate 'line', 8450
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 8453
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 8454
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 8455
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 8457
    self.'annotate'(__ARG_1)
.annotate 'line', 8458
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 8460
    $P1.'emit'(__ARG_1)
.annotate 'line', 8461
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 8462
    eq $I1, 2, __label_7
.annotate 'line', 8463
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 8464
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_2: # switch end
.annotate 'line', 8466

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 8418
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
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 8477
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8478
    WSubId_84(';', __ARG_2)
.annotate 'line', 8479

.end # ContinueStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8482
    new $P1, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 8483
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8484
    .return($P1)
.annotate 'line', 8485

.end # clone


.sub 'optimize' :method
.annotate 'line', 8486
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8489
    self.'annotate'(__ARG_1)
.annotate 'line', 8490
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8491
    __ARG_1.'emitgoto'($S1, 'continue')
.annotate 'line', 8492

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 8473
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 8503
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8504
    WSubId_84(';', __ARG_2)
.annotate 'line', 8505

.end # BreakStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8508
    new $P1, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 8509
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8510
    .return($P1)
.annotate 'line', 8511

.end # clone


.sub 'optimize' :method
.annotate 'line', 8512
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8515
    self.'annotate'(__ARG_1)
.annotate 'line', 8516
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8517
    __ARG_1.'emitgoto'($S1, 'break')
.annotate 'line', 8518

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 8499
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8533
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8534
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 8535
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 8536
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
.annotate 'line', 8537

.end # SwitchBaseStatement


.sub 'cloneswitchto' :subid('WSubId_11') :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8538
.lex '__WLEX_1', __ARG_2
.const 'Sub' WSubId_12 = "WSubId_12"
.annotate 'line', 8540
    getattribute $P17, self, 'start'
    __ARG_1.'Statement'($P17, __ARG_2)
.annotate 'line', 8541
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
.annotate 'line', 8541
    setattribute __ARG_1, 'case_value', $P17
.annotate 'line', 8542
    getattribute $P7, self, 'case_st'
    root_new $P8, ['parrot';'ResizablePMCArray']
.annotate 'line', 8543
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
.annotate 'line', 8542
    setattribute __ARG_1, 'case_st', $P17
.annotate 'line', 8544
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
.annotate 'line', 8544
    setattribute __ARG_1, 'default_st', $P17
.annotate 'line', 8545
    .return(__ARG_1)
.annotate 'line', 8546

.end # cloneswitchto


.sub '' :anon :subid('WSubId_12') :outer('WSubId_11')
        .param pmc __ARG_3
.annotate 'line', 8543
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
.annotate 'line', 8543
    .return($P9)

.end # WSubId_12


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 8549
    null $P1
  __label_2: # while
.annotate 'line', 8550
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'iskeyword'('case')
    if $P3 goto __label_3
    $P3 = $P1.'iskeyword'('default')
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 8551
    $P4 = $P1.'iskeyword'('case')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8552
    getattribute $P5, self, 'case_value'
    $P6 = WSubId_68(__ARG_1, self)
    push $P5, $P6
.annotate 'line', 8553
    $P1 = __ARG_1.'get'()
.annotate 'line', 8554
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 8555
    WSubId_70("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 8556
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 8557
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
.annotate 'line', 8558
    __ARG_1.'unget'($P1)
.annotate 'line', 8559
    $P3 = WSubId_125(__ARG_1, self)
    push $P2, $P3
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 8561
    getattribute $P3, self, 'case_st'
    push $P3, $P2
.annotate 'line', 8562
    __ARG_1.'unget'($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8565
    $P1 = __ARG_1.'get'()
.annotate 'line', 8566
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 8567
    WSubId_70("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 8568
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
.annotate 'line', 8569
    __ARG_1.'unget'($P1)
.annotate 'line', 8570
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_125(__ARG_1, self)
    push $P3, $P4
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 8572
    __ARG_1.'unget'($P1)
  __label_5: # endif
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8575
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 8576
    WSubId_70("'}' in switch", $P1)
  __label_16: # endif
.annotate 'line', 8577

.end # parse_cases


.sub 'optimize_cases' :method
.annotate 'line', 8580
    getattribute $P2, self, 'case_value'
.annotate 'line', 2232
    if_null $P2, __label_3
    elements $I1, $P2
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P6 = $P2[$I2]
    $P5 = $P6.'optimize'()
    $P2[$I2] = $P5
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 8582
    getattribute $P5, self, 'case_st'
    if_null $P5, __label_8
    iter $P7, $P5
    set $P7, 0
  __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P1, $P7
.annotate 'line', 8583
    set $P3, $P1
.annotate 'line', 2232
    if_null $P3, __label_11
    elements $I3, $P3
    goto __label_10
  __label_11:
    null $I3
  __label_10:
.annotate 'line', 2233
    null $I4
  __label_14: # for condition
    ge $I4, $I3, __label_13
.annotate 'line', 2234
    $P6 = $P3[$I4]
    $P5 = $P6.'optimize'()
    $P3[$I4] = $P5
  __label_12: # for iteration
.annotate 'line', 2233
    inc $I4
    goto __label_14
  __label_13: # for end
  __label_9:
    goto __label_7
  __label_8: # endfor
.annotate 'line', 8584
    getattribute $P4, self, 'default_st'
.annotate 'line', 2232
    if_null $P4, __label_17
    elements $I5, $P4
    goto __label_16
  __label_17:
    null $I5
  __label_16:
.annotate 'line', 2233
    null $I6
  __label_20: # for condition
    ge $I6, $I5, __label_19
.annotate 'line', 2234
    $P6 = $P4[$I6]
    $P5 = $P6.'optimize'()
    $P4[$I6] = $P5
  __label_18: # for iteration
.annotate 'line', 2233
    inc $I6
    goto __label_20
  __label_19: # for end
  __label_15:
.annotate 'line', 8585

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 8525
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 8527
    addattribute $P0, 'case_value'
.annotate 'line', 8528
    addattribute $P0, 'case_st'
.annotate 'line', 8529
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 8598
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8599
    $P3 = WSubId_68(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 8600
    $P1 = __ARG_2.'get'()
.annotate 'line', 8601
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8602
    WSubId_70("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 8603
    $P1 = __ARG_2.'get'()
.annotate 'line', 8604
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 8605
    WSubId_70("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 8606
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8607

.end # SwitchStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8610
    new $P2, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P1 = self.'cloneswitchto'($P2, __ARG_1)
.annotate 'line', 8611
    getattribute $P4, self, 'condition'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condition', $P3
.annotate 'line', 8612
    .return($P1)
.annotate 'line', 8613

.end # clone


.sub 'optimize' :method
.annotate 'line', 8616
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 8617
    self.'optimize_cases'()
.annotate 'line', 8618
    .return(self)
.annotate 'line', 8619

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 8625
    set $S1, ''
.annotate 'line', 8626
    getattribute $P19, self, 'case_value'
    if_null $P19, __label_2
    iter $P20, $P19
    set $P20, 0
  __label_1: # for iteration
    unless $P20 goto __label_2
    shift $P1, $P20
.annotate 'line', 8627
    $P21 = $P1.'checkresult'()
    null $S2
    if_null $P21, __label_3
    set $S2, $P21
  __label_3:
.annotate 'line', 8628
    ne $S2, 'N', __label_4
.annotate 'line', 8629
    WSubId_25("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 8630
    ne $S2, 'S', __label_5
.annotate 'line', 8631
    iseq $I4, $S1, ''
    if $I4 goto __label_7
    iseq $I4, $S1, 'char'
  __label_7:
    unless $I4 goto __label_6
.annotate 'line', 8633
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
.annotate 'line', 8634
    set $S2, 'char'
    goto __label_9
  __label_8: # else
.annotate 'line', 8636
    set $S1, 'S'
  __label_9: # endif
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 8639
    ne $S1, '', __label_11
.annotate 'line', 8640
    set $S1, $S2
    goto __label_12
  __label_11: # else
.annotate 'line', 8641
    eq $S1, $S2, __label_13
.annotate 'line', 8642
    set $S1, 'P'
  __label_13: # endif
  __label_12: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8645
    getattribute $P2, self, 'condition'
.annotate 'line', 8646
    $P3 = $P2.'checkresult'()
.annotate 'line', 8650
    ne $S1, '', __label_14
.annotate 'line', 8651
    set $S1, $P3
  __label_14: # endif
.annotate 'line', 8653
    $P19 = __ARG_1.'getDebug'()
    if_null $P19, __label_15
    unless $P19 goto __label_15
.annotate 'line', 8654
    __ARG_1.'comment'('switch')
  __label_15: # endif
.annotate 'line', 8655
    $P19 = self.'genlabel'()
    null $S3
    if_null $P19, __label_16
    set $S3, $P19
  __label_16:
.annotate 'line', 8656
    null $S4
.annotate 'line', 8657
    ne $S1, 'char', __label_17
.annotate 'line', 8658
    isa $I4, $P2, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    unless $I4 goto __label_21
.annotate 'line', 8659
    getattribute $P21, $P2, 'builtin'
    $P19 = $P21.'name'()
    set $S11, $P19
    iseq $I4, $S11, "chr"
  __label_21:
    unless $I4 goto __label_19
.annotate 'line', 8660
    getattribute $P4, $P2, 'args'
.annotate 'line', 8661
    $P19 = $P4[0]
    getattribute $P5, $P19, 'arg'
.annotate 'line', 8662
    $P19 = $P5.'emit_getint'(__ARG_1)
    set $S4, $P19
    goto __label_20
  __label_19: # else
.annotate 'line', 8665
    null $S5
.annotate 'line', 8666
    set $S11, $P3
    eq $S11, 'S', __label_22
.annotate 'line', 8667
    $P19 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P19, __label_24
    set $S6, $P19
  __label_24:
.annotate 'line', 8668
    $P19 = self.'tempreg'('S')
    set $S5, $P19
.annotate 'line', 8669
    __ARG_1.'emitset'($S5, $S6)
    goto __label_23
  __label_22: # else
.annotate 'line', 8672
    $P19 = $P2.'emit_get'(__ARG_1)
    set $S5, $P19
  __label_23: # endif
.annotate 'line', 8673
    __ARG_1.'emitif_null'($S5, $S3)
.annotate 'line', 8674
    $P19 = self.'tempreg'('I')
    set $S4, $P19
.annotate 'line', 8675
    __ARG_1.'emitarg2'('length', $S4, $S5)
.annotate 'line', 8676
    __ARG_1.'emitarg3'('ne', $S4, "1", $S3)
.annotate 'line', 8677
    __ARG_1.'emitarg2'('ord', $S4, $S5)
  __label_20: # endif
    goto __label_18
  __label_17: # else
.annotate 'line', 8680
    set $S11, $P3
    ne $S11, $S1, __label_25
.annotate 'line', 8681
    $P19 = $P2.'emit_get'(__ARG_1)
    set $S4, $P19
    goto __label_26
  __label_25: # else
.annotate 'line', 8683
    $P21 = self.'tempreg'($S1)
    set $S4, $P21
.annotate 'line', 8684
    $P19 = $P2.'emit_get'(__ARG_1)
    null $S7
    if_null $P19, __label_27
    set $S7, $P19
  __label_27:
.annotate 'line', 8685
    __ARG_1.'emitset'($S4, $S7)
  __label_26: # endif
  __label_18: # endif
.annotate 'line', 8689
    self.'genbreaklabel'()
.annotate 'line', 8690
    new $P6, ['ResizableStringArray']
.annotate 'line', 8691
    null $S8
.annotate 'line', 8692
    eq $S1, 'char', __label_28
.annotate 'line', 8693
    self.'tempreg'($S1)
  __label_28: # endif
.annotate 'line', 8694
    getattribute $P19, self, 'case_value'
    if_null $P19, __label_30
    iter $P22, $P19
    set $P22, 0
  __label_29: # for iteration
    unless $P22 goto __label_30
    shift $P7, $P22
.annotate 'line', 8695
    $P21 = self.'genlabel'()
    null $S9
    if_null $P21, __label_31
    set $S9, $P21
  __label_31:
.annotate 'line', 8696
    push $P6, $S9
.annotate 'line', 8697
    null $S10
.annotate 'line', 8698
    ne $S1, 'I', __label_32
.annotate 'line', 8699
    $P19 = $P7.'emit_getint'(__ARG_1)
    set $S10, $P19
    goto __label_33
  __label_32: # else
.annotate 'line', 8700
    ne $S1, 'char', __label_34
.annotate 'line', 8701
    $P21 = WSubId_47($P7)
    set $S11, $P21
    ord $I1, $S11
.annotate 'line', 8702
    set $S10, $I1
    goto __label_35
  __label_34: # else
.annotate 'line', 8704
    $P19 = $P7.'checkresult'()
    set $S11, $P19
    ne $S1, $S11, __label_36
.annotate 'line', 8705
    $P21 = $P7.'emit_get'(__ARG_1)
    set $S10, $P21
    goto __label_37
  __label_36: # else
.annotate 'line', 8707
    $P7.'emit'(__ARG_1, $S8)
.annotate 'line', 8708
    set $S10, $S8
  __label_37: # endif
  __label_35: # endif
  __label_33: # endif
.annotate 'line', 8710
    $P19 = WSubId_45("    if %0 == %1 goto %2", $S4, $S10, $S9)
    __ARG_1.'say'($P19)
    goto __label_29
  __label_30: # endfor
.annotate 'line', 8712
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8715
    self.'annotate'(__ARG_1)
.annotate 'line', 8716
    getattribute $P8, self, 'case_st'
.annotate 'line', 8717
    set $I2, $P8
.annotate 'line', 8718
    null $I3
  __label_40: # for condition
    ge $I3, $I2, __label_39
.annotate 'line', 8719
    $P19 = $P6[$I3]
    __ARG_1.'emitlabel'($P19, 'case')
.annotate 'line', 8720
    set $P9, __ARG_1
    $P10 = $P8[$I3]
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2239
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
.annotate 'line', 8718
    inc $I3
    goto __label_40
  __label_39: # for end
.annotate 'line', 8723
    __ARG_1.'emitlabel'($S3, 'default')
.annotate 'line', 8724
    set $P14, __ARG_1
    getattribute $P15, self, 'default_st'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2239
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
.annotate 'line', 8726
    getattribute $P21, self, 'start'
    $P19 = self.'getbreaklabel'($P21)
    __ARG_1.'emitlabel'($P19, 'switch end')
.annotate 'line', 8727

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 8592
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8594
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8739
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8740
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8741

.end # SwitchCaseStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8744
    new $P1, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    .tailcall self.'cloneswitchto'($P1, __ARG_1)
.annotate 'line', 8745

.end # clone


.sub 'optimize' :method
.annotate 'line', 8748
    self.'optimize_cases'()
.annotate 'line', 8749
    .return(self)
.annotate 'line', 8750

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8754
    self.'genbreaklabel'()
.annotate 'line', 8755
    $P14 = self.'genlabel'()
    null $S1
    if_null $P14, __label_1
    set $S1, $P14
  __label_1:
.annotate 'line', 8756
    new $P1, ['ResizableStringArray']
.annotate 'line', 8758
    $P14 = __ARG_1.'getDebug'()
    if_null $P14, __label_2
    unless $P14 goto __label_2
.annotate 'line', 8759
    __ARG_1.'comment'('switch-case')
  __label_2: # endif
.annotate 'line', 8760
    $P14 = self.'tempreg'('I')
    null $S2
    if_null $P14, __label_3
    set $S2, $P14
  __label_3:
.annotate 'line', 8761
    getattribute $P14, self, 'case_value'
    if_null $P14, __label_5
    iter $P15, $P14
    set $P15, 0
  __label_4: # for iteration
    unless $P15 goto __label_5
    shift $P2, $P15
.annotate 'line', 8762
    $P16 = self.'genlabel'()
    null $S3
    if_null $P16, __label_6
    set $S3, $P16
  __label_6:
.annotate 'line', 8763
    push $P1, $S3
.annotate 'line', 8764
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 8765
    __ARG_1.'emitif'($S2, $S3)
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8767
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 8770
    self.'annotate'(__ARG_1)
.annotate 'line', 8771
    getattribute $P3, self, 'case_st'
.annotate 'line', 8772
    set $I1, $P3
.annotate 'line', 8773
    null $I2
  __label_9: # for condition
    ge $I2, $I1, __label_8
.annotate 'line', 8774
    $P14 = $P1[$I2]
    __ARG_1.'emitlabel'($P14, 'case')
.annotate 'line', 8775
    set $P4, __ARG_1
    $P5 = $P3[$I2]
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2239
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
.annotate 'line', 8773
    inc $I2
    goto __label_9
  __label_8: # for end
.annotate 'line', 8778
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 8779
    set $P9, __ARG_1
    getattribute $P10, self, 'default_st'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2239
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
.annotate 'line', 8781
    getattribute $P16, self, 'start'
    $P14 = self.'getbreaklabel'($P16)
    __ARG_1.'emitlabel'($P14, 'switch end')
.annotate 'line', 8782

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 8734
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 8789
    $P1 = __ARG_2.'get'()
.annotate 'line', 8790
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8791
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8792
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8793
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8794
    WSubId_70("'(' in switch", $P1)
.annotate 'line', 8795

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 8808
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8809
    $P1 = __ARG_2.'get'()
.annotate 'line', 8810
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8811
    __ARG_2.'unget'($P1)
.annotate 'line', 8812
    $P4 = WSubId_125(__ARG_2, self)
    setattribute self, 'initializer', $P4
  __label_1: # endif
.annotate 'line', 8814
    $P1 = __ARG_2.'get'()
.annotate 'line', 8815
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 8816
    __ARG_2.'unget'($P1)
.annotate 'line', 8817
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 8818
    WSubId_84(';', __ARG_2)
  __label_2: # endif
.annotate 'line', 8820
    $P1 = __ARG_2.'get'()
.annotate 'line', 8821
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 8822
    __ARG_2.'unget'($P1)
.annotate 'line', 8823
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_4: # do
.annotate 'line', 8825
    $P3 = WSubId_68(__ARG_2, self)
    push $P2, $P3
  __label_6: # continue
.annotate 'line', 8826
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_5
    if $P3 goto __label_4
  __label_5: # enddo
.annotate 'line', 8827
    setattribute self, 'iteration', $P2
.annotate 'line', 8828
    WSubId_28(')', $P1)
  __label_3: # endif
.annotate 'line', 8830
    self.'parsebody'(__ARG_2)
.annotate 'line', 8831

.end # ForStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8834
    new $P1, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8835
    getattribute $P8, self, 'start'
    $P1.'BlockStatement'($P8, __ARG_1)
.annotate 'line', 8836
    getattribute $P8, self, 'initializer'
    if_null $P8, __label_1
.annotate 'line', 8837
    getattribute $P11, self, 'initializer'
    $P10 = $P11.'clone'($P1)
    setattribute $P1, 'initializer', $P10
  __label_1: # endif
.annotate 'line', 8838
    getattribute $P8, self, 'condexpr'
    if_null $P8, __label_2
.annotate 'line', 8839
    getattribute $P11, self, 'condexpr'
    $P10 = $P11.'clone'($P1)
    setattribute $P1, 'condexpr', $P10
  __label_2: # endif
.annotate 'line', 8840
    getattribute $P8, self, 'iteration'
    if_null $P8, __label_3
.annotate 'line', 8841
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
.annotate 'line', 8841
    setattribute $P1, 'iteration', $P8
  __label_3: # endif
.annotate 'line', 8842
    getattribute $P10, self, 'body'
    $P9 = $P10.'clone'($P1)
    setattribute $P1, 'body', $P9
.annotate 'line', 8843
    .return($P1)
.annotate 'line', 8844

.end # clone


.sub 'optimize' :method
.annotate 'line', 8847
    getattribute $P1, self, 'initializer'
.annotate 'line', 8848
    if_null $P1, __label_1
.annotate 'line', 8849
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 8850
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_2
.annotate 'line', 8851
    self.'optimize_condition'()
.annotate 'line', 8852
    $P3 = self.'getvalue'()
    set $I3, $P3
    ne $I3, 2, __label_3
.annotate 'line', 8853
    if_null $P1, __label_4
.annotate 'line', 8854
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8856
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_5: # endif
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 8859
    getattribute $P2, self, 'iteration'
.annotate 'line', 2232
    if_null $P2, __label_8
    elements $I1, $P2
    goto __label_7
  __label_8:
    null $I1
  __label_7:
.annotate 'line', 2233
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
.annotate 'line', 2234
    $P4 = $P2[$I2]
    $P3 = $P4.'optimize'()
    $P2[$I2] = $P3
  __label_9: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_6:
.annotate 'line', 8860
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8861
    .return(self)
.annotate 'line', 8862

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8865
    getattribute $P1, self, 'iteration'
.annotate 'line', 8866
    isnull $I1, $P1
    not $I1
.annotate 'line', 8867
    getattribute $P3, self, 'initializer'
    isnull $I2, $P3
    unless $I2 goto __label_3
.annotate 'line', 8868
    getattribute $P4, self, 'condexpr'
    isnull $I2, $P4
  __label_3:
    unless $I2 goto __label_2
.annotate 'line', 8869
    not $I2, $I1
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 8870
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 8871
    .return()
  __label_1: # endif
.annotate 'line', 8873
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 8874
    __ARG_1.'comment'('for loop')
  __label_4: # endif
.annotate 'line', 8875
    $P3 = self.'gencontinuelabel'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 8876
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 8877
    unless $I1 goto __label_8
.annotate 'line', 8878
    $P3 = self.'genlabel'()
    set $S3, $P3
    goto __label_7
  __label_8:
.annotate 'line', 8879
    set $S3, $S1
  __label_7:
.annotate 'line', 8880
    getattribute $P3, self, 'initializer'
    if_null $P3, __label_9
.annotate 'line', 8881
    getattribute $P4, self, 'initializer'
    $P4.'emit'(__ARG_1)
  __label_9: # endif
.annotate 'line', 8883
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 8884
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_10
.annotate 'line', 8885
    self.'emit_else'(__ARG_1, $S2)
  __label_10: # endif
.annotate 'line', 8887
    getattribute $P3, self, 'body'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8888
    unless $I1 goto __label_11
.annotate 'line', 8889
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 8890
    if_null $P1, __label_13
    iter $P5, $P1
    set $P5, 0
  __label_12: # for iteration
    unless $P5 goto __label_13
    shift $P2, $P5
.annotate 'line', 8891
    $P2.'emit_void'(__ARG_1)
    goto __label_12
  __label_13: # endfor
  __label_11: # endif
.annotate 'line', 8893
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8895
    __ARG_1.'emitlabel'($S2, 'for end')
.annotate 'line', 8896

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8801
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 8803
    addattribute $P0, 'initializer'
.annotate 'line', 8804
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_127 = "WSubId_127"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 8911
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8912
    eq __ARG_5, '', __label_1
.annotate 'line', 8913
    $P1 = WSubId_127(__ARG_5)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 8914
    self.'createvar'(__ARG_4, $S1)
.annotate 'line', 8915
    box $P1, $S1
    setattribute self, 'deftype', $P1
  __label_1: # endif
.annotate 'line', 8917
    setattribute self, 'varname', __ARG_4
.annotate 'line', 8918
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 8919
    WSubId_84(')', __ARG_2)
.annotate 'line', 8920
    self.'parsebody'(__ARG_2)
.annotate 'line', 8921

.end # ForeachStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8924
    new $P1, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8925
    getattribute $P4, self, 'start'
    $P1.'BlockStatement'($P4, __ARG_1)
.annotate 'line', 8926
    getattribute $P2, self, 'deftype'
.annotate 'line', 8927
    getattribute $P3, self, 'varname'
.annotate 'line', 8928
    if_null $P2, __label_1
.annotate 'line', 8929
    $P1.'createvar'($P3, $P2)
  __label_1: # endif
.annotate 'line', 8930
    setattribute $P1, 'deftype', $P2
.annotate 'line', 8931
    setattribute $P1, 'varname', $P3
.annotate 'line', 8932
    getattribute $P6, self, 'container'
    $P5 = $P6.'clone'($P1)
    setattribute $P1, 'container', $P5
.annotate 'line', 8933
    getattribute $P6, self, 'body'
    $P5 = $P6.'clone'($P1)
    setattribute $P1, 'body', $P5
.annotate 'line', 8934
    .return($P1)
.annotate 'line', 8935

.end # clone


.sub 'optimize' :method
.annotate 'line', 8938
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 8942
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
.annotate 'line', 8943
    $P2 = $P1.'isstringliteral'()
    unless $P2 goto __label_3
.annotate 'line', 8944
    $P3 = $P1.'get_value'()
    set $S1, $P3
    length $I2, $S1
    iseq $I1, $I2, 0
    box $P2, $I1
  __label_3:
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8945
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8947
    setattribute self, 'container', $P1
.annotate 'line', 8948
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8949
    .return(self)
.annotate 'line', 8950

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_91 = "WSubId_91"
.annotate 'line', 8953
    self.'annotate'(__ARG_1)
.annotate 'line', 8954
    null $S1
.annotate 'line', 8955
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
.annotate 'line', 8956
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8957
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 8958
    __ARG_1.'emitbox'($S1, $S2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8961
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 8963
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 8964
    unless_null $P1, __label_4
.annotate 'line', 8965
    getattribute $P2, self, 'varname'
    WSubId_91($P2, self)
  __label_4: # endif
.annotate 'line', 8967
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 8968
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 8969
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 8970
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 8971
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 8972
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 8973
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 8974
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 8975
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 8976
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 8977
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8978
    __ARG_1.'emitlabel'($S5, 'endfor')
.annotate 'line', 8979

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8903
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8905
    addattribute $P0, 'deftype'
.annotate 'line', 8906
    addattribute $P0, 'varname'
.annotate 'line', 8907
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 8986
    WSubId_84('(', __ARG_2)
.annotate 'line', 8987
    $P1 = __ARG_2.'get'()
.annotate 'line', 8988
    $P2 = __ARG_2.'get'()
.annotate 'line', 8989
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 8990
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 8992
    $P3 = __ARG_2.'get'()
.annotate 'line', 8993
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8994
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 8995
    __ARG_2.'unget'($P3)
.annotate 'line', 8996
    __ARG_2.'unget'($P2)
.annotate 'line', 8997
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8999
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 9000

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 9012
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 9013
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'excep', $P2
.annotate 'line', 9014

.end # ThrowStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9017
    new $P1, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 9018
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 9019
    getattribute $P4, self, 'excep'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'excep', $P3
.annotate 'line', 9020
    .return($P1)
.annotate 'line', 9021

.end # clone


.sub 'optimize' :method
.annotate 'line', 9024
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 9025
    .return(self)
.annotate 'line', 9026

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9029
    getattribute $P1, self, 'excep'
.annotate 'line', 9030
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9031
    self.'annotate'(__ARG_1)
.annotate 'line', 9032
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
.annotate 'line', 9038
    set $S2, $S1
.annotate 'line', 9039
    $P3 = self.'tempreg'('P')
    set $S1, $P3
.annotate 'line', 9040
    $P4 = WSubId_45("    root_new %0, ['parrot';'Exception']\n    %0['message'] = %1\n", $S1, $S2)
    __ARG_1.'print'($P4)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 9048
    WSubId_25("Invalid throw argument", self)
  __label_3: # switch end
.annotate 'line', 9050
    __ARG_1.'emitarg1'('throw', $S1)
.annotate 'line', 9051

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 9006
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9008
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9063
    setattribute self, 'start', __ARG_1
.annotate 'line', 9064
    self.'ModifierList'(__ARG_2, __ARG_3)
.annotate 'line', 9065

.end # TryModifierList


.sub 'allowtailcall' :method
.annotate 'line', 9068
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 9069

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9072
    $P1 = self.'getlist'()
.annotate 'line', 9073
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
.annotate 'line', 9074
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 9075
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
.annotate 'line', 9079
    eq $I1, 1, __label_11
.annotate 'line', 9080
    WSubId_25('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 9081
    $P3 = $P2.'getarg'(0)
.annotate 'line', 9083
    $P8 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 9082
    $P7 = WSubId_45("    %0.'%1'(%2)", __ARG_2, $S1, $P8)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 9087
    new $P4, ['ResizableStringArray']
.annotate 'line', 9088
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
.annotate 'line', 9089
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 9090
    $P7 = $P5.'emit_get'(__ARG_1)
    push $P4, $P7
  __label_12: # for iteration
.annotate 'line', 9088
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 9093
    join $S2, ', ', $P4
.annotate 'line', 9092
    $P7 = WSubId_45("    %0.'%1'(%2)", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_10: # case
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 9098
    concat $S3, "Modifier '", $S1
    concat $S3, $S3, "' not valid for try"
    WSubId_25($S3, self)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9101

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 9058
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 9060
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 9113
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 9114
    $P1 = __ARG_2.'get'()
.annotate 'line', 9115
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9116
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 9118
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 9120
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 9121
    $P1 = __ARG_2.'get'()
.annotate 'line', 9122
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 9123
    WSubId_26('catch', $P1)
  __label_3: # endif
.annotate 'line', 9124
    $P1 = __ARG_2.'get'()
.annotate 'line', 9125
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 9126
    WSubId_70("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 9127
    $P1 = __ARG_2.'get'()
.annotate 'line', 9128
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 9129
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 9130
    setattribute self, 'exname', $P1
.annotate 'line', 9131
    self.'createvar'($S1, 'P')
.annotate 'line', 9132
    $P1 = __ARG_2.'get'()
.annotate 'line', 9133
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 9134
    WSubId_70("')' in 'catch'", $P1)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 9136
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'scatch', $P3
.annotate 'line', 9137

.end # TryStatement


.sub 'allowtailcall' :method
.annotate 'line', 9140
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 9141
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 9143
    .return(0)
  __label_2: # endif
.annotate 'line', 9144

.end # allowtailcall


.sub 'optimize' :method
.annotate 'line', 9147
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 9148
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 9149
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 9150
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 9151
    .return(self)
.annotate 'line', 9152

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9155
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9156
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 9157
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 9158
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 9159
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 9160
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 9162
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 9163
    self.'annotate'(__ARG_1)
.annotate 'line', 9164
    unless $I1 goto __label_7
.annotate 'line', 9165
    __ARG_1.'comment'('try: create handler')
  __label_7: # endif
.annotate 'line', 9166
    $P1 = WSubId_45("    new %0, 'ExceptionHandler'\n    set_label %0, %1\n", $S1, $S2)
    __ARG_1.'print'($P1)
.annotate 'line', 9173
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_8
.annotate 'line', 9174
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_8: # endif
.annotate 'line', 9176
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 9177
    unless $I1 goto __label_9
.annotate 'line', 9178
    __ARG_1.'comment'('try: begin')
  __label_9: # endif
.annotate 'line', 9179
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9180
    unless $I1 goto __label_10
.annotate 'line', 9181
    __ARG_1.'comment'('try: end')
  __label_10: # endif
.annotate 'line', 9182
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 9184
    self.'annotate'(__ARG_1)
.annotate 'line', 9185
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 9187
    unless $I1 goto __label_11
.annotate 'line', 9188
    __ARG_1.'comment'('catch')
  __label_11: # endif
.annotate 'line', 9189
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 9190
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 9191
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 9192
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 9193
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9195
    unless $I1 goto __label_12
.annotate 'line', 9196
    __ARG_1.'comment'('catch end')
  __label_12: # endif
.annotate 'line', 9197
    __ARG_1.'emitlabel'($S3)
.annotate 'line', 9198

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 9104
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 9106
    addattribute $P0, 'stry'
.annotate 'line', 9107
    addattribute $P0, 'modifiers'
.annotate 'line', 9108
    addattribute $P0, 'exname'
.annotate 'line', 9109
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.annotate 'line', 9212
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9213
    setattribute self, 'name', __ARG_3
.annotate 'line', 9214
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 9215
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 9216
    box $P2, __ARG_4
    setattribute self, 'flags', $P2
.annotate 'line', 9217

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 9205
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9207
    addattribute $P0, 'name'
.annotate 'line', 9208
    addattribute $P0, 'reg'
.annotate 'line', 9209
    addattribute $P0, 'flags'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
.annotate 'line', 9233
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9234
    setattribute self, 'name', __ARG_3
.annotate 'line', 9235
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 9236
    box $P2, __ARG_5
    setattribute self, 'regtype', $P2
.annotate 'line', 9237
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 9238
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 9239

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 9224
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9226
    addattribute $P0, 'name'
.annotate 'line', 9227
    addattribute $P0, 'basetype'
.annotate 'line', 9228
    addattribute $P0, 'regtype'
.annotate 'line', 9229
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 9250
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 9251
    $P1 = __ARG_5.'get'()
.annotate 'line', 9252
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9254
    $P4 = WSubId_68(__ARG_5, self)
    setattribute self, 'init', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 9257
    __ARG_5.'unget'($P1)
  __label_2: # endif
.annotate 'line', 9258

.end # DeclareSingleStatement


.sub 'clonedeclare' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9261
    getattribute $P1, self, 'start'
.annotate 'line', 9262
    getattribute $P2, self, 'name'
    getattribute $P3, self, 'basetype'
    getattribute $P4, self, 'regtype'
.annotate 'line', 9261
    __ARG_1.'DeclareBase'($P1, __ARG_2, $P2, $P3, $P4)
.annotate 'line', 9263
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 9264
    getattribute $P4, self, 'init'
    $P3 = $P4.'clone'(__ARG_2)
    setattribute __ARG_1, 'init', $P3
  __label_1: # endif
.annotate 'line', 9265
    .return(__ARG_1)
.annotate 'line', 9266

.end # clonedeclare


.sub 'optimize' :method
.annotate 'line', 9269
    getattribute $P1, self, 'init'
.annotate 'line', 9270
    if_null $P1, __label_1
.annotate 'line', 9271
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 9272
    .return(self)
.annotate 'line', 9273

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9276
    self.'annotate'(__ARG_1)
.annotate 'line', 9277
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9278
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 9279
    null $S3
.annotate 'line', 9280
    getattribute $P2, self, 'basetype'
    null $S4
    if_null $P2, __label_3
    set $S4, $P2
  __label_3:
.annotate 'line', 9281
    getattribute $P1, self, 'init'
.annotate 'line', 9282
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9283
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
  __label_4: # endif
.annotate 'line', 9285
    isnull $I1, $P1
    box $P2, $I1
    if $P2 goto __label_7
    $P2 = $P1.'isnull'()
  __label_7:
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 9286
    __ARG_1.'emitnull'($S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 9288
    $P3 = $P1.'checkresult'()
    null $S5
    if_null $P3, __label_8
    set $S5, $P3
  __label_8:
.annotate 'line', 9289
    ne $S5, $S4, __label_9
.annotate 'line', 9290
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
.annotate 'line', 9292
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 9294
    $P1.'emit'(__ARG_1, $S2)
    goto __label_12
  __label_11: # else
.annotate 'line', 9296
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
.annotate 'line', 9299
    $P3 = WSubId_48($P1)
    set $S3, $P3
.annotate 'line', 9300
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_18: # case
.annotate 'line', 9303
    $P4 = WSubId_128($P1)
    set $S3, $P4
.annotate 'line', 9304
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_19: # case
.annotate 'line', 9307
    $P5 = WSubId_47($P1)
    set $S3, $P5
.annotate 'line', 9308
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_15: # default
.annotate 'line', 9311
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
.annotate 'line', 9317
    WSubId_25('Invalid initialization from void value', self)
  __label_20: # default
.annotate 'line', 9319
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S3, $P2
  __label_21: # switch end
.annotate 'line', 9321
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_25
    iseq $I1, $S5, 'P'
  __label_25:
    unless $I1 goto __label_23
.annotate 'line', 9322
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_26
    set $S6, $P2
  __label_26:
.annotate 'line', 9323
    __ARG_1.'emitnull'($S2)
.annotate 'line', 9324
    __ARG_1.'emitif_null'($S3, $S6)
.annotate 'line', 9325
    __ARG_1.'emitset'($S2, $S3)
.annotate 'line', 9326
    __ARG_1.'emitlabel'($S6)
    goto __label_24
  __label_23: # else
.annotate 'line', 9329
    __ARG_1.'emitset'($S2, $S3)
  __label_24: # endif
  __label_14: # endif
  __label_12: # endif
  __label_10: # endif
  __label_6: # endif
.annotate 'line', 9333

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 9244
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 9246
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
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_67 = "WSubId_67"
.annotate 'line', 9348
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 9349
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 9350
    $P1 = __ARG_6.'get'()
.annotate 'line', 9351
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9353
    __ARG_6.'unget'($P1)
.annotate 'line', 9354
    $P3 = WSubId_68(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 9355
    WSubId_84(']', __ARG_6)
  __label_1: # endif
.annotate 'line', 9357
    $P1 = __ARG_6.'get'()
.annotate 'line', 9358
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9359
    $P1 = __ARG_6.'get'()
.annotate 'line', 9360
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 9361
    WSubId_70("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 9362
    $P1 = __ARG_6.'get'()
.annotate 'line', 9363
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 9364
    __ARG_6.'unget'($P1)
.annotate 'line', 9365
    $P3 = WSubId_67(__ARG_6, self, WSubId_68, ']')
    setattribute self, 'initarray', $P3
  __label_5: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 9369
    __ARG_6.'unget'($P1)
  __label_3: # endif
.annotate 'line', 9370

.end # DeclareArrayStatement


.sub 'clonedeclare' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9373
    getattribute $P7, self, 'start'
.annotate 'line', 9374
    getattribute $P8, self, 'name'
    getattribute $P9, self, 'basetype'
.annotate 'line', 9373
    __ARG_1.'DeclareBase'($P7, __ARG_2, $P8, $P9, 'P')
.annotate 'line', 9375
    getattribute $P8, self, 'arraytype'
    setattribute __ARG_1, 'arraytype', $P8
.annotate 'line', 9376
    getattribute $P7, self, 'size'
    if_null $P7, __label_1
    unless $P7 goto __label_1
.annotate 'line', 9377
    getattribute $P10, self, 'size'
    $P9 = $P10.'clone'(__ARG_1)
    setattribute __ARG_1, 'size', $P9
  __label_1: # endif
.annotate 'line', 9378
    getattribute $P7, self, 'initarray'
    if_null $P7, __label_2
.annotate 'line', 9379
    getattribute $P1, self, 'initarray'
    set $P2, __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 132
    set $P3, $P1
    root_new $P4, ['parrot';'ResizablePMCArray']
    $P9 = WSubId_5("clone")
    $P5 = WSubId_3($P9, $P2)
.annotate 'line', 71
    if_null $P3, __label_6
    iter $P12, $P3
    set $P12, 0
  __label_5: # for iteration
    unless $P12 goto __label_6
    shift $P6, $P12
.annotate 'line', 72
    $P10 = $P5($P6)
    push $P4, $P10
    goto __label_5
  __label_6: # endfor
.annotate 'line', 73
    set $P11, $P4
    goto __label_4
  __label_4:
    goto __label_3
  __label_3:
.annotate 'line', 132
    set $P7, $P11
.annotate 'line', 9379
    setattribute __ARG_1, 'initarray', $P7
  __label_2: # endif
.annotate 'line', 9380
    .return(__ARG_1)
.annotate 'line', 9381

.end # clonedeclare


.sub 'optimize' :method
.annotate 'line', 9384
    getattribute $P2, self, 'size'
    if_null $P2, __label_1
.annotate 'line', 9385
    getattribute $P5, self, 'size'
    $P4 = $P5.'optimize'()
    setattribute self, 'size', $P4
  __label_1: # endif
.annotate 'line', 9386
    getattribute $P1, self, 'initarray'
.annotate 'line', 2232
    if_null $P1, __label_4
    elements $I1, $P1
    goto __label_3
  __label_4:
    null $I1
  __label_3:
.annotate 'line', 2233
    null $I2
  __label_7: # for condition
    ge $I2, $I1, __label_6
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_5: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_7
  __label_6: # for end
  __label_2:
.annotate 'line', 9387
    .return(self)
.annotate 'line', 9388

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9391
    self.'annotate'(__ARG_1)
.annotate 'line', 9393
    getattribute $P1, self, 'reg'
.annotate 'line', 9394
    getattribute $P2, self, 'size'
.annotate 'line', 9395
    getattribute $P3, self, 'initarray'
.annotate 'line', 9396
    getattribute $P4, self, 'basetype'
.annotate 'line', 9397
    getattribute $P5, self, 'arraytype'
.annotate 'line', 9399
    if_null $P2, __label_1
.annotate 'line', 9402
    $P8 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 9401
    $P7 = WSubId_45("    new %0, ['Fixed%1Array'], %2", $P1, $P5, $P8)
    __ARG_1.'say'($P7)
    goto __label_2
  __label_1: # else
.annotate 'line', 9406
    $P7 = WSubId_45("    new %0, ['Resizable%1Array']", $P1, $P5)
    __ARG_1.'say'($P7)
  __label_2: # endif
.annotate 'line', 9409
    if_null $P3, __label_3
.annotate 'line', 9410
    $P7 = self.'tempreg'($P4)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 9411
    elements $I1, $P3
.annotate 'line', 9412
    unless_null $P2, __label_5
.annotate 'line', 9413
    unless $I1 goto __label_6
.annotate 'line', 9415
    __ARG_1.'emitset'($P1, $I1)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 9418
    null $I2
.annotate 'line', 9419
    if_null $P3, __label_8
    iter $P9, $P3
    set $P9, 0
  __label_7: # for iteration
    unless $P9 goto __label_8
    shift $P6, $P9
.annotate 'line', 9420
    $P6.'emit'(__ARG_1, $S1)
.annotate 'line', 9421
    $P7 = WSubId_45("    %0[%1] = %2", $P1, $I2, $S1)
    __ARG_1.'say'($P7)
.annotate 'line', 9422
    inc $I2
    goto __label_7
  __label_8: # endfor
  __label_3: # endif
.annotate 'line', 9425

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 9338
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 9340
    addattribute $P0, 'size'
.annotate 'line', 9341
    addattribute $P0, 'initarray'
.annotate 'line', 9342
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_129')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 9432
    null $P1
.annotate 'line', 9433
    null $P2
  __label_1: # do
.annotate 'line', 9435
    $P3 = __ARG_4.'get'()
.annotate 'line', 9436
    WSubId_124($P3)
.annotate 'line', 9437
    $P4 = __ARG_4.'get'()
.annotate 'line', 9438
    null $P5
.annotate 'line', 9439
    $P8 = $P4.'isop'('[')
    if_null $P8, __label_4
    unless $P8 goto __label_4
.annotate 'line', 9440
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
.annotate 'line', 9442
    __ARG_4.'unget'($P4)
.annotate 'line', 9443
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
  __label_5: # endif
.annotate 'line', 9445
    set $P6, $P2
    set $P7, $P5
.annotate 'line', 2802
    isnull $I1, $P6
    if $I1 goto __label_9
.annotate 'line', 2804
    isa $I1, $P6, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_10
    goto __label_8
  __label_9: # case
.annotate 'line', 2803
    set $P2, $P7
    goto __label_6
  __label_10: # case
.annotate 'line', 2805
    $P2 = $P6.'push'($P7)
    goto __label_6
  __label_8: # default
.annotate 'line', 2807
    new $P8, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P8.'MultiStatement'($P6, $P7)
    set $P2, $P8
    goto __label_6
  __label_7: # switch end
  __label_6:
.annotate 'line', 9446
    $P1 = __ARG_4.'get'()
  __label_3: # continue
.annotate 'line', 9447
    $P8 = $P1.'isop'(',')
    if_null $P8, __label_2
    if $P8 goto __label_1
  __label_2: # enddo
.annotate 'line', 9448
    WSubId_28(';', $P1)
.annotate 'line', 9449
    .return($P2)
.annotate 'line', 9450

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9458
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
.annotate 'line', 9459

.end # IntStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9462
    new $P1, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9463

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 9454
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9470
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
.annotate 'line', 9471

.end # IntArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9474
    new $P1, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9475

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 9466
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_130')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9481
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9482

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_131')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9486
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9487

.end # newIntArray


.sub 'parseInt' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_130 = "WSubId_130"
.const 'Sub' WSubId_131 = "WSubId_131"
.annotate 'line', 9491
    .tailcall WSubId_129(WSubId_130, WSubId_131, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9492

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9500
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
.annotate 'line', 9501

.end # FloatStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9504
    new $P1, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9505

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 9496
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9512
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
.annotate 'line', 9513

.end # FloatArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9516
    new $P1, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9517

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 9508
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_132')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9523
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9524

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_133')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9528
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9529

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_132 = "WSubId_132"
.const 'Sub' WSubId_133 = "WSubId_133"
.annotate 'line', 9533
    .tailcall WSubId_129(WSubId_132, WSubId_133, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9534

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9542
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
.annotate 'line', 9543

.end # StringStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9546
    new $P1, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9547

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 9538
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9554
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
.annotate 'line', 9555

.end # StringArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9558
    new $P1, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9559

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 9550
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_134')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9565
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9566

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_135')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9570
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9571

.end # newStringArray


.sub 'parseString' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_134 = "WSubId_134"
.const 'Sub' WSubId_135 = "WSubId_135"
.annotate 'line', 9575
    .tailcall WSubId_129(WSubId_134, WSubId_135, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9576

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 9592
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9593
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 9594
    setattribute self, 'name', __ARG_4
.annotate 'line', 9595
    setattribute self, 'value', __ARG_5
.annotate 'line', 9596
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
.annotate 'line', 9597

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9600
    getattribute $P1, self, 'value'
.annotate 'line', 9601
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9602
    $P1 = $P1.'optimize'()
.annotate 'line', 9603
    $P2 = $P1.'hascompilevalue'()
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 9604
    WSubId_25('Value for const is not evaluable at compile time', self)
  __label_2: # endif
.annotate 'line', 9607
    getattribute $P2, self, 'data'
    $P2.'setvalue'($P1)
.annotate 'line', 9608
    .return(self)
.annotate 'line', 9609

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9612
    getattribute $P1, self, 'start'
    WSubId_30('Direct use of const', $P1)
.annotate 'line', 9613

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9616
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9617
    getattribute $P3, self, 'data'
    $P1 = $P3.'getvalue'()
.annotate 'line', 9618
    null $S1
.annotate 'line', 9619
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
.annotate 'line', 9620
    $P3 = $P1.'getIntegerValue'()
    set $S1, $P3
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 9621
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 9622
    $P5 = $P1.'getPirString'()
    set $S1, $P5
    goto __label_3 # break
  __label_2: # default
  __label_3: # switch end
.annotate 'line', 9625
    getattribute $P2, self, 'name'
    set $S2, $P2
.annotate 'line', 9626
    concat $S3, "Constant '", $S2
    concat $S3, $S3, "' set to: "
    concat $S3, $S3, $S1
.annotate 'line', 9625
    __ARG_1.'comment'($S3)
  __label_1: # endif
.annotate 'line', 9628

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 9582
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9584
    addattribute $P0, 'type'
.annotate 'line', 9585
    addattribute $P0, 'name'
.annotate 'line', 9586
    addattribute $P0, 'data'
.annotate 'line', 9587
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_127 = "WSubId_127"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 9633
    $P1 = __ARG_2.'get'()
.annotate 'line', 9634
    $P7 = WSubId_127($P1)
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 9635
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9636
    WSubId_25('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 9638
    null $P2
  __label_5: # do
.annotate 'line', 9640
    $P3 = __ARG_2.'get'()
.annotate 'line', 9641
    WSubId_84('=', __ARG_2)
.annotate 'line', 9642
    $P4 = WSubId_68(__ARG_2, __ARG_3)
.annotate 'line', 9643
    set $P5, $P2
.annotate 'line', 9644
    new $P7, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P7.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P6, $P7
.annotate 'line', 2802
    isnull $I1, $P5
    if $I1 goto __label_11
.annotate 'line', 2804
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_12
    goto __label_10
  __label_11: # case
.annotate 'line', 2803
    set $P2, $P6
    goto __label_8
  __label_12: # case
.annotate 'line', 2805
    $P2 = $P5.'push'($P6)
    goto __label_8
  __label_10: # default
.annotate 'line', 2807
    new $P8, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P8.'MultiStatement'($P5, $P6)
    set $P2, $P8
    goto __label_8
  __label_9: # switch end
  __label_8:
  __label_7: # continue
.annotate 'line', 9645
    $P1 = __ARG_2.'get'()
    $P7 = $P1.'isop'(',')
    if_null $P7, __label_6
    if $P7 goto __label_5
  __label_6: # enddo
.annotate 'line', 9646
    WSubId_28(';', $P1)
.annotate 'line', 9647
    .return($P2)
.annotate 'line', 9648

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 9659
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 9660
    $P1 = __ARG_2.'get'()
.annotate 'line', 9661
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9662
    $P4 = WSubId_68(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 9663
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 9665
    WSubId_28(';', $P1)
.annotate 'line', 9666

.end # VarStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9669
    new $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 9670
    getattribute $P2, self, 'start'
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'flags'
    $P1.'initvarbase'($P2, __ARG_1, $P3, $P4)
.annotate 'line', 9671
    getattribute $P2, self, 'init'
    if_null $P2, __label_1
.annotate 'line', 9672
    getattribute $P5, self, 'init'
    $P4 = $P5.'clone'($P1)
    setattribute $P1, 'init', $P4
  __label_1: # endif
.annotate 'line', 9673
    .return($P1)
.annotate 'line', 9674

.end # clone


.sub 'optimize_init' :method
.annotate 'line', 9677
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 9678
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 9679
    .return(self)
.annotate 'line', 9680

.end # optimize_init


.sub 'optimize' :method
.annotate 'line', 9683
    .tailcall self.'optimize_init'()
.annotate 'line', 9684

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9687
    self.'annotate'(__ARG_1)
.annotate 'line', 9688
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9689
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 9690
    getattribute $P1, self, 'init'
.annotate 'line', 9691
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9692
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
  __label_3: # endif
.annotate 'line', 9693
    if_null $P1, __label_4
.annotate 'line', 9694
    $P2 = $P1.'isnull'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 9695
    null $P1
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 9696
    if_null $P1, __label_6
.annotate 'line', 9697
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
.annotate 'line', 9699
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
  __label_13: # case
.annotate 'line', 9704
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_15
    set $S3, $P3
  __label_15:
.annotate 'line', 9705
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_9 # break
  __label_14: # case
.annotate 'line', 9708
    WSubId_25("Can't use void function as initializer", self)
  __label_8: # default
.annotate 'line', 9710
    WSubId_25("Invalid var initializer", self)
  __label_9: # switch end
    goto __label_7
  __label_6: # else
.annotate 'line', 9714
    __ARG_1.'emitnull'($S2)
  __label_7: # endif
.annotate 'line', 9715

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 9654
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 9656
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 9722
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 9723
    WSubId_84(';', __ARG_2)
.annotate 'line', 9724

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9727
    self.'annotate'(__ARG_1)
.annotate 'line', 9728
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9729
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 9730
    getattribute $P3, self, 'name'
    $P2 = WSubId_45("var %0[] : %1", $P3, $S1)
    __ARG_1.'comment'($P2)
  __label_2: # endif
.annotate 'line', 9731
    $P1 = WSubId_45("    new %0, 'ResizablePMCArray'", $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 9732

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 9718
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 9741
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 9742
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 9743
    WSubId_84(']', __ARG_2)
.annotate 'line', 9744
    WSubId_84(';', __ARG_2)
.annotate 'line', 9745

.end # FixedVarStatement


.sub 'optimize' :method
.annotate 'line', 9748
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 9749
    .tailcall self.'optimize_init'()
.annotate 'line', 9750

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9753
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9754
    self.'annotate'(__ARG_1)
.annotate 'line', 9755
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 9756
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 9757
    getattribute $P3, self, 'name'
    $P2 = WSubId_45("var %0[] : %1", $P3, $S2)
    __ARG_1.'comment'($P2)
  __label_3: # endif
.annotate 'line', 9758
    $P1 = WSubId_45("    new %0, 'FixedPMCArray', %1", $S2, $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 9759

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 9735
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 9737
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 9764
    $P1 = __ARG_2.'get'()
.annotate 'line', 9765
    WSubId_124($P1)
.annotate 'line', 9766
    $P2 = __ARG_2.'get'()
.annotate 'line', 9767
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9768
    $P2 = __ARG_2.'get'()
.annotate 'line', 9769
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 9770
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
.annotate 'line', 9772
    __ARG_2.'unget'($P2)
.annotate 'line', 9773
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 9777
    __ARG_2.'unget'($P2)
.annotate 'line', 9778
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9780

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_76 = "WSubId_76"
.annotate 'line', 9784
    $P1 = __ARG_2.'get'()
.annotate 'line', 9785
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9786
    WSubId_25("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 9787
    .tailcall WSubId_76(__ARG_1, __ARG_2, __ARG_3, 1)
.annotate 'line', 9788

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9801
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 9802
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 9803
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 9804
    null $P1
  __label_2: # while
.annotate 'line', 9805
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9806
    __ARG_2.'unget'($P1)
.annotate 'line', 9807
    $P2 = WSubId_125(__ARG_2, self)
.annotate 'line', 9808
    unless_null $P2, __label_3
.annotate 'line', 9809
    WSubId_30('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 9810
    getattribute $P3, self, 'statements'
    push $P3, $P2
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9812
    setattribute self, 'end', $P1
.annotate 'line', 9813

.end # CompoundStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9816
    new $P1, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 9817
    getattribute $P8, self, 'start'
    $P1.'BlockStatement'($P8, __ARG_1)
.annotate 'line', 9818
    root_new $P9, ['parrot';'Hash']
    setattribute $P1, 'labels', $P9
.annotate 'line', 9819
    getattribute $P9, self, 'end'
    setattribute $P1, 'end', $P9
.annotate 'line', 9820
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
.annotate 'line', 9820
    setattribute $P1, 'statements', $P8
.annotate 'line', 9821
    .return($P1)
.annotate 'line', 9822

.end # clone


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 9825
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9826
    getattribute $P1, self, 'labels'
.annotate 'line', 9827
    $S2 = $P1[$S1]
.annotate 'line', 9828
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9829
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 9830
    .return($S2)
.annotate 'line', 9831

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9834
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9835
    getattribute $P1, self, 'labels'
.annotate 'line', 9836
    $S2 = $P1[$S1]
.annotate 'line', 9837
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9838
    WSubId_25('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 9839
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 9840
    $P1[$S1] = $S3
.annotate 'line', 9841
    .return($S3)
.annotate 'line', 9842

.end # createlabel


.sub 'getend' :method
.annotate 'line', 9843
    getattribute $P1, self, 'end'
    .return($P1)

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9846
    $P2 = __ARG_1.'getDebug'()
    set $I1, $P2
.annotate 'line', 9847
    unless $I1 goto __label_1
.annotate 'line', 9848
    __ARG_1.'comment'('{')
  __label_1: # endif
.annotate 'line', 9849
    getattribute $P2, self, 'statements'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9850
    $P1.'emit'(__ARG_1)
.annotate 'line', 9851
    self.'freetemps'()
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9853
    unless $I1 goto __label_4
.annotate 'line', 9854
    __ARG_1.'comment'('}')
  __label_4: # endif
.annotate 'line', 9855

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 9794
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 9796
    addattribute $P0, 'end'
.annotate 'line', 9797
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
.annotate 'line', 9870
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 9872
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 9873
    new $P1, ['ResizableStringArray']
.annotate 'line', 9874
    new $P2, ['ResizableStringArray']
.annotate 'line', 9875
    setattribute self, 'tempreg', $P1
.annotate 'line', 9876
    setattribute self, 'freereg', $P2
.annotate 'line', 9877

.end # RegisterStore


.sub 'createreg' :method
.annotate 'line', 9880
    getattribute $P1, self, 'nreg'
.annotate 'line', 9881
    set $I1, $P1
.annotate 'line', 9882
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 9883
    assign $P1, $I1
.annotate 'line', 9884
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
.annotate 'line', 9885

.end # createreg


.sub 'tempreg' :method
.annotate 'line', 9888
    getattribute $P1, self, 'freereg'
.annotate 'line', 9889
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9890
    null $S1
.annotate 'line', 9891
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9892
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9894
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 9895
    push $P2, $S1
.annotate 'line', 9896
    .return($S1)
.annotate 'line', 9897

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9900
    getattribute $P1, self, 'freereg'
.annotate 'line', 9901
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9902
    elements $I1, $P2
.annotate 'line', 9903
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
.annotate 'line', 9904
    $S1 = $P2[$I2]
.annotate 'line', 9905
    push $P1, $S1
  __label_1: # for iteration
.annotate 'line', 9903
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 9907
    assign $P2, 0
.annotate 'line', 9908

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 9864
    addattribute $P0, 'type'
.annotate 'line', 9865
    addattribute $P0, 'nreg'
.annotate 'line', 9866
    addattribute $P0, 'tempreg'
.annotate 'line', 9867
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9919
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9920

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9923
    null $P1
.annotate 'line', 9924
    null $P2
.annotate 'line', 9925
    $P3 = self.'getlist'()
.annotate 'line', 9926
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
.annotate 'line', 9927
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
    if $S1 == 'named' goto __label_6
    if $S1 == 'slurpy' goto __label_7
    goto __label_4
  __label_6: # case
.annotate 'line', 9930
    set $P1, $P4
    goto __label_5 # break
  __label_7: # case
.annotate 'line', 9933
    set $P2, $P4
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 9936
    __ARG_1.'print'(' :', $S1)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9940
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 9947
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 9964
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 9945
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 9948
    null $S2
.annotate 'line', 9949
    $P7 = $P1.'numargs'()
    set $I2, $P7
    if $I2 == 0 goto __label_16
    if $I2 == 1 goto __label_17
    goto __label_14
  __label_16: # case
.annotate 'line', 9951
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_15 # break
  __label_17: # case
.annotate 'line', 9954
    $P5 = $P1.'getarg'(0)
.annotate 'line', 9955
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 9956
    WSubId_25('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 9957
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_15 # break
  __label_14: # default
.annotate 'line', 9960
    WSubId_25('Invalid modifier', __ARG_2)
  __label_15: # switch end
.annotate 'line', 9962
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 9965
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 9968

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 9915
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 9979
    setattribute self, 'func', __ARG_1
.annotate 'line', 9980
    $P1 = __ARG_2.'get'()
.annotate 'line', 9981
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_127($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9982
    eq $S1, '', __label_2
.annotate 'line', 9983
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 9985
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 9986
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 9987
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 9988
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 9990
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 9991
    $P1 = __ARG_2.'get'()
.annotate 'line', 9992
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9993
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 9995
    __ARG_2.'unget'($P1)
  __label_5: # endif
.annotate 'line', 9996

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_136 = "WSubId_136"
.annotate 'line', 9999
    getattribute $P1, self, 'func'
.annotate 'line', 10000
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 10001
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 10002
    $P5 = $P2.'gettype'()
    $P4 = WSubId_136($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 10003
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 10004
    getattribute $P3, self, 'modifiers'
.annotate 'line', 10005
    if_null $P3, __label_3
.annotate 'line', 10006
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 10007
    __ARG_1.'say'('')
.annotate 'line', 10008

.end # emit


.sub 'get_type' :method
.annotate 'line', 10011
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 10012

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 9973
    addattribute $P0, 'func'
.annotate 'line', 9974
    addattribute $P0, 'name'
.annotate 'line', 9975
    addattribute $P0, 'modifiers'
.annotate 'line', 9976
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_137')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10018
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 10019

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10030
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 10031
    setattribute self, 'name', __ARG_1
.annotate 'line', 10032

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10035
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 10036
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10037
    self.'annotate'(__ARG_1)
.annotate 'line', 10038
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 10039
    .return($S1)
.annotate 'line', 10040

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 10025
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 10027
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_subid' :subid('WSubId_139')
        .param string __ARG_1
.annotate 'line', 10049
    concat $S1, ".const 'Sub' ", __ARG_1
    concat $S1, $S1, ' = "'
    concat $S1, $S1, __ARG_1
    concat $S1, $S1, "\"\n"
    .return($S1)
.annotate 'line', 10050

.end # emit_subid

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10056
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 10057

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10060
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10061
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 10063
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 10065
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 10066
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 10067
    le $I1, 0, __label_5
.annotate 'line', 10068
    __ARG_1.'print'('(')
.annotate 'line', 10069
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
.annotate 'line', 10070
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 10071
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 10072
    WSubId_25('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 10073
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 10074
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 10075
    __ARG_1.'print'(", ")
  __label_10: # endif
  __label_6: # for iteration
.annotate 'line', 10069
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 10077
    __ARG_1.'print'(')')
  __label_5: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10080

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 10052
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_138')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10085
    $P5 = __ARG_2.'numargs'()
    set $I1, $P5
.annotate 'line', 10086
    null $P1
.annotate 'line', 10087
    unless $I1 goto __label_1
.annotate 'line', 10088
    root_new $P5, ['parrot';'ResizablePMCArray']
    set $P1, $P5
.annotate 'line', 10089
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 10090
    $P2 = __ARG_2.'getarg'($I2)
.annotate 'line', 10092
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 10095
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 10108
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 10093
    $P5 = $P2.'get_value'()
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10096
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
.annotate 'line', 10099
    push $P1, $S1
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 10101
    push $P1, "num"
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 10103
    push $P1, "pmc"
    goto __label_12 # break
  __label_11: # default
.annotate 'line', 10105
    WSubId_25("unsupported multi signature", $P2)
  __label_12: # switch end
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10109
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 10110
    unless_null $P3, __label_17
.annotate 'line', 10111
    WSubId_25("class not found", $P2)
  __label_17: # endif
.annotate 'line', 10113
    set $P4, $P3
.annotate 'line', 2519
    null $S2
.annotate 'line', 2520
    elements $I3, $P4
    unless $I3 goto __label_19
.annotate 'line', 2521
    join $S3, "'; '", $P4
    concat $S5, "[ '", $S3
    concat $S5, $S5, "' ]"
    set $S2, $S5
  __label_19: # endif
.annotate 'line', 2522
    set $S4, $S2
    goto __label_18
  __label_18:
.annotate 'line', 10113
    push $P1, $S4
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10116
    WSubId_25("unsupported multi signature", $P2)
  __label_5: # switch end
  __label_2: # for iteration
.annotate 'line', 10089
    inc $I2
    goto __label_4
  __label_3: # for end
  __label_1: # endif
.annotate 'line', 10120
    .return($P1)
.annotate 'line', 10121

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10143
    self.'BlockStatement'(__ARG_1, __ARG_2)
.annotate 'line', 10144
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 10145
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 10146
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 10147
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 10148
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
.annotate 'line', 10149

.end # FunctionBase


.sub 'getouter' :method
.annotate 'line', 10151
    .return(self)

.end # getouter


.sub 'allowtailcall' :method
.annotate 'line', 10154
    .return(1)
.annotate 'line', 10155

.end # allowtailcall


.sub 'makesubid' :method
.annotate 'line', 10159
    getattribute $P1, self, 'subid'
.annotate 'line', 10160
    unless_null $P1, __label_1
.annotate 'line', 10161
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 10162
    .return($P1)
.annotate 'line', 10163

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 10166
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 10167
    unless_null $P1, __label_1
.annotate 'line', 10168
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 10169
    $P1[__ARG_1] = 1
.annotate 'line', 10170

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
.annotate 'line', 10174
    issame $I1, self, __ARG_1
.annotate 'line', 10175
    .return($I1)
.annotate 'line', 10176

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_137 = "WSubId_137"
.annotate 'line', 10179
    $P1 = __ARG_1.'get'()
.annotate 'line', 10180
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 10181
    __ARG_1.'unget'($P1)
.annotate 'line', 10182
    $P3 = WSubId_67(__ARG_1, self, WSubId_137, ')')
    setattribute self, 'params', $P3
  __label_1: # endif
.annotate 'line', 10184

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10188
    getattribute $P1, self, 'localfun'
.annotate 'line', 10189
    unless_null $P1, __label_1
.annotate 'line', 10190
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 10192
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 10193

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 10197
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10198
    unless_null $P1, __label_1
.annotate 'line', 10199
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 1
    $P6[0] = __ARG_1
    setattribute self, 'usednamespaces', $P6
    goto __label_2
  __label_1: # else
.annotate 'line', 10201
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
.annotate 'line', 10201
    if_null $P5, __label_3
.annotate 'line', 10202
    .return()
  __label_3: # endif
.annotate 'line', 10203
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 10205

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 10208
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10209
    $P2 = $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10210
    if_null $P2, __label_3
.annotate 'line', 10211
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10213
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10214

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10218
    getattribute $P1, self, 'modifiers'
.annotate 'line', 10219
    if_null $P1, __label_1
.annotate 'line', 10220
    $P2 = $P1.'pick'('multi')
.annotate 'line', 10221
    if_null $P2, __label_2
.annotate 'line', 10223
    self.'setmulti'()
.annotate 'line', 10224
    $P7 = WSubId_138(self, $P2)
    setattribute self, 'multi_sig', $P7
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 10227
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
.annotate 'line', 10228
    getattribute $P9, self, 'body'
    $P7 = $P9.'optimize'()
    setattribute self, 'body', $P7
.annotate 'line', 10229
    .return(self)
.annotate 'line', 10230

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 10234
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 10235
    unless_null $P1, __label_1
.annotate 'line', 10236
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 10237
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 10238

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 10241
    getattribute $P1, self, 'lexicals'
.annotate 'line', 10242
    unless_null $P1, __label_1
.annotate 'line', 10243
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 10244
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 10245

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
.annotate 'line', 10250
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 10251
    null $S1
.annotate 'line', 10252
    if_null $P1, __label_1
.annotate 'line', 10253
    set $S1, $P1
    goto __label_2
  __label_1: # else
.annotate 'line', 10255
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 10256
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 10257
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 10258
    self.'setlex'($S1, $S2)
.annotate 'line', 10259
    __ARG_1.'setlex'($S1)
  __label_2: # endif
.annotate 'line', 10261
    .return($S1)
.annotate 'line', 10262

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10266
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
.annotate 'line', 10269
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 10271
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 10273
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 10275
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 10277
    concat $S2, "Invalid type in createreg: ", __ARG_1
    WSubId_30($S2)
  __label_2: # switch end
.annotate 'line', 10279
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 10280
    .return($S1)
.annotate 'line', 10281

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10284
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
.annotate 'line', 10287
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 10289
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 10291
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 10293
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 10295
    concat $S2, "Invalid type in tempreg: ", __ARG_1
    WSubId_30($S2)
  __label_2: # switch end
.annotate 'line', 10297
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 10298
    .return($S1)
.annotate 'line', 10299

.end # tempreg


.sub 'freetemps' :method
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10302
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
.annotate 'line', 10303
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
.annotate 'line', 10304

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 10307
    getattribute $P1, self, 'nlabel'
    inc $P1
    set $I1, $P1
.annotate 'line', 10308
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
.annotate 'line', 10309

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10312
    WSubId_25('break not allowed here', __ARG_1)
.annotate 'line', 10313

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10316
    WSubId_25('continue not allowed here', __ARG_1)
.annotate 'line', 10317

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_139 = "WSubId_139"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10323
    getattribute $P19, self, 'name'
    null $S1
    if_null $P19, __label_1
    set $S1, $P19
  __label_1:
.annotate 'line', 10324
    __ARG_1.'say'()
.annotate 'line', 10325
    __ARG_1.'print'(".sub ")
.annotate 'line', 10326
    $P19 = self.'isanonymous'()
    if_null $P19, __label_2
    unless $P19 goto __label_2
.annotate 'line', 10327
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 10329
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 10330
    getattribute $P19, self, 'subid'
    if_null $P19, __label_4
.annotate 'line', 10331
    getattribute $P20, self, 'subid'
    __ARG_1.'print'(" :subid('", $P20, "')")
  __label_4: # endif
.annotate 'line', 10333
    getattribute $P1, self, 'outer'
.annotate 'line', 10334
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_6
    getattribute $P19, self, 'usedlexicals'
    isnull $I2, $P19
    not $I2
  __label_6:
    unless $I2 goto __label_5
.annotate 'line', 10335
    getattribute $P2, $P1, 'subid'
.annotate 'line', 10336
    if_null $P2, __label_7
.annotate 'line', 10337
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10341
    $P19 = self.'ismethod'()
    if_null $P19, __label_8
    unless $P19 goto __label_8
.annotate 'line', 10342
    __ARG_1.'print'(' :method')
  __label_8: # endif
.annotate 'line', 10343
    getattribute $P3, self, 'modifiers'
.annotate 'line', 10344
    if_null $P3, __label_9
.annotate 'line', 10345
    $P3.'emit'(__ARG_1)
    goto __label_10
  __label_9: # else
.annotate 'line', 10347
    ne $S1, 'main', __label_11
.annotate 'line', 10348
    __ARG_1.'print'(' :main')
  __label_11: # endif
  __label_10: # endif
.annotate 'line', 10350
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 10351
    __ARG_1.'say'()
.annotate 'line', 10354
    set $P7, __ARG_1
    getattribute $P8, self, 'params'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2239
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
.annotate 'line', 10356
    getattribute $P4, self, 'lexicals'
.annotate 'line', 10357
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 10358
    isnull $I2, $P4
    not $I2
    if $I2 goto __label_17
    isnull $I2, $P5
    not $I2
  __label_17:
    unless $I2 goto __label_16
.annotate 'line', 10359
    getattribute $P19, self, 'start'
    __ARG_1.'annotate'($P19)
.annotate 'line', 10361
    if_null $P4, __label_19
    iter $P22, $P4
    set $P22, 0
  __label_18: # for iteration
    unless $P22 goto __label_19
    shift $S2, $P22
.annotate 'line', 10362
    $P20 = $P4[$S2]
    $P19 = WSubId_45(".lex '%0', %1", $P20, $S2)
    __ARG_1.'say'($P19)
    goto __label_18
  __label_19: # endfor
.annotate 'line', 10364
    if_null $P5, __label_21
    iter $P23, $P5
    set $P23, 0
  __label_20: # for iteration
    unless $P23 goto __label_21
    shift $S3, $P23
.annotate 'line', 10365
    substr $S4, $S3, 0, 1
    eq $S4, '$', __label_22
.annotate 'line', 10366
    concat $S5, "    .local pmc ", $S3
    __ARG_1.'say'($S5)
  __label_22: # endif
.annotate 'line', 10367
    $P19 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P19)
    goto __label_20
  __label_21: # endfor
  __label_16: # endif
.annotate 'line', 10371
    getattribute $P12, self, 'usedsubids'
    root_new $P13, ['parrot';'ResizablePMCArray']
    set $P14, WSubId_139
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
.annotate 'line', 10371
    join $S4, "", $P19
    __ARG_1.'print'($S4)
.annotate 'line', 10373
    $P19 = __ARG_1.'getDebug'()
    set $I1, $P19
.annotate 'line', 10374
    getattribute $P6, self, 'body'
.annotate 'line', 10375
    $P19 = $P6.'isempty'()
    if_null $P19, __label_26
    unless $P19 goto __label_26
.annotate 'line', 10376
    unless $I1 goto __label_28
.annotate 'line', 10377
    __ARG_1.'comment'('Empty body')
  __label_28: # endif
    goto __label_27
  __label_26: # else
.annotate 'line', 10380
    unless $I1 goto __label_29
.annotate 'line', 10381
    __ARG_1.'comment'('Body')
  __label_29: # endif
.annotate 'line', 10382
    $P6.'emit'(__ARG_1)
.annotate 'line', 10383
    $P19 = $P6.'getend'()
    __ARG_1.'annotate'($P19)
  __label_27: # endif
.annotate 'line', 10385
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 10388
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
.annotate 'line', 10389

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 10123
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 10125
    addattribute $P0, 'name'
.annotate 'line', 10126
    addattribute $P0, 'subid'
.annotate 'line', 10127
    addattribute $P0, 'modifiers'
.annotate 'line', 10128
    addattribute $P0, 'params'
.annotate 'line', 10129
    addattribute $P0, 'body'
.annotate 'line', 10130
    addattribute $P0, 'regstI'
.annotate 'line', 10131
    addattribute $P0, 'regstN'
.annotate 'line', 10132
    addattribute $P0, 'regstS'
.annotate 'line', 10133
    addattribute $P0, 'regstP'
.annotate 'line', 10134
    addattribute $P0, 'nlabel'
.annotate 'line', 10135
    addattribute $P0, 'localfun'
.annotate 'line', 10136
    addattribute $P0, 'lexicals'
.annotate 'line', 10137
    addattribute $P0, 'usedlexicals'
.annotate 'line', 10138
    addattribute $P0, 'usedsubids'
.annotate 'line', 10139
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10405
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 10406
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 10407
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 10408
    self.'parse'(__ARG_2)
.annotate 'line', 10409
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
.annotate 'line', 10410

.end # FunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 10412
    .return(0)

.end # isanonymous


.sub 'getparamnum' :method
.annotate 'line', 10416
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 10417

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 10421
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 10422

.end # getlexnum


.sub 'ismethod' :method
.annotate 'line', 10423
    .return(0)

.end # ismethod


.sub 'ismulti' :method
.annotate 'line', 10427
    getattribute $P1, self, 'is_multi'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)
.annotate 'line', 10428

.end # ismulti


.sub 'setmulti' :method
.annotate 'line', 10431
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
.annotate 'line', 10432

.end # setmulti


.sub 'default_multi_sig' :subid('WSubId_13') :method
.const 'Sub' WSubId_14 = "WSubId_14"
.annotate 'line', 10435
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 10436
    $P6 = self.'ismethod'()
    if_null $P6, __label_1
    unless $P6 goto __label_1
.annotate 'line', 10437
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 10438
    getattribute $P2, self, 'params'
    set $P3, $P1
.annotate 'line', 10439
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
.annotate 'line', 10444
    .return($P1)
.annotate 'line', 10445

.end # default_multi_sig


.sub '' :anon :subid('WSubId_14')
        .param pmc __ARG_1
.const 'Sub' WSubId_136 = "WSubId_136"
.annotate 'line', 10441
    $P1 = __ARG_1.'get_type'()
    .tailcall WSubId_136($P1)
.annotate 'line', 10442

.end # WSubId_14


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10448
    $P1 = __ARG_1.'get'()
.annotate 'line', 10449
    setattribute self, 'name', $P1
.annotate 'line', 10450
    $P2 = __ARG_1.'get'()
.annotate 'line', 10451
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 10452
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 10453
    $P2 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 10455
    WSubId_28('(', $P2)
.annotate 'line', 10456
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 10458
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 10459
    $P4 = $P3.'fullname'()
    WSubId_140(self, '__FUNCTION__', $P4)
.annotate 'line', 10461
    $P2 = __ARG_1.'get'()
.annotate 'line', 10462
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 10463
    WSubId_26('{', $P2)
  __label_2: # endif
.annotate 'line', 10464
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 10465
    .return(self)
.annotate 'line', 10466

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.annotate 'line', 10470
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 10471
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 10472
    unless_null $P1, __label_2
.annotate 'line', 10473
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 10474
    join $S1, ", ", $P1
    __ARG_1.'print'(' :multi(', $S1, ')')
  __label_1: # endif
.annotate 'line', 10476

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 10396
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 10398
    addattribute $P0, 'paramnum'
.annotate 'line', 10399
    addattribute $P0, 'lexnum'
.annotate 'line', 10400
    addattribute $P0, 'is_multi'
.annotate 'line', 10401
    addattribute $P0, 'multi_sig'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 10487
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 10488
    $P1 = __ARG_3.'getouter'()
.annotate 'line', 10489
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    unless $I1 goto __label_1
.annotate 'line', 10490
    $P4 = WSubId_25("local functions not allowed in inline", self)
    throw $P4
  __label_1: # endif
.annotate 'line', 10491
    $P1.'makesubid'()
.annotate 'line', 10492
    setattribute self, 'outer', $P1
.annotate 'line', 10493
    $P2 = self.'makesubid'()
.annotate 'line', 10494
    setattribute self, 'name', $P2
.annotate 'line', 10495
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 10496
    $P3 = __ARG_2.'get'()
.annotate 'line', 10497
    WSubId_28('{', $P3)
.annotate 'line', 10498
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P3, __ARG_2, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 10499
    __ARG_3.'addlocalfunction'(self)
.annotate 'line', 10500

.end # LocalFunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 10501
    .return(1)

.end # isanonymous


.sub 'ismethod' :method
.annotate 'line', 10502
    .return(0)

.end # ismethod


.sub 'needclosure' :method
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10505
    getattribute $P4, self, 'lexicals'
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_2
    getattribute $P5, self, 'usedlexicals'
    isnull $I1, $P5
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10506
    .return(1)
  __label_1: # endif
.annotate 'line', 10507
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
.annotate 'line', 10507
    isnull $I1, $P4
    not $I1
    .return($I1)
.annotate 'line', 10508

.end # needclosure


.sub 'getsubid' :method
.annotate 'line', 10511
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 10512

.end # getsubid


.sub 'getparamnum' :method
.annotate 'line', 10516
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
.annotate 'line', 10517

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 10521
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
.annotate 'line', 10522

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10525
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 10526
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 10527
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 10529
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 10530
    self.'usesubid'($S1)
.annotate 'line', 10531
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 10533
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 10534
    $P2 = $P1.'getouter'()
.annotate 'line', 10535
    getattribute $P3, self, 'outer'
.annotate 'line', 10536
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
.annotate 'line', 10537
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 10538
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 10539
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 10540
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 10541
    eq $S3, 'P', __label_8
.annotate 'line', 10542
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 10543
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 10544
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 10545
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 10546
    .return($P4)
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 10549
    .return(__ARG_2)
.annotate 'line', 10550

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10553
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 10554
    unless_null $P1, __label_1
.annotate 'line', 10555
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10556
    unless_null $P1, __label_2
.annotate 'line', 10559
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 10560
    unless_null $P1, __label_3
.annotate 'line', 10562
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
.annotate 'line', 10563
    getattribute $P2, self, 'outer'
.annotate 'line', 10564
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 10565
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10566
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 10567
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 10568
    self.'setusedlex'($S1, $S2)
  __label_6: # endif
  __label_5: # endif
    goto __label_4
  __label_3: # else
.annotate 'line', 10572
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 10574
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 10575
    WSubId_30('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 10576
    .return($P1)
.annotate 'line', 10577

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 10483
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10588
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10589

.end # MethodStatement


.sub 'ismethod' :method
.annotate 'line', 10590
    .return(1)

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 10584
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineParam' ]

.sub 'InlineParam' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 10604
    null $I1
.annotate 'line', 10605
    $P1 = __ARG_1.'get'()
.annotate 'line', 10606
    self.'initbase'($P1, __ARG_2)
.annotate 'line', 10607
    $P3 = $P1.'getidentifier'()
    set $S2, $P3
    ne $S2, "const", __label_1
.annotate 'line', 10608
    bor $I1, $I1, 1
.annotate 'line', 10609
    $P1 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 10611
    null $S1
.annotate 'line', 10612
    $P2 = __ARG_1.'get'()
.annotate 'line', 10613
    $P3 = $P2.'isop'(",")
    if $P3 goto __label_4
    $P3 = $P2.'isop'(")")
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 10614
    set $S1, '?'
.annotate 'line', 10615
    __ARG_1.'unget'($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 10618
    $P4 = $P1.'getidentifier'()
    $P3 = WSubId_127($P4)
    set $S1, $P3
.annotate 'line', 10619
    set $P1, $P2
  __label_3: # endif
.annotate 'line', 10621
    box $P3, $I1
    setattribute self, 'flags', $P3
.annotate 'line', 10622
    box $P3, $S1
    setattribute self, 'type', $P3
.annotate 'line', 10623
    setattribute self, 'name', $P1
.annotate 'line', 10624

.end # InlineParam


.sub 'isconst' :method
.annotate 'line', 10627
    getattribute $P1, self, 'flags'
    set $I2, $P1
    band $I1, $I2, 1
    .return($I1)
.annotate 'line', 10628

.end # isconst


.sub 'getname' :method
.annotate 'line', 10631
    getattribute $P1, self, 'name'
    .return($P1)
.annotate 'line', 10632

.end # getname


.sub 'gettype' :method
.annotate 'line', 10635
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 10636

.end # gettype

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineParam' ]
.annotate 'line', 10597
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 10599
    addattribute $P0, 'flags'
.annotate 'line', 10600
    addattribute $P0, 'type'
.annotate 'line', 10601
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineStatement' ]

.sub 'InlineStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_127 = "WSubId_127"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 10647
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 10648
    $P1 = __ARG_2.'get'()
.annotate 'line', 10649
    WSubId_84("(", __ARG_2)
.annotate 'line', 10650
    $P2 = __ARG_2.'get'()
.annotate 'line', 10651
    null $P3
.annotate 'line', 10652
    $P6 = $P2.'isop'(")")
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 10653
    __ARG_2.'unget'($P2)
.annotate 'line', 10654
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P3, $P6
  __label_2: # do
.annotate 'line', 10656
    new $P6, [ 'Winxed'; 'Compiler'; 'InlineParam' ]
    $P6.'InlineParam'(__ARG_2, self)
    set $P4, $P6
.annotate 'line', 10657
    $P3.'push'($P4)
  __label_4: # continue
.annotate 'line', 10658
    $P2 = __ARG_2.'get'()
    $P6 = $P2.'isop'(",")
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 10659
    WSubId_28(")", $P2)
  __label_1: # endif
.annotate 'line', 10661
    $P2 = __ARG_2.'get'()
.annotate 'line', 10662
    null $S1
.annotate 'line', 10663
    $P6 = $P2.'iskeyword'('return')
    if_null $P6, __label_5
    unless $P6 goto __label_5
.annotate 'line', 10664
    $P2 = __ARG_2.'get'()
.annotate 'line', 10665
    $P6 = $P2.'getidentifier'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 10666
    $P6 = WSubId_127($S2)
    set $S1, $P6
.annotate 'line', 10667
    ne $S1, '', __label_8
.annotate 'line', 10668
    WSubId_25("Invalid return type", $P2)
  __label_8: # endif
.annotate 'line', 10669
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # else
.annotate 'line', 10672
    set $S1, 'v'
  __label_6: # endif
.annotate 'line', 10673
    WSubId_28("{", $P2)
.annotate 'line', 10674
    __ARG_2.'unget'($P2)
.annotate 'line', 10675
    $P5 = WSubId_125(__ARG_2, self)
.annotate 'line', 10677
    setattribute self, 'name', $P1
.annotate 'line', 10678
    box $P6, $S1
    setattribute self, 'rettype', $P6
.annotate 'line', 10679
    setattribute self, 'params', $P3
.annotate 'line', 10680
    setattribute self, 'body', $P5
.annotate 'line', 10681

.end # InlineStatement


.sub 'getouter' :method
.annotate 'line', 10682
    .return(self)

.end # getouter


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 10683
    .return("FAKEREG")

.end # createreg

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
.annotate 'line', 10639
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 10641
    addattribute $P0, 'name'
.annotate 'line', 10642
    addattribute $P0, 'rettype'
.annotate 'line', 10643
    addattribute $P0, 'body'
.annotate 'line', 10644
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]

.sub 'InlinedBlock' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10698
    getattribute $P7, __ARG_2, 'start'
    self.'BlockStatement'($P7, __ARG_1)
.annotate 'line', 10699
    setattribute self, 'inliner', __ARG_2
.annotate 'line', 10700
    setattribute self, 'inlined', __ARG_1
.annotate 'line', 10701
    getattribute $P1, __ARG_1, 'params'
.annotate 'line', 10702
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 10703
    unless_null __ARG_3, __label_4
    null $I2
    goto __label_3
  __label_4:
    $P7 = __ARG_3.'numargs'()
    set $I2, $P7
  __label_3:
.annotate 'line', 10704
    eq $I1, $I2, __label_5
.annotate 'line', 10705
    WSubId_25("Wrong arguments in inline expansion", __ARG_2)
  __label_5: # endif
.annotate 'line', 10706
    null $I3
  __label_8: # for condition
    ge $I3, $I1, __label_7
.annotate 'line', 10707
    $P2 = $P1[$I3]
.annotate 'line', 10708
    $P3 = $P2.'getname'()
.annotate 'line', 10709
    $P4 = __ARG_3.'getfreearg'($I3)
.annotate 'line', 10710
    $P7 = $P2.'gettype'()
    null $S1
    if_null $P7, __label_9
    set $S1, $P7
  __label_9:
.annotate 'line', 10711
    ne $S1, '?', __label_10
.annotate 'line', 10712
    $P7 = $P4.'checkresult'()
    set $S1, $P7
  __label_10: # endif
.annotate 'line', 10713
    $P7 = $P2.'isconst'()
    set $I4, $P7
.annotate 'line', 10714
    box $P7, $I4
    unless $P7 goto __label_13
    $P7 = $P4.'hascompilevalue'()
  __label_13:
    if_null $P7, __label_11
    unless $P7 goto __label_11
.annotate 'line', 10715
    $P5 = self.'createconst'($P3, $S1)
.annotate 'line', 10716
    $P5.'setvalue'($P4)
    goto __label_12
  __label_11: # else
.annotate 'line', 10719
    self.'createvar'($P3, $S1, 0)
  __label_12: # endif
  __label_6: # for iteration
.annotate 'line', 10706
    inc $I3
    goto __label_8
  __label_7: # for end
.annotate 'line', 10721
    setattribute self, 'params', $P1
.annotate 'line', 10722
    setattribute self, 'args', __ARG_3
.annotate 'line', 10723
    getattribute $P6, __ARG_1, 'body'
.annotate 'line', 10724
    $P6 = $P6.'clone'(self)
.annotate 'line', 10725
    $P6 = $P6.'optimize'()
.annotate 'line', 10726
    setattribute self, 'body', $P6
.annotate 'line', 10727

.end # InlinedBlock


.sub 'getouter' :method
.annotate 'line', 10728
    .return(self)

.end # getouter


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 10731
    getattribute $P2, self, 'inliner'
    getattribute $P1, $P2, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
.annotate 'line', 10732

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 10735
    getattribute $P1, self, 'inliner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 10736

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 10739
    getattribute $P2, self, 'inliner'
    getattribute $P1, $P2, 'owner'
    $P1.'freetemps'()
.annotate 'line', 10740

.end # freetemps


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 10743
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 10744
    unless_null $P1, __label_1
.annotate 'line', 10745
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 10746
    $P1[__ARG_1] = 1
.annotate 'line', 10747

.end # usesubid


.sub 'genlabel' :method
.annotate 'line', 10750
    getattribute $P1, self, 'inliner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 10751

.end # genlabel


.sub 'getendlabel' :method
.annotate 'line', 10755
    getattribute $P1, self, 'endlabel'
    .return($P1)
.annotate 'line', 10756

.end # getendlabel


.sub 'getrettype' :method
.annotate 'line', 10759
    getattribute $P2, self, 'inlined'
    getattribute $P1, $P2, 'rettype'
    .return($P1)
.annotate 'line', 10760

.end # getrettype


.sub 'checkresult' :method
.annotate 'line', 10763
    getattribute $P2, self, 'inlined'
    getattribute $P1, $P2, 'rettype'
    .return($P1)
.annotate 'line', 10764

.end # checkresult


.sub 'getretreg' :method
.annotate 'line', 10767
    getattribute $P1, self, 'retreg'
    .return($P1)
.annotate 'line', 10768

.end # getretreg


.sub 'emit_it' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_139 = "WSubId_139"
.annotate 'line', 10771
    $P9 = __ARG_1.'getDebug'()
    if_null $P9, __label_1
    unless $P9 goto __label_1
.annotate 'line', 10772
    __ARG_1.'comment'("inlined start")
  __label_1: # endif
.annotate 'line', 10773
    $P10 = self.'genlabel'()
    setattribute self, 'endlabel', $P10
.annotate 'line', 10774
    getattribute $P1, self, 'params'
.annotate 'line', 10775
    getattribute $P2, self, 'args'
.annotate 'line', 10776
    unless_null $P1, __label_3
    null $I1
    goto __label_2
  __label_3:
    elements $I1, $P1
  __label_2:
.annotate 'line', 10777
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 10778
    $P3 = $P1[$I2]
.annotate 'line', 10779
    $P4 = $P2.'getfreearg'($I2)
.annotate 'line', 10780
    $P9 = $P3.'isconst'()
    unless $P9 goto __label_8
    $P9 = $P4.'hascompilevalue'()
  __label_8:
    if_null $P9, __label_7
    unless $P9 goto __label_7
    goto __label_4 # continue
  __label_7: # endif
.annotate 'line', 10782
    $P9 = $P3.'gettype'()
    null $S1
    if_null $P9, __label_9
    set $S1, $P9
  __label_9:
.annotate 'line', 10783
    $P9 = $P4.'checkresult'()
    null $S2
    if_null $P9, __label_10
    set $S2, $P9
  __label_10:
.annotate 'line', 10784
    $P11 = $P3.'getname'()
    $P10 = self.'getvar'($P11)
    $P9 = $P10.'getreg'()
    null $S3
    if_null $P9, __label_11
    set $S3, $P9
  __label_11:
.annotate 'line', 10785
    iseq $I3, $S1, '?'
    if $I3 goto __label_14
    iseq $I3, $S2, $S1
  __label_14:
    unless $I3 goto __label_12
.annotate 'line', 10786
    $P4.'emit_init'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
.annotate 'line', 10788
    $P9 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 10789
    ne $S1, 'P', __label_16
.annotate 'line', 10790
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_17
  __label_16: # else
.annotate 'line', 10792
    __ARG_1.'emitset'($S3, $S4)
  __label_17: # endif
  __label_13: # endif
  __label_4: # for iteration
.annotate 'line', 10777
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 10795
    getattribute $P5, self, 'usedsubids'
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P7, WSubId_139
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
.annotate 'line', 10795
    join $S5, "", $P9
    __ARG_1.'print'($S5)
.annotate 'line', 10796
    getattribute $P9, self, 'body'
    $P9.'emit'(__ARG_1)
.annotate 'line', 10797
    getattribute $P9, self, 'endlabel'
    __ARG_1.'emitlabel'($P9)
.annotate 'line', 10798

.end # emit_it


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10801
    $P1 = self.'getrettype'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10802
    box $P1, __ARG_2
    setattribute self, 'retreg', $P1
.annotate 'line', 10803
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 10804
    self.'emit_it'(__ARG_1)
.annotate 'line', 10805
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 10806
    __ARG_1.'comment'("inlined end")
  __label_2: # endif
.annotate 'line', 10807

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10810
    self.'emit_it'(__ARG_1)
.annotate 'line', 10811
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10812
    __ARG_1.'comment'("inlined end")
  __label_1: # endif
.annotate 'line', 10813

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10816
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10817
    ne $S1, 'v', __label_2
.annotate 'line', 10818
    WSubId_25("Cannot get a result from a void inline", self)
  __label_2: # endif
.annotate 'line', 10819
    $P2 = self.'createreg'($S1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 10820
    box $P2, $S2
    setattribute self, 'retreg', $P2
.annotate 'line', 10821
    self.'emit_it'(__ARG_1)
.annotate 'line', 10822
    ne $S1, 'P', __label_4
.annotate 'line', 10824
    $P1 = self.'tempreg'('P')
.annotate 'line', 10825
    __ARG_1.'emitset'($P1, $S2)
.annotate 'line', 10826
    set $S2, $P1
  __label_4: # endif
.annotate 'line', 10828
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 10829
    __ARG_1.'comment'("inlined end")
  __label_5: # endif
.annotate 'line', 10830
    .return($S2)
.annotate 'line', 10831

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]
.annotate 'line', 10686
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 10688
    addattribute $P0, 'inliner'
.annotate 'line', 10689
    addattribute $P0, 'inlined'
.annotate 'line', 10690
    addattribute $P0, 'usedsubids'
.annotate 'line', 10691
    addattribute $P0, 'params'
.annotate 'line', 10692
    addattribute $P0, 'args'
.annotate 'line', 10693
    addattribute $P0, 'body'
.annotate 'line', 10694
    addattribute $P0, 'endlabel'
.annotate 'line', 10695
    addattribute $P0, 'retreg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineRef' ]

.sub 'InlineRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10840
    self.'Expr'(__ARG_2, __ARG_1)
.annotate 'line', 10841
    setattribute self, 'inlined', __ARG_3
.annotate 'line', 10842

.end # InlineRef


.sub 'checkresult' :method
.annotate 'line', 10843
    .return('v')

.end # checkresult


.sub 'misused' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10846
    getattribute $P1, self, 'start'
    WSubId_25("inline used by reference", $P1)
.annotate 'line', 10847

.end # misused


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10850
    self.'misused'()
.annotate 'line', 10851

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 10854
    self.'misused'()
.annotate 'line', 10855

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10858
    self.'misused'()
.annotate 'line', 10859

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
.annotate 'line', 10834
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 10836
    addattribute $P0, 'inlined'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]

.sub 'CallInlineExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10867
    getattribute $P1, __ARG_2, 'start'
    self.'Expr'($P1, __ARG_1)
.annotate 'line', 10868
    new $P3, [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]
    getattribute $P4, __ARG_2, 'inlined'
    $P3.'InlinedBlock'($P4, __ARG_1, __ARG_3)
    set $P2, $P3
    setattribute self, 'block', $P2
.annotate 'line', 10869

.end # CallInlineExpr


.sub 'checkresult' :method
.annotate 'line', 10870
    getattribute $P1, self, 'block'
    .tailcall $P1.'checkresult'()

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10873
    getattribute $P1, self, 'block'
    $P1.'emit_void'(__ARG_1)
.annotate 'line', 10874

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 10877
    getattribute $P1, self, 'block'
    .tailcall $P1.'emit_get'(__ARG_1)
.annotate 'line', 10878

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10881
    getattribute $P1, self, 'block'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 10882

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]
.annotate 'line', 10862
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 10864
    addattribute $P0, 'block'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 10896
    $P1 = __ARG_1.'get'()
.annotate 'line', 10897
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 10898
    WSubId_27($P1)
  __label_1: # endif
.annotate 'line', 10899
    $P2 = __ARG_1.'get'()
.annotate 'line', 10900
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 10901
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_127($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 10902
    set $P1, $P2
.annotate 'line', 10903
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 10904
    $P2 = __ARG_1.'get'()
  __label_2: # endif
.annotate 'line', 10906
    setattribute self, 'name', $P1
.annotate 'line', 10907
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 10908
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 10909
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 10910
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 10912
    __ARG_1.'unget'($P2)
  __label_5: # endif
.annotate 'line', 10913

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 10916
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 10917
    getattribute $P1, self, 'modifiers'
.annotate 'line', 10918
    if_null $P1, __label_1
.annotate 'line', 10919
    getattribute $P2, self, 'name'
.annotate 'line', 10920
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
  __label_1: # endif
.annotate 'line', 10922

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 10891
    addattribute $P0, 'name'
.annotate 'line', 10892
    addattribute $P0, 'modifiers'
.annotate 'line', 10893
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_141')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10927
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
.annotate 'line', 10928

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_141 = "WSubId_141"
.annotate 'line', 10935
    $P2 = WSubId_67(__ARG_1, __ARG_2, WSubId_141, ')')
    setattribute self, 'params', $P2
.annotate 'line', 10936

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 10939
    __ARG_1.'print'('(')
.annotate 'line', 10940
    set $S1, ''
.annotate 'line', 10941
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10942
    __ARG_1.'print'($S1)
.annotate 'line', 10943
    $P1.'emit'(__ARG_1)
.annotate 'line', 10944
    set $S1, ', '
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10946
    __ARG_1.'print'(')')
.annotate 'line', 10947

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 10932
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 10956
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 10957
    setattribute self, 'params', __ARG_3
.annotate 'line', 10958
    setattribute self, 'expr', __ARG_4
.annotate 'line', 10959

.end # MultiAssignStatement


.sub 'optimize' :method
.annotate 'line', 10962
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 10963
    .return(self)
.annotate 'line', 10964

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10967
    getattribute $P1, self, 'expr'
.annotate 'line', 10968
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 10969
    WSubId_25('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 10970
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 10971
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 10972
    __ARG_1.'print'('    ')
.annotate 'line', 10973
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 10974
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 10975
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 10976
    __ARG_1.'say'()
.annotate 'line', 10977

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 10950
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 10952
    addattribute $P0, 'params'
.annotate 'line', 10953
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10994
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 10995

.end # ClassSpecifier


.sub 'reftype' :method
.annotate 'line', 10996
    .return(0)

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 11000
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 11001

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 10990
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11009
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 11010
    setattribute self, 'name', __ARG_2
.annotate 'line', 11011

.end # ClassSpecifierStr


.sub 'reftype' :method
.annotate 'line', 11012
    .return(1)

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11016
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 11017
    __ARG_1.'print'($S1)
.annotate 'line', 11018

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 11004
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 11006
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 11027
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 11028
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 11029
    $P2 = __ARG_1.'get'()
.annotate 'line', 11030
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 11031
    WSubId_70('literal string', $P2)
  __label_1: # endif
.annotate 'line', 11032
    $P3 = $P2.'rawstring'()
    push $P1, $P3
.annotate 'line', 11033
    $P2 = __ARG_1.'get'()
.annotate 'line', 11034
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 11035
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
.annotate 'line', 11037
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 11041
    WSubId_71('token in class key', $P2)
  __label_4: # switch end
  __label_7: # do
.annotate 'line', 11044
    $P2 = __ARG_1.'get'()
.annotate 'line', 11045
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 11046
    WSubId_70('literal string', $P2)
  __label_10: # endif
.annotate 'line', 11047
    $P3 = $P2.'rawstring'()
    push $P1, $P3
  __label_9: # continue
.annotate 'line', 11048
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 11049
    WSubId_28(']', $P2)
  __label_2: # endif
.annotate 'line', 11051
    setattribute self, 'key', $P1
.annotate 'line', 11052

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
.annotate 'line', 11053
    .return(2)

.end # reftype


.sub 'hasHLL' :method
.annotate 'line', 11056
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 11057

.end # hasHLL


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 11061
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 11062
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 11063

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11066
    getattribute $P1, self, 'key'
.annotate 'line', 2519
    null $S1
.annotate 'line', 2520
    elements $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 2521
    join $S3, "'; '", $P1
    concat $S4, "[ '", $S3
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_2: # endif
.annotate 'line', 2522
    set $S2, $S1
    goto __label_1
  __label_1:
.annotate 'line', 11066
    __ARG_1.'print'($S2)
.annotate 'line', 11067

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 11021
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 11023
    addattribute $P0, 'key'
.annotate 'line', 11024
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11075
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 11076
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 11077
    null $P2
  __label_2: # while
.annotate 'line', 11078
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 11079
    $P2 = __ARG_1.'get'()
.annotate 'line', 11080
    set $S1, $P2
    push $P1, $S1
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 11082
    __ARG_1.'unget'($P2)
.annotate 'line', 11083
    setattribute self, 'key', $P1
.annotate 'line', 11084

.end # ClassSpecifierId


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 11087
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 11088
    getattribute $P2, self, 'start'
    $P1.'ClassSpecifier'(__ARG_1, $P2)
.annotate 'line', 11089
    getattribute $P3, self, 'key'
    setattribute $P1, 'key', $P3
.annotate 'line', 11090
    .return($P1)
.annotate 'line', 11091

.end # clone


.sub 'reftype' :method
.annotate 'line', 11092
    .return(3)

.end # reftype


.sub 'last' :method
.annotate 'line', 11096
    getattribute $P1, self, 'key'
.annotate 'line', 11097
    $P2 = $P1[-1]
    .return($P2)
.annotate 'line', 11098

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 11101
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 11102
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 11103

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_99 = "WSubId_99"
.annotate 'line', 11107
    getattribute $P3, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P3, 2)
.annotate 'line', 11108
    unless_null $P1, __label_1
.annotate 'line', 11109
    getattribute $P3, self, 'key'
    join $S2, ".", $P3
    getattribute $P4, self, 'start'
    WSubId_99(__ARG_1, $S2, $P4)
.annotate 'line', 11110
    getattribute $P2, self, 'key'
.annotate 'line', 2519
    null $S1
.annotate 'line', 2520
    elements $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 2521
    join $S2, "'; '", $P2
    concat $S4, "[ '", $S2
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_4: # endif
.annotate 'line', 2522
    set $S3, $S1
    goto __label_3
  __label_3:
.annotate 'line', 11110
    __ARG_1.'print'($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11112
    $P3 = $P1.'getclasskey'()
    __ARG_1.'print'($P3)
  __label_2: # endif
.annotate 'line', 11113

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.annotate 'line', 11116
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 11117
    unless_null $P1, __label_1
.annotate 'line', 11118
    getattribute $P3, self, 'key'
    join $S2, ".", $P3
    getattribute $P4, self, 'start'
    WSubId_99(__ARG_1, $S2, $P4)
.annotate 'line', 11119
    getattribute $P2, self, 'key'
.annotate 'line', 2519
    null $S1
.annotate 'line', 2520
    elements $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 2521
    join $S2, "'; '", $P2
    concat $S4, "[ '", $S2
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_4: # endif
.annotate 'line', 2522
    set $S3, $S1
    goto __label_3
  __label_3:
.annotate 'line', 11119
    __ARG_1.'say'("new ", __ARG_3, ", ", $S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11122
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
  __label_2: # endif
.annotate 'line', 11124

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 11070
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 11072
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11137
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 11138
    setattribute self, 'name', __ARG_2
.annotate 'line', 11139
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 11140
    setattribute self, 'classns', $P1
.annotate 'line', 11141

.end # ClassBase


.sub 'getpath' :method
.annotate 'line', 11144
    getattribute $P1, self, 'classns'
    .return($P1)
.annotate 'line', 11145

.end # getpath


.sub 'getclasskey' :method
.annotate 'line', 11148
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
.annotate 'line', 11149

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 11131
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 11133
    addattribute $P0, 'name'
.annotate 'line', 11134
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]

.sub 'FunctionContainer' :method
.annotate 'line', 11157
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions', $P2
.annotate 'line', 11158

.end # FunctionContainer


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 11164
    getattribute $P1, self, 'functions'
.annotate 'line', 11165
    getattribute $P3, __ARG_1, 'name'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 11166
    $P2 = $P1[$S1]
.annotate 'line', 11167
    unless_null $P2, __label_2
.annotate 'line', 11168
    $P1[$S1] = __ARG_1
    goto __label_3
  __label_2: # else
.annotate 'line', 11170
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_4
.annotate 'line', 11171
    $P2.'setmulti'()
  __label_4: # endif
.annotate 'line', 11172
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_5
.annotate 'line', 11173
    __ARG_1.'setmulti'()
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 11175

.end # addfunction


.sub 'find' :method
        .param string __ARG_1
.annotate 'line', 11178
    getattribute $P1, self, 'functions'
.annotate 'line', 11179
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 11180

.end # find

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
.annotate 'line', 11154
    addattribute $P0, 'functions'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_71 = "WSubId_71"
.annotate 'line', 11194
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11195
    self.'VarContainer'()
.annotate 'line', 11196
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P8.'FunctionContainer'()
    set $P8, $P8
    setattribute self, 'funcont', $P8
.annotate 'line', 11197
    setattribute self, 'parent', __ARG_3
.annotate 'line', 11198
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 11199
    setattribute self, 'items', $P1
.annotate 'line', 11200
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 11201
    setattribute self, 'members', $P2
.annotate 'line', 11203
    $P3 = __ARG_4.'get'()
.annotate 'line', 11204
    $P7 = $P3.'isop'(':')
    if_null $P7, __label_1
    unless $P7 goto __label_1
.annotate 'line', 11205
    $P9 = WSubId_67(__ARG_4, self, WSubId_92)
    setattribute self, 'bases', $P9
.annotate 'line', 11206
    $P3 = __ARG_4.'get'()
  __label_1: # endif
.annotate 'line', 11208
    WSubId_28('{', $P3)
.annotate 'line', 11210
    getattribute $P8, self, 'classns'
    $P7 = $P8.'fullname'()
    WSubId_140(self, '__CLASS__', $P7)
.annotate 'line', 11212
    $P3 = __ARG_4.'get'()
  __label_4: # for condition
    $P7 = $P3.'isop'('}')
    isfalse $I1, $P7
    unless $I1 goto __label_3
.annotate 'line', 11213
    $P8 = $P3.'checkkeyword'()
    set $S1, $P8
    if $S1 == 'function' goto __label_7
    if $S1 == 'var' goto __label_8
    if $S1 == 'const' goto __label_9
    goto __label_5
  __label_7: # case
.annotate 'line', 11215
    new $P9, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P9.'MethodStatement'($P3, __ARG_4, self)
    set $P4, $P9
.annotate 'line', 11216
    self.'addmethod'($P4)
.annotate 'line', 11217
    push $P1, $P4
    goto __label_6 # break
  __label_8: # case
.annotate 'line', 11220
    $P5 = __ARG_4.'get'()
.annotate 'line', 11221
    $P10 = $P5.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 11222
    WSubId_70("member identifier", $P5)
  __label_10: # endif
.annotate 'line', 11223
    push $P2, $P5
.annotate 'line', 11224
    $P3 = __ARG_4.'get'()
.annotate 'line', 11225
    $P11 = $P3.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 11226
    WSubId_70("';' in member declaration", $P3)
  __label_11: # endif
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 11229
    $P6 = WSubId_74($P3, __ARG_4, self)
.annotate 'line', 11230
    push $P1, $P6
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 11233
    WSubId_71("item in class", $P3)
  __label_6: # switch end
  __label_2: # for iteration
.annotate 'line', 11212
    $P3 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 11236

.end # ClassStatement


.sub 'addmethod' :method
        .param pmc __ARG_1
.annotate 'line', 11240
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 11241

.end # addmethod


.sub 'generatesubid' :method
.annotate 'line', 11244
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 11245

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 11248
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 11249

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 11252
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 11253

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 11256
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
.annotate 'line', 11257

.end # use_builtin


.sub 'optimize' :method
.annotate 'line', 11260
    getattribute $P1, self, 'items'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 11261
    .return(self)
.annotate 'line', 11262

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 11265
    getattribute $P8, self, 'classns'
    $P8.'emitnamespace'(__ARG_1)
.annotate 'line', 11266
    set $P3, __ARG_1
    getattribute $P4, self, 'items'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2239
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
.annotate 'line', 11268
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 11270
    $P8 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P8)
.annotate 'line', 11271
    set $I1, 1
.annotate 'line', 11272
    getattribute $P8, self, 'bases'
    if_null $P8, __label_6
    iter $P10, $P8
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P1, $P10
.annotate 'line', 11273
    $P1.'annotate'(__ARG_1)
.annotate 'line', 11274
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 11275
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 11276
    getattribute $P8, self, 'parent'
    $P1.'emit'(__ARG_1, $P8)
.annotate 'line', 11277
    __ARG_1.'say'()
.annotate 'line', 11278
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
    goto __label_5
  __label_6: # endfor
.annotate 'line', 11280
    getattribute $P8, self, 'members'
    if_null $P8, __label_8
    iter $P11, $P8
    set $P11, 0
  __label_7: # for iteration
    unless $P11 goto __label_8
    shift $P2, $P11
.annotate 'line', 11281
    __ARG_1.'annotate'($P2)
.annotate 'line', 11282
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
    goto __label_7
  __label_8: # endfor
.annotate 'line', 11285
    __ARG_1.'say'('.end')
.annotate 'line', 11286

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 11183
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 11185
    addattribute $P0, 'parent'
.annotate 'line', 11186
    addattribute $P0, 'bases'
.annotate 'line', 11187
    addattribute $P0, 'constants'
.annotate 'line', 11188
    addattribute $P0, 'items'
.annotate 'line', 11189
    addattribute $P0, 'members'
.annotate 'line', 11190
    addattribute $P0, 'funcont'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11293
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11294

.end # DeclareClassStatement


.sub 'optimize' :method
.annotate 'line', 11297
    .return(self)
.annotate 'line', 11298

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 11289
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_143')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11306
    $P1 = __ARG_2.'get'()
.annotate 'line', 11307
    $P2 = __ARG_2.'get'()
.annotate 'line', 11308
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 11309
    null $P4
  __label_3: # for condition
.annotate 'line', 11311
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 11312
    $P3.'push'($P1)
.annotate 'line', 11313
    $P1 = __ARG_2.'get'()
  __label_1: # for iteration
.annotate 'line', 11311
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 11316
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 11317
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 11318
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 11319
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
    goto __label_5
  __label_4: # else
.annotate 'line', 11322
    __ARG_2.'unget'($P2)
.annotate 'line', 11323
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 11324
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 11325
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
  __label_5: # endif
.annotate 'line', 11327

.end # parseClass


.sub 'open_include' :subid('WSubId_142')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 11338
    getinterp $P1
.annotate 'line', 11341
    $P2 = $P1[9]
.annotate 'line', 11342
    $P3 = $P2[0]
.annotate 'line', 11343
    null $P4
.annotate 'line', 11344
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
.annotate 'line', 11345
    concat $S2, $S1, __ARG_1
.annotate 'line', 11346
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
.annotate 'line', 11347
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 11348
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 11349
    pop_eh
    goto __label_4
  __label_3:
.annotate 'line', 11346
    .get_results($P7)
    finalize $P7
    pop_eh
  __label_4:
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11354
    isnull $I1, $P4
    box $P6, $I1
    if $P6 goto __label_8
    $P6 = $P4.'is_closed'()
  __label_8:
    if_null $P6, __label_7
    unless $P6 goto __label_7
.annotate 'line', 11355
    WSubId_25('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 11356
    $P4.'encoding'("utf8")
.annotate 'line', 11357
    .return($P4)
.annotate 'line', 11358

.end # open_include


.sub 'include_parrot' :subid('WSubId_145')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_142 = "WSubId_142"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 11362
    $P1 = __ARG_2.'get'()
.annotate 'line', 11363
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 11364
    WSubId_70('literal string', $P1)
  __label_1: # endif
.annotate 'line', 11365
    WSubId_84(';', __ARG_2)
.annotate 'line', 11367
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 11368
    $P2 = WSubId_142($S1, __ARG_1)
.annotate 'line', 11373
    $P4 = $P2.'readline'()
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
  __label_5: # for condition
    $P5 = $P2.'eof'()
    isfalse $I4, $P5
    unless $I4 goto __label_4
.annotate 'line', 11374
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
.annotate 'line', 11375
    set $I1, 12
.annotate 'line', 11376
    null $S3
  __label_9: # while
.annotate 'line', 11377
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 11378
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 11379
    set $I2, $I1
  __label_12: # while
.annotate 'line', 11380
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 11381
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 11382
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 11383
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 11385
    sub $I4, $I2, $I1
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 11386
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 11387
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 11388
    set $I1, $I2
  __label_22: # while
.annotate 'line', 11389
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 11390
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 11391
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 11392
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 11394
    sub $I4, $I2, $I1
    substr $S5, $S2, $I1, $I4
.annotate 'line', 11396
    null $I3
.annotate 'line', 11397
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 11398
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 11400
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 11401
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 11403
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 11402
    $P4 = WSubId_44(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
  __label_7: # endif
  __label_3: # for iteration
.annotate 'line', 11373
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 11407
    $P2.'close'()
.annotate 'line', 11408

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_146')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_142 = "WSubId_142"
.annotate 'line', 11414
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 11415
    WSubId_25("Must be used at root namespace level", __ARG_1)
  __label_1: # endif
.annotate 'line', 11416
    $P1 = __ARG_2.'get'()
.annotate 'line', 11417
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 11418
    WSubId_70('literal string', $P1)
  __label_2: # endif
.annotate 'line', 11419
    WSubId_84(';', __ARG_2)
.annotate 'line', 11421
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 11422
    $P2 = WSubId_142($S1, __ARG_1)
.annotate 'line', 11424
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P2, $S1, 0)
    set $P3, $P4
.annotate 'line', 11425
    __ARG_3.'parse'($P3)
.annotate 'line', 11427
    $P2.'close'()
.annotate 'line', 11428

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_144')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 11434
    $P1 = __ARG_2.'get'()
.annotate 'line', 11435
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 11436
    WSubId_88(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11437
    WSubId_84(';', __ARG_2)
.annotate 'line', 11438
    .return()
  __label_1: # endif
.annotate 'line', 11440
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
.annotate 'line', 11441
    __ARG_2.'unget'($P1)
.annotate 'line', 11442
    $P2 = WSubId_85(__ARG_2)
.annotate 'line', 11443
    elements $I1, $P2
.annotate 'line', 11444
    ge $I1, 1, __label_3
.annotate 'line', 11445
    WSubId_25('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 11446
    WSubId_84(';', __ARG_2)
.annotate 'line', 11447
    __ARG_3.'use'($P2)
.annotate 'line', 11448
    .return()
  __label_2: # endif
.annotate 'line', 11450
    $P1 = __ARG_2.'get'()
.annotate 'line', 11452
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 11459
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 11453
    __ARG_2.'warn'("using extern 'file'; is deprecated, use $loadlib instead.", $P1)
.annotate 'line', 11455
    null $S1
    if_null $P1, __label_8
    set $S1, $P1
  __label_8:
.annotate 'line', 11456
    __ARG_3.'addlib'($S1)
.annotate 'line', 11457
    WSubId_84(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 11460
    __ARG_2.'unget'($P1)
.annotate 'line', 11461
    $P3 = WSubId_85(__ARG_2)
.annotate 'line', 11462
    $P1 = __ARG_2.'get'()
.annotate 'line', 11463
    $P5 = $P1.'isop'(';')
    isfalse $I3, $P5
    unless $I3 goto __label_9
.annotate 'line', 11464
    __ARG_2.'unget'($P1)
.annotate 'line', 11465
    null $P5
    $P4 = WSubId_67(__ARG_2, $P5, WSubId_87, ';')
.annotate 'line', 11466
    __ARG_3.'addextern'($P3, $P4)
  __label_9: # endif
.annotate 'line', 11468
    join $S3, '/', $P3
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 11469
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 11472
    WSubId_70('string literal or identifier', $P1)
  __label_4: # switch end
.annotate 'line', 11474

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11484
    setattribute self, 'module', __ARG_1
.annotate 'line', 11485
    setattribute self, 'names', __ARG_2
.annotate 'line', 11486

.end # External


.sub 'emit' :subid('WSubId_15') :method
        .param pmc __ARG_1
.annotate 'line', 11487
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_16 = "WSubId_16"
.annotate 'line', 11491
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 11501
    getattribute $P4, self, 'module'
    join $S1, "'; '", $P4
    concat $S2, "['parrot'; '", $S1
    concat $S2, $S2, "']"
.annotate 'line', 11500
    __ARG_1.'emitget_root_namespace'("srcns", $S2)
.annotate 'line', 11503
    getattribute $P1, self, 'names'
.annotate 'line', 11504
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
.annotate 'line', 11509
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
.annotate 'line', 11515

.end # emit


.sub '' :anon :subid('WSubId_16') :outer('WSubId_15')
        .param string __ARG_2
.annotate 'line', 11504
    find_lex $P1, '__WLEX_1'
.annotate 'line', 11506
    $P1.'say'("    push symbols, '", __ARG_2, "'")
.annotate 'line', 11507

.end # WSubId_16

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 11480
    addattribute $P0, 'module'
.annotate 'line', 11481
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
.annotate 'line', 11525
    new $P1, ['ResizableStringArray']
.annotate 'line', 11526
    unless __ARG_2 goto __label_1
.annotate 'line', 11527
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 11529
    if_null __ARG_1, __label_3
.annotate 'line', 11530
    push $P1, __ARG_1
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 11532
    setattribute self, 'path', $P1
.annotate 'line', 11533

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
.annotate 'line', 11536
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 11537
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 11538
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 11539
    push $P2, __ARG_1
.annotate 'line', 11540
    setattribute $P1, 'path', $P2
.annotate 'line', 11541
    .return($P1)
.annotate 'line', 11542

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
.annotate 'line', 11545
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 11546
    getattribute $P2, self, 'hll'
.annotate 'line', 11547
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 11548
    unless_null $P2, __label_3
.annotate 'line', 11549
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 11551
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
.annotate 'line', 11552

.end # samehllas


.sub 'fullname' :method
.annotate 'line', 11555
    getattribute $P1, self, 'path'
    join $S1, '.', $P1
.annotate 'line', 11556
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
.annotate 'line', 11557
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11559
    .return($S1)
  __label_2: # endif
.annotate 'line', 11560

.end # fullname


.sub 'getparrotkey' :method
.annotate 'line', 11563
    getattribute $P1, self, 'path'
.annotate 'line', 11564
    null $S1
.annotate 'line', 11565
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 11566
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 11567
    .return($S1)
.annotate 'line', 11568

.end # getparrotkey


.sub 'getparrotrootkey' :method
.annotate 'line', 11571
    getattribute $P1, self, 'path'
.annotate 'line', 11572
    getattribute $P2, self, 'hll'
.annotate 'line', 11573
    set $S1, "[ '"
.annotate 'line', 11574
    if_null $P2, __label_1
    set $S3, $P2
.annotate 'line', 11577
    downcase $S2, $S3
    concat $S1, $S1, $S2
    goto __label_2
  __label_1: # else
.annotate 'line', 11580
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 11581
    concat $S1, $S1, "'"
.annotate 'line', 11582
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 11583
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 11584
    concat $S1, $S1, " ]"
.annotate 'line', 11585
    .return($S1)
.annotate 'line', 11586

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
.annotate 'line', 11589
    getattribute $P1, self, 'path'
.annotate 'line', 11590
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 11591
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 11592
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 11593
    __ARG_1.'say'("]")
.annotate 'line', 11594

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 11597
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11599
    $P3 = self.'getparrotkey'()
.annotate 'line', 11598
    $P2 = WSubId_45("    new %0, %1", __ARG_3, $P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11602
    $P5 = self.'getparrotrootkey'()
.annotate 'line', 11601
    $P4 = WSubId_45("    root_new %0, %1", __ARG_3, $P5)
    __ARG_1.'print'($P4)
  __label_2: # endif
.annotate 'line', 11603
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 11604
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 11605
    __ARG_1.'say'()
.annotate 'line', 11606

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 11609
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11610
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11612
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
.annotate 'line', 11613

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 11616
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 11618
    $P5 = self.'getparrotkey'()
.annotate 'line', 11617
    $P4 = WSubId_45("    get_class %0, %1", __ARG_3, $P5)
    __ARG_1.'say'($P4)
    goto __label_2
  __label_1: # else
.annotate 'line', 11623
    getattribute $P1, self, 'hll'
.annotate 'line', 11624
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 11625
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 11626
    if_null $P1, __label_5
    set $S3, $P1
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 11627
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 11630
    join $S3, "'; '", $P2
.annotate 'line', 11628
    $P3 = WSubId_45("    get_root_global %0, ['%1'; '%2'], '%3'", __ARG_3, $S2, $S3, $S1)
    __ARG_1.'say'($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 11632
    $P4 = WSubId_45("    get_root_global %0, ['%1'], '%2'", __ARG_3, $S2, $S1)
    __ARG_1.'say'($P4)
  __label_7: # endif
.annotate 'line', 11635
    $P3 = WSubId_45("    get_class %0, %0", __ARG_3)
    __ARG_1.'say'($P3)
  __label_2: # endif
.annotate 'line', 11637

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 11640
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11641
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11643
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
.annotate 'line', 11644

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 11520
    addattribute $P0, 'hll'
.annotate 'line', 11521
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_140 = "WSubId_140"
.annotate 'line', 11663
    self.'VarContainer'()
.annotate 'line', 11664
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 11665
    unless_null __ARG_2, __label_1
.annotate 'line', 11666
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 11667
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 11668
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 11669
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P2.'FunctionContainer'()
    set $P2, $P2
    setattribute self, 'funcont', $P2
.annotate 'line', 11670
    $P1 = __ARG_1.'fullname'()
    WSubId_140(self, '__NAMESPACE__', $P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 11673
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 11674
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 11675
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 11676
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 11677
    getattribute $P2, __ARG_2, 'funcont'
    setattribute self, 'funcont', $P2
  __label_2: # endif
.annotate 'line', 11679
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
.annotate 'line', 11680

.end # NamespaceBase


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 11683
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 11684

.end # addfunction


.sub 'fixnamespaces' :subid('WSubId_17') :method
.annotate 'line', 11685
.lex '__WLEX_1', $P1
.const 'Sub' WSubId_5 = "WSubId_5"
.const 'Sub' WSubId_7 = "WSubId_7"
.const 'Sub' WSubId_18 = "WSubId_18"
.annotate 'line', 11687
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
.annotate 'line', 11688
    $P1 = WSubId_7(self, "usenamespace")
.annotate 'line', 11689
    getattribute $P5, self, 'usednamespaces'
.annotate 'line', 11690
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
.annotate 'line', 11691

.end # fixnamespaces


.sub '' :anon :subid('WSubId_18') :outer('WSubId_17')
        .param pmc __ARG_1
.annotate 'line', 11690
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
.annotate 'line', 11690

.end # WSubId_18


.sub 'getpath' :method
.annotate 'line', 11694
    getattribute $P1, self, 'nspath'
    .return($P1)
.annotate 'line', 11695

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 11698
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 11699
    .return()
  __label_1: # endif
.annotate 'line', 11700
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 11701
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
.annotate 'line', 11701
    if_null $P7, __label_2
.annotate 'line', 11702
    .return()
  __label_2: # endif
.annotate 'line', 11703
    push $P1, __ARG_1
.annotate 'line', 11704

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
.annotate 'line', 11707
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 11708
    if_null $P1, __label_1
.annotate 'line', 11709
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 11710
    self.'addfunction'($P1)
  __label_3: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 11713
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 11714
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 11715
    if_null $P2, __label_5
.annotate 'line', 11716
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 11717
    if_null $P1, __label_6
.annotate 'line', 11718
    self.'createvarused'($S1, $P1)
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif
.annotate 'line', 11721

.end # use


.sub 'getusedns' :subid('WSubId_19') :method
        .param string __ARG_1
.annotate 'line', 11722
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_20 = "WSubId_20"
.annotate 'line', 11724
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 11725
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
.annotate 'line', 11724
    .return($P6)
.annotate 'line', 11726

.end # getusedns


.sub '' :anon :subid('WSubId_20') :outer('WSubId_19')
        .param pmc __ARG_2
.annotate 'line', 11725
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_20


.sub 'getlocalns' :subid('WSubId_21') :method
        .param string __ARG_1
.annotate 'line', 11727
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
.annotate 'line', 11729
    getattribute $P2, self, 'namespaces'
.annotate 'line', 11730
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
.annotate 'line', 11731
    if_null $P1, __label_5
.annotate 'line', 11732
    .return($P1)
  __label_5: # endif
.annotate 'line', 11733
    .tailcall self.'getusedns'(__ARG_1)
.annotate 'line', 11734

.end # getlocalns


.sub '' :anon :subid('WSubId_22') :outer('WSubId_21')
        .param pmc __ARG_2
.annotate 'line', 11730
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
.annotate 'line', 11738
    new $P3, [ 'Winxed'; 'Compiler'; 'External' ]
    $P3.'External'(__ARG_1, __ARG_2)
    set $P1, $P3
.annotate 'line', 11739
    getattribute $P2, self, 'externals'
.annotate 'line', 11740
    unless_null $P2, __label_1
.annotate 'line', 11741
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 11743
    push $P2, $P1
  __label_2: # endif
.annotate 'line', 11744

.end # addextern


.sub 'checkclass_base' :subid('WSubId_23') :method
        .param string __ARG_1
.annotate 'line', 11746
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_24 = "WSubId_24"
.annotate 'line', 11748
    getattribute $P3, self, 'classes'
.annotate 'line', 11749
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
.annotate 'line', 11750
    if_null $P1, __label_5
.annotate 'line', 11751
    .return($P1)
  __label_5: # endif
.annotate 'line', 11752
    getattribute $P7, self, 'usednamespaces'
    if_null $P7, __label_7
    iter $P8, $P7
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P2, $P8
.annotate 'line', 11753
    $P1 = $P2.'checkclass_base'(__ARG_1)
    if_null $P1, __label_8
.annotate 'line', 11754
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    null $P7
.annotate 'line', 11755
    .return($P7)
.annotate 'line', 11756

.end # checkclass_base


.sub '' :anon :subid('WSubId_24') :outer('WSubId_23')
        .param pmc __ARG_2
.annotate 'line', 11749
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_24


.sub 'findsymbolbyname' :method
        .param string __ARG_1
.annotate 'line', 11759
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 11760
    if_null $P1, __label_1
.annotate 'line', 11761
    .return($P1)
  __label_1: # endif
.annotate 'line', 11762
    getattribute $P2, self, 'funcont'
.annotate 'line', 11763
    $P1 = $P2.'find'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 11764
    .return($P1)
  __label_2: # endif
.annotate 'line', 11765
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 11766
    .return($P1)
  __label_3: # endif
    null $P3
.annotate 'line', 11767
    .return($P3)
.annotate 'line', 11768

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
.annotate 'line', 11773
    elements $I1, __ARG_1
.annotate 'line', 11774
    null $S1
.annotate 'line', 11775
    null $P1
.annotate 'line', 11776
    null $P2
    sub $I2, $I1, __ARG_3
    if $I2 == 0 goto __label_3
    if $I2 == 1 goto __label_4
    goto __label_1
  __label_3: # case
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 11781
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
    if __ARG_2 == 1 goto __label_7
    if __ARG_2 == 2 goto __label_8
    goto __label_5
  __label_7: # case
.annotate 'line', 11784
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 11786
    .tailcall self.'checkclass_base'($S1)
  __label_5: # default
.annotate 'line', 11789
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 11790
    .return($P1)
  __label_9: # endif
.annotate 'line', 11791
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 11792
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 11793
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_6: # switch end
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 11800
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 11801
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 11802
    isnull $I6, $P2
    not $I6
    unless $I6 goto __label_14
.annotate 'line', 11803
    add $I7, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I7)
    isnull $I6, $P1
    not $I6
  __label_14:
    unless $I6 goto __label_13
.annotate 'line', 11804
    .return($P1)
  __label_13: # endif
.annotate 'line', 11805
    $P2 = self.'getusedns'($S1)
.annotate 'line', 11806
    isnull $I8, $P2
    not $I8
    unless $I8 goto __label_16
.annotate 'line', 11807
    add $I9, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I9)
    isnull $I8, $P1
    not $I8
  __label_16:
    unless $I8 goto __label_15
.annotate 'line', 11808
    .return($P1)
  __label_15: # endif
  __label_2: # switch end
    null $P3
.annotate 'line', 11810
    .return($P3)
.annotate 'line', 11811

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 11814
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P3
    $P2.'NamespaceStatement'(self, __ARG_1, $P3, __ARG_2, $P3)
    set $P1, $P2
.annotate 'line', 11815
    getattribute $P2, self, 'namespaces'
    push $P2, $P1
.annotate 'line', 11816
    .return($P1)
.annotate 'line', 11817

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11820
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 11821
    new $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
    set $P2, $P3
.annotate 'line', 11822
    getattribute $P3, self, 'namespaces'
    push $P3, $P2
.annotate 'line', 11823
    getattribute $P3, self, 'items'
    push $P3, $P2
.annotate 'line', 11824
    .return($P2)
.annotate 'line', 11825

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
.annotate 'line', 11828
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 11829

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
.annotate 'line', 11832
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 11833
    getattribute $P1, self, 'items'
    push $P1, __ARG_1
.annotate 'line', 11834

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 11837
    $P1 = __ARG_2.'get'()
.annotate 'line', 11838
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 11839
    $P1 = __ARG_2.'get'()
.annotate 'line', 11841
    set $P2, self
  __label_4: # for condition
.annotate 'line', 11842
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 11843
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 11844
    $P5 = __ARG_2.'get'()
    set $S1, $P5
  __label_2: # for iteration
.annotate 'line', 11842
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 11847
    null $P3
.annotate 'line', 11848
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 11849
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 11850
    $P1 = __ARG_2.'get'()
  __label_5: # endif
.annotate 'line', 11853
    WSubId_28('{', $P1)
.annotate 'line', 11854
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 11855
    $P4.'parse'(__ARG_2)
.annotate 'line', 11856

.end # parsenamespace


.sub 'parseextern' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 11861
    $P1 = __ARG_1.'get'()
.annotate 'line', 11862
    $P3 = $P1.'iskeyword'('function')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 11863
    WSubId_25('Unsupported extern', $P1)
  __label_1: # endif
.annotate 'line', 11864
    $P1 = __ARG_1.'get'()
.annotate 'line', 11865
    WSubId_124($P1)
.annotate 'line', 11866
    WSubId_84(';', __ARG_1)
.annotate 'line', 11867
    new $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P3.'FunctionExtern'($P1, self)
    set $P2, $P3
.annotate 'line', 11868
    self.'addfunction'($P2)
.annotate 'line', 11869

.end # parseextern


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_143 = "WSubId_143"
.const 'Sub' WSubId_144 = "WSubId_144"
.const 'Sub' WSubId_145 = "WSubId_145"
.const 'Sub' WSubId_146 = "WSubId_146"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_71 = "WSubId_71"
.annotate 'line', 11872
    getattribute $P1, self, 'items'
.annotate 'line', 11873
    null $P2
.annotate 'line', 11874
    $P2 = __ARG_1.'get'()
  __label_3: # for condition
    $P6 = $P2.'iseof'()
    if $P6 goto __label_4
    $P6 = $P2.'isop'('}')
  __label_4:
    isfalse $I1, $P6
    unless $I1 goto __label_2
.annotate 'line', 11876
    $P7 = $P2.'checkkeyword'()
    set $S1, $P7
    if $S1 == 'namespace' goto __label_7
    if $S1 == 'const' goto __label_8
    if $S1 == 'function' goto __label_9
    if $S1 == 'inline' goto __label_10
    if $S1 == 'class' goto __label_11
    if $S1 == 'extern' goto __label_12
    if $S1 == 'using' goto __label_13
    if $S1 == '$include_const' goto __label_14
    if $S1 == '$include' goto __label_15
    if $S1 == '$load' goto __label_16
    if $S1 == '$loadlib' goto __label_17
    goto __label_5
  __label_7: # case
.annotate 'line', 11878
    self.'parsenamespace'($P2, __ARG_1)
    goto __label_6 # break
  __label_8: # case
.annotate 'line', 11881
    $P3 = WSubId_74($P2, __ARG_1, self)
.annotate 'line', 11882
    push $P1, $P3
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 11885
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P8.'FunctionStatement'($P2, __ARG_1, self)
    set $P4, $P8
.annotate 'line', 11886
    self.'addfunction'($P4)
.annotate 'line', 11887
    push $P1, $P4
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 11890
    new $P9, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    $P9.'InlineStatement'($P2, __ARG_1, self)
    set $P5, $P9
.annotate 'line', 11891
    self.'addfunction'($P5)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 11894
    WSubId_143($P2, __ARG_1, self)
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 11897
    self.'parseextern'(__ARG_1)
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 11900
    WSubId_144($P2, __ARG_1, self)
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 11903
    WSubId_145($P2, __ARG_1, self)
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 11906
    WSubId_146($P2, __ARG_1, self)
    goto __label_6 # break
  __label_16: # case
.annotate 'line', 11909
    $P2 = __ARG_1.'get'()
.annotate 'line', 11910
    $P10 = $P2.'isstring'()
    isfalse $I2, $P10
    unless $I2 goto __label_18
.annotate 'line', 11911
    WSubId_70('string literal', $P2)
  __label_18: # endif
.annotate 'line', 11912
    WSubId_84(';', __ARG_1)
.annotate 'line', 11913
    new $P13, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P13.'StringLiteral'(self, $P2)
    set $P12, $P13
    $P11 = $P12.'getPirString'()
    self.'addload'($P11)
    goto __label_6 # break
  __label_17: # case
.annotate 'line', 11916
    $P2 = __ARG_1.'get'()
.annotate 'line', 11917
    $P14 = $P2.'isstring'()
    isfalse $I3, $P14
    unless $I3 goto __label_19
.annotate 'line', 11918
    WSubId_70('string literal', $P2)
  __label_19: # endif
.annotate 'line', 11919
    WSubId_84(';', __ARG_1)
.annotate 'line', 11920
    new $P17, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P17.'StringLiteral'(self, $P2)
    set $P16, $P17
    $P15 = $P16.'getPirString'()
    self.'addlib'($P15)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 11923
    WSubId_71("token", $P2)
  __label_6: # switch end
  __label_1: # for iteration
.annotate 'line', 11874
    $P2 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 11926
    $P6 = $P2.'iseof'()
    if_null $P6, __label_20
    unless $P6 goto __label_20
.annotate 'line', 11927
    self.'unclosed_ns'()
    goto __label_21
  __label_20: # else
.annotate 'line', 11929
    self.'close_ns'($P2)
  __label_21: # endif
.annotate 'line', 11930

.end # parse


.sub 'optimize_base' :method
.annotate 'line', 11933
    getattribute $P1, self, 'items'
.annotate 'line', 2232
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
.annotate 'line', 2233
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 2234
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
.annotate 'line', 2233
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
.annotate 'line', 11934

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.annotate 'line', 11937
    $P1 = self.'getpath'()
.annotate 'line', 11939
    set $I1, 1
.annotate 'line', 11941
    getattribute $P2, self, 'externals'
.annotate 'line', 11942
    if_null $P2, __label_1
.annotate 'line', 11943
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 11944
    null $I1
.annotate 'line', 11945
    set $P4, __ARG_1
    set $P5, $P2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 2239
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
.annotate 'line', 11948
    getattribute $P9, self, 'items'
    if_null $P9, __label_7
    iter $P11, $P9
    set $P11, 0
  __label_6: # for iteration
    unless $P11 goto __label_7
    shift $P3, $P11
.annotate 'line', 11949
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_10
.annotate 'line', 11950
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 11951
    set $I1, 1
    goto __label_9
  __label_8: # else
.annotate 'line', 11953
    unless $I1 goto __label_11
.annotate 'line', 11954
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 11955
    null $I1
  __label_11: # endif
  __label_9: # endif
.annotate 'line', 11957
    $P3.'emit'(__ARG_1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 11959

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 11651
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 11653
    addattribute $P0, 'nspath'
.annotate 'line', 11654
    addattribute $P0, 'externals'
.annotate 'line', 11655
    addattribute $P0, 'namespaces'
.annotate 'line', 11656
    addattribute $P0, 'classes'
.annotate 'line', 11657
    addattribute $P0, 'funcont'
.annotate 'line', 11658
    addattribute $P0, 'items'
.annotate 'line', 11659
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 11977
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 11978
    null $I1
.annotate 'line', 11979
    if_null __ARG_5, __label_1
.annotate 'line', 11980
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 11981
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 11982
    set $I1, 1
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 11985
    unless $I1 goto __label_4
.annotate 'line', 11986
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 11987
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 11988
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 11990
    setattribute self, 'parent', __ARG_1
.annotate 'line', 11991
    setattribute self, 'start', __ARG_2
.annotate 'line', 11992
    setattribute self, 'owner', __ARG_1
.annotate 'line', 11993
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 11994

.end # NamespaceStatement


.sub 'dowarnings' :method
.annotate 'line', 11997
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 11998

.end # dowarnings


.sub 'generatesubid' :method
.annotate 'line', 12001
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 12002

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 12005
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 12006

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 12009
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
.annotate 'line', 12010

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 12013
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
.annotate 'line', 12014

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 12017
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 12018
    unless_null $P1, __label_1
.annotate 'line', 12019
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 12020
    .return($P1)
.annotate 'line', 12021

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 12024
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 12025
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 12026
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 12027
    .return($P1)
.annotate 'line', 12028

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 12031
    getattribute $P1, self, 'start'
    WSubId_25('unclosed namespace', $P1)
.annotate 'line', 12032

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1

.end # close_ns


.sub 'optimize' :method
.annotate 'line', 12039
    getattribute $P1, self, 'modifier'
.annotate 'line', 12040
    if_null $P1, __label_1
.annotate 'line', 12041
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 12042
    self.'optimize_base'()
.annotate 'line', 12043
    .return(self)
.annotate 'line', 12044

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 12047
    getattribute $P1, self, 'hll'
.annotate 'line', 12048
    if_null $P1, __label_1
.annotate 'line', 12049
    $P2 = WSubId_45(".HLL '%0'", $P1)
    __ARG_1.'say'($P2)
  __label_1: # endif
.annotate 'line', 12051
    self.'emit_base'(__ARG_1)
.annotate 'line', 12053
    if_null $P1, __label_2
.annotate 'line', 12054
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
.annotate 'line', 12055

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 11966
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 11968
    addattribute $P0, 'parent'
.annotate 'line', 11969
    addattribute $P0, 'start'
.annotate 'line', 11970
    addattribute $P0, 'name'
.annotate 'line', 11971
    addattribute $P0, 'modifier'
.annotate 'line', 11972
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
.annotate 'line', 12072
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 12073
    setattribute self, 'unit', __ARG_1
.annotate 'line', 12074
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 12075
    box $P1, 0
    setattribute self, 'subidgen', $P1
.annotate 'line', 12076

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 12079
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 12080
    $P1[__ARG_1] = 1
.annotate 'line', 12081

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 12085
    getattribute $P1, self, 'subidgen'
    inc $P1
    set $I1, $P1
.annotate 'line', 12086
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
.annotate 'line', 12087

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 12091
    getattribute $P1, self, 'libs'
.annotate 'line', 12092
    unless_null $P1, __label_1
.annotate 'line', 12093
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 12094
    $P1[__ARG_1] = 1
.annotate 'line', 12095

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 12098
    getattribute $P1, self, 'loads'
.annotate 'line', 12099
    unless_null $P1, __label_1
.annotate 'line', 12100
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 12101
    $P1[__ARG_1] = 1
.annotate 'line', 12102

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 12105
    .tailcall self.'checkclass_base'(__ARG_1)
.annotate 'line', 12106

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 12109
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 12110

.end # scopesearch


.sub 'unclosed_ns' :method

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 12117
    WSubId_25('Cannot close root namespace', __ARG_1)
.annotate 'line', 12118

.end # close_ns


.sub 'dowarnings' :method
.annotate 'line', 12121
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 12122

.end # dowarnings


.sub 'optimize' :method
.annotate 'line', 12125
    self.'optimize_base'()
.annotate 'line', 12126
    .return(self)
.annotate 'line', 12127

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 12130
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 12133
    $P12 = $P1['chomp']
    if_null $P12, __label_1
.annotate 'line', 12134
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 12137
    split $P12, " ", "acos asin atan cos exp ln sin tan pow sinh cosh tanh"
    if_null $P12, __label_3
    iter $P13, $P12
    set $P13, 0
  __label_2: # for iteration
    unless $P13 goto __label_3
    shift $S1, $P13
.annotate 'line', 12139
    $P14 = $P1[$S1]
    if_null $P14, __label_4
.annotate 'line', 12140
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 12144
    getattribute $P2, self, 'libs'
.annotate 'line', 12145
    if_null $P2, __label_5
.annotate 'line', 12146
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
.annotate 'line', 12146
    join $S2, "\n", $P12
    __ARG_1.'say'($S2)
  __label_5: # endif
.annotate 'line', 12148
    getattribute $P3, self, 'loads'
.annotate 'line', 12149
    if_null $P3, __label_9
.annotate 'line', 12156
    set $P8, $P3
    root_new $P9, ['parrot';'ResizablePMCArray']
.annotate 'line', 12157
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
.annotate 'line', 12156
    join $S2, "\n", $P12
.annotate 'line', 12150
    $P12 = WSubId_45(".sub initial_load_bytecode :anon :load :init\n%0\n.end\n", $S2)
    __ARG_1.'say'($P12)
  __label_9: # endif
.annotate 'line', 12159
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_14
    isnull $I1, $P3
    not $I1
  __label_14:
    unless $I1 goto __label_13
.annotate 'line', 12160
    __ARG_1.'comment'('end libs')
  __label_13: # endif
.annotate 'line', 12162
    self.'emit_base'(__ARG_1)
.annotate 'line', 12163

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 12166
    getattribute $P1, self, 'locals'
.annotate 'line', 12167
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
.annotate 'line', 12168
    $P2 = $P1[$S1]
.annotate 'line', 12169
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 12170
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 12171
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 12173
    $P3 = $P2.'getvalue'()
.annotate 'line', 12174
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 12176

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 12062
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 12064
    addattribute $P0, 'unit'
.annotate 'line', 12065
    addattribute $P0, 'bultins_used'
.annotate 'line', 12066
    addattribute $P0, 'libs'
.annotate 'line', 12067
    addattribute $P0, 'loads'
.annotate 'line', 12068
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 12188
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 12189
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
.annotate 'line', 12190

.end # Builtin


.sub 'getname' :method
.annotate 'line', 12191
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
.annotate 'line', 12194
    getattribute $P1, self, 'variants'
    push $P1, __ARG_1
.annotate 'line', 12195

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 12184
    addattribute $P0, 'name'
.annotate 'line', 12185
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
.annotate 'line', 12205
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
.annotate 'line', 12206

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 12209
    getattribute $P1, self, 'entries'
.annotate 'line', 12210
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 12211
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 12212
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 12214
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
.annotate 'line', 12215

.end # add


.sub 'put' :method
        .param pmc __ARG_1
.annotate 'line', 12218
    getattribute $P1, self, 'entries'
.annotate 'line', 12219
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 12220
    $P3 = $P1[$S1]
    __ARG_1.'addfunction'($P3)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 12221

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 12202
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_147 = "WSubId_147"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_148 = "WSubId_148"
.annotate 'line', 12231
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 12232
    new $P4, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P4.'RootNamespace'(self)
    set $P1, $P4
.annotate 'line', 12236
    WSubId_147($P1, 'false', 0)
.annotate 'line', 12237
    WSubId_147($P1, 'true', 1)
.annotate 'line', 12242
    WSubId_140($P1, '__STAGE__', "4")
.annotate 'line', 12245
    WSubId_147($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 12248
    WSubId_147($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 12251
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 12253
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
    set $P3, $P3
.annotate 'line', 12254
    WSubId_148($P3)
.annotate 'line', 12255
    $P3.'put'($P2)
.annotate 'line', 12257
    $P1.'usenamespace'($P2)
.annotate 'line', 12259
    setattribute self, 'rootns', $P1
.annotate 'line', 12260

.end # WinxedCompileUnit


.sub 'dowarnings' :method
.annotate 'line', 12263
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
.annotate 'line', 12264

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 12267
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 12268
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
.annotate 'line', 12269

.end # parse


.sub 'optimize' :method
.annotate 'line', 12272
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
.annotate 'line', 12273

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 12276
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 12277
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 12278
    __ARG_1.'say'('')
.annotate 'line', 12280
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 12282
    __ARG_1.'comment'('End generated code')
.annotate 'line', 12283

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 12286
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 12287
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 12289
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 12291
    __ARG_1.'comment'('End')
.annotate 'line', 12292

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 12226
    addattribute $P0, 'rootns'
.annotate 'line', 12227
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
.annotate 'line', 12301
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 5
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 12302
    .return($P1)
.annotate 'line', 12303

.end # version


.sub 'version_string' :method
.annotate 'line', 12306
    $P1 = self.'version'()
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
.annotate 'line', 12307

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
        .param int __ARG_6
.annotate 'line', 12310
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 12311
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 12312
    null $P1
.annotate 'line', 12313
    unless_null __ARG_3, __label_2
.annotate 'line', 12314
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12315
    $P1.'open'('__eval__', 'w')
    goto __label_3
  __label_2: # else
.annotate 'line', 12318
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 12319
    new $P5, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P5.'Emit'($P1, __ARG_6)
    set $P2, $P5
.annotate 'line', 12320
    unless __ARG_4 goto __label_4
.annotate 'line', 12321
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 12322
    unless __ARG_5 goto __label_5
.annotate 'line', 12323
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 12324
    __ARG_1.'emit'($P2)
.annotate 'line', 12325
    $P2.'close'()
.annotate 'line', 12326
    if_null __ARG_3, __label_6
.annotate 'line', 12327
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
.annotate 'line', 12329
    $P1.'close'()
.annotate 'line', 12330
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 12331
    null $P3
    set $S2, __ARG_2
    if $S2 == 'pir' goto __label_11
    if $S2 == 'pbc' goto __label_12
    if $S2 == '' goto __label_13
    goto __label_9
  __label_11: # case
.annotate 'line', 12334
    new $P3, [ 'String' ]
.annotate 'line', 12335
    assign $P3, $S1
    goto __label_10 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 12339
    compreg $P4, 'PIR'
.annotate 'line', 12340
    $P3 = $P4($S1)
    goto __label_10 # break
  __label_9: # default
.annotate 'line', 12343
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
    die $S5
  __label_10: # switch end
.annotate 'line', 12345
    .return($P3)
  __label_7: # endif
.annotate 'line', 12347

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
.annotate 'line', 12350
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12351
    $P1.'open'('__eval__', 'w')
.annotate 'line', 12352
    new $P3, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P3.'Emit'($P1, 1)
    set $P2, $P3
.annotate 'line', 12353
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 12354
    $P2.'close'()
.annotate 'line', 12355
    $P1.'close'()
.annotate 'line', 12356
    .tailcall $P1.'read'(0)
.annotate 'line', 12357

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 12365
    unless_null __ARG_2, __label_1
.annotate 'line', 12366
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 12367
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12368
    $P1.'open'('__eval__', 'w')
.annotate 'line', 12369
    $P1.'puts'(__ARG_1)
.annotate 'line', 12370
    $P1.'close'()
.annotate 'line', 12371
    $P1.'open'('__eval__', 'r')
.annotate 'line', 12372
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, '__eval__', __ARG_6)
    set $P2, $P4
.annotate 'line', 12373
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
.annotate 'line', 12374
    $P3.'parse'($P2)
.annotate 'line', 12375
    $P1.'close'()
.annotate 'line', 12376
    $P3.'optimize'()
.annotate 'line', 12377
    ne __ARG_2, 'include', __label_2
.annotate 'line', 12378
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 12380
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 12381

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 12390
    unless_null __ARG_2, __label_1
.annotate 'line', 12391
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 12392
    new $P1, [ 'FileHandle' ]
.annotate 'line', 12393
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 12394
    $P1.'encoding'('utf8')
.annotate 'line', 12395
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, __ARG_1, __ARG_6)
    set $P2, $P4
.annotate 'line', 12396
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
.annotate 'line', 12397
    $P3.'parse'($P2)
.annotate 'line', 12398
    $P1.'close'()
.annotate 'line', 12399
    $P3.'optimize'()
.annotate 'line', 12400
    ne __ARG_2, 'include', __label_2
.annotate 'line', 12401
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 12403
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 12404

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
.annotate 'line', 12413
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 12414
    compreg 'winxed', $P1
.annotate 'line', 12415

.end # initializer

# End generated code
