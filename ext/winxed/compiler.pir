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
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_93 = "WSubId_93"
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
    .tailcall WSubId_44($P5, $P6, $N3)
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
    null $P2
.annotate 'line', 6591
    getattribute $P3, self, 'left'
  __label_2: # while
.annotate 'line', 6592
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6593
    getattribute $P3, $P3, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6594
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 6595
    $P4 = $P3.'checkIdentifier'()
.annotate 'line', 6596
    isnull $I1, $P4
    if $I1 goto __label_5
    set $S1, $P4
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 6597
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 6598
    self.'buildkey'($P5)
.annotate 'line', 6599
    .tailcall self.'scopesearch'($P5, 0)
  __label_4: # endif
  __label_3: # endif
    null $P6
.annotate 'line', 6602
    .return($P6)
.annotate 'line', 6603

.end # search_nonmember


.sub 'optimize' :method
.annotate 'line', 6606
    getattribute $P4, self, 'left'
    $P3 = $P4.'optimize'()
    setattribute self, 'left', $P3
.annotate 'line', 6608
    $P1 = self.'search_nonmember'()
.annotate 'line', 6610
    isnull $I1, $P1
    if $I1 goto __label_3
.annotate 'line', 6612
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
.annotate 'line', 6616
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6613
    $P2 = $P1.'ismulti'()
    if_null $P2, __label_6
    unless $P2 goto __label_6
.annotate 'line', 6614
    new $P4, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'FunctionRef'($P5, $P6, $P1)
    set $P3, $P4
    .return($P3)
  __label_6: # endif
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 6617
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6619
    .return(self)
.annotate 'line', 6620

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
.annotate 'line', 6623
    getattribute $P1, self, 'left'
.annotate 'line', 6624
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 6625
    $P2 = $P1.'getName'()
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 6627
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6628
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
    push __ARG_1, $P2
.annotate 'line', 6629

.end # buildkey


.sub 'get_member' :method
.annotate 'line', 6632
    getattribute $P1, self, 'right'
    .return($P1)
.annotate 'line', 6633

.end # get_member


.sub '__emit_get_left' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 6636
    getattribute $P1, self, 'left'
.annotate 'line', 6637
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    eq $S1, 'P', __label_1
.annotate 'line', 6638
    WSubId_25("non-var at left of '.'", self)
  __label_1: # endif
.annotate 'line', 6639
    .tailcall $P1.'emit_get_nonull'(__ARG_1)
.annotate 'line', 6640

.end # __emit_get_left


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6643
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6644
    self.'annotate'(__ARG_1)
.annotate 'line', 6645
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
.annotate 'line', 6646

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6649
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6650
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6651
    .return($S1)
.annotate 'line', 6652

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6655
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6656
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6657
    self.'annotate'(__ARG_1)
.annotate 'line', 6658
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 6659

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6662
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6663
    null $S2
.annotate 'line', 6664
    ne __ARG_2, 'P', __label_2
.annotate 'line', 6666
    ne __ARG_3, 'null', __label_4
.annotate 'line', 6667
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 6668
    __ARG_1.'emitnull'(__ARG_3)
  __label_4: # endif
.annotate 'line', 6670
    set $S2, __ARG_3
    goto __label_3
  __label_2: # else
.annotate 'line', 6673
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 6674
    __ARG_1.'emitbox'($S2, __ARG_3)
  __label_3: # endif
.annotate 'line', 6676
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6677

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6680
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6681
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6682
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 6683
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
.annotate 'line', 6685
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 6686
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 6687
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 6689
    set $S2, $S3
  __label_7: # endif
  __label_4: # endif
.annotate 'line', 6691
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6692
    .return($S2)
.annotate 'line', 6693

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
.annotate 'line', 6704
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6705
    setattribute self, 'right', __ARG_4
.annotate 'line', 6706

.end # MemberRefExpr


.sub 'checkresult' :method
.annotate 'line', 6707
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6710
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 6711
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 6712
    .return(self)
.annotate 'line', 6713

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 6716
    getattribute $P1, self, 'left'
.annotate 'line', 6717
    getattribute $P2, self, 'right'
.annotate 'line', 6718
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 6719
    WSubId_70("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6720
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6721
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6722
    self.'annotate'(__ARG_1)
.annotate 'line', 6723
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
.annotate 'line', 6724

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 6727
    getattribute $P1, self, 'left'
.annotate 'line', 6728
    getattribute $P2, self, 'right'
.annotate 'line', 6729
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 6730
    WSubId_70("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6731
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6732
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6733
    null $S3
.annotate 'line', 6734
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    if_null $S5, __label_4
    length $I1, $S5
    ne $I1, 1, __label_4
    ord $I1, $S5
    if $I1 == 80 goto __label_6
    goto __label_4
  __label_6: # case
.annotate 'line', 6736
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 6738
    ne $S3, 'null', __label_7
.annotate 'line', 6739
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 6740
    __ARG_1.'emitnull'($S3)
  __label_7: # endif
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 6744
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 6745
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6746
    __ARG_1.'emitbox'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 6749
    self.'annotate'(__ARG_1)
.annotate 'line', 6750
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 6751
    .return($S3)
.annotate 'line', 6752

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 6699
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6701
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]

.sub 'StringIndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6763
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6764
    setattribute self, 'left', __ARG_3
.annotate 'line', 6765
    setattribute self, 'arg', __ARG_4
.annotate 'line', 6766

.end # StringIndexExpr


.sub 'checkresult' :method
.annotate 'line', 6769
    .return('S')
.annotate 'line', 6770

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 6773
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6774
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6775
    self.'annotate'(__ARG_1)
.annotate 'line', 6776
    $P1 = WSubId_45("    substr %0, %1, %2, 1", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P1)
.annotate 'line', 6778

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 6757
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6759
    addattribute $P0, 'left'
.annotate 'line', 6760
    addattribute $P0, 'arg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 6792
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6793
    setattribute self, 'left', __ARG_4
.annotate 'line', 6794
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
.annotate 'line', 6795

.end # IndexExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6798
    new $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6799
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 6800
    getattribute $P4, self, 'left'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'left', $P3
.annotate 'line', 6801
    getattribute $P4, self, 'args'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'args', $P3
.annotate 'line', 6802
    .return($P1)
.annotate 'line', 6803

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6806
    .return('P')
.annotate 'line', 6807

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_46 = "WSubId_46"
.annotate 'line', 6810
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 6811
    setattribute self, 'left', $P1
.annotate 'line', 6812
    getattribute $P2, self, 'args'
.annotate 'line', 6813
    $P2.'optimizeargs'()
.annotate 'line', 6815
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
.annotate 'line', 6817
    $P5 = $P2.'numargs'()
    set $I3, $P5
    eq $I3, 1, __label_5
.annotate 'line', 6818
    WSubId_25('Bad string index', self)
  __label_5: # endif
.annotate 'line', 6819
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6822
    $P6 = $P1.'isstringliteral'()
    unless $P6 goto __label_7
    $P6 = $P3.'isintegerliteral'()
  __label_7:
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 6823
    $P7 = $P3.'getIntegerValue'()
    set $I1, $P7
.annotate 'line', 6824
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_8
    set $S1, $P4
  __label_8:
.annotate 'line', 6825
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
.annotate 'line', 6826
    substr $S2, $S1, $I1, 1
.annotate 'line', 6825
    .tailcall WSubId_46($P4, $P5, $S2)
  __label_6: # endif
.annotate 'line', 6828
    new $P5, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'StringIndexExpr'($P6, $P7, $P1, $P3)
    set $P4, $P5
    .return($P4)
  __label_4: # case
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 6832
    WSubId_25("Type not valid for indexing", $P1)
  __label_2: # switch end
.annotate 'line', 6835
    .return(self)
.annotate 'line', 6836

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6839
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6840
    getattribute $P4, self, 'start'
    WSubId_30('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6841
    getattribute $P1, self, 'left'
.annotate 'line', 6842
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6843
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 6844
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 6842
    setattribute self, 'regleft', $P3
.annotate 'line', 6845
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
.annotate 'line', 6846

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 6849
    getattribute $P1, self, 'regleft'
.annotate 'line', 6850
    getattribute $P2, self, 'argregs'
.annotate 'line', 6851
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6852
    getattribute $P3, self, 'start'
    WSubId_30('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6853
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6854
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6855
    __ARG_1.'print'(']')
.annotate 'line', 6856

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6859
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6860
    self.'annotate'(__ARG_1)
.annotate 'line', 6861
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6862
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6863
    __ARG_1.'say'('')
.annotate 'line', 6864

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 6867
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6868
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6869
    .return($S1)
.annotate 'line', 6870

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 6873
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6874
    self.'annotate'(__ARG_1)
.annotate 'line', 6875
    __ARG_1.'print'('    ')
.annotate 'line', 6876
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6877
    __ARG_1.'say'(' = ', __ARG_3)
.annotate 'line', 6878

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6881
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6882
    null $S1
.annotate 'line', 6883
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 6884
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6885
    __ARG_1.'emitnull'($S1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6888
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6889
    self.'annotate'(__ARG_1)
.annotate 'line', 6890
    __ARG_1.'print'('    ')
.annotate 'line', 6891
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6892
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6893
    .return($S1)
.annotate 'line', 6894

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6783
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6785
    addattribute $P0, 'left'
.annotate 'line', 6786
    addattribute $P0, 'regleft'
.annotate 'line', 6787
    addattribute $P0, 'args'
.annotate 'line', 6788
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 6905
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6906
    $P1 = __ARG_1.'get'()
.annotate 'line', 6907
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6908
    __ARG_1.'unget'($P1)
.annotate 'line', 6909
    $P3 = WSubId_67(__ARG_1, __ARG_2, WSubId_68, ']')
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 6911

.end # ArrayExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 6914
    new $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6915
    getattribute $P8, self, 'start'
    $P1.'Expr'(__ARG_1, $P8)
.annotate 'line', 6916
    getattribute $P8, self, 'values'
    if_null $P8, __label_1
.annotate 'line', 6917
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
.annotate 'line', 6917
    setattribute $P1, 'values', $P8
  __label_1: # endif
.annotate 'line', 6918
    .return($P1)
.annotate 'line', 6919

.end # clone


.sub 'checkresult' :method
.annotate 'line', 6920
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6923
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
.annotate 'line', 6924
    .return(self)
.annotate 'line', 6925

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6928
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6929
    __ARG_1.'emitset'(__ARG_2, $S1)
.annotate 'line', 6930

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 6936
    self.'emit_init'(__ARG_1, '')
.annotate 'line', 6937

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6940
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6941
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6942
    .return($S1)
.annotate 'line', 6943

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 6946
    self.'annotate'(__ARG_1)
.annotate 'line', 6947
    getattribute $P1, self, 'values'
.annotate 'line', 6948
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 6949
    eq __ARG_2, '', __label_3
.annotate 'line', 6950
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6951
    le $I1, 0, __label_4
.annotate 'line', 6952
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 6954
    new $P4, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P4.'CollectValues'($P5, __ARG_1)
    set $P2, $P4
.annotate 'line', 6955
    null $I2
.annotate 'line', 6956
    if_null $P1, __label_6
    iter $P6, $P1
    set $P6, 0
  __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P3, $P6
.annotate 'line', 6957
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6958
    eq __ARG_2, '', __label_8
.annotate 'line', 6959
    self.'annotate'(__ARG_1)
.annotate 'line', 6960
    $P4 = WSubId_45("    %0[%1] = %2", __ARG_2, $I2, $S1)
    __ARG_1.'say'($P4)
.annotate 'line', 6961
    inc $I2
  __label_8: # endif
    goto __label_5
  __label_6: # endfor
.annotate 'line', 6964

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6899
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6901
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
.annotate 'line', 6976
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6977
    $P1 = __ARG_1.'get'()
.annotate 'line', 6978
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6979
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6980
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 6981
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6983
    $P4 = WSubId_68(__ARG_1, __ARG_2)
.annotate 'line', 6984
    WSubId_84(':', __ARG_1)
.annotate 'line', 6985
    $P5 = WSubId_68(__ARG_1, __ARG_2)
.annotate 'line', 6986
    push $P2, $P4
.annotate 'line', 6987
    push $P3, $P5
  __label_4: # continue
.annotate 'line', 6989
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6990
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6991
    WSubId_70("',' or '}'", $P1)
  __label_5: # endif
  __label_1: # endif
.annotate 'line', 6993
    setattribute self, 'keys', $P2
.annotate 'line', 6994
    setattribute self, 'values', $P3
.annotate 'line', 6995

.end # HashExpr


.sub 'checkresult' :method
.annotate 'line', 6996
    .return('P')

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 6999
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
.annotate 'line', 7000
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
.annotate 'line', 7001
    .return(self)
.annotate 'line', 7002

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7005
    self.'annotate'(__ARG_1)
.annotate 'line', 7010
    eq __ARG_2, '', __label_1
.annotate 'line', 7011
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 7013
    getattribute $P1, self, 'keys'
.annotate 'line', 7014
    getattribute $P2, self, 'values'
.annotate 'line', 7015
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
.annotate 'line', 7016
    set $I1, $P1
.annotate 'line', 7017
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 7018
    $P4 = $P1[$I2]
.annotate 'line', 7019
    null $S1
.annotate 'line', 7020
    $P5 = $P4.'isidentifier'()
    unless $P5 goto __label_7
    $P6 = $P4.'checkIdentifier'()
    set $S4, $P6
    iseq $I3, $S4, ''
    box $P5, $I3
  __label_7:
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 7021
    $P7 = $P4.'getName'()
    null $S2
    if_null $P7, __label_8
    set $S2, $P7
  __label_8:
.annotate 'line', 7022
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 7023
    __ARG_1.'emitget_hll_global'($S1, $S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 7026
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 7028
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 7029
    eq __ARG_2, '', __label_10
.annotate 'line', 7030
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_10: # endif
  __label_2: # for iteration
.annotate 'line', 7017
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 7032

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 7035
    self.'emit'(__ARG_1, '')
.annotate 'line', 7036

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 7039
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7040
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 7041
    .return($S1)
.annotate 'line', 7042

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6969
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6971
    addattribute $P0, 'keys'
.annotate 'line', 6972
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 7055
    .return('P')

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
.annotate 'line', 7060
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
.annotate 'line', 7061

.end # parseinitializer


.sub 'numargs' :method
.annotate 'line', 7064
    getattribute $P1, self, 'initializer'
.annotate 'line', 7065
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)
.annotate 'line', 7066

.end # numargs


.sub 'optimize_initializer' :method
.annotate 'line', 7069
    getattribute $P1, self, 'initializer'
.annotate 'line', 7070
    if_null $P1, __label_1
.annotate 'line', 7071
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7072

.end # optimize_initializer


.sub 'optimize' :method
.annotate 'line', 7075
    self.'optimize_initializer'()
.annotate 'line', 7076
    .return(self)
.annotate 'line', 7077

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 7080
    getattribute $P1, self, 'initializer'
.annotate 'line', 7081
    if_null $P1, __label_1
.annotate 'line', 7082
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 7083
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 7084
    if_null $P1, __label_2
.annotate 'line', 7085
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 7086
    __ARG_1.'say'(")")
.annotate 'line', 7087

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 7047
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7049
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'warn_class_unknown' :subid('WSubId_99')
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7094
    concat $S1, "class ", __ARG_2
    concat $S1, $S1, " not found at compile time"
    __ARG_1.'warn'($S1, __ARG_3)
.annotate 'line', 7095

.end # warn_class_unknown

.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7103
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7105
    $P2 = __ARG_4.'isstring'()
    if $P2 goto __label_2
    $P2 = __ARG_4.'isidentifier'()
  __label_2:
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7106
    WSubId_25("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 7107
    setattribute self, 'value', __ARG_4
.annotate 'line', 7108
    $P1 = __ARG_1.'get'()
.annotate 'line', 7110
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7111
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 7113
    __ARG_1.'unget'($P1)
  __label_4: # endif
.annotate 'line', 7114

.end # NewExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7117
    new $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 7118
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7119
    getattribute $P3, self, 'value'
    setattribute $P1, 'value', $P3
.annotate 'line', 7120
    getattribute $P2, self, 'initializer'
    if_null $P2, __label_1
.annotate 'line', 7121
    getattribute $P5, self, 'initializer'
    $P4 = $P5.'clone'(__ARG_1)
    setattribute $P1, 'initializer', $P4
  __label_1: # endif
.annotate 'line', 7122
    .return($P1)
.annotate 'line', 7123

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7126
    getattribute $P1, self, 'value'
.annotate 'line', 7127
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7130
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 7131
    isnull $I1, $P2
    not $I1
    box $P3, $I1
    unless $P3 goto __label_3
    $P3 = $P2.'isconst'()
  __label_3:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7132
    $P1 = $P2.'getvalue'()
.annotate 'line', 7133
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 7134
    WSubId_25('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 7135
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 7138
    self.'optimize_initializer'()
.annotate 'line', 7139
    .return(self)
.annotate 'line', 7140

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7143
    self.'annotate'(__ARG_1)
.annotate 'line', 7145
    getattribute $P1, self, 'initializer'
.annotate 'line', 7146
    getattribute $P2, self, 'value'
.annotate 'line', 7147
    $P8 = self.'numargs'()
    set $I1, $P8
.annotate 'line', 7150
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 7151
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 7153
    set $S1, ''
.annotate 'line', 7154
    set $S2, __ARG_2
.annotate 'line', 7155
    null $S3
    if $I1 == -1 goto __label_7
    if $I1 == 0 goto __label_8
    if $I1 == 1 goto __label_9
    goto __label_5
  __label_7: # case
  __label_8: # case
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 7161
    ne $I2, 1, __label_10
.annotate 'line', 7162
    not $I4, __ARG_3
    unless $I4 goto __label_12
.annotate 'line', 7163
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_12: # endif
    goto __label_11
  __label_10: # else
.annotate 'line', 7166
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 7167
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 7168
    concat $S5, ', ', $S1
    set $S1, $S5
  __label_11: # endif
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 7172
    eq $I2, 1, __label_13
.annotate 'line', 7173
    WSubId_25('Multiple init arguments not allowed here', self)
  __label_13: # endif
.annotate 'line', 7174
    not $I3, __ARG_3
    unless $I3 goto __label_14
.annotate 'line', 7175
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_14: # endif
  __label_6: # switch end
.annotate 'line', 7178
    ne $S2, '', __label_15
.annotate 'line', 7179
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
    if $I2 == 0 goto __label_18
    if $I2 == 1 goto __label_19
    goto __label_16
  __label_18: # case
.annotate 'line', 7184
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
  __label_20:
.annotate 'line', 7185
    get_class $P4, $S4
.annotate 'line', 7186
    unless_null $P4, __label_21
.annotate 'line', 7187
    WSubId_99(__ARG_1, $S4, $P2)
  __label_21: # endif
.annotate 'line', 7191
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 7192
    le $I1, 1, __label_22
.annotate 'line', 7193
    __ARG_1.'say'($S2, ".'", $P2, "'()")
  __label_22: # endif
    goto __label_17 # break
  __label_19: # case
.annotate 'line', 7197
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 7198
    unless_null $P5, __label_23
.annotate 'line', 7199
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 7200
    if_null $P6, __label_25
.annotate 'line', 7201
    $P7 = $P6.'getpath'()
.annotate 'line', 7202
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
    goto __label_26
  __label_25: # else
.annotate 'line', 7205
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 7206
    if_null $P5, __label_27
.annotate 'line', 7207
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_28
  __label_27: # else
.annotate 'line', 7209
    $P9 = $P2.'getidentifier'()
    WSubId_99(__ARG_1, $P9, $P2)
.annotate 'line', 7210
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
  __label_28: # endif
  __label_26: # endif
.annotate 'line', 7213
    set $S3, $P2
    goto __label_24
  __label_23: # else
.annotate 'line', 7217
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
  __label_24: # endif
    goto __label_17 # break
  __label_16: # default
.annotate 'line', 7221
    WSubId_30('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 7223
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isge $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
  __label_31:
  __label_30:
    unless $I3 goto __label_29
.annotate 'line', 7224
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 7225
    not $I3, __ARG_3
    unless $I3 goto __label_32
.annotate 'line', 7226
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_32: # endif
  __label_29: # endif
.annotate 'line', 7228

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 7097
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7099
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7239
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7240
    setattribute self, 'owner', __ARG_2
.annotate 'line', 7241
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
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

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7251
    null $S1
.annotate 'line', 7252
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
.annotate 'line', 7257
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 7258
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 7261
    WSubId_25('Multiple init arguments not allowed here', self)
  __label_2: # switch end
.annotate 'line', 7263
    getattribute $P2, self, 'nskey'
.annotate 'line', 7265
    __ARG_1.'print'('    ')
.annotate 'line', 7266
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 7267
    __ARG_1.'print'("root_")
  __label_6: # endif
.annotate 'line', 7268
    __ARG_1.'print'("new ", __ARG_2, ", ")
    null $P3
.annotate 'line', 7269
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 7270
    if_null $S1, __label_7
.annotate 'line', 7271
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
.annotate 'line', 7272
    __ARG_1.'say'()
.annotate 'line', 7273

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 7233
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7235
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7284
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 7285
    setattribute self, 'owner', __ARG_2
.annotate 'line', 7286
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
.annotate 'line', 7287
    setattribute self, 'nskey', $P1
.annotate 'line', 7288
    $P2 = __ARG_1.'get'()
.annotate 'line', 7289
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 7290
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 7292
    __ARG_1.'unget'($P2)
  __label_2: # endif
.annotate 'line', 7293

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7296
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 7297
    set $S1, __ARG_2
.annotate 'line', 7298
    le $I1, 0, __label_1
.annotate 'line', 7299
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 7300
    getattribute $P1, self, 'nskey'
.annotate 'line', 7302
    ne $S1, '', __label_2
.annotate 'line', 7303
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7305
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 7307
    lt $I1, 0, __label_3
.annotate 'line', 7308
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 7309
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 7310
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
.annotate 'line', 7312

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 7278
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 7280
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7319
    $P1 = __ARG_1.'get'()
.annotate 'line', 7322
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7326
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7329
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 7324
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 7325
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 7324
    .return($P3)
  __label_4: # case
.annotate 'line', 7328
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 7332
    $P2 = __ARG_1.'get'()
.annotate 'line', 7333
    __ARG_1.'unget'($P2)
.annotate 'line', 7334
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 7336
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_6: # endif
  __label_2: # default
.annotate 'line', 7341
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
.annotate 'line', 7343

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_92 = "WSubId_92"
.annotate 'line', 7354
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 7355
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 7356
    $P2 = WSubId_92(__ARG_4, self)
    setattribute self, 'checked', $P2
.annotate 'line', 7357

.end # OpInstanceOfExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7360
    new $P1, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 7361
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7362
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'lexpr', $P3
.annotate 'line', 7363
    getattribute $P4, self, 'checked'
    $P3 = $P4.'clone'(self)
    setattribute $P1, 'checked', $P3
.annotate 'line', 7364
    .return($P1)
.annotate 'line', 7365

.end # clone


.sub 'optimize' :method
.annotate 'line', 7368
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 7369
    .return(self)
.annotate 'line', 7370

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7371
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 7374
    getattribute $P1, self, 'lexpr'
.annotate 'line', 7375
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7376
    eq $S1, 'P', __label_2
.annotate 'line', 7377
    WSubId_25('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 7378
    getattribute $P2, self, 'checked'
.annotate 'line', 7380
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 7381
    self.'annotate'(__ARG_1)
.annotate 'line', 7382
    __ARG_1.'print'('    isa ', __ARG_2, ', ', $S2, ', ')
.annotate 'line', 7383
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 7384
    __ARG_1.'say'()
.annotate 'line', 7385

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 7347
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7349
    addattribute $P0, 'lexpr'
.annotate 'line', 7350
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 7398
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 7399
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 7400
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 7401
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 7402
    .return(self)
.annotate 'line', 7403

.end # OpConditionalExpr


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 7406
    new $P1, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 7407
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
.annotate 'line', 7408
    new $P4, [ 'Winxed'; 'Compiler'; 'Condition' ]
    getattribute $P7, self, 'condition'
    getattribute $P6, $P7, 'condexpr'
    $P5 = $P6.'clone'(__ARG_1)
    $P3 = $P4.'set'($P5)
    setattribute $P1, 'condition', $P3
.annotate 'line', 7409
    getattribute $P4, self, 'etrue'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'etrue', $P3
.annotate 'line', 7410
    getattribute $P4, self, 'efalse'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'efalse', $P3
.annotate 'line', 7411
    .return($P1)
.annotate 'line', 7412

.end # clone


.sub 'optimize' :method
.annotate 'line', 7415
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7416
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 7418
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 7420
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_1: # default
.annotate 'line', 7422
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 7423
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 7424
    .return(self)
  __label_2: # switch end
.annotate 'line', 7426

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7429
    getattribute $P1, self, 'etrue'
.annotate 'line', 7430
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7431
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 7433
    .tailcall $P1.'checkresult'()
  __label_2: # endif
.annotate 'line', 7434

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 7437
    getattribute $P1, self, 'owner'
.annotate 'line', 7438
    $P5 = $P1.'genlabel'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7439
    $P5 = $P1.'genlabel'()
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
  __label_2:
.annotate 'line', 7440
    getattribute $P5, self, 'condition'
    $P5.'emit_else'(__ARG_1, $S2)
.annotate 'line', 7441
    getattribute $P2, self, 'etrue'
.annotate 'line', 7442
    $P5 = self.'checkresult'()
    null $S3
    if_null $P5, __label_3
    set $S3, $P5
  __label_3:
.annotate 'line', 7443
    $P5 = $P2.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7444
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 7446
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 7447
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7448
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7449
    getattribute $P3, self, 'efalse'
.annotate 'line', 7450
    $P5 = $P3.'isnull'()
    if_null $P5, __label_6
    unless $P5 goto __label_6
.annotate 'line', 7451
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
.annotate 'line', 7453
    $P6 = $P3.'checkresult'()
    null $S4
    if_null $P6, __label_8
    set $S4, $P6
  __label_8:
.annotate 'line', 7454
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7455
    $P5 = $P3.'emit_get'(__ARG_1)
    null $S5
    if_null $P5, __label_12
    set $S5, $P5
  __label_12:
.annotate 'line', 7456
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
.annotate 'line', 7460
    ne $S4, 'P', __label_13
.annotate 'line', 7461
    $P4 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 7462
    __ARG_1.'emitset'(__ARG_2, $P4)
    goto __label_14
  __label_13: # else
.annotate 'line', 7465
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
  __label_10: # endif
  __label_7: # endif
.annotate 'line', 7468
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 7469

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 7472
    getattribute $P1, self, 'owner'
.annotate 'line', 7473
    $P2 = $P1.'genlabel'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7474
    $P2 = $P1.'genlabel'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7475
    getattribute $P2, self, 'condition'
    $P2.'emit_else'(__ARG_1, $S2)
.annotate 'line', 7476
    getattribute $P2, self, 'etrue'
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 7477
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7478
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7479
    getattribute $P2, self, 'efalse'
    $P2.'emit_void'(__ARG_1)
.annotate 'line', 7480
    __ARG_1.'emitlabel'($S1)
.annotate 'line', 7481

.end # emit_void

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 7390
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 7392
    addattribute $P0, 'condition'
.annotate 'line', 7393
    addattribute $P0, 'etrue'
.annotate 'line', 7394
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getOpCode_2' :subid('WSubId_102')
        .param pmc __ARG_1
.annotate 'line', 7527
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
.annotate 'line', 7528
    .return(1)
  __label_4: # case
.annotate 'line', 7529
    .return(2)
  __label_5: # case
.annotate 'line', 7530
    .return(3)
  __label_1: # default
.annotate 'line', 7531
    .return(0)
  __label_2: # switch end
.annotate 'line', 7533

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_104')
        .param pmc __ARG_1
.annotate 'line', 7537
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '-' goto __label_3
    if $S1 == '!' goto __label_4
    if $S1 == '~' goto __label_5
    if $S1 == '++' goto __label_6
    if $S1 == '--' goto __label_7
    goto __label_1
  __label_3: # case
.annotate 'line', 7538
    .return(8)
  __label_4: # case
.annotate 'line', 7539
    .return(11)
  __label_5: # case
.annotate 'line', 7540
    .return(34)
  __label_6: # case
.annotate 'line', 7541
    .return(9)
  __label_7: # case
.annotate 'line', 7542
    .return(10)
  __label_1: # default
.annotate 'line', 7544
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(32)
    goto __label_9
  __label_8: # else
.annotate 'line', 7545
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(33)
    goto __label_11
  __label_10: # else
.annotate 'line', 7546
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_2: # switch end
.annotate 'line', 7548

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_107')
        .param pmc __ARG_1
.annotate 'line', 7552
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '*' goto __label_3
    if $S1 == '/' goto __label_4
    if $S1 == '%' goto __label_5
    if $S1 == '%%' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7553
    .return(19)
  __label_4: # case
.annotate 'line', 7554
    .return(20)
  __label_5: # case
.annotate 'line', 7555
    .return(21)
  __label_6: # case
.annotate 'line', 7556
    .return(22)
  __label_1: # default
.annotate 'line', 7557
    .return(0)
  __label_2: # switch end
.annotate 'line', 7559

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_110')
        .param pmc __ARG_1
.annotate 'line', 7563
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<<' goto __label_3
    if $S1 == '>>' goto __label_4
    if $S1 == '>>>' goto __label_5
    goto __label_1
  __label_3: # case
.annotate 'line', 7564
    .return(28)
  __label_4: # case
.annotate 'line', 7565
    .return(29)
  __label_5: # case
.annotate 'line', 7566
    .return(30)
  __label_1: # default
.annotate 'line', 7567
    .return(0)
  __label_2: # switch end
.annotate 'line', 7569

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_112')
        .param pmc __ARG_1
.annotate 'line', 7573
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<' goto __label_3
    if $S1 == '>' goto __label_4
    if $S1 == '<=' goto __label_5
    if $S1 == '>=' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7574
    .return(14)
  __label_4: # case
.annotate 'line', 7575
    .return(16)
  __label_5: # case
.annotate 'line', 7576
    .return(15)
  __label_6: # case
.annotate 'line', 7577
    .return(17)
  __label_1: # default
.annotate 'line', 7579
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 7580
    .return(0)
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 7582

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_114')
        .param pmc __ARG_1
.annotate 'line', 7586
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '==' goto __label_3
    if $S1 == '!=' goto __label_4
    if $S1 == '===' goto __label_5
    if $S1 == '!==' goto __label_6
    goto __label_1
  __label_3: # case
.annotate 'line', 7587
    .return(12)
  __label_4: # case
.annotate 'line', 7588
    .return(13)
  __label_5: # case
.annotate 'line', 7589
    .return(25)
  __label_6: # case
.annotate 'line', 7590
    .return(26)
  __label_1: # default
.annotate 'line', 7591
    .return(0)
  __label_2: # switch end
.annotate 'line', 7593

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_123')
        .param pmc __ARG_1
.annotate 'line', 7597
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
.annotate 'line', 7598
    .return(4)
  __label_4: # case
.annotate 'line', 7599
    .return(5)
  __label_5: # case
.annotate 'line', 7600
    .return(6)
  __label_6: # case
.annotate 'line', 7601
    .return(18)
  __label_7: # case
.annotate 'line', 7602
    .return(23)
  __label_8: # case
.annotate 'line', 7603
    .return(24)
  __label_9: # case
.annotate 'line', 7604
    .return(31)
  __label_1: # default
.annotate 'line', 7605
    .return(0)
  __label_2: # switch end
.annotate 'line', 7607

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 7611
    $P1 = __ARG_1.'get'()
.annotate 'line', 7612
    null $P2
.annotate 'line', 7615
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 7619
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 7621
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 7623
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 7625
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 7627
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 7629
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 7631
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 7633
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 7635
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 7637
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 7616
    $P2 = WSubId_68(__ARG_1, __ARG_2)
.annotate 'line', 7617
    WSubId_84(')', __ARG_1)
.annotate 'line', 7618
    .return($P2)
  __label_4: # case
.annotate 'line', 7620
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 7622
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 7624
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 7626
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_44(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 7628
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 7630
    .tailcall WSubId_100(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 7632
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 7634
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 7636
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 7638
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 7640
    WSubId_70('expression', $P1)
  __label_1: # switch end
.annotate 'line', 7642

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7646
    $P1 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7647
    null $P2
.annotate 'line', 7648
    null $P3
.annotate 'line', 7649
    null $I1
  __label_2: # while
.annotate 'line', 7650
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_102($P2)
    set $I1, $P5
    unless $I1 goto __label_1
    if $I1 == 1 goto __label_5
    if $I1 == 2 goto __label_6
    if $I1 == 3 goto __label_7
    goto __label_3
  __label_5: # case
.annotate 'line', 7653
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7656
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7659
    set $P3, $P2
.annotate 'line', 7660
    $P2 = __ARG_1.'get'()
.annotate 'line', 7661
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
.annotate 'line', 7662
    $P4 = WSubId_101(__ARG_1, __ARG_2)
.annotate 'line', 7663
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
    goto __label_9
  __label_8: # else
.annotate 'line', 7666
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7669
    WSubId_30('Unexpected code in parseExpr_2')
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7672
    __ARG_1.'unget'($P2)
.annotate 'line', 7673
    .return($P1)
.annotate 'line', 7674

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_103 = "WSubId_103"
.annotate 'line', 7678
    $P1 = WSubId_103(__ARG_1, __ARG_2)
.annotate 'line', 7679
    $P2 = __ARG_1.'get'()
.annotate 'line', 7681
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 7683
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7682
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 7684
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 7686
    __ARG_1.'unget'($P2)
.annotate 'line', 7687
    .return($P1)
  __label_1: # switch end
.annotate 'line', 7689

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_106 = "WSubId_106"
.annotate 'line', 7693
    $P1 = __ARG_1.'get'()
.annotate 'line', 7694
    $P3 = WSubId_104($P1)
    set $I1, $P3
.annotate 'line', 7695
    unless $I1 goto __label_1
.annotate 'line', 7696
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
.annotate 'line', 7699
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 7701
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 7703
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 7705
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 7707
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 7709
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 7711
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_3: # default
.annotate 'line', 7713
    WSubId_30('Invalid code in parseExpr_4', $P1)
  __label_4: # switch end
    goto __label_2
  __label_1: # else
.annotate 'line', 7717
    __ARG_1.'unget'($P1)
.annotate 'line', 7718
    .tailcall WSubId_106(__ARG_1, __ARG_2)
  __label_2: # endif
.annotate 'line', 7720

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7724
    $P1 = WSubId_105(__ARG_1, __ARG_2)
.annotate 'line', 7725
    null $P2
.annotate 'line', 7726
    null $I1
  __label_2: # while
.annotate 'line', 7727
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_107($P2)
    set $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 7728
    $P3 = WSubId_105(__ARG_1, __ARG_2)
    if $I1 == 19 goto __label_5
    if $I1 == 20 goto __label_6
    if $I1 == 21 goto __label_7
    if $I1 == 22 goto __label_8
    goto __label_3
  __label_5: # case
.annotate 'line', 7731
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7734
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7737
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7740
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7743
    WSubId_30('Invalid code in parseExpr_5', $P2)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7746
    __ARG_1.'unget'($P2)
.annotate 'line', 7747
    .return($P1)
.annotate 'line', 7748

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_108 = "WSubId_108"
.annotate 'line', 7752
    $P1 = WSubId_108(__ARG_1, __ARG_2)
.annotate 'line', 7753
    null $P2
  __label_2: # while
.annotate 'line', 7754
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('+')
    if $P5 goto __label_3
    $P5 = $P2.'isop'('-')
  __label_3:
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7755
    $P3 = WSubId_108(__ARG_1, __ARG_2)
.annotate 'line', 7756
    null $P4
.annotate 'line', 7757
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 7758
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 7760
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 7761
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7763
    __ARG_1.'unget'($P2)
.annotate 'line', 7764
    .return($P1)
.annotate 'line', 7765

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7769
    $P1 = WSubId_109(__ARG_1, __ARG_2)
.annotate 'line', 7770
    null $P2
.annotate 'line', 7771
    null $P3
.annotate 'line', 7772
    null $I1
  __label_2: # while
.annotate 'line', 7773
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_110($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 28 goto __label_5
    if $I1 == 29 goto __label_6
    if $I1 == 30 goto __label_7
    goto __label_3
  __label_5: # case
.annotate 'line', 7776
    $P2 = WSubId_109(__ARG_1, __ARG_2)
.annotate 'line', 7777
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7780
    $P2 = WSubId_109(__ARG_1, __ARG_2)
.annotate 'line', 7781
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7784
    $P2 = WSubId_109(__ARG_1, __ARG_2)
.annotate 'line', 7785
    new $P7, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
    $P7.'OpShiftlrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7788
    WSubId_30('Invalid code in parseExpr_7', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7791
    __ARG_1.'unget'($P3)
.annotate 'line', 7792
    .return($P1)
.annotate 'line', 7793

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7797
    $P1 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7798
    null $P2
.annotate 'line', 7799
    null $P3
.annotate 'line', 7800
    null $I1
  __label_2: # while
.annotate 'line', 7801
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
.annotate 'line', 7804
    $P2 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7805
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7808
    $P2 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7809
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7812
    $P2 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7813
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7816
    $P2 = WSubId_111(__ARG_1, __ARG_2)
.annotate 'line', 7817
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 7820
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7823
    WSubId_30('Invalid code in parseExpr_9', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7826
    __ARG_1.'unget'($P3)
.annotate 'line', 7827
    .return($P1)
.annotate 'line', 7828

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_115')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7832
    $P1 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7833
    null $P2
.annotate 'line', 7834
    null $P3
.annotate 'line', 7835
    null $I1
  __label_2: # while
.annotate 'line', 7836
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
.annotate 'line', 7839
    $P2 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7840
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7843
    $P2 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7844
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7847
    $P2 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7848
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7851
    $P2 = WSubId_113(__ARG_1, __ARG_2)
.annotate 'line', 7852
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7855
    WSubId_30('Invalid code in parseExpr_8', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7858
    __ARG_1.'unget'($P3)
.annotate 'line', 7859
    .return($P1)
.annotate 'line', 7860

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_115 = "WSubId_115"
.annotate 'line', 7864
    $P1 = WSubId_115(__ARG_1, __ARG_2)
.annotate 'line', 7865
    null $P2
  __label_2: # while
.annotate 'line', 7866
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7867
    $P3 = WSubId_115(__ARG_1, __ARG_2)
.annotate 'line', 7868
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7870
    __ARG_1.'unget'($P2)
.annotate 'line', 7871
    .return($P1)
.annotate 'line', 7872

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_116 = "WSubId_116"
.annotate 'line', 7876
    $P1 = WSubId_116(__ARG_1, __ARG_2)
.annotate 'line', 7877
    null $P2
  __label_2: # while
.annotate 'line', 7878
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7879
    $P3 = WSubId_116(__ARG_1, __ARG_2)
.annotate 'line', 7880
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7882
    __ARG_1.'unget'($P2)
.annotate 'line', 7883
    .return($P1)
.annotate 'line', 7884

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_118')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_117 = "WSubId_117"
.annotate 'line', 7888
    $P1 = WSubId_117(__ARG_1, __ARG_2)
.annotate 'line', 7889
    null $P2
  __label_2: # while
.annotate 'line', 7890
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7891
    $P3 = WSubId_117(__ARG_1, __ARG_2)
.annotate 'line', 7892
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7894
    __ARG_1.'unget'($P2)
.annotate 'line', 7895
    .return($P1)
.annotate 'line', 7896

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_118 = "WSubId_118"
.annotate 'line', 7900
    $P1 = WSubId_118(__ARG_1, __ARG_2)
.annotate 'line', 7901
    null $P2
  __label_2: # while
.annotate 'line', 7902
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7903
    $P3 = WSubId_118(__ARG_1, __ARG_2)
.annotate 'line', 7904
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7906
    __ARG_1.'unget'($P2)
.annotate 'line', 7907
    .return($P1)
.annotate 'line', 7908

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_120')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_119 = "WSubId_119"
.const 'Sub' WSubId_118 = "WSubId_118"
.annotate 'line', 7912
    $P1 = WSubId_119(__ARG_1, __ARG_2)
.annotate 'line', 7913
    null $P2
  __label_2: # while
.annotate 'line', 7914
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7915
    $P3 = WSubId_118(__ARG_1, __ARG_2)
.annotate 'line', 7916
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7918
    __ARG_1.'unget'($P2)
.annotate 'line', 7919
    .return($P1)
.annotate 'line', 7920

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_122')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 7924
    $P1 = WSubId_120(__ARG_1, __ARG_2)
.annotate 'line', 7925
    $P2 = __ARG_1.'get'()
.annotate 'line', 7926
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7927
    $P3 = WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7928
    WSubId_84(':', __ARG_1)
.annotate 'line', 7929
    $P4 = WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7930
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 7933
    __ARG_1.'unget'($P2)
.annotate 'line', 7934
    .return($P1)
  __label_2: # endif
.annotate 'line', 7936

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_121')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_122 = "WSubId_122"
.const 'Sub' WSubId_123 = "WSubId_123"
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7940
    $P1 = WSubId_122(__ARG_1, __ARG_2)
.annotate 'line', 7941
    null $P2
.annotate 'line', 7942
    null $I1
  __label_2: # while
.annotate 'line', 7943
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_123($P2)
    set $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 7944
    $P3 = WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7945
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
.annotate 'line', 7948
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_4 # break
  __label_6: # case
.annotate 'line', 7951
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 7954
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 7957
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 7960
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_4 # break
  __label_10: # case
.annotate 'line', 7963
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_4 # break
  __label_11: # case
.annotate 'line', 7966
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 7969
    WSubId_30('Unexpected code in parseExpr_16', $P2)
  __label_4: # switch end
.annotate 'line', 7971
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7972
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7974
    __ARG_1.'unget'($P2)
.annotate 'line', 7975
    .return($P1)
.annotate 'line', 7976

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_121 = "WSubId_121"
.annotate 'line', 7980
    .tailcall WSubId_121(__ARG_1, __ARG_2)
.annotate 'line', 7981

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 7996
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7997
    WSubId_30('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7998
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7999
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 8000
    .return($S1)
.annotate 'line', 8001

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 8004
    getattribute $P1, self, 'brlabel'
.annotate 'line', 8005
    unless_null $P1, __label_1
.annotate 'line', 8006
    WSubId_30('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 8007
    .return($P1)
.annotate 'line', 8008

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7992
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 8017
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 8018
    WSubId_30('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 8019
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 8020
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 8021
    .return($S1)
.annotate 'line', 8022

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 8025
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 8026
    unless_null $P1, __label_1
.annotate 'line', 8027
    WSubId_30('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 8028
    .return($P1)
.annotate 'line', 8029

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 8011
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 8013
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8045
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8046
    $P1 = __ARG_2.'get'()
.annotate 'line', 8047
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8048
    __ARG_2.'unget'($P1)
.annotate 'line', 8049
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
  __label_1: # endif
.annotate 'line', 8051

.end # parse


.sub 'optimize' :method
.annotate 'line', 8054
    getattribute $P1, self, 'values'
.annotate 'line', 8055
    if_null $P1, __label_1
.annotate 'line', 8056
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 8057
    .return(self)
.annotate 'line', 8058

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8062
    getattribute $P1, self, 'values'
.annotate 'line', 8063
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 8066
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
.annotate 'line', 8067
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 8068
    $P3 = $P2.'cantailcall'()
    unless $P3 goto __label_6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'allowtailcall'()
  __label_6:
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 8069
    self.'annotate'(__ARG_1)
.annotate 'line', 8070
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 8074
    le $I1, 0, __label_7
.annotate 'line', 8075
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 8077
    self.'annotate'(__ARG_1)
.annotate 'line', 8078
    self.'emitret'(__ARG_1)
.annotate 'line', 8079
    le $I1, 0, __label_8
.annotate 'line', 8080
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 8081
    __ARG_1.'say'(')')
.annotate 'line', 8082

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 8039
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8041
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8089
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8090

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 8093
    __ARG_1.'print'('    ', '.return(')
.annotate 'line', 8094

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 8085
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8101
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8102

.end # YieldStatement


.sub 'clone' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 8105
    WSubId_25("inlined yield not allowed", self)
.annotate 'line', 8106

.end # clone


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 8109
    __ARG_1.'print'('    ', '.yield(')
.annotate 'line', 8110

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 8097
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]

.sub 'InlineReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8118
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8119
    $P1 = __ARG_2.'get'()
.annotate 'line', 8120
    __ARG_2.'unget'($P1)
.annotate 'line', 8121
    $P2 = $P1.'isop'(";")
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8122
    $P4 = WSubId_68(__ARG_2, __ARG_3)
    setattribute self, 'expr', $P4
  __label_1: # endif
.annotate 'line', 8123

.end # InlineReturnStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8126
    new $P1, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
.annotate 'line', 8127
    getattribute $P3, self, 'start'
    $P1.'Statement'($P3, __ARG_1)
.annotate 'line', 8128
    getattribute $P2, self, 'expr'
.annotate 'line', 8129
    if_null $P2, __label_1
.annotate 'line', 8130
    $P4 = $P2.'clone'(__ARG_1)
    setattribute $P1, 'expr', $P4
  __label_1: # endif
.annotate 'line', 8131
    .return($P1)
.annotate 'line', 8132

.end # clone


.sub 'optimize' :method
.annotate 'line', 8135
    getattribute $P1, self, 'expr'
.annotate 'line', 8136
    if_null $P1, __label_1
.annotate 'line', 8137
    $P3 = $P1.'optimize'()
    setattribute self, 'expr', $P3
  __label_1: # endif
.annotate 'line', 8138
    .return(self)
.annotate 'line', 8139

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8142
    getattribute $P4, self, 'owner'
    $P1 = $P4.'getouter'()
.annotate 'line', 8143
    getattribute $P2, self, 'expr'
.annotate 'line', 8144
    $P4 = $P1.'getrettype'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8145
    self.'annotate'(__ARG_1)
.annotate 'line', 8146
    if_null $P2, __label_2
.annotate 'line', 8147
    $P3 = $P1.'getretreg'()
.annotate 'line', 8148
    unless_null $P3, __label_3
.annotate 'line', 8149
    $P2.'emit_void'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 8151
    $P4 = $P2.'isnull'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 8152
    __ARG_1.'emitnull'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 8154
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_7
    set $S2, $P5
  __label_7:
.annotate 'line', 8155
    ne $S2, $S1, __label_8
.annotate 'line', 8156
    $P2.'emit'(__ARG_1, $P3)
    goto __label_9
  __label_8: # else
.annotate 'line', 8158
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P4, __label_10
    set $S3, $P4
  __label_10:
.annotate 'line', 8159
    self.'annotate'(__ARG_1)
.annotate 'line', 8160
    ne $S1, 'P', __label_11
.annotate 'line', 8161
    __ARG_1.'emitbox'($P3, $S3)
    goto __label_12
  __label_11: # else
.annotate 'line', 8163
    __ARG_1.'emitset'($P3, $S3)
  __label_12: # endif
  __label_9: # endif
  __label_6: # endif
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 8168
    $P4 = $P1.'getendlabel'()
    null $S4
    if_null $P4, __label_13
    set $S4, $P4
  __label_13:
.annotate 'line', 8169
    self.'annotate'(__ARG_1)
.annotate 'line', 8170
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8171

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
.annotate 'line', 8113
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8115
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseReturn' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8176
    $P1 = __ARG_3.'getouter'()
.annotate 'line', 8177
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    unless $I1 goto __label_1
.annotate 'line', 8178
    new $P3, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
    $P3.'InlineReturnStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8180
    new $P5, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P5.'ReturnStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 8181

.end # parseReturn

.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8193
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8194
    setattribute self, 'name', __ARG_1
.annotate 'line', 8195
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
.annotate 'line', 8196

.end # LabelStatement


.sub 'optimize' :method
.annotate 'line', 8197
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8200
    self.'annotate'(__ARG_1)
.annotate 'line', 8201
    getattribute $P1, self, 'value'
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
.annotate 'line', 8202

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 8187
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8189
    addattribute $P0, 'name'
.annotate 'line', 8190
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 8216
    setattribute self, 'owner', __ARG_1
.annotate 'line', 8217
    box $P1, __ARG_2
    setattribute self, 'label', $P1
.annotate 'line', 8218

.end # Reflabel


.sub 'optimize' :method
.annotate 'line', 8219
    .return(self)

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 8222
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8223
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8224
    .return($S2)
.annotate 'line', 8225

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 8211
    addattribute $P0, 'owner'
.annotate 'line', 8212
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 8238
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8239
    $P1 = __ARG_2.'get'()
.annotate 'line', 8240
    WSubId_124($P1)
.annotate 'line', 8241
    setattribute self, 'label', $P1
.annotate 'line', 8242
    WSubId_84(';', __ARG_2)
.annotate 'line', 8243

.end # GotoStatement


.sub 'optimize' :method
.annotate 'line', 8244
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8247
    self.'annotate'(__ARG_1)
.annotate 'line', 8248
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8249
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8250
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
.annotate 'line', 8251

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 8232
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8234
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8262
    $P1 = WSubId_68(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 8263

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 8266
    WSubId_84('(', __ARG_1)
.annotate 'line', 8267
    $P1 = WSubId_68(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 8268
    WSubId_84(')', __ARG_1)
.annotate 'line', 8269

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 8258
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
.annotate 'line', 8282
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8283
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8284
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 8285
    $P1 = __ARG_2.'get'()
.annotate 'line', 8286
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8287
    $P4 = WSubId_125(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8289
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 8290
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8292

.end # IfStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8295
    new $P1, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 8296
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8297
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8298
    getattribute $P4, self, 'truebranch'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'truebranch', $P3
.annotate 'line', 8299
    getattribute $P4, self, 'falsebranch'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'falsebranch', $P3
.annotate 'line', 8300
    .return($P1)
.annotate 'line', 8301

.end # clone


.sub 'optimize' :method
.annotate 'line', 8304
    self.'optimize_condition'()
.annotate 'line', 8305
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 8306
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 8307
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 8309
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 8311
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_1: # default
  __label_2: # switch end
.annotate 'line', 8313
    .return(self)
.annotate 'line', 8314

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8317
    getattribute $P1, self, 'truebranch'
.annotate 'line', 8318
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 8319
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 8320
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 8321
    set $S1, ''
.annotate 'line', 8322
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 8323
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8324
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8325
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 8326
    self.'annotate'(__ARG_1)
.annotate 'line', 8327
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 8328
    $P1.'emit'(__ARG_1)
.annotate 'line', 8330
    not $I3, $I2
    unless $I3 goto __label_5
.annotate 'line', 8331
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8332
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 8333
    $P2.'emit'(__ARG_1)
  __label_5: # endif
.annotate 'line', 8335
    __ARG_1.'emitlabel'($S2, 'endif')
.annotate 'line', 8336

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 8276
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 8278
    addattribute $P0, 'truebranch'
.annotate 'line', 8279
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 8348
    $P2 = WSubId_125(__ARG_1, self)
    setattribute self, 'body', $P2
.annotate 'line', 8349

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
.annotate 'line', 8352
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8353
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8355
    self.'annotate'(__ARG_1)
.annotate 'line', 8356
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 8357
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8358
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8359
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
.annotate 'line', 8360

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 8343
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 8345
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8371
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8372
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8373
    self.'parsebody'(__ARG_2)
.annotate 'line', 8374

.end # WhileStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8377
    new $P1, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 8378
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8379
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8380
    getattribute $P4, self, 'body'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'body', $P3
.annotate 'line', 8381
    .return($P1)
.annotate 'line', 8382

.end # clone


.sub 'optimize' :method
.annotate 'line', 8385
    self.'optimize_condition'()
.annotate 'line', 8386
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8387
    .return(self)
.annotate 'line', 8388

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8391
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
.annotate 'line', 8393
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 8396
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 8397
    __ARG_1.'comment'('while(false) optimized out')
  __label_5: # endif
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 8400
    $P3 = self.'genbreaklabel'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8401
    $P4 = self.'gencontinuelabel'()
    null $S2
    if_null $P4, __label_7
    set $S2, $P4
  __label_7:
.annotate 'line', 8403
    self.'annotate'(__ARG_1)
.annotate 'line', 8404
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 8405
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 8406
    getattribute $P5, self, 'body'
    $P5.'emit'(__ARG_1)
.annotate 'line', 8407
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 8408
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_2: # switch end
.annotate 'line', 8410

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 8367
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
.annotate 'line', 8421
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8422
    self.'parsebody'(__ARG_2)
.annotate 'line', 8423
    WSubId_126('while', __ARG_2)
.annotate 'line', 8424
    self.'parsecondition'(__ARG_2)
.annotate 'line', 8425

.end # DoStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8428
    new $P1, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 8429
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8430
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condexpr', $P3
.annotate 'line', 8431
    getattribute $P4, self, 'body'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'body', $P3
.annotate 'line', 8432
    .return($P1)
.annotate 'line', 8433

.end # clone


.sub 'optimize' :method
.annotate 'line', 8436
    self.'optimize_condition'()
.annotate 'line', 8437
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 8438
    $P2 = $P1.'isempty'()
    unless $P2 goto __label_2
    $P3 = self.'getvalue'()
    set $I2, $P3
    iseq $I1, $I2, 2
    box $P2, $I1
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8439
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8440
    setattribute self, 'body', $P1
.annotate 'line', 8441
    .return(self)
.annotate 'line', 8442

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8445
    getattribute $P1, self, 'body'
.annotate 'line', 8446
    $P2 = self.'getvalue'()
    set $I1, $P2
    if $I1 == 1 goto __label_3
    goto __label_1
  __label_3: # case
.annotate 'line', 8449
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 8452
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 8453
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 8454
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 8456
    self.'annotate'(__ARG_1)
.annotate 'line', 8457
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 8459
    $P1.'emit'(__ARG_1)
.annotate 'line', 8460
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 8461
    eq $I1, 2, __label_7
.annotate 'line', 8462
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 8463
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_2: # switch end
.annotate 'line', 8465

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 8417
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
.annotate 'line', 8476
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8477
    WSubId_84(';', __ARG_2)
.annotate 'line', 8478

.end # ContinueStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8481
    new $P1, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 8482
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8483
    .return($P1)
.annotate 'line', 8484

.end # clone


.sub 'optimize' :method
.annotate 'line', 8485
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8488
    self.'annotate'(__ARG_1)
.annotate 'line', 8489
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8490
    __ARG_1.'emitgoto'($S1, 'continue')
.annotate 'line', 8491

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 8472
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 8502
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8503
    WSubId_84(';', __ARG_2)
.annotate 'line', 8504

.end # BreakStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8507
    new $P1, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 8508
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 8509
    .return($P1)
.annotate 'line', 8510

.end # clone


.sub 'optimize' :method
.annotate 'line', 8511
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8514
    self.'annotate'(__ARG_1)
.annotate 'line', 8515
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8516
    __ARG_1.'emitgoto'($S1, 'break')
.annotate 'line', 8517

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 8498
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8532
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8533
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 8534
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 8535
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
.annotate 'line', 8536

.end # SwitchBaseStatement


.sub 'cloneswitchto' :subid('WSubId_11') :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8537
.lex '__WLEX_1', __ARG_2
.const 'Sub' WSubId_12 = "WSubId_12"
.annotate 'line', 8539
    getattribute $P17, self, 'start'
    __ARG_1.'Statement'($P17, __ARG_2)
.annotate 'line', 8540
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
.annotate 'line', 8540
    setattribute __ARG_1, 'case_value', $P17
.annotate 'line', 8541
    getattribute $P7, self, 'case_st'
    root_new $P8, ['parrot';'ResizablePMCArray']
.annotate 'line', 8542
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
.annotate 'line', 8541
    setattribute __ARG_1, 'case_st', $P17
.annotate 'line', 8543
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
.annotate 'line', 8543
    setattribute __ARG_1, 'default_st', $P17
.annotate 'line', 8544
    .return(__ARG_1)
.annotate 'line', 8545

.end # cloneswitchto


.sub '' :anon :subid('WSubId_12') :outer('WSubId_11')
        .param pmc __ARG_3
.annotate 'line', 8542
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
.annotate 'line', 8542
    .return($P9)

.end # WSubId_12


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_125 = "WSubId_125"
.annotate 'line', 8548
    null $P1
  __label_2: # while
.annotate 'line', 8549
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'iskeyword'('case')
    if $P3 goto __label_3
    $P3 = $P1.'iskeyword'('default')
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 8550
    $P4 = $P1.'iskeyword'('case')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8551
    getattribute $P5, self, 'case_value'
    $P6 = WSubId_68(__ARG_1, self)
    push $P5, $P6
.annotate 'line', 8552
    $P1 = __ARG_1.'get'()
.annotate 'line', 8553
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 8554
    WSubId_70("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 8555
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 8556
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
.annotate 'line', 8557
    __ARG_1.'unget'($P1)
.annotate 'line', 8558
    $P3 = WSubId_125(__ARG_1, self)
    push $P2, $P3
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 8560
    getattribute $P3, self, 'case_st'
    push $P3, $P2
.annotate 'line', 8561
    __ARG_1.'unget'($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8564
    $P1 = __ARG_1.'get'()
.annotate 'line', 8565
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 8566
    WSubId_70("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 8567
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
.annotate 'line', 8568
    __ARG_1.'unget'($P1)
.annotate 'line', 8569
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_125(__ARG_1, self)
    push $P3, $P4
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 8571
    __ARG_1.'unget'($P1)
  __label_5: # endif
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8574
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 8575
    WSubId_70("'}' in switch", $P1)
  __label_16: # endif
.annotate 'line', 8576

.end # parse_cases


.sub 'optimize_cases' :method
.annotate 'line', 8579
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
.annotate 'line', 8581
    getattribute $P5, self, 'case_st'
    if_null $P5, __label_8
    iter $P7, $P5
    set $P7, 0
  __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P1, $P7
.annotate 'line', 8582
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
.annotate 'line', 8583
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
.annotate 'line', 8584

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 8524
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 8526
    addattribute $P0, 'case_value'
.annotate 'line', 8527
    addattribute $P0, 'case_st'
.annotate 'line', 8528
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 8597
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8598
    $P3 = WSubId_68(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 8599
    $P1 = __ARG_2.'get'()
.annotate 'line', 8600
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8601
    WSubId_70("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 8602
    $P1 = __ARG_2.'get'()
.annotate 'line', 8603
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 8604
    WSubId_70("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 8605
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8606

.end # SwitchStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8609
    new $P2, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P1 = self.'cloneswitchto'($P2, __ARG_1)
.annotate 'line', 8610
    getattribute $P4, self, 'condition'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condition', $P3
.annotate 'line', 8611
    .return($P1)
.annotate 'line', 8612

.end # clone


.sub 'optimize' :method
.annotate 'line', 8615
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 8616
    self.'optimize_cases'()
.annotate 'line', 8617
    .return(self)
.annotate 'line', 8618

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 8624
    set $S1, ''
.annotate 'line', 8625
    getattribute $P19, self, 'case_value'
    if_null $P19, __label_2
    iter $P20, $P19
    set $P20, 0
  __label_1: # for iteration
    unless $P20 goto __label_2
    shift $P1, $P20
.annotate 'line', 8626
    $P21 = $P1.'checkresult'()
    null $S2
    if_null $P21, __label_3
    set $S2, $P21
  __label_3:
.annotate 'line', 8627
    ne $S2, 'N', __label_4
.annotate 'line', 8628
    WSubId_25("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 8629
    ne $S2, 'S', __label_5
.annotate 'line', 8630
    iseq $I4, $S1, ''
    if $I4 goto __label_7
    iseq $I4, $S1, 'char'
  __label_7:
    unless $I4 goto __label_6
.annotate 'line', 8632
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
.annotate 'line', 8633
    set $S2, 'char'
    goto __label_9
  __label_8: # else
.annotate 'line', 8635
    set $S1, 'S'
  __label_9: # endif
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 8638
    ne $S1, '', __label_11
.annotate 'line', 8639
    set $S1, $S2
    goto __label_12
  __label_11: # else
.annotate 'line', 8640
    eq $S1, $S2, __label_13
.annotate 'line', 8641
    set $S1, 'P'
  __label_13: # endif
  __label_12: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8644
    getattribute $P2, self, 'condition'
.annotate 'line', 8645
    $P3 = $P2.'checkresult'()
.annotate 'line', 8649
    ne $S1, '', __label_14
.annotate 'line', 8650
    set $S1, $P3
  __label_14: # endif
.annotate 'line', 8652
    $P19 = __ARG_1.'getDebug'()
    if_null $P19, __label_15
    unless $P19 goto __label_15
.annotate 'line', 8653
    __ARG_1.'comment'('switch')
  __label_15: # endif
.annotate 'line', 8654
    $P19 = self.'genlabel'()
    null $S3
    if_null $P19, __label_16
    set $S3, $P19
  __label_16:
.annotate 'line', 8655
    null $S4
.annotate 'line', 8656
    ne $S1, 'char', __label_17
.annotate 'line', 8657
    isa $I4, $P2, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    unless $I4 goto __label_21
.annotate 'line', 8658
    getattribute $P21, $P2, 'builtin'
    $P19 = $P21.'name'()
    set $S11, $P19
    iseq $I4, $S11, "chr"
  __label_21:
    unless $I4 goto __label_19
.annotate 'line', 8659
    getattribute $P4, $P2, 'args'
.annotate 'line', 8660
    $P19 = $P4[0]
    getattribute $P5, $P19, 'arg'
.annotate 'line', 8661
    $P19 = $P5.'emit_getint'(__ARG_1)
    set $S4, $P19
    goto __label_20
  __label_19: # else
.annotate 'line', 8664
    null $S5
.annotate 'line', 8665
    set $S11, $P3
    eq $S11, 'S', __label_22
.annotate 'line', 8666
    $P19 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P19, __label_24
    set $S6, $P19
  __label_24:
.annotate 'line', 8667
    $P19 = self.'tempreg'('S')
    set $S5, $P19
.annotate 'line', 8668
    __ARG_1.'emitset'($S5, $S6)
    goto __label_23
  __label_22: # else
.annotate 'line', 8671
    $P19 = $P2.'emit_get'(__ARG_1)
    set $S5, $P19
  __label_23: # endif
.annotate 'line', 8672
    __ARG_1.'emitif_null'($S5, $S3)
.annotate 'line', 8673
    $P19 = self.'tempreg'('I')
    set $S4, $P19
.annotate 'line', 8674
    __ARG_1.'emitarg2'('length', $S4, $S5)
.annotate 'line', 8675
    __ARG_1.'emitarg3'('ne', $S4, "1", $S3)
.annotate 'line', 8676
    __ARG_1.'emitarg2'('ord', $S4, $S5)
  __label_20: # endif
    goto __label_18
  __label_17: # else
.annotate 'line', 8679
    set $S11, $P3
    ne $S11, $S1, __label_25
.annotate 'line', 8680
    $P19 = $P2.'emit_get'(__ARG_1)
    set $S4, $P19
    goto __label_26
  __label_25: # else
.annotate 'line', 8682
    $P21 = self.'tempreg'($S1)
    set $S4, $P21
.annotate 'line', 8683
    $P19 = $P2.'emit_get'(__ARG_1)
    null $S7
    if_null $P19, __label_27
    set $S7, $P19
  __label_27:
.annotate 'line', 8684
    __ARG_1.'emitset'($S4, $S7)
  __label_26: # endif
  __label_18: # endif
.annotate 'line', 8688
    self.'genbreaklabel'()
.annotate 'line', 8689
    new $P6, ['ResizableStringArray']
.annotate 'line', 8690
    null $S8
.annotate 'line', 8691
    eq $S1, 'char', __label_28
.annotate 'line', 8692
    self.'tempreg'($S1)
  __label_28: # endif
.annotate 'line', 8693
    getattribute $P19, self, 'case_value'
    if_null $P19, __label_30
    iter $P22, $P19
    set $P22, 0
  __label_29: # for iteration
    unless $P22 goto __label_30
    shift $P7, $P22
.annotate 'line', 8694
    $P21 = self.'genlabel'()
    null $S9
    if_null $P21, __label_31
    set $S9, $P21
  __label_31:
.annotate 'line', 8695
    push $P6, $S9
.annotate 'line', 8696
    null $S10
.annotate 'line', 8697
    ne $S1, 'I', __label_32
.annotate 'line', 8698
    $P19 = $P7.'emit_getint'(__ARG_1)
    set $S10, $P19
    goto __label_33
  __label_32: # else
.annotate 'line', 8699
    ne $S1, 'char', __label_34
.annotate 'line', 8700
    $P21 = WSubId_47($P7)
    set $S11, $P21
    ord $I1, $S11
.annotate 'line', 8701
    set $S10, $I1
    goto __label_35
  __label_34: # else
.annotate 'line', 8703
    $P19 = $P7.'checkresult'()
    set $S11, $P19
    ne $S1, $S11, __label_36
.annotate 'line', 8704
    $P21 = $P7.'emit_get'(__ARG_1)
    set $S10, $P21
    goto __label_37
  __label_36: # else
.annotate 'line', 8706
    $P7.'emit'(__ARG_1, $S8)
.annotate 'line', 8707
    set $S10, $S8
  __label_37: # endif
  __label_35: # endif
  __label_33: # endif
.annotate 'line', 8709
    $P19 = WSubId_45("    if %0 == %1 goto %2", $S4, $S10, $S9)
    __ARG_1.'say'($P19)
    goto __label_29
  __label_30: # endfor
.annotate 'line', 8711
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8714
    self.'annotate'(__ARG_1)
.annotate 'line', 8715
    getattribute $P8, self, 'case_st'
.annotate 'line', 8716
    set $I2, $P8
.annotate 'line', 8717
    null $I3
  __label_40: # for condition
    ge $I3, $I2, __label_39
.annotate 'line', 8718
    $P19 = $P6[$I3]
    __ARG_1.'emitlabel'($P19, 'case')
.annotate 'line', 8719
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
.annotate 'line', 8717
    inc $I3
    goto __label_40
  __label_39: # for end
.annotate 'line', 8722
    __ARG_1.'emitlabel'($S3, 'default')
.annotate 'line', 8723
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
.annotate 'line', 8725
    getattribute $P21, self, 'start'
    $P19 = self.'getbreaklabel'($P21)
    __ARG_1.'emitlabel'($P19, 'switch end')
.annotate 'line', 8726

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 8591
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8593
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8738
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8739
    self.'parse_cases'(__ARG_2)
.annotate 'line', 8740

.end # SwitchCaseStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8743
    new $P1, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    .tailcall self.'cloneswitchto'($P1, __ARG_1)
.annotate 'line', 8744

.end # clone


.sub 'optimize' :method
.annotate 'line', 8747
    self.'optimize_cases'()
.annotate 'line', 8748
    .return(self)
.annotate 'line', 8749

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8753
    self.'genbreaklabel'()
.annotate 'line', 8754
    $P14 = self.'genlabel'()
    null $S1
    if_null $P14, __label_1
    set $S1, $P14
  __label_1:
.annotate 'line', 8755
    new $P1, ['ResizableStringArray']
.annotate 'line', 8757
    $P14 = __ARG_1.'getDebug'()
    if_null $P14, __label_2
    unless $P14 goto __label_2
.annotate 'line', 8758
    __ARG_1.'comment'('switch-case')
  __label_2: # endif
.annotate 'line', 8759
    $P14 = self.'tempreg'('I')
    null $S2
    if_null $P14, __label_3
    set $S2, $P14
  __label_3:
.annotate 'line', 8760
    getattribute $P14, self, 'case_value'
    if_null $P14, __label_5
    iter $P15, $P14
    set $P15, 0
  __label_4: # for iteration
    unless $P15 goto __label_5
    shift $P2, $P15
.annotate 'line', 8761
    $P16 = self.'genlabel'()
    null $S3
    if_null $P16, __label_6
    set $S3, $P16
  __label_6:
.annotate 'line', 8762
    push $P1, $S3
.annotate 'line', 8763
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 8764
    __ARG_1.'emitif'($S2, $S3)
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8766
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 8769
    self.'annotate'(__ARG_1)
.annotate 'line', 8770
    getattribute $P3, self, 'case_st'
.annotate 'line', 8771
    set $I1, $P3
.annotate 'line', 8772
    null $I2
  __label_9: # for condition
    ge $I2, $I1, __label_8
.annotate 'line', 8773
    $P14 = $P1[$I2]
    __ARG_1.'emitlabel'($P14, 'case')
.annotate 'line', 8774
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
.annotate 'line', 8772
    inc $I2
    goto __label_9
  __label_8: # for end
.annotate 'line', 8777
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 8778
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
.annotate 'line', 8780
    getattribute $P16, self, 'start'
    $P14 = self.'getbreaklabel'($P16)
    __ARG_1.'emitlabel'($P14, 'switch end')
.annotate 'line', 8781

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 8733
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.annotate 'line', 8788
    $P1 = __ARG_2.'get'()
.annotate 'line', 8789
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8790
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8791
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8792
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8793
    WSubId_70("'(' in switch", $P1)
.annotate 'line', 8794

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
.annotate 'line', 8807
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8808
    $P1 = __ARG_2.'get'()
.annotate 'line', 8809
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8810
    __ARG_2.'unget'($P1)
.annotate 'line', 8811
    $P4 = WSubId_125(__ARG_2, self)
    setattribute self, 'initializer', $P4
  __label_1: # endif
.annotate 'line', 8813
    $P1 = __ARG_2.'get'()
.annotate 'line', 8814
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 8815
    __ARG_2.'unget'($P1)
.annotate 'line', 8816
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 8817
    WSubId_84(';', __ARG_2)
  __label_2: # endif
.annotate 'line', 8819
    $P1 = __ARG_2.'get'()
.annotate 'line', 8820
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 8821
    __ARG_2.'unget'($P1)
.annotate 'line', 8822
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_4: # do
.annotate 'line', 8824
    $P3 = WSubId_68(__ARG_2, self)
    push $P2, $P3
  __label_6: # continue
.annotate 'line', 8825
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_5
    if $P3 goto __label_4
  __label_5: # enddo
.annotate 'line', 8826
    setattribute self, 'iteration', $P2
.annotate 'line', 8827
    WSubId_28(')', $P1)
  __label_3: # endif
.annotate 'line', 8829
    self.'parsebody'(__ARG_2)
.annotate 'line', 8830

.end # ForStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8833
    new $P1, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8834
    getattribute $P8, self, 'start'
    $P1.'BlockStatement'($P8, __ARG_1)
.annotate 'line', 8835
    getattribute $P8, self, 'initializer'
    if_null $P8, __label_1
.annotate 'line', 8836
    getattribute $P11, self, 'initializer'
    $P10 = $P11.'clone'($P1)
    setattribute $P1, 'initializer', $P10
  __label_1: # endif
.annotate 'line', 8837
    getattribute $P8, self, 'condexpr'
    if_null $P8, __label_2
.annotate 'line', 8838
    getattribute $P11, self, 'condexpr'
    $P10 = $P11.'clone'($P1)
    setattribute $P1, 'condexpr', $P10
  __label_2: # endif
.annotate 'line', 8839
    getattribute $P8, self, 'iteration'
    if_null $P8, __label_3
.annotate 'line', 8840
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
.annotate 'line', 8840
    setattribute $P1, 'iteration', $P8
  __label_3: # endif
.annotate 'line', 8841
    getattribute $P10, self, 'body'
    $P9 = $P10.'clone'($P1)
    setattribute $P1, 'body', $P9
.annotate 'line', 8842
    .return($P1)
.annotate 'line', 8843

.end # clone


.sub 'optimize' :method
.annotate 'line', 8846
    getattribute $P1, self, 'initializer'
.annotate 'line', 8847
    if_null $P1, __label_1
.annotate 'line', 8848
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 8849
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_2
.annotate 'line', 8850
    self.'optimize_condition'()
.annotate 'line', 8851
    $P3 = self.'getvalue'()
    set $I3, $P3
    ne $I3, 2, __label_3
.annotate 'line', 8852
    if_null $P1, __label_4
.annotate 'line', 8853
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 8855
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_5: # endif
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 8858
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
.annotate 'line', 8859
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8860
    .return(self)
.annotate 'line', 8861

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8864
    getattribute $P1, self, 'iteration'
.annotate 'line', 8865
    isnull $I1, $P1
    not $I1
.annotate 'line', 8866
    getattribute $P3, self, 'initializer'
    isnull $I2, $P3
    unless $I2 goto __label_3
.annotate 'line', 8867
    getattribute $P4, self, 'condexpr'
    isnull $I2, $P4
  __label_3:
    unless $I2 goto __label_2
.annotate 'line', 8868
    not $I2, $I1
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 8869
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 8870
    .return()
  __label_1: # endif
.annotate 'line', 8872
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 8873
    __ARG_1.'comment'('for loop')
  __label_4: # endif
.annotate 'line', 8874
    $P3 = self.'gencontinuelabel'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 8875
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 8876
    unless $I1 goto __label_8
.annotate 'line', 8877
    $P3 = self.'genlabel'()
    set $S3, $P3
    goto __label_7
  __label_8:
.annotate 'line', 8878
    set $S3, $S1
  __label_7:
.annotate 'line', 8879
    getattribute $P3, self, 'initializer'
    if_null $P3, __label_9
.annotate 'line', 8880
    getattribute $P4, self, 'initializer'
    $P4.'emit'(__ARG_1)
  __label_9: # endif
.annotate 'line', 8882
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 8883
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_10
.annotate 'line', 8884
    self.'emit_else'(__ARG_1, $S2)
  __label_10: # endif
.annotate 'line', 8886
    getattribute $P3, self, 'body'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8887
    unless $I1 goto __label_11
.annotate 'line', 8888
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 8889
    if_null $P1, __label_13
    iter $P5, $P1
    set $P5, 0
  __label_12: # for iteration
    unless $P5 goto __label_13
    shift $P2, $P5
.annotate 'line', 8890
    $P2.'emit_void'(__ARG_1)
    goto __label_12
  __label_13: # endfor
  __label_11: # endif
.annotate 'line', 8892
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8894
    __ARG_1.'emitlabel'($S2, 'for end')
.annotate 'line', 8895

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 8800
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 8802
    addattribute $P0, 'initializer'
.annotate 'line', 8803
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
.annotate 'line', 8910
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 8911
    eq __ARG_5, '', __label_1
.annotate 'line', 8912
    $P1 = WSubId_127(__ARG_5)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 8913
    self.'createvar'(__ARG_4, $S1)
.annotate 'line', 8914
    box $P1, $S1
    setattribute self, 'deftype', $P1
  __label_1: # endif
.annotate 'line', 8916
    setattribute self, 'varname', __ARG_4
.annotate 'line', 8917
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 8918
    WSubId_84(')', __ARG_2)
.annotate 'line', 8919
    self.'parsebody'(__ARG_2)
.annotate 'line', 8920

.end # ForeachStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 8923
    new $P1, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8924
    getattribute $P4, self, 'start'
    $P1.'BlockStatement'($P4, __ARG_1)
.annotate 'line', 8925
    getattribute $P2, self, 'deftype'
.annotate 'line', 8926
    getattribute $P3, self, 'varname'
.annotate 'line', 8927
    if_null $P2, __label_1
.annotate 'line', 8928
    $P1.'createvar'($P3, $P2)
  __label_1: # endif
.annotate 'line', 8929
    setattribute $P1, 'deftype', $P2
.annotate 'line', 8930
    setattribute $P1, 'varname', $P3
.annotate 'line', 8931
    getattribute $P6, self, 'container'
    $P5 = $P6.'clone'($P1)
    setattribute $P1, 'container', $P5
.annotate 'line', 8932
    getattribute $P6, self, 'body'
    $P5 = $P6.'clone'($P1)
    setattribute $P1, 'body', $P5
.annotate 'line', 8933
    .return($P1)
.annotate 'line', 8934

.end # clone


.sub 'optimize' :method
.annotate 'line', 8937
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 8941
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
.annotate 'line', 8942
    $P2 = $P1.'isstringliteral'()
    unless $P2 goto __label_3
.annotate 'line', 8943
    $P3 = $P1.'get_value'()
    set $S1, $P3
    length $I2, $S1
    iseq $I1, $I2, 0
    box $P2, $I1
  __label_3:
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8944
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
.annotate 'line', 8946
    setattribute self, 'container', $P1
.annotate 'line', 8947
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8948
    .return(self)
.annotate 'line', 8949

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_91 = "WSubId_91"
.annotate 'line', 8952
    self.'annotate'(__ARG_1)
.annotate 'line', 8953
    null $S1
.annotate 'line', 8954
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
.annotate 'line', 8955
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8956
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 8957
    __ARG_1.'emitbox'($S1, $S2)
    goto __label_2
  __label_1: # else
.annotate 'line', 8960
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 8962
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 8963
    unless_null $P1, __label_4
.annotate 'line', 8964
    getattribute $P2, self, 'varname'
    WSubId_91($P2, self)
  __label_4: # endif
.annotate 'line', 8966
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 8967
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 8968
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 8969
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 8970
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 8971
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 8972
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 8973
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 8974
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 8975
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 8976
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8977
    __ARG_1.'emitlabel'($S5, 'endfor')
.annotate 'line', 8978

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 8902
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8904
    addattribute $P0, 'deftype'
.annotate 'line', 8905
    addattribute $P0, 'varname'
.annotate 'line', 8906
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 8985
    WSubId_84('(', __ARG_2)
.annotate 'line', 8986
    $P1 = __ARG_2.'get'()
.annotate 'line', 8987
    $P2 = __ARG_2.'get'()
.annotate 'line', 8988
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 8989
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
.annotate 'line', 8991
    $P3 = __ARG_2.'get'()
.annotate 'line', 8992
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8993
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 8994
    __ARG_2.'unget'($P3)
.annotate 'line', 8995
    __ARG_2.'unget'($P2)
.annotate 'line', 8996
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8998
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
.annotate 'line', 8999

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.annotate 'line', 9011
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 9012
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'excep', $P2
.annotate 'line', 9013

.end # ThrowStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9016
    new $P1, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 9017
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
.annotate 'line', 9018
    getattribute $P4, self, 'excep'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'excep', $P3
.annotate 'line', 9019
    .return($P1)
.annotate 'line', 9020

.end # clone


.sub 'optimize' :method
.annotate 'line', 9023
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 9024
    .return(self)
.annotate 'line', 9025

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9028
    getattribute $P1, self, 'excep'
.annotate 'line', 9029
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9030
    self.'annotate'(__ARG_1)
.annotate 'line', 9031
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
.annotate 'line', 9037
    set $S2, $S1
.annotate 'line', 9038
    $P3 = self.'tempreg'('P')
    set $S1, $P3
.annotate 'line', 9039
    $P4 = WSubId_45("    root_new %0, ['parrot';'Exception']\n    %0['message'] = %1\n", $S1, $S2)
    __ARG_1.'print'($P4)
    goto __label_3 # break
  __label_2: # default
.annotate 'line', 9047
    WSubId_25("Invalid throw argument", self)
  __label_3: # switch end
.annotate 'line', 9049
    __ARG_1.'emitarg1'('throw', $S1)
.annotate 'line', 9050

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 9005
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9007
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9062
    setattribute self, 'start', __ARG_1
.annotate 'line', 9063
    self.'ModifierList'(__ARG_2, __ARG_3)
.annotate 'line', 9064

.end # TryModifierList


.sub 'allowtailcall' :method
.annotate 'line', 9067
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 9068

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9071
    $P1 = self.'getlist'()
.annotate 'line', 9072
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
.annotate 'line', 9073
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 9074
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
.annotate 'line', 9078
    eq $I1, 1, __label_11
.annotate 'line', 9079
    WSubId_25('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 9080
    $P3 = $P2.'getarg'(0)
.annotate 'line', 9082
    $P8 = $P3.'emit_get'(__ARG_1)
.annotate 'line', 9081
    $P7 = WSubId_45("    %0.'%1'(%2)", __ARG_2, $S1, $P8)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 9086
    new $P4, ['ResizableStringArray']
.annotate 'line', 9087
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
.annotate 'line', 9088
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 9089
    $P7 = $P5.'emit_get'(__ARG_1)
    push $P4, $P7
  __label_12: # for iteration
.annotate 'line', 9087
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 9092
    join $S2, ', ', $P4
.annotate 'line', 9091
    $P7 = WSubId_45("    %0.'%1'(%2)", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_10: # case
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 9097
    concat $S3, "Modifier '", $S1
    concat $S3, $S3, "' not valid for try"
    WSubId_25($S3, self)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9100

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 9057
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 9059
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
.annotate 'line', 9112
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 9113
    $P1 = __ARG_2.'get'()
.annotate 'line', 9114
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9115
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 9117
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 9119
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 9120
    $P1 = __ARG_2.'get'()
.annotate 'line', 9121
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 9122
    WSubId_26('catch', $P1)
  __label_3: # endif
.annotate 'line', 9123
    $P1 = __ARG_2.'get'()
.annotate 'line', 9124
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 9125
    WSubId_70("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 9126
    $P1 = __ARG_2.'get'()
.annotate 'line', 9127
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 9128
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 9129
    setattribute self, 'exname', $P1
.annotate 'line', 9130
    self.'createvar'($S1, 'P')
.annotate 'line', 9131
    $P1 = __ARG_2.'get'()
.annotate 'line', 9132
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 9133
    WSubId_70("')' in 'catch'", $P1)
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 9135
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'scatch', $P3
.annotate 'line', 9136

.end # TryStatement


.sub 'allowtailcall' :method
.annotate 'line', 9139
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 9140
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 9142
    .return(0)
  __label_2: # endif
.annotate 'line', 9143

.end # allowtailcall


.sub 'optimize' :method
.annotate 'line', 9146
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 9147
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 9148
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 9149
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 9150
    .return(self)
.annotate 'line', 9151

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9154
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9155
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 9156
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 9157
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 9158
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 9159
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 9161
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 9162
    self.'annotate'(__ARG_1)
.annotate 'line', 9163
    unless $I1 goto __label_7
.annotate 'line', 9164
    __ARG_1.'comment'('try: create handler')
  __label_7: # endif
.annotate 'line', 9165
    $P1 = WSubId_45("    new %0, 'ExceptionHandler'\n    set_label %0, %1\n", $S1, $S2)
    __ARG_1.'print'($P1)
.annotate 'line', 9172
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_8
.annotate 'line', 9173
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_8: # endif
.annotate 'line', 9175
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 9176
    unless $I1 goto __label_9
.annotate 'line', 9177
    __ARG_1.'comment'('try: begin')
  __label_9: # endif
.annotate 'line', 9178
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9179
    unless $I1 goto __label_10
.annotate 'line', 9180
    __ARG_1.'comment'('try: end')
  __label_10: # endif
.annotate 'line', 9181
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 9183
    self.'annotate'(__ARG_1)
.annotate 'line', 9184
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 9186
    unless $I1 goto __label_11
.annotate 'line', 9187
    __ARG_1.'comment'('catch')
  __label_11: # endif
.annotate 'line', 9188
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 9189
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 9190
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 9191
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 9192
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9194
    unless $I1 goto __label_12
.annotate 'line', 9195
    __ARG_1.'comment'('catch end')
  __label_12: # endif
.annotate 'line', 9196
    __ARG_1.'emitlabel'($S3)
.annotate 'line', 9197

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 9103
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 9105
    addattribute $P0, 'stry'
.annotate 'line', 9106
    addattribute $P0, 'modifiers'
.annotate 'line', 9107
    addattribute $P0, 'exname'
.annotate 'line', 9108
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.annotate 'line', 9211
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9212
    setattribute self, 'name', __ARG_3
.annotate 'line', 9213
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 9214
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 9215
    box $P2, __ARG_4
    setattribute self, 'flags', $P2
.annotate 'line', 9216

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 9204
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9206
    addattribute $P0, 'name'
.annotate 'line', 9207
    addattribute $P0, 'reg'
.annotate 'line', 9208
    addattribute $P0, 'flags'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
.annotate 'line', 9232
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9233
    setattribute self, 'name', __ARG_3
.annotate 'line', 9234
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 9235
    box $P2, __ARG_5
    setattribute self, 'regtype', $P2
.annotate 'line', 9236
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 9237
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
.annotate 'line', 9238

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 9223
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9225
    addattribute $P0, 'name'
.annotate 'line', 9226
    addattribute $P0, 'basetype'
.annotate 'line', 9227
    addattribute $P0, 'regtype'
.annotate 'line', 9228
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
.annotate 'line', 9249
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 9250
    $P1 = __ARG_5.'get'()
.annotate 'line', 9251
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9253
    $P4 = WSubId_68(__ARG_5, self)
    setattribute self, 'init', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 9256
    __ARG_5.'unget'($P1)
  __label_2: # endif
.annotate 'line', 9257

.end # DeclareSingleStatement


.sub 'clonedeclare' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9260
    getattribute $P1, self, 'start'
.annotate 'line', 9261
    getattribute $P2, self, 'name'
    getattribute $P3, self, 'basetype'
    getattribute $P4, self, 'regtype'
.annotate 'line', 9260
    __ARG_1.'DeclareBase'($P1, __ARG_2, $P2, $P3, $P4)
.annotate 'line', 9262
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 9263
    getattribute $P4, self, 'init'
    $P3 = $P4.'clone'(__ARG_2)
    setattribute __ARG_1, 'init', $P3
  __label_1: # endif
.annotate 'line', 9264
    .return(__ARG_1)
.annotate 'line', 9265

.end # clonedeclare


.sub 'optimize' :method
.annotate 'line', 9268
    getattribute $P1, self, 'init'
.annotate 'line', 9269
    if_null $P1, __label_1
.annotate 'line', 9270
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 9271
    .return(self)
.annotate 'line', 9272

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9275
    self.'annotate'(__ARG_1)
.annotate 'line', 9276
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9277
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 9278
    null $S3
.annotate 'line', 9279
    getattribute $P2, self, 'basetype'
    null $S4
    if_null $P2, __label_3
    set $S4, $P2
  __label_3:
.annotate 'line', 9280
    getattribute $P1, self, 'init'
.annotate 'line', 9281
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9282
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
  __label_4: # endif
.annotate 'line', 9284
    isnull $I1, $P1
    box $P2, $I1
    if $P2 goto __label_7
    $P2 = $P1.'isnull'()
  __label_7:
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 9285
    __ARG_1.'emitnull'($S2)
    goto __label_6
  __label_5: # else
.annotate 'line', 9287
    $P3 = $P1.'checkresult'()
    null $S5
    if_null $P3, __label_8
    set $S5, $P3
  __label_8:
.annotate 'line', 9288
    ne $S5, $S4, __label_9
.annotate 'line', 9289
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
.annotate 'line', 9291
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 9293
    $P1.'emit'(__ARG_1, $S2)
    goto __label_12
  __label_11: # else
.annotate 'line', 9295
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
.annotate 'line', 9298
    $P3 = WSubId_48($P1)
    set $S3, $P3
.annotate 'line', 9299
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_18: # case
.annotate 'line', 9302
    $P4 = WSubId_128($P1)
    set $S3, $P4
.annotate 'line', 9303
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_19: # case
.annotate 'line', 9306
    $P5 = WSubId_47($P1)
    set $S3, $P5
.annotate 'line', 9307
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_15: # default
.annotate 'line', 9310
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
.annotate 'line', 9316
    WSubId_25('Invalid initialization from void value', self)
  __label_20: # default
.annotate 'line', 9318
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S3, $P2
  __label_21: # switch end
.annotate 'line', 9320
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_25
    iseq $I1, $S5, 'P'
  __label_25:
    unless $I1 goto __label_23
.annotate 'line', 9321
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_26
    set $S6, $P2
  __label_26:
.annotate 'line', 9322
    __ARG_1.'emitnull'($S2)
.annotate 'line', 9323
    __ARG_1.'emitif_null'($S3, $S6)
.annotate 'line', 9324
    __ARG_1.'emitset'($S2, $S3)
.annotate 'line', 9325
    __ARG_1.'emitlabel'($S6)
    goto __label_24
  __label_23: # else
.annotate 'line', 9328
    __ARG_1.'emitset'($S2, $S3)
  __label_24: # endif
  __label_14: # endif
  __label_12: # endif
  __label_10: # endif
  __label_6: # endif
.annotate 'line', 9332

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 9243
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 9245
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
.annotate 'line', 9347
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 9348
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 9349
    $P1 = __ARG_6.'get'()
.annotate 'line', 9350
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9352
    __ARG_6.'unget'($P1)
.annotate 'line', 9353
    $P3 = WSubId_68(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 9354
    WSubId_84(']', __ARG_6)
  __label_1: # endif
.annotate 'line', 9356
    $P1 = __ARG_6.'get'()
.annotate 'line', 9357
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9358
    $P1 = __ARG_6.'get'()
.annotate 'line', 9359
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 9360
    WSubId_70("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 9361
    $P1 = __ARG_6.'get'()
.annotate 'line', 9362
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
.annotate 'line', 9363
    __ARG_6.'unget'($P1)
.annotate 'line', 9364
    $P3 = WSubId_67(__ARG_6, self, WSubId_68, ']')
    setattribute self, 'initarray', $P3
  __label_5: # endif
    goto __label_3
  __label_2: # else
.annotate 'line', 9368
    __ARG_6.'unget'($P1)
  __label_3: # endif
.annotate 'line', 9369

.end # DeclareArrayStatement


.sub 'clonedeclare' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9372
    getattribute $P7, self, 'start'
.annotate 'line', 9373
    getattribute $P8, self, 'name'
    getattribute $P9, self, 'basetype'
.annotate 'line', 9372
    __ARG_1.'DeclareBase'($P7, __ARG_2, $P8, $P9, 'P')
.annotate 'line', 9374
    getattribute $P8, self, 'arraytype'
    setattribute __ARG_1, 'arraytype', $P8
.annotate 'line', 9375
    getattribute $P7, self, 'size'
    if_null $P7, __label_1
    unless $P7 goto __label_1
.annotate 'line', 9376
    getattribute $P10, self, 'size'
    $P9 = $P10.'clone'(__ARG_1)
    setattribute __ARG_1, 'size', $P9
  __label_1: # endif
.annotate 'line', 9377
    getattribute $P7, self, 'initarray'
    if_null $P7, __label_2
.annotate 'line', 9378
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
.annotate 'line', 9378
    setattribute __ARG_1, 'initarray', $P7
  __label_2: # endif
.annotate 'line', 9379
    .return(__ARG_1)
.annotate 'line', 9380

.end # clonedeclare


.sub 'optimize' :method
.annotate 'line', 9383
    getattribute $P2, self, 'size'
    if_null $P2, __label_1
.annotate 'line', 9384
    getattribute $P5, self, 'size'
    $P4 = $P5.'optimize'()
    setattribute self, 'size', $P4
  __label_1: # endif
.annotate 'line', 9385
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
.annotate 'line', 9386
    .return(self)
.annotate 'line', 9387

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9390
    self.'annotate'(__ARG_1)
.annotate 'line', 9392
    getattribute $P1, self, 'reg'
.annotate 'line', 9393
    getattribute $P2, self, 'size'
.annotate 'line', 9394
    getattribute $P3, self, 'initarray'
.annotate 'line', 9395
    getattribute $P4, self, 'basetype'
.annotate 'line', 9396
    getattribute $P5, self, 'arraytype'
.annotate 'line', 9398
    if_null $P2, __label_1
.annotate 'line', 9401
    $P8 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 9400
    $P7 = WSubId_45("    new %0, ['Fixed%1Array'], %2", $P1, $P5, $P8)
    __ARG_1.'say'($P7)
    goto __label_2
  __label_1: # else
.annotate 'line', 9405
    $P7 = WSubId_45("    new %0, ['Resizable%1Array']", $P1, $P5)
    __ARG_1.'say'($P7)
  __label_2: # endif
.annotate 'line', 9408
    if_null $P3, __label_3
.annotate 'line', 9409
    $P7 = self.'tempreg'($P4)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 9410
    elements $I1, $P3
.annotate 'line', 9411
    unless_null $P2, __label_5
.annotate 'line', 9412
    unless $I1 goto __label_6
.annotate 'line', 9414
    __ARG_1.'emitset'($P1, $I1)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 9417
    null $I2
.annotate 'line', 9418
    if_null $P3, __label_8
    iter $P9, $P3
    set $P9, 0
  __label_7: # for iteration
    unless $P9 goto __label_8
    shift $P6, $P9
.annotate 'line', 9419
    $P6.'emit'(__ARG_1, $S1)
.annotate 'line', 9420
    $P7 = WSubId_45("    %0[%1] = %2", $P1, $I2, $S1)
    __ARG_1.'say'($P7)
.annotate 'line', 9421
    inc $I2
    goto __label_7
  __label_8: # endfor
  __label_3: # endif
.annotate 'line', 9424

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 9337
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 9339
    addattribute $P0, 'size'
.annotate 'line', 9340
    addattribute $P0, 'initarray'
.annotate 'line', 9341
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
.annotate 'line', 9431
    null $P1
.annotate 'line', 9432
    null $P2
  __label_1: # do
.annotate 'line', 9434
    $P3 = __ARG_4.'get'()
.annotate 'line', 9435
    WSubId_124($P3)
.annotate 'line', 9436
    $P4 = __ARG_4.'get'()
.annotate 'line', 9437
    null $P5
.annotate 'line', 9438
    $P8 = $P4.'isop'('[')
    if_null $P8, __label_4
    unless $P8 goto __label_4
.annotate 'line', 9439
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
.annotate 'line', 9441
    __ARG_4.'unget'($P4)
.annotate 'line', 9442
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
  __label_5: # endif
.annotate 'line', 9444
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
.annotate 'line', 9445
    $P1 = __ARG_4.'get'()
  __label_3: # continue
.annotate 'line', 9446
    $P8 = $P1.'isop'(',')
    if_null $P8, __label_2
    if $P8 goto __label_1
  __label_2: # enddo
.annotate 'line', 9447
    WSubId_28(';', $P1)
.annotate 'line', 9448
    .return($P2)
.annotate 'line', 9449

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9457
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
.annotate 'line', 9458

.end # IntStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9461
    new $P1, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9462

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 9453
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9469
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
.annotate 'line', 9470

.end # IntArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9473
    new $P1, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9474

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 9465
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_130')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9480
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9481

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_131')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9485
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9486

.end # newIntArray


.sub 'parseInt' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_130 = "WSubId_130"
.const 'Sub' WSubId_131 = "WSubId_131"
.annotate 'line', 9490
    .tailcall WSubId_129(WSubId_130, WSubId_131, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9491

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9499
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
.annotate 'line', 9500

.end # FloatStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9503
    new $P1, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9504

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 9495
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9511
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
.annotate 'line', 9512

.end # FloatArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9515
    new $P1, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9516

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 9507
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_132')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9522
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9523

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_133')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9527
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9528

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_132 = "WSubId_132"
.const 'Sub' WSubId_133 = "WSubId_133"
.annotate 'line', 9532
    .tailcall WSubId_129(WSubId_132, WSubId_133, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9533

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9541
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
.annotate 'line', 9542

.end # StringStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9545
    new $P1, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9546

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 9537
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9553
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
.annotate 'line', 9554

.end # StringArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9557
    new $P1, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)
.annotate 'line', 9558

.end # clone

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 9549
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_134')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9564
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9565

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_135')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 9569
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
.annotate 'line', 9570

.end # newStringArray


.sub 'parseString' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_134 = "WSubId_134"
.const 'Sub' WSubId_135 = "WSubId_135"
.annotate 'line', 9574
    .tailcall WSubId_129(WSubId_134, WSubId_135, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9575

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 9591
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9592
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 9593
    setattribute self, 'name', __ARG_4
.annotate 'line', 9594
    setattribute self, 'value', __ARG_5
.annotate 'line', 9595
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
.annotate 'line', 9596

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9599
    getattribute $P1, self, 'value'
.annotate 'line', 9600
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9601
    $P1 = $P1.'optimize'()
.annotate 'line', 9602
    $P2 = $P1.'hascompilevalue'()
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 9603
    WSubId_25('Value for const is not evaluable at compile time', self)
  __label_2: # endif
.annotate 'line', 9606
    getattribute $P2, self, 'data'
    $P2.'setvalue'($P1)
.annotate 'line', 9607
    .return(self)
.annotate 'line', 9608

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9611
    getattribute $P1, self, 'start'
    WSubId_30('Direct use of const', $P1)
.annotate 'line', 9612

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9615
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9616
    getattribute $P3, self, 'data'
    $P1 = $P3.'getvalue'()
.annotate 'line', 9617
    null $S1
.annotate 'line', 9618
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
.annotate 'line', 9619
    $P3 = $P1.'getIntegerValue'()
    set $S1, $P3
    goto __label_3 # break
  __label_5: # case
.annotate 'line', 9620
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 9621
    $P5 = $P1.'getPirString'()
    set $S1, $P5
    goto __label_3 # break
  __label_2: # default
  __label_3: # switch end
.annotate 'line', 9624
    getattribute $P2, self, 'name'
    set $S2, $P2
.annotate 'line', 9625
    concat $S3, "Constant '", $S2
    concat $S3, $S3, "' set to: "
    concat $S3, $S3, $S1
.annotate 'line', 9624
    __ARG_1.'comment'($S3)
  __label_1: # endif
.annotate 'line', 9627

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 9581
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9583
    addattribute $P0, 'type'
.annotate 'line', 9584
    addattribute $P0, 'name'
.annotate 'line', 9585
    addattribute $P0, 'data'
.annotate 'line', 9586
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
.annotate 'line', 9632
    $P1 = __ARG_2.'get'()
.annotate 'line', 9633
    $P7 = WSubId_127($P1)
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 9634
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9635
    WSubId_25('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 9637
    null $P2
  __label_5: # do
.annotate 'line', 9639
    $P3 = __ARG_2.'get'()
.annotate 'line', 9640
    WSubId_84('=', __ARG_2)
.annotate 'line', 9641
    $P4 = WSubId_68(__ARG_2, __ARG_3)
.annotate 'line', 9642
    set $P5, $P2
.annotate 'line', 9643
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
.annotate 'line', 9644
    $P1 = __ARG_2.'get'()
    $P7 = $P1.'isop'(',')
    if_null $P7, __label_6
    if $P7 goto __label_5
  __label_6: # enddo
.annotate 'line', 9645
    WSubId_28(';', $P1)
.annotate 'line', 9646
    .return($P2)
.annotate 'line', 9647

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
.annotate 'line', 9658
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 9659
    $P1 = __ARG_2.'get'()
.annotate 'line', 9660
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9661
    $P4 = WSubId_68(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 9662
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 9664
    WSubId_28(';', $P1)
.annotate 'line', 9665

.end # VarStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9668
    new $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 9669
    getattribute $P2, self, 'start'
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'flags'
    $P1.'initvarbase'($P2, __ARG_1, $P3, $P4)
.annotate 'line', 9670
    getattribute $P2, self, 'init'
    if_null $P2, __label_1
.annotate 'line', 9671
    getattribute $P5, self, 'init'
    $P4 = $P5.'clone'($P1)
    setattribute $P1, 'init', $P4
  __label_1: # endif
.annotate 'line', 9672
    .return($P1)
.annotate 'line', 9673

.end # clone


.sub 'optimize_init' :method
.annotate 'line', 9676
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 9677
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 9678
    .return(self)
.annotate 'line', 9679

.end # optimize_init


.sub 'optimize' :method
.annotate 'line', 9682
    .tailcall self.'optimize_init'()
.annotate 'line', 9683

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9686
    self.'annotate'(__ARG_1)
.annotate 'line', 9687
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9688
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 9689
    getattribute $P1, self, 'init'
.annotate 'line', 9690
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9691
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
  __label_3: # endif
.annotate 'line', 9692
    if_null $P1, __label_4
.annotate 'line', 9693
    $P2 = $P1.'isnull'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 9694
    null $P1
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 9695
    if_null $P1, __label_6
.annotate 'line', 9696
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
.annotate 'line', 9698
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
  __label_13: # case
.annotate 'line', 9703
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_15
    set $S3, $P3
  __label_15:
.annotate 'line', 9704
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_9 # break
  __label_14: # case
.annotate 'line', 9707
    WSubId_25("Can't use void function as initializer", self)
  __label_8: # default
.annotate 'line', 9709
    WSubId_25("Invalid var initializer", self)
  __label_9: # switch end
    goto __label_7
  __label_6: # else
.annotate 'line', 9713
    __ARG_1.'emitnull'($S2)
  __label_7: # endif
.annotate 'line', 9714

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 9653
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 9655
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 9721
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 9722
    WSubId_84(';', __ARG_2)
.annotate 'line', 9723

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9726
    self.'annotate'(__ARG_1)
.annotate 'line', 9727
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9728
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 9729
    getattribute $P3, self, 'name'
    $P2 = WSubId_45("var %0[] : %1", $P3, $S1)
    __ARG_1.'comment'($P2)
  __label_2: # endif
.annotate 'line', 9730
    $P1 = WSubId_45("    new %0, 'ResizablePMCArray'", $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 9731

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 9717
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
.annotate 'line', 9740
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 9741
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 9742
    WSubId_84(']', __ARG_2)
.annotate 'line', 9743
    WSubId_84(';', __ARG_2)
.annotate 'line', 9744

.end # FixedVarStatement


.sub 'optimize' :method
.annotate 'line', 9747
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 9748
    .tailcall self.'optimize_init'()
.annotate 'line', 9749

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 9752
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9753
    self.'annotate'(__ARG_1)
.annotate 'line', 9754
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 9755
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 9756
    getattribute $P3, self, 'name'
    $P2 = WSubId_45("var %0[] : %1", $P3, $S2)
    __ARG_1.'comment'($P2)
  __label_3: # endif
.annotate 'line', 9757
    $P1 = WSubId_45("    new %0, 'FixedPMCArray', %1", $S2, $S1)
    __ARG_1.'say'($P1)
.annotate 'line', 9758

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 9734
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 9736
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_124 = "WSubId_124"
.annotate 'line', 9763
    $P1 = __ARG_2.'get'()
.annotate 'line', 9764
    WSubId_124($P1)
.annotate 'line', 9765
    $P2 = __ARG_2.'get'()
.annotate 'line', 9766
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9767
    $P2 = __ARG_2.'get'()
.annotate 'line', 9768
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 9769
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
.annotate 'line', 9771
    __ARG_2.'unget'($P2)
.annotate 'line', 9772
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 9776
    __ARG_2.'unget'($P2)
.annotate 'line', 9777
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9779

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_76 = "WSubId_76"
.annotate 'line', 9783
    $P1 = __ARG_2.'get'()
.annotate 'line', 9784
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 9785
    WSubId_25("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 9786
    .tailcall WSubId_76(__ARG_1, __ARG_2, __ARG_3, 1)
.annotate 'line', 9787

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 9800
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 9801
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 9802
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 9803
    null $P1
  __label_2: # while
.annotate 'line', 9804
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9805
    __ARG_2.'unget'($P1)
.annotate 'line', 9806
    $P2 = WSubId_125(__ARG_2, self)
.annotate 'line', 9807
    unless_null $P2, __label_3
.annotate 'line', 9808
    WSubId_30('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 9809
    getattribute $P3, self, 'statements'
    push $P3, $P2
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9811
    setattribute self, 'end', $P1
.annotate 'line', 9812

.end # CompoundStatement


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 9815
    new $P1, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 9816
    getattribute $P8, self, 'start'
    $P1.'BlockStatement'($P8, __ARG_1)
.annotate 'line', 9817
    root_new $P9, ['parrot';'Hash']
    setattribute $P1, 'labels', $P9
.annotate 'line', 9818
    getattribute $P9, self, 'end'
    setattribute $P1, 'end', $P9
.annotate 'line', 9819
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
.annotate 'line', 9819
    setattribute $P1, 'statements', $P8
.annotate 'line', 9820
    .return($P1)
.annotate 'line', 9821

.end # clone


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 9824
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9825
    getattribute $P1, self, 'labels'
.annotate 'line', 9826
    $S2 = $P1[$S1]
.annotate 'line', 9827
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9828
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 9829
    .return($S2)
.annotate 'line', 9830

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9833
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 9834
    getattribute $P1, self, 'labels'
.annotate 'line', 9835
    $S2 = $P1[$S1]
.annotate 'line', 9836
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 9837
    WSubId_25('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 9838
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 9839
    $P1[$S1] = $S3
.annotate 'line', 9840
    .return($S3)
.annotate 'line', 9841

.end # createlabel


.sub 'getend' :method
.annotate 'line', 9842
    getattribute $P1, self, 'end'
    .return($P1)

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 9845
    $P2 = __ARG_1.'getDebug'()
    set $I1, $P2
.annotate 'line', 9846
    unless $I1 goto __label_1
.annotate 'line', 9847
    __ARG_1.'comment'('{')
  __label_1: # endif
.annotate 'line', 9848
    getattribute $P2, self, 'statements'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9849
    $P1.'emit'(__ARG_1)
.annotate 'line', 9850
    self.'freetemps'()
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9852
    unless $I1 goto __label_4
.annotate 'line', 9853
    __ARG_1.'comment'('}')
  __label_4: # endif
.annotate 'line', 9854

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 9793
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 9795
    addattribute $P0, 'end'
.annotate 'line', 9796
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
.annotate 'line', 9869
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 9871
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 9872
    new $P1, ['ResizableStringArray']
.annotate 'line', 9873
    new $P2, ['ResizableStringArray']
.annotate 'line', 9874
    setattribute self, 'tempreg', $P1
.annotate 'line', 9875
    setattribute self, 'freereg', $P2
.annotate 'line', 9876

.end # RegisterStore


.sub 'createreg' :method
.annotate 'line', 9879
    getattribute $P1, self, 'nreg'
.annotate 'line', 9880
    set $I1, $P1
.annotate 'line', 9881
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 9882
    assign $P1, $I1
.annotate 'line', 9883
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
.annotate 'line', 9884

.end # createreg


.sub 'tempreg' :method
.annotate 'line', 9887
    getattribute $P1, self, 'freereg'
.annotate 'line', 9888
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9889
    null $S1
.annotate 'line', 9890
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9891
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9893
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 9894
    push $P2, $S1
.annotate 'line', 9895
    .return($S1)
.annotate 'line', 9896

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 9899
    getattribute $P1, self, 'freereg'
.annotate 'line', 9900
    getattribute $P2, self, 'tempreg'
.annotate 'line', 9901
    elements $I1, $P2
.annotate 'line', 9902
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
.annotate 'line', 9903
    $S1 = $P2[$I2]
.annotate 'line', 9904
    push $P1, $S1
  __label_1: # for iteration
.annotate 'line', 9902
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 9906
    assign $P2, 0
.annotate 'line', 9907

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 9863
    addattribute $P0, 'type'
.annotate 'line', 9864
    addattribute $P0, 'nreg'
.annotate 'line', 9865
    addattribute $P0, 'tempreg'
.annotate 'line', 9866
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 9918
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 9919

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 9922
    null $P1
.annotate 'line', 9923
    null $P2
.annotate 'line', 9924
    $P3 = self.'getlist'()
.annotate 'line', 9925
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
.annotate 'line', 9926
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
    if $S1 == 'named' goto __label_6
    if $S1 == 'slurpy' goto __label_7
    goto __label_4
  __label_6: # case
.annotate 'line', 9929
    set $P1, $P4
    goto __label_5 # break
  __label_7: # case
.annotate 'line', 9932
    set $P2, $P4
    goto __label_5 # break
  __label_4: # default
.annotate 'line', 9935
    __ARG_1.'print'(' :', $S1)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9939
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 9946
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 9963
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 9944
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 9947
    null $S2
.annotate 'line', 9948
    $P7 = $P1.'numargs'()
    set $I2, $P7
    if $I2 == 0 goto __label_16
    if $I2 == 1 goto __label_17
    goto __label_14
  __label_16: # case
.annotate 'line', 9950
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_15 # break
  __label_17: # case
.annotate 'line', 9953
    $P5 = $P1.'getarg'(0)
.annotate 'line', 9954
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 9955
    WSubId_25('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 9956
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_15 # break
  __label_14: # default
.annotate 'line', 9959
    WSubId_25('Invalid modifier', __ARG_2)
  __label_15: # switch end
.annotate 'line', 9961
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 9964
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 9967

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 9914
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 9978
    setattribute self, 'func', __ARG_1
.annotate 'line', 9979
    $P1 = __ARG_2.'get'()
.annotate 'line', 9980
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_127($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 9981
    eq $S1, '', __label_2
.annotate 'line', 9982
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 9984
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 9985
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 9986
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 9987
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 9989
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 9990
    $P1 = __ARG_2.'get'()
.annotate 'line', 9991
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 9992
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 9994
    __ARG_2.'unget'($P1)
  __label_5: # endif
.annotate 'line', 9995

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_136 = "WSubId_136"
.annotate 'line', 9998
    getattribute $P1, self, 'func'
.annotate 'line', 9999
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 10000
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 10001
    $P5 = $P2.'gettype'()
    $P4 = WSubId_136($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 10002
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 10003
    getattribute $P3, self, 'modifiers'
.annotate 'line', 10004
    if_null $P3, __label_3
.annotate 'line', 10005
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 10006
    __ARG_1.'say'('')
.annotate 'line', 10007

.end # emit


.sub 'get_type' :method
.annotate 'line', 10010
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 10011

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 9972
    addattribute $P0, 'func'
.annotate 'line', 9973
    addattribute $P0, 'name'
.annotate 'line', 9974
    addattribute $P0, 'modifiers'
.annotate 'line', 9975
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_137')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10017
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
.annotate 'line', 10018

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10029
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 10030
    setattribute self, 'name', __ARG_1
.annotate 'line', 10031

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10034
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 10035
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10036
    self.'annotate'(__ARG_1)
.annotate 'line', 10037
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 10038
    .return($S1)
.annotate 'line', 10039

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 10024
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 10026
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_subid' :subid('WSubId_139')
        .param string __ARG_1
.annotate 'line', 10048
    concat $S1, ".const 'Sub' ", __ARG_1
    concat $S1, $S1, ' = "'
    concat $S1, $S1, __ARG_1
    concat $S1, $S1, "\"\n"
    .return($S1)
.annotate 'line', 10049

.end # emit_subid

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10055
    self.'ModifierList'(__ARG_1, __ARG_2)
.annotate 'line', 10056

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10059
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10060
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 10062
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 10064
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 10065
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 10066
    le $I1, 0, __label_5
.annotate 'line', 10067
    __ARG_1.'print'('(')
.annotate 'line', 10068
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
.annotate 'line', 10069
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 10070
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 10071
    WSubId_25('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 10072
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 10073
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 10074
    __ARG_1.'print'(", ")
  __label_10: # endif
  __label_6: # for iteration
.annotate 'line', 10068
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 10076
    __ARG_1.'print'(')')
  __label_5: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10079

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 10051
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_138')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10084
    $P5 = __ARG_2.'numargs'()
    set $I1, $P5
.annotate 'line', 10085
    null $P1
.annotate 'line', 10086
    unless $I1 goto __label_1
.annotate 'line', 10087
    root_new $P5, ['parrot';'ResizablePMCArray']
    set $P1, $P5
.annotate 'line', 10088
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 10089
    $P2 = __ARG_2.'getarg'($I2)
.annotate 'line', 10091
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 10094
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 10107
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 10092
    $P5 = $P2.'get_value'()
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10095
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
.annotate 'line', 10098
    push $P1, $S1
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 10100
    push $P1, "num"
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 10102
    push $P1, "pmc"
    goto __label_12 # break
  __label_11: # default
.annotate 'line', 10104
    WSubId_25("unsupported multi signature", $P2)
  __label_12: # switch end
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10108
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 10109
    unless_null $P3, __label_17
.annotate 'line', 10110
    WSubId_25("class not found", $P2)
  __label_17: # endif
.annotate 'line', 10112
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
.annotate 'line', 10112
    push $P1, $S4
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10115
    WSubId_25("unsupported multi signature", $P2)
  __label_5: # switch end
  __label_2: # for iteration
.annotate 'line', 10088
    inc $I2
    goto __label_4
  __label_3: # for end
  __label_1: # endif
.annotate 'line', 10119
    .return($P1)
.annotate 'line', 10120

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10142
    self.'BlockStatement'(__ARG_1, __ARG_2)
.annotate 'line', 10143
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 10144
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 10145
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 10146
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 10147
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
.annotate 'line', 10148

.end # FunctionBase


.sub 'getouter' :method
.annotate 'line', 10150
    .return(self)

.end # getouter


.sub 'allowtailcall' :method
.annotate 'line', 10153
    .return(1)
.annotate 'line', 10154

.end # allowtailcall


.sub 'makesubid' :method
.annotate 'line', 10158
    getattribute $P1, self, 'subid'
.annotate 'line', 10159
    unless_null $P1, __label_1
.annotate 'line', 10160
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 10161
    .return($P1)
.annotate 'line', 10162

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 10165
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 10166
    unless_null $P1, __label_1
.annotate 'line', 10167
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 10168
    $P1[__ARG_1] = 1
.annotate 'line', 10169

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
.annotate 'line', 10173
    issame $I1, self, __ARG_1
.annotate 'line', 10174
    .return($I1)
.annotate 'line', 10175

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_137 = "WSubId_137"
.annotate 'line', 10178
    $P1 = __ARG_1.'get'()
.annotate 'line', 10179
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 10180
    __ARG_1.'unget'($P1)
.annotate 'line', 10181
    $P3 = WSubId_67(__ARG_1, self, WSubId_137, ')')
    setattribute self, 'params', $P3
  __label_1: # endif
.annotate 'line', 10183

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 10187
    getattribute $P1, self, 'localfun'
.annotate 'line', 10188
    unless_null $P1, __label_1
.annotate 'line', 10189
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 10191
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 10192

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 10196
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10197
    unless_null $P1, __label_1
.annotate 'line', 10198
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 1
    $P6[0] = __ARG_1
    setattribute self, 'usednamespaces', $P6
    goto __label_2
  __label_1: # else
.annotate 'line', 10200
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
.annotate 'line', 10200
    if_null $P5, __label_3
.annotate 'line', 10201
    .return()
  __label_3: # endif
.annotate 'line', 10202
    push $P1, __ARG_1
  __label_2: # endif
.annotate 'line', 10204

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 10207
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10208
    $P2 = $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10209
    if_null $P2, __label_3
.annotate 'line', 10210
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10212
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 10213

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10217
    getattribute $P1, self, 'modifiers'
.annotate 'line', 10218
    if_null $P1, __label_1
.annotate 'line', 10219
    $P2 = $P1.'pick'('multi')
.annotate 'line', 10220
    if_null $P2, __label_2
.annotate 'line', 10222
    self.'setmulti'()
.annotate 'line', 10223
    $P7 = WSubId_138(self, $P2)
    setattribute self, 'multi_sig', $P7
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 10226
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
.annotate 'line', 10227
    getattribute $P9, self, 'body'
    $P7 = $P9.'optimize'()
    setattribute self, 'body', $P7
.annotate 'line', 10228
    .return(self)
.annotate 'line', 10229

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 10233
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 10234
    unless_null $P1, __label_1
.annotate 'line', 10235
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 10236
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 10237

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 10240
    getattribute $P1, self, 'lexicals'
.annotate 'line', 10241
    unless_null $P1, __label_1
.annotate 'line', 10242
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 10243
    $P1[__ARG_2] = __ARG_1
.annotate 'line', 10244

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
.annotate 'line', 10249
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 10250
    null $S1
.annotate 'line', 10251
    if_null $P1, __label_1
.annotate 'line', 10252
    set $S1, $P1
    goto __label_2
  __label_1: # else
.annotate 'line', 10254
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 10255
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 10256
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 10257
    self.'setlex'($S1, $S2)
.annotate 'line', 10258
    __ARG_1.'setlex'($S1)
  __label_2: # endif
.annotate 'line', 10260
    .return($S1)
.annotate 'line', 10261

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10265
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
.annotate 'line', 10268
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 10270
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 10272
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 10274
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 10276
    concat $S2, "Invalid type in createreg: ", __ARG_1
    WSubId_30($S2)
  __label_2: # switch end
.annotate 'line', 10278
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 10279
    .return($S1)
.annotate 'line', 10280

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10283
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
.annotate 'line', 10286
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 10288
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 10290
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 10292
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 10294
    concat $S2, "Invalid type in tempreg: ", __ARG_1
    WSubId_30($S2)
  __label_2: # switch end
.annotate 'line', 10296
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 10297
    .return($S1)
.annotate 'line', 10298

.end # tempreg


.sub 'freetemps' :method
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10301
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
.annotate 'line', 10302
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
.annotate 'line', 10303

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 10306
    getattribute $P1, self, 'nlabel'
    inc $P1
    set $I1, $P1
.annotate 'line', 10307
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
.annotate 'line', 10308

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10311
    WSubId_25('break not allowed here', __ARG_1)
.annotate 'line', 10312

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10315
    WSubId_25('continue not allowed here', __ARG_1)
.annotate 'line', 10316

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
.annotate 'line', 10322
    getattribute $P19, self, 'name'
    null $S1
    if_null $P19, __label_1
    set $S1, $P19
  __label_1:
.annotate 'line', 10323
    __ARG_1.'say'()
.annotate 'line', 10324
    __ARG_1.'print'(".sub ")
.annotate 'line', 10325
    $P19 = self.'isanonymous'()
    if_null $P19, __label_2
    unless $P19 goto __label_2
.annotate 'line', 10326
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 10328
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 10329
    getattribute $P19, self, 'subid'
    if_null $P19, __label_4
.annotate 'line', 10330
    getattribute $P20, self, 'subid'
    __ARG_1.'print'(" :subid('", $P20, "')")
  __label_4: # endif
.annotate 'line', 10332
    getattribute $P1, self, 'outer'
.annotate 'line', 10333
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_6
    getattribute $P19, self, 'usedlexicals'
    isnull $I2, $P19
    not $I2
  __label_6:
    unless $I2 goto __label_5
.annotate 'line', 10334
    getattribute $P2, $P1, 'subid'
.annotate 'line', 10335
    if_null $P2, __label_7
.annotate 'line', 10336
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10340
    $P19 = self.'ismethod'()
    if_null $P19, __label_8
    unless $P19 goto __label_8
.annotate 'line', 10341
    __ARG_1.'print'(' :method')
  __label_8: # endif
.annotate 'line', 10342
    getattribute $P3, self, 'modifiers'
.annotate 'line', 10343
    if_null $P3, __label_9
.annotate 'line', 10344
    $P3.'emit'(__ARG_1)
    goto __label_10
  __label_9: # else
.annotate 'line', 10346
    ne $S1, 'main', __label_11
.annotate 'line', 10347
    __ARG_1.'print'(' :main')
  __label_11: # endif
  __label_10: # endif
.annotate 'line', 10349
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 10350
    __ARG_1.'say'()
.annotate 'line', 10353
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
.annotate 'line', 10355
    getattribute $P4, self, 'lexicals'
.annotate 'line', 10356
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 10357
    isnull $I2, $P4
    not $I2
    if $I2 goto __label_17
    isnull $I2, $P5
    not $I2
  __label_17:
    unless $I2 goto __label_16
.annotate 'line', 10358
    getattribute $P19, self, 'start'
    __ARG_1.'annotate'($P19)
.annotate 'line', 10360
    if_null $P4, __label_19
    iter $P22, $P4
    set $P22, 0
  __label_18: # for iteration
    unless $P22 goto __label_19
    shift $S2, $P22
.annotate 'line', 10361
    $P20 = $P4[$S2]
    $P19 = WSubId_45(".lex '%0', %1", $P20, $S2)
    __ARG_1.'say'($P19)
    goto __label_18
  __label_19: # endfor
.annotate 'line', 10363
    if_null $P5, __label_21
    iter $P23, $P5
    set $P23, 0
  __label_20: # for iteration
    unless $P23 goto __label_21
    shift $S3, $P23
.annotate 'line', 10364
    substr $S4, $S3, 0, 1
    eq $S4, '$', __label_22
.annotate 'line', 10365
    concat $S5, "    .local pmc ", $S3
    __ARG_1.'say'($S5)
  __label_22: # endif
.annotate 'line', 10366
    $P19 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P19)
    goto __label_20
  __label_21: # endfor
  __label_16: # endif
.annotate 'line', 10370
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
.annotate 'line', 10370
    join $S4, "", $P19
    __ARG_1.'print'($S4)
.annotate 'line', 10372
    $P19 = __ARG_1.'getDebug'()
    set $I1, $P19
.annotate 'line', 10373
    getattribute $P6, self, 'body'
.annotate 'line', 10374
    $P19 = $P6.'isempty'()
    if_null $P19, __label_26
    unless $P19 goto __label_26
.annotate 'line', 10375
    unless $I1 goto __label_28
.annotate 'line', 10376
    __ARG_1.'comment'('Empty body')
  __label_28: # endif
    goto __label_27
  __label_26: # else
.annotate 'line', 10379
    unless $I1 goto __label_29
.annotate 'line', 10380
    __ARG_1.'comment'('Body')
  __label_29: # endif
.annotate 'line', 10381
    $P6.'emit'(__ARG_1)
.annotate 'line', 10382
    $P19 = $P6.'getend'()
    __ARG_1.'annotate'($P19)
  __label_27: # endif
.annotate 'line', 10384
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 10387
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
.annotate 'line', 10388

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 10122
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 10124
    addattribute $P0, 'name'
.annotate 'line', 10125
    addattribute $P0, 'subid'
.annotate 'line', 10126
    addattribute $P0, 'modifiers'
.annotate 'line', 10127
    addattribute $P0, 'params'
.annotate 'line', 10128
    addattribute $P0, 'body'
.annotate 'line', 10129
    addattribute $P0, 'regstI'
.annotate 'line', 10130
    addattribute $P0, 'regstN'
.annotate 'line', 10131
    addattribute $P0, 'regstS'
.annotate 'line', 10132
    addattribute $P0, 'regstP'
.annotate 'line', 10133
    addattribute $P0, 'nlabel'
.annotate 'line', 10134
    addattribute $P0, 'localfun'
.annotate 'line', 10135
    addattribute $P0, 'lexicals'
.annotate 'line', 10136
    addattribute $P0, 'usedlexicals'
.annotate 'line', 10137
    addattribute $P0, 'usedsubids'
.annotate 'line', 10138
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10404
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 10405
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 10406
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 10407
    self.'parse'(__ARG_2)
.annotate 'line', 10408
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
.annotate 'line', 10409

.end # FunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 10411
    .return(0)

.end # isanonymous


.sub 'getparamnum' :method
.annotate 'line', 10415
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 10416

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 10420
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
.annotate 'line', 10421

.end # getlexnum


.sub 'ismethod' :method
.annotate 'line', 10422
    .return(0)

.end # ismethod


.sub 'ismulti' :method
.annotate 'line', 10426
    getattribute $P1, self, 'is_multi'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)
.annotate 'line', 10427

.end # ismulti


.sub 'setmulti' :method
.annotate 'line', 10430
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
.annotate 'line', 10431

.end # setmulti


.sub 'default_multi_sig' :subid('WSubId_13') :method
.const 'Sub' WSubId_14 = "WSubId_14"
.annotate 'line', 10434
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 10435
    $P6 = self.'ismethod'()
    if_null $P6, __label_1
    unless $P6 goto __label_1
.annotate 'line', 10436
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 10437
    getattribute $P2, self, 'params'
    set $P3, $P1
.annotate 'line', 10438
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
.annotate 'line', 10443
    .return($P1)
.annotate 'line', 10444

.end # default_multi_sig


.sub '' :anon :subid('WSubId_14')
        .param pmc __ARG_1
.const 'Sub' WSubId_136 = "WSubId_136"
.annotate 'line', 10440
    $P1 = __ARG_1.'get_type'()
    .tailcall WSubId_136($P1)
.annotate 'line', 10441

.end # WSubId_14


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_26 = "WSubId_26"
.annotate 'line', 10447
    $P1 = __ARG_1.'get'()
.annotate 'line', 10448
    setattribute self, 'name', $P1
.annotate 'line', 10449
    $P2 = __ARG_1.'get'()
.annotate 'line', 10450
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 10451
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 10452
    $P2 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 10454
    WSubId_28('(', $P2)
.annotate 'line', 10455
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 10457
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 10458
    $P4 = $P3.'fullname'()
    WSubId_140(self, '__FUNCTION__', $P4)
.annotate 'line', 10460
    $P2 = __ARG_1.'get'()
.annotate 'line', 10461
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 10462
    WSubId_26('{', $P2)
  __label_2: # endif
.annotate 'line', 10463
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 10464
    .return(self)
.annotate 'line', 10465

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.annotate 'line', 10469
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 10470
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 10471
    unless_null $P1, __label_2
.annotate 'line', 10472
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 10473
    join $S1, ", ", $P1
    __ARG_1.'print'(' :multi(', $S1, ')')
  __label_1: # endif
.annotate 'line', 10475

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 10395
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 10397
    addattribute $P0, 'paramnum'
.annotate 'line', 10398
    addattribute $P0, 'lexnum'
.annotate 'line', 10399
    addattribute $P0, 'is_multi'
.annotate 'line', 10400
    addattribute $P0, 'multi_sig'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 10486
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 10487
    $P1 = __ARG_3.'getouter'()
.annotate 'line', 10488
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    unless $I1 goto __label_1
.annotate 'line', 10489
    $P4 = WSubId_25("local functions not allowed in inline", self)
    throw $P4
  __label_1: # endif
.annotate 'line', 10490
    $P1.'makesubid'()
.annotate 'line', 10491
    setattribute self, 'outer', $P1
.annotate 'line', 10492
    $P2 = self.'makesubid'()
.annotate 'line', 10493
    setattribute self, 'name', $P2
.annotate 'line', 10494
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 10495
    $P3 = __ARG_2.'get'()
.annotate 'line', 10496
    WSubId_28('{', $P3)
.annotate 'line', 10497
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P3, __ARG_2, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 10498
    __ARG_3.'addlocalfunction'(self)
.annotate 'line', 10499

.end # LocalFunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 10500
    .return(1)

.end # isanonymous


.sub 'ismethod' :method
.annotate 'line', 10501
    .return(0)

.end # ismethod


.sub 'needclosure' :method
.const 'Sub' WSubId_5 = "WSubId_5"
.annotate 'line', 10504
    getattribute $P4, self, 'lexicals'
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_2
    getattribute $P5, self, 'usedlexicals'
    isnull $I1, $P5
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10505
    .return(1)
  __label_1: # endif
.annotate 'line', 10506
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
.annotate 'line', 10506
    isnull $I1, $P4
    not $I1
    .return($I1)
.annotate 'line', 10507

.end # needclosure


.sub 'getsubid' :method
.annotate 'line', 10510
    getattribute $P1, self, 'subid'
    .return($P1)
.annotate 'line', 10511

.end # getsubid


.sub 'getparamnum' :method
.annotate 'line', 10515
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
.annotate 'line', 10516

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 10520
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
.annotate 'line', 10521

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10524
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 10525
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 10526
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 10528
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 10529
    self.'usesubid'($S1)
.annotate 'line', 10530
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 10532
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 10533
    $P2 = $P1.'getouter'()
.annotate 'line', 10534
    getattribute $P3, self, 'outer'
.annotate 'line', 10535
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
.annotate 'line', 10536
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 10537
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 10538
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 10539
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 10540
    eq $S3, 'P', __label_8
.annotate 'line', 10541
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 10542
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 10543
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 10544
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 10545
    .return($P4)
  __label_5: # endif
  __label_4: # endif
.annotate 'line', 10548
    .return(__ARG_2)
.annotate 'line', 10549

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
.annotate 'line', 10552
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 10553
    unless_null $P1, __label_1
.annotate 'line', 10554
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10555
    unless_null $P1, __label_2
.annotate 'line', 10558
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 10559
    unless_null $P1, __label_3
.annotate 'line', 10561
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
.annotate 'line', 10562
    getattribute $P2, self, 'outer'
.annotate 'line', 10563
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 10564
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10565
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 10566
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 10567
    self.'setusedlex'($S1, $S2)
  __label_6: # endif
  __label_5: # endif
    goto __label_4
  __label_3: # else
.annotate 'line', 10571
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 10573
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 10574
    WSubId_30('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 10575
    .return($P1)
.annotate 'line', 10576

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 10482
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10587
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10588

.end # MethodStatement


.sub 'ismethod' :method
.annotate 'line', 10589
    .return(1)

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 10583
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineParam' ]

.sub 'InlineParam' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 10603
    null $I1
.annotate 'line', 10604
    $P1 = __ARG_1.'get'()
.annotate 'line', 10605
    self.'initbase'($P1, __ARG_2)
.annotate 'line', 10606
    $P3 = $P1.'getidentifier'()
    set $S2, $P3
    ne $S2, "const", __label_1
.annotate 'line', 10607
    bor $I1, $I1, 1
.annotate 'line', 10608
    $P1 = __ARG_1.'get'()
  __label_1: # endif
.annotate 'line', 10610
    null $S1
.annotate 'line', 10611
    $P2 = __ARG_1.'get'()
.annotate 'line', 10612
    $P3 = $P2.'isop'(",")
    if $P3 goto __label_4
    $P3 = $P2.'isop'(")")
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 10613
    set $S1, '?'
.annotate 'line', 10614
    __ARG_1.'unget'($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 10617
    $P4 = $P1.'getidentifier'()
    $P3 = WSubId_127($P4)
    set $S1, $P3
.annotate 'line', 10618
    set $P1, $P2
  __label_3: # endif
.annotate 'line', 10620
    box $P3, $I1
    setattribute self, 'flags', $P3
.annotate 'line', 10621
    box $P3, $S1
    setattribute self, 'type', $P3
.annotate 'line', 10622
    setattribute self, 'name', $P1
.annotate 'line', 10623

.end # InlineParam


.sub 'isconst' :method
.annotate 'line', 10626
    getattribute $P1, self, 'flags'
    set $I2, $P1
    band $I1, $I2, 1
    .return($I1)
.annotate 'line', 10627

.end # isconst


.sub 'getname' :method
.annotate 'line', 10630
    getattribute $P1, self, 'name'
    .return($P1)
.annotate 'line', 10631

.end # getname


.sub 'gettype' :method
.annotate 'line', 10634
    getattribute $P1, self, 'type'
    .return($P1)
.annotate 'line', 10635

.end # gettype

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineParam' ]
.annotate 'line', 10596
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 10598
    addattribute $P0, 'flags'
.annotate 'line', 10599
    addattribute $P0, 'type'
.annotate 'line', 10600
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
.annotate 'line', 10646
    self.'BlockStatement'(__ARG_1, __ARG_3)
.annotate 'line', 10647
    $P1 = __ARG_2.'get'()
.annotate 'line', 10648
    WSubId_84("(", __ARG_2)
.annotate 'line', 10649
    $P2 = __ARG_2.'get'()
.annotate 'line', 10650
    null $P3
.annotate 'line', 10651
    $P6 = $P2.'isop'(")")
    isfalse $I1, $P6
    unless $I1 goto __label_1
.annotate 'line', 10652
    __ARG_2.'unget'($P2)
.annotate 'line', 10653
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P3, $P6
  __label_2: # do
.annotate 'line', 10655
    new $P6, [ 'Winxed'; 'Compiler'; 'InlineParam' ]
    $P6.'InlineParam'(__ARG_2, self)
    set $P4, $P6
.annotate 'line', 10656
    $P3.'push'($P4)
  __label_4: # continue
.annotate 'line', 10657
    $P2 = __ARG_2.'get'()
    $P6 = $P2.'isop'(",")
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 10658
    WSubId_28(")", $P2)
  __label_1: # endif
.annotate 'line', 10660
    $P2 = __ARG_2.'get'()
.annotate 'line', 10661
    null $S1
.annotate 'line', 10662
    $P6 = $P2.'iskeyword'('return')
    if_null $P6, __label_5
    unless $P6 goto __label_5
.annotate 'line', 10663
    $P2 = __ARG_2.'get'()
.annotate 'line', 10664
    $P6 = $P2.'getidentifier'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 10665
    $P6 = WSubId_127($S2)
    set $S1, $P6
.annotate 'line', 10666
    ne $S1, '', __label_8
.annotate 'line', 10667
    WSubId_25("Invalid return type", $P2)
  __label_8: # endif
.annotate 'line', 10668
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # else
.annotate 'line', 10671
    set $S1, 'v'
  __label_6: # endif
.annotate 'line', 10672
    WSubId_28("{", $P2)
.annotate 'line', 10673
    __ARG_2.'unget'($P2)
.annotate 'line', 10674
    $P5 = WSubId_125(__ARG_2, self)
.annotate 'line', 10676
    setattribute self, 'name', $P1
.annotate 'line', 10677
    box $P6, $S1
    setattribute self, 'rettype', $P6
.annotate 'line', 10678
    setattribute self, 'params', $P3
.annotate 'line', 10679
    setattribute self, 'body', $P5
.annotate 'line', 10680

.end # InlineStatement


.sub 'getouter' :method
.annotate 'line', 10681
    .return(self)

.end # getouter


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 10682
    .return("FAKEREG")

.end # createreg

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
.annotate 'line', 10638
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 10640
    addattribute $P0, 'name'
.annotate 'line', 10641
    addattribute $P0, 'rettype'
.annotate 'line', 10642
    addattribute $P0, 'body'
.annotate 'line', 10643
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]

.sub 'InlinedBlock' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10697
    getattribute $P7, __ARG_2, 'start'
    self.'BlockStatement'($P7, __ARG_1)
.annotate 'line', 10698
    setattribute self, 'inliner', __ARG_2
.annotate 'line', 10699
    setattribute self, 'inlined', __ARG_1
.annotate 'line', 10700
    getattribute $P1, __ARG_1, 'params'
.annotate 'line', 10701
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
.annotate 'line', 10702
    unless_null __ARG_3, __label_4
    null $I2
    goto __label_3
  __label_4:
    $P7 = __ARG_3.'numargs'()
    set $I2, $P7
  __label_3:
.annotate 'line', 10703
    eq $I1, $I2, __label_5
.annotate 'line', 10704
    WSubId_25("Wrong arguments in inline expansion", __ARG_2)
  __label_5: # endif
.annotate 'line', 10705
    null $I3
  __label_8: # for condition
    ge $I3, $I1, __label_7
.annotate 'line', 10706
    $P2 = $P1[$I3]
.annotate 'line', 10707
    $P3 = $P2.'getname'()
.annotate 'line', 10708
    $P4 = __ARG_3.'getfreearg'($I3)
.annotate 'line', 10709
    $P7 = $P2.'gettype'()
    null $S1
    if_null $P7, __label_9
    set $S1, $P7
  __label_9:
.annotate 'line', 10710
    ne $S1, '?', __label_10
.annotate 'line', 10711
    $P7 = $P4.'checkresult'()
    set $S1, $P7
  __label_10: # endif
.annotate 'line', 10712
    $P7 = $P2.'isconst'()
    set $I4, $P7
.annotate 'line', 10713
    box $P7, $I4
    unless $P7 goto __label_13
    $P7 = $P4.'hascompilevalue'()
  __label_13:
    if_null $P7, __label_11
    unless $P7 goto __label_11
.annotate 'line', 10714
    $P5 = self.'createconst'($P3, $S1)
.annotate 'line', 10715
    $P5.'setvalue'($P4)
    goto __label_12
  __label_11: # else
.annotate 'line', 10718
    self.'createvar'($P3, $S1, 0)
  __label_12: # endif
  __label_6: # for iteration
.annotate 'line', 10705
    inc $I3
    goto __label_8
  __label_7: # for end
.annotate 'line', 10720
    setattribute self, 'params', $P1
.annotate 'line', 10721
    setattribute self, 'args', __ARG_3
.annotate 'line', 10722
    getattribute $P6, __ARG_1, 'body'
.annotate 'line', 10723
    $P6 = $P6.'clone'(self)
.annotate 'line', 10724
    $P6 = $P6.'optimize'()
.annotate 'line', 10725
    setattribute self, 'body', $P6
.annotate 'line', 10726

.end # InlinedBlock


.sub 'getouter' :method
.annotate 'line', 10727
    .return(self)

.end # getouter


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 10730
    getattribute $P2, self, 'inliner'
    getattribute $P1, $P2, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
.annotate 'line', 10731

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 10734
    getattribute $P1, self, 'inliner'
    .tailcall $P1.'tempreg'(__ARG_1)
.annotate 'line', 10735

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 10738
    getattribute $P2, self, 'inliner'
    getattribute $P1, $P2, 'owner'
    $P1.'freetemps'()
.annotate 'line', 10739

.end # freetemps


.sub 'usesubid' :method
        .param string __ARG_1
.annotate 'line', 10742
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 10743
    unless_null $P1, __label_1
.annotate 'line', 10744
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 10745
    $P1[__ARG_1] = 1
.annotate 'line', 10746

.end # usesubid


.sub 'genlabel' :method
.annotate 'line', 10749
    getattribute $P1, self, 'inliner'
    .tailcall $P1.'genlabel'()
.annotate 'line', 10750

.end # genlabel


.sub 'getendlabel' :method
.annotate 'line', 10754
    getattribute $P1, self, 'endlabel'
    .return($P1)
.annotate 'line', 10755

.end # getendlabel


.sub 'getrettype' :method
.annotate 'line', 10758
    getattribute $P2, self, 'inlined'
    getattribute $P1, $P2, 'rettype'
    .return($P1)
.annotate 'line', 10759

.end # getrettype


.sub 'checkresult' :method
.annotate 'line', 10762
    getattribute $P2, self, 'inlined'
    getattribute $P1, $P2, 'rettype'
    .return($P1)
.annotate 'line', 10763

.end # checkresult


.sub 'getretreg' :method
.annotate 'line', 10766
    getattribute $P1, self, 'retreg'
    .return($P1)
.annotate 'line', 10767

.end # getretreg


.sub 'emit_it' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_139 = "WSubId_139"
.annotate 'line', 10770
    $P9 = __ARG_1.'getDebug'()
    if_null $P9, __label_1
    unless $P9 goto __label_1
.annotate 'line', 10771
    __ARG_1.'comment'("inlined start")
  __label_1: # endif
.annotate 'line', 10772
    $P10 = self.'genlabel'()
    setattribute self, 'endlabel', $P10
.annotate 'line', 10773
    getattribute $P1, self, 'params'
.annotate 'line', 10774
    getattribute $P2, self, 'args'
.annotate 'line', 10775
    unless_null $P1, __label_3
    null $I1
    goto __label_2
  __label_3:
    elements $I1, $P1
  __label_2:
.annotate 'line', 10776
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 10777
    $P3 = $P1[$I2]
.annotate 'line', 10778
    $P4 = $P2.'getfreearg'($I2)
.annotate 'line', 10779
    $P9 = $P3.'isconst'()
    unless $P9 goto __label_8
    $P9 = $P4.'hascompilevalue'()
  __label_8:
    if_null $P9, __label_7
    unless $P9 goto __label_7
    goto __label_4 # continue
  __label_7: # endif
.annotate 'line', 10781
    $P9 = $P3.'gettype'()
    null $S1
    if_null $P9, __label_9
    set $S1, $P9
  __label_9:
.annotate 'line', 10782
    $P9 = $P4.'checkresult'()
    null $S2
    if_null $P9, __label_10
    set $S2, $P9
  __label_10:
.annotate 'line', 10783
    $P11 = $P3.'getname'()
    $P10 = self.'getvar'($P11)
    $P9 = $P10.'getreg'()
    null $S3
    if_null $P9, __label_11
    set $S3, $P9
  __label_11:
.annotate 'line', 10784
    iseq $I3, $S1, '?'
    if $I3 goto __label_14
    iseq $I3, $S2, $S1
  __label_14:
    unless $I3 goto __label_12
.annotate 'line', 10785
    $P4.'emit_init'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
.annotate 'line', 10787
    $P9 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 10788
    ne $S1, 'P', __label_16
.annotate 'line', 10789
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_17
  __label_16: # else
.annotate 'line', 10791
    __ARG_1.'emitset'($S3, $S4)
  __label_17: # endif
  __label_13: # endif
  __label_4: # for iteration
.annotate 'line', 10776
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 10794
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
.annotate 'line', 10794
    join $S5, "", $P9
    __ARG_1.'print'($S5)
.annotate 'line', 10795
    getattribute $P9, self, 'body'
    $P9.'emit'(__ARG_1)
.annotate 'line', 10796
    getattribute $P9, self, 'endlabel'
    __ARG_1.'emitlabel'($P9)
.annotate 'line', 10797

.end # emit_it


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10800
    $P1 = self.'getrettype'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10801
    box $P1, __ARG_2
    setattribute self, 'retreg', $P1
.annotate 'line', 10802
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
.annotate 'line', 10803
    self.'emit_it'(__ARG_1)
.annotate 'line', 10804
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 10805
    __ARG_1.'comment'("inlined end")
  __label_2: # endif
.annotate 'line', 10806

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10809
    self.'emit_it'(__ARG_1)
.annotate 'line', 10810
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10811
    __ARG_1.'comment'("inlined end")
  __label_1: # endif
.annotate 'line', 10812

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10815
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10816
    ne $S1, 'v', __label_2
.annotate 'line', 10817
    WSubId_25("Cannot get a result from a void inline", self)
  __label_2: # endif
.annotate 'line', 10818
    $P2 = self.'createreg'($S1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 10819
    box $P2, $S2
    setattribute self, 'retreg', $P2
.annotate 'line', 10820
    self.'emit_it'(__ARG_1)
.annotate 'line', 10821
    ne $S1, 'P', __label_4
.annotate 'line', 10823
    $P1 = self.'tempreg'('P')
.annotate 'line', 10824
    __ARG_1.'emitset'($P1, $S2)
.annotate 'line', 10825
    set $S2, $P1
  __label_4: # endif
.annotate 'line', 10827
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 10828
    __ARG_1.'comment'("inlined end")
  __label_5: # endif
.annotate 'line', 10829
    .return($S2)
.annotate 'line', 10830

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]
.annotate 'line', 10685
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 10687
    addattribute $P0, 'inliner'
.annotate 'line', 10688
    addattribute $P0, 'inlined'
.annotate 'line', 10689
    addattribute $P0, 'usedsubids'
.annotate 'line', 10690
    addattribute $P0, 'params'
.annotate 'line', 10691
    addattribute $P0, 'args'
.annotate 'line', 10692
    addattribute $P0, 'body'
.annotate 'line', 10693
    addattribute $P0, 'endlabel'
.annotate 'line', 10694
    addattribute $P0, 'retreg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineRef' ]

.sub 'InlineRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10839
    self.'Expr'(__ARG_2, __ARG_1)
.annotate 'line', 10840
    setattribute self, 'inlined', __ARG_3
.annotate 'line', 10841

.end # InlineRef


.sub 'checkresult' :method
.annotate 'line', 10842
    .return('v')

.end # checkresult


.sub 'misused' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10845
    getattribute $P1, self, 'start'
    WSubId_25("inline used by reference", $P1)
.annotate 'line', 10846

.end # misused


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10849
    self.'misused'()
.annotate 'line', 10850

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 10853
    self.'misused'()
.annotate 'line', 10854

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10857
    self.'misused'()
.annotate 'line', 10858

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
.annotate 'line', 10833
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 10835
    addattribute $P0, 'inlined'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]

.sub 'CallInlineExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 10866
    getattribute $P1, __ARG_2, 'start'
    self.'Expr'($P1, __ARG_1)
.annotate 'line', 10867
    new $P3, [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]
    getattribute $P4, __ARG_2, 'inlined'
    $P3.'InlinedBlock'($P4, __ARG_1, __ARG_3)
    set $P2, $P3
    setattribute self, 'block', $P2
.annotate 'line', 10868

.end # CallInlineExpr


.sub 'checkresult' :method
.annotate 'line', 10869
    getattribute $P1, self, 'block'
    .tailcall $P1.'checkresult'()

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
.annotate 'line', 10872
    getattribute $P1, self, 'block'
    $P1.'emit_void'(__ARG_1)
.annotate 'line', 10873

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 10876
    getattribute $P1, self, 'block'
    .tailcall $P1.'emit_get'(__ARG_1)
.annotate 'line', 10877

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 10880
    getattribute $P1, self, 'block'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 10881

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]
.annotate 'line', 10861
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
.annotate 'line', 10863
    addattribute $P0, 'block'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_127 = "WSubId_127"
.annotate 'line', 10895
    $P1 = __ARG_1.'get'()
.annotate 'line', 10896
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 10897
    WSubId_27($P1)
  __label_1: # endif
.annotate 'line', 10898
    $P2 = __ARG_1.'get'()
.annotate 'line', 10899
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 10900
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_127($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 10901
    set $P1, $P2
.annotate 'line', 10902
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 10903
    $P2 = __ARG_1.'get'()
  __label_2: # endif
.annotate 'line', 10905
    setattribute self, 'name', $P1
.annotate 'line', 10906
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 10907
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 10908
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 10909
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 10911
    __ARG_1.'unget'($P2)
  __label_5: # endif
.annotate 'line', 10912

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 10915
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 10916
    getattribute $P1, self, 'modifiers'
.annotate 'line', 10917
    if_null $P1, __label_1
.annotate 'line', 10918
    getattribute $P2, self, 'name'
.annotate 'line', 10919
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
  __label_1: # endif
.annotate 'line', 10921

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 10890
    addattribute $P0, 'name'
.annotate 'line', 10891
    addattribute $P0, 'modifiers'
.annotate 'line', 10892
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_141')
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10926
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
.annotate 'line', 10927

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_141 = "WSubId_141"
.annotate 'line', 10934
    $P2 = WSubId_67(__ARG_1, __ARG_2, WSubId_141, ')')
    setattribute self, 'params', $P2
.annotate 'line', 10935

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 10938
    __ARG_1.'print'('(')
.annotate 'line', 10939
    set $S1, ''
.annotate 'line', 10940
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10941
    __ARG_1.'print'($S1)
.annotate 'line', 10942
    $P1.'emit'(__ARG_1)
.annotate 'line', 10943
    set $S1, ', '
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10945
    __ARG_1.'print'(')')
.annotate 'line', 10946

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 10931
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 10955
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 10956
    setattribute self, 'params', __ARG_3
.annotate 'line', 10957
    setattribute self, 'expr', __ARG_4
.annotate 'line', 10958

.end # MultiAssignStatement


.sub 'optimize' :method
.annotate 'line', 10961
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 10962
    .return(self)
.annotate 'line', 10963

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 10966
    getattribute $P1, self, 'expr'
.annotate 'line', 10967
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 10968
    WSubId_25('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 10969
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 10970
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 10971
    __ARG_1.'print'('    ')
.annotate 'line', 10972
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 10973
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 10974
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 10975
    __ARG_1.'say'()
.annotate 'line', 10976

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 10949
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 10951
    addattribute $P0, 'params'
.annotate 'line', 10952
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 10993
    self.'initbase'(__ARG_2, __ARG_1)
.annotate 'line', 10994

.end # ClassSpecifier


.sub 'reftype' :method
.annotate 'line', 10995
    .return(0)

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 10999
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
.annotate 'line', 11000

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 10989
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11008
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 11009
    setattribute self, 'name', __ARG_2
.annotate 'line', 11010

.end # ClassSpecifierStr


.sub 'reftype' :method
.annotate 'line', 11011
    .return(1)

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11015
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 11016
    __ARG_1.'print'($S1)
.annotate 'line', 11017

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 11003
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 11005
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
.annotate 'line', 11026
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 11027
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 11028
    $P2 = __ARG_1.'get'()
.annotate 'line', 11029
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 11030
    WSubId_70('literal string', $P2)
  __label_1: # endif
.annotate 'line', 11031
    $P3 = $P2.'rawstring'()
    push $P1, $P3
.annotate 'line', 11032
    $P2 = __ARG_1.'get'()
.annotate 'line', 11033
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 11034
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
.annotate 'line', 11036
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_4 # break
  __label_3: # default
.annotate 'line', 11040
    WSubId_71('token in class key', $P2)
  __label_4: # switch end
  __label_7: # do
.annotate 'line', 11043
    $P2 = __ARG_1.'get'()
.annotate 'line', 11044
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 11045
    WSubId_70('literal string', $P2)
  __label_10: # endif
.annotate 'line', 11046
    $P3 = $P2.'rawstring'()
    push $P1, $P3
  __label_9: # continue
.annotate 'line', 11047
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 11048
    WSubId_28(']', $P2)
  __label_2: # endif
.annotate 'line', 11050
    setattribute self, 'key', $P1
.annotate 'line', 11051

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
.annotate 'line', 11052
    .return(2)

.end # reftype


.sub 'hasHLL' :method
.annotate 'line', 11055
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
.annotate 'line', 11056

.end # hasHLL


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 11060
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 11061
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 11062

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11065
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
.annotate 'line', 11065
    __ARG_1.'print'($S2)
.annotate 'line', 11066

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 11020
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 11022
    addattribute $P0, 'key'
.annotate 'line', 11023
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11074
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 11075
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 11076
    null $P2
  __label_2: # while
.annotate 'line', 11077
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 11078
    $P2 = __ARG_1.'get'()
.annotate 'line', 11079
    set $S1, $P2
    push $P1, $S1
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 11081
    __ARG_1.'unget'($P2)
.annotate 'line', 11082
    setattribute self, 'key', $P1
.annotate 'line', 11083

.end # ClassSpecifierId


.sub 'clone' :method
        .param pmc __ARG_1
.annotate 'line', 11086
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 11087
    getattribute $P2, self, 'start'
    $P1.'ClassSpecifier'(__ARG_1, $P2)
.annotate 'line', 11088
    getattribute $P3, self, 'key'
    setattribute $P1, 'key', $P3
.annotate 'line', 11089
    .return($P1)
.annotate 'line', 11090

.end # clone


.sub 'reftype' :method
.annotate 'line', 11091
    .return(3)

.end # reftype


.sub 'last' :method
.annotate 'line', 11095
    getattribute $P1, self, 'key'
.annotate 'line', 11096
    $P2 = $P1[-1]
    .return($P2)
.annotate 'line', 11097

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
.annotate 'line', 11100
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 11101
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
.annotate 'line', 11102

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_99 = "WSubId_99"
.annotate 'line', 11106
    getattribute $P3, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P3, 2)
.annotate 'line', 11107
    unless_null $P1, __label_1
.annotate 'line', 11108
    getattribute $P3, self, 'key'
    join $S2, ".", $P3
    getattribute $P4, self, 'start'
    WSubId_99(__ARG_1, $S2, $P4)
.annotate 'line', 11109
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
.annotate 'line', 11109
    __ARG_1.'print'($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11111
    $P3 = $P1.'getclasskey'()
    __ARG_1.'print'($P3)
  __label_2: # endif
.annotate 'line', 11112

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.annotate 'line', 11115
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 11116
    unless_null $P1, __label_1
.annotate 'line', 11117
    getattribute $P3, self, 'key'
    join $S2, ".", $P3
    getattribute $P4, self, 'start'
    WSubId_99(__ARG_1, $S2, $P4)
.annotate 'line', 11118
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
.annotate 'line', 11118
    __ARG_1.'say'("new ", __ARG_3, ", ", $S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11121
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
  __label_2: # endif
.annotate 'line', 11123

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 11069
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 11071
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11136
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 11137
    setattribute self, 'name', __ARG_2
.annotate 'line', 11138
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 11139
    setattribute self, 'classns', $P1
.annotate 'line', 11140

.end # ClassBase


.sub 'getpath' :method
.annotate 'line', 11143
    getattribute $P1, self, 'classns'
    .return($P1)
.annotate 'line', 11144

.end # getpath


.sub 'getclasskey' :method
.annotate 'line', 11147
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
.annotate 'line', 11148

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 11130
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 11132
    addattribute $P0, 'name'
.annotate 'line', 11133
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]

.sub 'FunctionContainer' :method
.annotate 'line', 11156
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions', $P2
.annotate 'line', 11157

.end # FunctionContainer


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 11163
    getattribute $P1, self, 'functions'
.annotate 'line', 11164
    getattribute $P3, __ARG_1, 'name'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 11165
    $P2 = $P1[$S1]
.annotate 'line', 11166
    unless_null $P2, __label_2
.annotate 'line', 11167
    $P1[$S1] = __ARG_1
    goto __label_3
  __label_2: # else
.annotate 'line', 11169
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_4
.annotate 'line', 11170
    $P2.'setmulti'()
  __label_4: # endif
.annotate 'line', 11171
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_5
.annotate 'line', 11172
    __ARG_1.'setmulti'()
  __label_5: # endif
  __label_3: # endif
.annotate 'line', 11174

.end # addfunction


.sub 'find' :method
        .param string __ARG_1
.annotate 'line', 11177
    getattribute $P1, self, 'functions'
.annotate 'line', 11178
    $P2 = $P1[__ARG_1]
    .return($P2)
.annotate 'line', 11179

.end # find

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
.annotate 'line', 11153
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
.annotate 'line', 11193
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11194
    self.'VarContainer'()
.annotate 'line', 11195
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P8.'FunctionContainer'()
    set $P8, $P8
    setattribute self, 'funcont', $P8
.annotate 'line', 11196
    setattribute self, 'parent', __ARG_3
.annotate 'line', 11197
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 11198
    setattribute self, 'items', $P1
.annotate 'line', 11199
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 11200
    setattribute self, 'members', $P2
.annotate 'line', 11202
    $P3 = __ARG_4.'get'()
.annotate 'line', 11203
    $P7 = $P3.'isop'(':')
    if_null $P7, __label_1
    unless $P7 goto __label_1
.annotate 'line', 11204
    $P9 = WSubId_67(__ARG_4, self, WSubId_92)
    setattribute self, 'bases', $P9
.annotate 'line', 11205
    $P3 = __ARG_4.'get'()
  __label_1: # endif
.annotate 'line', 11207
    WSubId_28('{', $P3)
.annotate 'line', 11209
    getattribute $P8, self, 'classns'
    $P7 = $P8.'fullname'()
    WSubId_140(self, '__CLASS__', $P7)
.annotate 'line', 11211
    $P3 = __ARG_4.'get'()
  __label_4: # for condition
    $P7 = $P3.'isop'('}')
    isfalse $I1, $P7
    unless $I1 goto __label_3
.annotate 'line', 11212
    $P8 = $P3.'checkkeyword'()
    set $S1, $P8
    if $S1 == 'function' goto __label_7
    if $S1 == 'var' goto __label_8
    if $S1 == 'const' goto __label_9
    goto __label_5
  __label_7: # case
.annotate 'line', 11214
    new $P9, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P9.'MethodStatement'($P3, __ARG_4, self)
    set $P4, $P9
.annotate 'line', 11215
    self.'addmethod'($P4)
.annotate 'line', 11216
    push $P1, $P4
    goto __label_6 # break
  __label_8: # case
.annotate 'line', 11219
    $P5 = __ARG_4.'get'()
.annotate 'line', 11220
    $P10 = $P5.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 11221
    WSubId_70("member identifier", $P5)
  __label_10: # endif
.annotate 'line', 11222
    push $P2, $P5
.annotate 'line', 11223
    $P3 = __ARG_4.'get'()
.annotate 'line', 11224
    $P11 = $P3.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 11225
    WSubId_70("';' in member declaration", $P3)
  __label_11: # endif
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 11228
    $P6 = WSubId_74($P3, __ARG_4, self)
.annotate 'line', 11229
    push $P1, $P6
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 11232
    WSubId_71("item in class", $P3)
  __label_6: # switch end
  __label_2: # for iteration
.annotate 'line', 11211
    $P3 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 11235

.end # ClassStatement


.sub 'addmethod' :method
        .param pmc __ARG_1
.annotate 'line', 11239
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 11240

.end # addmethod


.sub 'generatesubid' :method
.annotate 'line', 11243
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 11244

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 11247
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
.annotate 'line', 11248

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
.annotate 'line', 11251
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 11252

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 11255
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
.annotate 'line', 11256

.end # use_builtin


.sub 'optimize' :method
.annotate 'line', 11259
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
.annotate 'line', 11260
    .return(self)
.annotate 'line', 11261

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 11264
    getattribute $P8, self, 'classns'
    $P8.'emitnamespace'(__ARG_1)
.annotate 'line', 11265
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
.annotate 'line', 11267
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 11269
    $P8 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P8)
.annotate 'line', 11270
    set $I1, 1
.annotate 'line', 11271
    getattribute $P8, self, 'bases'
    if_null $P8, __label_6
    iter $P10, $P8
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P1, $P10
.annotate 'line', 11272
    $P1.'annotate'(__ARG_1)
.annotate 'line', 11273
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 11274
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 11275
    getattribute $P8, self, 'parent'
    $P1.'emit'(__ARG_1, $P8)
.annotate 'line', 11276
    __ARG_1.'say'()
.annotate 'line', 11277
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
    goto __label_5
  __label_6: # endfor
.annotate 'line', 11279
    getattribute $P8, self, 'members'
    if_null $P8, __label_8
    iter $P11, $P8
    set $P11, 0
  __label_7: # for iteration
    unless $P11 goto __label_8
    shift $P2, $P11
.annotate 'line', 11280
    __ARG_1.'annotate'($P2)
.annotate 'line', 11281
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
    goto __label_7
  __label_8: # endfor
.annotate 'line', 11284
    __ARG_1.'say'('.end')
.annotate 'line', 11285

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 11182
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 11184
    addattribute $P0, 'parent'
.annotate 'line', 11185
    addattribute $P0, 'bases'
.annotate 'line', 11186
    addattribute $P0, 'constants'
.annotate 'line', 11187
    addattribute $P0, 'items'
.annotate 'line', 11188
    addattribute $P0, 'members'
.annotate 'line', 11189
    addattribute $P0, 'funcont'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11292
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11293

.end # DeclareClassStatement


.sub 'optimize' :method
.annotate 'line', 11296
    .return(self)
.annotate 'line', 11297

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 11288
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_143')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11305
    $P1 = __ARG_2.'get'()
.annotate 'line', 11306
    $P2 = __ARG_2.'get'()
.annotate 'line', 11307
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 11308
    null $P4
  __label_3: # for condition
.annotate 'line', 11310
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 11311
    $P3.'push'($P1)
.annotate 'line', 11312
    $P1 = __ARG_2.'get'()
  __label_1: # for iteration
.annotate 'line', 11310
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 11315
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 11316
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 11317
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 11318
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
    goto __label_5
  __label_4: # else
.annotate 'line', 11321
    __ARG_2.'unget'($P2)
.annotate 'line', 11322
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 11323
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 11324
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
  __label_5: # endif
.annotate 'line', 11326

.end # parseClass


.sub 'open_include' :subid('WSubId_142')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 11337
    getinterp $P1
.annotate 'line', 11340
    $P2 = $P1[9]
.annotate 'line', 11341
    $P3 = $P2[0]
.annotate 'line', 11342
    null $P4
.annotate 'line', 11343
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
.annotate 'line', 11344
    concat $S2, $S1, __ARG_1
.annotate 'line', 11345
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
.annotate 'line', 11346
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 11347
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 11348
    pop_eh
    goto __label_4
  __label_3:
.annotate 'line', 11345
    .get_results($P7)
    finalize $P7
    pop_eh
  __label_4:
    goto __label_1
  __label_2: # endfor
.annotate 'line', 11353
    isnull $I1, $P4
    box $P6, $I1
    if $P6 goto __label_8
    $P6 = $P4.'is_closed'()
  __label_8:
    if_null $P6, __label_7
    unless $P6 goto __label_7
.annotate 'line', 11354
    WSubId_25('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 11355
    $P4.'encoding'("utf8")
.annotate 'line', 11356
    .return($P4)
.annotate 'line', 11357

.end # open_include


.sub 'include_parrot' :subid('WSubId_145')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_142 = "WSubId_142"
.const 'Sub' WSubId_44 = "WSubId_44"
.annotate 'line', 11361
    $P1 = __ARG_2.'get'()
.annotate 'line', 11362
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 11363
    WSubId_70('literal string', $P1)
  __label_1: # endif
.annotate 'line', 11364
    WSubId_84(';', __ARG_2)
.annotate 'line', 11366
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 11367
    $P2 = WSubId_142($S1, __ARG_1)
.annotate 'line', 11372
    $P4 = $P2.'readline'()
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
  __label_5: # for condition
    $P5 = $P2.'eof'()
    isfalse $I4, $P5
    unless $I4 goto __label_4
.annotate 'line', 11373
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
.annotate 'line', 11374
    set $I1, 12
.annotate 'line', 11375
    null $S3
  __label_9: # while
.annotate 'line', 11376
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 11377
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 11378
    set $I2, $I1
  __label_12: # while
.annotate 'line', 11379
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 11380
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 11381
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 11382
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 11384
    sub $I4, $I2, $I1
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 11385
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 11386
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 11387
    set $I1, $I2
  __label_22: # while
.annotate 'line', 11388
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 11389
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 11390
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 11391
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 11393
    sub $I4, $I2, $I1
    substr $S5, $S2, $I1, $I4
.annotate 'line', 11395
    null $I3
.annotate 'line', 11396
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 11397
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 11399
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 11400
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 11402
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 11401
    $P4 = WSubId_44(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
  __label_7: # endif
  __label_3: # for iteration
.annotate 'line', 11372
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 11406
    $P2.'close'()
.annotate 'line', 11407

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_146')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_142 = "WSubId_142"
.annotate 'line', 11413
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 11414
    WSubId_25("Must be used at root namespace level", __ARG_1)
  __label_1: # endif
.annotate 'line', 11415
    $P1 = __ARG_2.'get'()
.annotate 'line', 11416
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 11417
    WSubId_70('literal string', $P1)
  __label_2: # endif
.annotate 'line', 11418
    WSubId_84(';', __ARG_2)
.annotate 'line', 11420
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 11421
    $P2 = WSubId_142($S1, __ARG_1)
.annotate 'line', 11423
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P2, $S1, 0)
    set $P3, $P4
.annotate 'line', 11424
    __ARG_3.'parse'($P3)
.annotate 'line', 11426
    $P2.'close'()
.annotate 'line', 11427

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
.annotate 'line', 11433
    $P1 = __ARG_2.'get'()
.annotate 'line', 11434
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 11435
    WSubId_88(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 11436
    WSubId_84(';', __ARG_2)
.annotate 'line', 11437
    .return()
  __label_1: # endif
.annotate 'line', 11439
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
.annotate 'line', 11440
    __ARG_2.'unget'($P1)
.annotate 'line', 11441
    $P2 = WSubId_85(__ARG_2)
.annotate 'line', 11442
    elements $I1, $P2
.annotate 'line', 11443
    ge $I1, 1, __label_3
.annotate 'line', 11444
    WSubId_25('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 11445
    WSubId_84(';', __ARG_2)
.annotate 'line', 11446
    __ARG_3.'use'($P2)
.annotate 'line', 11447
    .return()
  __label_2: # endif
.annotate 'line', 11449
    $P1 = __ARG_2.'get'()
.annotate 'line', 11451
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 11458
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 11452
    __ARG_2.'warn'("using extern 'file'; is deprecated, use $loadlib instead.", $P1)
.annotate 'line', 11454
    null $S1
    if_null $P1, __label_8
    set $S1, $P1
  __label_8:
.annotate 'line', 11455
    __ARG_3.'addlib'($S1)
.annotate 'line', 11456
    WSubId_84(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 11459
    __ARG_2.'unget'($P1)
.annotate 'line', 11460
    $P3 = WSubId_85(__ARG_2)
.annotate 'line', 11461
    $P1 = __ARG_2.'get'()
.annotate 'line', 11462
    $P5 = $P1.'isop'(';')
    isfalse $I3, $P5
    unless $I3 goto __label_9
.annotate 'line', 11463
    __ARG_2.'unget'($P1)
.annotate 'line', 11464
    null $P5
    $P4 = WSubId_67(__ARG_2, $P5, WSubId_87, ';')
.annotate 'line', 11465
    __ARG_3.'addextern'($P3, $P4)
  __label_9: # endif
.annotate 'line', 11467
    join $S3, '/', $P3
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 11468
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 11471
    WSubId_70('string literal or identifier', $P1)
  __label_4: # switch end
.annotate 'line', 11473

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 11483
    setattribute self, 'module', __ARG_1
.annotate 'line', 11484
    setattribute self, 'names', __ARG_2
.annotate 'line', 11485

.end # External


.sub 'emit' :subid('WSubId_15') :method
        .param pmc __ARG_1
.annotate 'line', 11486
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_16 = "WSubId_16"
.annotate 'line', 11490
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 11500
    getattribute $P4, self, 'module'
    join $S1, "'; '", $P4
    concat $S2, "['parrot'; '", $S1
    concat $S2, $S2, "']"
.annotate 'line', 11499
    __ARG_1.'emitget_root_namespace'("srcns", $S2)
.annotate 'line', 11502
    getattribute $P1, self, 'names'
.annotate 'line', 11503
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
.annotate 'line', 11508
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
.annotate 'line', 11514

.end # emit


.sub '' :anon :subid('WSubId_16') :outer('WSubId_15')
        .param string __ARG_2
.annotate 'line', 11503
    find_lex $P1, '__WLEX_1'
.annotate 'line', 11505
    $P1.'say'("    push symbols, '", __ARG_2, "'")
.annotate 'line', 11506

.end # WSubId_16

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 11479
    addattribute $P0, 'module'
.annotate 'line', 11480
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
.annotate 'line', 11524
    new $P1, ['ResizableStringArray']
.annotate 'line', 11525
    unless __ARG_2 goto __label_1
.annotate 'line', 11526
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 11528
    if_null __ARG_1, __label_3
.annotate 'line', 11529
    push $P1, __ARG_1
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 11531
    setattribute self, 'path', $P1
.annotate 'line', 11532

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
.annotate 'line', 11535
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 11536
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 11537
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 11538
    push $P2, __ARG_1
.annotate 'line', 11539
    setattribute $P1, 'path', $P2
.annotate 'line', 11540
    .return($P1)
.annotate 'line', 11541

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
.annotate 'line', 11544
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 11545
    getattribute $P2, self, 'hll'
.annotate 'line', 11546
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 11547
    unless_null $P2, __label_3
.annotate 'line', 11548
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 11550
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
.annotate 'line', 11551

.end # samehllas


.sub 'fullname' :method
.annotate 'line', 11554
    getattribute $P1, self, 'path'
    join $S1, '.', $P1
.annotate 'line', 11555
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
.annotate 'line', 11556
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 11558
    .return($S1)
  __label_2: # endif
.annotate 'line', 11559

.end # fullname


.sub 'getparrotkey' :method
.annotate 'line', 11562
    getattribute $P1, self, 'path'
.annotate 'line', 11563
    null $S1
.annotate 'line', 11564
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 11565
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 11566
    .return($S1)
.annotate 'line', 11567

.end # getparrotkey


.sub 'getparrotrootkey' :method
.annotate 'line', 11570
    getattribute $P1, self, 'path'
.annotate 'line', 11571
    getattribute $P2, self, 'hll'
.annotate 'line', 11572
    set $S1, "[ '"
.annotate 'line', 11573
    if_null $P2, __label_1
    set $S3, $P2
.annotate 'line', 11576
    downcase $S2, $S3
    concat $S1, $S1, $S2
    goto __label_2
  __label_1: # else
.annotate 'line', 11579
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 11580
    concat $S1, $S1, "'"
.annotate 'line', 11581
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 11582
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 11583
    concat $S1, $S1, " ]"
.annotate 'line', 11584
    .return($S1)
.annotate 'line', 11585

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
.annotate 'line', 11588
    getattribute $P1, self, 'path'
.annotate 'line', 11589
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 11590
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 11591
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 11592
    __ARG_1.'say'("]")
.annotate 'line', 11593

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 11596
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11598
    $P3 = self.'getparrotkey'()
.annotate 'line', 11597
    $P2 = WSubId_45("    new %0, %1", __ARG_3, $P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11601
    $P5 = self.'getparrotrootkey'()
.annotate 'line', 11600
    $P4 = WSubId_45("    root_new %0, %1", __ARG_3, $P5)
    __ARG_1.'print'($P4)
  __label_2: # endif
.annotate 'line', 11602
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 11603
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 11604
    __ARG_1.'say'()
.annotate 'line', 11605

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 11608
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11609
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11611
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
.annotate 'line', 11612

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 11615
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 11617
    $P5 = self.'getparrotkey'()
.annotate 'line', 11616
    $P4 = WSubId_45("    get_class %0, %1", __ARG_3, $P5)
    __ARG_1.'say'($P4)
    goto __label_2
  __label_1: # else
.annotate 'line', 11622
    getattribute $P1, self, 'hll'
.annotate 'line', 11623
    getattribute $P3, self, 'path'
    clone $P2, $P3
.annotate 'line', 11624
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 11625
    if_null $P1, __label_5
    set $S3, $P1
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 11626
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 11629
    join $S3, "'; '", $P2
.annotate 'line', 11627
    $P3 = WSubId_45("    get_root_global %0, ['%1'; '%2'], '%3'", __ARG_3, $S2, $S3, $S1)
    __ARG_1.'say'($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 11631
    $P4 = WSubId_45("    get_root_global %0, ['%1'], '%2'", __ARG_3, $S2, $S1)
    __ARG_1.'say'($P4)
  __label_7: # endif
.annotate 'line', 11634
    $P3 = WSubId_45("    get_class %0, %0", __ARG_3)
    __ARG_1.'say'($P3)
  __label_2: # endif
.annotate 'line', 11636

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 11639
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 11640
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 11642
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
.annotate 'line', 11643

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 11519
    addattribute $P0, 'hll'
.annotate 'line', 11520
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_140 = "WSubId_140"
.annotate 'line', 11662
    self.'VarContainer'()
.annotate 'line', 11663
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 11664
    unless_null __ARG_2, __label_1
.annotate 'line', 11665
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 11666
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 11667
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 11668
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P2.'FunctionContainer'()
    set $P2, $P2
    setattribute self, 'funcont', $P2
.annotate 'line', 11669
    $P1 = __ARG_1.'fullname'()
    WSubId_140(self, '__NAMESPACE__', $P1)
    goto __label_2
  __label_1: # else
.annotate 'line', 11672
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 11673
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 11674
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 11675
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 11676
    getattribute $P2, __ARG_2, 'funcont'
    setattribute self, 'funcont', $P2
  __label_2: # endif
.annotate 'line', 11678
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
.annotate 'line', 11679

.end # NamespaceBase


.sub 'addfunction' :method
        .param pmc __ARG_1
.annotate 'line', 11682
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)
.annotate 'line', 11683

.end # addfunction


.sub 'fixnamespaces' :subid('WSubId_17') :method
.annotate 'line', 11684
.lex '__WLEX_1', $P1
.const 'Sub' WSubId_5 = "WSubId_5"
.const 'Sub' WSubId_7 = "WSubId_7"
.const 'Sub' WSubId_18 = "WSubId_18"
.annotate 'line', 11686
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
.annotate 'line', 11687
    $P1 = WSubId_7(self, "usenamespace")
.annotate 'line', 11688
    getattribute $P5, self, 'usednamespaces'
.annotate 'line', 11689
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
.annotate 'line', 11690

.end # fixnamespaces


.sub '' :anon :subid('WSubId_18') :outer('WSubId_17')
        .param pmc __ARG_1
.annotate 'line', 11689
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
.annotate 'line', 11689

.end # WSubId_18


.sub 'getpath' :method
.annotate 'line', 11693
    getattribute $P1, self, 'nspath'
    .return($P1)
.annotate 'line', 11694

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
.annotate 'line', 11697
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 11698
    .return()
  __label_1: # endif
.annotate 'line', 11699
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 11700
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
.annotate 'line', 11700
    if_null $P7, __label_2
.annotate 'line', 11701
    .return()
  __label_2: # endif
.annotate 'line', 11702
    push $P1, __ARG_1
.annotate 'line', 11703

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
.annotate 'line', 11706
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 11707
    if_null $P1, __label_1
.annotate 'line', 11708
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 11709
    self.'addfunction'($P1)
  __label_3: # endif
    goto __label_2
  __label_1: # else
.annotate 'line', 11712
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 11713
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 11714
    if_null $P2, __label_5
.annotate 'line', 11715
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 11716
    if_null $P1, __label_6
.annotate 'line', 11717
    self.'createvarused'($S1, $P1)
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif
.annotate 'line', 11720

.end # use


.sub 'getusedns' :subid('WSubId_19') :method
        .param string __ARG_1
.annotate 'line', 11721
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_20 = "WSubId_20"
.annotate 'line', 11723
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 11724
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
.annotate 'line', 11723
    .return($P6)
.annotate 'line', 11725

.end # getusedns


.sub '' :anon :subid('WSubId_20') :outer('WSubId_19')
        .param pmc __ARG_2
.annotate 'line', 11724
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_20


.sub 'getlocalns' :subid('WSubId_21') :method
        .param string __ARG_1
.annotate 'line', 11726
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
.annotate 'line', 11728
    getattribute $P2, self, 'namespaces'
.annotate 'line', 11729
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
.annotate 'line', 11730
    if_null $P1, __label_5
.annotate 'line', 11731
    .return($P1)
  __label_5: # endif
.annotate 'line', 11732
    .tailcall self.'getusedns'(__ARG_1)
.annotate 'line', 11733

.end # getlocalns


.sub '' :anon :subid('WSubId_22') :outer('WSubId_21')
        .param pmc __ARG_2
.annotate 'line', 11729
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
.annotate 'line', 11737
    new $P3, [ 'Winxed'; 'Compiler'; 'External' ]
    $P3.'External'(__ARG_1, __ARG_2)
    set $P1, $P3
.annotate 'line', 11738
    getattribute $P2, self, 'externals'
.annotate 'line', 11739
    unless_null $P2, __label_1
.annotate 'line', 11740
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 11742
    push $P2, $P1
  __label_2: # endif
.annotate 'line', 11743

.end # addextern


.sub 'checkclass_base' :subid('WSubId_23') :method
        .param string __ARG_1
.annotate 'line', 11745
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_24 = "WSubId_24"
.annotate 'line', 11747
    getattribute $P3, self, 'classes'
.annotate 'line', 11748
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
.annotate 'line', 11749
    if_null $P1, __label_5
.annotate 'line', 11750
    .return($P1)
  __label_5: # endif
.annotate 'line', 11751
    getattribute $P7, self, 'usednamespaces'
    if_null $P7, __label_7
    iter $P8, $P7
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P2, $P8
.annotate 'line', 11752
    $P1 = $P2.'checkclass_base'(__ARG_1)
    if_null $P1, __label_8
.annotate 'line', 11753
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    null $P7
.annotate 'line', 11754
    .return($P7)
.annotate 'line', 11755

.end # checkclass_base


.sub '' :anon :subid('WSubId_24') :outer('WSubId_23')
        .param pmc __ARG_2
.annotate 'line', 11748
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_24


.sub 'findsymbolbyname' :method
        .param string __ARG_1
.annotate 'line', 11758
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 11759
    if_null $P1, __label_1
.annotate 'line', 11760
    .return($P1)
  __label_1: # endif
.annotate 'line', 11761
    getattribute $P2, self, 'funcont'
.annotate 'line', 11762
    .tailcall $P2.'find'(__ARG_1)
.annotate 'line', 11763

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
.annotate 'line', 11768
    elements $I1, __ARG_1
.annotate 'line', 11769
    null $S1
.annotate 'line', 11770
    null $P1
.annotate 'line', 11771
    null $P2
    sub $I2, $I1, __ARG_3
    if $I2 == 0 goto __label_3
    if $I2 == 1 goto __label_4
    goto __label_1
  __label_3: # case
    goto __label_2 # break
  __label_4: # case
.annotate 'line', 11776
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
    if __ARG_2 == 1 goto __label_7
    if __ARG_2 == 2 goto __label_8
    goto __label_5
  __label_7: # case
.annotate 'line', 11779
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 11781
    .tailcall self.'checkclass_base'($S1)
  __label_5: # default
.annotate 'line', 11784
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 11785
    .return($P1)
  __label_9: # endif
.annotate 'line', 11786
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 11787
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 11788
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_6: # switch end
    goto __label_2 # break
  __label_1: # default
.annotate 'line', 11795
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 11796
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 11797
    isnull $I6, $P2
    not $I6
    unless $I6 goto __label_14
.annotate 'line', 11798
    add $I7, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I7)
    isnull $I6, $P1
    not $I6
  __label_14:
    unless $I6 goto __label_13
.annotate 'line', 11799
    .return($P1)
  __label_13: # endif
.annotate 'line', 11800
    $P2 = self.'getusedns'($S1)
.annotate 'line', 11801
    isnull $I8, $P2
    not $I8
    unless $I8 goto __label_16
.annotate 'line', 11802
    add $I9, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I9)
    isnull $I8, $P1
    not $I8
  __label_16:
    unless $I8 goto __label_15
.annotate 'line', 11803
    .return($P1)
  __label_15: # endif
  __label_2: # switch end
    null $P3
.annotate 'line', 11805
    .return($P3)
.annotate 'line', 11806

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 11809
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P3
    $P2.'NamespaceStatement'(self, __ARG_1, $P3, __ARG_2, $P3)
    set $P1, $P2
.annotate 'line', 11810
    getattribute $P2, self, 'namespaces'
    push $P2, $P1
.annotate 'line', 11811
    .return($P1)
.annotate 'line', 11812

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
.annotate 'line', 11815
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 11816
    new $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
    set $P2, $P3
.annotate 'line', 11817
    getattribute $P3, self, 'namespaces'
    push $P3, $P2
.annotate 'line', 11818
    getattribute $P3, self, 'items'
    push $P3, $P2
.annotate 'line', 11819
    .return($P2)
.annotate 'line', 11820

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
.annotate 'line', 11823
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 11824

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
.annotate 'line', 11827
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
.annotate 'line', 11828
    getattribute $P1, self, 'items'
    push $P1, __ARG_1
.annotate 'line', 11829

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_28 = "WSubId_28"
.annotate 'line', 11832
    $P1 = __ARG_2.'get'()
.annotate 'line', 11833
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 11834
    $P1 = __ARG_2.'get'()
.annotate 'line', 11836
    set $P2, self
  __label_4: # for condition
.annotate 'line', 11837
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 11838
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 11839
    $P5 = __ARG_2.'get'()
    set $S1, $P5
  __label_2: # for iteration
.annotate 'line', 11837
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 11842
    null $P3
.annotate 'line', 11843
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 11844
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 11845
    $P1 = __ARG_2.'get'()
  __label_5: # endif
.annotate 'line', 11848
    WSubId_28('{', $P1)
.annotate 'line', 11849
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 11850
    $P4.'parse'(__ARG_2)
.annotate 'line', 11851

.end # parsenamespace


.sub 'parseextern' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_84 = "WSubId_84"
.annotate 'line', 11856
    $P1 = __ARG_1.'get'()
.annotate 'line', 11857
    $P3 = $P1.'iskeyword'('function')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 11858
    WSubId_25('Unsupported extern', $P1)
  __label_1: # endif
.annotate 'line', 11859
    $P1 = __ARG_1.'get'()
.annotate 'line', 11860
    WSubId_124($P1)
.annotate 'line', 11861
    WSubId_84(';', __ARG_1)
.annotate 'line', 11862
    new $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P3.'FunctionExtern'($P1, self)
    set $P2, $P3
.annotate 'line', 11863
    self.'addfunction'($P2)
.annotate 'line', 11864

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
.annotate 'line', 11867
    getattribute $P1, self, 'items'
.annotate 'line', 11868
    null $P2
.annotate 'line', 11869
    $P2 = __ARG_1.'get'()
  __label_3: # for condition
    $P6 = $P2.'iseof'()
    if $P6 goto __label_4
    $P6 = $P2.'isop'('}')
  __label_4:
    isfalse $I1, $P6
    unless $I1 goto __label_2
.annotate 'line', 11871
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
.annotate 'line', 11873
    self.'parsenamespace'($P2, __ARG_1)
    goto __label_6 # break
  __label_8: # case
.annotate 'line', 11876
    $P3 = WSubId_74($P2, __ARG_1, self)
.annotate 'line', 11877
    push $P1, $P3
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 11880
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P8.'FunctionStatement'($P2, __ARG_1, self)
    set $P4, $P8
.annotate 'line', 11881
    self.'addfunction'($P4)
.annotate 'line', 11882
    push $P1, $P4
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 11885
    new $P9, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    $P9.'InlineStatement'($P2, __ARG_1, self)
    set $P5, $P9
.annotate 'line', 11886
    self.'addfunction'($P5)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 11889
    WSubId_143($P2, __ARG_1, self)
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 11892
    self.'parseextern'(__ARG_1)
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 11895
    WSubId_144($P2, __ARG_1, self)
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 11898
    WSubId_145($P2, __ARG_1, self)
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 11901
    WSubId_146($P2, __ARG_1, self)
    goto __label_6 # break
  __label_16: # case
.annotate 'line', 11904
    $P2 = __ARG_1.'get'()
.annotate 'line', 11905
    $P10 = $P2.'isstring'()
    isfalse $I2, $P10
    unless $I2 goto __label_18
.annotate 'line', 11906
    WSubId_70('string literal', $P2)
  __label_18: # endif
.annotate 'line', 11907
    WSubId_84(';', __ARG_1)
.annotate 'line', 11908
    new $P13, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P13.'StringLiteral'(self, $P2)
    set $P12, $P13
    $P11 = $P12.'getPirString'()
    self.'addload'($P11)
    goto __label_6 # break
  __label_17: # case
.annotate 'line', 11911
    $P2 = __ARG_1.'get'()
.annotate 'line', 11912
    $P14 = $P2.'isstring'()
    isfalse $I3, $P14
    unless $I3 goto __label_19
.annotate 'line', 11913
    WSubId_70('string literal', $P2)
  __label_19: # endif
.annotate 'line', 11914
    WSubId_84(';', __ARG_1)
.annotate 'line', 11915
    new $P17, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P17.'StringLiteral'(self, $P2)
    set $P16, $P17
    $P15 = $P16.'getPirString'()
    self.'addlib'($P15)
    goto __label_6 # break
  __label_5: # default
.annotate 'line', 11918
    WSubId_71("token", $P2)
  __label_6: # switch end
  __label_1: # for iteration
.annotate 'line', 11869
    $P2 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 11921
    $P6 = $P2.'iseof'()
    if_null $P6, __label_20
    unless $P6 goto __label_20
.annotate 'line', 11922
    self.'unclosed_ns'()
    goto __label_21
  __label_20: # else
.annotate 'line', 11924
    self.'close_ns'($P2)
  __label_21: # endif
.annotate 'line', 11925

.end # parse


.sub 'optimize_base' :method
.annotate 'line', 11928
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
.annotate 'line', 11929

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.annotate 'line', 11932
    $P1 = self.'getpath'()
.annotate 'line', 11934
    set $I1, 1
.annotate 'line', 11936
    getattribute $P2, self, 'externals'
.annotate 'line', 11937
    if_null $P2, __label_1
.annotate 'line', 11938
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 11939
    null $I1
.annotate 'line', 11940
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
.annotate 'line', 11943
    getattribute $P9, self, 'items'
    if_null $P9, __label_7
    iter $P11, $P9
    set $P11, 0
  __label_6: # for iteration
    unless $P11 goto __label_7
    shift $P3, $P11
.annotate 'line', 11944
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_10
.annotate 'line', 11945
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 11946
    set $I1, 1
    goto __label_9
  __label_8: # else
.annotate 'line', 11948
    unless $I1 goto __label_11
.annotate 'line', 11949
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 11950
    null $I1
  __label_11: # endif
  __label_9: # endif
.annotate 'line', 11952
    $P3.'emit'(__ARG_1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 11954

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 11650
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 11652
    addattribute $P0, 'nspath'
.annotate 'line', 11653
    addattribute $P0, 'externals'
.annotate 'line', 11654
    addattribute $P0, 'namespaces'
.annotate 'line', 11655
    addattribute $P0, 'classes'
.annotate 'line', 11656
    addattribute $P0, 'funcont'
.annotate 'line', 11657
    addattribute $P0, 'items'
.annotate 'line', 11658
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 11972
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 11973
    null $I1
.annotate 'line', 11974
    if_null __ARG_5, __label_1
.annotate 'line', 11975
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 11976
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 11977
    set $I1, 1
  __label_2: # endif
  __label_1: # endif
.annotate 'line', 11980
    unless $I1 goto __label_4
.annotate 'line', 11981
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 11982
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 11983
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 11985
    setattribute self, 'parent', __ARG_1
.annotate 'line', 11986
    setattribute self, 'start', __ARG_2
.annotate 'line', 11987
    setattribute self, 'owner', __ARG_1
.annotate 'line', 11988
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 11989

.end # NamespaceStatement


.sub 'dowarnings' :method
.annotate 'line', 11992
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 11993

.end # dowarnings


.sub 'generatesubid' :method
.annotate 'line', 11996
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
.annotate 'line', 11997

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 12000
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
.annotate 'line', 12001

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 12004
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
.annotate 'line', 12005

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 12008
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
.annotate 'line', 12009

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 12012
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 12013
    unless_null $P1, __label_1
.annotate 'line', 12014
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 12015
    .return($P1)
.annotate 'line', 12016

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 12019
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 12020
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 12021
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 12022
    .return($P1)
.annotate 'line', 12023

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 12026
    getattribute $P1, self, 'start'
    WSubId_25('unclosed namespace', $P1)
.annotate 'line', 12027

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1

.end # close_ns


.sub 'optimize' :method
.annotate 'line', 12034
    getattribute $P1, self, 'modifier'
.annotate 'line', 12035
    if_null $P1, __label_1
.annotate 'line', 12036
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 12037
    self.'optimize_base'()
.annotate 'line', 12038
    .return(self)
.annotate 'line', 12039

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 12042
    getattribute $P1, self, 'hll'
.annotate 'line', 12043
    if_null $P1, __label_1
.annotate 'line', 12044
    $P2 = WSubId_45(".HLL '%0'", $P1)
    __ARG_1.'say'($P2)
  __label_1: # endif
.annotate 'line', 12046
    self.'emit_base'(__ARG_1)
.annotate 'line', 12048
    if_null $P1, __label_2
.annotate 'line', 12049
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
.annotate 'line', 12050

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 11961
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 11963
    addattribute $P0, 'parent'
.annotate 'line', 11964
    addattribute $P0, 'start'
.annotate 'line', 11965
    addattribute $P0, 'name'
.annotate 'line', 11966
    addattribute $P0, 'modifier'
.annotate 'line', 11967
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
.annotate 'line', 12067
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 12068
    setattribute self, 'unit', __ARG_1
.annotate 'line', 12069
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 12070
    box $P1, 0
    setattribute self, 'subidgen', $P1
.annotate 'line', 12071

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
.annotate 'line', 12074
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 12075
    $P1[__ARG_1] = 1
.annotate 'line', 12076

.end # use_builtin


.sub 'generatesubid' :method
.annotate 'line', 12080
    getattribute $P1, self, 'subidgen'
    inc $P1
    set $I1, $P1
.annotate 'line', 12081
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
.annotate 'line', 12082

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 12086
    getattribute $P1, self, 'libs'
.annotate 'line', 12087
    unless_null $P1, __label_1
.annotate 'line', 12088
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 12089
    $P1[__ARG_1] = 1
.annotate 'line', 12090

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 12093
    getattribute $P1, self, 'loads'
.annotate 'line', 12094
    unless_null $P1, __label_1
.annotate 'line', 12095
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 12096
    $P1[__ARG_1] = 1
.annotate 'line', 12097

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 12100
    .tailcall self.'checkclass_base'(__ARG_1)
.annotate 'line', 12101

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 12104
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 12105

.end # scopesearch


.sub 'unclosed_ns' :method

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.annotate 'line', 12112
    WSubId_25('Cannot close root namespace', __ARG_1)
.annotate 'line', 12113

.end # close_ns


.sub 'dowarnings' :method
.annotate 'line', 12116
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
.annotate 'line', 12117

.end # dowarnings


.sub 'optimize' :method
.annotate 'line', 12120
    self.'optimize_base'()
.annotate 'line', 12121
    .return(self)
.annotate 'line', 12122

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_45 = "WSubId_45"
.annotate 'line', 12125
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 12128
    $P12 = $P1['chomp']
    if_null $P12, __label_1
.annotate 'line', 12129
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 12132
    split $P12, " ", "acos asin atan cos exp ln sin tan pow sinh cosh tanh"
    if_null $P12, __label_3
    iter $P13, $P12
    set $P13, 0
  __label_2: # for iteration
    unless $P13 goto __label_3
    shift $S1, $P13
.annotate 'line', 12134
    $P14 = $P1[$S1]
    if_null $P14, __label_4
.annotate 'line', 12135
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 12139
    getattribute $P2, self, 'libs'
.annotate 'line', 12140
    if_null $P2, __label_5
.annotate 'line', 12141
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
.annotate 'line', 12141
    join $S2, "\n", $P12
    __ARG_1.'say'($S2)
  __label_5: # endif
.annotate 'line', 12143
    getattribute $P3, self, 'loads'
.annotate 'line', 12144
    if_null $P3, __label_9
.annotate 'line', 12151
    set $P8, $P3
    root_new $P9, ['parrot';'ResizablePMCArray']
.annotate 'line', 12152
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
.annotate 'line', 12151
    join $S2, "\n", $P12
.annotate 'line', 12145
    $P12 = WSubId_45(".sub initial_load_bytecode :anon :load :init\n%0\n.end\n", $S2)
    __ARG_1.'say'($P12)
  __label_9: # endif
.annotate 'line', 12154
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_14
    isnull $I1, $P3
    not $I1
  __label_14:
    unless $I1 goto __label_13
.annotate 'line', 12155
    __ARG_1.'comment'('end libs')
  __label_13: # endif
.annotate 'line', 12157
    self.'emit_base'(__ARG_1)
.annotate 'line', 12158

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 12161
    getattribute $P1, self, 'locals'
.annotate 'line', 12162
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
.annotate 'line', 12163
    $P2 = $P1[$S1]
.annotate 'line', 12164
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 12165
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 12166
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 12168
    $P3 = $P2.'getvalue'()
.annotate 'line', 12169
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 12171

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 12057
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 12059
    addattribute $P0, 'unit'
.annotate 'line', 12060
    addattribute $P0, 'bultins_used'
.annotate 'line', 12061
    addattribute $P0, 'libs'
.annotate 'line', 12062
    addattribute $P0, 'loads'
.annotate 'line', 12063
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 12183
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 12184
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
.annotate 'line', 12185

.end # Builtin


.sub 'getname' :method
.annotate 'line', 12186
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
.annotate 'line', 12189
    getattribute $P1, self, 'variants'
    push $P1, __ARG_1
.annotate 'line', 12190

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 12179
    addattribute $P0, 'name'
.annotate 'line', 12180
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
.annotate 'line', 12200
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
.annotate 'line', 12201

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
.annotate 'line', 12204
    getattribute $P1, self, 'entries'
.annotate 'line', 12205
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 12206
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 12207
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 12209
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
.annotate 'line', 12210

.end # add


.sub 'put' :method
        .param pmc __ARG_1
.annotate 'line', 12213
    getattribute $P1, self, 'entries'
.annotate 'line', 12214
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 12215
    $P3 = $P1[$S1]
    __ARG_1.'addfunction'($P3)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 12216

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 12197
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_147 = "WSubId_147"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_148 = "WSubId_148"
.annotate 'line', 12226
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 12227
    new $P4, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P4.'RootNamespace'(self)
    set $P1, $P4
.annotate 'line', 12231
    WSubId_147($P1, 'false', 0)
.annotate 'line', 12232
    WSubId_147($P1, 'true', 1)
.annotate 'line', 12237
    WSubId_140($P1, '__STAGE__', "4")
.annotate 'line', 12240
    WSubId_147($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 12243
    WSubId_147($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 12246
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 12248
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
    set $P3, $P3
.annotate 'line', 12249
    WSubId_148($P3)
.annotate 'line', 12250
    $P3.'put'($P2)
.annotate 'line', 12252
    $P1.'usenamespace'($P2)
.annotate 'line', 12254
    setattribute self, 'rootns', $P1
.annotate 'line', 12255

.end # WinxedCompileUnit


.sub 'dowarnings' :method
.annotate 'line', 12258
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
.annotate 'line', 12259

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 12262
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 12263
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
.annotate 'line', 12264

.end # parse


.sub 'optimize' :method
.annotate 'line', 12267
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
.annotate 'line', 12268

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 12271
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 12272
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 12273
    __ARG_1.'say'('')
.annotate 'line', 12275
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 12277
    __ARG_1.'comment'('End generated code')
.annotate 'line', 12278

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
.annotate 'line', 12281
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 12282
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 12284
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 12286
    __ARG_1.'comment'('End')
.annotate 'line', 12287

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 12221
    addattribute $P0, 'rootns'
.annotate 'line', 12222
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
.annotate 'line', 12296
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 5
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 12297
    .return($P1)
.annotate 'line', 12298

.end # version


.sub 'version_string' :method
.annotate 'line', 12301
    $P1 = self.'version'()
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
.annotate 'line', 12302

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
        .param int __ARG_6
.annotate 'line', 12305
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 12306
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 12307
    null $P1
.annotate 'line', 12308
    unless_null __ARG_3, __label_2
.annotate 'line', 12309
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12310
    $P1.'open'('__eval__', 'w')
    goto __label_3
  __label_2: # else
.annotate 'line', 12313
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 12314
    new $P5, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P5.'Emit'($P1, __ARG_6)
    set $P2, $P5
.annotate 'line', 12315
    unless __ARG_4 goto __label_4
.annotate 'line', 12316
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 12317
    unless __ARG_5 goto __label_5
.annotate 'line', 12318
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 12319
    __ARG_1.'emit'($P2)
.annotate 'line', 12320
    $P2.'close'()
.annotate 'line', 12321
    if_null __ARG_3, __label_6
.annotate 'line', 12322
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
.annotate 'line', 12324
    $P1.'close'()
.annotate 'line', 12325
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 12326
    null $P3
    set $S2, __ARG_2
    if $S2 == 'pir' goto __label_11
    if $S2 == 'pbc' goto __label_12
    if $S2 == '' goto __label_13
    goto __label_9
  __label_11: # case
.annotate 'line', 12329
    new $P3, [ 'String' ]
.annotate 'line', 12330
    assign $P3, $S1
    goto __label_10 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 12334
    compreg $P4, 'PIR'
.annotate 'line', 12335
    $P3 = $P4($S1)
    goto __label_10 # break
  __label_9: # default
.annotate 'line', 12338
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
    die $S5
  __label_10: # switch end
.annotate 'line', 12340
    .return($P3)
  __label_7: # endif
.annotate 'line', 12342

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
.annotate 'line', 12345
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12346
    $P1.'open'('__eval__', 'w')
.annotate 'line', 12347
    new $P3, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P3.'Emit'($P1, 1)
    set $P2, $P3
.annotate 'line', 12348
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 12349
    $P2.'close'()
.annotate 'line', 12350
    $P1.'close'()
.annotate 'line', 12351
    .tailcall $P1.'read'(0)
.annotate 'line', 12352

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 12360
    unless_null __ARG_2, __label_1
.annotate 'line', 12361
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 12362
    new $P1, [ 'StringHandle' ]
.annotate 'line', 12363
    $P1.'open'('__eval__', 'w')
.annotate 'line', 12364
    $P1.'puts'(__ARG_1)
.annotate 'line', 12365
    $P1.'close'()
.annotate 'line', 12366
    $P1.'open'('__eval__', 'r')
.annotate 'line', 12367
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, '__eval__', __ARG_6)
    set $P2, $P4
.annotate 'line', 12368
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
.annotate 'line', 12369
    $P3.'parse'($P2)
.annotate 'line', 12370
    $P1.'close'()
.annotate 'line', 12371
    $P3.'optimize'()
.annotate 'line', 12372
    ne __ARG_2, 'include', __label_2
.annotate 'line', 12373
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 12375
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 12376

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
.annotate 'line', 12385
    unless_null __ARG_2, __label_1
.annotate 'line', 12386
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 12387
    new $P1, [ 'FileHandle' ]
.annotate 'line', 12388
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 12389
    $P1.'encoding'('utf8')
.annotate 'line', 12390
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, __ARG_1, __ARG_6)
    set $P2, $P4
.annotate 'line', 12391
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
.annotate 'line', 12392
    $P3.'parse'($P2)
.annotate 'line', 12393
    $P1.'close'()
.annotate 'line', 12394
    $P3.'optimize'()
.annotate 'line', 12395
    ne __ARG_2, 'include', __label_2
.annotate 'line', 12396
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 12398
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
.annotate 'line', 12399

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
.annotate 'line', 12408
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 12409
    compreg 'winxed', $P1
.annotate 'line', 12410

.end # initializer

# End generated code
