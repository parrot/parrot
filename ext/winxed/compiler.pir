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
.annotate 'line', 22
    index $I2, '0123456789', __ARG_1
.annotate 'line', 23
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
.annotate 'line', 34
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
.annotate 'line', 42
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

.sub 'Warn' :subid('WSubId_69')
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
    $P2.'WinxedCompilerError'('internal', __ARG_1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 101
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P4 = __ARG_2.'filename'()
    $P5 = __ARG_2.'linenum'()
    $P3.'WinxedCompilerError'('internal', __ARG_1, $P4, $P5)
    set $P1, $P3
  __label_3:
.annotate 'line', 102
# predefined Error
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2
# }
.annotate 'line', 103

.end # InternalError


.sub 'TokenError' :subid('WSubId_7')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 107
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
.annotate 'line', 109
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
# predefined Error
.annotate 'line', 107
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1
# }
.annotate 'line', 110

.end # TokenError


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 114
# line: $I1
    $P1 = __ARG_2.'linenum'()
    set $I1, $P1
.annotate 'line', 115
# file: $S1
    $P1 = __ARG_2.'filename'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 116
# desc: $S2
# predefined string
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S2, ' near ', $S3
.annotate 'line', 117
# predefined string
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
.annotate 'line', 119
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
.annotate 'line', 120
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
# predefined Error
.annotate 'line', 117
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1
# }
.annotate 'line', 121

.end # SyntaxError


.sub 'NoLeftSide' :subid('WSubId_59')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 125
    WSubId_1('Not a left-side expression', __ARG_1)
# }
.annotate 'line', 126

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_40')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 130
    concat $S1, "Expected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 131

.end # Expected


.sub 'Unexpected' :subid('WSubId_41')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 135
    concat $S1, "Unexpected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 136

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 140
    WSubId_1("Expected identifier", __ARG_1)
# }
.annotate 'line', 141

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 145
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 146

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 150
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 151
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 152

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 156
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 157
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 158

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_94')
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 162
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 163
    WSubId_3(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 164

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_54')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 168
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 169
    WSubId_4(__ARG_1, $P1)
# }
.annotate 'line', 170

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_96')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_5 = "WSubId_5"
# Body
# {
.annotate 'line', 174
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 175
    WSubId_5(__ARG_1, $P1)
# }
.annotate 'line', 176

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_61')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 180
# predefined string
    set $S1, __ARG_1
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    WSubId_1($S2, __ARG_1)
# }
.annotate 'line', 181

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 193
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 194
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 195

.end # Token


.sub 'iseof' :method
# Body
# {
.annotate 'line', 197
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 198
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 199
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 200
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 201
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 202
    .return(0)
# }

.end # isstring


.sub 'issinglequoted' :method
# Body
# {
.annotate 'line', 203
    .return(0)
# }

.end # issinglequoted


.sub 'getintvalue' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 207
    WSubId_6('Not a literal int', self)
# }
.annotate 'line', 208

.end # getintvalue


.sub 'rawstring' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 211
    WSubId_6('Not a literal string', self)
# }
.annotate 'line', 212

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 215
    WSubId_3(self)
# }
.annotate 'line', 216

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 217
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 218
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 219
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 220
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 221
    .return('(unknown)')
# }

.end # viewable


.sub 'filename' :method
# Body
# {
.annotate 'line', 222
    getattribute $P1, self, 'file'
    .return($P1)
# }

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 223
    getattribute $P1, self, 'line'
    .return($P1)
# }

.end # linenum


.sub 'show' :method
# Body
# {
.annotate 'line', 226
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 227
# predefined string
    getattribute $P1, self, 'file'
.annotate 'line', 225
    set $S2, $P1
# predefined string
.annotate 'line', 227
    getattribute $P2, self, 'line'
.annotate 'line', 225
    set $S3, $P2
.annotate 'line', 227
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 228

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
.annotate 'line', 189
    addattribute $P0, 'file'
.annotate 'line', 190
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 235
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 236

.end # TokenEof


.sub 'iseof' :method
# Body
# {
.annotate 'line', 237
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 238
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 231
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
.annotate 'line', 246
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 247
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 248

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 249
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 252
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 253

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 241
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 243
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 260
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 261

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 262
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 256
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
.annotate 'line', 269
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 270

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 273
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 274

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 277
    getattribute $P1, self, 'str'
.annotate 'line', 276
    set $S1, $P1
.annotate 'line', 277
    .return($S1)
# }
.annotate 'line', 278

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 265
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
.annotate 'line', 285
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 286

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 287
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 290
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 291

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 294
    getattribute $P1, self, 'str'
.annotate 'line', 293
    set $S1, $P1
.annotate 'line', 294
    .return($S1)
# }
.annotate 'line', 295

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 298
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 299

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 281
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 304
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 307
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 308

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 302
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
.annotate 'line', 315
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 316

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 319
    getattribute $P1, self, 'str'
.annotate 'line', 318
    set $S1, $P1
.annotate 'line', 319
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 320

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 323
    getattribute $P1, self, 'str'
.annotate 'line', 322
    set $S1, $P1
.annotate 'line', 323
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 324

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 327
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 328

.end # getasquoted


.sub 'getPirString' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 331
# str: $S1
    getattribute $P2, self, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 332
# var s: $P1
    box $P1, $S1
.annotate 'line', 333
# strunesc: $S2
    null $S2
.annotate 'line', 334
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_2
    push_eh $P2
# try: begin
# {
.annotate 'line', 335
    $P4 = $P1.'unescape'('utf8')
    set $S2, $P4
# }
# try: end
    pop_eh
    goto __label_3
.annotate 'line', 334
# catch
  __label_2:
    .get_results($P3)
    finalize $P3
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
    box $P2, $S2
    if_null $P2, __label_5
    iter $P5, $P2
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $I2, $P5
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
.annotate 'line', 311
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
.annotate 'line', 361
    set $S1, $P1
.annotate 'line', 362
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
.annotate 'line', 365
    set $S1, $P1
.annotate 'line', 366
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
.annotate 'line', 431
    set $I1, $P1
.annotate 'line', 432
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
.annotate 'line', 444
    set $N1, $P1
.annotate 'line', 445
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
# Constant REGraw1 evaluated at compile time
# Constant REGnone evaluated at compile time

.sub 'typetoregcheck' :subid('WSubId_97')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 755
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
.annotate 'line', 756
    .return('I')
  __label_4: # case
.annotate 'line', 757
    .return('N')
  __label_5: # case
.annotate 'line', 758
    .return('S')
  __label_6: # case
.annotate 'line', 759
    .return('P')
  __label_2: # default
.annotate 'line', 760
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 762

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_106')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
# switch
.annotate 'line', 766
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
.annotate 'line', 767
    .return('int')
  __label_4: # case
.annotate 'line', 768
    .return('num')
  __label_5: # case
.annotate 'line', 769
    .return('string')
  __label_6: # case
.annotate 'line', 770
    .return('pmc')
  __label_2: # default
.annotate 'line', 771
    WSubId_6('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 773

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 793
    setattribute self, 'handle', __ARG_1
.annotate 'line', 794
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 795
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 796
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 797
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 798

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 801
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 802

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 805
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 806

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 809
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 810
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 812
    getattribute $P5, self, 'file'
.annotate 'line', 810
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 815
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 817
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 818
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 820
    getattribute $P5, self, 'line'
.annotate 'line', 818
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 823
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 825

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 828
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 829
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 830

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 833
    self.'updateannot'()
.annotate 'line', 834
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 835

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 838
    self.'updateannot'()
.annotate 'line', 839
    self.'vprint'(__ARG_1)
.annotate 'line', 840
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 841

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 844
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 846
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 847
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 848
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 849
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 850
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 851
    assign $P1, $S1
.annotate 'line', 852
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 853
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 855
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 856
    assign $P2, $I1
.annotate 'line', 857
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 860

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 863
    self.'updateannot'()
.annotate 'line', 864
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 865

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 868
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 869
    $P1.'print'('  ')
.annotate 'line', 870
    $P1.'print'(__ARG_1)
.annotate 'line', 871
    $P1.'print'(':')
.annotate 'line', 872
    if_null __ARG_2, __label_1
.annotate 'line', 873
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 874
    $P1.'print'("\n")
# }
.annotate 'line', 875

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 878
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 879
    $P1.'print'('    goto ')
.annotate 'line', 880
    $P1.'print'(__ARG_1)
.annotate 'line', 881
    if_null __ARG_2, __label_1
.annotate 'line', 882
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 883
    $P1.'print'("\n")
# }
.annotate 'line', 884

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 888
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 889

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 892
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 893

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 896
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 897

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 900
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 901

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 904
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 905

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 908
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 909

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 912
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 913

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 917
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 918

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 921
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 922

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 925
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 926

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 929
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 930

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 933
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 934

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 937
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 938

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 941
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 942

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 945
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 946

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 949
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 950

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 953
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 954

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 957
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 958

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 961
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 962

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 965
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 966

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 969
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 970

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 973
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 974

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 977
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 978

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 981
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 982

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 985
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 986

.end # emitsay


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 989
    concat $S1, "    get_hll_global ", __ARG_1
    self.'print'($S1)
.annotate 'line', 990
    if_null __ARG_3, __label_1
.annotate 'line', 991
    concat $S1, ", ", __ARG_3
    self.'print'($S1)
  __label_1: # endif
.annotate 'line', 992
    concat $S1, ", '", __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 993

.end # emitget_hll_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 996
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 997

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1000
    self.'say'("store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 1001

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 784
    addattribute $P0, 'handle'
.annotate 'line', 785
    addattribute $P0, 'file'
.annotate 'line', 786
    addattribute $P0, 'line'
.annotate 'line', 787
    addattribute $P0, 'pendingf'
.annotate 'line', 788
    addattribute $P0, 'pendingl'
.annotate 'line', 789
    addattribute $P0, 'noan'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 1010
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 1011

.end # integerValue


.sub 'floatValue' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 1015
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 1016
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 1017

.end # floatValue


.sub 'floatresult' :subid('WSubId_64')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1025
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1026
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1027
    .return($I1)
# }
.annotate 'line', 1028

.end # floatresult


.sub 'floatAsString' :subid('WSubId_60')
        .param num __ARG_1
# Body
# {
.annotate 'line', 1036
# aux: $S1
    set $N1, __ARG_1
    set $S1, $N1
.annotate 'line', 1037
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 1038
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1039
    .return($S1)
# }
.annotate 'line', 1040

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
.annotate 'line', 1058
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1059
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1060
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1061
    $P3 = WSubId_21(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1062

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_108')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1066
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1067
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1068
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1069
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1070
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1069
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1071

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
.annotate 'line', 1100
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1101
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1102
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1103
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat __ARG_2, '    ', $S1
.annotate 'line', 1104
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1105
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1106

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
.annotate 'line', 1109
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1111
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1112
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1113
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1116
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1117
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1120
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1121
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 1122
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1123
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1124

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 1086
    addattribute $P0, 'body'
.annotate 'line', 1087
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
.annotate 'line', 1145
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1146
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1147
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1149
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1150
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1151
# n: $I1
    null $I1
.annotate 'line', 1152
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1153
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1154
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1156
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1159
    set $I1, -2
.annotate 'line', 1160
    if_null __ARG_5, __label_8
.annotate 'line', 1161
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1164
    set $I1, 1
.annotate 'line', 1165
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1166
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1167
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1169
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1170
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1171
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1173
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1174
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1175
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1179
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1180

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1183
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1184
    .return($S1)
# }
.annotate 'line', 1185

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1188
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1189

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1190
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1193
# type: $S1
    null $S1
# switch
.annotate 'line', 1194
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
.annotate 'line', 1195
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1196
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1197
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1198
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1200
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1202
    .return($S1)
# }
.annotate 'line', 1203

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1206
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1207
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1208
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1209
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1210
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1211
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1212

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1129
    addattribute $P0, 'name'
.annotate 'line', 1130
    addattribute $P0, 'body'
.annotate 'line', 1131
    addattribute $P0, 'typeresult'
.annotate 'line', 1132
    addattribute $P0, 'type0'
.annotate 'line', 1133
    addattribute $P0, 'type1'
.annotate 'line', 1134
    addattribute $P0, 'type2'
.annotate 'line', 1135
    addattribute $P0, 'type3'
.annotate 'line', 1136
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
.annotate 'line', 1224
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1225

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1215
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
.annotate 'line', 1238
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1239
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1240

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1228
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1230
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1248
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1249

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1252
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1253
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.annotate 'line', 1254
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1255
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1256
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1258
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1259
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1260
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1263
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1264
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1266
    ne $S3, 'null', __label_9
.annotate 'line', 1267
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1269
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1271

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1245
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
.annotate 'line', 1276
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1277
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1278
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1279
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1280
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1279
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1281
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1284
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1285

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1289
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1290
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1291
    if_null __ARG_4, __label_2
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1292
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1293
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1294

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1298
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1299
    if_null __ARG_4, __label_2
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1300
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1301

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1307
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1308
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1309
    WSubId_1("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1310
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1311

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1315
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1316
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1317
# predefined length
.annotate 'line', 1314
    length $I1, $S1
.annotate 'line', 1317
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1318

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1322
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1323
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1324
# predefined bytelength
.annotate 'line', 1321
    bytelength $I1, $S1
.annotate 'line', 1324
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1325

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1329
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1330
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1331
# predefined ord
.annotate 'line', 1328
    ord $I1, $S1
.annotate 'line', 1331
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1332

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1336
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1337
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1338
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1339
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1340
# predefined ord
.annotate 'line', 1335
    ord $I2, $S1, $I1
.annotate 'line', 1340
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1341

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1345
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1347
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1348
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1350
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1351
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1352

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1356
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1357
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1358
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1359
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1361
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1362
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1363

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1367
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1368
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1369
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1370
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1371
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1372
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1374
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1375
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1376

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1380
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1381
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1382
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1383
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1384
# predefined indexof
.annotate 'line', 1379
    index $I1, $S1, $S2
.annotate 'line', 1384
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1385

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1389
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1390
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1391
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1392
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1393
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1394
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1395
# predefined indexof
.annotate 'line', 1388
    index $I2, $S1, $S2, $I1
.annotate 'line', 1395
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1396

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_35')
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
.annotate 'line', 1400
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1401
    new $P4, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1402
    new $P6, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P6.'Predef_typecast'('I')
    set $P5, $P6
    $P4.'PredefFunction'('int', $P5, 'I', '!')
    set $P3, $P4
.annotate 'line', 1400
    push $P1, $P3
.annotate 'line', 1405
    new $P8, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1406
    new $P10, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P10.'Predef_typecast'('N')
    set $P9, $P10
    $P8.'PredefFunction'('float', $P9, 'N', '!')
    set $P7, $P8
.annotate 'line', 1400
    push $P1, $P7
.annotate 'line', 1409
    new $P12, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1410
    new $P14, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P14.'Predef_typecast'('S')
    set $P13, $P14
    $P12.'PredefFunction'('string', $P13, 'S', '!')
    set $P11, $P12
.annotate 'line', 1400
    push $P1, $P11
.annotate 'line', 1413
    new $P16, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P16.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P15, $P16
.annotate 'line', 1400
    push $P1, $P15
.annotate 'line', 1417
    new $P18, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P18.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P17, $P18
.annotate 'line', 1400
    push $P1, $P17
.annotate 'line', 1421
    new $P20, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P20.'PredefFunction'('time', 'time %0', 'I')
    set $P19, $P20
.annotate 'line', 1400
    push $P1, $P19
.annotate 'line', 1425
    new $P22, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P22.'PredefFunction'('floattime', 'time %0', 'N')
    set $P21, $P22
.annotate 'line', 1400
    push $P1, $P21
.annotate 'line', 1429
    new $P24, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P24.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P23, $P24
.annotate 'line', 1400
    push $P1, $P23
.annotate 'line', 1433
    new $P26, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P26.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P25, $P26
.annotate 'line', 1400
    push $P1, $P25
.annotate 'line', 1437
    new $P28, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P28.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P27, $P28
.annotate 'line', 1400
    push $P1, $P27
.annotate 'line', 1441
    new $P30, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P30.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P29, $P30
.annotate 'line', 1400
    push $P1, $P29
.annotate 'line', 1445
    new $P32, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P32.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P31, $P32
.annotate 'line', 1400
    push $P1, $P31
.annotate 'line', 1452
    new $P34, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P34.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P33, $P34
.annotate 'line', 1400
    push $P1, $P33
.annotate 'line', 1459
    new $P36, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P36.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P35, $P36
.annotate 'line', 1400
    push $P1, $P35
.annotate 'line', 1466
    new $P38, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P38.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P37, $P38
.annotate 'line', 1400
    push $P1, $P37
.annotate 'line', 1474
    new $P40, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P40.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P39, $P40
.annotate 'line', 1400
    push $P1, $P39
.annotate 'line', 1483
    new $P42, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P42.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P41, $P42
.annotate 'line', 1400
    push $P1, $P41
.annotate 'line', 1493
    new $P44, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P44.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P43, $P44
.annotate 'line', 1400
    push $P1, $P43
.annotate 'line', 1497
    new $P46, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1498
    $P46.'PredefFunctionEval'('length', WSubId_22, 'length %0, %1', 'I', 'S')
    set $P45, $P46
.annotate 'line', 1400
    push $P1, $P45
.annotate 'line', 1502
    new $P48, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1503
    $P48.'PredefFunctionEval'('bytelength', WSubId_23, 'bytelength %0, %1', 'I', 'S')
    set $P47, $P48
.annotate 'line', 1400
    push $P1, $P47
.annotate 'line', 1507
    new $P50, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1508
    $P50.'PredefFunctionEval'('chr', WSubId_24, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P49, $P50
.annotate 'line', 1400
    push $P1, $P49
.annotate 'line', 1516
    new $P52, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1517
    $P52.'PredefFunctionEval'('ord', WSubId_25, 'ord %0, %1', 'I', 'S')
    set $P51, $P52
.annotate 'line', 1400
    push $P1, $P51
.annotate 'line', 1521
    new $P54, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1522
    $P54.'PredefFunctionEval'('ord', WSubId_26, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P53, $P54
.annotate 'line', 1400
    push $P1, $P53
.annotate 'line', 1526
    new $P56, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1527
    $P56.'PredefFunctionEval'('substr', WSubId_27, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P55, $P56
.annotate 'line', 1400
    push $P1, $P55
.annotate 'line', 1531
    new $P58, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1532
    $P58.'PredefFunctionEval'('substr', WSubId_28, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P57, $P58
.annotate 'line', 1400
    push $P1, $P57
.annotate 'line', 1536
    new $P60, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P60.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P59, $P60
.annotate 'line', 1400
    push $P1, $P59
.annotate 'line', 1540
    new $P62, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1541
    $P62.'PredefFunctionEval'('indexof', WSubId_29, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P61, $P62
.annotate 'line', 1400
    push $P1, $P61
.annotate 'line', 1545
    new $P64, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1546
    $P64.'PredefFunctionEval'('indexof', WSubId_30, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P63, $P64
.annotate 'line', 1400
    push $P1, $P63
.annotate 'line', 1550
    new $P66, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P66.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P65, $P66
.annotate 'line', 1400
    push $P1, $P65
.annotate 'line', 1554
    new $P68, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P68.'PredefFunction'('escape', 'escape %0, %1', 'S', 'S')
    set $P67, $P68
.annotate 'line', 1400
    push $P1, $P67
.annotate 'line', 1558
    new $P70, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P70.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P69, $P70
.annotate 'line', 1400
    push $P1, $P69
.annotate 'line', 1562
    new $P72, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P72.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P71, $P72
.annotate 'line', 1400
    push $P1, $P71
.annotate 'line', 1566
    new $P74, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P74.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P73, $P74
.annotate 'line', 1400
    push $P1, $P73
.annotate 'line', 1570
    new $P76, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P76.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P75, $P76
.annotate 'line', 1400
    push $P1, $P75
.annotate 'line', 1574
    new $P78, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P78.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P77, $P78
.annotate 'line', 1400
    push $P1, $P77
.annotate 'line', 1581
    new $P80, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P80.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P79, $P80
.annotate 'line', 1400
    push $P1, $P79
.annotate 'line', 1588
    new $P82, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P82.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P81, $P82
.annotate 'line', 1400
    push $P1, $P81
.annotate 'line', 1592
    new $P84, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P84.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P83, $P84
.annotate 'line', 1400
    push $P1, $P83
.annotate 'line', 1596
    new $P86, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P86.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P85, $P86
.annotate 'line', 1400
    push $P1, $P85
.annotate 'line', 1600
    new $P88, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P88.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P87, $P88
.annotate 'line', 1400
    push $P1, $P87
.annotate 'line', 1604
    new $P90, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P90.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P89, $P90
.annotate 'line', 1400
    push $P1, $P89
.annotate 'line', 1608
    new $P92, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P92.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P91, $P92
.annotate 'line', 1400
    push $P1, $P91
.annotate 'line', 1612
    new $P94, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P94.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P93, $P94
.annotate 'line', 1400
    push $P1, $P93
.annotate 'line', 1616
    new $P96, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P96.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P95, $P96
.annotate 'line', 1400
    push $P1, $P95
.annotate 'line', 1620
    new $P98, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P98.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P97, $P98
.annotate 'line', 1400
    push $P1, $P97
.annotate 'line', 1624
    new $P100, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P100.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P99, $P100
.annotate 'line', 1400
    push $P1, $P99
.annotate 'line', 1628
    new $P102, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P102.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P101, $P102
.annotate 'line', 1400
    push $P1, $P101
.annotate 'line', 1632
    new $P104, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P104.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P103, $P104
.annotate 'line', 1400
    push $P1, $P103
.annotate 'line', 1636
    new $P106, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P106.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P105, $P106
.annotate 'line', 1400
    push $P1, $P105
.annotate 'line', 1640
    new $P108, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P108.'PredefFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P107, $P108
.annotate 'line', 1400
    push $P1, $P107
.annotate 'line', 1653
    new $P110, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P110.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P109, $P110
.annotate 'line', 1400
    push $P1, $P109
.annotate 'line', 1657
    new $P112, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P112.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P111, $P112
.annotate 'line', 1400
    push $P1, $P111
.annotate 'line', 1661
    new $P114, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P114.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P113, $P114
.annotate 'line', 1400
    push $P1, $P113
.annotate 'line', 1665
    new $P116, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P116.'PredefFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P115, $P116
.annotate 'line', 1400
    push $P1, $P115
.annotate 'line', 1669
    new $P118, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P118.'PredefFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P117, $P118
.annotate 'line', 1400
    push $P1, $P117
.annotate 'line', 1673
    new $P120, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P120.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P119, $P120
.annotate 'line', 1400
    push $P1, $P119
.annotate 'line', 1677
    new $P122, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P122.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P121, $P122
.annotate 'line', 1400
    push $P1, $P121
.annotate 'line', 1681
    new $P124, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P124.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P123, $P124
.annotate 'line', 1400
    push $P1, $P123
.annotate 'line', 1685
    new $P126, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P126.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P125, $P126
.annotate 'line', 1400
    push $P1, $P125
.annotate 'line', 1689
    new $P128, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P128.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P127, $P128
.annotate 'line', 1400
    push $P1, $P127
.annotate 'line', 1693
    new $P130, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P130.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P129, $P130
.annotate 'line', 1400
    push $P1, $P129
.annotate 'line', 1700
    new $P132, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P132.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P131, $P132
.annotate 'line', 1400
    push $P1, $P131
.annotate 'line', 1707
    new $P134, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P134.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P133, $P134
.annotate 'line', 1400
    push $P1, $P133
.annotate 'line', 1711
    new $P136, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P136.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P135, $P136
.annotate 'line', 1400
    push $P1, $P135
.annotate 'line', 1715
    new $P138, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P138.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P137, $P138
.annotate 'line', 1400
    push $P1, $P137
.annotate 'line', 1719
    new $P140, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P140.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P139, $P140
.annotate 'line', 1400
    push $P1, $P139
.annotate 'line', 1723
    new $P142, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P142.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P141, $P142
.annotate 'line', 1400
    push $P1, $P141
.annotate 'line', 1727
    new $P144, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1728
    $P144.'PredefFunction'('print', WSubId_31, 'v', '*')
    set $P143, $P144
.annotate 'line', 1400
    push $P1, $P143
.annotate 'line', 1731
    new $P146, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1732
    $P146.'PredefFunction'('say', WSubId_32, 'v', '*')
    set $P145, $P146
.annotate 'line', 1400
    push $P1, $P145
.annotate 'line', 1735
    new $P148, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1736
    $P148.'PredefFunction'('cry', WSubId_33, 'v', '*')
    set $P147, $P148
.annotate 'line', 1400
    push $P1, $P147
.annotate 'line', 1739
    new $P150, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1740
    $P150.'PredefFunction'('invoke', WSubId_34, 'P', '!')
    set $P149, $P150
.annotate 'line', 1400
    push $P1, $P149
  __label_2: # Infinite loop
.annotate 'line', 1745
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1746

.end # getpredefs


.sub 'findpredef' :subid('WSubId_67')
        .param string __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
# Body
# {
.annotate 'line', 1750
    $P2 = WSubId_35()
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 1751
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1752
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1753
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1754
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1755
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1756
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1758
    .return($P2)
# }
.annotate 'line', 1759

.end # findpredef


.sub 'optimize_array' :subid('WSubId_38')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1767
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1768
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1769
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1770
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1769
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1772

.end # optimize_array


.sub 'emit_array' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1776
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 1777
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1778

.end # emit_array


.sub 'parseDotted' :subid('WSubId_55')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1782
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1783
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1784
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1785
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1786
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1787
    $P2 = __ARG_1.'get'()
.annotate 'line', 1788
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1791
    __ARG_1.'unget'($P2)
.annotate 'line', 1792
    .return($P1)
# }
.annotate 'line', 1793

.end # parseDotted


.sub 'parseList' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1801
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1802
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1803
# {
.annotate 'line', 1804
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1805
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1806
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1807
    unless_null __ARG_4, __label_4
.annotate 'line', 1808
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1810
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1811
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1812
    .return($P1)
# }
.annotate 'line', 1813

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1818
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1819
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1820
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1821
    .return($P1)
# }
.annotate 'line', 1822

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_56')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1826
    new $P1, ['ResizableStringArray']
.annotate 'line', 1827
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1828
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1829
    .return($P1)
# }
.annotate 'line', 1830

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1843
    setattribute self, 'start', __ARG_1
.annotate 'line', 1844
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1845

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1848
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1849
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1851
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 1852

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 1855
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1856
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1858
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 1859

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 1862
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1863
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1865
    .return("")
  __label_2: # endif
# }
.annotate 'line', 1866

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1869
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1870

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1873
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1874

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1877
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1878

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1881
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 1882

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1885
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1886

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1889
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1890

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1893
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1894

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1897
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1898

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1901
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1902

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1838
    addattribute $P0, 'start'
.annotate 'line', 1839
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 1917
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 1918

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1922
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1921
    elements $I1, $P1
.annotate 'line', 1922
    .return($I1)
# }
.annotate 'line', 1923

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1926
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1927
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1928

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1932
    getattribute $P1, self, 'args'
    WSubId_38($P1)
# }
.annotate 'line', 1933

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1936
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1937
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1938
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1939
    .return($P1)
# }
.annotate 'line', 1940

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1943
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1944

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 1913
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1956
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1959
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1960
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1961
    .return($I1)
# }
.annotate 'line', 1962

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1965
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1966
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 1967
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1968
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1969

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1972
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1973
    if_null __ARG_2, __label_1
.annotate 'line', 1974
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1975

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1978
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1979
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1980
    .return(self)
# }
.annotate 'line', 1981

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 1953
    addattribute $P0, 'name'
.annotate 'line', 1954
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1986
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1987
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1988
    $P1 = __ARG_1.'get'()
.annotate 'line', 1989
# var args: $P2
    null $P2
.annotate 'line', 1990
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1991
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1993
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1994
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1995

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 2004
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_39, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2005

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2008
    getattribute $P1, self, 'list'
    WSubId_38($P1)
# }
.annotate 'line', 2009

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2010
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2013
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2014
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2015
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2017
    .return($P2)
# }
.annotate 'line', 2018

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2000
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2027
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 2028
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 2029

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_110')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2033
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 2034
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2036
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 2037
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 2039

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2043
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2045
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2047
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2049
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2046
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2048
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2050
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2052
    __ARG_2.'unget'($P1)
.annotate 'line', 2053
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2055

.end # parseUsing


.sub 'parseSig' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2059
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2060
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2061
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2062
    WSubId_40("'='", $P2)
  __label_1: # endif
.annotate 'line', 2063
# var expr: $P3
    $P3 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 2064
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2065

.end # parseSig


.sub 'parseStatement' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
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
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2069
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2070
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 2071
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 2072
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 2073
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 2074
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 2075
    new $P6, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 2076
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 2077
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2078
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.annotate 'line', 2079
    WSubId_41("':'", $P1)
  __label_5: # endif
.annotate 'line', 2080
    .tailcall WSubId_42($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2083
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
.annotate 'line', 2085
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2087
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2090
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2093
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 2095
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 2097
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 2099
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 2101
    new $P6, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 2103
    new $P8, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_17: # case
.annotate 'line', 2105
    new $P10, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_18: # case
.annotate 'line', 2107
    new $P12, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_19: # case
.annotate 'line', 2109
    new $P14, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_20: # case
.annotate 'line', 2111
    new $P16, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_21: # case
.annotate 'line', 2113
    new $P18, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_22: # case
.annotate 'line', 2115
    new $P20, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_23: # case
.annotate 'line', 2117
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2119
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2121
    new $P22, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_26: # case
.annotate 'line', 2123
    new $P24, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_7: # default
.annotate 'line', 2125
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_27
    unless $P25 goto __label_27
# {
.annotate 'line', 2126
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2127
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 2128
    new $P6, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 2129
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 2131
    __ARG_1.'unget'($P1)
.annotate 'line', 2132
    new $P5, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.annotate 'line', 2134
    WSubId_6('parseStatement failure', $P1)
# }
.annotate 'line', 2135

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2145
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2146

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2147
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2150
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2151

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2154
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2155

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2158
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2159

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2162
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2163

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2166
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2167

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2170
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2171

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2174
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2175

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2178
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2179

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2182
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2183

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2186
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2187

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2190
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2191

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2194
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2195

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2198
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2199

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2206
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2207

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2210
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2211

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2214
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2215

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2218
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2220
    .return(self)
# }
.annotate 'line', 2221

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2141
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2226
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2229
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2230

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2231
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2224
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2244
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2245
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2246
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2247
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2248
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2249
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2250
    null $I2
  __label_4: # endif
.annotate 'line', 2251
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2247
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2253
    unless $I2 goto __label_6
.annotate 'line', 2254
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2256
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2257

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2240
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2264
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2265
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2266

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2267
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2270
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2271
    .return(self)
# }
.annotate 'line', 2272

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 2275
    getattribute $P1, self, 'statements'
    WSubId_52(__ARG_1, $P1)
# }
.annotate 'line', 2276

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2260
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2281
    unless_null __ARG_1, __label_1
.annotate 'line', 2282
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2283
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2284
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2286
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2287

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2295
# var arg: $P1
    null $P1
.annotate 'line', 2296
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2297
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2298
    $P2 = __ARG_1.'get'()
.annotate 'line', 2299
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2300
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2303
    __ARG_1.'unget'($P2)
.annotate 'line', 2304
    $P1 = WSubId_37(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2306
    .return($P1)
# }
.annotate 'line', 2307

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2316
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2317
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2318
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2319
    unless $I1 goto __label_1
.annotate 'line', 2320
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2321
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2322
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2323
    $P1 = __ARG_2.'get'()
.annotate 'line', 2324
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2325
    __ARG_2.'unget'($P1)
.annotate 'line', 2326
    $P3 = WSubId_36(__ARG_2, __ARG_3, WSubId_53, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2328
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2329

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2332
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 2333
    .return(self)
# }
.annotate 'line', 2334

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2337
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2338
    self.'annotate'(__ARG_1)
.annotate 'line', 2339
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2340
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2341
    __ARG_1.'print'('    ')
.annotate 'line', 2342
    unless_null $P1, __label_2
.annotate 'line', 2343
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2345
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2346
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2347
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2348
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2350

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2309
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2311
    addattribute $P0, 'opname'
.annotate 'line', 2312
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 2362
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2363
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2364
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2365
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2366
    WSubId_54(';', __ARG_2)
.annotate 'line', 2367
    $P3 = WSubId_56($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2368
    .return(self)
# }
.annotate 'line', 2369

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2370
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2373
    self.'annotate'(__ARG_1)
.annotate 'line', 2374
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2375

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2357
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2359
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2387
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2388
# var names: $P1
    null $P3
    $P1 = WSubId_36(__ARG_2, $P3, WSubId_57, ';')
.annotate 'line', 2389
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2390
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2391
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2393
    setattribute self, 'names', $P1
# }
.annotate 'line', 2394

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2397
    .return(self)
# }
.annotate 'line', 2398

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2401
    self.'annotate'(__ARG_1)
.annotate 'line', 2402
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2403
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2404
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2406

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2382
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2384
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2420
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2421
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2422
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2423
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2424
    WSubId_54(';', __ARG_2)
.annotate 'line', 2425
    setattribute self, 'path', $P1
# }
.annotate 'line', 2426

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2429
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2430
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2432
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2434
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2448
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2435
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2436
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2437
    $P4.'pop'()
.annotate 'line', 2438
# var ns: $P5
    $P5 = self.'findns'($P4)
.annotate 'line', 2439
    if_null $P5, __label_6
# {
.annotate 'line', 2440
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2441
    if_null $P3, __label_7
# {
.annotate 'line', 2442
    self.'createvarused'($P2, $P3)
.annotate 'line', 2443
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
.annotate 'line', 2449
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2450
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2451
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2452
    self.'usesubid'($S1)
.annotate 'line', 2453
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2455
    self.'createvar'($P2, 'P')
.annotate 'line', 2456
    .return(self)
# }
.annotate 'line', 2457

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2460
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2461
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2462
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2463
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2464
    self.'annotate'(__ARG_1)
.annotate 'line', 2465
# key: $S2
    null $S2
.annotate 'line', 2466
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2467
    $P1.'pop'()
.annotate 'line', 2468
    $P3 = WSubId_58($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2470
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2472

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2413
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2415
    addattribute $P0, 'path'
.annotate 'line', 2416
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2483
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2484
# var nskey: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2485
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2486
    ge $I1, 1, __label_1
.annotate 'line', 2487
    WSubId_40('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2488
# var nssym: $P2
    $P3 = WSubId_56($P1)
    $P2 = __ARG_3.'findns'($P3)
.annotate 'line', 2490
    unless_null $P2, __label_2
.annotate 'line', 2491
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2492
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2494
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2495

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2498
    .return(self)
# }
.annotate 'line', 2499

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2479
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2514
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2515
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2516
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2517

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2520
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2521
    .return(self)
# }
.annotate 'line', 2522

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2525
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2526

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2509
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2511
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
.annotate 'line', 2543
    setattribute self, 'type', __ARG_1
.annotate 'line', 2544
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2545
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2546
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2547

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2550
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2551

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2552
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2553
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2554
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2555
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2556
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2557
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2558
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2535
    addattribute $P0, 'type'
.annotate 'line', 2536
    addattribute $P0, 'reg'
.annotate 'line', 2537
    addattribute $P0, 'scope'
.annotate 'line', 2538
    addattribute $P0, 'flags'
.annotate 'line', 2539
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2566
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2567

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2570
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2571

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2563
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
.annotate 'line', 2580
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2581

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2582
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2585
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2586
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2587
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2588

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2574
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2576
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2599
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2600

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2603
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2604
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2605
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2606
    if_null $P2, __label_2
.annotate 'line', 2607
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2608
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2609
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2610
    $P1[$S1] = $P3
.annotate 'line', 2611
    .return($P3)
# }
.annotate 'line', 2612

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2615
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2616
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2617
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2618
    if_null $P2, __label_2
.annotate 'line', 2619
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2620
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2621

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2624
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2625
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2626
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2627
    if_null $P2, __label_2
.annotate 'line', 2628
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2629
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2630

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2633
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2634
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2635
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2636
    if_null $P2, __label_2
.annotate 'line', 2637
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2638
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2639
    $P1[$S1] = $P3
.annotate 'line', 2640
    .return($P3)
# }
.annotate 'line', 2641

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2644
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2643
    set $S1, __ARG_1
.annotate 'line', 2645
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2646

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2649
# var sym: $P1
    null $P1
.annotate 'line', 2650
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2651
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2652
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2654
    .return($P3)
# }
.annotate 'line', 2655

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2658
# var sym: $P1
    null $P1
.annotate 'line', 2659
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2660
    .return($P1)
  __label_1: # endif
.annotate 'line', 2661
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2662
    .return($P1)
  __label_2: # endif
.annotate 'line', 2663
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2664
    if_null $P2, __label_3
.annotate 'line', 2665
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2666
    .return($P3)
# }
.annotate 'line', 2667

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2670
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2671
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2672
    .return($S1)
# }
.annotate 'line', 2673

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2676
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2678
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2679
    .return('__WLEX_self')
# }
.annotate 'line', 2680

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2594
    addattribute $P0, 'locals'
.annotate 'line', 2595
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2689
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
.annotate 'line', 2701
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2702

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2703
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2704
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2705
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2706
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2707
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2708
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2709
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2710
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2711
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2714
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2715

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2719
    .return(self)
# }
.annotate 'line', 2720

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2721
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2724
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2725
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2726
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2727
    .return($S2)
# }
.annotate 'line', 2728

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2731
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 2732
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 2733
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 2734

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2737
# reg: $S1
    null $S1
.annotate 'line', 2738
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2739
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2741
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2742
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2744
    .return($S1)
# }
.annotate 'line', 2745

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2748
    WSubId_59(self)
# }
.annotate 'line', 2749

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2697
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2754
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2752
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 2764
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2765
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2766
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2767
    WSubId_40('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2768
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2769

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2770
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2773
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2774
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2775
    .return(self)
# }
.annotate 'line', 2776

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2779
    self.'annotate'(__ARG_1)
.annotate 'line', 2780
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2781
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2782
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2783
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2784
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2786
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2788

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2759
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2761
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
.annotate 'line', 2803
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2804
    .return(self)
# }
.annotate 'line', 2805

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2808
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2809

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2812
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2813
    .return(self)
# }
.annotate 'line', 2814

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2817
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2818
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2819
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2821
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2822
    ne $I1, 0, __label_5
.annotate 'line', 2823
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2825
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2828
    .return(0)
# }
.annotate 'line', 2829

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2832
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2834
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2835
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2836
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2838
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2839
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
.annotate 'line', 2842
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2845
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2848
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2851

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2854
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2856
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2857
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2858
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2860
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2861
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
.annotate 'line', 2864
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2867
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2870
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2873

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2800
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2880
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2881
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2878
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2891
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2892
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2893

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2894
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2895
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2898
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2899
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2900
    .return($S1)
# }
.annotate 'line', 2901

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2904
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2905
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2906
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2907
# var s: $P2
    box $P2, $S1
.annotate 'line', 2908
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2910
    .return($S1)
# }
.annotate 'line', 2911

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2914
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2915
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2916

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2919
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2920

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2886
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2888
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2931
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2932
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2933
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 2934
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2935

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2936
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2937
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2940
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 2941

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2944
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 2945
    .return($N1)
# }
.annotate 'line', 2946

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2949
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2950
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2951
    ne $I1, 0, __label_2
.annotate 'line', 2952
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2954
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2956

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2959
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2960

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 2925
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2927
    addattribute $P0, 'pos'
.annotate 'line', 2928
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2970
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2971
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2972

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2973
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2974
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2977
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 2978
    .return($N1)
# }
.annotate 'line', 2979

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2982
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2983
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2984
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 2986

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 2989
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 2990
    .tailcall WSubId_60($N1)
# }
.annotate 'line', 2991

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 2965
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2967
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3000
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3003
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3004
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3005

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3008
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3009
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3010
    .return(0)
  __label_1: # endif
.annotate 'line', 3011
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3012

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3015
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3016
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3017
    if_null $P2, __label_1
.annotate 'line', 3018
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3020
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3023
    .return('P')
  __label_4: # default
.annotate 'line', 3025
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3028

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3031
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3032
    .return($S1)
# }
.annotate 'line', 3033

.end # getName


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3036
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3037
    unless_null $P1, __label_1
.annotate 'line', 3038
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3039
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3040
# s: $S1
    null $S1
.annotate 'line', 3041
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3042
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3045
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3047
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3051
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3052
    .return($S1)
# }
.annotate 'line', 3053

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 3056
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3057
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3058
    getattribute $P2, self, 'name'
    WSubId_61($P2)
  __label_1: # endif
.annotate 'line', 3059
    .return($P1)
# }
.annotate 'line', 3060

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3063
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3064
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3065
    if_null $P2, __label_1
# {
.annotate 'line', 3066
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3067
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3068
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3069
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3070
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3071
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3078
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3079
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3080
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
.annotate 'line', 3084
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'findsymbol'($P5)
.annotate 'line', 3085
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3086
# id: $S1
    $P5 = $P4.'makesubid'()
    null $S1
    if_null $P5, __label_11
    set $S1, $P5
  __label_11:
.annotate 'line', 3087
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3088
    self.'usesubid'($S1)
.annotate 'line', 3089
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3092
    .return(self)
# }
.annotate 'line', 3093

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3096
# id: $S1
    null $S1
.annotate 'line', 3097
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3098
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3100
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3101
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3102
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3103
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3104
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3105
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3106
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3107
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3111
    .return($S1)
# }
.annotate 'line', 3112

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3115
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3116
    self.'annotate'(__ARG_1)
.annotate 'line', 3117
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3118
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3120

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3123
    self.'annotate'(__ARG_1)
.annotate 'line', 3124
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3125

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3128
    self.'annotate'(__ARG_1)
.annotate 'line', 3129
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3130
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3131
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3132
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3133
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3134
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3137
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3140
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3143
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3144
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3146
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3147
    ne $S3, 'v', __label_13
.annotate 'line', 3148
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3149
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3150
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3153
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3154
    self.'annotate'(__ARG_1)
.annotate 'line', 3155
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3156
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3158
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3161
    .return($S2)
# }
.annotate 'line', 3162

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 2996
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2998
    addattribute $P0, 'name'
.annotate 'line', 2999
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3172
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3173
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3174

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3177
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3178

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3181
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3182
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3183
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3184
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3185
    .return($S2)
# }
.annotate 'line', 3186

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3189
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3190
    self.'annotate'(__ARG_1)
.annotate 'line', 3191
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3192
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3194

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3197
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3198
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3199
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3201
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3204
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3202
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3205
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3208
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3209
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3210
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3212
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3213
    self.'annotate'(__ARG_1)
.annotate 'line', 3214
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3218
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3219

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3222
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3223

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3167
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3169
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3232
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3233

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3228
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 3244
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3245
    $P2 = WSubId_62(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3246

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3247
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3250
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3253
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3254
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3255
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3256
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3257
    __ARG_1.'say'()
# }
.annotate 'line', 3258

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3238
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3240
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3268
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3269
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3270

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3273
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3274

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3277
    self.'optimizearg'()
.annotate 'line', 3278
    .return(self)
# }
.annotate 'line', 3279

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3263
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3265
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
.annotate 'line', 3290
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3291
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3292
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3293

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3296
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3297
    .return(self)
# }
.annotate 'line', 3298

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3301
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3302

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3305
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3306
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3307

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3310
    self.'optimizearg'()
.annotate 'line', 3311
    .return(self)
# }
.annotate 'line', 3312

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3315
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3316

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3319
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3320

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3284
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3286
    addattribute $P0, 'lexpr'
.annotate 'line', 3287
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3329
    .return('I')
# }
.annotate 'line', 3330

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3333
    self.'optimizearg'()
.annotate 'line', 3334
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3335
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3336
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3337
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3338
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3339
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3341
    .return(self)
# }
.annotate 'line', 3342

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3325
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3351
    .return('I')
# }
.annotate 'line', 3352

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3347
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
.annotate 'line', 3360
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3361

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3364
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3365
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3366
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3367
    self.'annotate'(__ARG_1)
.annotate 'line', 3368
    __ARG_1.'print'('    delete ')
.annotate 'line', 3369
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3370
    __ARG_1.'say'()
.annotate 'line', 3371
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3372
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3375
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3376

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3356
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
.annotate 'line', 3383
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3384

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3387
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3388
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
.annotate 'line', 3389
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3390
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3391
    self.'annotate'(__ARG_1)
.annotate 'line', 3392
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3393
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3394
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3397
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3398

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3379
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
.annotate 'line', 3407
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3408

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3411
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3412

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3415
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3416
    .return(self)
# }
.annotate 'line', 3417

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 3420
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3421
    self.'optimizearg'()
.annotate 'line', 3422
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3423
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3424
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3427
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3428
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3429
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_63($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3432
    .return(self)
# }
.annotate 'line', 3433

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3436
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3437
    self.'annotate'(__ARG_1)
.annotate 'line', 3438
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3439

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3403
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
.annotate 'line', 3448
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3449

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3450
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3453
    .return('I')
# }
.annotate 'line', 3454

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3457
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3458
    .return(self)
# }
.annotate 'line', 3459

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3462
    self.'optimizearg'()
.annotate 'line', 3463
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3464
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3465
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3466
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3468
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3469
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3470
    .return(self)
# }
.annotate 'line', 3471

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3474
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3475

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3478
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3479
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3480
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3481
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3483
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3486
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3489
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3491

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3444
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3500
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3501

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3504
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3505
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3506
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3507

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3496
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3516
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3517
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3518
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3519

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3512
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
.annotate 'line', 3526
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3527

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3530
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3531
    self.'annotate'(__ARG_1)
.annotate 'line', 3532
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3533
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3534
    .return($S1)
# }
.annotate 'line', 3535

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3522
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
.annotate 'line', 3542
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3543

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3546
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3547
    self.'annotate'(__ARG_1)
.annotate 'line', 3548
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3549
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3550
    .return($S1)
# }
.annotate 'line', 3551

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3538
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
.annotate 'line', 3560
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3561

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3564
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3565
    self.'annotate'(__ARG_1)
.annotate 'line', 3566
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3567
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3568
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3569
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3570
    .return($S1)
# }
.annotate 'line', 3571

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3556
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
.annotate 'line', 3578
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3579

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3582
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3583
    self.'annotate'(__ARG_1)
.annotate 'line', 3584
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3585
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3586
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3587
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3588
    .return($S1)
# }
.annotate 'line', 3589

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3574
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
.annotate 'line', 3600
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3601
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3602
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3603
    .return(self)
# }
.annotate 'line', 3604

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3607
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3608

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3611
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3612
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3613
    .return(self)
# }
.annotate 'line', 3614

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3617
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3618

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 3621
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3622
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3623
    WSubId_59($P1)
  __label_1: # endif
# }
.annotate 'line', 3624

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3627
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3628
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3629
    self.'annotate'(__ARG_1)
.annotate 'line', 3630
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3632

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3594
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3596
    addattribute $P0, 'lexpr'
.annotate 'line', 3597
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3641
    self.'annotate'(__ARG_1)
.annotate 'line', 3642
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3643
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3644

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3637
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3653
    self.'annotate'(__ARG_1)
.annotate 'line', 3654
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3655
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3656
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3657

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3660
    self.'checkleft'()
.annotate 'line', 3661
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3662
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 3663
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 3664
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3665
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3666
    self.'annotate'(__ARG_1)
.annotate 'line', 3667
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3668
    .return($S1)
# }
.annotate 'line', 3669

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3649
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3678
    self.'checkleft'()
.annotate 'line', 3679
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3680
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3681
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3682
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3683
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3684
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3685
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3687
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3688
# aux: $S5
    null $S5
.annotate 'line', 3689
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3690
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3692
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3693
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3694
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3695
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3697
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3701
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3702
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3703
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3704
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3706
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3709
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3712
    .return($S3)
# }
.annotate 'line', 3713

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3674
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3722
    self.'checkleft'()
.annotate 'line', 3723
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3724
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3725
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3726
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3727
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3728
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3729
# aux: $S5
    null $S5
.annotate 'line', 3730
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3731
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3733
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3736
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3737
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3738
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3739
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3741
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3744
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3746
    .return($S3)
# }
.annotate 'line', 3747

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3718
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3756
    self.'checkleft'()
.annotate 'line', 3757
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3758
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3759
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3760
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3761
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3763
    ne $S2, 'I', __label_7
.annotate 'line', 3764
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3766
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3767
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3769
    self.'annotate'(__ARG_1)
.annotate 'line', 3770
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3773
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3774
    self.'annotate'(__ARG_1)
.annotate 'line', 3775
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3777
    .return($S3)
# }
.annotate 'line', 3778

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3752
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3787
    self.'checkleft'()
.annotate 'line', 3788
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3789
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3790
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3791
    self.'annotate'(__ARG_1)
.annotate 'line', 3792
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3793
    .return($S2)
# }
.annotate 'line', 3794

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3783
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3803
    self.'checkleft'()
.annotate 'line', 3804
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3805
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3806
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3807
    self.'annotate'(__ARG_1)
.annotate 'line', 3808
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3809
    .return($S2)
# }
.annotate 'line', 3810

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3799
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3817
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3820
    self.'optimizearg'()
.annotate 'line', 3821
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3822
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3823
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3824
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3825
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3826
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3828
    .return(self)
# }
.annotate 'line', 3829

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3832
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3833
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3834
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3835
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3836
    self.'annotate'(__ARG_1)
.annotate 'line', 3837
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3839
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3844
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3849
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3854
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3859
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3864
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3840
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3841
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3842
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3845
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3846
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3847
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3850
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3851
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3852
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3855
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3856
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3857
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3860
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3861
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3862
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3865
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3866
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3867
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3868
# switch
.annotate 'line', 3871
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3873
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3876
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3879
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3880
# }
.annotate 'line', 3882

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3885
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3886

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3889
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3890

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3893
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3894

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3815
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
.annotate 'line', 3909
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3910
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3911
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3912

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3913
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3914
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3917
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3918
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3919
    .return(self)
# }
.annotate 'line', 3920

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3923
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3924
    self.'annotate'(__ARG_1)
.annotate 'line', 3925
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3926
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3927
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3928

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3931
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3932
    self.'annotate'(__ARG_1)
.annotate 'line', 3933
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
.annotate 'line', 3934

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 3902
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3904
    addattribute $P0, 'expr'
.annotate 'line', 3905
    addattribute $P0, 'checknull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3941
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3944
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3945

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3948
    self.'optimizearg'()
.annotate 'line', 3949
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3950
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3951
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3952
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3953
    unless $I1 goto __label_1
# {
.annotate 'line', 3954
    unless $I2 goto __label_2
.annotate 'line', 3955
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3957
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3959
    unless $I2 goto __label_4
.annotate 'line', 3960
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3961
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3962
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3963
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3964
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3965
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3967
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 3968
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 3969
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3971
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3972
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3973
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
.annotate 'line', 3977
    .return(self)
# }
.annotate 'line', 3978

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3981
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3982

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3985
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3986

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3989
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3990

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3993
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3994

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 3939
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4001
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4004
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4005

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4008
    self.'optimizearg'()
.annotate 'line', 4009
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4010
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4011
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4012
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4013
    unless $I1 goto __label_1
# {
.annotate 'line', 4014
    unless $I2 goto __label_2
.annotate 'line', 4015
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4017
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4019
    unless $I2 goto __label_4
.annotate 'line', 4020
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4021
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 4022
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 4023
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 4024
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4025
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4027
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4028
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4029
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 4031
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 4032
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 4033
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
.annotate 'line', 4037
    .return(self)
# }
.annotate 'line', 4038

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4041
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4042

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4045
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4046

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4049
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4050

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4053
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4054

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 3999
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
.annotate 'line', 4064
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 4065
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 4066

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4067
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4070
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4071
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
.annotate 'line', 4072

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4075
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
.annotate 'line', 4076

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4079
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4080
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4081
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4082

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4085
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4086

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4089
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4090
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4091
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4092

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4095
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4096
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4097
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4098

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4059
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 4061
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4105
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4108
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4109

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4112
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4113

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4116
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4117

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4120
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4121

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4124
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4125

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4103
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4132
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4135
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4136

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4139
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4140

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4143
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4144

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4147
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4148

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4151
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4152

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4130
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4159
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4162
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4163

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4166
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4167

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4170
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4171

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4174
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4175

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4178
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4179

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4157
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4186
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4189
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4190

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4193
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4194

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4197
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4198

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4201
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4202

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4205
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4206

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4184
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4215
    .return('I')
# }
.annotate 'line', 4216

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4211
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
.annotate 'line', 4225
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4226

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4229
    self.'optimizearg'()
.annotate 'line', 4230
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4231
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4232
    eq $I1, 0, __label_2
.annotate 'line', 4233
    getattribute $P1, self, 'rexpr'
    .return($P1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4235
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    .tailcall WSubId_21($P2, $P3, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4237
    .return(self)
# }
.annotate 'line', 4238

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4241
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
.annotate 'line', 4242
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4243
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4244
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4245
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4248
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4249
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4250
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4251
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4252
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4254

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4221
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
.annotate 'line', 4263
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4264

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4267
    self.'optimizearg'()
.annotate 'line', 4268
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4269
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4270
    ne $I1, 0, __label_2
.annotate 'line', 4271
    getattribute $P1, self, 'rexpr'
    .return($P1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4273
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    .tailcall WSubId_21($P2, $P3, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4275
    .return(self)
# }
.annotate 'line', 4276

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4279
# res: $S1
    null $S1
.annotate 'line', 4280
    if_null __ARG_2, __label_1
.annotate 'line', 4281
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4283
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4284
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4285
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4286
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4287
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4290
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4291
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4292
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4293
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4294
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4296

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4259
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4301
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
.annotate 'line', 4311
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4312

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4315
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
.annotate 'line', 4316
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4317
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4318
    self.'annotate'(__ARG_1)
.annotate 'line', 4319
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4320

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4323
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4324

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4307
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
.annotate 'line', 4333
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4334

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4337
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
.annotate 'line', 4338
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4339
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4340
    self.'annotate'(__ARG_1)
.annotate 'line', 4341
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4342

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4345
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4346

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4329
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
.annotate 'line', 4355
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4356

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4359
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
.annotate 'line', 4360
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4361
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4362
    self.'annotate'(__ARG_1)
.annotate 'line', 4363
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4364

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4367
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4368

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4351
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
.annotate 'line', 4378
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4380
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4387
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4381
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4382
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4383
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4385
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4388
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4389
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4392
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4394

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4395
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4398
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4399
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4400
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4401
# i: $I2
    null $I2
# for loop
.annotate 'line', 4402
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4403
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4402
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4404
    .return($P2)
# }
.annotate 'line', 4405

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4408
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4409
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4410
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
.annotate 'line', 4411
    self.'annotate'(__ARG_1)
.annotate 'line', 4412
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4413
# i: $I2
    set $I2, 2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 4414
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_4: # for iteration
.annotate 'line', 4413
    inc $I2
    goto __label_6
  __label_5: # for end
# }
.annotate 'line', 4415

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4418
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4419
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4420
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4421
    self.'annotate'(__ARG_1)
.annotate 'line', 4422
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4423
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4424
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4423
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4425
    .return($S1)
# }
.annotate 'line', 4426

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4429
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4430
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4431
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4432
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4433
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4432
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4434

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4373
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4375
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4443
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4444

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_64 = "WSubId_64"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4447
    self.'optimizearg'()
.annotate 'line', 4448
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4449
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4450
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4451
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4452
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4453
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4458
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4459
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4460
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4462
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# predefined string
.annotate 'line', 4463
    getattribute $P9, $P3, 'str'
.annotate 'line', 4460
    set $S3, $P9
# predefined string
.annotate 'line', 4463
    getattribute $P10, $P4, 'str'
.annotate 'line', 4460
    set $S4, $P10
.annotate 'line', 4463
    concat $S5, $S3, $S4
    $P6.'TokenSingleQuoted'($P7, $P8, $S5)
    set $P5, $P6
    goto __label_7
  __label_8:
.annotate 'line', 4465
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P3, 'file'
    getattribute $P13, $P3, 'line'
# predefined string
.annotate 'line', 4466
    $P14 = $P3.'getasquoted'()
.annotate 'line', 4460
    set $S6, $P14
# predefined string
.annotate 'line', 4466
    $P15 = $P4.'getasquoted'()
.annotate 'line', 4460
    set $S7, $P15
.annotate 'line', 4466
    concat $S8, $S6, $S7
    $P11.'TokenQuoted'($P12, $P13, $S8)
    set $P5, $P11
  __label_7:
.annotate 'line', 4467
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4469
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4470
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4471
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4472
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4475
    $P6 = WSubId_64($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4476
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4477
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4478
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_63($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4482
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4483
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4485
    .return(self)
# }
.annotate 'line', 4486

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 4489
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4490
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4491
    ne $S1, $S2, __label_3
.annotate 'line', 4492
    .return($S1)
  __label_3: # endif
.annotate 'line', 4493
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4494
    .return('S')
  __label_4: # endif
.annotate 'line', 4495
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4496
    .return('S')
  __label_6: # endif
.annotate 'line', 4497
    $P1 = WSubId_64($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4498
    .return('N')
  __label_8: # endif
.annotate 'line', 4499
    .return('I')
# }
.annotate 'line', 4500

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4503
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4504
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4505
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4506
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4507
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4509
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4510
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4511
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4512
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4513
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4514
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4515
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4516
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4519
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4520
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4523
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4526
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4527
# l: $S7
    null $S7
.annotate 'line', 4528
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4530
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4531
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4533
# r: $S8
    null $S8
.annotate 'line', 4534
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4536
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4537
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4539
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4542
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4544

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4439
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
.annotate 'line', 4553
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4554

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4557
    self.'optimizearg'()
.annotate 'line', 4558
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4559
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4560
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4561
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4562
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4563
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4564
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4565
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4566
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4569
    .return(self)
# }
.annotate 'line', 4570

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4573
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4574
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4575
    ne $S1, $S2, __label_3
.annotate 'line', 4576
    .return($S1)
  __label_3: # endif
.annotate 'line', 4577
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4578
    .return('N')
  __label_4: # endif
.annotate 'line', 4579
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4580
    .return('N')
  __label_6: # endif
.annotate 'line', 4581
    .return('I')
# }
.annotate 'line', 4582

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4585
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4586
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4587
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4588

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4549
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
.annotate 'line', 4597
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4598

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_64 = "WSubId_64"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4601
    self.'optimizearg'()
.annotate 'line', 4602
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4603
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4604
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4605
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4606
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4607
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4608
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4609
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4610
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4613
    $P3 = WSubId_64($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4614
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 4615
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 4616
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_63($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4620
    .return(self)
# }
.annotate 'line', 4621

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4624
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4625
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4626
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4627
    ne $S1, $S2, __label_3
.annotate 'line', 4628
    .return($S1)
  __label_3: # endif
.annotate 'line', 4629
    ne $S1, 'S', __label_4
.annotate 'line', 4630
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4632
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4633

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4636
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4637
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4638
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4639
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4640
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4641
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4642
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4643
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4644
# rval: $S5
    null $S5
# switch
.annotate 'line', 4645
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4647
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4650
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4651
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4653
    self.'annotate'(__ARG_1)
.annotate 'line', 4654
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4655
    .return()
# }
  __label_3: # endif
.annotate 'line', 4657
    iseq $I3, $S1, $S2
    unless $I3 goto __label_8
    iseq $I3, $S1, 'I'
    if $I3 goto __label_10
    iseq $I3, $S1, 'N'
  __label_10:
    if $I3 goto __label_9
    iseq $I3, $S1, 'P'
  __label_9:
  __label_8:
    unless $I3 goto __label_7
# {
.annotate 'line', 4658
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4659
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4660
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4661
    .return()
# }
  __label_7: # endif
.annotate 'line', 4666
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4667
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4668
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4669
# rval: $S6
    null $S6
# switch
.annotate 'line', 4670
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4672
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4673
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4674
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4677
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4680
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4681
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4683
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4684
    self.'annotate'(__ARG_1)
.annotate 'line', 4685
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4687
    .return()
# }
  __label_11: # endif
.annotate 'line', 4690
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4691
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4692
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4693
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4696
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4697
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4699
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4700
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4701
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4704
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4706
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4707
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4710
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4714
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4715
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4716
# }
  __label_21: # endif
.annotate 'line', 4719
    self.'annotate'(__ARG_1)
.annotate 'line', 4720
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4721
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4722
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4723

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4593
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
.annotate 'line', 4732
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4733

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_64 = "WSubId_64"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4736
    self.'optimizearg'()
.annotate 'line', 4737
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4738
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4739
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4740
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4741
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4742
# var lval: $P3
    null $P3
.annotate 'line', 4743
# var rval: $P4
    null $P4
.annotate 'line', 4744
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4745
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 4746
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 4747
    eq $I2, 0, __label_7
.annotate 'line', 4748
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
.annotate 'line', 4751
    $P5 = WSubId_64($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4752
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 4753
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 4754
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4755
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N4, $N1, $N2
    .tailcall WSubId_63($P5, $P6, $N4)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4759
    .return(self)
# }
.annotate 'line', 4760

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4763
    .return('N')
# }
.annotate 'line', 4764

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4767
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4768
# var aux: $P2
    null $P2
.annotate 'line', 4769
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4770
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4771
    $P2 = self.'tempreg'('N')
.annotate 'line', 4772
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4773
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4775
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4776
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4777
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4778
    $P2 = self.'tempreg'('N')
.annotate 'line', 4779
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4780
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4782
    self.'annotate'(__ARG_1)
.annotate 'line', 4783
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4784

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4728
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
.annotate 'line', 4793
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4794

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4797
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4798
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4799
    self.'annotate'(__ARG_1)
.annotate 'line', 4800
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4801

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4804
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4805

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4789
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
.annotate 'line', 4814
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4815

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4818
    .return('I')
# }
.annotate 'line', 4819

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4822
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4823
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4824
    self.'annotate'(__ARG_1)
.annotate 'line', 4829
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4830

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 4810
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
.annotate 'line', 4839
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4840

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4843
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
.annotate 'line', 4844
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4845
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4846
    self.'annotate'(__ARG_1)
.annotate 'line', 4847
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4848

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4851
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4852

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 4835
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
.annotate 'line', 4861
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4862

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4865
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
.annotate 'line', 4866
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4867
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4868
    self.'annotate'(__ARG_1)
.annotate 'line', 4869
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4870

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4873
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4874

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 4857
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4883
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4884

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4887
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4888
# setname: $S1
    set $S1, ''
.annotate 'line', 4889
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4890
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4892
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4895
    set $I2, 1
# switch
.annotate 'line', 4896
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
.annotate 'line', 4900
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4901
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 4902
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 4903
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4906
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4911
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4914
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4917
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4912
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4915
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4918
    __ARG_1.'print'(' :named')
.annotate 'line', 4919
    eq $S1, '', __label_17
.annotate 'line', 4920
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4921
# }
.annotate 'line', 4923

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 4879
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4932
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4933
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4934

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4937
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4938
    .return(self)
# }
.annotate 'line', 4939

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4942
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4943

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 4928
    addattribute $P0, 'arg'
.annotate 'line', 4929
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 4948
# var modifier: $P1
    null $P1
.annotate 'line', 4949
# var expr: $P2
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 4950
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4951
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4952
    $P3 = __ARG_1.'get'()
.annotate 'line', 4953
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 4954
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 4957
    WSubId_40('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4960
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4961
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4962

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 4973
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4974
    setattribute self, 'start', __ARG_2
.annotate 'line', 4975
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4976
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4977
    __ARG_3.'unget'($P1)
.annotate 'line', 4978
    $P3 = WSubId_36(__ARG_3, __ARG_1, WSubId_65, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 4980

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4983
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4984
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4982
    elements $I1, $P1
  __label_1:
.annotate 'line', 4984
    .return($I1)
# }
.annotate 'line', 4985

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4988
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4989

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4992
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4993
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4994

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4997
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4998
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4999

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5002
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 5003
    .return(self)
# }
.annotate 'line', 5004

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5007
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5008
    unless_null $P1, __label_1
# {
.annotate 'line', 5009
    new $P2, ['ResizableStringArray']
.annotate 'line', 5010
# pnull: $S1
    set $S1, ''
.annotate 'line', 5011
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 5012
# var arg: $P4
    getattribute $P4, $P3, 'arg'
.annotate 'line', 5013
# reg: $S2
    null $S2
.annotate 'line', 5014
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5015
    ne $S1, '', __label_6
# {
.annotate 'line', 5016
    getattribute $P8, self, 'owner'
    $P7 = $P8.'tempreg'('P')
    set $S1, $P7
.annotate 'line', 5017
    __ARG_1.'emitnull'($S1)
# }
  __label_6: # endif
.annotate 'line', 5019
    set $S2, $S1
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5022
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
  __label_5: # endif
.annotate 'line', 5023
# predefined push
    push $P2, $S2
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5025
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5027
    .return($P1)
# }
.annotate 'line', 5028

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5031
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5032
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5034
# sep: $S1
    set $S1, ''
.annotate 'line', 5035
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5036
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5037
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5038
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5039
    if_null $P3, __label_4
.annotate 'line', 5040
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5041
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5036
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5043

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 4966
    addattribute $P0, 'owner'
.annotate 'line', 4967
    addattribute $P0, 'start'
.annotate 'line', 4968
    addattribute $P0, 'args'
.annotate 'line', 4969
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_66')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5048
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5049
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5050
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5051
    .return(1)
# }
.annotate 'line', 5052

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5063
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5064
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5065
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5066

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5069
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5070

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5073
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5074
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5075
    new $P3, ['ResizableStringArray']
.annotate 'line', 5076
# var arg: $P4
    null $P4
.annotate 'line', 5077
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5078
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5080
    if_null $P2, __label_6
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5081
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5083
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5084
    ne $S1, '', __label_9
# {
.annotate 'line', 5085
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5086
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5088
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5090
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5094
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5095
    if_null $P2, __label_11
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5096
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5097
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 5098
    .return()
  __label_2: # default
.annotate 'line', 5100
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5101
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5102
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5103
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5104
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5105
# argr: $S5
    null $S5
.annotate 'line', 5106
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5107
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
.annotate 'line', 5111
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5112
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5115
    ne $S1, '', __label_24
# {
.annotate 'line', 5116
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5117
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5119
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5123
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5124
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5126
# aux: $S6
    null $S6
.annotate 'line', 5127
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5128
    set $S7, $S4
    set $S8, 'P'
    if $S7 == $S8 goto __label_30
    set $S8, 'I'
    if $S7 == $S8 goto __label_31
    set $S8, 'N'
    if $S7 == $S8 goto __label_32
    set $S8, 'S'
    if $S7 == $S8 goto __label_33
    goto __label_29
  __label_30: # case
# switch
.annotate 'line', 5130
    set $S9, $S3
    set $S10, 'I'
    if $S9 == $S10 goto __label_36
    set $S10, 'N'
    if $S9 == $S10 goto __label_37
    set $S10, 'S'
    if $S9 == $S10 goto __label_38
    goto __label_35
  __label_36: # case
  __label_37: # case
  __label_38: # case
.annotate 'line', 5134
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5135
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 5138
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 5144
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5145
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 5148
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5152
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5101
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5155
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5156

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 5056
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5058
    addattribute $P0, 'predef'
.annotate 'line', 5059
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'genpredefcallexpr' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5163
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5164
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5165
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 5166
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 5169
    isa $I2, __ARG_2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 5170
    $P3 = WSubId_66($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5171
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 5172
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 5176
    new $P4, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P5, $P6, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 5177

.end # genpredefcallexpr

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5186
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5187
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5188
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5189
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5190
    __ARG_1.'unget'($P1)
.annotate 'line', 5191
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5193

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5194
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 5197
# var funref: $P1
    getattribute $P4, self, 'funref'
    $P1 = $P4.'optimize'()
.annotate 'line', 5198
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5199
# nargs: $I1
    null $I1
.annotate 'line', 5200
    if_null $P2, __label_1
# {
.annotate 'line', 5201
    $P2 = $P2.'optimize'()
.annotate 'line', 5202
    $P4 = $P2.'numargs'()
    set $I1, $P4
# }
  __label_1: # endif
.annotate 'line', 5205
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5206
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P5.'CallMemberExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 5207
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5208
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P5.'CallMemberRefExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_3: # endif
.annotate 'line', 5211
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 5212
# callname: $S1
    $P5 = $P1.'getName'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 5213
# var predef: $P3
    $P3 = WSubId_67($S1, $I1)
.annotate 'line', 5214
    if_null $P3, __label_6
.annotate 'line', 5215
    getattribute $P4, self, 'owner'
    .tailcall WSubId_68($P4, $P3, $P2)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 5218
    setattribute self, 'funref', $P1
.annotate 'line', 5219
    setattribute self, 'args', $P2
.annotate 'line', 5220
    .return(self)
# }
.annotate 'line', 5221

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5224
    .return(1)
# }
.annotate 'line', 5225

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5228
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5229
# call: $S1
    null $S1
.annotate 'line', 5231
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5232
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5233
    ne $S1, '', __label_4
# {
.annotate 'line', 5234
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P1.'getName'()
    push $P3, $P5
    $P2 = self.'findsymbol'($P3)
.annotate 'line', 5235
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_7
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
  __label_7:
    unless $I1 goto __label_5
.annotate 'line', 5236
    $P3 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P3
    goto __label_6
  __label_5: # else
.annotate 'line', 5238
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "'"
    push $P4, $P5
    $P6 = $P1.'getName'()
    push $P4, $P6
    box $P5, "'"
    push $P4, $P5
# predefined join
    join $S1, "", $P4
  __label_6: # endif
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5242
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5243
    .return($S1)
# }
.annotate 'line', 5244

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5247
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5248
    if_null $P1, __label_1
.annotate 'line', 5249
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5250

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5253
    __ARG_1.'print'('(')
.annotate 'line', 5254
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5255
    if_null $P1, __label_1
.annotate 'line', 5256
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5257
    __ARG_1.'say'(')')
# }
.annotate 'line', 5258

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5261
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5262
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5264
    self.'annotate'(__ARG_1)
.annotate 'line', 5266
    __ARG_1.'print'('    ')
.annotate 'line', 5267
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5268
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5269
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5271
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5274
    __ARG_1.'print'($S1)
.annotate 'line', 5275
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5276

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5179
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5181
    addattribute $P0, 'funref'
.annotate 'line', 5182
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5290
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5291
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5292
    setattribute self, 'args', __ARG_3
.annotate 'line', 5297
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5298
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5299
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5300
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5301
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5302
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5303
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5304
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5305
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5306
    if_null $P4, __label_6
# {
.annotate 'line', 5307
    setattribute self, 'sym', $P4
.annotate 'line', 5308
    isa $I1, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_7
# {
.annotate 'line', 5309
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
.annotate 'line', 5310
    getattribute $P5, self, 'subid'
    self.'usesubid'($P5)
# }
  __label_7: # endif
# }
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
.annotate 'line', 5315

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5318
    getattribute $P3, self, 'sym'
    if_null $P3, __label_1
# {
.annotate 'line', 5319
    getattribute $P4, self, 'subid'
    if_null $P4, __label_2
.annotate 'line', 5320
    getattribute $P5, self, 'subid'
    .return($P5)
  __label_2: # endif
.annotate 'line', 5321
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5322
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5323
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5325
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5326
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P2.'emit_left_get'(__ARG_1)
    push $P3, $P5
    box $P4, ".'"
    push $P3, $P4
.annotate 'line', 5327
    $P6 = $P2.'get_member'()
.annotate 'line', 5326
    push $P3, $P6
    box $P4, "'"
    push $P3, $P4
# predefined join
.annotate 'line', 5317
    join $S1, "", $P3
.annotate 'line', 5326
    .return($S1)
# }
.annotate 'line', 5328

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5284
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5286
    addattribute $P0, 'sym'
.annotate 'line', 5287
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5338
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5339
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5340
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5341

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5344
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5345
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5346
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5347
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5348
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5351
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5352
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5353
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5354

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5334
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
.annotate 'line', 5364
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5365
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5366

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5369
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5370
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5371
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5372
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5373
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5374
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5375
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5377
    .return($S2)
# }
.annotate 'line', 5378

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5359
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5361
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
.annotate 'line', 5387
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5388
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5389

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5390
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5393
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5394
    .return(self)
# }
.annotate 'line', 5395

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5398
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5399
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5400
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5402
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5403
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5404

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5407
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5408

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5411
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5412
    self.'annotate'(__ARG_1)
.annotate 'line', 5413
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5414

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5417
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5418
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5419
    .return($S1)
# }
.annotate 'line', 5420

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5423
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5424
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5425
    self.'annotate'(__ARG_1)
.annotate 'line', 5426
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5427

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5430
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5431

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5434
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5435
# value: $S2
    null $S2
.annotate 'line', 5436
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5438
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5439
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5440
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5442
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5445
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5446
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5448
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5449

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5452
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5453
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5454
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5455
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5457
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5458
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5459
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5461
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5463
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5464
    .return($S2)
# }
.annotate 'line', 5465

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5381
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5383
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
.annotate 'line', 5476
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5477
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5478

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5479
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5482
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5483
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5484
    .return(self)
# }
.annotate 'line', 5485

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 5488
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5489
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5490
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5491
    WSubId_40("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5492
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5493
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5494
    self.'annotate'(__ARG_1)
.annotate 'line', 5495
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5496
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5497
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5498

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 5501
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5502
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5503
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5504
    WSubId_40("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5505
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5506
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5507
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5508
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5510
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5512
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5513
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5514
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5518
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5519
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5520
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5523
    self.'annotate'(__ARG_1)
.annotate 'line', 5524
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5525
    .return($S3)
# }
.annotate 'line', 5526

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5471
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5473
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
.annotate 'line', 5540
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5541
    setattribute self, 'left', __ARG_4
.annotate 'line', 5542
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5543

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5546
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5547
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5549
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5550

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5553
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5554
    setattribute self, 'left', $P1
.annotate 'line', 5555
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5556
    $P2.'optimizeargs'()
.annotate 'line', 5560
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5561
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5562
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5563
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5564
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5565
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5566
# predefined substr
.annotate 'line', 5565
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5567
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5570
    .return(self)
# }
.annotate 'line', 5571

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5574
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5575
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5576
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5577
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5578
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5579
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5577
    setattribute self, 'regleft', $P3
.annotate 'line', 5580
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5581

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5584
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5585
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5586
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5587
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5588
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5589
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5590
    __ARG_1.'print'(']')
# }
.annotate 'line', 5591

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5594
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5595
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5596
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5597
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5598
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5599
    eq $I1, 1, __label_4
.annotate 'line', 5600
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5601
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5602
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5603
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5606
    self.'annotate'(__ARG_1)
.annotate 'line', 5607
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5608
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5609
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5611

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5614
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5615
    self.'annotate'(__ARG_1)
.annotate 'line', 5616
    __ARG_1.'print'('    ')
.annotate 'line', 5617
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5618
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5619

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5622
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5623
# rreg: $S1
    null $S1
.annotate 'line', 5624
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5625
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5626
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5629
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5630
    self.'annotate'(__ARG_1)
.annotate 'line', 5631
    __ARG_1.'print'('    ')
.annotate 'line', 5632
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5633
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5634
    .return($S1)
# }
.annotate 'line', 5635

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5531
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5533
    addattribute $P0, 'left'
.annotate 'line', 5534
    addattribute $P0, 'regleft'
.annotate 'line', 5535
    addattribute $P0, 'args'
.annotate 'line', 5536
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 5646
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5647
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5648
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5649
    __ARG_1.'unget'($P1)
.annotate 'line', 5650
    $P3 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5652

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5653
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5656
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5657
    .return(self)
# }
.annotate 'line', 5658

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5661
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5662
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5663
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5669
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5671

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5674
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5675
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5676
    .return($S1)
# }
.annotate 'line', 5677

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5680
    self.'annotate'(__ARG_1)
.annotate 'line', 5681
# itemreg: $S1
    null $S1
.annotate 'line', 5682
# it_p: $S2
    null $S2
.annotate 'line', 5683
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5684
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5685
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
  __label_1: # endif
.annotate 'line', 5687
    getattribute $P2, self, 'values'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
# {
# switch
.annotate 'line', 5688
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
.annotate 'line', 5690
# aux: $S3
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 5691
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5692
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5693
    set $S1, $S2
# }
  __label_10: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5697
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5698
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5699
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5700
    __ARG_1.'emitnull'($S1)
# }
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 5704
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_12: # endif
  __label_4: # switch end
.annotate 'line', 5706
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5707
    self.'annotate'(__ARG_1)
.annotate 'line', 5708
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_14: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 5711

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5640
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5642
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 5723
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5724
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5725
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5726
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5727
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5728
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5729
# {
.annotate 'line', 5730
# var key: $P4
    $P4 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5731
    WSubId_54(':', __ARG_1)
.annotate 'line', 5732
# var value: $P5
    $P5 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5733
# predefined push
    push $P2, $P4
.annotate 'line', 5734
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5736
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5737
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5738
    WSubId_40("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5740
    setattribute self, 'keys', $P2
.annotate 'line', 5741
    setattribute self, 'values', $P3
# }
.annotate 'line', 5742

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5743
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5746
    getattribute $P1, self, 'keys'
    WSubId_38($P1)
.annotate 'line', 5747
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5748
    .return(self)
# }
.annotate 'line', 5749

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5752
    self.'annotate'(__ARG_1)
.annotate 'line', 5757
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5758
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5760
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5761
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5762
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5763
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5764
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5765
# item: $S1
    null $S1
.annotate 'line', 5766
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5767
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5768
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5769
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5772
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5774
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5775
# itemreg: $S3
    null $S3
.annotate 'line', 5776
# it_p: $S4
    null $S4
.annotate 'line', 5777
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 5778
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 5779
# aux: $S5
    null $S5
# switch
.annotate 'line', 5780
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
.annotate 'line', 5782
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 5783
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 5784
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 5785
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 5789
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 5790
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 5791
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5792
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 5796
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 5798
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 5799
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5763
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5801

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5804
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5805
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5806
    .return($S1)
# }
.annotate 'line', 5807

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5716
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5718
    addattribute $P0, 'keys'
.annotate 'line', 5719
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5820
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5825
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5826

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5829
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5830
    if_null $P1, __label_1
.annotate 'line', 5831
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5832

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5835
    self.'optimize_initializer'()
.annotate 'line', 5836
    .return(self)
# }
.annotate 'line', 5837

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5840
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5841
    if_null $P1, __label_1
.annotate 'line', 5842
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5843
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5844
    if_null $P1, __label_2
.annotate 'line', 5845
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5846
    __ARG_1.'say'(")")
# }
.annotate 'line', 5847

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 5812
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5814
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
.annotate 'line', 5858
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5860
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 5861
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5862
    setattribute self, 'value', __ARG_4
.annotate 'line', 5863
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5865
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 5866
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5868
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5869

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5872
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5873
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5876
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5877
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5878
    $P1 = $P2.'getvalue'()
.annotate 'line', 5879
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 5880
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5881
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5884
    self.'optimize_initializer'()
.annotate 'line', 5885
    .return(self)
# }
.annotate 'line', 5886

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5889
    self.'annotate'(__ARG_1)
.annotate 'line', 5891
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5892
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5895
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5896
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
.annotate 'line', 5898
# reginit: $S1
    set $S1, ''
.annotate 'line', 5899
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5900
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5901
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
.annotate 'line', 5906
    ne $I2, 1, __label_13
# {
.annotate 'line', 5907
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5908
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5911
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5912
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5913
    concat $S1, ', ', $S1
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5917
    eq $I2, 1, __label_16
.annotate 'line', 5918
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 5919
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5920
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5923
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5926
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5927
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5928
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 5929
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_69($S5, $P8)
  __label_23: # endif
.annotate 'line', 5933
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5934
    le $I1, 1, __label_25
# {
.annotate 'line', 5935
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5939
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5940
    unless_null $P4, __label_26
# {
.annotate 'line', 5942
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5943
    if_null $P5, __label_28
# {
.annotate 'line', 5944
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5947
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.annotate 'line', 5948
    WSubId_69('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5949
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5951
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5955
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5959
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5961
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5962
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5963
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5964
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5966

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5969
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5970

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 5852
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5854
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5981
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5982
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5983
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5984
    setattribute self, 'nskey', $P1
.annotate 'line', 5985
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5986
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5987
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5989
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5990

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5993
# reginit: $S1
    null $S1
.annotate 'line', 5994
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5995
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5996
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6000
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6001
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6004
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 6006
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 6007
    __ARG_1.'print'('    ')
.annotate 'line', 6008
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 6009
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6010
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6011
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 6012
    if_null $S1, __label_8
.annotate 'line', 6013
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6014
    __ARG_1.'say'()
# }
.annotate 'line', 6015

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 5975
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5977
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6026
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6027
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6028
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6029
    setattribute self, 'nskey', $P1
.annotate 'line', 6030
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6031
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6032
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6034
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6035

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6038
# reginit: $S1
    null $S1
.annotate 'line', 6039
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6041
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 6042
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6043
    le $I1, 0, __label_4
.annotate 'line', 6044
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 6045
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6046
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 6047
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6048
    __ARG_1.'say'()
.annotate 'line', 6050
    lt $I1, 0, __label_5
# {
.annotate 'line', 6051
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6052
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6053
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 6055

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6020
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6022
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_70')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6062
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6065
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6069
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6072
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6067
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6068
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6067
    .return($P3)
  __label_4: # case
.annotate 'line', 6071
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6075
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6076
    __ARG_1.'unget'($P2)
.annotate 'line', 6077
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6079
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6084
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6086

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 6097
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6098
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6099
    $P2 = WSubId_62(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6100

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6103
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6104
    .return(self)
# }
.annotate 'line', 6105

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6106
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6109
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6110
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6111
    eq $S1, 'P', __label_2
.annotate 'line', 6112
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6113
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6115
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
.annotate 'line', 6116
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6117
    self.'annotate'(__ARG_1)
.annotate 'line', 6118
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6119
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6120
    __ARG_1.'say'()
# }
.annotate 'line', 6121

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6090
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6092
    addattribute $P0, 'lexpr'
.annotate 'line', 6093
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
.annotate 'line', 6138
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6139
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6140
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6141
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6142
    .return(self)
# }
.annotate 'line', 6143

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6146
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6147
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6149
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6151
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6153
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6154
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6155
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6157

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6160
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6161
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6162
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6164
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6165

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6168
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6169
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6170
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6171
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6172
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6173
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6174
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6176
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6177
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6178
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6179
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6180
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6181
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6183
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6184
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6185
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6186
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6189
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6191
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6192

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6126
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6132
    addattribute $P0, 'condition'
.annotate 'line', 6133
    addattribute $P0, 'etrue'
.annotate 'line', 6134
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

.sub 'getOpCode_2' :subid('WSubId_72')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6236
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
.annotate 'line', 6237
    .return(1)
  __label_4: # case
.annotate 'line', 6238
    .return(2)
  __label_5: # case
.annotate 'line', 6239
    .return(3)
  __label_2: # default
.annotate 'line', 6240
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6242

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_74')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6246
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
.annotate 'line', 6247
    .return(8)
  __label_4: # case
.annotate 'line', 6248
    .return(11)
  __label_5: # case
.annotate 'line', 6249
    .return(9)
  __label_6: # case
.annotate 'line', 6250
    .return(10)
  __label_2: # default
.annotate 'line', 6252
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6253
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6254
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6256

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_77')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6260
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
.annotate 'line', 6261
    .return(19)
  __label_4: # case
.annotate 'line', 6262
    .return(20)
  __label_5: # case
.annotate 'line', 6263
    .return(21)
  __label_6: # case
.annotate 'line', 6264
    .return(22)
  __label_2: # default
.annotate 'line', 6265
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6267

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6271
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6272
    .return(28)
  __label_4: # case
.annotate 'line', 6273
    .return(29)
  __label_2: # default
.annotate 'line', 6274
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6276

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6280
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
.annotate 'line', 6281
    .return(14)
  __label_4: # case
.annotate 'line', 6282
    .return(16)
  __label_5: # case
.annotate 'line', 6283
    .return(15)
  __label_6: # case
.annotate 'line', 6284
    .return(17)
  __label_2: # default
.annotate 'line', 6286
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6287
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6289

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_84')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6293
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
.annotate 'line', 6294
    .return(12)
  __label_4: # case
.annotate 'line', 6295
    .return(13)
  __label_5: # case
.annotate 'line', 6296
    .return(25)
  __label_6: # case
.annotate 'line', 6297
    .return(26)
  __label_2: # default
.annotate 'line', 6298
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6300

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_93')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6304
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
.annotate 'line', 6305
    .return(4)
  __label_4: # case
.annotate 'line', 6306
    .return(5)
  __label_5: # case
.annotate 'line', 6307
    .return(6)
  __label_6: # case
.annotate 'line', 6308
    .return(18)
  __label_7: # case
.annotate 'line', 6309
    .return(23)
  __label_8: # case
.annotate 'line', 6310
    .return(24)
  __label_9: # case
.annotate 'line', 6311
    .return(30)
  __label_2: # default
.annotate 'line', 6312
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6314

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 6318
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6319
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6322
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6326
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6328
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6330
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6332
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6334
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6336
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6338
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6340
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6342
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6323
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 6324
    WSubId_54(')', __ARG_1)
.annotate 'line', 6325
    .return($P2)
  __label_4: # case
.annotate 'line', 6327
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6329
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6331
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6333
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6335
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6337
    .tailcall WSubId_70(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6339
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6341
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6343
    new $P17, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P17.'IdentifierExpr'(__ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_2: # default
.annotate 'line', 6345
    WSubId_40('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6347

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6351
# var subexp: $P1
    $P1 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6352
# var t: $P2
    null $P2
.annotate 'line', 6353
# var start: $P3
    null $P3
.annotate 'line', 6354
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6355
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_72($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6356
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6358
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6361
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6364
    set $P3, $P2
.annotate 'line', 6365
    $P2 = __ARG_1.'get'()
.annotate 'line', 6366
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6367
# var right: $P4
    $P4 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6368
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6371
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6374
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6377
    __ARG_1.'unget'($P2)
.annotate 'line', 6378
    .return($P1)
# }
.annotate 'line', 6379

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
# Body
# {
.annotate 'line', 6383
# var subexp: $P1
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6384
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6386
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6388
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6387
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6389
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6391
    __ARG_1.'unget'($P2)
.annotate 'line', 6392
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6394

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 6398
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6399
# code: $I1
    $P3 = WSubId_74($P1)
    set $I1, $P3
.annotate 'line', 6400
    eq $I1, 0, __label_1
# {
.annotate 'line', 6401
# var subexpr: $P2
    $P2 = WSubId_75(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6402
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
.annotate 'line', 6404
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6406
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6408
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6410
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6412
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6414
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6416
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6420
    __ARG_1.'unget'($P1)
.annotate 'line', 6421
    .tailcall WSubId_76(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6423

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6427
# var lexpr: $P1
    $P1 = WSubId_75(__ARG_1, __ARG_2)
.annotate 'line', 6428
# var t: $P2
    null $P2
.annotate 'line', 6429
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6430
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_77($P2)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
.annotate 'line', 6431
# var rexpr: $P3
    $P3 = WSubId_75(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6432
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
.annotate 'line', 6434
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6437
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6440
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6443
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6446
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6449
    __ARG_1.'unget'($P2)
.annotate 'line', 6450
    .return($P1)
# }
.annotate 'line', 6451

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_78 = "WSubId_78"
# Body
# {
.annotate 'line', 6455
# var lexpr: $P1
    $P1 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6456
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6457
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6458
# var rexpr: $P3
    $P3 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6459
# var expr: $P4
    null $P4
.annotate 'line', 6460
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6461
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6463
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6464
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6466
    __ARG_1.'unget'($P2)
.annotate 'line', 6467
    .return($P1)
# }
.annotate 'line', 6468

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6472
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6473
# var rexpr: $P2
    null $P2
.annotate 'line', 6474
# var t: $P3
    null $P3
.annotate 'line', 6475
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6476
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_80($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6477
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6479
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6480
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6483
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6484
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6487
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6490
    __ARG_1.'unget'($P3)
.annotate 'line', 6491
    .return($P1)
# }
.annotate 'line', 6492

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6496
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6497
# var rexpr: $P2
    null $P2
.annotate 'line', 6498
# var t: $P3
    null $P3
.annotate 'line', 6499
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6500
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6501
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
.annotate 'line', 6503
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6504
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6507
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6508
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6511
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6512
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6515
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6516
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6519
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6522
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6525
    __ARG_1.'unget'($P3)
.annotate 'line', 6526
    .return($P1)
# }
.annotate 'line', 6527

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6531
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6532
# var rexpr: $P2
    null $P2
.annotate 'line', 6533
# var t: $P3
    null $P3
.annotate 'line', 6534
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6535
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_84($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6536
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
.annotate 'line', 6538
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6539
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6542
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6543
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6546
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6547
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6550
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6551
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6554
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6557
    __ARG_1.'unget'($P3)
.annotate 'line', 6558
    .return($P1)
# }
.annotate 'line', 6559

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
# Body
# {
.annotate 'line', 6563
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6564
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6565
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6566
# var rexpr: $P3
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6567
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6569
    __ARG_1.'unget'($P2)
.annotate 'line', 6570
    .return($P1)
# }
.annotate 'line', 6571

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6575
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6576
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6577
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6578
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6579
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6581
    __ARG_1.'unget'($P2)
.annotate 'line', 6582
    .return($P1)
# }
.annotate 'line', 6583

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
# Body
# {
.annotate 'line', 6587
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6588
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6589
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6590
# var rexpr: $P3
    $P3 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6591
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6593
    __ARG_1.'unget'($P2)
.annotate 'line', 6594
    .return($P1)
# }
.annotate 'line', 6595

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
# Body
# {
.annotate 'line', 6599
# var lexpr: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6600
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6601
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6602
# var rexpr: $P3
    $P3 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6603
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6605
    __ARG_1.'unget'($P2)
.annotate 'line', 6606
    .return($P1)
# }
.annotate 'line', 6607

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_88 = "WSubId_88"
# Body
# {
.annotate 'line', 6611
# var lexpr: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6612
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6613
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6614
# var rexpr: $P3
    $P3 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6615
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6617
    __ARG_1.'unget'($P2)
.annotate 'line', 6618
    .return($P1)
# }
.annotate 'line', 6619

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6623
# var econd: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6624
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6625
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6626
# var etrue: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6627
    WSubId_54(':', __ARG_1)
.annotate 'line', 6628
# var efalse: $P4
    $P4 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6629
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6632
    __ARG_1.'unget'($P2)
.annotate 'line', 6633
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6635

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6639
# var lexpr: $P1
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 6640
# var t: $P2
    null $P2
.annotate 'line', 6641
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6642
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_93($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
.annotate 'line', 6643
# var rexpr: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6644
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6645
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
.annotate 'line', 6647
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6650
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6653
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6656
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6659
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6662
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6665
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6668
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6670
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6671
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6673
    __ARG_1.'unget'($P2)
.annotate 'line', 6674
    .return($P1)
# }
.annotate 'line', 6675

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
# Body
# {
.annotate 'line', 6679
    .tailcall WSubId_91(__ARG_1, __ARG_2)
# }
.annotate 'line', 6680

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6695
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6696
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6697
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6698
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6699
    .return($S1)
# }
.annotate 'line', 6700

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6703
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6704
    unless_null $P1, __label_1
.annotate 'line', 6705
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6706
    .return($P1)
# }
.annotate 'line', 6707

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6691
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6716
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6717
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6718
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6719
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6720
    .return($S1)
# }
.annotate 'line', 6721

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6724
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6725
    unless_null $P1, __label_1
.annotate 'line', 6726
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6727
    .return($P1)
# }
.annotate 'line', 6728

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6710
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6712
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6744
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6745
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6746
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6747
    __ARG_2.'unget'($P1)
.annotate 'line', 6748
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6750

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6753
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6754
    if_null $P1, __label_1
.annotate 'line', 6755
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6756
    .return(self)
# }
.annotate 'line', 6757

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6761
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6762
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6765
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6766
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6767
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6768
    self.'annotate'(__ARG_1)
.annotate 'line', 6769
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6773
    le $I1, 0, __label_6
.annotate 'line', 6774
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6776
    self.'annotate'(__ARG_1)
.annotate 'line', 6777
    self.'emitret'(__ARG_1)
.annotate 'line', 6778
    le $I1, 0, __label_7
.annotate 'line', 6779
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6780
    __ARG_1.'say'(')')
# }
.annotate 'line', 6781

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 6738
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6740
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6788
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6789

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6792
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6793

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 6784
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
.annotate 'line', 6800
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6801

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6804
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6805

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 6796
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6818
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6819
    setattribute self, 'name', __ARG_1
.annotate 'line', 6820
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6821

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6822
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6825
    self.'annotate'(__ARG_1)
.annotate 'line', 6826
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6827

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 6812
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6814
    addattribute $P0, 'name'
.annotate 'line', 6815
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6841
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6842
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6843

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6844
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6847
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6848
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6849
    .return($S2)
# }
.annotate 'line', 6850

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 6836
    addattribute $P0, 'owner'
.annotate 'line', 6837
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6863
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6864
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6865
    WSubId_94($P1)
.annotate 'line', 6866
    setattribute self, 'label', $P1
.annotate 'line', 6867
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6868

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6869
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6872
    self.'annotate'(__ARG_1)
.annotate 'line', 6873
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6874
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6875
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6876

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 6857
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6859
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6887
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6888

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6891
    WSubId_54('(', __ARG_1)
.annotate 'line', 6892
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6893
    WSubId_54(')', __ARG_1)
# }
.annotate 'line', 6894

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 6883
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
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 6907
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6908
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6909
    $P3 = WSubId_95(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6910
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6911
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6912
    $P4 = WSubId_95(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6914
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6915
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6917

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6920
    self.'optimize_condition'()
.annotate 'line', 6921
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6922
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6923
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6925
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6927
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6929
    .return(self)
# }
.annotate 'line', 6930

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6933
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6934
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6935
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6936
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6937
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6938
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6939
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6940
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6941
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6942
    self.'annotate'(__ARG_1)
.annotate 'line', 6943
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6944
    $P1.'emit'(__ARG_1)
.annotate 'line', 6946
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6947
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6948
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6949
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6951
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6952

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 6901
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6903
    addattribute $P0, 'truebranch'
.annotate 'line', 6904
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 6964
    $P2 = WSubId_95(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6965

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6968
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6969
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6971
    self.'annotate'(__ARG_1)
.annotate 'line', 6972
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6973
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6974
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6975
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6976

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 6959
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6961
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6987
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6988
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6989
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6990

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6993
    self.'optimize_condition'()
.annotate 'line', 6994
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6995
    .return(self)
# }
.annotate 'line', 6996

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6999
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7001
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7004
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7007
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7008
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7010
    self.'annotate'(__ARG_1)
.annotate 'line', 7011
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7012
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7013
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7014
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7015
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7017

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 6983
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
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 7028
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7029
    self.'parsebody'(__ARG_2)
.annotate 'line', 7030
    WSubId_96('while', __ARG_2)
.annotate 'line', 7031
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7032

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7035
    self.'optimize_condition'()
.annotate 'line', 7036
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7037
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7038
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7039
    setattribute self, 'body', $P1
.annotate 'line', 7040
    .return(self)
# }
.annotate 'line', 7041

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7044
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7045
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7046
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7048
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7051
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7052
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7053
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7055
    self.'annotate'(__ARG_1)
.annotate 'line', 7056
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7058
    $P1.'emit'(__ARG_1)
.annotate 'line', 7059
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7060
    eq $I1, 2, __label_7
.annotate 'line', 7061
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7062
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7064

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7024
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
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7075
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7076
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7077

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7078
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7081
    self.'annotate'(__ARG_1)
.annotate 'line', 7082
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7083
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7084

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7071
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7095
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7096
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7097

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7098
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7101
    self.'annotate'(__ARG_1)
.annotate 'line', 7102
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7103
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7104

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7091
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7119
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7120
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7121
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7122
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7123

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 7126
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7127
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7128
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7129
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_37(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7130
    $P1 = __ARG_1.'get'()
.annotate 'line', 7131
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7132
    WSubId_40("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7133
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7134
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
.annotate 'line', 7135
    __ARG_1.'unget'($P1)
.annotate 'line', 7136
    $P3 = WSubId_95(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7138
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7139
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7142
    $P1 = __ARG_1.'get'()
.annotate 'line', 7143
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7144
    WSubId_40("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7145
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
.annotate 'line', 7146
    __ARG_1.'unget'($P1)
.annotate 'line', 7147
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_95(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7149
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7152
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7153
    WSubId_40("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7154

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7157
    getattribute $P2, self, 'case_value'
    WSubId_38($P2)
.annotate 'line', 7158
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7159
    WSubId_38($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7160
    getattribute $P2, self, 'default_st'
    WSubId_38($P2)
# }
.annotate 'line', 7161

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7111
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7113
    addattribute $P0, 'case_value'
.annotate 'line', 7114
    addattribute $P0, 'case_st'
.annotate 'line', 7115
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7174
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7175
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7176
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7177
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7178
    WSubId_40("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7179
    $P1 = __ARG_2.'get'()
.annotate 'line', 7180
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7181
    WSubId_40("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7182
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7183

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7186
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7187
    self.'optimize_cases'()
.annotate 'line', 7188
    .return(self)
# }
.annotate 'line', 7189

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7193
# type: $S1
    set $S1, ''
.annotate 'line', 7194
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7195
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7196
    ne $S2, 'N', __label_4
.annotate 'line', 7197
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7198
    ne $S1, '', __label_5
.annotate 'line', 7199
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7200
    eq $S1, $S2, __label_7
.annotate 'line', 7201
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7204
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7205
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7209
    ne $S1, '', __label_8
.annotate 'line', 7210
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7212
    __ARG_1.'comment'('switch')
.annotate 'line', 7213
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7214
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7215
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7217
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7218
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7222
    self.'genbreaklabel'()
.annotate 'line', 7223
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7224
    new $P4, ['ResizableStringArray']
.annotate 'line', 7225
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7226
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7227
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7228
# predefined push
    push $P4, $S7
.annotate 'line', 7229
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7230
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7232
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7235
    self.'annotate'(__ARG_1)
.annotate 'line', 7236
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7237
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7238
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7239
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7240
    $P7 = $P6[$I2]
    WSubId_52(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7238
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7243
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7244
    getattribute $P7, self, 'default_st'
    WSubId_52(__ARG_1, $P7)
.annotate 'line', 7246
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7247

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7168
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7170
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7259
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7260
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7261

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7264
    self.'optimize_cases'()
.annotate 'line', 7265
    .return(self)
# }
.annotate 'line', 7266

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7270
    self.'genbreaklabel'()
.annotate 'line', 7271
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7272
    new $P1, ['ResizableStringArray']
.annotate 'line', 7274
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7275
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7276
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7277
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7278
# predefined push
    push $P1, $S3
.annotate 'line', 7279
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7280
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7282
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7285
    self.'annotate'(__ARG_1)
.annotate 'line', 7286
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7287
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7288
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7289
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7290
    $P4 = $P3[$I2]
    WSubId_52(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7288
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7293
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7294
    getattribute $P4, self, 'default_st'
    WSubId_52(__ARG_1, $P4)
.annotate 'line', 7296
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7297

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7254
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7304
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7305
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7306
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7307
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7308
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7309
    WSubId_40("'(' in switch", $P1)
# }
.annotate 'line', 7310

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7323
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7324
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7325
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7326
    __ARG_2.'unget'($P1)
.annotate 'line', 7327
    $P3 = WSubId_95(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7329
    $P1 = __ARG_2.'get'()
.annotate 'line', 7330
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7331
    __ARG_2.'unget'($P1)
.annotate 'line', 7332
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7333
    WSubId_54(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7335
    $P1 = __ARG_2.'get'()
.annotate 'line', 7336
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7337
    __ARG_2.'unget'($P1)
.annotate 'line', 7338
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7339
    WSubId_54(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7341
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7342

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7345
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7346
    if_null $P1, __label_1
.annotate 'line', 7347
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7348
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7349
    self.'optimize_condition'()
.annotate 'line', 7350
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7351
    if_null $P1, __label_4
.annotate 'line', 7352
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7354
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7357
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7358
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7359
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7360
    .return(self)
# }
.annotate 'line', 7361

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7364
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7365
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7366
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7367
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7368
    .return()
# }
  __label_1: # endif
.annotate 'line', 7370
    __ARG_1.'comment'('for loop')
.annotate 'line', 7371
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7372
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7373
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7374
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7375
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7377
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7378
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7379
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7381
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7382
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7383
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7384
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7385
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7387
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7388

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7316
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7318
    addattribute $P0, 'initializer'
.annotate 'line', 7319
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7403
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7404
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7405
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7406
# deftype: $S2
    $P1 = WSubId_97(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7407
    self.'createvar'($S1, $S2)
.annotate 'line', 7408
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7410
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7411
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7412
    WSubId_54(')', __ARG_2)
.annotate 'line', 7413
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7414

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7417
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7421
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7422
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7423
    $P2 = $P1.'get_value'()
    set $S1, $P2
# predefined length
.annotate 'line', 7421
    length $I2, $S1
.annotate 'line', 7423
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7424
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7426
    setattribute self, 'container', $P1
.annotate 'line', 7427
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7428
    .return(self)
# }
.annotate 'line', 7429

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 7432
    self.'annotate'(__ARG_1)
.annotate 'line', 7433
# regcont: $S1
    null $S1
.annotate 'line', 7434
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7435
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7436
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7437
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7440
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7442
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7443
    unless_null $P1, __label_4
.annotate 'line', 7444
    getattribute $P2, self, 'varname'
    WSubId_61($P2)
  __label_4: # endif
.annotate 'line', 7446
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7447
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7448
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7449
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7450
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7451
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7452
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7453
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7454
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7455
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7456
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7457
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7458

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7395
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7397
    addattribute $P0, 'deftype'
.annotate 'line', 7398
    addattribute $P0, 'varname'
.annotate 'line', 7399
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7465
    WSubId_54('(', __ARG_2)
.annotate 'line', 7466
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7467
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7468
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7469
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7471
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7472
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7473
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7474
    __ARG_2.'unget'($P3)
.annotate 'line', 7475
    __ARG_2.'unget'($P2)
.annotate 'line', 7476
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7478
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7479

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7491
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7492
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7493

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7496
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7497
    .return(self)
# }
.annotate 'line', 7498

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7501
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7502
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7503
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7504
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7506
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7509
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7512
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7514

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7485
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7487
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7526
    setattribute self, 'start', __ARG_1
.annotate 'line', 7527
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7528

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7531
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7532
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7533
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7534
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7535
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
.annotate 'line', 7538
    eq $I1, 1, __label_10
.annotate 'line', 7539
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7540
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7541
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7542
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7546
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7547
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7548
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7549
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7547
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7552
# predefined join
.annotate 'line', 7551
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7555
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7558

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7521
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7523
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7570
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7571
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7572
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7573
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7575
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7577
    $P3 = WSubId_95(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7578
    $P1 = __ARG_2.'get'()
.annotate 'line', 7579
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7580
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7581
    $P1 = __ARG_2.'get'()
.annotate 'line', 7582
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7583
    WSubId_40("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7584
    $P1 = __ARG_2.'get'()
.annotate 'line', 7585
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7586
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7587
    setattribute self, 'exname', $P1
.annotate 'line', 7588
    self.'createvar'($S1, 'P')
.annotate 'line', 7589
    $P1 = __ARG_2.'get'()
.annotate 'line', 7590
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7591
    WSubId_40("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7593
    $P3 = WSubId_95(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7594

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7597
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7598
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7599
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7600
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7601
    .return(self)
# }
.annotate 'line', 7602

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7605
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7606
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7607
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7608
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7609
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7610
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7612
    self.'annotate'(__ARG_1)
.annotate 'line', 7613
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7615
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7616
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7618
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7619
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7621
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7622
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7623
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7624
    __ARG_1.'comment'('try: end')
.annotate 'line', 7625
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7627
    self.'annotate'(__ARG_1)
.annotate 'line', 7628
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7630
    __ARG_1.'comment'('catch')
.annotate 'line', 7631
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7632
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7633
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7634
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7635
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7637
    __ARG_1.'comment'('catch end')
.annotate 'line', 7638
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7639

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7561
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7563
    addattribute $P0, 'stry'
.annotate 'line', 7564
    addattribute $P0, 'modifiers'
.annotate 'line', 7565
    addattribute $P0, 'exname'
.annotate 'line', 7566
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
.annotate 'line', 7652
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7653
    setattribute self, 'name', __ARG_3
.annotate 'line', 7654
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7655
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7656

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7646
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7648
    addattribute $P0, 'name'
.annotate 'line', 7649
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
.annotate 'line', 7671
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7672
    setattribute self, 'name', __ARG_3
.annotate 'line', 7673
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7674

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7663
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7665
    addattribute $P0, 'name'
.annotate 'line', 7666
    addattribute $P0, 'basetype'
.annotate 'line', 7667
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7685
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7686
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7687
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7688
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7689
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7691
    $P5 = WSubId_37(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7694
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7695

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7698
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7699
    if_null $P1, __label_1
.annotate 'line', 7700
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7701
    .return(self)
# }
.annotate 'line', 7702

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7705
    self.'annotate'(__ARG_1)
.annotate 'line', 7706
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7707
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7708
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7709
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7710
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7712
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7713
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7715
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7716
    ne $S4, $S3, __label_8
.annotate 'line', 7717
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7719
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 7721
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7724
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7725
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 7727
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 7729
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 7732
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7733
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 7735
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7736
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 7737
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7738
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7739
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7740
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 7743
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7747

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7679
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7681
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
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 7762
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7763
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7764
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7765
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7766
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7767
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7769
    __ARG_6.'unget'($P2)
.annotate 'line', 7770
    $P4 = WSubId_37(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7771
    WSubId_54(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7773
    $P2 = __ARG_6.'get'()
.annotate 'line', 7774
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7775
    $P2 = __ARG_6.'get'()
.annotate 'line', 7776
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7777
    WSubId_40("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7778
    $P2 = __ARG_6.'get'()
.annotate 'line', 7779
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7780
    __ARG_6.'unget'($P2)
.annotate 'line', 7781
    $P4 = WSubId_36(__ARG_6, self, WSubId_37, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7785
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7786

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7789
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7790
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 7791
    getattribute $P1, self, 'initarray'
    WSubId_38($P1)
.annotate 'line', 7792
    .return(self)
# }
.annotate 'line', 7793

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7796
    self.'annotate'(__ARG_1)
.annotate 'line', 7798
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7799
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7800
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7801
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7802
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7803
    if_null $P2, __label_1
# {
.annotate 'line', 7805
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7806
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7810
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7812
    if_null $P3, __label_4
# {
.annotate 'line', 7813
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7814
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7815
    unless_null $P2, __label_6
# {
.annotate 'line', 7816
    le $I1, 0, __label_7
# {
.annotate 'line', 7818
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7821
# i: $I2
    null $I2
.annotate 'line', 7822
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7823
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7824
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7825
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7828

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 7752
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7754
    addattribute $P0, 'size'
.annotate 'line', 7755
    addattribute $P0, 'initarray'
.annotate 'line', 7756
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 7835
# var next: $P1
    null $P1
.annotate 'line', 7836
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7837
# {
.annotate 'line', 7838
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7839
    WSubId_94($P3)
.annotate 'line', 7840
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7841
# var item: $P5
    null $P5
.annotate 'line', 7842
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 7843
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7845
    __ARG_4.'unget'($P4)
.annotate 'line', 7846
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7848
    $P2 = WSubId_98($P2, $P5)
.annotate 'line', 7849
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7850
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 7851
    WSubId_4(';', $P1)
.annotate 'line', 7852
    .return($P2)
# }
.annotate 'line', 7853

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7861
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7862

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 7857
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
.annotate 'line', 7869
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7870

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 7865
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7876
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7877

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7881
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7882

.end # newIntArray


.sub 'parseInt' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_101 = "WSubId_101"
# Body
# {
.annotate 'line', 7886
    .tailcall WSubId_99(WSubId_100, WSubId_101, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7887

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7895
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7896

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 7891
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
.annotate 'line', 7903
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7904

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 7899
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7910
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7911

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7915
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7916

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 7920
    .tailcall WSubId_99(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7921

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7929
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7930

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 7925
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
.annotate 'line', 7937
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7938

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 7933
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7944
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7945

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7949
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7950

.end # newStringArray


.sub 'parseString' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 7954
    .tailcall WSubId_99(WSubId_104, WSubId_105, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7955

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
.annotate 'line', 7971
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7972
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7973
    setattribute self, 'name', __ARG_4
.annotate 'line', 7974
    setattribute self, 'value', __ARG_5
.annotate 'line', 7975
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7976

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7979
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7980
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7981
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7982
    $P1 = $P1.'optimize'()
.annotate 'line', 7983
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 7984
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 7987
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7988
    .return(self)
# }
.annotate 'line', 7989

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7992
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 7993

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7996
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7997

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 7961
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7963
    addattribute $P0, 'type'
.annotate 'line', 7964
    addattribute $P0, 'name'
.annotate 'line', 7965
    addattribute $P0, 'data'
.annotate 'line', 7966
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 8002
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8003
# type: $S1
    $P5 = WSubId_97($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8004
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8005
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8007
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8008
# {
.annotate 'line', 8009
    $P1 = __ARG_2.'get'()
.annotate 'line', 8010
# var name: $P3
    set $P3, $P1
.annotate 'line', 8011
    WSubId_54('=', __ARG_2)
.annotate 'line', 8012
# var value: $P4
    $P4 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 8014
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8013
    $P2 = WSubId_98($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8015
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8016
    .return($P2)
# }
.annotate 'line', 8017

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8028
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8029
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8030
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8031
    $P4 = WSubId_37(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8032
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8034
    WSubId_4(';', $P1)
# }
.annotate 'line', 8035

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8038
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8039
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8040
    .return(self)
# }
.annotate 'line', 8041

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8044
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8045

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8048
    self.'annotate'(__ARG_1)
.annotate 'line', 8049
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8050
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8051
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8052
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8053
    if_null $P1, __label_3
.annotate 'line', 8054
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8055
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8056
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8057
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
.annotate 'line', 8059
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8060
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8062
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8067
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8068
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8071
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8073
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8077
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8078

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8023
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8025
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 8085
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8086
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 8087

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8090
    self.'annotate'(__ARG_1)
.annotate 'line', 8091
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8092
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8093
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8094

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8081
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 8103
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8104
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8105
    WSubId_54(']', __ARG_2)
.annotate 'line', 8106
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 8107

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8110
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8111
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8112

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8115
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8116
    self.'annotate'(__ARG_1)
.annotate 'line', 8117
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8118
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8119
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8120

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8097
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8099
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 8125
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8126
    WSubId_94($P1)
.annotate 'line', 8127
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8128
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8129
    $P2 = __ARG_2.'get'()
.annotate 'line', 8130
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8131
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8133
    __ARG_2.'unget'($P2)
.annotate 'line', 8134
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
.annotate 'line', 8138
    __ARG_2.'unget'($P2)
.annotate 'line', 8139
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8141

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 8145
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8146
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8147
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8148
    .tailcall WSubId_46(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8149

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8162
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8163
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8164
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8165
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8166
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8167
    __ARG_2.'unget'($P1)
.annotate 'line', 8168
# var c: $P2
    $P2 = WSubId_95(__ARG_2, self)
.annotate 'line', 8169
    unless_null $P2, __label_3
.annotate 'line', 8170
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8171
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8173
    setattribute self, 'end', $P1
# }
.annotate 'line', 8174

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8177
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8178
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8179
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8180
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8181
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8182
    .return($S2)
# }
.annotate 'line', 8183

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8186
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8187
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8188
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8189
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8190
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8191
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8192
    $P1[$S1] = $S3
.annotate 'line', 8193
    .return($S3)
# }
.annotate 'line', 8194

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8195
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8198
    __ARG_1.'comment'('{')
.annotate 'line', 8199
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8200
    $P1.'emit'(__ARG_1)
.annotate 'line', 8201
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8203
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8204

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8155
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8157
    addattribute $P0, 'end'
.annotate 'line', 8158
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8219
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8221
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8222
    new $P1, ['ResizableStringArray']
.annotate 'line', 8223
    new $P2, ['ResizableStringArray']
.annotate 'line', 8224
    setattribute self, 'tempreg', $P1
.annotate 'line', 8225
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8226

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8229
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8230
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8231
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8232
    assign $P1, $I1
# predefined string
.annotate 'line', 8233
    getattribute $P2, self, 'type'
.annotate 'line', 8228
    set $S2, $P2
.annotate 'line', 8233
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8234

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8237
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8238
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8239
# reg: $S1
    null $S1
.annotate 'line', 8240
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8241
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8243
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8244
# predefined push
    push $P2, $S1
.annotate 'line', 8245
    .return($S1)
# }
.annotate 'line', 8246

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8249
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8250
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8251
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8252
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8253
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8254
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8252
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8256
    assign $P2, 0
# }
.annotate 'line', 8257

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8213
    addattribute $P0, 'type'
.annotate 'line', 8214
    addattribute $P0, 'nreg'
.annotate 'line', 8215
    addattribute $P0, 'tempreg'
.annotate 'line', 8216
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8268
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8269

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8272
# var named: $P1
    null $P1
.annotate 'line', 8273
# var slurpy: $P2
    null $P2
.annotate 'line', 8274
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8275
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8276
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8277
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8279
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8282
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8285
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8289
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8296
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8313
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8294
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8297
# setname: $S2
    null $S2
# switch
.annotate 'line', 8298
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8300
    concat $S2, "'", __ARG_3
    concat $S2, $S2, "'"
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8303
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8304
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8305
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8306
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8309
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8311
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8314
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8315
# }
.annotate 'line', 8317

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8264
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_97 = "WSubId_97"
# Body
# {
.annotate 'line', 8327
    setattribute self, 'func', __ARG_1
.annotate 'line', 8328
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8329
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_97($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8330
    eq $S1, '', __label_2
.annotate 'line', 8331
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8333
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8334
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8335
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8337
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8338
    $P1 = __ARG_2.'get'()
.annotate 'line', 8339
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8340
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8342
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8343

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 8346
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8347
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8348
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8349
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_106($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8350
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8351
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8352
    if_null $P3, __label_3
.annotate 'line', 8353
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8354
    __ARG_1.'say'('')
# }
.annotate 'line', 8355

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8322
    addattribute $P0, 'func'
.annotate 'line', 8323
    addattribute $P0, 'name'
.annotate 'line', 8324
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8360
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8361

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8372
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8373
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8374

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8377
# var ns: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 8378
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 8379
# key: $S1
    null $S1
.annotate 'line', 8380
# predefined elements
    elements $I1, $P2
    le $I1, 0, __label_1
.annotate 'line', 8381
    $P3 = WSubId_58($P2)
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8382
# reg: $S2
    $P3 = __ARG_2.'tempreg'('P')
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8383
    getattribute $P3, self, 'name'
    __ARG_1.'emitget_hll_global'($S2, $P3, $S1)
.annotate 'line', 8384
    .return($S2)
# }
.annotate 'line', 8385

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8367
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8369
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8396
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8397

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8400
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8401
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8402
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8403
    le $I1, 0, __label_3
# {
.annotate 'line', 8404
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8405
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8406
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8407
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8408
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8409
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8405
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8411
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8414

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8392
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8437
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8438
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8439
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8440
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8441
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8442
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8443

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8445
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8449
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8450
    unless_null $P1, __label_1
.annotate 'line', 8451
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8452
    .return($P1)
# }
.annotate 'line', 8453

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8456
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8457
    unless_null $P1, __label_1
.annotate 'line', 8458
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8459
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8460

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8464
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8465
    .return($I1)
# }
.annotate 'line', 8466

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_107 = "WSubId_107"
# Body
# {
.annotate 'line', 8469
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8470
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8471
    __ARG_1.'unget'($P1)
.annotate 'line', 8472
    $P3 = WSubId_36(__ARG_1, self, WSubId_107, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8474

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8478
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8479
    unless_null $P1, __label_1
.annotate 'line', 8480
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8482
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8483

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8486
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8487
    unless_null $P1, __label_1
# {
.annotate 'line', 8489
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8492
    if_null $P1, __label_4
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8493
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8494
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8495
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8497

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8500
# var found: $P1
    null $P1
.annotate 'line', 8501
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8502
    $P1 = $P2.'findsymbol'(__ARG_1)
.annotate 'line', 8503
    if_null $P1, __label_3
.annotate 'line', 8504
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8506
    getattribute $P3, self, 'owner'
    .tailcall $P3.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8507

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8511
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 8512
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8513
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8514
    .return(self)
# }
.annotate 'line', 8515

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8519
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8520
    unless_null $P1, __label_1
.annotate 'line', 8521
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8522
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8523

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8526
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8527
    unless_null $P1, __label_1
.annotate 'line', 8528
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8529
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8530

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8535
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8536
# lexname: $S1
    null $S1
.annotate 'line', 8537
    if_null $P1, __label_1
.annotate 'line', 8538
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8540
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8541
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8542
# predefined string
    set $S3, $I1
    concat $S1, '__WLEX_', $S3
.annotate 'line', 8543
    self.'setlex'($S1, $S2)
.annotate 'line', 8544
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8546
    .return($S1)
# }
.annotate 'line', 8547

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8551
# var store: $P1
    null $P1
# switch
.annotate 'line', 8552
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
.annotate 'line', 8554
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8556
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8558
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8560
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8562
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8564
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8565
    .return($S1)
# }
.annotate 'line', 8566

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8569
# var store: $P1
    null $P1
# switch
.annotate 'line', 8570
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
.annotate 'line', 8572
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8574
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8576
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8578
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8580
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8582
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8583
    .return($S1)
# }
.annotate 'line', 8584

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8587
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
.annotate 'line', 8588
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8589

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8592
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8591
    set $S1, $I1
.annotate 'line', 8593
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8594

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8597
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8598

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8601
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8602

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 8606
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 8607
    __ARG_1.'say'()
.annotate 'line', 8608
    __ARG_1.'print'(".sub ")
.annotate 'line', 8609
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 8610
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8612
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8613
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 8614
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 8615
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 8616
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8617
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8618
    if_null $P2, __label_6
.annotate 'line', 8619
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8623
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 8624
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8625
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8626
    if_null $P3, __label_8
.annotate 'line', 8627
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8629
    ne $S1, 'main', __label_10
.annotate 'line', 8630
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8632
    __ARG_1.'say'()
.annotate 'line', 8635
    getattribute $P8, self, 'params'
    WSubId_52(__ARG_1, $P8)
.annotate 'line', 8637
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8638
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8639
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8640
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 8642
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 8643
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 8645
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 8646
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 8647
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 8648
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 8652
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 8654
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 8657
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8658
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 8659
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 8661
    __ARG_1.'comment'('Body')
.annotate 'line', 8662
    $P6.'emit'(__ARG_1)
.annotate 'line', 8663
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 8665
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8668
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 8669
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 8670

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8417
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8419
    addattribute $P0, 'name'
.annotate 'line', 8420
    addattribute $P0, 'subid'
.annotate 'line', 8421
    addattribute $P0, 'modifiers'
.annotate 'line', 8422
    addattribute $P0, 'params'
.annotate 'line', 8423
    addattribute $P0, 'body'
.annotate 'line', 8424
    addattribute $P0, 'regstI'
.annotate 'line', 8425
    addattribute $P0, 'regstN'
.annotate 'line', 8426
    addattribute $P0, 'regstS'
.annotate 'line', 8427
    addattribute $P0, 'regstP'
.annotate 'line', 8428
    addattribute $P0, 'nlabel'
.annotate 'line', 8429
    addattribute $P0, 'localfun'
.annotate 'line', 8430
    addattribute $P0, 'lexicals'
.annotate 'line', 8431
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8432
    addattribute $P0, 'usedsubids'
.annotate 'line', 8433
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8684
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8685
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8686
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8687
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8688

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8690
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8694
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8692
    set $I1, $P1
.annotate 'line', 8694
    .return($I1)
# }
.annotate 'line', 8695

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8699
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8697
    set $I1, $P1
.annotate 'line', 8699
    .return($I1)
# }
.annotate 'line', 8700

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8701
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 8705
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8706
    setattribute self, 'name', $P1
.annotate 'line', 8707
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8708
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8709
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8710
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8712
    WSubId_4('(', $P2)
.annotate 'line', 8713
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8715
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8716
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8717
# predefined join
    join $S1, '.', $P3
    WSubId_108(self, '__FUNCTION__', $S1)
.annotate 'line', 8719
    $P2 = __ARG_1.'get'()
.annotate 'line', 8720
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 8721
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 8722
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8723
    .return(self)
# }
.annotate 'line', 8724

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8677
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8679
    addattribute $P0, 'paramnum'
.annotate 'line', 8680
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
.annotate 'line', 8735
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8736
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8737
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8738
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8739
    setattribute self, 'name', $P1
.annotate 'line', 8740
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8741
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8742
    WSubId_4('{', $P2)
.annotate 'line', 8743
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8744
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8745

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8746
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8747
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 8750
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 8751
    .return(1)
  __label_1: # endif
.annotate 'line', 8752
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 8753
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 8754
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8755
    .return(0)
# }
.annotate 'line', 8756

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8759
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8760

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8764
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8765

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8769
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8770

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8773
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 8774
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 8775
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 8777
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 8778
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 8779
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 8780
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 8781
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 8782
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 8783
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 8784
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 8785
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8786
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 8787
    eq $S3, 'P', __label_8
.annotate 'line', 8788
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 8789
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 8790
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 8791
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 8792
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 8795
    .return(__ARG_2)
# }
.annotate 'line', 8796

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8799
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8800
    unless_null $P1, __label_1
.annotate 'line', 8801
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8802
    unless_null $P1, __label_2
# {
.annotate 'line', 8805
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 8806
    unless_null $P1, __label_3
# {
.annotate 'line', 8808
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 8809
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8810
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 8811
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 8812
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8813
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 8814
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8818
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8820
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 8821
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 8822
    .return($P1)
# }
.annotate 'line', 8823

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 8731
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
.annotate 'line', 8834
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8835

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8836
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 8830
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_97 = "WSubId_97"
# Body
# {
.annotate 'line', 8850
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8851
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8852
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 8853
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8854
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8855
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_97($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8856
    set $P1, $P2
.annotate 'line', 8857
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8858
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8860
    setattribute self, 'name', $P1
.annotate 'line', 8861
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8862
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8863
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8864
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 8866
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8867

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8870
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8871
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8872
    if_null $P1, __label_1
# {
.annotate 'line', 8873
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8874
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8876

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 8845
    addattribute $P0, 'name'
.annotate 'line', 8846
    addattribute $P0, 'modifiers'
.annotate 'line', 8847
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8881
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8882

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 8889
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_109, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 8890

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8893
    __ARG_1.'print'('(')
.annotate 'line', 8894
# sep: $S1
    set $S1, ''
.annotate 'line', 8895
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8896
    __ARG_1.'print'($S1)
.annotate 'line', 8897
    $P1.'emit'(__ARG_1)
.annotate 'line', 8898
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8900
    __ARG_1.'print'(')')
# }
.annotate 'line', 8901

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 8886
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
.annotate 'line', 8910
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8911
    setattribute self, 'params', __ARG_3
.annotate 'line', 8912
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 8913

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8916
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8917
    .return(self)
# }
.annotate 'line', 8918

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8921
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8922
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 8923
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 8924
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8925
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8926
    __ARG_1.'print'('    ')
.annotate 'line', 8927
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8928
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8929
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8930
    __ARG_1.'say'()
# }
.annotate 'line', 8931

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 8904
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8906
    addattribute $P0, 'params'
.annotate 'line', 8907
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
.annotate 'line', 8948
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8949

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8950
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8954
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8955

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 8944
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8963
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8964
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8965

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8966
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8970
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8971
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8972

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 8958
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8960
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8981
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8982
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8983
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8984
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8985
    WSubId_40('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8986
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8987
    $P2 = __ARG_1.'get'()
.annotate 'line', 8988
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8989
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8991
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8995
    WSubId_41('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8997
# {
.annotate 'line', 8998
    $P2 = __ARG_1.'get'()
.annotate 'line', 8999
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9000
    WSubId_40('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9001
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9002
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9003
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9005
    setattribute self, 'key', $P1
# }
.annotate 'line', 9006

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9007
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 9010
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9011

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 9015
    getattribute $P2, self, 'key'
    $P1 = WSubId_58($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9016

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 8975
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8977
    addattribute $P0, 'key'
.annotate 'line', 8978
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9024
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9025
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 9026
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9027
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9028
    $P2 = __ARG_1.'get'()
.annotate 'line', 9029
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9031
    __ARG_1.'unget'($P2)
.annotate 'line', 9032
    setattribute self, 'key', $P1
# }
.annotate 'line', 9033

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9034
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9038
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9039
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9040

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 9044
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 9045
    unless_null $P1, __label_1
# {
.annotate 'line', 9046
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9047
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_69($S2)
  __label_3: # endif
.annotate 'line', 9048
    getattribute $P3, self, 'key'
    $P2 = WSubId_58($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9050
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9051

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9019
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9021
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9056
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9057
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9058
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9059
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9060
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9061
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9062
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9063
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9064

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9076
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9077
    setattribute self, 'name', __ARG_2
.annotate 'line', 9078
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9079
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 9080
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9081

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 9084
    getattribute $P1, self, 'classns'
    .tailcall WSubId_58($P1)
# }
.annotate 'line', 9085

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9070
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9072
    addattribute $P0, 'name'
.annotate 'line', 9073
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9098
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9099
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9100
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9101
    setattribute self, 'functions', $P1
.annotate 'line', 9102
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9103
    setattribute self, 'members', $P2
.annotate 'line', 9104
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9105
    setattribute self, 'constants', $P3
.annotate 'line', 9107
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 9108
    $P8 = $P4.'isop'(':')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 9109
    $P10 = WSubId_36(__ARG_4, self, WSubId_62)
    setattribute self, 'bases', $P10
.annotate 'line', 9110
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9112
    WSubId_4('{', $P4)
# for loop
.annotate 'line', 9113
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9114
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
.annotate 'line', 9116
# var f: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 9117
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9120
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 9121
    $P10 = $P6.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 9122
    WSubId_40("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 9123
# predefined push
    push $P2, $P6
.annotate 'line', 9124
    $P4 = __ARG_4.'get'()
.annotate 'line', 9125
    $P11 = $P4.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 9126
    WSubId_40("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9129
# var cst: $P7
    $P7 = WSubId_44($P4, __ARG_4, self)
.annotate 'line', 9130
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9133
    WSubId_41("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9113
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9136

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9139
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9140

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9143
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9144

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9147
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 9148

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9151
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 9152

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9155
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9156

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9159
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9160

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9163
    getattribute $P1, self, 'constants'
    WSubId_38($P1)
.annotate 'line', 9164
    getattribute $P1, self, 'functions'
    WSubId_38($P1)
.annotate 'line', 9165
    .return(self)
# }
.annotate 'line', 9166

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9169
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 9170
    $P4 = WSubId_110($P1)
    __ARG_1.'say'($P4)
.annotate 'line', 9171
    getattribute $P4, self, 'functions'
    WSubId_52(__ARG_1, $P4)
.annotate 'line', 9173
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9175
    $P4 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P4)
.annotate 'line', 9176
# n: $I1
    set $I1, 1
.annotate 'line', 9177
    getattribute $P4, self, 'bases'
    if_null $P4, __label_2
    iter $P5, $P4
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $P2, $P5
# {
.annotate 'line', 9178
    $P2.'annotate'(__ARG_1)
.annotate 'line', 9179
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9180
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9181
    getattribute $P4, self, 'parent'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 9182
    __ARG_1.'say'()
.annotate 'line', 9183
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9185
    getattribute $P4, self, 'members'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
# {
.annotate 'line', 9186
    __ARG_1.'annotate'($P3)
.annotate 'line', 9187
    __ARG_1.'say'('    ', "addattribute $P0, '", $P3, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9190
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9191

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9088
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9090
    addattribute $P0, 'parent'
.annotate 'line', 9091
    addattribute $P0, 'bases'
.annotate 'line', 9092
    addattribute $P0, 'constants'
.annotate 'line', 9093
    addattribute $P0, 'functions'
.annotate 'line', 9094
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9198
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9199

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9202
    .return(self)
# }
.annotate 'line', 9203

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9194
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9211
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9212
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9213
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9214
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9215
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9216
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9214
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.annotate 'line', 9218
    WSubId_4(';', $P2)
.annotate 'line', 9219
    new $P4, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9222
    __ARG_2.'unget'($P2)
.annotate 'line', 9223
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9225

.end # parseClass


.sub 'include_parrot' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9233
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9234
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.annotate 'line', 9235
    WSubId_40('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9236
    WSubId_54(';', __ARG_2)
.annotate 'line', 9237
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9238
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9243
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9244
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9245
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9246
    if_null $P4, __label_4
    iter $P8, $P4
    set $P8, 0
  __label_3: # for iteration
    unless $P8 goto __label_4
    shift $S2, $P8
# {
.annotate 'line', 9247
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9248
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9249
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9250
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9248
# catch
  __label_5:
    .get_results($P9)
    finalize $P9
    pop_eh
# catch end
  __label_6:
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9255
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.annotate 'line', 9256
    WSubId_1('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9261
# line: $S4
    $P7 = $P5.'readline'()
    null $S4
    if_null $P7, __label_11
    set $S4, $P7
  __label_11:
  __label_10: # for condition
    $P9 = $P5.'eof'()
    isfalse $I4, $P9
    unless $I4 goto __label_9
# {
.annotate 'line', 9262
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9263
# pos: $I1
    set $I1, 12
.annotate 'line', 9264
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9265
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9266
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9267
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9268
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9269
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9270
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9271
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9273
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9274
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9275
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9276
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9277
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9278
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9279
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9280
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9282
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9284
# ivalue: $I3
    null $I3
.annotate 'line', 9285
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9286
# predefined substr
    substr $S10, $S7, 2
    box $P9, $S10
    $P7 = $P9.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9288
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9289
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9291
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P11, __ARG_1, 'file'
    getattribute $P12, __ARG_1, 'line'
    $P10.'TokenInteger'($P11, $P12, $S6)
    set $P9, $P10
.annotate 'line', 9290
    $P7 = WSubId_21(__ARG_3, $P9, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9261
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9295
    $P5.'close'()
# }
.annotate 'line', 9296

.end # include_parrot


.sub 'parsensUsing' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 9302
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9303
    $P7 = $P1.'iskeyword'('namespace')
    if_null $P7, __label_1
    unless $P7 goto __label_1
# {
.annotate 'line', 9304
# var nskey: $P2
    $P2 = WSubId_55(__ARG_2)
.annotate 'line', 9305
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9306
    ge $I1, 1, __label_2
.annotate 'line', 9307
    WSubId_1('Unsupported', $P1)
  __label_2: # endif
.annotate 'line', 9308
    WSubId_54(';', __ARG_2)
.annotate 'line', 9309
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9310
    unless_null $P3, __label_3
.annotate 'line', 9311
    WSubId_1('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9312
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9313
    .return()
# }
  __label_1: # endif
.annotate 'line', 9315
    $P7 = $P1.'iskeyword'('extern')
    isfalse $I3, $P7
    unless $I3 goto __label_4
# {
.annotate 'line', 9316
    __ARG_2.'unget'($P1)
.annotate 'line', 9317
# var key: $P4
    $P4 = WSubId_55(__ARG_2)
.annotate 'line', 9318
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9319
    ge $I2, 1, __label_5
.annotate 'line', 9320
    WSubId_1('Unsupported at namespace level', $P1)
  __label_5: # endif
.annotate 'line', 9321
    WSubId_54(';', __ARG_2)
.annotate 'line', 9322
    __ARG_3.'use'($P4)
.annotate 'line', 9323
    .return()
# }
  __label_4: # endif
.annotate 'line', 9325
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9327
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9333
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9329
# reqlib: $S1
    set $P7, $P1
    null $S1
    if_null $P7, __label_10
    set $S1, $P7
  __label_10:
.annotate 'line', 9330
    __ARG_3.'addlib'($S1)
.annotate 'line', 9331
    WSubId_54(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9334
    __ARG_2.'unget'($P1)
.annotate 'line', 9335
# var module: $P5
    $P5 = WSubId_55(__ARG_2)
.annotate 'line', 9336
    $P1 = __ARG_2.'get'()
.annotate 'line', 9337
    $P8 = $P1.'isop'(';')
    isfalse $I4, $P8
    unless $I4 goto __label_11
# {
.annotate 'line', 9338
    __ARG_2.'unget'($P1)
.annotate 'line', 9339
# var names: $P6
    null $P7
    $P6 = WSubId_36(__ARG_2, $P7, WSubId_57, ';')
.annotate 'line', 9340
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9342
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9343
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9346
    WSubId_40('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9348

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9358
    setattribute self, 'module', __ARG_1
.annotate 'line', 9359
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9360

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9365
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9373
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9374
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9375
    __ARG_1.'say'("']")
.annotate 'line', 9376
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9377
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9378
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9384

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9354
    addattribute $P0, 'module'
.annotate 'line', 9355
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9403
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9404
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9405
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9406
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9407
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9408
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9411
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9412
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9413
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9414
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9415
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9417
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9418

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9421
# var ns: $P1
    null $P1
.annotate 'line', 9422
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9423
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9424
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9425
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9426
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9427

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9430
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9431

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9434
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9435
    .return()
  __label_1: # endif
.annotate 'line', 9436
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9437
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9438
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9439
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9440
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9441

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9444
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9445
    if_null $P1, __label_1
# {
.annotate 'line', 9446
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9447
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9450
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9451
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9452
    if_null $P2, __label_5
# {
.annotate 'line', 9453
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9454
    if_null $P1, __label_6
.annotate 'line', 9455
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9458

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9461
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9462
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9463
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9464
    .return($P2)
# }
.annotate 'line', 9465

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9468
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9469
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9470
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9471
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9472

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9476
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9477
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9478
    unless_null $P2, __label_1
.annotate 'line', 9479
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9481
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9482

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9486
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9487
# var cl: $P2
    null $P2
.annotate 'line', 9488
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9489
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9490
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9491
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9492
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9493
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9494
    .return($P5)
# }
.annotate 'line', 9495

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9500
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9501
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9503
    .return($P3)
  __label_4: # case
.annotate 'line', 9506
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9511
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9512
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9513
    if_null $P1, __label_5
# {
.annotate 'line', 9514
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9515
    if_null $P2, __label_6
.annotate 'line', 9516
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9519
    .return($P3)
# }
.annotate 'line', 9520

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9523
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9524
    if_null $P1, __label_1
.annotate 'line', 9525
    .return($P1)
  __label_1: # endif
.annotate 'line', 9526
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9527
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9528
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9529
    .return($P2)
# }
.annotate 'line', 9530

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9535
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9536
# name: $S1
    null $S1
.annotate 'line', 9537
# var sym: $P1
    null $P1
.annotate 'line', 9538
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9539
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9541
    .return($P3)
  __label_4: # case
.annotate 'line', 9543
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9545
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9546
    .return($P1)
  __label_5: # endif
.annotate 'line', 9547
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_7
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9548
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9549
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9555
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9556
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9557
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9558
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9559
    .return($P1)
  __label_9: # endif
.annotate 'line', 9560
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9561
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9562
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9563
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9565
    .return($P3)
# }
.annotate 'line', 9566

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9569
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9570
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9572
    .return($P2)
  __label_2: # default
.annotate 'line', 9574
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9575
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9576
    if_null $P1, __label_4
# {
.annotate 'line', 9577
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9578
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9580
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9583
    .return($P2)
# }
.annotate 'line', 9584

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9587
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9588
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9589
    .return($P1)
# }
.annotate 'line', 9590

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9593
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9594
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9595
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9596
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9597
    .return($P2)
# }
.annotate 'line', 9598

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9601
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9602

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9605
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9606
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9607

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9610
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9611
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9612
    $P1 = __ARG_2.'get'()
.annotate 'line', 9614
# var modifier: $P2
    null $P2
.annotate 'line', 9615
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9616
    new $P5, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9617
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.annotate 'line', 9620
    WSubId_4('{', $P1)
.annotate 'line', 9621
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9622
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9623

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9626
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9627
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9628
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9629
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9630
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
.annotate 'line', 9632
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
    set $S2, '$load'
    if $S1 == $S2 goto __label_14
    set $S2, '$loadlib'
    if $S1 == $S2 goto __label_15
    goto __label_6
  __label_7: # case
.annotate 'line', 9634
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9637
# var cst: $P5
    $P5 = WSubId_44($P4, __ARG_1, self)
.annotate 'line', 9638
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9641
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9642
# predefined push
    push $P2, $P6
.annotate 'line', 9643
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9646
    WSubId_111($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9649
# var t1: $P7
    $P7 = __ARG_1.'get'()
.annotate 'line', 9650
    $P10 = $P7.'iskeyword'('function')
    isfalse $I3, $P10
    unless $I3 goto __label_16
.annotate 'line', 9651
    WSubId_1('Unsupported extern', $P7)
  __label_16: # endif
.annotate 'line', 9652
    $P7 = __ARG_1.'get'()
.annotate 'line', 9653
    WSubId_94($P7)
.annotate 'line', 9654
    WSubId_54(';', __ARG_1)
.annotate 'line', 9655
# var fex: $P8
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P8.'FunctionExtern'($P7, self)
.annotate 'line', 9656
# predefined push
    push $P2, $P8
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9659
    WSubId_112($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9662
    WSubId_113($P4, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9665
    $P4 = __ARG_1.'get'()
.annotate 'line', 9666
    $P11 = $P4.'isstring'()
    isfalse $I4, $P11
    unless $I4 goto __label_17
.annotate 'line', 9667
    WSubId_40('string literal', $P4)
  __label_17: # endif
.annotate 'line', 9668
    WSubId_54(';', __ARG_1)
.annotate 'line', 9669
    new $P14, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P14.'StringLiteral'(self, $P4)
    set $P13, $P14
    $P12 = $P13.'getPirString'()
    self.'addload'($P12)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 9672
    $P4 = __ARG_1.'get'()
.annotate 'line', 9673
    $P15 = $P4.'isstring'()
    isfalse $I5, $P15
    unless $I5 goto __label_18
.annotate 'line', 9674
    WSubId_40('string literal', $P4)
  __label_18: # endif
.annotate 'line', 9675
    WSubId_54(';', __ARG_1)
.annotate 'line', 9676
    new $P18, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addlib'($P16)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9679
    WSubId_41("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9630
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9682
    $P9 = $P4.'iseof'()
    if_null $P9, __label_19
    unless $P9 goto __label_19
.annotate 'line', 9683
    self.'unclosed_ns'()
    goto __label_20
  __label_19: # else
.annotate 'line', 9685
    self.'close_ns'($P4)
  __label_20: # endif
# }
.annotate 'line', 9686

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9689
    getattribute $P1, self, 'items'
    WSubId_38($P1)
# }
.annotate 'line', 9690

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9693
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9694
# s: $S1
    $P4 = WSubId_110($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9696
# activate: $I1
    set $I1, 1
.annotate 'line', 9698
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9699
    if_null $P2, __label_2
# {
.annotate 'line', 9700
    __ARG_1.'say'($S1)
.annotate 'line', 9701
    null $I1
.annotate 'line', 9702
    WSubId_52(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9705
    getattribute $P4, self, 'items'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
# {
.annotate 'line', 9706
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9707
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9708
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9710
    unless $I1 goto __label_8
# {
.annotate 'line', 9711
    __ARG_1.'say'($S1)
.annotate 'line', 9712
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9714
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9716

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9391
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9393
    addattribute $P0, 'nspath'
.annotate 'line', 9394
    addattribute $P0, 'externals'
.annotate 'line', 9395
    addattribute $P0, 'namespaces'
.annotate 'line', 9396
    addattribute $P0, 'classes'
.annotate 'line', 9397
    addattribute $P0, 'functions'
.annotate 'line', 9398
    addattribute $P0, 'items'
.annotate 'line', 9399
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
.annotate 'line', 9734
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9735
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9736
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9738
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9739
    setattribute self, 'start', __ARG_2
.annotate 'line', 9740
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9741
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9742
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9743
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9744
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9745
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9747

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9750
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9751

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9754
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9755

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9758
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9759

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9762
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9763

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9766
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9767

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9770
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9771
    unless_null $P1, __label_1
.annotate 'line', 9772
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9773
    .return($P1)
# }
.annotate 'line', 9774

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9779
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9780
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9781
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9782
    .return($P1)
# }
.annotate 'line', 9783

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9786
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9787
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9788
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9789
    .return($P1)
# }
.annotate 'line', 9790

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9793
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9794
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9795
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9796
    .return($P1)
# }
.annotate 'line', 9797

.end # findns


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9800
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 9801

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9808
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9809
    if_null $P1, __label_1
.annotate 'line', 9810
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9811
    self.'optimize_base'()
.annotate 'line', 9812
    .return(self)
# }
.annotate 'line', 9813

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9816
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9817
    if_null $P1, __label_1
.annotate 'line', 9818
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9820
    self.'emit_base'(__ARG_1)
.annotate 'line', 9822
    if_null $P1, __label_2
.annotate 'line', 9823
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9824

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 9723
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9725
    addattribute $P0, 'parent'
.annotate 'line', 9726
    addattribute $P0, 'start'
.annotate 'line', 9727
    addattribute $P0, 'name'
.annotate 'line', 9728
    addattribute $P0, 'modifier'
.annotate 'line', 9729
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9841
    new $P1, ['ResizableStringArray']
.annotate 'line', 9842
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9843
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9844
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9845
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9846

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9849
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9850
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9851

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9854
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9855
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9856

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9860
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9859
    set $S1, $I1
.annotate 'line', 9861
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9862

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9866
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9867
    unless_null $P1, __label_1
.annotate 'line', 9868
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9869
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9870

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9873
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9874
    unless_null $P1, __label_1
.annotate 'line', 9875
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9876
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9877

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9880
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9881

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9885
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9886

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9889
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9890

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9893
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9894

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9901
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9902

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9905
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9906

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9909
    self.'optimize_base'()
.annotate 'line', 9910
    .return(self)
# }
.annotate 'line', 9911

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9914
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9917
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9918
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9921
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
.annotate 'line', 9924
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9925
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9926
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9927
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9930
# somelib: $I1
    null $I1
.annotate 'line', 9931
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9932
    if_null $P3, __label_5
# {
.annotate 'line', 9933
    set $I1, 1
.annotate 'line', 9934
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9935
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9938
# someload: $I2
    null $I2
.annotate 'line', 9939
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9940
    if_null $P4, __label_8
# {
.annotate 'line', 9941
    set $I2, 1
.annotate 'line', 9942
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9943
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9944
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9945
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9947
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9948
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9950
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9951

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9954
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9955
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9956
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9957
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9958
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9959
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9961
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9962
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9964

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 9831
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9833
    addattribute $P0, 'unit'
.annotate 'line', 9834
    addattribute $P0, 'predefs_used'
.annotate 'line', 9835
    addattribute $P0, 'libs'
.annotate 'line', 9836
    addattribute $P0, 'loads'
.annotate 'line', 9837
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_108 = "WSubId_108"
# Body
# {
.annotate 'line', 9980
    not $I1, __ARG_1
    box $P2, $I1
    setattribute self, 'warnings', $P2
.annotate 'line', 9981
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9985
    WSubId_114($P1, 'false', 0)
.annotate 'line', 9986
    WSubId_114($P1, 'true', 1)
.annotate 'line', 9991
# predefined string
# predefined int
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    WSubId_108($P1, '__STAGE__', $S1)
.annotate 'line', 9995
    WSubId_114($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 9997
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9998

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 10001
    getattribute $P1, self, 'warnings'
.annotate 'line', 10000
    set $I1, $P1
.annotate 'line', 10001
    .return($I1)
# }
.annotate 'line', 10002

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10005
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10006
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10007

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10010
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10011

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10014
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10015
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10016
    __ARG_1.'say'('')
.annotate 'line', 10018
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10020
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10021

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10024
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10025
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10027
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10029
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10030

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9975
    addattribute $P0, 'rootns'
.annotate 'line', 9976
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
.annotate 'line', 10039
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10040
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10041
# var handleout: $P1
    null $P1
.annotate 'line', 10042
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10043
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10044
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10047
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10048
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10049
    if_null __ARG_4, __label_4
    unless __ARG_4 goto __label_4
.annotate 'line', 10050
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 10051
    __ARG_1.'emit'($P2)
.annotate 'line', 10052
    $P2.'close'()
.annotate 'line', 10053
    if_null __ARG_3, __label_5
.annotate 'line', 10054
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 10056
    $P1.'close'()
.annotate 'line', 10057
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10058
# var object: $P3
    null $P3
# switch
.annotate 'line', 10059
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 10061
    new $P3, [ 'String' ]
.annotate 'line', 10062
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 10066
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 10067
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 10068
# predefined string
.annotate 'line', 10070
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 10072
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 10074

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10077
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10078
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10079
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10080
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10081
    $P2.'close'()
.annotate 'line', 10082
    $P1.'close'()
.annotate 'line', 10083
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10084

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10091
    unless_null __ARG_2, __label_1
.annotate 'line', 10092
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10093
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10094
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10095
    $P1.'puts'(__ARG_1)
.annotate 'line', 10096
    $P1.'close'()
.annotate 'line', 10097
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10098
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10099
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_5)
.annotate 'line', 10100
    $P3.'parse'($P2)
.annotate 'line', 10101
    $P1.'close'()
.annotate 'line', 10102
    $P3.'optimize'()
.annotate 'line', 10103
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10104
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10106
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_3: # endif
# }
.annotate 'line', 10107

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10115
    unless_null __ARG_2, __label_1
.annotate 'line', 10116
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10117
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10118
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10119
    $P1.'encoding'('utf8')
.annotate 'line', 10120
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10121
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_5)
.annotate 'line', 10122
    $P3.'parse'($P2)
.annotate 'line', 10123
    $P1.'close'()
.annotate 'line', 10124
    $P3.'optimize'()
.annotate 'line', 10125
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10126
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10128
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_3: # endif
# }
.annotate 'line', 10129

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10138
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10139
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10140

.end # initializer

# End generated code
