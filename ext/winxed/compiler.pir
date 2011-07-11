# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ 'Winxed'; 'Compiler' ]

.sub 'isspace' :subid('WSubId_18')
        .param string __ARG_1
# Body
# {
.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 18
    iseq $I1, __ARG_1, ' '
    if $I1 goto __label_2
    iseq $I1, __ARG_1, "\n"
  __label_2:
    if $I1 goto __label_1
    iseq $I1, __ARG_1, "\t"
  __label_1:
    .return($I1)
# }
.annotate 'line', 19

.end # isspace


.sub 'isdigit' :subid('WSubId_9')
        .param string __ARG_1
# Body
# {
.annotate 'line', 23
# predefined indexof
    index $I2, '0123456789', __ARG_1
    isgt $I1, $I2, -1
    .return($I1)
# }
.annotate 'line', 24

.end # isdigit


.sub 'hexdigit' :subid('WSubId_10')
        .param string __ARG_1
# Body
# {
.annotate 'line', 28
# i: $I1
# predefined indexof
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 29
    lt $I1, 0, __label_1
    mod $I1, $I1, 16
  __label_1: # endif
.annotate 'line', 30
    .return($I1)
# }
.annotate 'line', 31

.end # hexdigit


.sub 'isidentstart' :subid('WSubId_19')
        .param string __ARG_1
# Body
# {
.annotate 'line', 38
# predefined indexof
.annotate 'line', 35
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 38
    isgt $I1, $I2, -1
.annotate 'line', 35
    .return($I1)
# }
.annotate 'line', 39

.end # isidentstart


.sub 'isident' :subid('WSubId_8')
        .param string __ARG_1
# Body
# {
.annotate 'line', 47
# predefined indexof
.annotate 'line', 43
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
.annotate 'line', 47
    isgt $I1, $I2, -1
.annotate 'line', 43
    .return($I1)
# }
.annotate 'line', 48

.end # isident

# Constant ERR_INTERNAL evaluated at compile time
# Constant ERR_TOKEN evaluated at compile time
# Constant ERR_PARSER evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]

.sub 'WinxedCompilerError' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 74
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 75
    box $P1, __ARG_2
    setattribute self, 'message', $P1
.annotate 'line', 76
    box $P1, __ARG_3
    setattribute self, 'filename', $P1
.annotate 'line', 77
    box $P1, __ARG_4
    setattribute self, 'line', $P1
# }
.annotate 'line', 78

.end # WinxedCompilerError

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 63
    addattribute $P0, 'type'
.annotate 'line', 64
    addattribute $P0, 'filename'
.annotate 'line', 65
    addattribute $P0, 'line'
.annotate 'line', 66
    addattribute $P0, 'message'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Warn' :subid('WSubId_67')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 83
# var stderr: $P1
# predefined getstderr
    getstderr $P1
.annotate 'line', 84
    $P1.'print'('WARNING: ')
.annotate 'line', 85
    $P1.'print'(__ARG_1)
.annotate 'line', 86
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 87
    $P1.'print'(' near ')
.annotate 'line', 88
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
  __label_1: # endif
.annotate 'line', 90
    $P1.'print'("\n")
# }
.annotate 'line', 91

.end # Warn


.sub 'InternalError' :subid('WSubId_6')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 95
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 96
# desc: $S1
    $P2 = __ARG_2.'show'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 97
    concat __ARG_1, __ARG_1, ' near '
    concat __ARG_1, __ARG_1, $S1
# }
  __label_1: # endif
.annotate 'line', 99
# var payload: $P1
    unless __ARG_3 goto __label_4
.annotate 'line', 100
    new $P2, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 101
    $P3 = __ARG_2.'filename'()
    $P4 = __ARG_2.'linenum'()
    $P2.'WinxedCompilerError'('internal', __ARG_1, $P3, $P4)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 102
    new $P5, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P5.'WinxedCompilerError'('internal', __ARG_1)
    set $P1, $P5
  __label_3:
.annotate 'line', 103
# predefined Error
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2
# }
.annotate 'line', 104

.end # InternalError


.sub 'TokenError' :subid('WSubId_7')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 108
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
.annotate 'line', 110
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
# predefined Error
.annotate 'line', 108
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1
# }
.annotate 'line', 111

.end # TokenError


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 115
# line: $I1
    $P1 = __ARG_2.'linenum'()
    set $I1, $P1
.annotate 'line', 116
# file: $S1
    $P1 = __ARG_2.'filename'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 117
# desc: $S2
# predefined string
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S2, ' near ', $S3
.annotate 'line', 118
# predefined string
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
.annotate 'line', 120
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
.annotate 'line', 121
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
# predefined Error
.annotate 'line', 118
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1
# }
.annotate 'line', 122

.end # SyntaxError


.sub 'NoLeftSide' :subid('WSubId_58')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 126
    WSubId_1('Not a left-side expression', __ARG_1)
# }
.annotate 'line', 127

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_39')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 131
    concat $S1, "Expected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 132

.end # Expected


.sub 'Unexpected' :subid('WSubId_40')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 136
    concat $S1, "Unexpected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 137

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 141
    WSubId_1("Expected identifier", __ARG_1)
# }
.annotate 'line', 142

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 146
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 147

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 151
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 152
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 153

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 157
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 158
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 159

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_92')
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 163
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 164
    WSubId_3(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 165

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_53')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 169
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 170
    WSubId_4(__ARG_1, $P1)
# }
.annotate 'line', 171

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_94')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_5 = "WSubId_5"
# Body
# {
.annotate 'line', 175
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 176
    WSubId_5(__ARG_1, $P1)
# }
.annotate 'line', 177

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_60')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 181
# predefined string
    set $S1, __ARG_1
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    WSubId_1($S2, __ARG_1)
# }
.annotate 'line', 182

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 194
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 195
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 196

.end # Token


.sub 'iseof' :method
# Body
# {
.annotate 'line', 198
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 199
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 200
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 201
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 202
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 203
    .return(0)
# }

.end # isstring


.sub 'issinglequoted' :method
# Body
# {
.annotate 'line', 204
    .return(0)
# }

.end # issinglequoted


.sub 'getintvalue' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 208
    WSubId_6('Not a literal int', self)
# }
.annotate 'line', 209

.end # getintvalue


.sub 'rawstring' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 212
    WSubId_6('Not a literal string', self)
# }
.annotate 'line', 213

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 216
    WSubId_3(self)
# }
.annotate 'line', 217

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 218
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 219
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 220
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 221
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 222
    .return('(unknown)')
# }

.end # viewable


.sub 'filename' :method
# Body
# {
.annotate 'line', 223
    getattribute $P1, self, 'file'
    .return($P1)
# }

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 224
    getattribute $P1, self, 'line'
    .return($P1)
# }

.end # linenum


.sub 'show' :method
# Body
# {
.annotate 'line', 227
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 228
# predefined string
    getattribute $P1, self, 'file'
    set $S2, $P1
# predefined string
    getattribute $P2, self, 'line'
    set $S3, $P2
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 229

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
.annotate 'line', 190
    addattribute $P0, 'file'
.annotate 'line', 191
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 236
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 237

.end # TokenEof


.sub 'iseof' :method
# Body
# {
.annotate 'line', 238
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 239
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 232
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 247
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 248
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 249

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 250
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 253
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 254

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 242
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 244
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 261
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 262

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 263
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 257
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 270
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 271

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 274
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 275

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 278
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 279

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 266
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 286
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 287

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 288
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 291
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 292

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 295
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 296

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 299
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 300

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 282
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 305
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 308
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 309

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 303
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 316
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 317

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 320
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 321

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 324
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 325

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 328
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 329

.end # getasquoted


.sub 'getPirString' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 332
# str: $S1
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 333
# strunesc: $S2
    null $S2
.annotate 'line', 334
# try: create handler
    new $P1, 'ExceptionHandler'
    set_label $P1, __label_2
    push_eh $P1
# try: begin
# {
.annotate 'line', 335
# predefined unescape
    $P0 = new ['String']
    $P0 = $S1
    $S2 = $P0.'unescape'('utf8')
# }
# try: end
    pop_eh
    goto __label_3
.annotate 'line', 334
# catch
  __label_2:
    .get_results($P2)
    finalize $P2
    pop_eh
# {
.annotate 'line', 338
    WSubId_1("Invalid escape sequence in literal string", self)
# }
# catch end
  __label_3:
.annotate 'line', 340
# need_encoding: $I1
    null $I1
.annotate 'line', 341
    box $P1, $S2
    if_null $P1, __label_5
    iter $P3, $P1
    set $P3, 0
  __label_4: # for iteration
    unless $P3 goto __label_5
    shift $I2, $P3
# {
.annotate 'line', 342
    le $I2, 127, __label_6
# {
.annotate 'line', 343
    set $I1, 1
    goto __label_5 # break
.annotate 'line', 344
# }
  __label_6: # endif
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 347
# predefined escape
    escape $S1, $S2
.annotate 'line', 348
# encoding: $S3
    unless $I1 goto __label_8
    set $S3, "utf8:"
    goto __label_7
  __label_8:
    set $S3, ""
  __label_7:
.annotate 'line', 349
    concat $S4, $S3, '"'
    concat $S4, $S4, $S1
    concat $S4, $S4, '"'
    .return($S4)
# }
.annotate 'line', 350

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
.annotate 'line', 312
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 357
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 358

.end # TokenSingleQuoted


.sub 'issinglequoted' :method
# Body
# {
.annotate 'line', 359
    .return(1)
# }

.end # issinglequoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 362
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 363

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 366
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 367

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 370
# s: $S1
    set $S1, ''
.annotate 'line', 371
    getattribute $P1, self, 'str'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 372
    set $S3, $S2
    set $S4, '"'
    if $S3 == $S4 goto __label_5
    set $S4, '\'
    if $S3 == $S4 goto __label_6
    set $S4, "'"
    if $S3 == $S4 goto __label_7
    goto __label_4
  __label_5: # case
  __label_6: # case
  __label_7: # case
.annotate 'line', 376
    concat $S2, '\', $S2
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 379
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 381
    .return($S1)
# }
.annotate 'line', 382

.end # getasquoted


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 385
# str: $S1
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 386
# quote: $S2
    set $S2, "'"
.annotate 'line', 387
# need_escape: $I1
    null $I1
.annotate 'line', 388
    box $P1, $S1
    if_null $P1, __label_3
    iter $P2, $P1
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $I2, $P2
# {
.annotate 'line', 389
    islt $I5, $I2, 32
    if $I5 goto __label_5
    isgt $I5, $I2, 127
  __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 390
    set $I1, 1
    goto __label_3 # break
.annotate 'line', 391
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 394
# need_encoding: $I3
    null $I3
.annotate 'line', 395
    unless $I1 goto __label_6
# {
.annotate 'line', 396
    set $S2, '"'
.annotate 'line', 397
# result: $S3
    set $S3, ''
.annotate 'line', 398
    box $P1, $S1
    if_null $P1, __label_8
    iter $P3, $P1
    set $P3, 0
  __label_7: # for iteration
    unless $P3 goto __label_8
    shift $S4, $P3
# {
.annotate 'line', 399
    ne $S4, '\', __label_9
.annotate 'line', 400
    concat $S3, $S3, '\\'
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 403
# n: $I4
# predefined ord
    ord $I4, $S4
.annotate 'line', 404
    islt $I5, $I4, 32
    if $I5 goto __label_13
    isgt $I5, $I4, 127
  __label_13:
    unless $I5 goto __label_11
# {
.annotate 'line', 405
    le $I4, 127, __label_14
.annotate 'line', 406
    set $I3, 1
  __label_14: # endif
.annotate 'line', 407
# h: $S5
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_15
    set $S5, $P1
  __label_15:
.annotate 'line', 408
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 411
    concat $S3, $S3, $S4
  __label_12: # endif
# }
  __label_10: # endif
# }
    goto __label_7
  __label_8: # endfor
.annotate 'line', 414
    set $S1, $S3
# }
  __label_6: # endif
.annotate 'line', 416
    concat $S1, $S2, $S1
    concat $S1, $S1, $S2
.annotate 'line', 417
    unless $I3 goto __label_16
.annotate 'line', 418
    concat $S1, 'utf8:', $S1
  __label_16: # endif
.annotate 'line', 419
    .return($S1)
# }
.annotate 'line', 420

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 353
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 427
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 428

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 429
    .return(1)
# }

.end # isint


.sub 'getintvalue' :method
# Body
# {
# predefined int
.annotate 'line', 432
    getattribute $P1, self, 'str'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 433

.end # getintvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
.annotate 'line', 423
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 440
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 441

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 442
    .return(1)
# }

.end # isfloat


.sub 'getfloatvalue' :method
# Body
# {
# predefined float
.annotate 'line', 445
    getattribute $P1, self, 'str'
    set $N1, $P1
    .return($N1)
# }
.annotate 'line', 446

.end # getfloatvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
.annotate 'line', 436
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getquoted' :subid('WSubId_13')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 456
# s: $S1
    set $S1, ''
.annotate 'line', 457
# c: $S2
    null $S2
# for loop
.annotate 'line', 458
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 459
    set $S4, $S2
    set $S5, ""
    if $S4 == $S5 goto __label_6
    set $S5, "\n"
    if $S4 == $S5 goto __label_7
    set $S5, '\'
    if $S4 == $S5 goto __label_8
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 462
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 465
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 466
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 467
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 468
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 471
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 458
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 474
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 475

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 479
# s: $S1
    set $S1, ''
.annotate 'line', 480
# c: $S2
    null $S2
# for loop
.annotate 'line', 481
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 482
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 483
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 484
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 481
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 486
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 487

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 491
# mark: $S1
    set $S1, ''
.annotate 'line', 492
# c: $S2
    null $S2
# for loop
.annotate 'line', 493
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 494
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 496
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 501
    concat $S2, '\', $S2
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 504
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 493
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 506
    concat $S1, $S1, ':>>'
.annotate 'line', 508
# content: $S3
    set $S3, ''
.annotate 'line', 509
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 510
# {
.annotate 'line', 511
    set $S4, ''
# for loop
.annotate 'line', 512
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 513
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 515
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 518
    concat $S2, '\', $S2
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 521
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 512
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 523
    eq $S4, $S1, __label_20
.annotate 'line', 524
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 525
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 526
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 527

.end # getheredoc


.sub 'getident' :subid('WSubId_11')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
# Body
# {
.annotate 'line', 531
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 532
# c: $S2
    null $S2
# for loop
.annotate 'line', 533
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    $P2 = WSubId_8($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 534
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 533
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_3
  __label_2: # for end
.annotate 'line', 535
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 536
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 537

.end # getident


.sub 'getnumber' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_10 = "WSubId_10"
# Body
# {
.annotate 'line', 541
# s: $S1
    null $S1
.annotate 'line', 542
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 543
# {
.annotate 'line', 544
    concat $S1, $S1, $S2
.annotate 'line', 545
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.annotate 'line', 546
    $P1 = WSubId_9($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 547
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 548
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 549
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
    $P2 = WSubId_10($S2)
    set $I2, $P2
    lt $I2, 0, __label_8
# {
.annotate 'line', 550
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 551
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 549
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 553
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 554
    set $S1, $I1
.annotate 'line', 555
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 557
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 558
# {
.annotate 'line', 559
    concat $S1, $S1, $S2
.annotate 'line', 560
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.annotate 'line', 561
    $P1 = WSubId_9($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 562
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 563
    concat $S1, $S1, 'E'
.annotate 'line', 564
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 565
    concat $S1, $S1, $S2
.annotate 'line', 566
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.annotate 'line', 568
    $P1 = WSubId_9($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 569
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 568
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 571
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 572
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 575
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 576
    concat $S1, $S1, 'E'
.annotate 'line', 577
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 578
    concat $S1, $S1, $S2
.annotate 'line', 579
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.annotate 'line', 581
    $P1 = WSubId_9($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 582
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 581
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_29
  __label_28: # for end
.annotate 'line', 583
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 584
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 587
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 588
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_23: # endif
# }
  __label_11: # endif
# }
.annotate 'line', 591

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 595
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 596
# c: $S2
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
.annotate 'line', 597
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 596
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 598
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 599

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 603
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 604
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 605
# {
# for loop
  __label_7: # for condition
.annotate 'line', 606
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 607
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 606
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 608
    ne $S2, '', __label_9
.annotate 'line', 609
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 610
    concat $S1, $S1, $S2
.annotate 'line', 611
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 612
    ne $S2, '', __label_10
.annotate 'line', 613
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 614
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 615
    concat $S1, $S1, '/'
.annotate 'line', 616
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 617

.end # getcomment


.sub 'getop' :subid('WSubId_12')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 621
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 622
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 623

.end # getop

.namespace [ 'Winxed'; 'Compiler'; 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_12 = "WSubId_12"
.const 'Sub' WSubId_13 = "WSubId_13"
.const 'Sub' WSubId_14 = "WSubId_14"
.const 'Sub' WSubId_15 = "WSubId_15"
.const 'Sub' WSubId_16 = "WSubId_16"
.const 'Sub' WSubId_17 = "WSubId_17"
# Body
# {
.annotate 'line', 639
    setattribute self, 'h', __ARG_1
.annotate 'line', 640
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 641
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 642
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 643
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 644
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 645
    root_new $P3, ['parrot';'Hash']
    $P3[''] = WSubId_11
    $P3['{'] = WSubId_12
    $P1['$'] = $P3
.annotate 'line', 646
    $P1['"'] = WSubId_13
.annotate 'line', 647
    $P1["'"] = WSubId_14
.annotate 'line', 648
    root_new $P9, ['parrot';'Hash']
.annotate 'line', 649
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_12
    $P11['='] = WSubId_12
    $P9['='] = $P11
.annotate 'line', 650
    $P9[':'] = WSubId_12
    $P1['='] = $P9
.annotate 'line', 652
    root_new $P16, ['parrot';'Hash']
    $P16['+'] = WSubId_12
    $P16['='] = WSubId_12
    $P1['+'] = $P16
.annotate 'line', 653
    root_new $P20, ['parrot';'Hash']
    $P20['-'] = WSubId_12
    $P20['='] = WSubId_12
    $P1['-'] = $P20
.annotate 'line', 654
    root_new $P24, ['parrot';'Hash']
    $P24['='] = WSubId_12
    $P1['*'] = $P24
.annotate 'line', 655
    root_new $P27, ['parrot';'Hash']
    $P27['|'] = WSubId_12
    $P1['|'] = $P27
.annotate 'line', 656
    root_new $P30, ['parrot';'Hash']
    $P30['&'] = WSubId_12
    $P1['&'] = $P30
.annotate 'line', 657
    root_new $P33, ['parrot';'Hash']
.annotate 'line', 658
    root_new $P35, ['parrot';'Hash']
    $P35[''] = WSubId_12
    $P35[':'] = WSubId_15
    $P33['<'] = $P35
.annotate 'line', 659
    $P33['='] = WSubId_12
    $P1['<'] = $P33
.annotate 'line', 661
    root_new $P40, ['parrot';'Hash']
    $P40['>'] = WSubId_12
    $P40['='] = WSubId_12
    $P1['>'] = $P40
.annotate 'line', 662
    root_new $P44, ['parrot';'Hash']
.annotate 'line', 663
    root_new $P46, ['parrot';'Hash']
    $P46[''] = WSubId_12
    $P46['='] = WSubId_12
    $P44['='] = $P46
    $P1['!'] = $P44
.annotate 'line', 665
    root_new $P50, ['parrot';'Hash']
    $P50['%'] = WSubId_12
    $P50['='] = WSubId_12
    $P1['%'] = $P50
.annotate 'line', 666
    root_new $P54, ['parrot';'Hash']
    $P54['='] = WSubId_12
    $P54['/'] = WSubId_16
    $P54['*'] = WSubId_17
    $P1['/'] = $P54
.annotate 'line', 667
    $P1['#'] = WSubId_16
.annotate 'line', 669
    setattribute self, 'select', $P1
# }
.annotate 'line', 670

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 673
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 674
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 675
    eq $S1, '', __label_2
.annotate 'line', 676
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 678
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 679
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 680
    ne $S1, "\n", __label_4
.annotate 'line', 681
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 683
    .return($S1)
# }
.annotate 'line', 684

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 687
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 688

.end # ungetchar


.sub 'get_token' :method
.const 'Sub' WSubId_18 = "WSubId_18"
.const 'Sub' WSubId_19 = "WSubId_19"
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_20 = "WSubId_20"
.const 'Sub' WSubId_12 = "WSubId_12"
# Body
# {
.annotate 'line', 691
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 692
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 694
# c: $S1
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 695
    $P3 = WSubId_18($S1)
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 696
    $P4 = self.'getchar'()
    set $S1, $P4
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 697
# line: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 698
    ne $S1, '', __label_5
.annotate 'line', 699
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
.annotate 'line', 700
    $P3 = WSubId_19($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 701
    .tailcall WSubId_11(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 702
    $P3 = WSubId_9($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 703
    .tailcall WSubId_20(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 705
# op: $S2
    set $S2, $S1
.annotate 'line', 706
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 707
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 709
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 710
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 711
    set $P1, $P2
.annotate 'line', 712
    $P2 = $P1[$S1]
.annotate 'line', 713
    unless_null $P2, __label_11
# {
.annotate 'line', 714
    self.'ungetchar'($S1)
.annotate 'line', 715
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 718
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 720
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 721
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 722
    .tailcall WSubId_12(self, $S2, $I1)
# }
.annotate 'line', 723

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 726
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 727
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 728
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 729
    .return($P1)
# }
.annotate 'line', 730

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 733
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 734

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 631
    addattribute $P0, 'h'
.annotate 'line', 632
    addattribute $P0, 'pending'
.annotate 'line', 633
    addattribute $P0, 'select'
.annotate 'line', 634
    addattribute $P0, 'stacked'
.annotate 'line', 635
    addattribute $P0, 'filename'
.annotate 'line', 636
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant REGint evaluated at compile time
# Constant REGfloat evaluated at compile time
# Constant REGstring evaluated at compile time
# Constant REGvar evaluated at compile time
# Constant REGarglist evaluated at compile time
# Constant REGany evaluated at compile time
# Constant REGs_v evaluated at compile time
# Constant REGraw1 evaluated at compile time
# Constant REGnone evaluated at compile time

.sub 'typetoregcheck' :subid('WSubId_95')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 756
    set $S1, __ARG_1
    set $S2, 'int'
    if $S1 == $S2 goto __label_3
    set $S2, 'float'
    if $S1 == $S2 goto __label_4
    set $S2, 'string'
    if $S1 == $S2 goto __label_5
    set $S2, 'var'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 757
    .return('I')
  __label_4: # case
.annotate 'line', 758
    .return('N')
  __label_5: # case
.annotate 'line', 759
    .return('S')
  __label_6: # case
.annotate 'line', 760
    .return('P')
  __label_2: # default
.annotate 'line', 761
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 763

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_104')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
# switch
.annotate 'line', 767
    set $S1, __ARG_1
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    set $S2, 'N'
    if $S1 == $S2 goto __label_4
    set $S2, 'S'
    if $S1 == $S2 goto __label_5
    set $S2, 'P'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 768
    .return('int')
  __label_4: # case
.annotate 'line', 769
    .return('num')
  __label_5: # case
.annotate 'line', 770
    .return('string')
  __label_6: # case
.annotate 'line', 771
    .return('pmc')
  __label_2: # default
.annotate 'line', 772
    WSubId_6('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 774

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 794
    setattribute self, 'handle', __ARG_1
.annotate 'line', 795
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 796
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 797
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 798
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 799

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 802
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 803

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 806
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 807

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 810
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 811
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 813
    getattribute $P5, self, 'file'
.annotate 'line', 811
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 816
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 818
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 819
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 821
    getattribute $P5, self, 'line'
.annotate 'line', 819
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 824
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 826

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 829
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 830
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 831

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 834
    self.'updateannot'()
.annotate 'line', 835
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 836

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 839
    self.'updateannot'()
.annotate 'line', 840
    self.'vprint'(__ARG_1)
.annotate 'line', 841
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 842

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 845
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 847
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 848
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 849
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 850
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 851
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 852
    assign $P1, $S1
.annotate 'line', 853
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 854
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 856
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 857
    assign $P2, $I1
.annotate 'line', 858
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 861

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 864
    self.'updateannot'()
.annotate 'line', 865
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 866

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 869
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 870
    $P1.'print'('  ')
.annotate 'line', 871
    $P1.'print'(__ARG_1)
.annotate 'line', 872
    $P1.'print'(':')
.annotate 'line', 873
    if_null __ARG_2, __label_1
.annotate 'line', 874
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 875
    $P1.'print'("\n")
# }
.annotate 'line', 876

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 879
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 880
    $P1.'print'('    goto ')
.annotate 'line', 881
    $P1.'print'(__ARG_1)
.annotate 'line', 882
    if_null __ARG_2, __label_1
.annotate 'line', 883
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 884
    $P1.'print'("\n")
# }
.annotate 'line', 885

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 889
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 890

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 893
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 894

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 897
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 898

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 901
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 902

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 905
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 906

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 909
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 910

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 913
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 914

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 918
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 919

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 922
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 923

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 926
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 927

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 930
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 931

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 934
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 935

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 938
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 939

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 942
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 943

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 946
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 947

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 950
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 951

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 954
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 955

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 958
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 959

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 962
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 963

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 966
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 967

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 970
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 971

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 974
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 975

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 978
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 979

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 982
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 983

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 986
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 987

.end # emitsay


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 990
    concat $S1, "    get_hll_global ", __ARG_1
    self.'print'($S1)
.annotate 'line', 991
    if_null __ARG_3, __label_1
.annotate 'line', 992
    concat $S1, ", ", __ARG_3
    self.'print'($S1)
  __label_1: # endif
.annotate 'line', 993
    concat $S1, ", '", __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 994

.end # emitget_hll_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 997
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 998

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1001
    self.'say'("store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 1002

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 785
    addattribute $P0, 'handle'
.annotate 'line', 786
    addattribute $P0, 'file'
.annotate 'line', 787
    addattribute $P0, 'line'
.annotate 'line', 788
    addattribute $P0, 'pendingf'
.annotate 'line', 789
    addattribute $P0, 'pendingl'
.annotate 'line', 790
    addattribute $P0, 'noan'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 1011
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 1012

.end # integerValue


.sub 'floatValue' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 1016
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 1017
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 1018

.end # floatValue


.sub 'floatresult' :subid('WSubId_63')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1026
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1027
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1028
    .return($I1)
# }
.annotate 'line', 1029

.end # floatresult


.sub 'floatAsString' :subid('WSubId_59')
        .param num __ARG_1
# Body
# {
.annotate 'line', 1037
# aux: $S1
    set $N1, __ARG_1
    set $S1, $N1
.annotate 'line', 1038
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 1039
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1040
    .return($S1)
# }
.annotate 'line', 1041

.end # floatAsString

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant PREDEFCONST_FILENAME evaluated at compile time
# Constant PREDEFCONST_LINENUM evaluated at compile time

.sub 'createPredefConstInt' :subid('WSubId_114')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1059
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1060
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1061
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1062
    $P3 = WSubId_21(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1063

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_106')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1067
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1068
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1069
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1070
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1071
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1070
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1072

.end # createPredefConstString

# Constant __DEBUG_PREDEFS evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1101
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1102
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1103
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1104
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat __ARG_2, '    ', $S1
.annotate 'line', 1105
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1106
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1107

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1110
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1112
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1113
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1114
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1117
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1118
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1121
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1122
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 1123
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1124
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1125

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 1087
    addattribute $P0, 'body'
.annotate 'line', 1088
    addattribute $P0, 'typeresult'
.end
.namespace [ 'Winxed'; 'Compiler'; 'PredefBase' ]

.sub 'PredefBase' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param string __ARG_6
        .param string __ARG_7
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1146
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1147
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1148
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1150
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1151
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1152
# n: $I1
    null $I1
.annotate 'line', 1153
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1154
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1155
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1157
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1160
    set $I1, -2
.annotate 'line', 1161
    if_null __ARG_5, __label_8
.annotate 'line', 1162
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1165
    set $I1, 1
.annotate 'line', 1166
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1167
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1168
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1170
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1171
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1172
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1174
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1175
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1176
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1180
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1181

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1184
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1185
    .return($S1)
# }
.annotate 'line', 1186

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1189
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1190

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1191
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1194
# type: $S1
    null $S1
# switch
.annotate 'line', 1195
    set $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_3
    set $I2, 1
    if $I1 == $I2 goto __label_4
    set $I2, 2
    if $I1 == $I2 goto __label_5
    set $I2, 3
    if $I1 == $I2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 1196
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1197
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1198
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1199
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1201
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1203
    .return($S1)
# }
.annotate 'line', 1204

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1207
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1208
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1209
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1210
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1211
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1212
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1213

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1130
    addattribute $P0, 'name'
.annotate 'line', 1131
    addattribute $P0, 'body'
.annotate 'line', 1132
    addattribute $P0, 'typeresult'
.annotate 'line', 1133
    addattribute $P0, 'type0'
.annotate 'line', 1134
    addattribute $P0, 'type1'
.annotate 'line', 1135
    addattribute $P0, 'type2'
.annotate 'line', 1136
    addattribute $P0, 'type3'
.annotate 'line', 1137
    addattribute $P0, 'nparams'
.end
.namespace [ 'Winxed'; 'Compiler'; 'PredefFunction' ]

.sub 'PredefFunction' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
# Body
# {
.annotate 'line', 1225
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1226

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1216
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]

.sub 'PredefFunctionEval' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
        .param string __ARG_8 :optional
# Body
# {
.annotate 'line', 1239
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1240
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1241

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1229
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1231
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1249
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1250

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1253
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1254
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.annotate 'line', 1255
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1256
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1257
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1259
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1260
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1261
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1264
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1265
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1267
    ne $S3, 'null', __label_9
.annotate 'line', 1268
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1270
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1272

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1246
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Predef_say' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1277
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1278
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1279
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1280
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1281
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1280
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1282
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1285
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1286

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1290
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1291
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1292
    if_null __ARG_4, __label_2
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1293
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1294
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1295

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1299
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1300
    if_null __ARG_4, __label_2
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1301
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1302

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1308
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1309
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1310
    WSubId_1("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1311
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1312

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1316
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1317
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1318
# predefined length
    length $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1319

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1323
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1324
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1325
# predefined bytelength
    bytelength $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1326

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1330
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1331
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1332
# predefined ord
    ord $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1333

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1337
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1338
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1339
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1340
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1341
# predefined ord
    ord $I2, $S1, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1342

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1346
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1348
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1349
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1351
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1352
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1353

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1357
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1358
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1359
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1360
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1362
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1363
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1364

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1368
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1369
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1370
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1371
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1372
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1373
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1375
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1376
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1377

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1381
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1382
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1383
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1384
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1385
# predefined indexof
    index $I1, $S1, $S2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1386

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1390
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1391
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1392
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1393
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1394
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1395
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1396
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1397

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_115')
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_23 = "WSubId_23"
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_32 = "WSubId_32"
.const 'Sub' WSubId_33 = "WSubId_33"
.const 'Sub' WSubId_34 = "WSubId_34"
# Body
# {
.annotate 'line', 1401
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1402
    new $P4, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1403
    new $P6, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P6.'Predef_typecast'('I')
    set $P5, $P6
    $P4.'PredefFunction'('int', $P5, 'I', '!')
    set $P3, $P4
.annotate 'line', 1401
    push $P1, $P3
.annotate 'line', 1406
    new $P8, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1407
    new $P10, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P10.'Predef_typecast'('N')
    set $P9, $P10
    $P8.'PredefFunction'('float', $P9, 'N', '!')
    set $P7, $P8
.annotate 'line', 1401
    push $P1, $P7
.annotate 'line', 1410
    new $P12, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1411
    new $P14, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P14.'Predef_typecast'('S')
    set $P13, $P14
    $P12.'PredefFunction'('string', $P13, 'S', '!')
    set $P11, $P12
.annotate 'line', 1401
    push $P1, $P11
.annotate 'line', 1414
    new $P16, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P16.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P15, $P16
.annotate 'line', 1401
    push $P1, $P15
.annotate 'line', 1418
    new $P18, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P18.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P17, $P18
.annotate 'line', 1401
    push $P1, $P17
.annotate 'line', 1422
    new $P20, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P20.'PredefFunction'('time', 'time %0', 'I')
    set $P19, $P20
.annotate 'line', 1401
    push $P1, $P19
.annotate 'line', 1426
    new $P22, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P22.'PredefFunction'('floattime', 'time %0', 'N')
    set $P21, $P22
.annotate 'line', 1401
    push $P1, $P21
.annotate 'line', 1430
    new $P24, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P24.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P23, $P24
.annotate 'line', 1401
    push $P1, $P23
.annotate 'line', 1434
    new $P26, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P26.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P25, $P26
.annotate 'line', 1401
    push $P1, $P25
.annotate 'line', 1438
    new $P28, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P28.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P27, $P28
.annotate 'line', 1401
    push $P1, $P27
.annotate 'line', 1442
    new $P30, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P30.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P29, $P30
.annotate 'line', 1401
    push $P1, $P29
.annotate 'line', 1446
    new $P32, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P32.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P31, $P32
.annotate 'line', 1401
    push $P1, $P31
.annotate 'line', 1453
    new $P34, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P34.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P33, $P34
.annotate 'line', 1401
    push $P1, $P33
.annotate 'line', 1460
    new $P36, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P36.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P35, $P36
.annotate 'line', 1401
    push $P1, $P35
.annotate 'line', 1467
    new $P38, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P38.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P37, $P38
.annotate 'line', 1401
    push $P1, $P37
.annotate 'line', 1475
    new $P40, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P40.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P39, $P40
.annotate 'line', 1401
    push $P1, $P39
.annotate 'line', 1484
    new $P42, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P42.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P41, $P42
.annotate 'line', 1401
    push $P1, $P41
.annotate 'line', 1494
    new $P44, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P44.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P43, $P44
.annotate 'line', 1401
    push $P1, $P43
.annotate 'line', 1498
    new $P46, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1499
    $P46.'PredefFunctionEval'('length', WSubId_22, 'length %0, %1', 'I', 'S')
    set $P45, $P46
.annotate 'line', 1401
    push $P1, $P45
.annotate 'line', 1503
    new $P48, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1504
    $P48.'PredefFunctionEval'('bytelength', WSubId_23, 'bytelength %0, %1', 'I', 'S')
    set $P47, $P48
.annotate 'line', 1401
    push $P1, $P47
.annotate 'line', 1508
    new $P50, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1509
    $P50.'PredefFunctionEval'('chr', WSubId_24, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P49, $P50
.annotate 'line', 1401
    push $P1, $P49
.annotate 'line', 1517
    new $P52, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1518
    $P52.'PredefFunctionEval'('ord', WSubId_25, 'ord %0, %1', 'I', 'S')
    set $P51, $P52
.annotate 'line', 1401
    push $P1, $P51
.annotate 'line', 1522
    new $P54, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1523
    $P54.'PredefFunctionEval'('ord', WSubId_26, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P53, $P54
.annotate 'line', 1401
    push $P1, $P53
.annotate 'line', 1527
    new $P56, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1528
    $P56.'PredefFunctionEval'('substr', WSubId_27, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P55, $P56
.annotate 'line', 1401
    push $P1, $P55
.annotate 'line', 1532
    new $P58, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1533
    $P58.'PredefFunctionEval'('substr', WSubId_28, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P57, $P58
.annotate 'line', 1401
    push $P1, $P57
.annotate 'line', 1537
    new $P60, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P60.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P59, $P60
.annotate 'line', 1401
    push $P1, $P59
.annotate 'line', 1541
    new $P62, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1542
    $P62.'PredefFunctionEval'('indexof', WSubId_29, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P61, $P62
.annotate 'line', 1401
    push $P1, $P61
.annotate 'line', 1546
    new $P64, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1547
    $P64.'PredefFunctionEval'('indexof', WSubId_30, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P63, $P64
.annotate 'line', 1401
    push $P1, $P63
.annotate 'line', 1551
    new $P66, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P66.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P65, $P66
.annotate 'line', 1401
    push $P1, $P65
.annotate 'line', 1555
    new $P68, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P68.'PredefFunction'('escape', 'escape %0, %1', 'S', 'S')
    set $P67, $P68
.annotate 'line', 1401
    push $P1, $P67
.annotate 'line', 1559
    new $P70, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P70.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P69, $P70
.annotate 'line', 1401
    push $P1, $P69
.annotate 'line', 1567
    new $P72, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P72.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P71, $P72
.annotate 'line', 1401
    push $P1, $P71
.annotate 'line', 1575
    new $P74, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P74.'PredefFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P73, $P74
.annotate 'line', 1401
    push $P1, $P73
.annotate 'line', 1582
    new $P76, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P76.'PredefFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P75, $P76
.annotate 'line', 1401
    push $P1, $P75
.annotate 'line', 1589
    new $P78, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P78.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P77, $P78
.annotate 'line', 1401
    push $P1, $P77
.annotate 'line', 1593
    new $P80, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P80.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P79, $P80
.annotate 'line', 1401
    push $P1, $P79
.annotate 'line', 1597
    new $P82, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P82.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P81, $P82
.annotate 'line', 1401
    push $P1, $P81
.annotate 'line', 1601
    new $P84, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P84.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P83, $P84
.annotate 'line', 1401
    push $P1, $P83
.annotate 'line', 1605
    new $P86, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P86.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P85, $P86
.annotate 'line', 1401
    push $P1, $P85
.annotate 'line', 1612
    new $P88, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P88.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P87, $P88
.annotate 'line', 1401
    push $P1, $P87
.annotate 'line', 1619
    new $P90, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P90.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P89, $P90
.annotate 'line', 1401
    push $P1, $P89
.annotate 'line', 1623
    new $P92, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P92.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P91, $P92
.annotate 'line', 1401
    push $P1, $P91
.annotate 'line', 1627
    new $P94, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P94.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P93, $P94
.annotate 'line', 1401
    push $P1, $P93
.annotate 'line', 1631
    new $P96, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P96.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P95, $P96
.annotate 'line', 1401
    push $P1, $P95
.annotate 'line', 1635
    new $P98, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P98.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P97, $P98
.annotate 'line', 1401
    push $P1, $P97
.annotate 'line', 1639
    new $P100, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P100.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P99, $P100
.annotate 'line', 1401
    push $P1, $P99
.annotate 'line', 1643
    new $P102, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P102.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P101, $P102
.annotate 'line', 1401
    push $P1, $P101
.annotate 'line', 1647
    new $P104, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P104.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P103, $P104
.annotate 'line', 1401
    push $P1, $P103
.annotate 'line', 1651
    new $P106, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P106.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P105, $P106
.annotate 'line', 1401
    push $P1, $P105
.annotate 'line', 1655
    new $P108, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P108.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P107, $P108
.annotate 'line', 1401
    push $P1, $P107
.annotate 'line', 1659
    new $P110, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P110.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P109, $P110
.annotate 'line', 1401
    push $P1, $P109
.annotate 'line', 1663
    new $P112, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P112.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P111, $P112
.annotate 'line', 1401
    push $P1, $P111
.annotate 'line', 1667
    new $P114, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P114.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P113, $P114
.annotate 'line', 1401
    push $P1, $P113
.annotate 'line', 1671
    new $P116, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P116.'PredefFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P115, $P116
.annotate 'line', 1401
    push $P1, $P115
.annotate 'line', 1684
    new $P118, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P118.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P117, $P118
.annotate 'line', 1401
    push $P1, $P117
.annotate 'line', 1688
    new $P120, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P120.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P119, $P120
.annotate 'line', 1401
    push $P1, $P119
.annotate 'line', 1692
    new $P122, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P122.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P121, $P122
.annotate 'line', 1401
    push $P1, $P121
.annotate 'line', 1696
    new $P124, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P124.'PredefFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P123, $P124
.annotate 'line', 1401
    push $P1, $P123
.annotate 'line', 1700
    new $P126, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P126.'PredefFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P125, $P126
.annotate 'line', 1401
    push $P1, $P125
.annotate 'line', 1704
    new $P128, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P128.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P127, $P128
.annotate 'line', 1401
    push $P1, $P127
.annotate 'line', 1708
    new $P130, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P130.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P129, $P130
.annotate 'line', 1401
    push $P1, $P129
.annotate 'line', 1712
    new $P132, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P132.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P131, $P132
.annotate 'line', 1401
    push $P1, $P131
.annotate 'line', 1716
    new $P134, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P134.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P133, $P134
.annotate 'line', 1401
    push $P1, $P133
.annotate 'line', 1720
    new $P136, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P136.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P135, $P136
.annotate 'line', 1401
    push $P1, $P135
.annotate 'line', 1724
    new $P138, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P138.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P137, $P138
.annotate 'line', 1401
    push $P1, $P137
.annotate 'line', 1731
    new $P140, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P140.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P139, $P140
.annotate 'line', 1401
    push $P1, $P139
.annotate 'line', 1738
    new $P142, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P142.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P141, $P142
.annotate 'line', 1401
    push $P1, $P141
.annotate 'line', 1742
    new $P144, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P144.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P143, $P144
.annotate 'line', 1401
    push $P1, $P143
.annotate 'line', 1746
    new $P146, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P146.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P145, $P146
.annotate 'line', 1401
    push $P1, $P145
.annotate 'line', 1750
    new $P148, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P148.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P147, $P148
.annotate 'line', 1401
    push $P1, $P147
.annotate 'line', 1754
    new $P150, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P150.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P149, $P150
.annotate 'line', 1401
    push $P1, $P149
.annotate 'line', 1758
    new $P152, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1759
    $P152.'PredefFunction'('print', WSubId_31, 'v', '*')
    set $P151, $P152
.annotate 'line', 1401
    push $P1, $P151
.annotate 'line', 1762
    new $P154, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1763
    $P154.'PredefFunction'('say', WSubId_32, 'v', '*')
    set $P153, $P154
.annotate 'line', 1401
    push $P1, $P153
.annotate 'line', 1766
    new $P156, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1767
    $P156.'PredefFunction'('cry', WSubId_33, 'v', '*')
    set $P155, $P156
.annotate 'line', 1401
    push $P1, $P155
.annotate 'line', 1770
    new $P158, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1771
    $P158.'PredefFunction'('invoke', WSubId_34, 'P', '!')
    set $P157, $P158
.annotate 'line', 1401
    push $P1, $P157
.annotate 'line', 1775
    .return($P1)
# }
.annotate 'line', 1776

.end # getpredefs


.sub 'optimize_array' :subid('WSubId_37')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1784
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1785
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1786
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1787
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1786
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1789

.end # optimize_array


.sub 'emit_array' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1793
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 1794
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1795

.end # emit_array


.sub 'parseDotted' :subid('WSubId_54')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1799
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1800
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1801
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1802
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1803
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1804
    $P2 = __ARG_1.'get'()
.annotate 'line', 1805
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1808
    __ARG_1.'unget'($P2)
.annotate 'line', 1809
    .return($P1)
# }
.annotate 'line', 1810

.end # parseDotted


.sub 'parseList' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1818
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1819
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1820
# {
.annotate 'line', 1821
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1822
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1823
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1824
    unless_null __ARG_4, __label_4
.annotate 'line', 1825
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1827
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1828
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1829
    .return($P1)
# }
.annotate 'line', 1830

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1835
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1836
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1837
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1838
    .return($P1)
# }
.annotate 'line', 1839

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_55')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1843
    new $P1, ['ResizableStringArray']
.annotate 'line', 1844
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1845
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1846
    .return($P1)
# }
.annotate 'line', 1847

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1860
    setattribute self, 'start', __ARG_1
.annotate 'line', 1861
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1862

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1865
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1866
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1868
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 1869

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 1872
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1873
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1875
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 1876

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 1879
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1880
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1882
    .return("")
  __label_2: # endif
# }
.annotate 'line', 1883

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1886
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1887

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1890
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1891

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1894
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1895

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1898
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 1899

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1902
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1903

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1906
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1907

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1910
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1911

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1914
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1915

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1918
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1919

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1855
    addattribute $P0, 'start'
.annotate 'line', 1856
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 1934
    $P2 = WSubId_35(__ARG_1, __ARG_2, WSubId_36, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 1935

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1939
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1940

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1943
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1944
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1945

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 1949
    getattribute $P1, self, 'args'
    WSubId_37($P1)
# }
.annotate 'line', 1950

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1953
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1954
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1955
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1956
    .return($P1)
# }
.annotate 'line', 1957

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1960
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1961

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 1930
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1973
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1976
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1977
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1978
    .return($I1)
# }
.annotate 'line', 1979

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1982
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1983
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 1984
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1985
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1986

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1989
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1990
    if_null __ARG_2, __label_1
.annotate 'line', 1991
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1992

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1995
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1996
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1997
    .return(self)
# }
.annotate 'line', 1998

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 1970
    addattribute $P0, 'name'
.annotate 'line', 1971
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2003
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2004
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2005
    $P1 = __ARG_1.'get'()
.annotate 'line', 2006
# var args: $P2
    null $P2
.annotate 'line', 2007
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2008
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2010
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2011
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2012

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2021
    $P2 = WSubId_35(__ARG_1, __ARG_2, WSubId_38, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2022

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2025
    getattribute $P1, self, 'list'
    WSubId_37($P1)
# }
.annotate 'line', 2026

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2027
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2030
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2031
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2032
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2034
    .return($P2)
# }
.annotate 'line', 2035

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2017
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_57')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2044
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 2045
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 2046

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_108')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2050
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 2051
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2053
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 2054
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 2056

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2060
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2062
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2064
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2066
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2063
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2065
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2067
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2069
    __ARG_2.'unget'($P1)
.annotate 'line', 2070
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2072

.end # parseUsing


.sub 'parseSig' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 2076
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2077
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2078
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2079
    WSubId_39("'='", $P2)
  __label_1: # endif
.annotate 'line', 2080
# var expr: $P3
    $P3 = WSubId_36(__ARG_2, __ARG_3)
.annotate 'line', 2081
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2082

.end # parseSig


.sub 'parseStatement' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
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
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2086
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2087
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 2088
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 2089
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 2090
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 2091
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 2092
    new $P6, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 2093
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 2094
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2095
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.annotate 'line', 2096
    WSubId_40("':'", $P1)
  __label_5: # endif
.annotate 'line', 2097
    .tailcall WSubId_41($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2100
    $P4 = $P1.'checkkeyword'()
    set $S1, $P4
    set $S2, 'using'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    set $S2, 'volatile'
    if $S1 == $S2 goto __label_10
    set $S2, 'var'
    if $S1 == $S2 goto __label_11
    set $S2, 'string'
    if $S1 == $S2 goto __label_12
    set $S2, 'int'
    if $S1 == $S2 goto __label_13
    set $S2, 'float'
    if $S1 == $S2 goto __label_14
    set $S2, 'return'
    if $S1 == $S2 goto __label_15
    set $S2, 'yield'
    if $S1 == $S2 goto __label_16
    set $S2, 'goto'
    if $S1 == $S2 goto __label_17
    set $S2, 'if'
    if $S1 == $S2 goto __label_18
    set $S2, 'while'
    if $S1 == $S2 goto __label_19
    set $S2, 'do'
    if $S1 == $S2 goto __label_20
    set $S2, 'continue'
    if $S1 == $S2 goto __label_21
    set $S2, 'break'
    if $S1 == $S2 goto __label_22
    set $S2, 'switch'
    if $S1 == $S2 goto __label_23
    set $S2, 'for'
    if $S1 == $S2 goto __label_24
    set $S2, 'throw'
    if $S1 == $S2 goto __label_25
    set $S2, 'try'
    if $S1 == $S2 goto __label_26
    goto __label_7
  __label_8: # case
.annotate 'line', 2102
    .tailcall WSubId_42($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2104
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2107
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2110
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 2112
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 2114
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 2116
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 2118
    new $P6, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 2120
    new $P8, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_17: # case
.annotate 'line', 2122
    new $P10, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_18: # case
.annotate 'line', 2124
    new $P12, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_19: # case
.annotate 'line', 2126
    new $P14, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_20: # case
.annotate 'line', 2128
    new $P16, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_21: # case
.annotate 'line', 2130
    new $P18, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_22: # case
.annotate 'line', 2132
    new $P20, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_23: # case
.annotate 'line', 2134
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2136
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2138
    new $P22, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_26: # case
.annotate 'line', 2140
    new $P24, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_7: # default
.annotate 'line', 2142
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_27
    unless $P25 goto __label_27
# {
.annotate 'line', 2143
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2144
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 2145
    new $P6, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 2146
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 2148
    __ARG_1.'unget'($P1)
.annotate 'line', 2149
    new $P5, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.annotate 'line', 2151
    WSubId_6('parseStatement failure', $P1)
# }
.annotate 'line', 2152

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2162
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2163

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2164
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2167
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2168

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2171
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2172

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2175
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2176

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2179
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2180

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2183
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2184

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2187
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2188

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2191
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2192

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2195
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2196

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2199
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2200

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2203
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2204

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2207
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2208

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2211
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2212

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2215
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2216

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2223
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2224

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2227
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2228

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2231
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2232

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2235
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2237
    .return(self)
# }
.annotate 'line', 2238

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2158
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2243
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2246
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2247

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2248
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2241
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2261
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2262
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2263
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2264
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2265
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2266
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2267
    null $I2
  __label_4: # endif
.annotate 'line', 2268
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2264
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2270
    unless $I2 goto __label_6
.annotate 'line', 2271
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2273
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2274

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2257
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2281
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2282
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2283

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2284
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2287
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2288
    .return(self)
# }
.annotate 'line', 2289

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 2292
    getattribute $P1, self, 'statements'
    WSubId_51(__ARG_1, $P1)
# }
.annotate 'line', 2293

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2277
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2298
    unless_null __ARG_1, __label_1
.annotate 'line', 2299
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2300
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2301
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2303
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2304

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 2312
# var arg: $P1
    null $P1
.annotate 'line', 2313
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2314
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2315
    $P2 = __ARG_1.'get'()
.annotate 'line', 2316
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2317
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2320
    __ARG_1.'unget'($P2)
.annotate 'line', 2321
    $P1 = WSubId_36(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2323
    .return($P1)
# }
.annotate 'line', 2324

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2333
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2334
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2335
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2336
    unless $I1 goto __label_1
.annotate 'line', 2337
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2338
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2339
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2340
    $P1 = __ARG_2.'get'()
.annotate 'line', 2341
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2342
    __ARG_2.'unget'($P1)
.annotate 'line', 2343
    $P3 = WSubId_35(__ARG_2, __ARG_3, WSubId_52, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2345
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 2346

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2349
    getattribute $P1, self, 'args'
    WSubId_37($P1)
.annotate 'line', 2350
    .return(self)
# }
.annotate 'line', 2351

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2354
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2355
    self.'annotate'(__ARG_1)
.annotate 'line', 2356
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2357
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2358
    __ARG_1.'print'('    ')
.annotate 'line', 2359
    unless_null $P1, __label_2
.annotate 'line', 2360
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2362
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2363
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2364
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2365
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2367

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2326
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2328
    addattribute $P0, 'opname'
.annotate 'line', 2329
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 2379
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2380
# var path: $P1
    $P1 = WSubId_54(__ARG_2)
.annotate 'line', 2381
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2382
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2383
    WSubId_53(';', __ARG_2)
.annotate 'line', 2384
    $P3 = WSubId_55($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2385
    .return(self)
# }
.annotate 'line', 2386

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2387
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2390
    self.'annotate'(__ARG_1)
.annotate 'line', 2391
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2392

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2374
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2376
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 2404
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2405
# var names: $P1
    null $P3
    $P1 = WSubId_35(__ARG_2, $P3, WSubId_56, ';')
.annotate 'line', 2406
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2407
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2408
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2410
    setattribute self, 'names', $P1
# }
.annotate 'line', 2411

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2414
    .return(self)
# }
.annotate 'line', 2415

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2418
    self.'annotate'(__ARG_1)
.annotate 'line', 2419
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2420
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2421
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2423

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2399
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2401
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2437
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2438
# var path: $P1
    $P1 = WSubId_54(__ARG_2)
.annotate 'line', 2439
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2440
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2441
    WSubId_53(';', __ARG_2)
.annotate 'line', 2442
    setattribute self, 'path', $P1
# }
.annotate 'line', 2443

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2446
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2447
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2449
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2451
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2465
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2452
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2453
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2454
    $P4.'pop'()
.annotate 'line', 2455
# var ns: $P5
    $P5 = self.'findns'($P4)
.annotate 'line', 2456
    if_null $P5, __label_6
# {
.annotate 'line', 2457
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2458
    if_null $P3, __label_7
# {
.annotate 'line', 2459
    self.'createvarused'($P2, $P3)
.annotate 'line', 2460
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
# }
  __label_7: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2466
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2467
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2468
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2469
    self.'usesubid'($S1)
.annotate 'line', 2470
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2472
    self.'createvar'($P2, 'P')
.annotate 'line', 2473
    .return(self)
# }
.annotate 'line', 2474

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2477
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2478
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2479
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2480
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2481
    self.'annotate'(__ARG_1)
.annotate 'line', 2482
# key: $S2
    null $S2
.annotate 'line', 2483
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2484
    $P1.'pop'()
.annotate 'line', 2485
    $P3 = WSubId_57($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2487
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2489

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2430
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2432
    addattribute $P0, 'path'
.annotate 'line', 2433
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2500
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2501
# var nskey: $P1
    $P1 = WSubId_54(__ARG_2)
.annotate 'line', 2502
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2503
    ge $I1, 1, __label_1
.annotate 'line', 2504
    WSubId_39('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2505
# var nssym: $P2
    $P3 = WSubId_55($P1)
    $P2 = __ARG_3.'findns'($P3)
.annotate 'line', 2507
    unless_null $P2, __label_2
.annotate 'line', 2508
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2509
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2511
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 2512

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2515
    .return(self)
# }
.annotate 'line', 2516

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2496
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2531
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2532
    $P2 = WSubId_36(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2533
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 2534

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2537
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2538
    .return(self)
# }
.annotate 'line', 2539

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2542
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2543

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2526
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2528
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
# Body
# {
.annotate 'line', 2560
    setattribute self, 'type', __ARG_1
.annotate 'line', 2561
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2562
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2563
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2564

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2567
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2568

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2569
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2570
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2571
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2572
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2573
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2574
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2575
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2552
    addattribute $P0, 'type'
.annotate 'line', 2553
    addattribute $P0, 'reg'
.annotate 'line', 2554
    addattribute $P0, 'scope'
.annotate 'line', 2555
    addattribute $P0, 'flags'
.annotate 'line', 2556
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2583
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2584

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2587
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2588

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2580
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 2597
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2598

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2599
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2602
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2603
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2604
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2605

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2591
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2593
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2616
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2617

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2620
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2621
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2622
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2623
    if_null $P2, __label_2
.annotate 'line', 2624
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2625
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2626
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2627
    $P1[$S1] = $P3
.annotate 'line', 2628
    .return($P3)
# }
.annotate 'line', 2629

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2632
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2633
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2634
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2635
    if_null $P2, __label_2
.annotate 'line', 2636
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2637
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2638

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2641
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2642
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2643
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2644
    if_null $P2, __label_2
.annotate 'line', 2645
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2646
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2647

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2650
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2651
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2652
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2653
    if_null $P2, __label_2
.annotate 'line', 2654
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2655
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2656
    $P1[$S1] = $P3
.annotate 'line', 2657
    .return($P3)
# }
.annotate 'line', 2658

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2661
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2662
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2663

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2666
# var sym: $P1
    null $P1
.annotate 'line', 2667
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2668
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2669
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2671
    .return($P3)
# }
.annotate 'line', 2672

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2675
# var sym: $P1
    null $P1
.annotate 'line', 2676
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2677
    .return($P1)
  __label_1: # endif
.annotate 'line', 2678
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2679
    .return($P1)
  __label_2: # endif
.annotate 'line', 2680
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2681
    if_null $P2, __label_3
.annotate 'line', 2682
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2683
    .return($P3)
# }
.annotate 'line', 2684

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2687
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2688
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2689
    .return($S1)
# }
.annotate 'line', 2690

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2693
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2695
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2696
    .return('__WLEX_self')
# }
.annotate 'line', 2697

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2611
    addattribute $P0, 'locals'
.annotate 'line', 2612
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2706
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2718
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2719

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2720
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2721
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2722
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2723
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2724
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2725
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2726
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2727
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2728
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2731
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2732

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2736
    .return(self)
# }
.annotate 'line', 2737

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2738
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2741
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2742
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2743
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2744
    .return($S2)
# }
.annotate 'line', 2745

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2748
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 2749
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 2750
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 2751

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2754
# reg: $S1
    null $S1
.annotate 'line', 2755
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2756
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2758
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2759
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2761
    .return($S1)
# }
.annotate 'line', 2762

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2765
    WSubId_58(self)
# }
.annotate 'line', 2766

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2714
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2771
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2769
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 2781
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2782
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2783
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2784
    WSubId_39('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2785
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2786

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2787
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2790
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2791
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2792
    .return(self)
# }
.annotate 'line', 2793

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2796
    self.'annotate'(__ARG_1)
.annotate 'line', 2797
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2798
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2799
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2800
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2801
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2803
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2805

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2776
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2778
    addattribute $P0, 'fn'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2820
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2821
    .return(self)
# }
.annotate 'line', 2822

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2825
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2826

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2829
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2830
    .return(self)
# }
.annotate 'line', 2831

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2834
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2835
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2836
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2838
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2839
    ne $I1, 0, __label_5
.annotate 'line', 2840
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2842
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2845
    .return(0)
# }
.annotate 'line', 2846

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2849
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2851
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2852
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2853
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2855
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2856
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_7
    set $S3, 'P'
    if $S2 == $S3 goto __label_8
    set $S3, 'I'
    if $S2 == $S3 goto __label_9
    set $S3, 'N'
    if $S2 == $S3 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2859
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2862
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2865
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2868

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2871
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2873
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2874
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2875
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2877
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2878
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_7
    set $S3, 'P'
    if $S2 == $S3 goto __label_8
    set $S3, 'I'
    if $S2 == $S3 goto __label_9
    set $S3, 'N'
    if $S2 == $S3 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2881
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2884
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2887
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2890

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2817
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2897
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2898
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2895
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2908
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2909
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2910

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2911
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2912
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2915
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2916
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2917
    .return($S1)
# }
.annotate 'line', 2918

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2921
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2922
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2923
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 2924
# predefined unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 2925
    .return($S1)
# }
.annotate 'line', 2926

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2929
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2930
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2931

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2934
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2935

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2903
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2905
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2946
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2947
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2948
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 2949
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2950

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2951
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2952
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2955
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 2956

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2959
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 2960
    .return($N1)
# }
.annotate 'line', 2961

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2964
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2965
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2966
    ne $I1, 0, __label_2
.annotate 'line', 2967
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2969
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2971

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2974
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2975

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 2940
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2942
    addattribute $P0, 'pos'
.annotate 'line', 2943
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2985
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2986
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2987

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2988
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2989
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2992
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 2993
    .return($N1)
# }
.annotate 'line', 2994

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2997
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2998
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2999
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3001

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 3004
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3005
    .tailcall WSubId_59($N1)
# }
.annotate 'line', 3006

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 2980
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2982
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3015
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3018
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3019
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3020

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3023
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3024
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3025
    .return(0)
  __label_1: # endif
.annotate 'line', 3026
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3027

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3030
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3031
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3032
    if_null $P2, __label_1
.annotate 'line', 3033
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3035
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3038
    .return('P')
  __label_4: # default
.annotate 'line', 3040
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3043

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3046
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3047
    .return($S1)
# }
.annotate 'line', 3048

.end # getName


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3051
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3052
    unless_null $P1, __label_1
.annotate 'line', 3053
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3054
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3055
# s: $S1
    null $S1
.annotate 'line', 3056
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3057
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3060
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3062
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3066
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3067
    .return($S1)
# }
.annotate 'line', 3068

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 3071
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3072
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3073
    getattribute $P2, self, 'name'
    WSubId_60($P2)
  __label_1: # endif
.annotate 'line', 3074
    .return($P1)
# }
.annotate 'line', 3075

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3078
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3079
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3080
    if_null $P2, __label_1
# {
.annotate 'line', 3081
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3082
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3083
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3084
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3085
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3086
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3093
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3094
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3095
# predefined string
    set $S4, $P3
    box $P5, $S4
    setattribute self, 'subid', $P5
  __label_7: # endif
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3099
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'findsymbol'($P5)
.annotate 'line', 3100
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3101
# id: $S1
    $P5 = $P4.'makesubid'()
    null $S1
    if_null $P5, __label_11
    set $S1, $P5
  __label_11:
.annotate 'line', 3102
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3103
    self.'usesubid'($S1)
.annotate 'line', 3104
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3107
    .return(self)
# }
.annotate 'line', 3108

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3111
# id: $S1
    null $S1
.annotate 'line', 3112
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3113
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3115
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3116
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3117
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3118
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3119
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3120
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3121
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3122
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3126
    .return($S1)
# }
.annotate 'line', 3127

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3130
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3131
    self.'annotate'(__ARG_1)
.annotate 'line', 3132
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3133
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3135

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3138
    self.'annotate'(__ARG_1)
.annotate 'line', 3139
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3140

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3143
    self.'annotate'(__ARG_1)
.annotate 'line', 3144
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3145
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3146
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3147
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3148
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3149
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3152
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3155
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3158
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3159
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3161
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3162
    ne $S3, 'v', __label_13
.annotate 'line', 3163
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3164
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3165
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3168
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3169
    self.'annotate'(__ARG_1)
.annotate 'line', 3170
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3171
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3173
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3176
    .return($S2)
# }
.annotate 'line', 3177

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3011
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3013
    addattribute $P0, 'name'
.annotate 'line', 3014
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3187
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3188
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3189

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3192
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3193

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3196
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3197
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3198
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3199
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3200
    .return($S2)
# }
.annotate 'line', 3201

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3204
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3205
    self.'annotate'(__ARG_1)
.annotate 'line', 3206
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3207
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3209

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3212
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3213
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3214
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3216
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3219
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3217
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3220
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3223
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3224
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3225
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3227
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3228
    self.'annotate'(__ARG_1)
.annotate 'line', 3229
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3233
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3234

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3237
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3238

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3182
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3184
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3247
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3248

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3243
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 3259
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3260
    $P2 = WSubId_61(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3261

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3262
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3265
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3268
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3269
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3270
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3271
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3272
    __ARG_1.'say'()
# }
.annotate 'line', 3273

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3253
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3255
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3283
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3284
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3285

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3288
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3289

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3292
    self.'optimizearg'()
.annotate 'line', 3293
    .return(self)
# }
.annotate 'line', 3294

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3278
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3280
    addattribute $P0, 'subexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3305
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3306
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3307
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3308

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3311
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3312
    .return(self)
# }
.annotate 'line', 3313

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3316
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3317

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3320
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3321
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3322

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3325
    self.'optimizearg'()
.annotate 'line', 3326
    .return(self)
# }
.annotate 'line', 3327

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3330
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3331

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3334
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3335

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3299
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3301
    addattribute $P0, 'lexpr'
.annotate 'line', 3302
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3344
    .return('I')
# }
.annotate 'line', 3345

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3348
    self.'optimizearg'()
.annotate 'line', 3349
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3350
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3351
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3352
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3353
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3354
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3356
    .return(self)
# }
.annotate 'line', 3357

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3340
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3366
    .return('I')
# }
.annotate 'line', 3367

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3362
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3375
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3376

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3379
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3380
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3381
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3382
    self.'annotate'(__ARG_1)
.annotate 'line', 3383
    __ARG_1.'print'('    delete ')
.annotate 'line', 3384
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3385
    __ARG_1.'say'()
.annotate 'line', 3386
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3387
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3390
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3391

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3371
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3398
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3399

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3402
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3403
# reg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_2
    set $P2, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 3404
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3405
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3406
    self.'annotate'(__ARG_1)
.annotate 'line', 3407
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3408
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3409
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3412
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3413

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3394
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3422
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3423

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3426
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3427

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3430
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3431
    .return(self)
# }
.annotate 'line', 3432

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 3435
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3436
    self.'optimizearg'()
.annotate 'line', 3437
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3438
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3439
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3442
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3443
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3444
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_62($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3447
    .return(self)
# }
.annotate 'line', 3448

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3451
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3452
    self.'annotate'(__ARG_1)
.annotate 'line', 3453
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3454

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3418
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3463
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3464

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3465
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3468
    .return('I')
# }
.annotate 'line', 3469

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3472
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3473
    .return(self)
# }
.annotate 'line', 3474

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3477
    self.'optimizearg'()
.annotate 'line', 3478
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3479
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3480
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3481
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3483
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3484
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3485
    .return(self)
# }
.annotate 'line', 3486

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3489
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3490

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3493
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3494
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3495
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3496
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3498
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3501
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3504
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3506

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3459
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3515
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3516

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3519
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3520
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3521
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3522

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3511
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3531
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3532
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3533
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3534

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3527
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3541
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3542

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3545
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3546
    self.'annotate'(__ARG_1)
.annotate 'line', 3547
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3548
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3549
    .return($S1)
# }
.annotate 'line', 3550

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3537
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3557
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3558

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3561
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3562
    self.'annotate'(__ARG_1)
.annotate 'line', 3563
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3564
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3565
    .return($S1)
# }
.annotate 'line', 3566

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3553
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3575
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3576

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3579
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3580
    self.'annotate'(__ARG_1)
.annotate 'line', 3581
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3582
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3583
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3584
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3585
    .return($S1)
# }
.annotate 'line', 3586

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3571
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3593
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3594

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3597
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3598
    self.'annotate'(__ARG_1)
.annotate 'line', 3599
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3600
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3601
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3602
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3603
    .return($S1)
# }
.annotate 'line', 3604

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3589
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3615
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3616
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3617
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3618
    .return(self)
# }
.annotate 'line', 3619

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3622
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3623

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3626
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3627
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3628
    .return(self)
# }
.annotate 'line', 3629

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3632
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3633

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 3636
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3637
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3638
    WSubId_58($P1)
  __label_1: # endif
# }
.annotate 'line', 3639

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3642
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3643
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3644
    self.'annotate'(__ARG_1)
.annotate 'line', 3645
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3647

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3609
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3611
    addattribute $P0, 'lexpr'
.annotate 'line', 3612
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3656
    self.'annotate'(__ARG_1)
.annotate 'line', 3657
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3658
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3659

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3652
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3668
    self.'annotate'(__ARG_1)
.annotate 'line', 3669
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3670
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3671
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3672

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3675
    self.'checkleft'()
.annotate 'line', 3676
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3677
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 3678
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 3679
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3680
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3681
    self.'annotate'(__ARG_1)
.annotate 'line', 3682
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3683
    .return($S1)
# }
.annotate 'line', 3684

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3664
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3693
    self.'checkleft'()
.annotate 'line', 3694
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3695
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3696
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3697
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3698
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3699
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3700
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3702
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3703
# aux: $S5
    null $S5
.annotate 'line', 3704
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3705
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3707
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3708
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3709
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3710
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3712
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3716
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3717
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3718
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3719
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3721
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3724
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3727
    .return($S3)
# }
.annotate 'line', 3728

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3689
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3737
    self.'checkleft'()
.annotate 'line', 3738
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3739
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3740
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3741
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3742
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3743
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3744
# aux: $S5
    null $S5
.annotate 'line', 3745
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3746
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3748
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3751
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3752
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3753
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3754
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3756
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3759
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3761
    .return($S3)
# }
.annotate 'line', 3762

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3733
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3771
    self.'checkleft'()
.annotate 'line', 3772
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3773
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3774
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3775
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3776
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3778
    ne $S2, 'I', __label_7
.annotate 'line', 3779
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3781
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3782
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3784
    self.'annotate'(__ARG_1)
.annotate 'line', 3785
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3788
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3789
    self.'annotate'(__ARG_1)
.annotate 'line', 3790
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3792
    .return($S3)
# }
.annotate 'line', 3793

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3767
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3802
    self.'checkleft'()
.annotate 'line', 3803
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3804
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3805
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3806
    self.'annotate'(__ARG_1)
.annotate 'line', 3807
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3808
    .return($S2)
# }
.annotate 'line', 3809

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3798
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3818
    self.'checkleft'()
.annotate 'line', 3819
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3820
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3821
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3822
    self.'annotate'(__ARG_1)
.annotate 'line', 3823
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3824
    .return($S2)
# }
.annotate 'line', 3825

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3814
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3832
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3835
    self.'optimizearg'()
.annotate 'line', 3836
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3837
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3838
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3839
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3840
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3841
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3843
    .return(self)
# }
.annotate 'line', 3844

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3847
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3848
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3849
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3850
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3851
    self.'annotate'(__ARG_1)
.annotate 'line', 3852
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3854
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3859
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3864
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3869
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3874
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3879
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3855
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3856
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3857
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3860
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3861
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3862
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3865
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3866
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3867
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3870
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3871
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3872
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3875
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3876
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3877
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3880
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3881
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3882
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3883
# switch
.annotate 'line', 3886
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3888
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3891
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3894
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3895
# }
.annotate 'line', 3897

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3900
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3901

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3904
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3905

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3908
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3909

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3830
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 3924
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3925
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3926
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3927

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3928
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3929
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3932
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3933
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3934
    .return(self)
# }
.annotate 'line', 3935

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3938
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3939
    self.'annotate'(__ARG_1)
.annotate 'line', 3940
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3941
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3942
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3943

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3946
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3947
    self.'annotate'(__ARG_1)
.annotate 'line', 3948
    getattribute $P1, self, 'checknull'
    if_null $P1, __label_3
    unless $P1 goto __label_3
    set $S2, 'unless'
    goto __label_2
  __label_3:
    set $S2, 'if'
  __label_2:
    __ARG_1.'say'('    ', $S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 3949

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 3917
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3919
    addattribute $P0, 'expr'
.annotate 'line', 3920
    addattribute $P0, 'checknull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3956
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3959
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3960

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3963
    self.'optimizearg'()
.annotate 'line', 3964
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3965
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3966
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3967
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3968
    unless $I1 goto __label_1
# {
.annotate 'line', 3969
    unless $I2 goto __label_2
.annotate 'line', 3970
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3972
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3974
    unless $I2 goto __label_4
.annotate 'line', 3975
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3976
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3977
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3978
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3979
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3980
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3982
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 3983
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 3984
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3986
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3987
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3988
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    iseq $I6, $S3, $S4
    .tailcall WSubId_21($P11, $P12, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3992
    .return(self)
# }
.annotate 'line', 3993

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3996
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3997

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4000
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4001

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4004
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4005

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4008
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4009

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 3954
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4016
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4019
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4020

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4023
    self.'optimizearg'()
.annotate 'line', 4024
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4025
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4026
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4027
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4028
    unless $I1 goto __label_1
# {
.annotate 'line', 4029
    unless $I2 goto __label_2
.annotate 'line', 4030
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4032
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4034
    unless $I2 goto __label_4
.annotate 'line', 4035
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4036
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 4037
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 4038
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 4039
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4040
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4042
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4043
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4044
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 4046
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 4047
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 4048
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    isne $I6, $S3, $S4
    .tailcall WSubId_21($P11, $P12, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 4052
    .return(self)
# }
.annotate 'line', 4053

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4056
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4057

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4060
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4061

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4064
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4065

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4068
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4069

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 4014
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]

.sub 'OpSameExpr' :method
        .param int __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 4079
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 4080
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 4081

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4082
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4085
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4086
    new $P2, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    not $I2, $I1
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'lexpr'
    getattribute $P6, self, 'rexpr'
    $P2.'OpSameExpr'($I2, $P3, $P4, $P5, $P6)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 4087

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4090
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
# }
.annotate 'line', 4091

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4094
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4095
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4096
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4097

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4100
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4101

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4104
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4105
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4106
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4107

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4110
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4111
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4112
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4113

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4074
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 4076
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4120
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4123
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4124

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4127
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4128

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4131
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4132

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4135
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4136

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4139
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4140

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4118
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4147
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4150
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4151

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4154
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4155

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4158
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4159

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4162
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4163

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4166
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4167

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4145
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4174
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4177
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4178

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4181
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4182

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4185
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4186

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4189
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4190

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4193
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4194

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4172
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4201
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4204
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4205

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4208
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4209

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4212
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4213

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4216
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4217

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4220
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4221

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4199
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4230
    .return('I')
# }
.annotate 'line', 4231

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4226
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4240
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4241

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4244
    self.'optimizearg'()
.annotate 'line', 4245
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4246
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4247
    eq $I1, 0, __label_2
.annotate 'line', 4248
    getattribute $P1, self, 'rexpr'
    .return($P1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4250
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    .tailcall WSubId_21($P2, $P3, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4252
    .return(self)
# }
.annotate 'line', 4253

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4256
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4257
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4258
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4259
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4260
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4263
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4264
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4265
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4266
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4267
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4269

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4236
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4278
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4279

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4282
    self.'optimizearg'()
.annotate 'line', 4283
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4284
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4285
    ne $I1, 0, __label_2
.annotate 'line', 4286
    getattribute $P1, self, 'rexpr'
    .return($P1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4288
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    .tailcall WSubId_21($P2, $P3, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4290
    .return(self)
# }
.annotate 'line', 4291

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4294
# res: $S1
    null $S1
.annotate 'line', 4295
    if_null __ARG_2, __label_1
.annotate 'line', 4296
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4298
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4299
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4300
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4301
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4302
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4305
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4306
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4307
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4308
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4309
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4311

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4274
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4316
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4326
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4327

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4330
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4331
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4332
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4333
    self.'annotate'(__ARG_1)
.annotate 'line', 4334
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4335

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4338
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4339

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4322
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4348
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4349

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4352
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4353
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4354
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4355
    self.'annotate'(__ARG_1)
.annotate 'line', 4356
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4357

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4360
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4361

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4344
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4370
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4371

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4374
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4375
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4376
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4377
    self.'annotate'(__ARG_1)
.annotate 'line', 4378
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4379

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4382
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4383

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4366
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4393
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4395
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4402
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4396
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4397
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4398
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4400
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4403
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4404
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4407
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4409

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4410
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4413
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4414
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4415
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4416
# i: $I2
    null $I2
# for loop
.annotate 'line', 4417
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4418
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4417
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4419
    .return($P2)
# }
.annotate 'line', 4420

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4423
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4424
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4425
# auxreg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_2
    set $P2, __ARG_2
    goto __label_1
  __label_2:
    box $P2, '$S0'
  __label_1:
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 4426
    self.'annotate'(__ARG_1)
.annotate 'line', 4427
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4428
# i: $I2
    set $I2, 2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 4429
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_4: # for iteration
.annotate 'line', 4428
    inc $I2
    goto __label_6
  __label_5: # for end
# }
.annotate 'line', 4430

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4433
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4434
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4435
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4436
    self.'annotate'(__ARG_1)
.annotate 'line', 4437
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4438
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4439
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4438
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4440
    .return($S1)
# }
.annotate 'line', 4441

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4444
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4445
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4446
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4447
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4448
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4447
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4449

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4388
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4390
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4458
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4459

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4460
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4463
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4464
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4465
# rreg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4466
# rval: $S3
    null $S3
# switch
.annotate 'line', 4467
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'I'
    if $S4 == $S5 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 4469
    set $S3, $S2
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 4472
    $P3 = self.'tempreg'('I')
    set $S3, $P3
.annotate 'line', 4473
    __ARG_1.'emitset'($S3, $S2)
  __label_3: # switch end
.annotate 'line', 4475
    self.'annotate'(__ARG_1)
.annotate 'line', 4476
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S3)
# }
.annotate 'line', 4477

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4454
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4486
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4487

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 4490
    self.'optimizearg'()
.annotate 'line', 4491
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4492
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4493
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4494
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4495
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4496
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4501
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4502
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4503
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4505
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# predefined string
.annotate 'line', 4506
    getattribute $P9, $P3, 'str'
    set $S3, $P9
# predefined string
    getattribute $P10, $P4, 'str'
    set $S4, $P10
    concat $S5, $S3, $S4
    $P6.'TokenSingleQuoted'($P7, $P8, $S5)
    set $P5, $P6
    goto __label_7
  __label_8:
.annotate 'line', 4508
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P3, 'file'
    getattribute $P13, $P3, 'line'
# predefined string
.annotate 'line', 4509
    $P14 = $P3.'getasquoted'()
    set $S6, $P14
# predefined string
    $P15 = $P4.'getasquoted'()
    set $S7, $P15
    concat $S8, $S6, $S7
    $P11.'TokenQuoted'($P12, $P13, $S8)
    set $P5, $P11
  __label_7:
.annotate 'line', 4510
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4512
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4513
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4514
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4515
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4518
    $P6 = WSubId_63($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4519
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4520
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4521
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_62($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4525
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4526
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4528
    .return(self)
# }
.annotate 'line', 4529

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4532
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4533
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4534
    ne $S1, $S2, __label_3
.annotate 'line', 4535
    .return($S1)
  __label_3: # endif
.annotate 'line', 4536
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4537
    .return('S')
  __label_4: # endif
.annotate 'line', 4538
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4539
    .return('S')
  __label_6: # endif
.annotate 'line', 4540
    $P1 = WSubId_63($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4541
    .return('N')
  __label_8: # endif
.annotate 'line', 4542
    .return('I')
# }
.annotate 'line', 4543

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4546
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4547
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4548
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4549
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4550
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4552
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4553
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4554
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4555
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4556
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4557
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4558
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4559
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4562
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4563
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4566
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4569
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4570
# l: $S7
    null $S7
.annotate 'line', 4571
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4573
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4574
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4576
# r: $S8
    null $S8
.annotate 'line', 4577
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4579
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4580
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4582
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4585
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4587

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4482
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4596
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4597

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4600
    self.'optimizearg'()
.annotate 'line', 4601
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4602
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4603
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4604
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4605
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4606
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4607
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4608
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4609
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4612
    .return(self)
# }
.annotate 'line', 4613

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4616
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4617
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4618
    ne $S1, $S2, __label_3
.annotate 'line', 4619
    .return($S1)
  __label_3: # endif
.annotate 'line', 4620
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4621
    .return('N')
  __label_4: # endif
.annotate 'line', 4622
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4623
    .return('N')
  __label_6: # endif
.annotate 'line', 4624
    .return('I')
# }
.annotate 'line', 4625

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4628
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4629
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4630
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4631

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4592
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4640
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4641

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 4644
    self.'optimizearg'()
.annotate 'line', 4645
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4646
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4647
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4648
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4649
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4650
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'I'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4651
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4652
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4653
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4656
    $P3 = WSubId_63($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4657
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 4658
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 4659
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_62($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4663
    ne $S1, 'S', __label_8
.annotate 'line', 4664
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 4665
    .return(self)
# }
.annotate 'line', 4666

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4669
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4670
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4671
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4672
    ne $S1, $S2, __label_3
.annotate 'line', 4673
    .return($S1)
  __label_3: # endif
.annotate 'line', 4674
    ne $S1, 'S', __label_4
.annotate 'line', 4675
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4677
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4678

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4681
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4682
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4683
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4684
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4685
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4686
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
# {
.annotate 'line', 4687
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4688
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4689
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4690
    .return()
# }
  __label_3: # endif
.annotate 'line', 4695
    ne $S1, 'N', __label_7
# {
.annotate 'line', 4696
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4697
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4698
# rval: $S5
    null $S5
# switch
.annotate 'line', 4699
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 4701
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 4702
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4703
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 4706
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4709
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 4710
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 4712
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 4713
    self.'annotate'(__ARG_1)
.annotate 'line', 4714
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_12: # endif
.annotate 'line', 4716
    .return()
# }
  __label_7: # endif
.annotate 'line', 4719
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4720
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_15
    $I3 = $P1.'isidentifier'()
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 4721
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4722
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 4725
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4726
    set $S3, $I1
# }
  __label_14: # endif
.annotate 'line', 4728
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P2.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4729
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4730
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_17
  __label_16: # else
# {
# switch
.annotate 'line', 4733
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_21
    set $S7, 'N'
    if $S6 == $S7 goto __label_22
    set $S7, 'I'
    if $S6 == $S7 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4735
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4736
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4739
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_23: # case
  __label_20: # default
.annotate 'line', 4743
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4744
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
.annotate 'line', 4745
# }
  __label_17: # endif
.annotate 'line', 4748
    self.'annotate'(__ARG_1)
.annotate 'line', 4749
    set $S6, __ARG_2
    ne $S6, '', __label_24
.annotate 'line', 4750
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_24: # endif
.annotate 'line', 4751
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4752

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4636
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4761
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4762

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 4765
    self.'optimizearg'()
.annotate 'line', 4766
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4767
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4768
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4769
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4770
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4771
# var lval: $P3
    null $P3
.annotate 'line', 4772
# var rval: $P4
    null $P4
.annotate 'line', 4773
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4774
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 4775
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 4776
    eq $I2, 0, __label_7
.annotate 'line', 4777
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_21($P5, $P6, $N3)
  __label_7: # endif
# }
  __label_5: # endif
# {
.annotate 'line', 4780
    $P5 = WSubId_63($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4781
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 4782
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 4783
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4784
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N4, $N1, $N2
    .tailcall WSubId_62($P5, $P6, $N4)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4788
    .return(self)
# }
.annotate 'line', 4789

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4792
    .return('N')
# }
.annotate 'line', 4793

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4796
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4797
# var aux: $P2
    null $P2
.annotate 'line', 4798
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4799
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4800
    $P2 = self.'tempreg'('N')
.annotate 'line', 4801
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4802
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4804
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4805
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4806
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4807
    $P2 = self.'tempreg'('N')
.annotate 'line', 4808
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4809
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4811
    self.'annotate'(__ARG_1)
.annotate 'line', 4812
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4813

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4757
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4822
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4823

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4826
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4827
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4828
    self.'annotate'(__ARG_1)
.annotate 'line', 4829
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4830

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4833
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4834

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4818
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4843
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4844

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4847
    .return('I')
# }
.annotate 'line', 4848

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4851
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4852
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4853
    self.'annotate'(__ARG_1)
.annotate 'line', 4858
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4859

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 4839
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4868
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4869

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4872
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4873
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4874
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4875
    self.'annotate'(__ARG_1)
.annotate 'line', 4876
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4877

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4880
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4881

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 4864
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4890
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4891

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4894
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4895
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4896
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4897
    self.'annotate'(__ARG_1)
.annotate 'line', 4898
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4899

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4902
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4903

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 4886
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4912
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4913

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4916
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4917
# setname: $S1
    set $S1, ''
.annotate 'line', 4918
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4919
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4921
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4924
    set $I2, 1
# switch
.annotate 'line', 4925
    $P6 = $P1.'numargs'()
    set $I3, $P6
    null $I4
    if $I3 == $I4 goto __label_9
    set $I4, 1
    if $I3 == $I4 goto __label_10
    goto __label_8
  __label_9: # case
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 4929
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4930
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 4931
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 4932
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4935
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4940
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4943
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4946
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4941
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4944
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4947
    __ARG_1.'print'(' :named')
.annotate 'line', 4948
    eq $S1, '', __label_17
.annotate 'line', 4949
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4950
# }
.annotate 'line', 4952

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 4908
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4961
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4962
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4963

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4966
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4967
    .return(self)
# }
.annotate 'line', 4968

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4971
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4972

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 4957
    addattribute $P0, 'arg'
.annotate 'line', 4958
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 4977
# var modifier: $P1
    null $P1
.annotate 'line', 4978
# var expr: $P2
    $P2 = WSubId_36(__ARG_1, __ARG_2)
.annotate 'line', 4979
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4980
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4981
    $P3 = __ARG_1.'get'()
.annotate 'line', 4982
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 4983
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 4986
    WSubId_39('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4989
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4990
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4991

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 5002
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5003
    setattribute self, 'start', __ARG_2
.annotate 'line', 5004
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5005
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5006
    __ARG_3.'unget'($P1)
.annotate 'line', 5007
    $P3 = WSubId_35(__ARG_3, __ARG_1, WSubId_64, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5009

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5012
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5013
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5014

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5017
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5018

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5021
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5022
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5023

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5026
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5027
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5028

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 5031
    getattribute $P1, self, 'args'
    WSubId_37($P1)
.annotate 'line', 5032
    .return(self)
# }
.annotate 'line', 5033

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5036
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5037
    unless_null $P1, __label_1
# {
.annotate 'line', 5038
    new $P2, ['ResizableStringArray']
.annotate 'line', 5039
# pnull: $S1
    set $S1, ''
.annotate 'line', 5040
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 5041
# var arg: $P4
    getattribute $P4, $P3, 'arg'
.annotate 'line', 5042
# reg: $S2
    null $S2
.annotate 'line', 5043
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5044
    ne $S1, '', __label_6
# {
.annotate 'line', 5045
    getattribute $P8, self, 'owner'
    $P7 = $P8.'tempreg'('P')
    set $S1, $P7
.annotate 'line', 5046
    __ARG_1.'emitnull'($S1)
# }
  __label_6: # endif
.annotate 'line', 5048
    set $S2, $S1
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5051
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
  __label_5: # endif
.annotate 'line', 5052
# predefined push
    push $P2, $S2
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5054
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5056
    .return($P1)
# }
.annotate 'line', 5057

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5060
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5061
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5063
# sep: $S1
    set $S1, ''
.annotate 'line', 5064
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5065
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5066
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5067
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5068
    if_null $P3, __label_4
.annotate 'line', 5069
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5070
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5065
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5072

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 4995
    addattribute $P0, 'owner'
.annotate 'line', 4996
    addattribute $P0, 'start'
.annotate 'line', 4997
    addattribute $P0, 'args'
.annotate 'line', 4998
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_65')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5077
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5078
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5079
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5080
    .return(1)
# }
.annotate 'line', 5081

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5092
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5093
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5094
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5095

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5098
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5099

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5102
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5103
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5104
    new $P3, ['ResizableStringArray']
.annotate 'line', 5105
# var arg: $P4
    null $P4
.annotate 'line', 5106
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5107
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5109
    if_null $P2, __label_6
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5110
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5112
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5113
    ne $S1, '', __label_9
# {
.annotate 'line', 5114
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5115
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5117
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5119
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5123
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5124
    if_null $P2, __label_11
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5125
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5126
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 5127
    .return()
  __label_2: # default
.annotate 'line', 5129
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5130
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5131
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5132
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5133
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5134
# argr: $S5
    null $S5
.annotate 'line', 5135
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5136
    set $S7, $S4
    set $S8, 'I'
    if $S7 == $S8 goto __label_21
    set $S8, 'N'
    if $S7 == $S8 goto __label_22
    set $S8, 'S'
    if $S7 == $S8 goto __label_23
    goto __label_20
  __label_21: # case
  __label_22: # case
  __label_23: # case
.annotate 'line', 5140
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5141
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5144
    ne $S1, '', __label_24
# {
.annotate 'line', 5145
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5146
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5148
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5152
    iseq $I3, $S3, $S4
    if $I3 goto __label_28
    iseq $I3, $S4, '?'
  __label_28:
    if $I3 goto __label_27
.annotate 'line', 5153
    iseq $I3, $S4, 'p'
    unless $I3 goto __label_29
.annotate 'line', 5154
    iseq $I3, $S3, 'S'
    if $I3 goto __label_30
    iseq $I3, $S3, 'P'
  __label_30:
  __label_29:
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5155
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5157
# aux: $S6
    null $S6
.annotate 'line', 5158
    ne $S4, 'p', __label_31
.annotate 'line', 5159
    set $S4, 'P'
  __label_31: # endif
.annotate 'line', 5160
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5161
    set $S7, $S4
    set $S8, 'P'
    if $S7 == $S8 goto __label_34
    set $S8, 'I'
    if $S7 == $S8 goto __label_35
    set $S8, 'N'
    if $S7 == $S8 goto __label_36
    set $S8, 'S'
    if $S7 == $S8 goto __label_37
    goto __label_33
  __label_34: # case
# switch
.annotate 'line', 5163
    set $S9, $S3
    set $S10, 'I'
    if $S9 == $S10 goto __label_40
    set $S10, 'N'
    if $S9 == $S10 goto __label_41
    set $S10, 'S'
    if $S9 == $S10 goto __label_42
    goto __label_39
  __label_40: # case
  __label_41: # case
  __label_42: # case
.annotate 'line', 5167
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5168
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_38 # break
  __label_39: # default
.annotate 'line', 5171
    $P4.'emit'(__ARG_1, $S5)
  __label_38: # switch end
    goto __label_32 # break
  __label_35: # case
  __label_36: # case
  __label_37: # case
.annotate 'line', 5177
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5178
    __ARG_1.'emitset'($S5, $S6)
    goto __label_32 # break
  __label_33: # default
.annotate 'line', 5181
    $P4.'emit'(__ARG_1, $S5)
  __label_32: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5185
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5130
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5188
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5189

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 5085
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5087
    addattribute $P0, 'predef'
.annotate 'line', 5088
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 5196
# callname: $S1
    $P6 = __ARG_3.'getname'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 5197
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5198
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_4.'numargs'()
  __label_2:
.annotate 'line', 5199
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
    goto __label_4
  __label_5:
    $P1 = __ARG_4.'getrawargs'()
  __label_4:
.annotate 'line', 5201
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5202
# nvariants: $I2
# predefined elements
    elements $I2, $P2
.annotate 'line', 5203
# var predef: $P3
    null $P3
.annotate 'line', 5204
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P4, $P8
# {
.annotate 'line', 5205
# pargs: $I3
    getattribute $P6, $P4, 'nparams'
    set $I3, $P6
.annotate 'line', 5206
    iseq $I4, $I3, $I1
    if $I4 goto __label_10
.annotate 'line', 5207
    iseq $I4, $I3, -1
  __label_10:
    if $I4 goto __label_9
.annotate 'line', 5208
    iseq $I4, $I3, -2
    unless $I4 goto __label_11
    iseq $I4, $I1, 1
  __label_11:
  __label_9:
    unless $I4 goto __label_8
.annotate 'line', 5209
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5211
    unless_null $P3, __label_12
.annotate 'line', 5212
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5215
    isa $I4, $P3, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I4 goto __label_13
# {
.annotate 'line', 5216
    $P6 = WSubId_65($P1)
    if_null $P6, __label_14
    unless $P6 goto __label_14
# {
.annotate 'line', 5217
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5218
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    .tailcall $P5($P6, $P7, $P1)
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5222
    new $P7, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    $P7.'CallPredefExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P6, $P7
    .return($P6)
# }
.annotate 'line', 5223

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5232
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5233
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5234
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5235
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5236
    __ARG_1.'unget'($P1)
.annotate 'line', 5237
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5239

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5240
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5243
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5244
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5245
    if_null $P2, __label_1
.annotate 'line', 5246
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5248
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5252
# var sym: $P3
    null $P3
.annotate 'line', 5253
# var subid: $P4
    null $P4
.annotate 'line', 5254
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5255
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5256
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5257
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5258
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5259
    isnull $I1, $P6
    if $I1 goto __label_7
    set $S1, $P6
    iseq $I1, $S1, ''
  __label_7:
    unless $I1 goto __label_6
# {
.annotate 'line', 5260
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5261
    $P1.'buildkey'($P7)
.annotate 'line', 5262
    $P3 = self.'findsymbol'($P7)
.annotate 'line', 5263
    if_null $P3, __label_8
# {
.annotate 'line', 5264
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_9
# {
.annotate 'line', 5265
    $P4 = $P3.'makesubid'()
.annotate 'line', 5266
    self.'usesubid'($P4)
# }
  __label_9: # endif
.annotate 'line', 5268
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_10
.annotate 'line', 5269
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_66($P9, $P10, $P3, $P2)
  __label_10: # endif
# }
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 5273
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5275
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 5276
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_11: # endif
.annotate 'line', 5279
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_12
    unless $P9 goto __label_12
# {
.annotate 'line', 5280
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_13
# {
.annotate 'line', 5281
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    $P13 = $P1.'getName'()
    push $P11, $P13
    $P8 = self.'findsymbol'($P11)
.annotate 'line', 5282
    isnull $I1, $P8
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 5283
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_66($P9, $P10, $P8, $P2)
  __label_14: # endif
# }
  __label_13: # endif
# }
  __label_12: # endif
.annotate 'line', 5287
    setattribute self, 'funref', $P1
.annotate 'line', 5288
    setattribute self, 'args', $P2
.annotate 'line', 5289
    .return(self)
# }
.annotate 'line', 5290

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5293
    .return(1)
# }
.annotate 'line', 5294

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5297
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5298
# call: $S1
    null $S1
.annotate 'line', 5300
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5301
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5302
    ne $S1, '', __label_4
# {
.annotate 'line', 5303
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P1.'getName'()
    push $P3, $P5
    $P2 = self.'findsymbol'($P3)
# switch-case
.annotate 'line', 5305
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5308
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5311
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5306
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "'"
    push $P3, $P4
    $P5 = $P1.'getName'()
    push $P3, $P5
    box $P4, "'"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 5309
    $P6 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5312
    WSubId_6("Builtin unexpeted here", self)
  __label_6: # default
.annotate 'line', 5314
    root_new $P7, ['parrot';'ResizablePMCArray']
    box $P8, "'"
    push $P7, $P8
    $P9 = $P1.'getName'()
    push $P7, $P9
    box $P8, "'"
    push $P7, $P8
# predefined join
    join $S1, "", $P7
  __label_5: # switch end
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5319
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5320
    .return($S1)
# }
.annotate 'line', 5321

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5324
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5325
    if_null $P1, __label_1
.annotate 'line', 5326
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5327

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5330
    __ARG_1.'print'('(')
.annotate 'line', 5331
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5332
    if_null $P1, __label_1
.annotate 'line', 5333
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5334
    __ARG_1.'say'(')')
# }
.annotate 'line', 5335

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5338
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5339
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5341
    self.'annotate'(__ARG_1)
.annotate 'line', 5343
    __ARG_1.'print'('    ')
.annotate 'line', 5344
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5345
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5346
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5348
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5351
    __ARG_1.'print'($S1)
.annotate 'line', 5352
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5353

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5225
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5227
    addattribute $P0, 'funref'
.annotate 'line', 5228
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 5367
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5368
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5369
    setattribute self, 'args', __ARG_3
.annotate 'line', 5370
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5371
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5372

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5375
    getattribute $P3, self, 'sym'
    if_null $P3, __label_1
# {
.annotate 'line', 5376
    getattribute $P4, self, 'subid'
    if_null $P4, __label_2
.annotate 'line', 5377
    getattribute $P5, self, 'subid'
    .return($P5)
  __label_2: # endif
.annotate 'line', 5378
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5379
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5380
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5382
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5383
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P2.'emit_left_get'(__ARG_1)
    push $P3, $P5
    box $P4, ".'"
    push $P3, $P4
.annotate 'line', 5384
    $P6 = $P2.'get_member'()
.annotate 'line', 5383
    push $P3, $P6
    box $P4, "'"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    .return($S1)
# }
.annotate 'line', 5385

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5361
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5363
    addattribute $P0, 'sym'
.annotate 'line', 5364
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5395
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5396
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5397
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5398

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5401
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5402
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5403
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5404
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5405
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5408
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5409
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5410
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5411

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5391
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5421
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5422
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5423

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5426
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5427
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5428
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5429
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5430
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5431
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5432
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5434
    .return($S2)
# }
.annotate 'line', 5435

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5416
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5418
    addattribute $P0, 'left'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5444
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5445
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5446

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5447
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5450
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5451
    .return(self)
# }
.annotate 'line', 5452

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5455
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5456
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5457
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5459
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5460
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5461

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5464
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5465

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5468
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5469
    self.'annotate'(__ARG_1)
.annotate 'line', 5470
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5471

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5474
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5475
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5476
    .return($S1)
# }
.annotate 'line', 5477

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5480
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5481
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5482
    self.'annotate'(__ARG_1)
.annotate 'line', 5483
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5484

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5487
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5488

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5491
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5492
# value: $S2
    null $S2
.annotate 'line', 5493
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5495
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5496
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5497
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5499
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5502
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5503
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5505
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5506

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5509
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5510
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5511
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5512
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5514
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5515
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5516
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5518
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5520
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5521
    .return($S2)
# }
.annotate 'line', 5522

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5438
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5440
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5533
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5534
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5535

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5536
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5539
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5540
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5541
    .return(self)
# }
.annotate 'line', 5542

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 5545
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5546
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5547
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5548
    WSubId_39("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5549
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5550
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5551
    self.'annotate'(__ARG_1)
.annotate 'line', 5552
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5553
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5554
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5555

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 5558
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5559
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5560
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5561
    WSubId_39("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5562
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5563
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5564
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5565
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5567
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5569
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5570
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5571
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5575
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5576
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5577
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5580
    self.'annotate'(__ARG_1)
.annotate 'line', 5581
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5582
    .return($S3)
# }
.annotate 'line', 5583

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5528
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5530
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5597
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5598
    setattribute self, 'left', __ARG_4
.annotate 'line', 5599
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5600

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5603
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5604
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5606
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5607

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5610
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5611
    setattribute self, 'left', $P1
.annotate 'line', 5612
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5613
    $P2.'optimizeargs'()
.annotate 'line', 5617
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5618
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5619
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5620
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5621
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5622
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5623
# predefined substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5624
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5627
    .return(self)
# }
.annotate 'line', 5628

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5631
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5632
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5633
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5634
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5635
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5636
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5634
    setattribute self, 'regleft', $P3
.annotate 'line', 5637
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5638

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5641
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5642
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5643
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5644
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5645
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5646
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5647
    __ARG_1.'print'(']')
# }
.annotate 'line', 5648

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5651
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5652
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5653
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5654
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5655
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5656
    eq $I1, 1, __label_4
.annotate 'line', 5657
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5658
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5659
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5660
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5663
    self.'annotate'(__ARG_1)
.annotate 'line', 5664
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5665
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5666
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5668

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5671
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5672
    self.'annotate'(__ARG_1)
.annotate 'line', 5673
    __ARG_1.'print'('    ')
.annotate 'line', 5674
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5675
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5676

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5679
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5680
# rreg: $S1
    null $S1
.annotate 'line', 5681
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5682
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5683
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5686
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5687
    self.'annotate'(__ARG_1)
.annotate 'line', 5688
    __ARG_1.'print'('    ')
.annotate 'line', 5689
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5690
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5691
    .return($S1)
# }
.annotate 'line', 5692

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5588
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5590
    addattribute $P0, 'left'
.annotate 'line', 5591
    addattribute $P0, 'regleft'
.annotate 'line', 5592
    addattribute $P0, 'args'
.annotate 'line', 5593
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 5703
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5704
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5705
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5706
    __ARG_1.'unget'($P1)
.annotate 'line', 5707
    $P3 = WSubId_35(__ARG_1, __ARG_2, WSubId_36, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5709

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5710
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 5713
    getattribute $P1, self, 'values'
    WSubId_37($P1)
.annotate 'line', 5714
    .return(self)
# }
.annotate 'line', 5715

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5718
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5719
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5720
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5726
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5728

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5731
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5732
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5733
    .return($S1)
# }
.annotate 'line', 5734

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5737
    self.'annotate'(__ARG_1)
.annotate 'line', 5738
# itemreg: $S1
    null $S1
.annotate 'line', 5739
# it_p: $S2
    null $S2
.annotate 'line', 5740
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5741
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5742
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
  __label_1: # endif
.annotate 'line', 5744
    getattribute $P2, self, 'values'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
# {
# switch
.annotate 'line', 5745
    $P4 = $P1.'checkresult'()
    set $S4, $P4
    set $S5, 'I'
    if $S4 == $S5 goto __label_6
    set $S5, 'N'
    if $S4 == $S5 goto __label_7
    set $S5, 'S'
    if $S4 == $S5 goto __label_8
    goto __label_5
  __label_6: # case
  __label_7: # case
  __label_8: # case
.annotate 'line', 5747
# aux: $S3
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 5748
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5749
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5750
    set $S1, $S2
# }
  __label_10: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5754
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5755
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5756
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5757
    __ARG_1.'emitnull'($S1)
# }
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 5761
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_12: # endif
  __label_4: # switch end
.annotate 'line', 5763
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5764
    self.'annotate'(__ARG_1)
.annotate 'line', 5765
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_14: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 5768

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5697
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5699
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 5780
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5781
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5782
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5783
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5784
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5785
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5786
# {
.annotate 'line', 5787
# var key: $P4
    $P4 = WSubId_36(__ARG_1, __ARG_2)
.annotate 'line', 5788
    WSubId_53(':', __ARG_1)
.annotate 'line', 5789
# var value: $P5
    $P5 = WSubId_36(__ARG_1, __ARG_2)
.annotate 'line', 5790
# predefined push
    push $P2, $P4
.annotate 'line', 5791
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5793
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5794
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5795
    WSubId_39("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5797
    setattribute self, 'keys', $P2
.annotate 'line', 5798
    setattribute self, 'values', $P3
# }
.annotate 'line', 5799

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5800
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 5803
    getattribute $P1, self, 'keys'
    WSubId_37($P1)
.annotate 'line', 5804
    getattribute $P1, self, 'values'
    WSubId_37($P1)
.annotate 'line', 5805
    .return(self)
# }
.annotate 'line', 5806

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5809
    self.'annotate'(__ARG_1)
.annotate 'line', 5814
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5815
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5817
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5818
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5819
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5820
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5821
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5822
# item: $S1
    null $S1
.annotate 'line', 5823
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5824
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5825
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5826
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5829
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5831
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5832
# itemreg: $S3
    null $S3
.annotate 'line', 5833
# it_p: $S4
    null $S4
.annotate 'line', 5834
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 5835
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 5836
# aux: $S5
    null $S5
# switch
.annotate 'line', 5837
    $P5 = $P4.'checkresult'()
    set $S6, $P5
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    set $S7, 'S'
    if $S6 == $S7 goto __label_13
    goto __label_10
  __label_11: # case
  __label_12: # case
  __label_13: # case
.annotate 'line', 5839
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 5840
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 5841
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 5842
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 5846
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 5847
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 5848
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5849
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 5853
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 5855
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 5856
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5820
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5858

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5861
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5862
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5863
    .return($S1)
# }
.annotate 'line', 5864

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5773
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5775
    addattribute $P0, 'keys'
.annotate 'line', 5776
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5877
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5882
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5883

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5886
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5887
    if_null $P1, __label_1
.annotate 'line', 5888
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5889

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5892
    self.'optimize_initializer'()
.annotate 'line', 5893
    .return(self)
# }
.annotate 'line', 5894

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5897
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5898
    if_null $P1, __label_1
.annotate 'line', 5899
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5900
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5901
    if_null $P1, __label_2
.annotate 'line', 5902
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5903
    __ARG_1.'say'(")")
# }
.annotate 'line', 5904

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 5869
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5871
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5915
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5917
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 5918
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5919
    setattribute self, 'value', __ARG_4
.annotate 'line', 5920
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5922
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 5923
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5925
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5926

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5929
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5930
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5933
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5934
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5935
    $P1 = $P2.'getvalue'()
.annotate 'line', 5936
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 5937
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5938
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5941
    self.'optimize_initializer'()
.annotate 'line', 5942
    .return(self)
# }
.annotate 'line', 5943

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5946
    self.'annotate'(__ARG_1)
.annotate 'line', 5948
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5949
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5952
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5953
    getattribute $P9, self, 'value'
    $P8 = $P9.'isidentifier'()
    if_null $P8, __label_6
    unless $P8 goto __label_6
    set $I2, 1
    goto __label_5
  __label_6:
    set $I2, -1
  __label_5:
  __label_3:
.annotate 'line', 5955
# reginit: $S1
    set $S1, ''
.annotate 'line', 5956
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5957
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5958
    set $I3, $I1
    set $I4, -1
    if $I3 == $I4 goto __label_10
    null $I4
    if $I3 == $I4 goto __label_11
    set $I4, 1
    if $I3 == $I4 goto __label_12
    goto __label_9
  __label_10: # case
  __label_11: # case
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 5963
    ne $I2, 1, __label_13
# {
.annotate 'line', 5964
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5965
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5968
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5969
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5970
    concat $S1, ', ', $S1
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5974
    eq $I2, 1, __label_16
.annotate 'line', 5975
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 5976
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5977
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5980
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5983
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5984
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5985
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 5986
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_67($S5, $P8)
  __label_23: # endif
.annotate 'line', 5990
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5991
    le $I1, 1, __label_25
# {
.annotate 'line', 5992
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5996
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5997
    unless_null $P4, __label_26
# {
.annotate 'line', 5999
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 6000
    if_null $P5, __label_28
# {
.annotate 'line', 6001
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 6004
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.annotate 'line', 6005
    WSubId_67('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 6006
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 6008
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 6012
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 6016
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 6018
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 6019
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6020
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 6021
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 6023

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6026
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6027

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 5909
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5911
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6038
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6039
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6040
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6041
    setattribute self, 'nskey', $P1
.annotate 'line', 6042
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6043
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6044
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6046
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6047

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6050
# reginit: $S1
    null $S1
.annotate 'line', 6051
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6052
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 6053
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6057
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6058
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6061
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 6063
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 6064
    __ARG_1.'print'('    ')
.annotate 'line', 6065
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 6066
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6067
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6068
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 6069
    if_null $S1, __label_8
.annotate 'line', 6070
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6071
    __ARG_1.'say'()
# }
.annotate 'line', 6072

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6032
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6034
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6083
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6084
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6085
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6086
    setattribute self, 'nskey', $P1
.annotate 'line', 6087
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6088
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6089
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6091
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6092

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6095
# reginit: $S1
    null $S1
.annotate 'line', 6096
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6098
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 6099
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6100
    le $I1, 0, __label_4
.annotate 'line', 6101
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 6102
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6103
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 6104
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6105
    __ARG_1.'say'()
.annotate 'line', 6107
    lt $I1, 0, __label_5
# {
.annotate 'line', 6108
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6109
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6110
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 6112

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6077
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6079
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6119
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6122
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6126
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6129
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6124
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6125
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6124
    .return($P3)
  __label_4: # case
.annotate 'line', 6128
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6132
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6133
    __ARG_1.'unget'($P2)
.annotate 'line', 6134
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6136
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6141
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6143

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 6154
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6155
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6156
    $P2 = WSubId_61(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6157

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6160
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6161
    .return(self)
# }
.annotate 'line', 6162

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6163
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6166
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6167
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6168
    eq $S1, 'P', __label_2
.annotate 'line', 6169
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6170
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6172
# r: $S2
    set $S4, __ARG_2
    ne $S4, '', __label_4
    $P3 = self.'tempreg'('I')
    goto __label_3
  __label_4:
    set $P3, __ARG_2
  __label_3:
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6173
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6174
    self.'annotate'(__ARG_1)
.annotate 'line', 6175
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6176
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6177
    __ARG_1.'say'()
# }
.annotate 'line', 6178

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6147
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6149
    addattribute $P0, 'lexpr'
.annotate 'line', 6150
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 6195
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6196
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6197
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6198
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6199
    .return(self)
# }
.annotate 'line', 6200

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6203
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6204
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6206
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6208
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6210
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6211
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6212
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6214

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6217
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6218
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6219
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6221
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6222

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6225
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6226
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6227
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6228
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6229
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6230
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6231
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6233
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6234
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6235
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6236
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6237
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6238
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6240
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6241
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6242
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6243
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6246
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6248
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6249

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6183
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6189
    addattribute $P0, 'condition'
.annotate 'line', 6190
    addattribute $P0, 'etrue'
.annotate 'line', 6191
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant Code_none evaluated at compile time
# Constant Code_paren evaluated at compile time
# Constant Code_bracket evaluated at compile time
# Constant Code_dot evaluated at compile time
# Constant Code_assign evaluated at compile time
# Constant Code_assign_to evaluated at compile time
# Constant Code_add_assign evaluated at compile time
# Constant Code_add evaluated at compile time
# Constant Code_minus evaluated at compile time
# Constant Code_inc evaluated at compile time
# Constant Code_dec evaluated at compile time
# Constant Code_not evaluated at compile time
# Constant Code_equal evaluated at compile time
# Constant Code_not_equal evaluated at compile time
# Constant Code_less evaluated at compile time
# Constant Code_less_equal evaluated at compile time
# Constant Code_greater evaluated at compile time
# Constant Code_greater_equal evaluated at compile time
# Constant Code_sub_assign evaluated at compile time
# Constant Code_mul evaluated at compile time
# Constant Code_div evaluated at compile time
# Constant Code_mod evaluated at compile time
# Constant Code_cmod evaluated at compile time
# Constant Code_mul_assign evaluated at compile time
# Constant Code_div_assign evaluated at compile time
# Constant Code_same evaluated at compile time
# Constant Code_not_same evaluated at compile time
# Constant Code_instanceof evaluated at compile time
# Constant Code_shiftleft evaluated at compile time
# Constant Code_shiftright evaluated at compile time
# Constant Code_mod_assign evaluated at compile time
# Constant Code_delete evaluated at compile time
# Constant Code_exists evaluated at compile time

.sub 'getOpCode_2' :subid('WSubId_70')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6293
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '('
    if $S1 == $S2 goto __label_3
    set $S2, '['
    if $S1 == $S2 goto __label_4
    set $S2, '.'
    if $S1 == $S2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6294
    .return(1)
  __label_4: # case
.annotate 'line', 6295
    .return(2)
  __label_5: # case
.annotate 'line', 6296
    .return(3)
  __label_2: # default
.annotate 'line', 6297
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6299

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_72')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6303
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '-'
    if $S1 == $S2 goto __label_3
    set $S2, '!'
    if $S1 == $S2 goto __label_4
    set $S2, '++'
    if $S1 == $S2 goto __label_5
    set $S2, '--'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6304
    .return(8)
  __label_4: # case
.annotate 'line', 6305
    .return(11)
  __label_5: # case
.annotate 'line', 6306
    .return(9)
  __label_6: # case
.annotate 'line', 6307
    .return(10)
  __label_2: # default
.annotate 'line', 6309
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6310
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6311
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6313

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6317
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '*'
    if $S1 == $S2 goto __label_3
    set $S2, '/'
    if $S1 == $S2 goto __label_4
    set $S2, '%'
    if $S1 == $S2 goto __label_5
    set $S2, '%%'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6318
    .return(19)
  __label_4: # case
.annotate 'line', 6319
    .return(20)
  __label_5: # case
.annotate 'line', 6320
    .return(21)
  __label_6: # case
.annotate 'line', 6321
    .return(22)
  __label_2: # default
.annotate 'line', 6322
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6324

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6328
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6329
    .return(28)
  __label_4: # case
.annotate 'line', 6330
    .return(29)
  __label_2: # default
.annotate 'line', 6331
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6333

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6337
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<'
    if $S1 == $S2 goto __label_3
    set $S2, '>'
    if $S1 == $S2 goto __label_4
    set $S2, '<='
    if $S1 == $S2 goto __label_5
    set $S2, '>='
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6338
    .return(14)
  __label_4: # case
.annotate 'line', 6339
    .return(16)
  __label_5: # case
.annotate 'line', 6340
    .return(15)
  __label_6: # case
.annotate 'line', 6341
    .return(17)
  __label_2: # default
.annotate 'line', 6343
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6344
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6346

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6350
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '=='
    if $S1 == $S2 goto __label_3
    set $S2, '!='
    if $S1 == $S2 goto __label_4
    set $S2, '==='
    if $S1 == $S2 goto __label_5
    set $S2, '!=='
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6351
    .return(12)
  __label_4: # case
.annotate 'line', 6352
    .return(13)
  __label_5: # case
.annotate 'line', 6353
    .return(25)
  __label_6: # case
.annotate 'line', 6354
    .return(26)
  __label_2: # default
.annotate 'line', 6355
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6357

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_91')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6361
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '='
    if $S1 == $S2 goto __label_3
    set $S2, '=:'
    if $S1 == $S2 goto __label_4
    set $S2, '+='
    if $S1 == $S2 goto __label_5
    set $S2, '-='
    if $S1 == $S2 goto __label_6
    set $S2, '*='
    if $S1 == $S2 goto __label_7
    set $S2, '/='
    if $S1 == $S2 goto __label_8
    set $S2, '%='
    if $S1 == $S2 goto __label_9
    goto __label_2
  __label_3: # case
.annotate 'line', 6362
    .return(4)
  __label_4: # case
.annotate 'line', 6363
    .return(5)
  __label_5: # case
.annotate 'line', 6364
    .return(6)
  __label_6: # case
.annotate 'line', 6365
    .return(18)
  __label_7: # case
.annotate 'line', 6366
    .return(23)
  __label_8: # case
.annotate 'line', 6367
    .return(24)
  __label_9: # case
.annotate 'line', 6368
    .return(30)
  __label_2: # default
.annotate 'line', 6369
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6371

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 6375
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6376
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6379
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6383
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6385
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6387
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6389
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6391
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6393
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6395
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6397
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6399
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6380
    $P2 = WSubId_36(__ARG_1, __ARG_2)
.annotate 'line', 6381
    WSubId_53(')', __ARG_1)
.annotate 'line', 6382
    .return($P2)
  __label_4: # case
.annotate 'line', 6384
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6386
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6388
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6390
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6392
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6394
    .tailcall WSubId_68(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6396
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6398
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6400
    new $P17, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P17.'IdentifierExpr'(__ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_2: # default
.annotate 'line', 6402
    WSubId_39('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6404

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6408
# var subexp: $P1
    $P1 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6409
# var t: $P2
    null $P2
.annotate 'line', 6410
# var start: $P3
    null $P3
.annotate 'line', 6411
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6412
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_70($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6413
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6415
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6418
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6421
    set $P3, $P2
.annotate 'line', 6422
    $P2 = __ARG_1.'get'()
.annotate 'line', 6423
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6424
# var right: $P4
    $P4 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6425
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6428
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6431
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6434
    __ARG_1.'unget'($P2)
.annotate 'line', 6435
    .return($P1)
# }
.annotate 'line', 6436

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 6440
# var subexp: $P1
    $P1 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6441
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6443
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6445
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6444
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6446
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6448
    __ARG_1.'unget'($P2)
.annotate 'line', 6449
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6451

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_74 = "WSubId_74"
# Body
# {
.annotate 'line', 6455
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6456
# code: $I1
    $P3 = WSubId_72($P1)
    set $I1, $P3
.annotate 'line', 6457
    eq $I1, 0, __label_1
# {
.annotate 'line', 6458
# var subexpr: $P2
    $P2 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6459
    set $I2, $I1
    set $I3, 8
    if $I2 == $I3 goto __label_5
    set $I3, 11
    if $I2 == $I3 goto __label_6
    set $I3, 9
    if $I2 == $I3 goto __label_7
    set $I3, 10
    if $I2 == $I3 goto __label_8
    set $I3, 31
    if $I2 == $I3 goto __label_9
    set $I3, 32
    if $I2 == $I3 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 6461
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6463
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6465
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6467
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6469
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6471
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6473
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6477
    __ARG_1.'unget'($P1)
.annotate 'line', 6478
    .tailcall WSubId_74(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6480

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6484
# var lexpr: $P1
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6485
# var t: $P2
    null $P2
.annotate 'line', 6486
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6487
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_75($P2)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
.annotate 'line', 6488
# var rexpr: $P3
    $P3 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6489
    set $I2, $I1
    set $I3, 19
    if $I2 == $I3 goto __label_5
    set $I3, 20
    if $I2 == $I3 goto __label_6
    set $I3, 21
    if $I2 == $I3 goto __label_7
    set $I3, 22
    if $I2 == $I3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6491
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6494
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6497
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6500
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6503
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6506
    __ARG_1.'unget'($P2)
.annotate 'line', 6507
    .return($P1)
# }
.annotate 'line', 6508

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 6512
# var lexpr: $P1
    $P1 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6513
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6514
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6515
# var rexpr: $P3
    $P3 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6516
# var expr: $P4
    null $P4
.annotate 'line', 6517
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6518
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6520
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6521
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6523
    __ARG_1.'unget'($P2)
.annotate 'line', 6524
    .return($P1)
# }
.annotate 'line', 6525

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6529
# var lexpr: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6530
# var rexpr: $P2
    null $P2
.annotate 'line', 6531
# var t: $P3
    null $P3
.annotate 'line', 6532
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6533
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_78($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6534
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6536
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6537
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6540
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6541
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6544
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6547
    __ARG_1.'unget'($P3)
.annotate 'line', 6548
    .return($P1)
# }
.annotate 'line', 6549

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6553
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6554
# var rexpr: $P2
    null $P2
.annotate 'line', 6555
# var t: $P3
    null $P3
.annotate 'line', 6556
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6557
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_80($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6558
    set $I2, $I1
    set $I3, 14
    if $I2 == $I3 goto __label_5
    set $I3, 16
    if $I2 == $I3 goto __label_6
    set $I3, 15
    if $I2 == $I3 goto __label_7
    set $I3, 17
    if $I2 == $I3 goto __label_8
    set $I3, 27
    if $I2 == $I3 goto __label_9
    goto __label_4
  __label_5: # case
.annotate 'line', 6560
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6561
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6564
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6565
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6568
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6569
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6572
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6573
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6576
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6579
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6582
    __ARG_1.'unget'($P3)
.annotate 'line', 6583
    .return($P1)
# }
.annotate 'line', 6584

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6588
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6589
# var rexpr: $P2
    null $P2
.annotate 'line', 6590
# var t: $P3
    null $P3
.annotate 'line', 6591
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6592
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6593
    set $I2, $I1
    set $I3, 12
    if $I2 == $I3 goto __label_5
    set $I3, 13
    if $I2 == $I3 goto __label_6
    set $I3, 25
    if $I2 == $I3 goto __label_7
    set $I3, 26
    if $I2 == $I3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6595
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6596
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6599
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6600
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6603
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6604
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6607
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6608
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6611
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6614
    __ARG_1.'unget'($P3)
.annotate 'line', 6615
    .return($P1)
# }
.annotate 'line', 6616

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
# Body
# {
.annotate 'line', 6620
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6621
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6622
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6623
# var rexpr: $P3
    $P3 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6624
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6626
    __ARG_1.'unget'($P2)
.annotate 'line', 6627
    .return($P1)
# }
.annotate 'line', 6628

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_84 = "WSubId_84"
# Body
# {
.annotate 'line', 6632
# var lexpr: $P1
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6633
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6634
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6635
# var rexpr: $P3
    $P3 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6636
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6638
    __ARG_1.'unget'($P2)
.annotate 'line', 6639
    .return($P1)
# }
.annotate 'line', 6640

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
# Body
# {
.annotate 'line', 6644
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6645
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6646
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6647
# var rexpr: $P3
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6648
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6650
    __ARG_1.'unget'($P2)
.annotate 'line', 6651
    .return($P1)
# }
.annotate 'line', 6652

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6656
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6657
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6658
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6659
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6660
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6662
    __ARG_1.'unget'($P2)
.annotate 'line', 6663
    .return($P1)
# }
.annotate 'line', 6664

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6668
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6669
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6670
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6671
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6672
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6674
    __ARG_1.'unget'($P2)
.annotate 'line', 6675
    .return($P1)
# }
.annotate 'line', 6676

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 6680
# var econd: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6681
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6682
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6683
# var etrue: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6684
    WSubId_53(':', __ARG_1)
.annotate 'line', 6685
# var efalse: $P4
    $P4 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6686
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6689
    __ARG_1.'unget'($P2)
.annotate 'line', 6690
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6692

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6696
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6697
# var t: $P2
    null $P2
.annotate 'line', 6698
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6699
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_91($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
.annotate 'line', 6700
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6701
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6702
    set $I2, $I1
    set $I3, 4
    if $I2 == $I3 goto __label_5
    set $I3, 5
    if $I2 == $I3 goto __label_6
    set $I3, 6
    if $I2 == $I3 goto __label_7
    set $I3, 18
    if $I2 == $I3 goto __label_8
    set $I3, 23
    if $I2 == $I3 goto __label_9
    set $I3, 24
    if $I2 == $I3 goto __label_10
    set $I3, 30
    if $I2 == $I3 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 6704
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6707
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6710
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6713
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6716
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6719
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6722
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6725
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6727
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6728
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6730
    __ARG_1.'unget'($P2)
.annotate 'line', 6731
    .return($P1)
# }
.annotate 'line', 6732

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6736
    .tailcall WSubId_89(__ARG_1, __ARG_2)
# }
.annotate 'line', 6737

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6752
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6753
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6754
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6755
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6756
    .return($S1)
# }
.annotate 'line', 6757

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6760
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6761
    unless_null $P1, __label_1
.annotate 'line', 6762
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6763
    .return($P1)
# }
.annotate 'line', 6764

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6748
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6773
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6774
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6775
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6776
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6777
    .return($S1)
# }
.annotate 'line', 6778

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6781
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6782
    unless_null $P1, __label_1
.annotate 'line', 6783
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6784
    .return($P1)
# }
.annotate 'line', 6785

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6767
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6769
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6801
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6802
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6803
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6804
    __ARG_2.'unget'($P1)
.annotate 'line', 6805
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6807

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6810
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6811
    if_null $P1, __label_1
.annotate 'line', 6812
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6813
    .return(self)
# }
.annotate 'line', 6814

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6818
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6819
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6822
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6823
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6824
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6825
    self.'annotate'(__ARG_1)
.annotate 'line', 6826
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6830
    le $I1, 0, __label_6
.annotate 'line', 6831
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6833
    self.'annotate'(__ARG_1)
.annotate 'line', 6834
    self.'emitret'(__ARG_1)
.annotate 'line', 6835
    le $I1, 0, __label_7
.annotate 'line', 6836
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6837
    __ARG_1.'say'(')')
# }
.annotate 'line', 6838

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 6795
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6797
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6845
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6846

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6849
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6850

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 6841
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6857
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6858

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6861
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6862

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 6853
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6875
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6876
    setattribute self, 'name', __ARG_1
.annotate 'line', 6877
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6878

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6879
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6882
    self.'annotate'(__ARG_1)
.annotate 'line', 6883
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6884

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 6869
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6871
    addattribute $P0, 'name'
.annotate 'line', 6872
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6898
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6899
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6900

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6901
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6904
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6905
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6906
    .return($S2)
# }
.annotate 'line', 6907

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 6893
    addattribute $P0, 'owner'
.annotate 'line', 6894
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 6920
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6921
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6922
    WSubId_92($P1)
.annotate 'line', 6923
    setattribute self, 'label', $P1
.annotate 'line', 6924
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 6925

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6926
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6929
    self.'annotate'(__ARG_1)
.annotate 'line', 6930
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6931
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6932
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6933

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 6914
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6916
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 6944
    $P1 = WSubId_36(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6945

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 6948
    WSubId_53('(', __ARG_1)
.annotate 'line', 6949
    $P1 = WSubId_36(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6950
    WSubId_53(')', __ARG_1)
# }
.annotate 'line', 6951

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 6940
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
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 6964
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6965
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6966
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6967
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6968
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6969
    $P4 = WSubId_93(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6971
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6972
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6974

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6977
    self.'optimize_condition'()
.annotate 'line', 6978
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6979
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6980
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6982
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6984
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6986
    .return(self)
# }
.annotate 'line', 6987

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6990
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6991
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6992
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6993
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6994
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6995
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6996
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6997
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6998
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6999
    self.'annotate'(__ARG_1)
.annotate 'line', 7000
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7001
    $P1.'emit'(__ARG_1)
.annotate 'line', 7003
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7004
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7005
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7006
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7008
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7009

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 6958
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6960
    addattribute $P0, 'truebranch'
.annotate 'line', 6961
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 7021
    $P2 = WSubId_93(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7022

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7025
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7026
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7028
    self.'annotate'(__ARG_1)
.annotate 'line', 7029
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7030
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7031
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7032
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7033

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7016
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7018
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7044
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7045
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7046
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7047

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7050
    self.'optimize_condition'()
.annotate 'line', 7051
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7052
    .return(self)
# }
.annotate 'line', 7053

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7056
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7058
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7061
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7064
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7065
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7067
    self.'annotate'(__ARG_1)
.annotate 'line', 7068
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7069
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7070
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7071
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7072
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7074

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7040
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
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 7085
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7086
    self.'parsebody'(__ARG_2)
.annotate 'line', 7087
    WSubId_94('while', __ARG_2)
.annotate 'line', 7088
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7089

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7092
    self.'optimize_condition'()
.annotate 'line', 7093
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7094
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7095
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7096
    setattribute self, 'body', $P1
.annotate 'line', 7097
    .return(self)
# }
.annotate 'line', 7098

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7101
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7102
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7103
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7105
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7108
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7109
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7110
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7112
    self.'annotate'(__ARG_1)
.annotate 'line', 7113
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7115
    $P1.'emit'(__ARG_1)
.annotate 'line', 7116
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7117
    eq $I1, 2, __label_7
.annotate 'line', 7118
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7119
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7121

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7081
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
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7132
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7133
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 7134

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7135
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7138
    self.'annotate'(__ARG_1)
.annotate 'line', 7139
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7140
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7141

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7128
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7152
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7153
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 7154

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7155
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7158
    self.'annotate'(__ARG_1)
.annotate 'line', 7159
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7160
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7161

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7148
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7176
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7177
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7178
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7179
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7180

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 7183
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7184
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7185
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7186
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_36(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7187
    $P1 = __ARG_1.'get'()
.annotate 'line', 7188
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7189
    WSubId_39("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7190
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7191
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_10
    $I2 = $P1.'iskeyword'('case')
  __label_10:
    if $I2 goto __label_9
    $I2 = $P1.'iskeyword'('default')
  __label_9:
    not $I1, $I2
    unless $I1 goto __label_7
# {
.annotate 'line', 7192
    __ARG_1.'unget'($P1)
.annotate 'line', 7193
    $P3 = WSubId_93(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7195
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7196
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7199
    $P1 = __ARG_1.'get'()
.annotate 'line', 7200
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7201
    WSubId_39("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7202
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_15
    $I2 = $P1.'iskeyword'('case')
  __label_15:
    if $I2 goto __label_14
    $I2 = $P1.'iskeyword'('default')
  __label_14:
    not $I1, $I2
    unless $I1 goto __label_12
# {
.annotate 'line', 7203
    __ARG_1.'unget'($P1)
.annotate 'line', 7204
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_93(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7206
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7209
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7210
    WSubId_39("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7211

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7214
    getattribute $P2, self, 'case_value'
    WSubId_37($P2)
.annotate 'line', 7215
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7216
    WSubId_37($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7217
    getattribute $P2, self, 'default_st'
    WSubId_37($P2)
# }
.annotate 'line', 7218

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7168
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7170
    addattribute $P0, 'case_value'
.annotate 'line', 7171
    addattribute $P0, 'case_st'
.annotate 'line', 7172
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 7231
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7232
    $P3 = WSubId_36(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7233
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7234
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7235
    WSubId_39("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7236
    $P1 = __ARG_2.'get'()
.annotate 'line', 7237
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7238
    WSubId_39("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7239
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7240

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7243
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7244
    self.'optimize_cases'()
.annotate 'line', 7245
    .return(self)
# }
.annotate 'line', 7246

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 7250
# type: $S1
    set $S1, ''
.annotate 'line', 7251
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7252
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7253
    ne $S2, 'N', __label_4
.annotate 'line', 7254
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7255
    ne $S1, '', __label_5
.annotate 'line', 7256
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7257
    eq $S1, $S2, __label_7
.annotate 'line', 7258
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7261
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7262
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7266
    ne $S1, '', __label_8
.annotate 'line', 7267
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7269
    __ARG_1.'comment'('switch')
.annotate 'line', 7270
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7271
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7272
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7274
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7275
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7279
    self.'genbreaklabel'()
.annotate 'line', 7280
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7281
    new $P4, ['ResizableStringArray']
.annotate 'line', 7282
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7283
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7284
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7285
# predefined push
    push $P4, $S7
.annotate 'line', 7286
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7287
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7289
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7292
    self.'annotate'(__ARG_1)
.annotate 'line', 7293
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7294
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7295
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7296
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7297
    $P7 = $P6[$I2]
    WSubId_51(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7295
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7300
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7301
    getattribute $P7, self, 'default_st'
    WSubId_51(__ARG_1, $P7)
.annotate 'line', 7303
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7304

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7225
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7227
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7316
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7317
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7318

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7321
    self.'optimize_cases'()
.annotate 'line', 7322
    .return(self)
# }
.annotate 'line', 7323

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 7327
    self.'genbreaklabel'()
.annotate 'line', 7328
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7329
    new $P1, ['ResizableStringArray']
.annotate 'line', 7331
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7332
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7333
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7334
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7335
# predefined push
    push $P1, $S3
.annotate 'line', 7336
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7337
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7339
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7342
    self.'annotate'(__ARG_1)
.annotate 'line', 7343
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7344
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7345
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7346
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7347
    $P4 = $P3[$I2]
    WSubId_51(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7345
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7350
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7351
    getattribute $P4, self, 'default_st'
    WSubId_51(__ARG_1, $P4)
.annotate 'line', 7353
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7354

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7311
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 7361
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7362
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7363
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7364
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7365
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7366
    WSubId_39("'(' in switch", $P1)
# }
.annotate 'line', 7367

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 7380
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7381
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7382
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7383
    __ARG_2.'unget'($P1)
.annotate 'line', 7384
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7386
    $P1 = __ARG_2.'get'()
.annotate 'line', 7387
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7388
    __ARG_2.'unget'($P1)
.annotate 'line', 7389
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7390
    WSubId_53(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7392
    $P1 = __ARG_2.'get'()
.annotate 'line', 7393
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7394
    __ARG_2.'unget'($P1)
.annotate 'line', 7395
    $P3 = WSubId_36(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7396
    WSubId_53(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7398
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7399

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7402
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7403
    if_null $P1, __label_1
.annotate 'line', 7404
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7405
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7406
    self.'optimize_condition'()
.annotate 'line', 7407
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7408
    if_null $P1, __label_4
.annotate 'line', 7409
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7411
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7414
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7415
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7416
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7417
    .return(self)
# }
.annotate 'line', 7418

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7421
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7422
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7423
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7424
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7425
    .return()
# }
  __label_1: # endif
.annotate 'line', 7427
    __ARG_1.'comment'('for loop')
.annotate 'line', 7428
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7429
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7430
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7431
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7432
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7434
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7435
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7436
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7438
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7439
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7440
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7441
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7442
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7444
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7445

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7373
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7375
    addattribute $P0, 'initializer'
.annotate 'line', 7376
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7460
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7461
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7462
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7463
# deftype: $S2
    $P1 = WSubId_95(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7464
    self.'createvar'($S1, $S2)
.annotate 'line', 7465
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7467
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7468
    $P2 = WSubId_36(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7469
    WSubId_53(')', __ARG_2)
.annotate 'line', 7470
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7471

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7474
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7478
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7479
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7480
    $P2 = $P1.'get_value'()
    set $S1, $P2
# predefined length
    length $I2, $S1
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7481
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7483
    setattribute self, 'container', $P1
.annotate 'line', 7484
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7485
    .return(self)
# }
.annotate 'line', 7486

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 7489
    self.'annotate'(__ARG_1)
.annotate 'line', 7490
# regcont: $S1
    null $S1
.annotate 'line', 7491
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7492
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7493
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7494
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7497
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7499
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7500
    unless_null $P1, __label_4
.annotate 'line', 7501
    getattribute $P2, self, 'varname'
    WSubId_60($P2)
  __label_4: # endif
.annotate 'line', 7503
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7504
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7505
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7506
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7507
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7508
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7509
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7510
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7511
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7512
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7513
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7514
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7515

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7452
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7454
    addattribute $P0, 'deftype'
.annotate 'line', 7455
    addattribute $P0, 'varname'
.annotate 'line', 7456
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7522
    WSubId_53('(', __ARG_2)
.annotate 'line', 7523
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7524
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7525
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7526
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7528
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7529
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7530
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7531
    __ARG_2.'unget'($P3)
.annotate 'line', 7532
    __ARG_2.'unget'($P2)
.annotate 'line', 7533
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7535
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7536

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 7548
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7549
    $P2 = WSubId_36(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7550

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7553
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7554
    .return(self)
# }
.annotate 'line', 7555

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7558
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7559
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7560
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7561
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7563
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7566
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7569
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7571

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7542
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7544
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7583
    setattribute self, 'start', __ARG_1
.annotate 'line', 7584
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7585

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7588
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7589
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7590
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7591
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7592
    set $S3, $S1
    set $S4, 'min_severity'
    if $S3 == $S4 goto __label_6
    set $S4, 'max_severity'
    if $S3 == $S4 goto __label_7
    set $S4, 'handle_types'
    if $S3 == $S4 goto __label_8
    set $S4, 'handle_types_except'
    if $S3 == $S4 goto __label_9
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 7595
    eq $I1, 1, __label_10
.annotate 'line', 7596
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7597
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7598
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7599
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7603
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7604
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7605
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7606
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7604
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7609
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7608
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7612
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7615

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7578
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7580
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 7627
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7628
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7629
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7630
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7632
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7634
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7635
    $P1 = __ARG_2.'get'()
.annotate 'line', 7636
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7637
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7638
    $P1 = __ARG_2.'get'()
.annotate 'line', 7639
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7640
    WSubId_39("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7641
    $P1 = __ARG_2.'get'()
.annotate 'line', 7642
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7643
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7644
    setattribute self, 'exname', $P1
.annotate 'line', 7645
    self.'createvar'($S1, 'P')
.annotate 'line', 7646
    $P1 = __ARG_2.'get'()
.annotate 'line', 7647
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7648
    WSubId_39("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7650
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7651

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7654
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7655
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7656
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7657
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7658
    .return(self)
# }
.annotate 'line', 7659

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7662
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7663
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7664
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7665
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7666
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7667
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7669
    self.'annotate'(__ARG_1)
.annotate 'line', 7670
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7672
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7673
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7675
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7676
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7678
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7679
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7680
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7681
    __ARG_1.'comment'('try: end')
.annotate 'line', 7682
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7684
    self.'annotate'(__ARG_1)
.annotate 'line', 7685
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7687
    __ARG_1.'comment'('catch')
.annotate 'line', 7688
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7689
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7690
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7691
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7692
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7694
    __ARG_1.'comment'('catch end')
.annotate 'line', 7695
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7696

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7618
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7620
    addattribute $P0, 'stry'
.annotate 'line', 7621
    addattribute $P0, 'modifiers'
.annotate 'line', 7622
    addattribute $P0, 'exname'
.annotate 'line', 7623
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7709
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7710
    setattribute self, 'name', __ARG_3
.annotate 'line', 7711
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7712
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7713

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7703
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7705
    addattribute $P0, 'name'
.annotate 'line', 7706
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 7728
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7729
    setattribute self, 'name', __ARG_3
.annotate 'line', 7730
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7731

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7720
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7722
    addattribute $P0, 'name'
.annotate 'line', 7723
    addattribute $P0, 'basetype'
.annotate 'line', 7724
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 7742
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7743
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7744
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7745
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7746
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7748
    $P5 = WSubId_36(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7751
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7752

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7755
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7756
    if_null $P1, __label_1
.annotate 'line', 7757
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7758
    .return(self)
# }
.annotate 'line', 7759

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7762
    self.'annotate'(__ARG_1)
.annotate 'line', 7763
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7764
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7765
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7766
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7767
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7769
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7770
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7772
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7773
    ne $S4, $S3, __label_8
.annotate 'line', 7774
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7776
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 7778
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7781
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7782
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 7784
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 7786
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 7789
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7790
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 7792
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7793
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 7794
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7795
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7796
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7797
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 7800
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7804

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7736
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7738
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
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_35 = "WSubId_35"
# Body
# {
.annotate 'line', 7819
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7820
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7821
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7822
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7823
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7824
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7826
    __ARG_6.'unget'($P2)
.annotate 'line', 7827
    $P4 = WSubId_36(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7828
    WSubId_53(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7830
    $P2 = __ARG_6.'get'()
.annotate 'line', 7831
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7832
    $P2 = __ARG_6.'get'()
.annotate 'line', 7833
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7834
    WSubId_39("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7835
    $P2 = __ARG_6.'get'()
.annotate 'line', 7836
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7837
    __ARG_6.'unget'($P2)
.annotate 'line', 7838
    $P4 = WSubId_35(__ARG_6, self, WSubId_36, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7842
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7843

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7846
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7847
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 7848
    getattribute $P1, self, 'initarray'
    WSubId_37($P1)
.annotate 'line', 7849
    .return(self)
# }
.annotate 'line', 7850

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7853
    self.'annotate'(__ARG_1)
.annotate 'line', 7855
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7856
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7857
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7858
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7859
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7860
    if_null $P2, __label_1
# {
.annotate 'line', 7862
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7863
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7867
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7869
    if_null $P3, __label_4
# {
.annotate 'line', 7870
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7871
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7872
    unless_null $P2, __label_6
# {
.annotate 'line', 7873
    le $I1, 0, __label_7
# {
.annotate 'line', 7875
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7878
# i: $I2
    null $I2
.annotate 'line', 7879
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7880
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7881
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7882
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7885

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 7809
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7811
    addattribute $P0, 'size'
.annotate 'line', 7812
    addattribute $P0, 'initarray'
.annotate 'line', 7813
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 7892
# var next: $P1
    null $P1
.annotate 'line', 7893
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7894
# {
.annotate 'line', 7895
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7896
    WSubId_92($P3)
.annotate 'line', 7897
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7898
# var item: $P5
    null $P5
.annotate 'line', 7899
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 7900
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7902
    __ARG_4.'unget'($P4)
.annotate 'line', 7903
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7905
    $P2 = WSubId_96($P2, $P5)
.annotate 'line', 7906
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7907
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 7908
    WSubId_4(';', $P1)
.annotate 'line', 7909
    .return($P2)
# }
.annotate 'line', 7910

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7918
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7919

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 7914
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7926
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7927

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 7922
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7933
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7934

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7938
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7939

.end # newIntArray


.sub 'parseInt' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7943
    .tailcall WSubId_97(WSubId_98, WSubId_99, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7944

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7952
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7953

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 7948
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7960
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7961

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 7956
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7967
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7968

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7972
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7973

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_101 = "WSubId_101"
# Body
# {
.annotate 'line', 7977
    .tailcall WSubId_97(WSubId_100, WSubId_101, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7978

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7986
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7987

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 7982
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7994
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7995

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 7990
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8001
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8002

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8006
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8007

.end # newStringArray


.sub 'parseString' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 8011
    .tailcall WSubId_97(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8012

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 8028
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8029
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8030
    setattribute self, 'name', __ARG_4
.annotate 'line', 8031
    setattribute self, 'value', __ARG_5
.annotate 'line', 8032
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8033

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8036
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8037
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8038
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8039
    $P1 = $P1.'optimize'()
.annotate 'line', 8040
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8041
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8044
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8045
    .return(self)
# }
.annotate 'line', 8046

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8049
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8050

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8053
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8054

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8018
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8020
    addattribute $P0, 'type'
.annotate 'line', 8021
    addattribute $P0, 'name'
.annotate 'line', 8022
    addattribute $P0, 'data'
.annotate 'line', 8023
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 8059
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8060
# type: $S1
    $P5 = WSubId_95($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8061
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8062
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8064
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8065
# {
.annotate 'line', 8066
    $P1 = __ARG_2.'get'()
.annotate 'line', 8067
# var name: $P3
    set $P3, $P1
.annotate 'line', 8068
    WSubId_53('=', __ARG_2)
.annotate 'line', 8069
# var value: $P4
    $P4 = WSubId_36(__ARG_2, __ARG_3)
.annotate 'line', 8071
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8070
    $P2 = WSubId_96($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8072
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8073
    .return($P2)
# }
.annotate 'line', 8074

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8085
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8086
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8087
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8088
    $P4 = WSubId_36(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8089
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8091
    WSubId_4(';', $P1)
# }
.annotate 'line', 8092

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8095
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8096
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8097
    .return(self)
# }
.annotate 'line', 8098

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8101
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8102

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8105
    self.'annotate'(__ARG_1)
.annotate 'line', 8106
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8107
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8108
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8109
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8110
    if_null $P1, __label_3
.annotate 'line', 8111
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8112
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8113
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8114
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'P'
    if $S4 == $S5 goto __label_9
    set $S5, 'S'
    if $S4 == $S5 goto __label_10
    set $S5, 'I'
    if $S4 == $S5 goto __label_11
    set $S5, 'N'
    if $S4 == $S5 goto __label_12
    set $S5, 'v'
    if $S4 == $S5 goto __label_13
    goto __label_8
  __label_9: # case
.annotate 'line', 8116
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8117
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8119
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8124
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8125
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8128
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8130
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8134
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8135

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8080
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8082
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 8142
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8143
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 8144

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8147
    self.'annotate'(__ARG_1)
.annotate 'line', 8148
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8149
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8150
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8151

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8138
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 8160
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8161
    $P2 = WSubId_36(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8162
    WSubId_53(']', __ARG_2)
.annotate 'line', 8163
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 8164

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8167
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8168
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8169

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8172
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8173
    self.'annotate'(__ARG_1)
.annotate 'line', 8174
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8175
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8176
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8177

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8154
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8156
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_92 = "WSubId_92"
# Body
# {
.annotate 'line', 8182
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8183
    WSubId_92($P1)
.annotate 'line', 8184
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8185
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8186
    $P2 = __ARG_2.'get'()
.annotate 'line', 8187
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8188
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8190
    __ARG_2.'unget'($P2)
.annotate 'line', 8191
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8195
    __ARG_2.'unget'($P2)
.annotate 'line', 8196
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8198

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 8202
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8203
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8204
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8205
    .tailcall WSubId_45(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8206

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8219
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8220
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8221
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8222
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8223
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8224
    __ARG_2.'unget'($P1)
.annotate 'line', 8225
# var c: $P2
    $P2 = WSubId_93(__ARG_2, self)
.annotate 'line', 8226
    unless_null $P2, __label_3
.annotate 'line', 8227
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8228
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8230
    setattribute self, 'end', $P1
# }
.annotate 'line', 8231

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8234
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8235
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8236
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8237
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8238
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8239
    .return($S2)
# }
.annotate 'line', 8240

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8243
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8244
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8245
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8246
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8247
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8248
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8249
    $P1[$S1] = $S3
.annotate 'line', 8250
    .return($S3)
# }
.annotate 'line', 8251

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8252
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8255
    __ARG_1.'comment'('{')
.annotate 'line', 8256
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8257
    $P1.'emit'(__ARG_1)
.annotate 'line', 8258
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8260
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8261

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8212
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8214
    addattribute $P0, 'end'
.annotate 'line', 8215
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8276
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8278
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8279
    new $P1, ['ResizableStringArray']
.annotate 'line', 8280
    new $P2, ['ResizableStringArray']
.annotate 'line', 8281
    setattribute self, 'tempreg', $P1
.annotate 'line', 8282
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8283

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8286
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8287
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8288
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8289
    assign $P1, $I1
# predefined string
.annotate 'line', 8290
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8291

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8294
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8295
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8296
# reg: $S1
    null $S1
.annotate 'line', 8297
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8298
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8300
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8301
# predefined push
    push $P2, $S1
.annotate 'line', 8302
    .return($S1)
# }
.annotate 'line', 8303

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8306
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8307
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8308
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8309
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8310
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8311
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8309
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8313
    assign $P2, 0
# }
.annotate 'line', 8314

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8270
    addattribute $P0, 'type'
.annotate 'line', 8271
    addattribute $P0, 'nreg'
.annotate 'line', 8272
    addattribute $P0, 'tempreg'
.annotate 'line', 8273
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8325
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8326

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8329
# var named: $P1
    null $P1
.annotate 'line', 8330
# var slurpy: $P2
    null $P2
.annotate 'line', 8331
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8332
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8333
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8334
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8336
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8339
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8342
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8346
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8353
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8370
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8351
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8354
# setname: $S2
    null $S2
# switch
.annotate 'line', 8355
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8357
    concat $S2, "'", __ARG_3
    concat $S2, $S2, "'"
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8360
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8361
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8362
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8363
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8366
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8368
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8371
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8372
# }
.annotate 'line', 8374

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8321
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 8384
    setattribute self, 'func', __ARG_1
.annotate 'line', 8385
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8386
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_95($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8387
    eq $S1, '', __label_2
.annotate 'line', 8388
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8390
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8391
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8392
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8394
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8395
    $P1 = __ARG_2.'get'()
.annotate 'line', 8396
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8397
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8399
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8400

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_104 = "WSubId_104"
# Body
# {
.annotate 'line', 8403
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8404
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8405
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8406
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_104($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8407
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8408
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8409
    if_null $P3, __label_3
.annotate 'line', 8410
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8411
    __ARG_1.'say'('')
# }
.annotate 'line', 8412

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8379
    addattribute $P0, 'func'
.annotate 'line', 8380
    addattribute $P0, 'name'
.annotate 'line', 8381
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8417
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8418

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8429
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8430
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8431

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 8434
# var ns: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 8435
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 8436
# key: $S1
    null $S1
.annotate 'line', 8437
# predefined elements
    elements $I1, $P2
    le $I1, 0, __label_1
.annotate 'line', 8438
    $P3 = WSubId_57($P2)
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8439
# reg: $S2
    $P3 = __ARG_2.'tempreg'('P')
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8440
    getattribute $P3, self, 'name'
    __ARG_1.'emitget_hll_global'($S2, $P3, $S1)
.annotate 'line', 8441
    .return($S2)
# }
.annotate 'line', 8442

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8424
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8426
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8453
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8454

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8457
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8458
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8459
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8460
    le $I1, 0, __label_3
# {
.annotate 'line', 8461
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8462
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8463
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8464
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8465
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8466
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8462
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8468
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8471

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8449
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8494
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8495
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8496
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8497
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8498
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8499
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8500

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8502
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8506
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8507
    unless_null $P1, __label_1
.annotate 'line', 8508
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8509
    .return($P1)
# }
.annotate 'line', 8510

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8513
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8514
    unless_null $P1, __label_1
.annotate 'line', 8515
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8516
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8517

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8521
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8522
    .return($I1)
# }
.annotate 'line', 8523

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8526
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8527
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8528
    __ARG_1.'unget'($P1)
.annotate 'line', 8529
    $P3 = WSubId_35(__ARG_1, self, WSubId_105, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8531

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8535
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8536
    unless_null $P1, __label_1
.annotate 'line', 8537
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8539
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8540

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8543
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8544
    unless_null $P1, __label_1
# {
.annotate 'line', 8546
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8549
    if_null $P1, __label_4
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8550
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8551
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8552
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8554

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8557
# var found: $P1
    null $P1
.annotate 'line', 8558
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8559
    $P1 = $P2.'findsymbol'(__ARG_1)
.annotate 'line', 8560
    if_null $P1, __label_3
.annotate 'line', 8561
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8563
    getattribute $P3, self, 'owner'
    .tailcall $P3.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8564

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8568
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 8569
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8570
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8571
    .return(self)
# }
.annotate 'line', 8572

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8576
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8577
    unless_null $P1, __label_1
.annotate 'line', 8578
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8579
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8580

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8583
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8584
    unless_null $P1, __label_1
.annotate 'line', 8585
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8586
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8587

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8592
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8593
# lexname: $S1
    null $S1
.annotate 'line', 8594
    if_null $P1, __label_1
.annotate 'line', 8595
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8597
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8598
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8599
# predefined string
    set $S3, $I1
    concat $S1, '__WLEX_', $S3
.annotate 'line', 8600
    self.'setlex'($S1, $S2)
.annotate 'line', 8601
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8603
    .return($S1)
# }
.annotate 'line', 8604

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8608
# var store: $P1
    null $P1
# switch
.annotate 'line', 8609
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_3
    set $S3, 'N'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    set $S3, 'P'
    if $S2 == $S3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 8611
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8613
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8615
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8617
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8619
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8621
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8622
    .return($S1)
# }
.annotate 'line', 8623

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8626
# var store: $P1
    null $P1
# switch
.annotate 'line', 8627
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_3
    set $S3, 'N'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    set $S3, 'P'
    if $S2 == $S3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 8629
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8631
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8633
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8635
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8637
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8639
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8640
    .return($S1)
# }
.annotate 'line', 8641

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8644
    root_new $P2, ['parrot';'ResizablePMCArray']
    getattribute $P4, self, 'regstI'
    push $P2, $P4
    getattribute $P5, self, 'regstN'
    push $P2, $P5
    getattribute $P6, self, 'regstS'
    push $P2, $P6
    getattribute $P7, self, 'regstP'
    push $P2, $P7
    if_null $P2, __label_2
    iter $P8, $P2
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
.annotate 'line', 8645
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8646

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8649
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8650
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8651

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8654
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8655

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8658
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8659

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 8663
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 8664
    __ARG_1.'say'()
.annotate 'line', 8665
    __ARG_1.'print'(".sub ")
.annotate 'line', 8666
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 8667
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8669
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8670
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 8671
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 8672
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 8673
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8674
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8675
    if_null $P2, __label_6
.annotate 'line', 8676
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8680
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 8681
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8682
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8683
    if_null $P3, __label_8
.annotate 'line', 8684
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8686
    ne $S1, 'main', __label_10
.annotate 'line', 8687
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8689
    __ARG_1.'say'()
.annotate 'line', 8692
    getattribute $P8, self, 'params'
    WSubId_51(__ARG_1, $P8)
.annotate 'line', 8694
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8695
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8696
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8697
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 8699
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 8700
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 8702
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 8703
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 8704
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 8705
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 8709
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 8711
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 8714
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8715
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 8716
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 8718
    __ARG_1.'comment'('Body')
.annotate 'line', 8719
    $P6.'emit'(__ARG_1)
.annotate 'line', 8720
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 8722
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8725
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 8726
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 8727

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8474
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8476
    addattribute $P0, 'name'
.annotate 'line', 8477
    addattribute $P0, 'subid'
.annotate 'line', 8478
    addattribute $P0, 'modifiers'
.annotate 'line', 8479
    addattribute $P0, 'params'
.annotate 'line', 8480
    addattribute $P0, 'body'
.annotate 'line', 8481
    addattribute $P0, 'regstI'
.annotate 'line', 8482
    addattribute $P0, 'regstN'
.annotate 'line', 8483
    addattribute $P0, 'regstS'
.annotate 'line', 8484
    addattribute $P0, 'regstP'
.annotate 'line', 8485
    addattribute $P0, 'nlabel'
.annotate 'line', 8486
    addattribute $P0, 'localfun'
.annotate 'line', 8487
    addattribute $P0, 'lexicals'
.annotate 'line', 8488
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8489
    addattribute $P0, 'usedsubids'
.annotate 'line', 8490
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8741
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8742
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8743
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8744
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8745

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8747
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8751
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 8752

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8756
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 8757

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8758
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 8762
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8763
    setattribute self, 'name', $P1
.annotate 'line', 8764
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8765
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8766
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8767
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8769
    WSubId_4('(', $P2)
.annotate 'line', 8770
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8772
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8773
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8774
# predefined join
    join $S1, '.', $P3
    WSubId_106(self, '__FUNCTION__', $S1)
.annotate 'line', 8776
    $P2 = __ARG_1.'get'()
.annotate 'line', 8777
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 8778
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 8779
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8780
    .return(self)
# }
.annotate 'line', 8781

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8734
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8736
    addattribute $P0, 'paramnum'
.annotate 'line', 8737
    addattribute $P0, 'lexnum'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8792
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8793
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8794
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8795
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8796
    setattribute self, 'name', $P1
.annotate 'line', 8797
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8798
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8799
    WSubId_4('{', $P2)
.annotate 'line', 8800
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8801
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8802

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8803
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8804
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 8807
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 8808
    .return(1)
  __label_1: # endif
.annotate 'line', 8809
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 8810
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 8811
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8812
    .return(0)
# }
.annotate 'line', 8813

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8816
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8817

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8821
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8822

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8826
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8827

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8830
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 8831
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 8832
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 8834
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 8835
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 8836
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 8837
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 8838
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 8839
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 8840
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 8841
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 8842
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8843
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 8844
    eq $S3, 'P', __label_8
.annotate 'line', 8845
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 8846
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 8847
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 8848
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 8849
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 8852
    .return(__ARG_2)
# }
.annotate 'line', 8853

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8856
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8857
    unless_null $P1, __label_1
.annotate 'line', 8858
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8859
    unless_null $P1, __label_2
# {
.annotate 'line', 8862
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 8863
    unless_null $P1, __label_3
# {
.annotate 'line', 8865
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 8866
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8867
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 8868
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 8869
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8870
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 8871
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8875
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8877
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 8878
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 8879
    .return($P1)
# }
.annotate 'line', 8880

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 8788
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8891
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8892

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8893
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 8887
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 8907
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8908
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8909
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 8910
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8911
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8912
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_95($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8913
    set $P1, $P2
.annotate 'line', 8914
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8915
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8917
    setattribute self, 'name', $P1
.annotate 'line', 8918
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8919
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8920
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8921
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 8923
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8924

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8927
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8928
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8929
    if_null $P1, __label_1
# {
.annotate 'line', 8930
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8931
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8933

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 8902
    addattribute $P0, 'name'
.annotate 'line', 8903
    addattribute $P0, 'modifiers'
.annotate 'line', 8904
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8938
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8939

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_107 = "WSubId_107"
# Body
# {
.annotate 'line', 8946
    $P2 = WSubId_35(__ARG_1, __ARG_2, WSubId_107, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 8947

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8950
    __ARG_1.'print'('(')
.annotate 'line', 8951
# sep: $S1
    set $S1, ''
.annotate 'line', 8952
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8953
    __ARG_1.'print'($S1)
.annotate 'line', 8954
    $P1.'emit'(__ARG_1)
.annotate 'line', 8955
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8957
    __ARG_1.'print'(')')
# }
.annotate 'line', 8958

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 8943
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8967
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8968
    setattribute self, 'params', __ARG_3
.annotate 'line', 8969
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 8970

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8973
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8974
    .return(self)
# }
.annotate 'line', 8975

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8978
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8979
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 8980
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 8981
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8982
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8983
    __ARG_1.'print'('    ')
.annotate 'line', 8984
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8985
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8986
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8987
    __ARG_1.'say'()
# }
.annotate 'line', 8988

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 8961
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8963
    addattribute $P0, 'params'
.annotate 'line', 8964
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant CLASSSPECIFIER_invalid evaluated at compile time
# Constant CLASSSPECIFIER_str evaluated at compile time
# Constant CLASSSPECIFIER_parrotkey evaluated at compile time
# Constant CLASSSPECIFIER_id evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9005
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9006

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9007
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9011
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9012

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9001
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9020
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9021
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9022

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9023
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9027
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9028
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9029

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9015
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9017
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9038
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9039
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9040
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9041
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9042
    WSubId_39('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9043
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 9044
    $P2 = __ARG_1.'get'()
.annotate 'line', 9045
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9046
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9048
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9052
    WSubId_40('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9054
# {
.annotate 'line', 9055
    $P2 = __ARG_1.'get'()
.annotate 'line', 9056
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9057
    WSubId_39('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9058
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9059
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9060
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9062
    setattribute self, 'key', $P1
# }
.annotate 'line', 9063

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9064
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 9067
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9068

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9072
    getattribute $P2, self, 'key'
    $P1 = WSubId_57($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9073

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9032
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9034
    addattribute $P0, 'key'
.annotate 'line', 9035
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9081
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9082
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 9083
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9084
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9085
    $P2 = __ARG_1.'get'()
.annotate 'line', 9086
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9088
    __ARG_1.'unget'($P2)
.annotate 'line', 9089
    setattribute self, 'key', $P1
# }
.annotate 'line', 9090

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9091
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9095
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9096
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9097

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9101
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 9102
    unless_null $P1, __label_1
# {
.annotate 'line', 9103
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9104
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_67($S2)
  __label_3: # endif
.annotate 'line', 9105
    getattribute $P3, self, 'key'
    $P2 = WSubId_57($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9107
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9108

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9076
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9078
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9113
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9114
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9115
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9116
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9117
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9118
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9119
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9120
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9121

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9133
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9134
    setattribute self, 'name', __ARG_2
.annotate 'line', 9135
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9136
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 9137
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9138

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9141
    getattribute $P1, self, 'classns'
    .tailcall WSubId_57($P1)
# }
.annotate 'line', 9142

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9127
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9129
    addattribute $P0, 'name'
.annotate 'line', 9130
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_61 = "WSubId_61"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 9155
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9156
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9157
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9158
    setattribute self, 'functions', $P1
.annotate 'line', 9159
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9160
    setattribute self, 'members', $P2
.annotate 'line', 9161
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9162
    setattribute self, 'constants', $P3
.annotate 'line', 9164
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 9165
    $P8 = $P4.'isop'(':')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 9166
    $P10 = WSubId_35(__ARG_4, self, WSubId_61)
    setattribute self, 'bases', $P10
.annotate 'line', 9167
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9169
    WSubId_4('{', $P4)
# for loop
.annotate 'line', 9170
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9171
    $P9 = $P4.'checkkeyword'()
    set $S1, $P9
    set $S2, 'function'
    if $S1 == $S2 goto __label_7
    set $S2, 'var'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 9173
# var f: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 9174
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9177
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 9178
    $P10 = $P6.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 9179
    WSubId_39("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 9180
# predefined push
    push $P2, $P6
.annotate 'line', 9181
    $P4 = __ARG_4.'get'()
.annotate 'line', 9182
    $P11 = $P4.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 9183
    WSubId_39("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9186
# var cst: $P7
    $P7 = WSubId_43($P4, __ARG_4, self)
.annotate 'line', 9187
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9190
    WSubId_40("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9170
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9193

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9196
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9197

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9200
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9201

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9204
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 9205

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9208
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 9209

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9212
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9213

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9216
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9217

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 9220
    getattribute $P1, self, 'constants'
    WSubId_37($P1)
.annotate 'line', 9221
    getattribute $P1, self, 'functions'
    WSubId_37($P1)
.annotate 'line', 9222
    .return(self)
# }
.annotate 'line', 9223

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 9226
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 9227
    $P4 = WSubId_108($P1)
    __ARG_1.'say'($P4)
.annotate 'line', 9228
    getattribute $P4, self, 'functions'
    WSubId_51(__ARG_1, $P4)
.annotate 'line', 9230
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9232
    $P4 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P4)
.annotate 'line', 9233
# n: $I1
    set $I1, 1
.annotate 'line', 9234
    getattribute $P4, self, 'bases'
    if_null $P4, __label_2
    iter $P5, $P4
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $P2, $P5
# {
.annotate 'line', 9235
    $P2.'annotate'(__ARG_1)
.annotate 'line', 9236
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9237
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9238
    getattribute $P4, self, 'parent'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 9239
    __ARG_1.'say'()
.annotate 'line', 9240
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9242
    getattribute $P4, self, 'members'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
# {
.annotate 'line', 9243
    __ARG_1.'annotate'($P3)
.annotate 'line', 9244
    __ARG_1.'say'('    ', "addattribute $P0, '", $P3, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9247
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9248

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9145
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9147
    addattribute $P0, 'parent'
.annotate 'line', 9148
    addattribute $P0, 'bases'
.annotate 'line', 9149
    addattribute $P0, 'constants'
.annotate 'line', 9150
    addattribute $P0, 'functions'
.annotate 'line', 9151
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9255
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9256

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9259
    .return(self)
# }
.annotate 'line', 9260

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9251
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9268
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9269
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9270
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9271
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9272
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9273
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9271
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.annotate 'line', 9275
    WSubId_4(';', $P2)
.annotate 'line', 9276
    new $P4, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9279
    __ARG_2.'unget'($P2)
.annotate 'line', 9280
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9282

.end # parseClass


.sub 'open_include' :subid('WSubId_109')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9290
# var interp: $P1
# predefined getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9295
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9296
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9297
# var file: $P4
    null $P4
.annotate 'line', 9298
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9299
# filepath: $S2
    concat $S2, $S1, __ARG_1
.annotate 'line', 9300
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9301
# predefined open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9302
    $P4.'encoding'("utf8")
    goto __label_2 # break
.annotate 'line', 9303
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9300
# catch
  __label_3:
    .get_results($P7)
    finalize $P7
    pop_eh
# catch end
  __label_4:
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9308
    unless_null $P4, __label_5
.annotate 'line', 9309
    WSubId_1('File not found', __ARG_2)
  __label_5: # endif
.annotate 'line', 9310
    .return($P4)
# }
.annotate 'line', 9311

.end # open_include


.sub 'include_parrot' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9315
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9316
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9317
    WSubId_39('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9318
    WSubId_53(';', __ARG_2)
.annotate 'line', 9320
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9321
# var file: $P2
    $P2 = WSubId_109($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9326
# line: $S2
    $P4 = $P2.'readline'()
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
  __label_5: # for condition
    $P5 = $P2.'eof'()
    isfalse $I4, $P5
    unless $I4 goto __label_4
# {
.annotate 'line', 9327
# predefined substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9328
# pos: $I1
    set $I1, 12
.annotate 'line', 9329
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9330
# predefined substr
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 9331
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9332
# pos2: $I2
    set $I2, $I1
  __label_12: # while
.annotate 'line', 9333
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 9334
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9335
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 9336
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 9338
# name: $S4
    sub $I4, $I2, $I1
# predefined substr
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 9339
# predefined substr
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 9340
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 9341
    set $I1, $I2
  __label_22: # while
.annotate 'line', 9342
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 9343
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 9344
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 9345
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 9347
# value: $S5
    sub $I4, $I2, $I1
# predefined substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 9349
# ivalue: $I3
    null $I3
.annotate 'line', 9350
# predefined substr
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
# predefined substr
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 9351
# predefined substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 9353
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 9354
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 9356
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 9355
    $P4 = WSubId_21(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9326
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 9360
    $P2.'close'()
# }
.annotate 'line', 9361

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 9367
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9368
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 9369
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9370
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9371
    WSubId_39('literal string', $P1)
  __label_2: # endif
.annotate 'line', 9372
    WSubId_53(';', __ARG_2)
.annotate 'line', 9374
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 9375
# var file: $P2
    $P2 = WSubId_109($S1, __ARG_1)
.annotate 'line', 9377
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 9378
    __ARG_3.'parse'($P3)
.annotate 'line', 9380
    $P2.'close'()
# }
.annotate 'line', 9381

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 9387
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9388
    $P7 = $P1.'iskeyword'('namespace')
    if_null $P7, __label_1
    unless $P7 goto __label_1
# {
.annotate 'line', 9389
# var nskey: $P2
    $P2 = WSubId_54(__ARG_2)
.annotate 'line', 9390
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9391
    ge $I1, 1, __label_2
.annotate 'line', 9392
    WSubId_1('Unsupported', $P1)
  __label_2: # endif
.annotate 'line', 9393
    WSubId_53(';', __ARG_2)
.annotate 'line', 9394
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9395
    unless_null $P3, __label_3
.annotate 'line', 9396
    WSubId_1('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9397
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9398
    .return()
# }
  __label_1: # endif
.annotate 'line', 9400
    $P7 = $P1.'iskeyword'('extern')
    isfalse $I3, $P7
    unless $I3 goto __label_4
# {
.annotate 'line', 9401
    __ARG_2.'unget'($P1)
.annotate 'line', 9402
# var key: $P4
    $P4 = WSubId_54(__ARG_2)
.annotate 'line', 9403
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9404
    ge $I2, 1, __label_5
.annotate 'line', 9405
    WSubId_1('Unsupported at namespace level', $P1)
  __label_5: # endif
.annotate 'line', 9406
    WSubId_53(';', __ARG_2)
.annotate 'line', 9407
    __ARG_3.'use'($P4)
.annotate 'line', 9408
    .return()
# }
  __label_4: # endif
.annotate 'line', 9410
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9412
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9418
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9414
# reqlib: $S1
    set $P7, $P1
    null $S1
    if_null $P7, __label_10
    set $S1, $P7
  __label_10:
.annotate 'line', 9415
    __ARG_3.'addlib'($S1)
.annotate 'line', 9416
    WSubId_53(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9419
    __ARG_2.'unget'($P1)
.annotate 'line', 9420
# var module: $P5
    $P5 = WSubId_54(__ARG_2)
.annotate 'line', 9421
    $P1 = __ARG_2.'get'()
.annotate 'line', 9422
    $P8 = $P1.'isop'(';')
    isfalse $I4, $P8
    unless $I4 goto __label_11
# {
.annotate 'line', 9423
    __ARG_2.'unget'($P1)
.annotate 'line', 9424
# var names: $P6
    null $P7
    $P6 = WSubId_35(__ARG_2, $P7, WSubId_56, ';')
.annotate 'line', 9425
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9427
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9428
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9431
    WSubId_39('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9433

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9443
    setattribute self, 'module', __ARG_1
.annotate 'line', 9444
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9445

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9450
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9458
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9459
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9460
    __ARG_1.'say'("']")
.annotate 'line', 9461
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9462
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9463
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9469

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9439
    addattribute $P0, 'module'
.annotate 'line', 9440
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9488
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9489
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9490
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9491
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9492
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9493
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9496
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9497
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9498
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9499
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9500
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9502
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9503

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9506
# var ns: $P1
    null $P1
.annotate 'line', 9507
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9508
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9509
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9510
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9511
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9512

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9515
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9516

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9519
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9520
    .return()
  __label_1: # endif
.annotate 'line', 9521
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9522
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9523
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9524
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9525
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9526

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9529
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9530
    if_null $P1, __label_1
# {
.annotate 'line', 9531
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9532
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9535
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9536
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9537
    if_null $P2, __label_5
# {
.annotate 'line', 9538
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9539
    if_null $P1, __label_6
.annotate 'line', 9540
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9543

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9546
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9547
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9548
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9549
    .return($P2)
# }
.annotate 'line', 9550

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9553
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9554
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9555
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9556
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9557

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9561
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9562
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9563
    unless_null $P2, __label_1
.annotate 'line', 9564
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9566
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9567

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9571
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9572
# var cl: $P2
    null $P2
.annotate 'line', 9573
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9574
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9575
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9576
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9577
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9578
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9579
    .return($P5)
# }
.annotate 'line', 9580

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9585
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9586
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9588
    .return($P3)
  __label_4: # case
.annotate 'line', 9591
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9596
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9597
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9598
    if_null $P1, __label_5
# {
.annotate 'line', 9599
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9600
    if_null $P2, __label_6
.annotate 'line', 9601
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9604
    .return($P3)
# }
.annotate 'line', 9605

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9608
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9609
    if_null $P1, __label_1
.annotate 'line', 9610
    .return($P1)
  __label_1: # endif
.annotate 'line', 9611
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9612
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9613
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9614
    .return($P2)
# }
.annotate 'line', 9615

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9620
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9621
# name: $S1
    null $S1
.annotate 'line', 9622
# var sym: $P1
    null $P1
.annotate 'line', 9623
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9624
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9626
    .return($P3)
  __label_4: # case
.annotate 'line', 9628
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9630
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9631
    .return($P1)
  __label_5: # endif
.annotate 'line', 9632
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_7
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9633
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9634
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9640
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9641
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9642
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9643
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9644
    .return($P1)
  __label_9: # endif
.annotate 'line', 9645
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9646
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9647
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9648
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9650
    .return($P3)
# }
.annotate 'line', 9651

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9654
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9655
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9657
    .return($P2)
  __label_2: # default
.annotate 'line', 9659
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9660
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9661
    if_null $P1, __label_4
# {
.annotate 'line', 9662
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9663
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9665
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9668
    .return($P2)
# }
.annotate 'line', 9669

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9672
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9673
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9674
    .return($P1)
# }
.annotate 'line', 9675

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9678
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9679
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9680
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9681
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9682
    .return($P2)
# }
.annotate 'line', 9683

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9686
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9687

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9690
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9691
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9692

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9695
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9696
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9697
    $P1 = __ARG_2.'get'()
.annotate 'line', 9699
# var modifier: $P2
    null $P2
.annotate 'line', 9700
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9701
    new $P5, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9702
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.annotate 'line', 9705
    WSubId_4('{', $P1)
.annotate 'line', 9706
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9707
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9708

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 9711
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9712
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9713
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9714
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9715
    $P4 = __ARG_1.'get'()
  __label_3: # for condition
    $I2 = $P4.'iseof'()
    if $I2 goto __label_4
    $I2 = $P4.'isop'('}')
  __label_4:
    not $I1, $I2
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9717
    $P9 = $P4.'checkkeyword'()
    set $S1, $P9
    set $S2, 'namespace'
    if $S1 == $S2 goto __label_7
    set $S2, 'const'
    if $S1 == $S2 goto __label_8
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'class'
    if $S1 == $S2 goto __label_10
    set $S2, 'extern'
    if $S1 == $S2 goto __label_11
    set $S2, 'using'
    if $S1 == $S2 goto __label_12
    set $S2, '$include_const'
    if $S1 == $S2 goto __label_13
    set $S2, '$include'
    if $S1 == $S2 goto __label_14
    set $S2, '$load'
    if $S1 == $S2 goto __label_15
    set $S2, '$loadlib'
    if $S1 == $S2 goto __label_16
    goto __label_6
  __label_7: # case
.annotate 'line', 9719
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9722
# var cst: $P5
    $P5 = WSubId_43($P4, __ARG_1, self)
.annotate 'line', 9723
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9726
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9727
# predefined push
    push $P2, $P6
.annotate 'line', 9728
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9731
    WSubId_110($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9734
# var t1: $P7
    $P7 = __ARG_1.'get'()
.annotate 'line', 9735
    $P10 = $P7.'iskeyword'('function')
    isfalse $I3, $P10
    unless $I3 goto __label_17
.annotate 'line', 9736
    WSubId_1('Unsupported extern', $P7)
  __label_17: # endif
.annotate 'line', 9737
    $P7 = __ARG_1.'get'()
.annotate 'line', 9738
    WSubId_92($P7)
.annotate 'line', 9739
    WSubId_53(';', __ARG_1)
.annotate 'line', 9740
# var fex: $P8
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P8.'FunctionExtern'($P7, self)
.annotate 'line', 9741
# predefined push
    push $P2, $P8
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9744
    WSubId_111($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9747
    WSubId_112($P4, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9750
    WSubId_113($P4, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 9753
    $P4 = __ARG_1.'get'()
.annotate 'line', 9754
    $P11 = $P4.'isstring'()
    isfalse $I4, $P11
    unless $I4 goto __label_18
.annotate 'line', 9755
    WSubId_39('string literal', $P4)
  __label_18: # endif
.annotate 'line', 9756
    WSubId_53(';', __ARG_1)
.annotate 'line', 9757
    new $P14, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P14.'StringLiteral'(self, $P4)
    set $P13, $P14
    $P12 = $P13.'getPirString'()
    self.'addload'($P12)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 9760
    $P4 = __ARG_1.'get'()
.annotate 'line', 9761
    $P15 = $P4.'isstring'()
    isfalse $I5, $P15
    unless $I5 goto __label_19
.annotate 'line', 9762
    WSubId_39('string literal', $P4)
  __label_19: # endif
.annotate 'line', 9763
    WSubId_53(';', __ARG_1)
.annotate 'line', 9764
    new $P18, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addlib'($P16)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9767
    WSubId_40("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9715
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9770
    $P9 = $P4.'iseof'()
    if_null $P9, __label_20
    unless $P9 goto __label_20
.annotate 'line', 9771
    self.'unclosed_ns'()
    goto __label_21
  __label_20: # else
.annotate 'line', 9773
    self.'close_ns'($P4)
  __label_21: # endif
# }
.annotate 'line', 9774

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 9777
    getattribute $P1, self, 'items'
    WSubId_37($P1)
# }
.annotate 'line', 9778

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 9781
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9782
# s: $S1
    $P4 = WSubId_108($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9784
# activate: $I1
    set $I1, 1
.annotate 'line', 9786
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9787
    if_null $P2, __label_2
# {
.annotate 'line', 9788
    __ARG_1.'say'($S1)
.annotate 'line', 9789
    null $I1
.annotate 'line', 9790
    WSubId_51(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9793
    getattribute $P4, self, 'items'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
# {
.annotate 'line', 9794
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9795
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9796
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9798
    unless $I1 goto __label_8
# {
.annotate 'line', 9799
    __ARG_1.'say'($S1)
.annotate 'line', 9800
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9802
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9804

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9476
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9478
    addattribute $P0, 'nspath'
.annotate 'line', 9479
    addattribute $P0, 'externals'
.annotate 'line', 9480
    addattribute $P0, 'namespaces'
.annotate 'line', 9481
    addattribute $P0, 'classes'
.annotate 'line', 9482
    addattribute $P0, 'functions'
.annotate 'line', 9483
    addattribute $P0, 'items'
.annotate 'line', 9484
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 9822
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9823
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9824
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9826
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9827
    setattribute self, 'start', __ARG_2
.annotate 'line', 9828
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9829
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9830
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9831
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9832
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9833
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9835

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9838
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9839

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9842
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9843

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9846
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9847

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9850
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9851

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9854
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9855

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9858
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9859
    unless_null $P1, __label_1
.annotate 'line', 9860
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9861
    .return($P1)
# }
.annotate 'line', 9862

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9867
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9868
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9869
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9870
    .return($P1)
# }
.annotate 'line', 9871

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9874
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9875
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9876
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9877
    .return($P1)
# }
.annotate 'line', 9878

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9881
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9882
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9883
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9884
    .return($P1)
# }
.annotate 'line', 9885

.end # findns


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9888
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 9889

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9896
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9897
    if_null $P1, __label_1
.annotate 'line', 9898
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9899
    self.'optimize_base'()
.annotate 'line', 9900
    .return(self)
# }
.annotate 'line', 9901

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9904
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9905
    if_null $P1, __label_1
.annotate 'line', 9906
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9908
    self.'emit_base'(__ARG_1)
.annotate 'line', 9910
    if_null $P1, __label_2
.annotate 'line', 9911
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9912

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 9811
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9813
    addattribute $P0, 'parent'
.annotate 'line', 9814
    addattribute $P0, 'start'
.annotate 'line', 9815
    addattribute $P0, 'name'
.annotate 'line', 9816
    addattribute $P0, 'modifier'
.annotate 'line', 9817
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9929
    new $P1, ['ResizableStringArray']
.annotate 'line', 9930
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9931
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9932
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9933
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9934

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9937
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9938
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9939

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9942
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9943
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9944

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9948
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9949
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9950

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9954
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9955
    unless_null $P1, __label_1
.annotate 'line', 9956
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9957
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9958

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9961
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9962
    unless_null $P1, __label_1
.annotate 'line', 9963
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9964
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9965

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9968
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9969

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9973
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9974

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9977
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9978

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9981
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9982

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9989
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9990

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9993
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9994

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9997
    self.'optimize_base'()
.annotate 'line', 9998
    .return(self)
# }
.annotate 'line', 9999

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10002
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10005
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10006
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10009
    new $P2, ['ResizableStringArray']
    set $P2, 9
    set $S4, 'acos'
    $P2[0] = $S4
    set $S4, 'asin'
    $P2[1] = $S4
    set $S4, 'atan'
    $P2[2] = $S4
    set $S4, 'cos'
    $P2[3] = $S4
    set $S4, 'exp'
    $P2[4] = $S4
    set $S4, 'ln'
    $P2[5] = $S4
    set $S4, 'sin'
    $P2[6] = $S4
    set $S4, 'tan'
    $P2[7] = $S4
    set $S4, 'pow'
    $P2[8] = $S4
.annotate 'line', 10012
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10013
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10014
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10015
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10018
# somelib: $I1
    null $I1
.annotate 'line', 10019
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10020
    if_null $P3, __label_5
# {
.annotate 'line', 10021
    set $I1, 1
.annotate 'line', 10022
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10023
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10026
# someload: $I2
    null $I2
.annotate 'line', 10027
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10028
    if_null $P4, __label_8
# {
.annotate 'line', 10029
    set $I2, 1
.annotate 'line', 10030
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10031
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10032
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10033
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10035
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10036
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10038
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10039

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10042
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10043
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10044
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10045
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 10046
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 10047
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10049
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10050
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10052

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 9919
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9921
    addattribute $P0, 'unit'
.annotate 'line', 9922
    addattribute $P0, 'predefs_used'
.annotate 'line', 9923
    addattribute $P0, 'libs'
.annotate 'line', 9924
    addattribute $P0, 'loads'
.annotate 'line', 9925
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10064
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10065
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10066

.end # Builtin


.sub 'getname' :method
# Body
# {
# predefined string
.annotate 'line', 10067
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10070
    getattribute $P1, self, 'variants'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10071

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10060
    addattribute $P0, 'name'
.annotate 'line', 10061
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_115 = "WSubId_115"
# Body
# {
.annotate 'line', 10083
    not $I1, __ARG_1
    box $P6, $I1
    setattribute self, 'warnings', $P6
.annotate 'line', 10084
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10088
    WSubId_114($P1, 'false', 0)
.annotate 'line', 10089
    WSubId_114($P1, 'true', 1)
.annotate 'line', 10094
# predefined string
# predefined int
.annotate 'line', 10095
    set $I2, "2"
    add $I1, $I2, 1
    set $S3, $I1
.annotate 'line', 10094
    WSubId_106($P1, '__STAGE__', $S3)
.annotate 'line', 10098
    WSubId_114($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10101
# var builtins: $P2
    new $P7, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P7.'TokenEof'('__builtins__')
    set $P6, $P7
    null $P8
    $P2 = $P1.'childnamespace'($P6, "Winxed_Builtins", $P8)
.annotate 'line', 10103
# var predefs: $P3
    $P3 = WSubId_115()
.annotate 'line', 10104
# var predefentries: $P4
    root_new $P4, ['parrot';'Hash']
.annotate 'line', 10105
    if_null $P3, __label_2
    iter $P9, $P3
    set $P9, 0
  __label_1: # for iteration
    unless $P9 goto __label_2
    shift $P5, $P9
# {
.annotate 'line', 10106
# name: $S1
    getattribute $P6, $P5, 'name'
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 10107
    $P6 = $P4[$S1]
    if_null $P6, __label_4
.annotate 'line', 10108
    $P7 = $P4[$S1]
    $P7.'addvariant'($P5)
    goto __label_5
  __label_4: # else
.annotate 'line', 10110
    new $P10, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P10.'Builtin'($S1, $P5)
    set $P8, $P10
    $P4[$S1] = $P8
  __label_5: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10112
    if_null $P4, __label_7
    iter $P11, $P4
    set $P11, 0
  __label_6: # for iteration
    unless $P11 goto __label_7
    shift $S2, $P11
.annotate 'line', 10113
    getattribute $P6, $P2, 'functions'
    $P7 = $P4[$S2]
# predefined push
    push $P6, $P7
    goto __label_6
  __label_7: # endfor
.annotate 'line', 10114
    $P1.'usenamespace'($P2)
.annotate 'line', 10116
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10117

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 10120
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10121

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10124
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10125
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10126

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10129
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10130

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10133
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10134
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10135
    __ARG_1.'say'('')
.annotate 'line', 10137
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10139
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10140

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10143
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10144
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10146
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10148
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10149

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10078
    addattribute $P0, 'rootns'
.annotate 'line', 10079
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 10158
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10159
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10160
# var handleout: $P1
    null $P1
.annotate 'line', 10161
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10162
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10163
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10166
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10167
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10168
    if_null __ARG_4, __label_4
    unless __ARG_4 goto __label_4
.annotate 'line', 10169
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 10170
    __ARG_1.'emit'($P2)
.annotate 'line', 10171
    $P2.'close'()
.annotate 'line', 10172
    if_null __ARG_3, __label_5
.annotate 'line', 10173
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 10175
    $P1.'close'()
.annotate 'line', 10176
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10177
# var object: $P3
    null $P3
# switch
.annotate 'line', 10178
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 10180
    new $P3, [ 'String' ]
.annotate 'line', 10181
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 10185
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 10186
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 10187
# predefined string
.annotate 'line', 10189
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 10191
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 10193

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10196
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10197
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10198
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10199
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10200
    $P2.'close'()
.annotate 'line', 10201
    $P1.'close'()
.annotate 'line', 10202
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10203

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10210
    unless_null __ARG_2, __label_1
.annotate 'line', 10211
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10212
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10213
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10214
    $P1.'puts'(__ARG_1)
.annotate 'line', 10215
    $P1.'close'()
.annotate 'line', 10216
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10217
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10218
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_5)
.annotate 'line', 10219
    $P3.'parse'($P2)
.annotate 'line', 10220
    $P1.'close'()
.annotate 'line', 10221
    $P3.'optimize'()
.annotate 'line', 10222
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10223
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10225
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_3: # endif
# }
.annotate 'line', 10226

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10234
    unless_null __ARG_2, __label_1
.annotate 'line', 10235
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10236
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10237
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10238
    $P1.'encoding'('utf8')
.annotate 'line', 10239
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10240
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_5)
.annotate 'line', 10241
    $P3.'parse'($P2)
.annotate 'line', 10242
    $P1.'close'()
.annotate 'line', 10243
    $P3.'optimize'()
.annotate 'line', 10244
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10245
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10247
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_3: # endif
# }
.annotate 'line', 10248

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10257
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10258
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10259

.end # initializer

# End generated code
