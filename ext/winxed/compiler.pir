# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ 'Winxed'; 'Compiler' ]
# Constant VERSION_MAJOR evaluated at compile time
# Constant VERSION_MINOR evaluated at compile time
# Constant VERSION_BUILD evaluated at compile time

.sub 'isspace' :subid('WSubId_18')
        .param string __ARG_1
# Body
# {
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
# }
.annotate 'line', 23

.end # isspace


.sub 'isdigit' :subid('WSubId_9')
        .param string __ARG_1
# Body
# {
.annotate 'line', 27
# predefined indexof
    index $I2, '0123456789', __ARG_1
    isgt $I1, $I2, -1
    .return($I1)
# }
.annotate 'line', 28

.end # isdigit


.sub 'hexdigit' :subid('WSubId_10')
        .param string __ARG_1
# Body
# {
.annotate 'line', 32
# i: $I1
# predefined indexof
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 33
    lt $I1, 0, __label_1
    mod $I1, $I1, 16
  __label_1: # endif
.annotate 'line', 34
    .return($I1)
# }
.annotate 'line', 35

.end # hexdigit


.sub 'isidentstart' :subid('WSubId_19')
        .param string __ARG_1
# Body
# {
.annotate 'line', 42
# predefined indexof
.annotate 'line', 39
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 42
    isgt $I1, $I2, -1
.annotate 'line', 39
    .return($I1)
# }
.annotate 'line', 43

.end # isidentstart


.sub 'isident' :subid('WSubId_8')
        .param string __ARG_1
# Body
# {
.annotate 'line', 51
# predefined indexof
.annotate 'line', 47
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
.annotate 'line', 51
    isgt $I1, $I2, -1
.annotate 'line', 47
    .return($I1)
# }
.annotate 'line', 52

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
.annotate 'line', 78
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 79
    box $P1, __ARG_2
    setattribute self, 'message', $P1
.annotate 'line', 80
    box $P1, __ARG_3
    setattribute self, 'filename', $P1
.annotate 'line', 81
    box $P1, __ARG_4
    setattribute self, 'line', $P1
# }
.annotate 'line', 82

.end # WinxedCompilerError

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 67
    addattribute $P0, 'type'
.annotate 'line', 68
    addattribute $P0, 'filename'
.annotate 'line', 69
    addattribute $P0, 'line'
.annotate 'line', 70
    addattribute $P0, 'message'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Warn' :subid('WSubId_71')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 87
# var stderr: $P1
# predefined getstderr
    getstderr $P1
.annotate 'line', 88
    $P1.'print'('WARNING: ')
.annotate 'line', 89
    $P1.'print'(__ARG_1)
.annotate 'line', 90
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 91
    $P1.'print'(' near ')
.annotate 'line', 92
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
  __label_1: # endif
.annotate 'line', 94
    $P1.'print'("\n")
# }
.annotate 'line', 95

.end # Warn


.sub 'InternalError' :subid('WSubId_6')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 99
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 100
# desc: $S1
    $P2 = __ARG_2.'show'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 101
    concat __ARG_1, __ARG_1, ' near '
    concat __ARG_1, __ARG_1, $S1
# }
  __label_1: # endif
.annotate 'line', 103
# var payload: $P1
    unless __ARG_3 goto __label_4
.annotate 'line', 104
    new $P2, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 105
    $P3 = __ARG_2.'filename'()
    $P4 = __ARG_2.'linenum'()
    $P2.'WinxedCompilerError'('internal', __ARG_1, $P3, $P4)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 106
    new $P5, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P5.'WinxedCompilerError'('internal', __ARG_1)
    set $P1, $P5
  __label_3:
.annotate 'line', 107
# predefined Error
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2
# }
.annotate 'line', 108

.end # InternalError


.sub 'TokenError' :subid('WSubId_7')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 112
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
.annotate 'line', 114
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
# predefined Error
.annotate 'line', 112
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1
# }
.annotate 'line', 115

.end # TokenError


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 119
# line: $I1
    $P1 = __ARG_2.'linenum'()
    set $I1, $P1
.annotate 'line', 120
# file: $S1
    $P1 = __ARG_2.'filename'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 121
# desc: $S2
# predefined string
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S2, ' near ', $S3
.annotate 'line', 122
# predefined string
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
.annotate 'line', 124
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
.annotate 'line', 125
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
# predefined Error
.annotate 'line', 122
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1
# }
.annotate 'line', 126

.end # SyntaxError


.sub 'NoLeftSide' :subid('WSubId_62')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 130
    WSubId_1('Not a left-side expression', __ARG_1)
# }
.annotate 'line', 131

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_43')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 135
    concat $S1, "Expected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 136

.end # Expected


.sub 'Unexpected' :subid('WSubId_44')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 140
    concat $S1, "Unexpected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 141

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 145
    WSubId_1("Expected identifier", __ARG_1)
# }
.annotate 'line', 146

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 150
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 151

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 155
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 156
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 157

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 161
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 162
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 163

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_96')
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 167
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 168
    WSubId_3(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 169

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_57')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 173
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 174
    WSubId_4(__ARG_1, $P1)
# }
.annotate 'line', 175

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_98')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_5 = "WSubId_5"
# Body
# {
.annotate 'line', 179
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 180
    WSubId_5(__ARG_1, $P1)
# }
.annotate 'line', 181

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_64')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 185
# predefined string
    set $S1, __ARG_1
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    WSubId_1($S2, __ARG_1)
# }
.annotate 'line', 186

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 198
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 199
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 200

.end # Token


.sub 'iseof' :method
# Body
# {
.annotate 'line', 202
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 203
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 204
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 205
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 206
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 207
    .return(0)
# }

.end # isstring


.sub 'issinglequoted' :method
# Body
# {
.annotate 'line', 208
    .return(0)
# }

.end # issinglequoted


.sub 'getintvalue' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 212
    WSubId_6('Not a literal int', self)
# }
.annotate 'line', 213

.end # getintvalue


.sub 'rawstring' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 216
    WSubId_6('Not a literal string', self)
# }
.annotate 'line', 217

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 220
    WSubId_3(self)
# }
.annotate 'line', 221

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 222
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 223
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 224
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 225
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 226
    .return('(unknown)')
# }

.end # viewable


.sub 'filename' :method
# Body
# {
.annotate 'line', 227
    getattribute $P1, self, 'file'
    .return($P1)
# }

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 228
    getattribute $P1, self, 'line'
    .return($P1)
# }

.end # linenum


.sub 'show' :method
# Body
# {
.annotate 'line', 231
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 232
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
.annotate 'line', 233

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
.annotate 'line', 194
    addattribute $P0, 'file'
.annotate 'line', 195
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 240
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 241

.end # TokenEof


.sub 'iseof' :method
# Body
# {
.annotate 'line', 242
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 243
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 236
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
.annotate 'line', 251
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 252
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 253

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 254
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 257
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 258

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 246
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 248
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 265
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 266

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 267
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 261
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
.annotate 'line', 274
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 275

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 278
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 279

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 282
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 283

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 270
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
.annotate 'line', 290
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 291

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 292
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 295
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 296

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 299
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 300

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 303
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 304

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 286
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 309
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 312
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 313

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 307
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
.annotate 'line', 320
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 321

.end # TokenQuoted


.sub 'get_string' :method :vtable
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

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 328
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 329

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 332
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 333

.end # getasquoted


.sub 'getPirString' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 336
# str: $S1
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 337
# strunesc: $S2
    null $S2
.annotate 'line', 338
# try: create handler
    new $P1, 'ExceptionHandler'
    set_label $P1, __label_2
    push_eh $P1
# try: begin
# {
.annotate 'line', 339
# predefined unescape
    $P0 = new ['String']
    $P0 = $S1
    $S2 = $P0.'unescape'('utf8')
# }
# try: end
    pop_eh
    goto __label_3
.annotate 'line', 338
# catch
  __label_2:
    .get_results($P2)
    finalize $P2
    pop_eh
# {
.annotate 'line', 342
    WSubId_1("Invalid escape sequence in literal string", self)
# }
# catch end
  __label_3:
.annotate 'line', 344
# need_encoding: $I1
    null $I1
.annotate 'line', 345
    box $P1, $S2
    if_null $P1, __label_5
    iter $P3, $P1
    set $P3, 0
  __label_4: # for iteration
    unless $P3 goto __label_5
    shift $I2, $P3
# {
.annotate 'line', 346
    le $I2, 127, __label_6
# {
.annotate 'line', 347
    set $I1, 1
    goto __label_5 # break
.annotate 'line', 348
# }
  __label_6: # endif
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 351
# predefined escape
    escape $S1, $S2
.annotate 'line', 352
# encoding: $S3
    unless $I1 goto __label_8
    set $S3, "utf8:"
    goto __label_7
  __label_8:
    set $S3, ""
  __label_7:
.annotate 'line', 353
    concat $S4, $S3, '"'
    concat $S4, $S4, $S1
    concat $S4, $S4, '"'
    .return($S4)
# }
.annotate 'line', 354

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
.annotate 'line', 316
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
.annotate 'line', 361
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 362

.end # TokenSingleQuoted


.sub 'issinglequoted' :method
# Body
# {
.annotate 'line', 363
    .return(1)
# }

.end # issinglequoted


.sub 'get_string' :method :vtable
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

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 370
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 371

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 374
# s: $S1
    set $S1, ''
.annotate 'line', 375
    getattribute $P1, self, 'str'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 376
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
.annotate 'line', 380
    concat $S2, '\', $S2
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 383
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 385
    .return($S1)
# }
.annotate 'line', 386

.end # getasquoted


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 389
# str: $S1
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 390
# quote: $S2
    set $S2, "'"
.annotate 'line', 391
# need_escape: $I1
    null $I1
.annotate 'line', 392
    box $P1, $S1
    if_null $P1, __label_3
    iter $P2, $P1
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $I2, $P2
# {
.annotate 'line', 393
    islt $I5, $I2, 32
    if $I5 goto __label_5
    isgt $I5, $I2, 127
  __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 394
    set $I1, 1
    goto __label_3 # break
.annotate 'line', 395
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 398
# need_encoding: $I3
    null $I3
.annotate 'line', 399
    unless $I1 goto __label_6
# {
.annotate 'line', 400
    set $S2, '"'
.annotate 'line', 401
# result: $S3
    set $S3, ''
.annotate 'line', 402
    box $P1, $S1
    if_null $P1, __label_8
    iter $P3, $P1
    set $P3, 0
  __label_7: # for iteration
    unless $P3 goto __label_8
    shift $S4, $P3
# {
.annotate 'line', 403
    ne $S4, '\', __label_9
.annotate 'line', 404
    concat $S3, $S3, '\\'
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 407
# n: $I4
# predefined ord
    ord $I4, $S4
.annotate 'line', 408
    islt $I5, $I4, 32
    if $I5 goto __label_13
    isgt $I5, $I4, 127
  __label_13:
    unless $I5 goto __label_11
# {
.annotate 'line', 409
    le $I4, 127, __label_14
.annotate 'line', 410
    set $I3, 1
  __label_14: # endif
.annotate 'line', 411
# h: $S5
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_15
    set $S5, $P1
  __label_15:
.annotate 'line', 412
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 415
    concat $S3, $S3, $S4
  __label_12: # endif
# }
  __label_10: # endif
# }
    goto __label_7
  __label_8: # endfor
.annotate 'line', 418
    set $S1, $S3
# }
  __label_6: # endif
.annotate 'line', 420
    concat $S1, $S2, $S1
    concat $S1, $S1, $S2
.annotate 'line', 421
    unless $I3 goto __label_16
.annotate 'line', 422
    concat $S1, 'utf8:', $S1
  __label_16: # endif
.annotate 'line', 423
    .return($S1)
# }
.annotate 'line', 424

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 357
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
.annotate 'line', 431
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 432

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 433
    .return(1)
# }

.end # isint


.sub 'getintvalue' :method
# Body
# {
# predefined int
.annotate 'line', 436
    getattribute $P1, self, 'str'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 437

.end # getintvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
.annotate 'line', 427
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
.annotate 'line', 444
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 445

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 446
    .return(1)
# }

.end # isfloat


.sub 'getfloatvalue' :method
# Body
# {
.annotate 'line', 450
# value: $N1
    getattribute $P1, self, 'str'
    set $N1, $P1
.annotate 'line', 451
    .return($N1)
# }
.annotate 'line', 452

.end # getfloatvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
.annotate 'line', 440
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
.annotate 'line', 462
# s: $S1
    set $S1, ''
.annotate 'line', 463
# c: $S2
    null $S2
# for loop
.annotate 'line', 464
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 465
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
.annotate 'line', 468
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 471
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 472
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 473
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 474
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 477
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 464
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 480
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 481

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 485
# s: $S1
    set $S1, ''
.annotate 'line', 486
# c: $S2
    null $S2
# for loop
.annotate 'line', 487
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 488
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 489
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 490
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 487
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 492
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 493

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 497
# mark: $S1
    set $S1, ''
.annotate 'line', 498
# c: $S2
    null $S2
# for loop
.annotate 'line', 499
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 500
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 502
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 507
    concat $S2, '\', $S2
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 510
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 499
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 512
    concat $S1, $S1, ':>>'
.annotate 'line', 514
# content: $S3
    set $S3, ''
.annotate 'line', 515
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 516
# {
.annotate 'line', 517
    set $S4, ''
# for loop
.annotate 'line', 518
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 519
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 521
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 524
    concat $S2, '\', $S2
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 527
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 518
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 529
    eq $S4, $S1, __label_20
.annotate 'line', 530
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 531
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 532
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 533

.end # getheredoc


.sub 'getident' :subid('WSubId_11')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
# Body
# {
.annotate 'line', 537
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 538
# c: $S2
    null $S2
# for loop
.annotate 'line', 539
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    $P2 = WSubId_8($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 540
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 539
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_3
  __label_2: # for end
.annotate 'line', 541
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 542
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 543

.end # getident


.sub 'getnumber' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_10 = "WSubId_10"
# Body
# {
.annotate 'line', 547
# s: $S1
    null $S1
.annotate 'line', 548
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 549
# {
.annotate 'line', 550
    concat $S1, $S1, $S2
.annotate 'line', 551
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.annotate 'line', 552
    $P1 = WSubId_9($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 553
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 554
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 555
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
    $P2 = WSubId_10($S2)
    set $I2, $P2
    lt $I2, 0, __label_8
# {
.annotate 'line', 556
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 557
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 555
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 559
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 560
    set $S1, $I1
.annotate 'line', 561
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 563
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 564
# {
.annotate 'line', 565
    concat $S1, $S1, $S2
.annotate 'line', 566
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.annotate 'line', 567
    $P1 = WSubId_9($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 568
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 569
    concat $S1, $S1, 'E'
.annotate 'line', 570
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 571
    concat $S1, $S1, $S2
.annotate 'line', 572
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.annotate 'line', 574
    $P1 = WSubId_9($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 575
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 574
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 577
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 578
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 581
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 582
    concat $S1, $S1, 'E'
.annotate 'line', 583
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 584
    concat $S1, $S1, $S2
.annotate 'line', 585
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.annotate 'line', 587
    $P1 = WSubId_9($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 588
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 587
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_29
  __label_28: # for end
.annotate 'line', 589
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 590
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 593
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 594
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
.annotate 'line', 597

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 601
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 602
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
.annotate 'line', 603
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 602
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 604
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 605

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 609
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 610
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 611
# {
# for loop
  __label_7: # for condition
.annotate 'line', 612
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 613
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 612
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 614
    ne $S2, '', __label_9
.annotate 'line', 615
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 616
    concat $S1, $S1, $S2
.annotate 'line', 617
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 618
    ne $S2, '', __label_10
.annotate 'line', 619
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 620
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 621
    concat $S1, $S1, '/'
.annotate 'line', 622
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 623

.end # getcomment


.sub 'getop' :subid('WSubId_12')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 627
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 628
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 629

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
.annotate 'line', 645
    setattribute self, 'h', __ARG_1
.annotate 'line', 646
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 647
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 648
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 649
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 650
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 651
    root_new $P2, ['parrot';'Hash']
    $P2[''] = WSubId_11
    $P2['{'] = WSubId_12
    $P1['$'] = $P2
.annotate 'line', 652
    $P1['"'] = WSubId_13
.annotate 'line', 653
    $P1["'"] = WSubId_14
.annotate 'line', 654
    root_new $P3, ['parrot';'Hash']
.annotate 'line', 655
    root_new $P4, ['parrot';'Hash']
    $P4[''] = WSubId_12
    $P4['='] = WSubId_12
    $P3['='] = $P4
.annotate 'line', 656
    $P3[':'] = WSubId_12
    $P1['='] = $P3
.annotate 'line', 658
    root_new $P5, ['parrot';'Hash']
    $P5['+'] = WSubId_12
    $P5['='] = WSubId_12
    $P1['+'] = $P5
.annotate 'line', 659
    root_new $P6, ['parrot';'Hash']
    $P6['-'] = WSubId_12
    $P6['='] = WSubId_12
    $P1['-'] = $P6
.annotate 'line', 660
    root_new $P7, ['parrot';'Hash']
    $P7['='] = WSubId_12
    $P1['*'] = $P7
.annotate 'line', 661
    root_new $P8, ['parrot';'Hash']
    $P8['|'] = WSubId_12
    $P1['|'] = $P8
.annotate 'line', 662
    root_new $P9, ['parrot';'Hash']
    $P9['&'] = WSubId_12
    $P1['&'] = $P9
.annotate 'line', 663
    root_new $P10, ['parrot';'Hash']
.annotate 'line', 664
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_12
    $P11[':'] = WSubId_15
    $P10['<'] = $P11
.annotate 'line', 665
    $P10['='] = WSubId_12
    $P1['<'] = $P10
.annotate 'line', 667
    root_new $P12, ['parrot';'Hash']
    $P12['>'] = WSubId_12
    $P12['='] = WSubId_12
    $P1['>'] = $P12
.annotate 'line', 668
    root_new $P13, ['parrot';'Hash']
.annotate 'line', 669
    root_new $P14, ['parrot';'Hash']
    $P14[''] = WSubId_12
    $P14['='] = WSubId_12
    $P13['='] = $P14
    $P1['!'] = $P13
.annotate 'line', 671
    root_new $P15, ['parrot';'Hash']
    $P15['%'] = WSubId_12
    $P15['='] = WSubId_12
    $P1['%'] = $P15
.annotate 'line', 672
    root_new $P16, ['parrot';'Hash']
    $P16['='] = WSubId_12
    $P16['/'] = WSubId_16
    $P16['*'] = WSubId_17
    $P1['/'] = $P16
.annotate 'line', 673
    $P1['#'] = WSubId_16
.annotate 'line', 675
    setattribute self, 'select', $P1
# }
.annotate 'line', 676

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 679
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 680
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 681
    eq $S1, '', __label_2
.annotate 'line', 682
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 684
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 685
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 686
    ne $S1, "\n", __label_4
.annotate 'line', 687
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 689
    .return($S1)
# }
.annotate 'line', 690

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 693
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 694

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
.annotate 'line', 697
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 698
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 700
# c: $S1
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 701
    $P3 = WSubId_18($S1)
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 702
    $P4 = self.'getchar'()
    set $S1, $P4
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 703
# line: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 704
    ne $S1, '', __label_5
.annotate 'line', 705
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
.annotate 'line', 706
    $P3 = WSubId_19($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 707
    .tailcall WSubId_11(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 708
    $P3 = WSubId_9($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 709
    .tailcall WSubId_20(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 711
# op: $S2
    set $S2, $S1
.annotate 'line', 712
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 713
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 715
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 716
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 717
    set $P1, $P2
.annotate 'line', 718
    $P2 = $P1[$S1]
.annotate 'line', 719
    unless_null $P2, __label_11
# {
.annotate 'line', 720
    self.'ungetchar'($S1)
.annotate 'line', 721
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 724
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 726
    if_null $P2, __label_14
.annotate 'line', 727
    $P3 = $P2(self, $S2, $I1)
    goto __label_13
  __label_14:
.annotate 'line', 728
    $P3 = WSubId_12(self, $S2, $I1)
  __label_13:
.annotate 'line', 726
    .return($P3)
# }
.annotate 'line', 729

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 732
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 733
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 734
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 735
    .return($P1)
# }
.annotate 'line', 736

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 739
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 740

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 637
    addattribute $P0, 'h'
.annotate 'line', 638
    addattribute $P0, 'pending'
.annotate 'line', 639
    addattribute $P0, 'select'
.annotate 'line', 640
    addattribute $P0, 'stacked'
.annotate 'line', 641
    addattribute $P0, 'filename'
.annotate 'line', 642
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

.sub 'typetoregcheck' :subid('WSubId_99')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 762
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
.annotate 'line', 763
    .return('I')
  __label_4: # case
.annotate 'line', 764
    .return('N')
  __label_5: # case
.annotate 'line', 765
    .return('S')
  __label_6: # case
.annotate 'line', 766
    .return('P')
  __label_2: # default
.annotate 'line', 767
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 769

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_108')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
# switch
.annotate 'line', 773
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
.annotate 'line', 774
    .return('int')
  __label_4: # case
.annotate 'line', 775
    .return('num')
  __label_5: # case
.annotate 'line', 776
    .return('string')
  __label_6: # case
.annotate 'line', 777
    .return('pmc')
  __label_2: # default
.annotate 'line', 778
    WSubId_6('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 780

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 800
    setattribute self, 'handle', __ARG_1
.annotate 'line', 801
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 802
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 803
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 804
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 805

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 808
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 809

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 812
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 813

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 816
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 817
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'file', '"
.annotate 'line', 819
    getattribute $P4, self, 'file'
.annotate 'line', 817
    $P3[1] = $P4
    $P3[2] = "'\n"
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 822
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 824
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 825
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'line', "
.annotate 'line', 827
    getattribute $P4, self, 'line'
.annotate 'line', 825
    $P3[1] = $P4
    $P3[2] = "\n"
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 830
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 832

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 835
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 836
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 837

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 840
    self.'updateannot'()
.annotate 'line', 841
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 842

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 845
    self.'updateannot'()
.annotate 'line', 846
    self.'vprint'(__ARG_1)
.annotate 'line', 847
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 848

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 851
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 853
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 854
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 855
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 856
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 857
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 858
    assign $P1, $S1
.annotate 'line', 859
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 860
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 862
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 863
    assign $P2, $I1
.annotate 'line', 864
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 867

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 870
    self.'updateannot'()
.annotate 'line', 871
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 872

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 875
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 876
    $P1.'print'('  ')
.annotate 'line', 877
    $P1.'print'(__ARG_1)
.annotate 'line', 878
    $P1.'print'(':')
.annotate 'line', 879
    if_null __ARG_2, __label_1
.annotate 'line', 880
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 881
    $P1.'print'("\n")
# }
.annotate 'line', 882

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 885
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 886
    $P1.'print'('    goto ')
.annotate 'line', 887
    $P1.'print'(__ARG_1)
.annotate 'line', 888
    if_null __ARG_2, __label_1
.annotate 'line', 889
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 890
    $P1.'print'("\n")
# }
.annotate 'line', 891

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 895
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 896

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 899
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 900

.end # emitarg2


.sub 'emitarg3' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 903
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 904

.end # emitarg3


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 907
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 908

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 911
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 912

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 915
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 916

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 919
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 920

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 923
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 924

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 928
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 929

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 932
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 933

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 936
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 937

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 940
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 941

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 944
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 945

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 948
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 949

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 952
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 953

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 956
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 957

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 960
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 961

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 964
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 965

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 968
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 969

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 972
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 973

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 976
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 977

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 980
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 981

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 984
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 985

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 988
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 989

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 992
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 993

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 996
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 997

.end # emitsay


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 1000
    concat $S1, "    get_hll_global ", __ARG_1
    self.'print'($S1)
.annotate 'line', 1001
    if_null __ARG_3, __label_1
.annotate 'line', 1002
    concat $S1, ", ", __ARG_3
    self.'print'($S1)
  __label_1: # endif
.annotate 'line', 1003
    concat $S1, ", '", __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 1004

.end # emitget_hll_global


.sub 'emitnamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1008
    self.'print'(".namespace [ ")
.annotate 'line', 1009
# predefined elements
    elements $I1, __ARG_1
    unless $I1, __label_1
.annotate 'line', 1010
# predefined join
    join $S1, "'; '", __ARG_1
    self.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 1011
    self.'say'("]")
# }
.annotate 'line', 1012

.end # emitnamespace


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1015
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 1016

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1019
    self.'say'("store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 1020

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 791
    addattribute $P0, 'handle'
.annotate 'line', 792
    addattribute $P0, 'file'
.annotate 'line', 793
    addattribute $P0, 'line'
.annotate 'line', 794
    addattribute $P0, 'pendingf'
.annotate 'line', 795
    addattribute $P0, 'pendingl'
.annotate 'line', 796
    addattribute $P0, 'noan'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant SEARCH_NAMESPACE evaluated at compile time
# Constant SEARCH_CLASS evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time

.sub 'integerValue' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 1045
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 1046

.end # integerValue


.sub 'floatValue' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 1050
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 1051
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 1052

.end # floatValue


.sub 'floatresult' :subid('WSubId_67')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1060
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1061
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1062
    .return($I1)
# }
.annotate 'line', 1063

.end # floatresult


.sub 'floatAsString' :subid('WSubId_63')
        .param num __ARG_1
# Body
# {
.annotate 'line', 1073
# aux: $S1
    null $S1
    set $S1, __ARG_1
.annotate 'line', 1075
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 1076
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1077
    .return($S1)
# }
.annotate 'line', 1078

.end # floatAsString

# Constant PREDEFCONST_FILENAME evaluated at compile time
# Constant PREDEFCONST_LINENUM evaluated at compile time

.sub 'createPredefConstInt' :subid('WSubId_117')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1089
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1090
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1091
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1092
    $P3 = WSubId_21(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1093

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_110')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1097
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1098
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1099
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1100
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1101
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1100
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1102

.end # createPredefConstString

# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1128
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1129
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1130
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1131
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat __ARG_2, '    ', $S1
.annotate 'line', 1132
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1133
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1134

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1137
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1139
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1140
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_4, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1141
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1144
    isnull $I1, __ARG_4
    if $I1 goto __label_7
    iseq $I1, __ARG_4, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1145
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1148
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1149
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_4, __ARG_5 :flat)
.annotate 'line', 1150
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1151
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1152

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 1114
    addattribute $P0, 'body'
.annotate 'line', 1115
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
.annotate 'line', 1173
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1174
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1175
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1177
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1178
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1179
# n: $I1
    null $I1
.annotate 'line', 1180
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1181
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1182
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1184
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1187
    set $I1, -2
.annotate 'line', 1188
    if_null __ARG_5, __label_8
.annotate 'line', 1189
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1192
    set $I1, 1
.annotate 'line', 1193
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1194
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1195
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1197
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1198
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1199
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1201
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1202
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1203
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1207
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1208

.end # PredefBase


.sub 'iscompileevaluable' :method
# Body
# {
.annotate 'line', 1211
    .return(0)
# }
.annotate 'line', 1212

.end # iscompileevaluable


.sub 'name' :method
# Body
# {
.annotate 'line', 1215
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1216
    .return($S1)
# }
.annotate 'line', 1217

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1220
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1221

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1222
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1225
# type: $S1
    null $S1
# switch
.annotate 'line', 1226
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
.annotate 'line', 1227
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1228
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1229
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1230
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1232
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1234
    .return($S1)
# }
.annotate 'line', 1235

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1238
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1239
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1240
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1241
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1242
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1243
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1244

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1157
    addattribute $P0, 'name'
.annotate 'line', 1158
    addattribute $P0, 'body'
.annotate 'line', 1159
    addattribute $P0, 'typeresult'
.annotate 'line', 1160
    addattribute $P0, 'type0'
.annotate 'line', 1161
    addattribute $P0, 'type1'
.annotate 'line', 1162
    addattribute $P0, 'type2'
.annotate 'line', 1163
    addattribute $P0, 'type3'
.annotate 'line', 1164
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
.annotate 'line', 1256
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1257

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1247
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
.annotate 'line', 1270
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1271
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1272

.end # PredefFunctionEval


.sub 'iscompileevaluable' :method
# Body
# {
.annotate 'line', 1275
    .return(1)
# }
.annotate 'line', 1276

.end # iscompileevaluable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1260
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1262
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1284
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1285

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1288
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1289
# predefined elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1290
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1291
# var rawarg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1292
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1294
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1295
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1296
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1299
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1300
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1302
    ne $S3, 'null', __label_9
.annotate 'line', 1303
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1305
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1307

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1281
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'predefeval_stringcast' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1312
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1314
# s: $S1
    null $S1
# switch-case
.annotate 'line', 1316
    $I1 = $P1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1319
    $I1 = $P1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1322
    $I1 = $P1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1317
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I2, $P3
    set $S1, $I2
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1320
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1323
    .return($P1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1326
    WSubId_6('wrong call to predefeval_stringcast', __ARG_2)
  __label_1: # switch end
.annotate 'line', 1329
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1330
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1331

.end # predefeval_stringcast


.sub 'predefeval_intcast' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1335
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
# switch-case
.annotate 'line', 1338
    $I1 = $P1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1340
    $I1 = $P1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1342
    $I1 = $P1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1339
    .return($P1)
  __label_4: # case
.annotate 'line', 1341
# predefined int
    $P2 = $P1.'getFloatValue'()
    set $I2, $P2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
  __label_5: # case
.annotate 'line', 1343
# predefined int
    $P3 = $P1.'get_value'()
    set $I3, $P3
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I3)
  __label_2: # default
.annotate 'line', 1345
    WSubId_6('wrong call to predefeval_intcast', __ARG_2)
  __label_1: # switch end
# }
.annotate 'line', 1347

.end # predefeval_intcast


.sub 'Predef_varcast' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1351
# predefined elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1352
    WSubId_6("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1353
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1354
# argtype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 1355
    ne $S1, 'P', __label_3
# {
.annotate 'line', 1356
# name: $S2
    null $S2
.annotate 'line', 1357
# var sym: $P2
    null $P2
# switch-case
.annotate 'line', 1359
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1375
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1360
    $P7 = $P1.'getName'()
    set $S2, $P7
.annotate 'line', 1361
# id: $S3
    $P8 = $P1.'checkIdentifier'()
    null $S3
    if_null $P8, __label_9
    set $S3, $P8
  __label_9:
.annotate 'line', 1362
# var desc: $P3
    $P3 = $P1.'checkVar'()
.annotate 'line', 1363
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
# {
.annotate 'line', 1365
    $P1.'emit'(__ARG_1, __ARG_4)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 1368
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 1
    $P7[0] = $S2
    $P2 = $P1.'scopesearch'($P7, 0)
.annotate 'line', 1369
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
# {
.annotate 'line', 1370
# var path: $P4
    getattribute $P7, $P2, 'owner'
    $P4 = $P7.'getpath'()
.annotate 'line', 1371
    $P7 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_14: # endif
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1378
    new $P5, ['ResizableStringArray']
.annotate 'line', 1379
    $P1.'buildkey'($P5)
.annotate 'line', 1380
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1381
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_17
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_17:
    unless $I1 goto __label_16
# {
.annotate 'line', 1382
# var path: $P6
    getattribute $P7, $P2, 'owner'
    $P6 = $P7.'getpath'()
.annotate 'line', 1383
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1384
    $P7 = WSubId_22($P6)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_16: # endif
.annotate 'line', 1386
    $P7 = $P5.'pop'()
    set $S2, $P7
.annotate 'line', 1387
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1388
    $P8 = WSubId_22($P5)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P8)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1391
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1392
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 1396
# reg: $S4
    $P7 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_18
    set $S4, $P7
  __label_18:
.annotate 'line', 1397
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1398
    ne $S4, 'null', __label_19
.annotate 'line', 1399
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_20
  __label_19: # else
.annotate 'line', 1401
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_20: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 1403

.end # Predef_varcast


.sub 'Predef_say' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1407
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1408
# n: $I1
# predefined elements
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1409
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1410
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1411
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1410
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1412
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1415
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1416

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1420
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1421
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1422
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1423
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1424
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1425

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1429
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1430
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1431
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1432

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1438
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1439
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1440
    WSubId_1("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1441
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1442

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1446
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1447
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1448
# predefined length
    length $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1449

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1453
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1454
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1455
# predefined bytelength
    bytelength $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1456

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1460
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1461
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1462
# predefined ord
    ord $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1463

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1467
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1468
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1469
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1470
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1471
# predefined ord
    ord $I2, $S1, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1472

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1476
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1478
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1479
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1481
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1482
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1483

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1487
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1488
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1489
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1490
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1492
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1493
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1494

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1498
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1499
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1500
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1501
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1502
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1503
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1505
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1506
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1507

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1511
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1512
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1513
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1514
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1515
# predefined indexof
    index $I1, $S1, $S2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1516

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1520
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1521
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1522
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1523
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1524
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1525
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1526
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1527

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_118')
        .param pmc __ARG_1
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
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1531
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1533
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('I')
    set $P3, $P4
    $P2.'PredefFunctionEval'('int', WSubId_23, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1531
    __ARG_1.'add'($P1)
.annotate 'line', 1536
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1537
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('N')
    set $P3, $P4
    $P2.'PredefFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1536
    __ARG_1.'add'($P1)
.annotate 'line', 1540
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1542
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('S')
    set $P3, $P4
    $P2.'PredefFunctionEval'('string', WSubId_24, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1540
    __ARG_1.'add'($P1)
.annotate 'line', 1545
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1546
    $P2.'PredefFunction'('var', WSubId_25, 'P', '!')
    set $P1, $P2
.annotate 'line', 1545
    __ARG_1.'add'($P1)
.annotate 'line', 1549
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1553
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1557
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1561
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1565
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1569
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1573
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1577
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1581
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1588
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1595
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1602
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1610
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1619
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1629
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1633
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1634
    $P2.'PredefFunctionEval'('length', WSubId_26, 'length %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1633
    __ARG_1.'add'($P1)
.annotate 'line', 1638
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1639
    $P2.'PredefFunctionEval'('bytelength', WSubId_27, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1638
    __ARG_1.'add'($P1)
.annotate 'line', 1643
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1644
    $P2.'PredefFunctionEval'('chr', WSubId_28, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
.annotate 'line', 1643
    __ARG_1.'add'($P1)
.annotate 'line', 1652
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1653
    $P2.'PredefFunctionEval'('ord', WSubId_29, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1652
    __ARG_1.'add'($P1)
.annotate 'line', 1657
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1658
    $P2.'PredefFunctionEval'('ord', WSubId_30, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1657
    __ARG_1.'add'($P1)
.annotate 'line', 1662
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1663
    $P2.'PredefFunctionEval'('substr', WSubId_31, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1662
    __ARG_1.'add'($P1)
.annotate 'line', 1667
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1668
    $P2.'PredefFunctionEval'('substr', WSubId_32, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
.annotate 'line', 1667
    __ARG_1.'add'($P1)
.annotate 'line', 1672
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1676
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1677
    $P2.'PredefFunctionEval'('indexof', WSubId_33, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1676
    __ARG_1.'add'($P1)
.annotate 'line', 1681
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1682
    $P2.'PredefFunctionEval'('indexof', WSubId_34, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1681
    __ARG_1.'add'($P1)
.annotate 'line', 1686
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1690
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('escape', 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1694
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1702
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1710
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1717
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1724
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1728
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1732
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1736
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1740
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1747
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1754
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1758
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1762
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1766
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1770
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1774
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1778
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1782
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1786
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1790
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1794
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1798
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1802
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1806
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1819
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1823
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1827
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1831
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1835
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1839
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1843
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1847
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1851
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1855
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1859
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1866
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1873
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1877
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1881
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1885
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1889
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1893
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1894
    $P2.'PredefFunction'('print', WSubId_35, 'v', '*')
    set $P1, $P2
.annotate 'line', 1893
    __ARG_1.'add'($P1)
.annotate 'line', 1897
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1898
    $P2.'PredefFunction'('say', WSubId_36, 'v', '*')
    set $P1, $P2
.annotate 'line', 1897
    __ARG_1.'add'($P1)
.annotate 'line', 1901
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1902
    $P2.'PredefFunction'('cry', WSubId_37, 'v', '*')
    set $P1, $P2
.annotate 'line', 1901
    __ARG_1.'add'($P1)
.annotate 'line', 1905
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1906
    $P2.'PredefFunction'('invoke', WSubId_38, 'P', '!')
    set $P1, $P2
.annotate 'line', 1905
    __ARG_1.'add'($P1)
# }
.annotate 'line', 1909

.end # getpredefs


.sub 'optimize_array' :subid('WSubId_41')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1917
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1918
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1919
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1920
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1919
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1922

.end # optimize_array


.sub 'emit_array' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1926
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 1927
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1928

.end # emit_array


.sub 'parseDotted' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1932
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1933
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1934
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1935
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1936
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1937
    $P2 = __ARG_1.'get'()
.annotate 'line', 1938
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1941
    __ARG_1.'unget'($P2)
.annotate 'line', 1942
    .return($P1)
# }
.annotate 'line', 1943

.end # parseDotted


.sub 'parseList' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1951
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1952
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1953
# {
.annotate 'line', 1954
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1955
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1956
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1957
    unless_null __ARG_4, __label_4
.annotate 'line', 1958
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1960
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1961
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1962
    .return($P1)
# }
.annotate 'line', 1963

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1968
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1969
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1970
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1971
    .return($P1)
# }
.annotate 'line', 1972

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_59')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1976
    new $P1, ['ResizableStringArray']
.annotate 'line', 1977
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1978
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1979
    .return($P1)
# }
.annotate 'line', 1980

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1993
    setattribute self, 'start', __ARG_1
.annotate 'line', 1994
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1995

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1998
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1999
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2001
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 2002

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 2005
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2006
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2008
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 2009

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 2012
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2013
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2015
    .return("")
  __label_2: # endif
# }
.annotate 'line', 2016

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2019
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 2020

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2023
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 2024

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 2027
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 2028

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2031
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 2032

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2035
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 2036

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 2039
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2040

.end # scopesearch


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 2043
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 2044

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1988
    addattribute $P0, 'start'
.annotate 'line', 1989
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 2059
    $P2 = WSubId_39(__ARG_1, __ARG_2, WSubId_40, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 2060

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2064
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 2065

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 2068
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2069
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 2070

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2074
    getattribute $P1, self, 'args'
    WSubId_41($P1)
# }
.annotate 'line', 2075

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2078
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2079
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2080
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2081
    .return($P1)
# }
.annotate 'line', 2082

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2085
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 2086

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2055
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 2098
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2101
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2102
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 2103
    .return($I1)
# }
.annotate 'line', 2104

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2107
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2108
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2109
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2110
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 2111

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2114
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2115
    if_null __ARG_2, __label_1
.annotate 'line', 2116
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 2117

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2120
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2121
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2122
    .return(self)
# }
.annotate 'line', 2123

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2095
    addattribute $P0, 'name'
.annotate 'line', 2096
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2128
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2129
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2130
    $P1 = __ARG_1.'get'()
.annotate 'line', 2131
# var args: $P2
    null $P2
.annotate 'line', 2132
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2133
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2135
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2136
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2137

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2146
    $P2 = WSubId_39(__ARG_1, __ARG_2, WSubId_42, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2147

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2150
    getattribute $P1, self, 'list'
    WSubId_41($P1)
# }
.annotate 'line', 2151

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2152
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2155
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2156
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2157
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2159
    .return($P2)
# }
.annotate 'line', 2160

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2142
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_22')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2169
# r: $S1
    null $S1
.annotate 'line', 2170
# predefined elements
    elements $I1, __ARG_1
    unless $I1, __label_1
.annotate 'line', 2171
# predefined string
# predefined join
    join $S2, "'; '", __ARG_1
    concat $S1, "[ '", $S2
    concat $S1, $S1, "' ]"
  __label_1: # endif
.annotate 'line', 2172
    .return($S1)
# }
.annotate 'line', 2173

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2177
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2179
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2181
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2183
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2180
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2182
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2184
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2186
    __ARG_2.'unget'($P1)
.annotate 'line', 2187
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2189

.end # parseUsing


.sub 'parseSig' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 2193
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2194
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2195
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2196
    WSubId_43("'='", $P2)
  __label_1: # endif
.annotate 'line', 2197
# var expr: $P3
    $P3 = WSubId_40(__ARG_2, __ARG_3)
.annotate 'line', 2198
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2199

.end # parseSig


.sub 'parseStatement' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 2203
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2204
# var t2: $P2
    null $P2
.annotate 'line', 2205
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2206
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2207
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2208
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2209
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2210
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2211
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 2212
# var open: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2213
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2214
    WSubId_44("':'", $P1)
  __label_5: # endif
.annotate 'line', 2215
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2218
    $P5 = $P1.'checkkeyword'()
    set $S1, $P5
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
.annotate 'line', 2220
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2222
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2225
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2228
    $P2 = __ARG_1.'get'()
.annotate 'line', 2229
    __ARG_1.'unget'($P2)
.annotate 'line', 2230
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2231
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2234
    $P2 = __ARG_1.'get'()
.annotate 'line', 2235
    __ARG_1.'unget'($P2)
.annotate 'line', 2236
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2237
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2240
    $P2 = __ARG_1.'get'()
.annotate 'line', 2241
    __ARG_1.'unget'($P2)
.annotate 'line', 2242
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2243
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2246
    $P2 = __ARG_1.'get'()
.annotate 'line', 2247
    __ARG_1.'unget'($P2)
.annotate 'line', 2248
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2249
    .tailcall WSubId_52($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2252
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2254
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2256
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2258
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2260
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2262
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2264
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2266
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2268
    .tailcall WSubId_53($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2270
    .tailcall WSubId_54($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2272
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2274
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2277
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
# {
.annotate 'line', 2278
# var t2: $P4
    $P4 = __ARG_1.'get'()
.annotate 'line', 2279
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2280
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2281
    __ARG_1.'unget'($P4)
# }
  __label_31: # endif
.annotate 'line', 2283
    __ARG_1.'unget'($P1)
.annotate 'line', 2284
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 2285

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2295
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2296

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2297
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2300
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2301

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2304
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2305

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2308
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2309

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2312
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2313

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2316
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2317

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2320
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2321

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2324
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2325

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2328
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2329

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2332
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2333

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2336
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2337

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2340
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2341

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2344
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2345

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2348
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2349

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2356
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2357

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2360
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2361

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2364
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2365

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2368
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2370
    .return(self)
# }
.annotate 'line', 2371

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2291
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2376
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2379
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2380

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2381
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2374
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2394
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2395
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2396
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2397
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2398
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2399
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2400
    null $I2
  __label_4: # endif
.annotate 'line', 2401
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2397
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2403
    unless $I2 goto __label_7
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
# }
.annotate 'line', 2404

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2390
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2411
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2412
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2413

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2414
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2417
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2418
    .return(self)
# }
.annotate 'line', 2419

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 2422
    getattribute $P1, self, 'statements'
    WSubId_55(__ARG_1, $P1)
# }
.annotate 'line', 2423

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2407
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
# switch-case
.annotate 'line', 2429
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2431
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2430
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2432
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2434
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 2436

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 2444
# var arg: $P1
    null $P1
.annotate 'line', 2445
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2446
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2447
    $P2 = __ARG_1.'get'()
.annotate 'line', 2448
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2449
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2452
    __ARG_1.'unget'($P2)
.annotate 'line', 2453
    $P1 = WSubId_40(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2455
    .return($P1)
# }
.annotate 'line', 2456

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2465
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2466
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2467
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2468
    unless $I1 goto __label_1
.annotate 'line', 2469
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2470
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2471
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2472
    $P1 = __ARG_2.'get'()
.annotate 'line', 2473
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2474
    __ARG_2.'unget'($P1)
.annotate 'line', 2475
    $P3 = WSubId_39(__ARG_2, __ARG_3, WSubId_56, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2477
    WSubId_57(';', __ARG_2)
# }
.annotate 'line', 2478

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2481
    getattribute $P1, self, 'args'
    WSubId_41($P1)
.annotate 'line', 2482
    .return(self)
# }
.annotate 'line', 2483

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2486
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2487
    self.'annotate'(__ARG_1)
.annotate 'line', 2488
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2489
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2490
    __ARG_1.'print'('    ')
.annotate 'line', 2491
    unless_null $P1, __label_2
.annotate 'line', 2492
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2494
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2495
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2496
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2497
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2499

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2458
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2460
    addattribute $P0, 'opname'
.annotate 'line', 2461
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2511
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2512
# var path: $P1
    $P1 = WSubId_58(__ARG_2)
.annotate 'line', 2513
# predefined elements
    elements $I1, $P1
    if $I1, __label_1
.annotate 'line', 2514
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2515
    WSubId_57(';', __ARG_2)
.annotate 'line', 2516
    $P3 = WSubId_59($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2517
    .return(self)
# }
.annotate 'line', 2518

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2519
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2522
    self.'annotate'(__ARG_1)
.annotate 'line', 2523
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2524

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2506
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2508
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 2536
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2537
# var names: $P1
    null $P3
    $P1 = WSubId_39(__ARG_2, $P3, WSubId_60, ';')
.annotate 'line', 2538
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2539
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2540
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2542
    setattribute self, 'names', $P1
# }
.annotate 'line', 2543

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2546
    .return(self)
# }
.annotate 'line', 2547

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2550
    self.'annotate'(__ARG_1)
.annotate 'line', 2551
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2552
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2553
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2555

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2531
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2533
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2569
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2570
# var path: $P1
    $P1 = WSubId_58(__ARG_2)
.annotate 'line', 2571
# predefined elements
    elements $I1, $P1
    if $I1, __label_1
.annotate 'line', 2572
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2573
    WSubId_57(';', __ARG_2)
.annotate 'line', 2574
    setattribute self, 'path', $P1
# }
.annotate 'line', 2575

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2578
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2579
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2581
# var symbol: $P3
    $P3 = self.'scopesearch'($P1, 0)
# switch-case
.annotate 'line', 2583
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2597
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2584
# predefined elements
    elements $I2, $P1
    unless $I2, __label_5
# {
.annotate 'line', 2585
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2586
    $P4.'pop'()
.annotate 'line', 2587
# var ns: $P5
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2588
    if_null $P5, __label_6
# {
.annotate 'line', 2589
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2590
    if_null $P3, __label_7
# {
.annotate 'line', 2591
    self.'createvarused'($P2, $P3)
.annotate 'line', 2592
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
.annotate 'line', 2598
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2599
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2600
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2601
    self.'usesubid'($S1)
.annotate 'line', 2602
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2604
    self.'createvar'($P2, 'P')
.annotate 'line', 2605
    .return(self)
# }
.annotate 'line', 2606

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 2609
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2610
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2611
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2612
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2613
    self.'annotate'(__ARG_1)
.annotate 'line', 2614
# key: $S2
    null $S2
.annotate 'line', 2615
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2616
    $P1.'pop'()
.annotate 'line', 2617
    $P3 = WSubId_22($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2619
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2621

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2562
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2564
    addattribute $P0, 'path'
.annotate 'line', 2565
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2631
# var nskey: $P1
    $P1 = WSubId_58(__ARG_2)
.annotate 'line', 2632
# predefined elements
    elements $I1, $P1
    if $I1, __label_1
.annotate 'line', 2633
    WSubId_43('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2634
# var nssym: $P2
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2635
    unless_null $P2, __label_2
.annotate 'line', 2636
    WSubId_1('unknown namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2637
    __ARG_3.'usenamespace'($P2)
# }
.annotate 'line', 2638

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_61 = "WSubId_61"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2644
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2645
    WSubId_61(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2646
    WSubId_57(';', __ARG_2)
# }
.annotate 'line', 2647

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2650
    .return(self)
# }
.annotate 'line', 2651

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2640
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2666
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2667
    $P2 = WSubId_40(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2668
    WSubId_57(';', __ARG_2)
# }
.annotate 'line', 2669

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2672
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2673
    .return(self)
# }
.annotate 'line', 2674

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2677
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2678

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2661
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2663
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
.annotate 'line', 2695
    setattribute self, 'type', __ARG_1
.annotate 'line', 2696
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2697
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2698
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2699

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2702
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2703

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2704
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2705
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2706
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2707
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2708
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2709
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2710
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags


.sub 'issubid' :method
# Body
# {
.annotate 'line', 2713
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 2714
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_1
    set $S2, $P1
# predefined substr
    substr $S1, $S2, 0, 7
    iseq $I1, $S1, 'WSubId_'
  __label_1:
    .return($I1)
# }
.annotate 'line', 2715

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2687
    addattribute $P0, 'type'
.annotate 'line', 2688
    addattribute $P0, 'reg'
.annotate 'line', 2689
    addattribute $P0, 'scope'
.annotate 'line', 2690
    addattribute $P0, 'flags'
.annotate 'line', 2691
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2723
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2724

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2727
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2728

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2720
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
.annotate 'line', 2737
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2738

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2739
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2742
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2743
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2744
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2745

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2731
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2733
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2756
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2757

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2760
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2761
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2762
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2763
    if_null $P2, __label_2
.annotate 'line', 2764
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2765
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2766
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2767
    $P1[$S1] = $P3
.annotate 'line', 2768
    .return($P3)
# }
.annotate 'line', 2769

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2772
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2773
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2774
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2775
    if_null $P2, __label_2
.annotate 'line', 2776
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2777
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2778

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2781
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2782
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2783
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2784
    if_null $P2, __label_2
.annotate 'line', 2785
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2786
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2787

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2790
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2791
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2792
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2793
    if_null $P2, __label_2
.annotate 'line', 2794
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2795
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2796
    $P1[$S1] = $P3
.annotate 'line', 2797
    .return($P3)
# }
.annotate 'line', 2798

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2801
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2802
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2803

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2806
# var sym: $P1
    null $P1
.annotate 'line', 2807
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2808
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2809
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2811
    .return($P3)
# }
.annotate 'line', 2812

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2815
# var sym: $P1
    null $P1
.annotate 'line', 2816
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2817
    .return($P1)
  __label_1: # endif
.annotate 'line', 2818
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2819
    .return($P1)
  __label_2: # endif
.annotate 'line', 2820
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2821
    if_null $P2, __label_3
.annotate 'line', 2822
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2823
    .return($P3)
# }
.annotate 'line', 2824

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2827
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2828
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2829
    .return($S1)
# }
.annotate 'line', 2830

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2833
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2835
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2836
    .return('__WLEX_self')
# }
.annotate 'line', 2837

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2751
    addattribute $P0, 'locals'
.annotate 'line', 2752
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2846
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
.annotate 'line', 2858
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2859

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2860
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2861
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2862
    .return(0)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
.annotate 'line', 2863
    .return(0)
# }

.end # isintegerzero


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2864
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2865
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2866
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2867
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2868
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2869
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2872
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2873

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2877
    .return(self)
# }
.annotate 'line', 2878

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2879
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2882
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2883
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2884
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2885
    .return($S2)
# }
.annotate 'line', 2886

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2889
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 2890
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 2891
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 2892

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2895
# reg: $S1
    null $S1
.annotate 'line', 2896
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2897
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2899
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2900
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2902
    .return($S1)
# }
.annotate 'line', 2903

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 2906
    WSubId_62(self)
# }
.annotate 'line', 2907

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2854
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2912
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2910
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2922
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2923
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2924
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2925
    WSubId_43('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2926
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2927

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2928
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2931
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2932
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2933
    .return(self)
# }
.annotate 'line', 2934

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2937
    self.'annotate'(__ARG_1)
.annotate 'line', 2938
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2939
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2940
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2941
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2942
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2944
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2946

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2917
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2919
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
.annotate 'line', 2961
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2962
    .return(self)
# }
.annotate 'line', 2963

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2966
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2967

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2970
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2971
    .return(self)
# }
.annotate 'line', 2972

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2975
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2976
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2977
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
.annotate 'line', 2978
    .return(0)
# }
.annotate 'line', 2979

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2982
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2984
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2985
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2986
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2988
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2989
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
.annotate 'line', 2992
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2995
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2998
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3001

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3004
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3006
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3007
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3008
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3010
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3011
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
.annotate 'line', 3014
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3017
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3020
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3023

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2958
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 3030
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 3031
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3028
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3041
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3042
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 3043

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 3044
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3045
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 3048
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3049
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3050
    .return($S1)
# }
.annotate 'line', 3051

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 3054
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3055
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3056
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3057
# predefined unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3058
    .return($S1)
# }
.annotate 'line', 3059

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3062
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 3063
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 3064

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3067
    .tailcall self.'getPirString'()
# }
.annotate 'line', 3068

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3036
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3038
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3079
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3080
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3081
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 3082
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 3083

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 3084
    .return(1)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
# predefined int
.annotate 'line', 3087
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
# }
.annotate 'line', 3088

.end # isintegerzero


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3089
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 3092
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 3093

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3096
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3097
    .return($N1)
# }
.annotate 'line', 3098

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3101
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 3102
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3103
    if $I1, __label_2
.annotate 'line', 3104
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3106
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3108

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3111
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 3112

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3073
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3075
    addattribute $P0, 'pos'
.annotate 'line', 3076
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3122
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3123
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 3124

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 3125
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3126
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3129
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3130
    .return($N1)
# }
.annotate 'line', 3131

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3134
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3135
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3136
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3138

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 3141
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3142
    .tailcall WSubId_63($N1)
# }
.annotate 'line', 3143

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3117
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3119
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3152
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3155
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3156
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3157

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3160
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3161
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3162
    .return(0)
  __label_1: # endif
.annotate 'line', 3163
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3164

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3167
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3168
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3169
    if_null $P2, __label_1
.annotate 'line', 3170
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3172
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3175
    .return('P')
  __label_4: # default
.annotate 'line', 3177
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3180

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3183
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3184
    .return($S1)
# }
.annotate 'line', 3185

.end # getName


.sub 'checkVar' :method
# Body
# {
.annotate 'line', 3188
    getattribute $P1, self, 'owner'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
# }
.annotate 'line', 3189

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3192
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3193
    unless_null $P1, __label_1
.annotate 'line', 3194
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3195
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3196
# s: $S1
    null $S1
.annotate 'line', 3197
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3198
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3201
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3203
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3207
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3208
    .return($S1)
# }
.annotate 'line', 3209

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 3212
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3213
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3214
    getattribute $P2, self, 'name'
    WSubId_64($P2)
  __label_1: # endif
.annotate 'line', 3215
    .return($P1)
# }
.annotate 'line', 3216

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3219
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3220
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3221
    if_null $P2, __label_1
# {
.annotate 'line', 3222
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3223
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3224
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3225
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3226
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3227
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3234
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3235
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3236
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
.annotate 'line', 3240
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3241
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3242
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_11
# {
.annotate 'line', 3243
# id: $S1
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_12
    set $S1, $P6
  __label_12:
.annotate 'line', 3244
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3245
    self.'usesubid'($S1)
.annotate 'line', 3246
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3250
    .return(self)
# }
.annotate 'line', 3251

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3254
# id: $S1
    null $S1
.annotate 'line', 3255
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3256
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3258
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3259
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3260
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3261
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3262
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3263
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3264
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3265
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3269
    .return($S1)
# }
.annotate 'line', 3270

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3273
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3274
    self.'annotate'(__ARG_1)
.annotate 'line', 3275
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3276
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3278

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3281
    self.'annotate'(__ARG_1)
.annotate 'line', 3282
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3283

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3286
    self.'annotate'(__ARG_1)
.annotate 'line', 3287
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3288
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3289
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3290
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3291
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3292
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3295
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3298
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3301
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3302
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3304
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3305
    ne $S3, 'v', __label_13
.annotate 'line', 3306
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3307
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3308
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3311
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3312
    self.'annotate'(__ARG_1)
.annotate 'line', 3313
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3314
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3316
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3319
    .return($S2)
# }
.annotate 'line', 3320

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3148
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3150
    addattribute $P0, 'name'
.annotate 'line', 3151
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3330
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3331
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3332

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3335
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3336

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3339
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3340
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3341
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3342
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3343
    .return($S2)
# }
.annotate 'line', 3344

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3347
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3348
    self.'annotate'(__ARG_1)
.annotate 'line', 3349
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3350
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3352

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3355
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3356
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3357
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3359
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3362
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3360
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3363
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3366
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3367
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3368
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3370
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3371
    self.'annotate'(__ARG_1)
.annotate 'line', 3372
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3376
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3377

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3380
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3381

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3325
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3327
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3390
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3391

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3386
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 3401
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3402
    $P2 = WSubId_58(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3403
    getattribute $P1, self, 'key'
# predefined elements
    elements $I1, $P1
    if $I1, __label_1
.annotate 'line', 3404
    WSubId_43('namespace identifier', __ARG_3)
  __label_1: # endif
# }
.annotate 'line', 3405

.end # OpNamespaceExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3406
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 3409
# var sym: $P1
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'key'
    $P1 = $P3.'scopesearch'($P4, 1)
.annotate 'line', 3410
    unless_null $P1, __label_1
.annotate 'line', 3411
    getattribute $P3, self, 'start'
    WSubId_1('unknown namespace', $P3)
  __label_1: # endif
.annotate 'line', 3412
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 3413
    $P3 = WSubId_22($P2)
    __ARG_1.'say'('    get_namespace ', __ARG_2, ', ', $P3)
# }
.annotate 'line', 3414

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3396
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3398
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 3425
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3426
    $P2 = WSubId_65(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3427

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3428
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3431
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3434
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3435
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3436
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3437
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3438
    __ARG_1.'say'()
# }
.annotate 'line', 3439

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3419
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3421
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3449
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3450
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3451

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3454
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3455

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3458
    self.'optimizearg'()
.annotate 'line', 3459
    .return(self)
# }
.annotate 'line', 3460

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3444
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3446
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
.annotate 'line', 3471
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3472
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3473
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3474

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3477
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3478
    .return(self)
# }
.annotate 'line', 3479

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3482
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3483

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3486
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3487
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3488

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3491
    self.'optimizearg'()
.annotate 'line', 3492
    .return(self)
# }
.annotate 'line', 3493

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3496
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3497

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3500
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3501

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3465
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3467
    addattribute $P0, 'lexpr'
.annotate 'line', 3468
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3510
    .return('I')
# }
.annotate 'line', 3511

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3514
    self.'optimizearg'()
.annotate 'line', 3515
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3516
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3517
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3518
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3519
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3520
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3522
    .return(self)
# }
.annotate 'line', 3523

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3506
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3532
    .return('I')
# }
.annotate 'line', 3533

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3528
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
.annotate 'line', 3541
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3542

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3545
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3546
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3547
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3548
    self.'annotate'(__ARG_1)
.annotate 'line', 3549
    __ARG_1.'print'('    delete ')
.annotate 'line', 3550
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3551
    __ARG_1.'say'()
.annotate 'line', 3552
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3553
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3556
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3557

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3537
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
.annotate 'line', 3564
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3565

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3568
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3569
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
.annotate 'line', 3570
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3571
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3572
    self.'annotate'(__ARG_1)
.annotate 'line', 3573
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3574
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3575
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3578
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3579

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3560
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
.annotate 'line', 3588
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3589

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3592
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3593

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3596
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3597
    .return(self)
# }
.annotate 'line', 3598

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 3601
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3602
    self.'optimizearg'()
.annotate 'line', 3603
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3604
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3605
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3608
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3609
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3610
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_66($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3613
    .return(self)
# }
.annotate 'line', 3614

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3617
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3618
    self.'annotate'(__ARG_1)
.annotate 'line', 3619
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3620

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3584
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
.annotate 'line', 3629
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3630

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3631
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3634
    .return('I')
# }
.annotate 'line', 3635

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3638
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3639
    .return(self)
# }
.annotate 'line', 3640

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3643
    self.'optimizearg'()
.annotate 'line', 3644
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3645
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3646
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3647
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3649
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3650
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3651
    .return(self)
# }
.annotate 'line', 3652

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3655
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3656

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3659
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3660
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3661
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3662
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3664
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3667
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3670
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3672

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3625
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3681
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3682

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3685
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3686
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3687
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3688

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3677
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3697
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3698
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3699
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3700

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3693
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
.annotate 'line', 3707
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3708

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3711
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3712
    self.'annotate'(__ARG_1)
.annotate 'line', 3713
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3714
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3715
    .return($S1)
# }
.annotate 'line', 3716

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3703
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
.annotate 'line', 3723
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3724

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3727
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3728
    self.'annotate'(__ARG_1)
.annotate 'line', 3729
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3730
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3731
    .return($S1)
# }
.annotate 'line', 3732

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3719
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
.annotate 'line', 3741
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3742

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3745
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3746
    self.'annotate'(__ARG_1)
.annotate 'line', 3747
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3748
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3749
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3750
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3751
    .return($S1)
# }
.annotate 'line', 3752

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3737
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
.annotate 'line', 3759
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3760

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3763
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3764
    self.'annotate'(__ARG_1)
.annotate 'line', 3765
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3766
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3767
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3768
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3769
    .return($S1)
# }
.annotate 'line', 3770

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3755
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
.annotate 'line', 3781
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3782
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3783
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3784
    .return(self)
# }
.annotate 'line', 3785

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3788
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3789

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3792
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3793
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3794
    .return(self)
# }
.annotate 'line', 3795

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3798
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3799

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 3802
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3803
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3804
    WSubId_62($P1)
  __label_1: # endif
# }
.annotate 'line', 3805

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3808
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3809
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3810
    self.'annotate'(__ARG_1)
.annotate 'line', 3811
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3813

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3775
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3777
    addattribute $P0, 'lexpr'
.annotate 'line', 3778
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3822
    self.'annotate'(__ARG_1)
.annotate 'line', 3823
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3824
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3825

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3818
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3834
    self.'annotate'(__ARG_1)
.annotate 'line', 3835
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3836
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3837
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3838

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3841
    self.'checkleft'()
.annotate 'line', 3842
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3843
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 3844
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 3845
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3846
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3847
    self.'annotate'(__ARG_1)
.annotate 'line', 3848
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3849
    .return($S1)
# }
.annotate 'line', 3850

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3830
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3859
    self.'checkleft'()
.annotate 'line', 3860
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3861
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3862
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3863
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3864
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3865
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3866
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3868
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3869
# aux: $S5
    null $S5
.annotate 'line', 3870
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3871
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3873
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3874
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3875
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3876
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3878
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3882
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3883
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3884
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3885
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3887
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3890
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3893
    .return($S3)
# }
.annotate 'line', 3894

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3855
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3903
    self.'checkleft'()
.annotate 'line', 3904
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3905
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3906
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3907
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3908
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3909
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3910
# aux: $S5
    null $S5
.annotate 'line', 3911
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3912
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3914
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3917
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3918
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3919
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3920
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3922
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3925
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3927
    .return($S3)
# }
.annotate 'line', 3928

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3899
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3937
    self.'checkleft'()
.annotate 'line', 3938
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3939
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3940
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3941
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3942
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3944
    ne $S2, 'I', __label_7
.annotate 'line', 3945
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3947
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3948
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3950
    self.'annotate'(__ARG_1)
.annotate 'line', 3951
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3954
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3955
    self.'annotate'(__ARG_1)
.annotate 'line', 3956
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3958
    .return($S3)
# }
.annotate 'line', 3959

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3933
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3968
    self.'checkleft'()
.annotate 'line', 3969
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3970
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3971
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3972
    self.'annotate'(__ARG_1)
.annotate 'line', 3973
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3974
    .return($S2)
# }
.annotate 'line', 3975

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3964
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3984
    self.'checkleft'()
.annotate 'line', 3985
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3986
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3987
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3988
    self.'annotate'(__ARG_1)
.annotate 'line', 3989
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3990
    .return($S2)
# }
.annotate 'line', 3991

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3980
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3998
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4001
    self.'optimizearg'()
.annotate 'line', 4002
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4003
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4004
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4005
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4006
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4007
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 4009
    .return(self)
# }
.annotate 'line', 4010

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 4013
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4014
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4015
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4016
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4017
    self.'annotate'(__ARG_1)
.annotate 'line', 4018
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 4020
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4025
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4030
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4035
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4040
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4045
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4021
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4022
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4023
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4026
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4027
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4028
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4031
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4032
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4033
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4036
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4037
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4038
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4041
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4042
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4043
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4046
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4047
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4048
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4049
# switch
.annotate 'line', 4052
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4054
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4057
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 4060
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 4061
# }
.annotate 'line', 4063

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4066
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4067

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4070
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4071

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4074
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 4075

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3996
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4090
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4091
    setattribute self, 'expr', __ARG_2
.annotate 'line', 4092
    new $P2, [ 'Boolean' ], __ARG_3
    setattribute self, 'positive', $P2
# }
.annotate 'line', 4093

.end # CheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4094
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4095
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4098
# var positive: $P1
    getattribute $P1, self, 'positive'
.annotate 'line', 4099
# n: $I1
    isfalse $I1, $P1
.annotate 'line', 4100
    assign $P1, $I1
.annotate 'line', 4101
    .return(self)
# }
.annotate 'line', 4102

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4083
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4085
    addattribute $P0, 'expr'
.annotate 'line', 4086
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4109
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4110

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4113
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4114
    self.'annotate'(__ARG_1)
.annotate 'line', 4115
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4116
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4117
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 4118

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4121
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4122
    self.'annotate'(__ARG_1)
.annotate 'line', 4123
    getattribute $P1, self, 'positive'
    if_null $P1, __label_3
    unless $P1 goto __label_3
    set $S2, 'unless'
    goto __label_2
  __label_3:
    set $S2, 'if'
  __label_2:
    __ARG_1.'say'('    ', $S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 4124

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4105
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]

.sub 'ZeroCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4131
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4132

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4135
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4136
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4137
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'I', __label_2
# {
.annotate 'line', 4138
# aux: $S2
    $P3 = self.'tempreg'('I')
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 4139
    self.'annotate'(__ARG_1)
.annotate 'line', 4140
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 4141
    set $S1, $S2
# }
  __label_2: # endif
.annotate 'line', 4143
    set $S3, __ARG_2
    eq $S3, '', __label_4
# {
.annotate 'line', 4144
    self.'annotate'(__ARG_1)
.annotate 'line', 4145
    getattribute $P2, self, 'positive'
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 4146
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_6
  __label_5: # else
.annotate 'line', 4148
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_6: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 4150

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4153
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4154
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4155
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'I', __label_2
# {
.annotate 'line', 4156
# aux: $S2
    $P3 = self.'tempreg'('I')
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 4157
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 4158
    set $S1, $S2
# }
  __label_2: # endif
.annotate 'line', 4160
    self.'annotate'(__ARG_1)
.annotate 'line', 4161
    getattribute $P2, self, 'positive'
    if_null $P2, __label_5
    unless $P2 goto __label_5
    set $S3, 'if '
    goto __label_4
  __label_5:
    set $S3, 'unless '
  __label_4:
    __ARG_1.'say'('    ', $S3, $S1, ', ', __ARG_2)
# }
.annotate 'line', 4162

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4127
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4169
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4172
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4173

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4176
    self.'optimizearg'()
.annotate 'line', 4177
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4178
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4179
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4180
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4181
    unless $I1 goto __label_1
# {
.annotate 'line', 4182
    unless $I2 goto __label_2
.annotate 'line', 4183
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4185
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    $P6.'NullCheckerExpr'(self, $P2, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4187
    unless $I2 goto __label_4
.annotate 'line', 4188
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    $P4.'NullCheckerExpr'(self, $P1, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4189
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4190
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4191
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_8
    $I5 = $P2.'isliteral'()
  __label_8:
    unless $I5 goto __label_7
# {
.annotate 'line', 4192
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4193
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4195
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4196
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4197
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I6, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I6)
  __label_13: # case
.annotate 'line', 4199
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 4200
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 4201
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    iseq $I7, $S3, $S4
    .tailcall WSubId_21($P11, $P12, $I7)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_7: # endif
.annotate 'line', 4205
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_16
    unless $P3 goto __label_16
.annotate 'line', 4206
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    $P5.'ZeroCheckerExpr'(self, $P1, 1)
    set $P4, $P5
    .return($P4)
  __label_16: # endif
.annotate 'line', 4207
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_17
    unless $P3 goto __label_17
.annotate 'line', 4208
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    $P5.'ZeroCheckerExpr'(self, $P2, 1)
    set $P4, $P5
    .return($P4)
  __label_17: # endif
.annotate 'line', 4209
    .return(self)
# }
.annotate 'line', 4210

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4213
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4214

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4217
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4218

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4221
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4222

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4225
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4226

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4167
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4233
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4236
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4237

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4240
    self.'optimizearg'()
.annotate 'line', 4241
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4242
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4243
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4244
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4245
    unless $I1 goto __label_1
# {
.annotate 'line', 4246
    unless $I2 goto __label_2
.annotate 'line', 4247
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4249
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    $P6.'NullCheckerExpr'(self, $P2, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4251
    unless $I2 goto __label_4
.annotate 'line', 4252
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    $P4.'NullCheckerExpr'(self, $P1, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4253
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4254
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4255
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_8
    $I5 = $P2.'isliteral'()
  __label_8:
    unless $I5 goto __label_7
# {
.annotate 'line', 4256
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4257
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4259
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4260
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4261
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I6, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I6)
  __label_13: # case
.annotate 'line', 4263
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 4264
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 4265
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    isne $I7, $S3, $S4
    .tailcall WSubId_21($P11, $P12, $I7)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_7: # endif
.annotate 'line', 4269
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_16
    unless $P3 goto __label_16
.annotate 'line', 4270
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    $P5.'ZeroCheckerExpr'(self, $P1, 0)
    set $P4, $P5
    .return($P4)
  __label_16: # endif
.annotate 'line', 4271
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_17
    unless $P3 goto __label_17
.annotate 'line', 4272
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    $P5.'ZeroCheckerExpr'(self, $P2, 0)
    set $P4, $P5
    .return($P4)
  __label_17: # endif
.annotate 'line', 4273
    .return(self)
# }
.annotate 'line', 4274

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4277
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4278

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4281
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4282

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4285
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4286

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4289
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4290

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 4231
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
.annotate 'line', 4300
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 4301
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 4302

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4303
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4306
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4307
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
.annotate 'line', 4308

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4311
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
.annotate 'line', 4312

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4315
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4316
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4317
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4318

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4321
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4322

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4325
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4326
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4327
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4328

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4331
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4332
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4333
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4334

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4295
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 4297
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4341
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4344
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4345

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4348
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4349

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4352
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4353

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4356
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4357

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4360
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4361

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4339
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4368
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4371
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4372

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4375
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4376

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4379
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4380

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4383
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4384

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4387
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4388

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4366
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4395
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4398
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4399

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4402
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4403

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4406
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4407

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4410
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4411

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4414
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4415

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4393
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4422
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4425
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4426

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4429
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4430

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4433
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4434

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4437
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4438

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4441
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4442

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4420
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4451
    .return('I')
# }
.annotate 'line', 4452

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4447
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
.annotate 'line', 4461
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4462

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4465
    self.'optimizearg'()
.annotate 'line', 4466
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4467
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4468
    unless $I1, __label_3
.annotate 'line', 4469
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4470
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    $P1 = WSubId_21($P2, $P3, $I1)
  __label_2:
.annotate 'line', 4468
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4472
    .return(self)
# }
.annotate 'line', 4473

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4476
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
.annotate 'line', 4477
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4478
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4479
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4480
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4483
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4484
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4485
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4486
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4487
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4489

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4457
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
.annotate 'line', 4498
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4499

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4502
    self.'optimizearg'()
.annotate 'line', 4503
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4504
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4505
    if $I1, __label_3
.annotate 'line', 4506
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4507
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    $P1 = WSubId_21($P2, $P3, $I1)
  __label_2:
.annotate 'line', 4505
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4509
    .return(self)
# }
.annotate 'line', 4510

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4513
# res: $S1
    null $S1
.annotate 'line', 4514
    if_null __ARG_2, __label_1
.annotate 'line', 4515
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4517
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4518
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4519
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4520
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4521
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4524
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4525
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4526
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4527
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4528
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4530

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4494
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4535
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
.annotate 'line', 4545
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4546

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4549
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
.annotate 'line', 4550
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4551
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4552
    self.'annotate'(__ARG_1)
.annotate 'line', 4553
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4554

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4557
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4558

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4541
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
.annotate 'line', 4567
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4568

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4571
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
.annotate 'line', 4572
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4573
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4574
    self.'annotate'(__ARG_1)
.annotate 'line', 4575
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4576

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4579
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4580

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4563
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
.annotate 'line', 4589
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4590

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4593
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
.annotate 'line', 4594
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4595
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4596
    self.'annotate'(__ARG_1)
.annotate 'line', 4597
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4598

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4601
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4602

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4585
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
.annotate 'line', 4612
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4614
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4621
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4615
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4616
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4617
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4619
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4622
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4623
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4626
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 2
    $P10[0] = __ARG_3
    $P10[1] = __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4628

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4629
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4632
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4633
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4634
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4635
# i: $I2
    null $I2
# for loop
.annotate 'line', 4636
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4637
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4636
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4638
    .return($P2)
# }
.annotate 'line', 4639

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4642
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4643
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4644
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
.annotate 'line', 4645
    self.'annotate'(__ARG_1)
.annotate 'line', 4646
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4647
# i: $I2
    set $I2, 2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 4648
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_4: # for iteration
.annotate 'line', 4647
    inc $I2
    goto __label_6
  __label_5: # for end
# }
.annotate 'line', 4649

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4652
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4653
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4654
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4655
    self.'annotate'(__ARG_1)
.annotate 'line', 4656
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4657
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4658
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4657
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4659
    .return($S1)
# }
.annotate 'line', 4660

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4663
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4664
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4665
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4666
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4667
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4666
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4668

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4607
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4609
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4677
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4678

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4679
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4682
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4683
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4684
# rreg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4685
# rval: $S3
    null $S3
# switch
.annotate 'line', 4686
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'I'
    if $S4 == $S5 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 4688
    set $S3, $S2
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 4691
    $P3 = self.'tempreg'('I')
    set $S3, $P3
.annotate 'line', 4692
    __ARG_1.'emitset'($S3, $S2)
  __label_3: # switch end
.annotate 'line', 4694
    self.'annotate'(__ARG_1)
.annotate 'line', 4695
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S3)
# }
.annotate 'line', 4696

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4673
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
.annotate 'line', 4705
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4706

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 4709
    self.'optimizearg'()
.annotate 'line', 4710
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4711
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4712
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4713
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4714
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4715
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4720
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4721
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4722
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4724
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# predefined string
.annotate 'line', 4725
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
.annotate 'line', 4727
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P3, 'file'
    getattribute $P13, $P3, 'line'
# predefined string
.annotate 'line', 4728
    $P14 = $P3.'getasquoted'()
    set $S6, $P14
# predefined string
    $P15 = $P4.'getasquoted'()
    set $S7, $P15
    concat $S8, $S6, $S7
    $P11.'TokenQuoted'($P12, $P13, $S8)
    set $P5, $P11
  __label_7:
.annotate 'line', 4729
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4731
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4732
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4733
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4734
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4737
    $P6 = WSubId_67($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4738
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4739
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4740
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_66($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4744
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4745
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4747
    .return(self)
# }
.annotate 'line', 4748

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 4751
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4752
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4753
    ne $S1, $S2, __label_3
.annotate 'line', 4754
    .return($S1)
  __label_3: # endif
.annotate 'line', 4755
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4756
    .return('S')
  __label_4: # endif
.annotate 'line', 4757
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4758
    .return('S')
  __label_6: # endif
.annotate 'line', 4759
    $P1 = WSubId_67($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4760
    .return('N')
  __label_8: # endif
.annotate 'line', 4761
    .return('I')
# }
.annotate 'line', 4762

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4765
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4766
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4767
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4768
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4769
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4771
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4772
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4773
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4774
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4775
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4776
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4777
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4778
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4781
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4782
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4785
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4788
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4789
# l: $S7
    null $S7
.annotate 'line', 4790
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4792
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4793
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4795
# r: $S8
    null $S8
.annotate 'line', 4796
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4798
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4799
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4801
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4804
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4806

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4701
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
.annotate 'line', 4815
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4816

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4819
    self.'optimizearg'()
.annotate 'line', 4820
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4821
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4822
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4823
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4824
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4825
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4826
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4827
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4828
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4831
    .return(self)
# }
.annotate 'line', 4832

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4835
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4836
# rtype: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
# switch-case
.annotate 'line', 4838
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 4840
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 4842
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 4844
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 4839
    .return($S1)
  __label_6: # case
.annotate 'line', 4841
    .return('P')
  __label_8: # case
.annotate 'line', 4843
    .return('N')
  __label_10: # case
.annotate 'line', 4845
    .return('N')
  __label_4: # default
.annotate 'line', 4847
    .return('I')
  __label_3: # switch end
# }
.annotate 'line', 4849

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4852
# type: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4853
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4854
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4855
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4856
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4857
# lreg: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4858
# rreg: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4859
# aux: $S6
    null $S6
.annotate 'line', 4860
    eq $S2, $S1, __label_6
# {
.annotate 'line', 4861
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4862
    ne $S1, 'P', __label_7
.annotate 'line', 4863
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 4865
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 4866
    set $S4, $S6
# }
  __label_6: # endif
.annotate 'line', 4868
    eq $S3, $S1, __label_9
# {
.annotate 'line', 4869
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4870
    ne $S1, 'P', __label_10
.annotate 'line', 4871
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 4873
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 4874
    set $S5, $S6
# }
  __label_9: # endif
.annotate 'line', 4876
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
# }
.annotate 'line', 4877

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4811
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
.annotate 'line', 4886
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4887

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 4890
    self.'optimizearg'()
.annotate 'line', 4891
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4892
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4893
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4894
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4895
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4896
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'I'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4897
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4898
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4899
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4902
    $P3 = WSubId_67($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4903
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 4904
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 4905
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_66($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4909
    ne $S1, 'S', __label_8
.annotate 'line', 4910
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 4911
    .return(self)
# }
.annotate 'line', 4912

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4915
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4916
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4917
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4918
    ne $S1, $S2, __label_3
.annotate 'line', 4919
    .return($S1)
  __label_3: # endif
.annotate 'line', 4920
    ne $S1, 'S', __label_4
.annotate 'line', 4921
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4923
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4924

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4927
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4928
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4929
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4930
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4931
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4932
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
.annotate 'line', 4933
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4934
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4935
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4936
    .return()
# }
  __label_3: # endif
.annotate 'line', 4941
    ne $S1, 'N', __label_7
# {
.annotate 'line', 4942
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4943
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4944
# rval: $S5
    null $S5
# switch
.annotate 'line', 4945
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 4947
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 4948
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4949
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 4952
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4955
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 4956
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 4958
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 4959
    self.'annotate'(__ARG_1)
.annotate 'line', 4960
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_12: # endif
.annotate 'line', 4962
    .return()
# }
  __label_7: # endif
.annotate 'line', 4965
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4966
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_15
    $I3 = $P1.'isidentifier'()
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 4967
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4968
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 4971
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4972
    set $S3, $I1
# }
  __label_14: # endif
.annotate 'line', 4974
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P2.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4975
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4976
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_17
  __label_16: # else
# {
# switch
.annotate 'line', 4979
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_21
    set $S7, 'N'
    if $S6 == $S7 goto __label_22
    set $S7, 'I'
    if $S6 == $S7 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4981
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4982
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4985
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_23: # case
  __label_20: # default
.annotate 'line', 4989
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4990
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
.annotate 'line', 4991
# }
  __label_17: # endif
.annotate 'line', 4994
    self.'annotate'(__ARG_1)
.annotate 'line', 4995
    set $S6, __ARG_2
    ne $S6, '', __label_24
.annotate 'line', 4996
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_24: # endif
.annotate 'line', 4997
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4998

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4882
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
.annotate 'line', 5007
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5008

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5011
    self.'optimizearg'()
.annotate 'line', 5012
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5013
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5014
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 5015
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5016
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5017
# var lval: $P3
    null $P3
.annotate 'line', 5018
# var rval: $P4
    null $P4
.annotate 'line', 5019
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 5020
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5021
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5022
    unless $I2, __label_7
.annotate 'line', 5023
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
.annotate 'line', 5026
    $P5 = WSubId_67($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 5027
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5028
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5029
    set $I3, $N2
    unless $I3, __label_9
.annotate 'line', 5030
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_66($P5, $P6, $N3)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 5034
    .return(self)
# }
.annotate 'line', 5035

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5038
    .return('N')
# }
.annotate 'line', 5039

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5042
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5043
# var aux: $P2
    null $P2
.annotate 'line', 5044
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5045
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 5046
    $P2 = self.'tempreg'('N')
.annotate 'line', 5047
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5048
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 5050
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5051
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5052
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 5053
    $P2 = self.'tempreg'('N')
.annotate 'line', 5054
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5055
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 5057
    self.'annotate'(__ARG_1)
.annotate 'line', 5058
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 5059

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5003
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
.annotate 'line', 5068
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5069

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5072
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5073
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5074
    self.'annotate'(__ARG_1)
.annotate 'line', 5075
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5076

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5079
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5080

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5064
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
.annotate 'line', 5089
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5090

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5093
    .return('I')
# }
.annotate 'line', 5094

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5097
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5098
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5099
    self.'annotate'(__ARG_1)
.annotate 'line', 5104
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5105

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5085
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
.annotate 'line', 5114
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5115

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5118
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
.annotate 'line', 5119
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5120
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5121
    self.'annotate'(__ARG_1)
.annotate 'line', 5122
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 5123

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5126
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5127

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5110
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
.annotate 'line', 5136
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5137

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5140
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
.annotate 'line', 5141
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5142
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5143
    self.'annotate'(__ARG_1)
.annotate 'line', 5144
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 5145

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5148
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5149

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5132
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5158
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5159

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5162
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 5163
# setname: $S1
    set $S1, ''
.annotate 'line', 5164
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 5165
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5167
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5170
    set $I2, 1
# switch
.annotate 'line', 5171
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
.annotate 'line', 5175
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5176
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5177
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5178
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5181
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 5186
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5189
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5192
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5187
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5190
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5193
    __ARG_1.'print'(' :named')
.annotate 'line', 5194
    eq $S1, '', __label_17
.annotate 'line', 5195
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5196
# }
.annotate 'line', 5198

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5154
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5207
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5208
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 5209

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5212
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5213
    .return(self)
# }
.annotate 'line', 5214

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 5217
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 5218

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5203
    addattribute $P0, 'arg'
.annotate 'line', 5204
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 5223
# var modifier: $P1
    null $P1
.annotate 'line', 5224
# var expr: $P2
    $P2 = WSubId_40(__ARG_1, __ARG_2)
.annotate 'line', 5225
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5226
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 5227
    $P3 = __ARG_1.'get'()
.annotate 'line', 5228
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 5229
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5232
    WSubId_43('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5235
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5236
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 5237

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 5248
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5249
    setattribute self, 'start', __ARG_2
.annotate 'line', 5250
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5251
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5252
    __ARG_3.'unget'($P1)
.annotate 'line', 5253
    $P3 = WSubId_39(__ARG_3, __ARG_1, WSubId_68, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5255

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5258
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5259
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5260

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5263
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5264

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5267
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5268
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5269

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5272
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5273
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5274

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 5277
    getattribute $P1, self, 'args'
    WSubId_41($P1)
.annotate 'line', 5278
    .return(self)
# }
.annotate 'line', 5279

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5282
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5283
    unless_null $P1, __label_1
# {
.annotate 'line', 5284
    new $P2, ['ResizableStringArray']
.annotate 'line', 5285
# pnull: $S1
    set $S1, ''
.annotate 'line', 5286
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 5287
# var arg: $P4
    getattribute $P4, $P3, 'arg'
.annotate 'line', 5288
# reg: $S2
    null $S2
.annotate 'line', 5289
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5290
    ne $S1, '', __label_6
# {
.annotate 'line', 5291
    getattribute $P8, self, 'owner'
    $P7 = $P8.'tempreg'('P')
    set $S1, $P7
.annotate 'line', 5292
    __ARG_1.'emitnull'($S1)
# }
  __label_6: # endif
.annotate 'line', 5294
    set $S2, $S1
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5297
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
  __label_5: # endif
.annotate 'line', 5298
# predefined push
    push $P2, $S2
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5300
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5302
    .return($P1)
# }
.annotate 'line', 5303

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5306
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5307
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5309
# sep: $S1
    set $S1, ''
.annotate 'line', 5310
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5311
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5312
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5313
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5314
    if_null $P3, __label_4
.annotate 'line', 5315
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5316
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5311
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5318

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5241
    addattribute $P0, 'owner'
.annotate 'line', 5242
    addattribute $P0, 'start'
.annotate 'line', 5243
    addattribute $P0, 'args'
.annotate 'line', 5244
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_69')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5323
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5324
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5325
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5326
    .return(1)
# }
.annotate 'line', 5327

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5338
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5339
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5340
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5341

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5344
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5345

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5348
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5349
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5350
    new $P3, ['ResizableStringArray']
.annotate 'line', 5351
# var arg: $P4
    null $P4
.annotate 'line', 5352
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5353
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5355
    if_null $P2, __label_6
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5356
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5358
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5359
    ne $S1, '', __label_9
# {
.annotate 'line', 5360
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5361
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5363
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5365
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5369
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5370
    if_null $P2, __label_11
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5371
    getattribute $P6, $P4, 'arg'
# predefined push
    push $P5, $P6
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5372
    getattribute $P8, self, 'predef'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P5)
.annotate 'line', 5373
    .return()
  __label_2: # default
.annotate 'line', 5375
# n: $I1
    getattribute $P11, self, 'args'
    set $I1, $P11
# for loop
.annotate 'line', 5376
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5377
    $P12 = $P2[$I2]
    getattribute $P4, $P12, 'arg'
.annotate 'line', 5378
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5379
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5380
# argr: $S5
    null $S5
.annotate 'line', 5381
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5382
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
.annotate 'line', 5386
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5387
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5390
    ne $S1, '', __label_24
# {
.annotate 'line', 5391
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5392
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5394
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5398
    iseq $I3, $S3, $S4
    if $I3 goto __label_28
    iseq $I3, $S4, '?'
  __label_28:
    if $I3 goto __label_27
.annotate 'line', 5399
    iseq $I3, $S4, 'p'
    unless $I3 goto __label_29
.annotate 'line', 5400
    iseq $I3, $S3, 'S'
    if $I3 goto __label_30
    iseq $I3, $S3, 'P'
  __label_30:
  __label_29:
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5401
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5403
# aux: $S6
    null $S6
.annotate 'line', 5404
    ne $S4, 'p', __label_31
.annotate 'line', 5405
    set $S4, 'P'
  __label_31: # endif
.annotate 'line', 5406
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5407
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
.annotate 'line', 5409
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
.annotate 'line', 5413
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5414
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_38 # break
  __label_39: # default
.annotate 'line', 5417
    $P4.'emit'(__ARG_1, $S5)
  __label_38: # switch end
    goto __label_32 # break
  __label_35: # case
  __label_36: # case
  __label_37: # case
.annotate 'line', 5423
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5424
    __ARG_1.'emitset'($S5, $S6)
    goto __label_32 # break
  __label_33: # default
.annotate 'line', 5427
    $P4.'emit'(__ARG_1, $S5)
  __label_32: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5431
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5376
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5434
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5435

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 5331
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5333
    addattribute $P0, 'predef'
.annotate 'line', 5334
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_70')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_69 = "WSubId_69"
# Body
# {
.annotate 'line', 5442
# callname: $S1
    $P6 = __ARG_3.'getname'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 5443
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5444
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_4.'numargs'()
  __label_2:
.annotate 'line', 5445
# var rawargs: $P1
    if $I1, __label_5
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
    goto __label_4
  __label_5:
    $P1 = __ARG_4.'getrawargs'()
  __label_4:
.annotate 'line', 5447
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5448
# var predef: $P3
    null $P3
.annotate 'line', 5449
    if_null $P2, __label_7
    iter $P7, $P2
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $P4, $P7
# {
.annotate 'line', 5450
# pargs: $I2
    getattribute $P6, $P4, 'nparams'
    set $I2, $P6
.annotate 'line', 5451
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 5452
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 5453
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 5454
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5456
    unless_null $P3, __label_12
.annotate 'line', 5457
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5460
    $P6 = $P3.'iscompileevaluable'()
    if_null $P6, __label_13
    unless $P6 goto __label_13
# {
.annotate 'line', 5461
    $P8 = WSubId_69($P1)
    if_null $P8, __label_14
    unless $P8 goto __label_14
# {
.annotate 'line', 5462
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5463
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P8, __ARG_1, 'start'
    .tailcall $P5($P6, $P8, $P1)
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5467
    new $P8, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    $P8.'CallPredefExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P6, $P8
    .return($P6)
# }
.annotate 'line', 5468

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5477
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5478
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5479
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5480
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5481
    __ARG_1.'unget'($P1)
.annotate 'line', 5482
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5484

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5485
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_70 = "WSubId_70"
# Body
# {
.annotate 'line', 5488
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5489
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5490
    if_null $P2, __label_1
.annotate 'line', 5491
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5493
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5497
# var sym: $P3
    null $P3
.annotate 'line', 5498
# var subid: $P4
    null $P4
.annotate 'line', 5499
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5500
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5501
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5502
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5503
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5504
    isnull $I1, $P6
    if $I1 goto __label_7
    set $S1, $P6
    iseq $I1, $S1, ''
  __label_7:
    unless $I1 goto __label_6
# {
.annotate 'line', 5505
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5506
    $P1.'buildkey'($P7)
.annotate 'line', 5507
    $P3 = self.'scopesearch'($P7, 0)
.annotate 'line', 5508
    if_null $P3, __label_8
# {
.annotate 'line', 5509
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_9
# {
.annotate 'line', 5510
    $P9 = $P3.'ismulti'()
    isfalse $I2, $P9
    unless $I2 goto __label_10
# {
.annotate 'line', 5511
    $P4 = $P3.'makesubid'()
.annotate 'line', 5512
    self.'usesubid'($P4)
# }
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 5515
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_11
.annotate 'line', 5516
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_70($P9, $P10, $P3, $P2)
  __label_11: # endif
# }
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 5520
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5522
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_12
.annotate 'line', 5523
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_12: # endif
.annotate 'line', 5526
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_13
    unless $P9 goto __label_13
# {
.annotate 'line', 5527
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_14
# {
.annotate 'line', 5528
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P12 = $P1.'getName'()
    $P11[0] = $P12
    $P8 = self.'scopesearch'($P11, 0)
.annotate 'line', 5529
    isnull $I1, $P8
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
.annotate 'line', 5530
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_70($P9, $P10, $P8, $P2)
  __label_15: # endif
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5534
    setattribute self, 'funref', $P1
.annotate 'line', 5535
    setattribute self, 'args', $P2
.annotate 'line', 5536
    .return(self)
# }
.annotate 'line', 5537

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5540
    .return(1)
# }
.annotate 'line', 5541

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5544
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5545
# call: $S1
    null $S1
.annotate 'line', 5547
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5548
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5549
    ne $S1, '', __label_4
# {
.annotate 'line', 5550
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
# switch-case
.annotate 'line', 5552
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5555
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5558
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5553
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
# predefined join
    join $S1, "", $P3
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 5556
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5559
    WSubId_6("Builtin unexpected here", self)
  __label_6: # default
.annotate 'line', 5561
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 3
    $P6[0] = "'"
    $P7 = $P1.'getName'()
    $P6[1] = $P7
    $P6[2] = "'"
# predefined join
    join $S1, "", $P6
  __label_5: # switch end
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5566
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5567
    .return($S1)
# }
.annotate 'line', 5568

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5571
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5572
    if_null $P1, __label_1
.annotate 'line', 5573
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5574

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5577
    __ARG_1.'print'('(')
.annotate 'line', 5578
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5579
    if_null $P1, __label_1
.annotate 'line', 5580
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5581
    __ARG_1.'say'(')')
# }
.annotate 'line', 5582

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5585
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5586
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5588
    self.'annotate'(__ARG_1)
.annotate 'line', 5590
    __ARG_1.'print'('    ')
.annotate 'line', 5591
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5592
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5593
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5595
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5598
    __ARG_1.'print'($S1)
.annotate 'line', 5599
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5600

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5470
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5472
    addattribute $P0, 'funref'
.annotate 'line', 5473
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
.annotate 'line', 5614
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5615
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5616
    setattribute self, 'args', __ARG_3
.annotate 'line', 5617
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5618
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5619

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 5622
    getattribute $P6, self, 'sym'
    if_null $P6, __label_1
# {
.annotate 'line', 5623
    getattribute $P7, self, 'subid'
    if_null $P7, __label_2
.annotate 'line', 5624
    getattribute $P8, self, 'subid'
    .return($P8)
  __label_2: # endif
.annotate 'line', 5625
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5626
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5627
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5629
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5631
# var first: $P3
    getattribute $P3, $P2, 'left'
  __label_5: # while
.annotate 'line', 5632
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_4
.annotate 'line', 5633
    getattribute $P3, $P3, 'left'
    goto __label_5
  __label_4: # endwhile
.annotate 'line', 5634
    $P6 = $P3.'isidentifier'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 5635
# check: $S1
    $P7 = $P3.'checkIdentifier'()
    null $S1
    if_null $P7, __label_7
    set $S1, $P7
  __label_7:
.annotate 'line', 5636
    isnull $I1, $S1
    if $I1 goto __label_9
    iseq $I1, $S1, ''
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 5640
    new $P4, ['ResizableStringArray']
.annotate 'line', 5641
    $P2.'buildkey'($P4)
.annotate 'line', 5642
# fun: $S2
    $P6 = $P4.'pop'()
    null $S2
    if_null $P6, __label_10
    set $S2, $P6
  __label_10:
.annotate 'line', 5643
# var reg: $P5
    $P5 = self.'tempreg'('P')
.annotate 'line', 5644
    self.'annotate'(__ARG_1)
.annotate 'line', 5645
    $P6 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'($P5, $S2, $P6)
.annotate 'line', 5646
    .return($P5)
# }
  __label_8: # endif
# }
  __label_6: # endif
.annotate 'line', 5649
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P2.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
.annotate 'line', 5650
    $P8 = $P2.'get_member'()
.annotate 'line', 5649
    $P6[2] = $P8
    $P6[3] = "'"
# predefined join
    join $S3, "", $P6
    .return($S3)
# }
.annotate 'line', 5651

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5608
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5610
    addattribute $P0, 'sym'
.annotate 'line', 5611
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5661
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5662
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5663
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5664

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5667
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5668
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5669
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5670
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5671
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5674
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5675
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5676
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5677

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5657
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
.annotate 'line', 5687
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5688
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5689

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5692
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5693
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5694
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5695
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5696
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5697
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5698
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5700
    .return($S2)
# }
.annotate 'line', 5701

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5682
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5684
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
.annotate 'line', 5710
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5711
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5712

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5713
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5716
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5717
    .return(self)
# }
.annotate 'line', 5718

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5721
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5722
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5723
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5725
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5726
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5727

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5730
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5731

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5734
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5735
    self.'annotate'(__ARG_1)
.annotate 'line', 5736
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5737

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5740
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5741
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5742
    .return($S1)
# }
.annotate 'line', 5743

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5746
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5747
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5748
    self.'annotate'(__ARG_1)
.annotate 'line', 5749
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5750

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5753
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5754

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5757
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5758
# value: $S2
    null $S2
.annotate 'line', 5759
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5761
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5762
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5763
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5765
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5768
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5769
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5771
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5772

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5775
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5776
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5777
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5778
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5780
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5781
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5782
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5784
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5786
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5787
    .return($S2)
# }
.annotate 'line', 5788

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5704
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5706
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
.annotate 'line', 5799
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5800
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5801

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5802
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5805
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5806
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5807
    .return(self)
# }
.annotate 'line', 5808

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 5811
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5812
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5813
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5814
    WSubId_43("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5815
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5816
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5817
    self.'annotate'(__ARG_1)
.annotate 'line', 5818
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5819
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5820
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5821

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 5824
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5825
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5826
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5827
    WSubId_43("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5828
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5829
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5830
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5831
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5833
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5835
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5836
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5837
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5841
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5842
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5843
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5846
    self.'annotate'(__ARG_1)
.annotate 'line', 5847
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5848
    .return($S3)
# }
.annotate 'line', 5849

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5794
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5796
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
.annotate 'line', 5863
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5864
    setattribute self, 'left', __ARG_4
.annotate 'line', 5865
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5866

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5869
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S2, $P1
    ne $S2, 'S', __label_2
    set $S1, 'S'
    goto __label_1
  __label_2:
    set $S1, 'P'
  __label_1:
    .return($S1)
# }
.annotate 'line', 5870

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5873
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5874
    setattribute self, 'left', $P1
.annotate 'line', 5875
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5876
    $P2.'optimizeargs'()
.annotate 'line', 5880
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5881
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5882
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5883
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5884
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5885
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5886
# predefined substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5887
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5890
    .return(self)
# }
.annotate 'line', 5891

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5894
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5895
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5896
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5897
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5898
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5899
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5897
    setattribute self, 'regleft', $P3
.annotate 'line', 5900
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5901

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5904
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5905
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5906
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5907
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5908
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5909
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5910
    __ARG_1.'print'(']')
# }
.annotate 'line', 5911

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5914
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5915
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5916
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5917
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5918
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5919
    eq $I1, 1, __label_4
.annotate 'line', 5920
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5921
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5922
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5923
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5926
    self.'annotate'(__ARG_1)
.annotate 'line', 5927
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5928
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5929
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5931

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5934
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5935
    self.'annotate'(__ARG_1)
.annotate 'line', 5936
    __ARG_1.'print'('    ')
.annotate 'line', 5937
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5938
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5939

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5942
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5943
# rreg: $S1
    null $S1
.annotate 'line', 5944
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5945
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5946
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5949
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5950
    self.'annotate'(__ARG_1)
.annotate 'line', 5951
    __ARG_1.'print'('    ')
.annotate 'line', 5952
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5953
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5954
    .return($S1)
# }
.annotate 'line', 5955

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5854
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5856
    addattribute $P0, 'left'
.annotate 'line', 5857
    addattribute $P0, 'regleft'
.annotate 'line', 5858
    addattribute $P0, 'args'
.annotate 'line', 5859
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 5966
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5967
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5968
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5969
    __ARG_1.'unget'($P1)
.annotate 'line', 5970
    $P3 = WSubId_39(__ARG_1, __ARG_2, WSubId_40, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5972

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5973
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 5976
    getattribute $P1, self, 'values'
    WSubId_41($P1)
.annotate 'line', 5977
    .return(self)
# }
.annotate 'line', 5978

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5981
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5982
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5983
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5989
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5991

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5994
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5995
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5996
    .return($S1)
# }
.annotate 'line', 5997

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6000
    self.'annotate'(__ARG_1)
.annotate 'line', 6001
# itemreg: $S1
    null $S1
.annotate 'line', 6002
# pnull: $S2
    null $S2
.annotate 'line', 6003
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6004
# size: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
.annotate 'line', 6005
    eq __ARG_2, '', __label_3
# {
.annotate 'line', 6006
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6007
    le $I1, 0, __label_4
.annotate 'line', 6008
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 6010
# i: $I2
    null $I2
.annotate 'line', 6011
    if_null $P1, __label_6
    iter $P3, $P1
    set $P3, 0
  __label_5: # for iteration
    unless $P3 goto __label_6
    shift $P2, $P3
# {
.annotate 'line', 6012
    $P4 = $P2.'isnull'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
# {
.annotate 'line', 6013
    eq __ARG_2, '', __label_9
# {
.annotate 'line', 6014
    unless_null $S2, __label_10
# {
.annotate 'line', 6015
    $P5 = self.'tempreg'('P')
    set $S2, $P5
.annotate 'line', 6016
    __ARG_1.'emitnull'($S2)
# }
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 6019
    set $S1, $S2
# }
    goto __label_8
  __label_7: # else
.annotate 'line', 6022
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
  __label_8: # endif
.annotate 'line', 6023
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 6024
    self.'annotate'(__ARG_1)
.annotate 'line', 6025
    __ARG_1.'say'('    ', __ARG_2, "[", $I2, "] = ", $S1)
.annotate 'line', 6026
    inc $I2
# }
  __label_11: # endif
# }
    goto __label_5
  __label_6: # endfor
# }
.annotate 'line', 6029

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5960
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5962
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 6041
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6042
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6043
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6044
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6045
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 6046
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6047
# {
.annotate 'line', 6048
# var key: $P4
    $P4 = WSubId_40(__ARG_1, __ARG_2)
.annotate 'line', 6049
    WSubId_57(':', __ARG_1)
.annotate 'line', 6050
# var value: $P5
    $P5 = WSubId_40(__ARG_1, __ARG_2)
.annotate 'line', 6051
# predefined push
    push $P2, $P4
.annotate 'line', 6052
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 6054
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6055
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6056
    WSubId_43("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 6058
    setattribute self, 'keys', $P2
.annotate 'line', 6059
    setattribute self, 'values', $P3
# }
.annotate 'line', 6060

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6061
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 6064
    getattribute $P1, self, 'keys'
    WSubId_41($P1)
.annotate 'line', 6065
    getattribute $P1, self, 'values'
    WSubId_41($P1)
.annotate 'line', 6066
    .return(self)
# }
.annotate 'line', 6067

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6070
    self.'annotate'(__ARG_1)
.annotate 'line', 6075
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 6076
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6078
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 6079
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 6080
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 6081
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 6082
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 6083
# item: $S1
    null $S1
.annotate 'line', 6084
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 6085
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 6086
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6087
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 6090
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6092
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 6093
# itemreg: $S3
    null $S3
.annotate 'line', 6094
# pnull: $S4
    null $S4
.annotate 'line', 6095
# aux: $S5
    null $S5
.annotate 'line', 6096
    $P5 = $P4.'isnull'()
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 6097
    set $S6, __ARG_2
    eq $S6, '', __label_10
# {
.annotate 'line', 6098
    unless_null $S4, __label_11
# {
.annotate 'line', 6099
    $P6 = self.'tempreg'('P')
    set $S4, $P6
.annotate 'line', 6100
    __ARG_1.'emitnull'($S4)
# }
  __label_11: # endif
# }
  __label_10: # endif
.annotate 'line', 6103
    set $S3, $S4
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6106
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_9: # endif
.annotate 'line', 6107
    set $S6, __ARG_2
    eq $S6, '', __label_12
.annotate 'line', 6108
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_12: # endif
# }
  __label_2: # for iteration
.annotate 'line', 6081
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 6110

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6113
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6114
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6115
    .return($S1)
# }
.annotate 'line', 6116

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6034
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6036
    addattribute $P0, 'keys'
.annotate 'line', 6037
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6129
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6134
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 6135

.end # parseinitializer


.sub 'numargs' :method
# Body
# {
.annotate 'line', 6138
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6139
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
# predefined int
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)
# }
.annotate 'line', 6140

.end # numargs


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 6143
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6144
    if_null $P1, __label_1
.annotate 'line', 6145
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 6146

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6149
    self.'optimize_initializer'()
.annotate 'line', 6150
    .return(self)
# }
.annotate 'line', 6151

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6154
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6155
    if_null $P1, __label_1
.annotate 'line', 6156
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6157
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6158
    if_null $P1, __label_2
.annotate 'line', 6159
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6160
    __ARG_1.'say'(")")
# }
.annotate 'line', 6161

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6121
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6123
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
.annotate 'line', 6172
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6174
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 6175
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6176
    setattribute self, 'value', __ARG_4
.annotate 'line', 6177
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6179
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6180
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6182
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 6183

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6186
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 6187
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 6190
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6191
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_3
    $I1 = $P2.'isconst'()
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 6192
    $P1 = $P2.'getvalue'()
.annotate 'line', 6193
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 6194
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 6195
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 6198
    self.'optimize_initializer'()
.annotate 'line', 6199
    .return(self)
# }
.annotate 'line', 6200

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6203
    self.'annotate'(__ARG_1)
.annotate 'line', 6205
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6206
# numinits: $I1
    $P6 = self.'numargs'()
    set $I1, $P6
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 6209
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_2
    unless $P6 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6210
    getattribute $P9, self, 'value'
    $P8 = $P9.'isidentifier'()
    if_null $P8, __label_4
    unless $P8 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6212
# reginit: $S1
    set $S1, ''
.annotate 'line', 6213
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_5
    set $S2, $P6
  __label_5:
.annotate 'line', 6214
# constructor: $S3
    null $S3
# switch
.annotate 'line', 6215
    set $I3, $I1
    set $I4, -1
    if $I3 == $I4 goto __label_8
    null $I4
    if $I3 == $I4 goto __label_9
    set $I4, 1
    if $I3 == $I4 goto __label_10
    goto __label_7
  __label_8: # case
  __label_9: # case
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 6220
    ne $I2, 1, __label_11
# {
.annotate 'line', 6221
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 6222
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 6225
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6226
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 6227
    concat $S1, ', ', $S1
# }
  __label_12: # endif
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 6231
    eq $I2, 1, __label_14
.annotate 'line', 6232
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_14: # endif
.annotate 'line', 6233
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 6234
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
  __label_6: # switch end
.annotate 'line', 6237
    ne $S2, '', __label_16
.annotate 'line', 6238
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_16: # endif
# switch
.annotate 'line', 6240
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
  __label_19: # case
.annotate 'line', 6243
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_21
    set $S4, $P6
  __label_21:
.annotate 'line', 6244
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 6245
    isnull $I5, $P3
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
  __label_23:
    unless $I5 goto __label_22
.annotate 'line', 6246
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_71($S5, $P8)
  __label_22: # endif
.annotate 'line', 6250
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 6251
    le $I1, 1, __label_24
# {
.annotate 'line', 6252
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_24: # endif
    goto __label_17 # break
  __label_20: # case
.annotate 'line', 6256
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 6257
    unless_null $P4, __label_25
# {
.annotate 'line', 6259
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 6260
    if_null $P5, __label_27
# {
.annotate 'line', 6261
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_28
  __label_27: # else
# {
.annotate 'line', 6264
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 1
    getattribute $P7, self, 'value'
    $P6[0] = $P7
    $P4 = self.'scopesearch'($P6, 2)
.annotate 'line', 6265
    if_null $P4, __label_29
.annotate 'line', 6266
    $P6 = $P4.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
    goto __label_30
  __label_29: # else
# {
.annotate 'line', 6268
    $P7 = self.'dowarnings'()
    if_null $P7, __label_31
    unless $P7 goto __label_31
.annotate 'line', 6269
    WSubId_71('Checking: new unknown type')
  __label_31: # endif
.annotate 'line', 6270
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_30: # endif
# }
  __label_28: # endif
.annotate 'line', 6273
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 6277
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_26: # endif
    goto __label_17 # break
  __label_18: # default
.annotate 'line', 6281
    WSubId_6('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 6283
    isgt $I3, $I1, 1
    if $I3 goto __label_33
    isge $I3, $I1, 0
    unless $I3 goto __label_34
    iseq $I3, $I2, 1
  __label_34:
  __label_33:
    unless $I3 goto __label_32
# {
.annotate 'line', 6284
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6285
    not $I3, __ARG_3
    unless $I3 goto __label_36
    set $S5, __ARG_2
    isne $I3, $S5, ''
  __label_36:
    unless $I3 goto __label_35
.annotate 'line', 6286
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_35: # endif
# }
  __label_32: # endif
# }
.annotate 'line', 6288

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6291
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6292

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6166
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6168
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6303
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6304
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6305
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6306
    setattribute self, 'nskey', $P1
.annotate 'line', 6307
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6308
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6309
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6311
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6312

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6315
# reginit: $S1
    null $S1
# switch
.annotate 'line', 6316
    $P3 = self.'numargs'()
    set $I1, $P3
    set $I2, -1
    if $I1 == $I2 goto __label_3
    null $I2
    if $I1 == $I2 goto __label_4
    set $I2, 1
    if $I1 == $I2 goto __label_5
    goto __label_2
  __label_3: # case
  __label_4: # case
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 6321
# var initval: $P1
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6322
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6325
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_1: # switch end
.annotate 'line', 6327
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6329
    set $S2, __ARG_2
    ne $S2, '', __label_6
.annotate 'line', 6330
    __ARG_2 = self.'tempreg'('P')
  __label_6: # endif
.annotate 'line', 6332
    __ARG_1.'print'('    ')
.annotate 'line', 6333
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 6334
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6335
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6336
    null $P3
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6337
    if_null $S1, __label_8
.annotate 'line', 6338
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6339
    __ARG_1.'say'()
# }
.annotate 'line', 6340

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6297
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6299
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6351
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6352
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6353
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6354
    setattribute self, 'nskey', $P1
.annotate 'line', 6355
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6356
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6357
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6359
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6360

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6363
# numinits: $I1
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6364
# regnew: $S1
    set $P2, __ARG_2
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 6365
    le $I1, 0, __label_2
.annotate 'line', 6366
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6367
# var nskey: $P1
    getattribute $P1, self, 'nskey'
.annotate 'line', 6369
    ne $S1, '', __label_3
.annotate 'line', 6370
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_3: # endif
.annotate 'line', 6372
    __ARG_1.'print'('    ', 'new ', $S1, ", ")
.annotate 'line', 6373
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 6374
    __ARG_1.'say'()
.annotate 'line', 6376
    lt $I1, 0, __label_4
# {
.annotate 'line', 6377
# constructor: $S2
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 6378
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6379
    set $S3, __ARG_2
    eq $S3, '', __label_6
.annotate 'line', 6380
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_6: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 6382

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6345
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6347
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6389
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6392
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6396
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6399
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6394
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6395
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6394
    .return($P3)
  __label_4: # case
.annotate 'line', 6398
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6402
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6403
    __ARG_1.'unget'($P2)
.annotate 'line', 6404
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6406
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6411
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6413

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 6424
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6425
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6426
    $P2 = WSubId_65(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6427

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6430
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6431
    .return(self)
# }
.annotate 'line', 6432

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6433
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6436
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6437
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6438
    eq $S1, 'P', __label_2
.annotate 'line', 6439
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6440
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6442
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
.annotate 'line', 6443
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6444
    self.'annotate'(__ARG_1)
.annotate 'line', 6445
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6446
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6447
    __ARG_1.'say'()
# }
.annotate 'line', 6448

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6417
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6419
    addattribute $P0, 'lexpr'
.annotate 'line', 6420
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
.annotate 'line', 6465
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6466
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6467
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6468
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6469
    .return(self)
# }
.annotate 'line', 6470

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6473
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6474
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6476
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6478
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6480
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6481
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6482
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6484

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6487
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6488
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6489
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6491
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6492

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6495
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6496
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6497
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6498
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6499
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6500
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6501
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6503
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6504
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6505
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6506
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6507
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6508
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6510
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6511
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6512
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6513
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6516
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6518
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6519

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6453
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6459
    addattribute $P0, 'condition'
.annotate 'line', 6460
    addattribute $P0, 'etrue'
.annotate 'line', 6461
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

.sub 'getOpCode_2' :subid('WSubId_74')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6563
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
.annotate 'line', 6564
    .return(1)
  __label_4: # case
.annotate 'line', 6565
    .return(2)
  __label_5: # case
.annotate 'line', 6566
    .return(3)
  __label_2: # default
.annotate 'line', 6567
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6569

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_76')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6573
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
.annotate 'line', 6574
    .return(8)
  __label_4: # case
.annotate 'line', 6575
    .return(11)
  __label_5: # case
.annotate 'line', 6576
    .return(9)
  __label_6: # case
.annotate 'line', 6577
    .return(10)
  __label_2: # default
.annotate 'line', 6579
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6580
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6581
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6583

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_79')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6587
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
.annotate 'line', 6588
    .return(19)
  __label_4: # case
.annotate 'line', 6589
    .return(20)
  __label_5: # case
.annotate 'line', 6590
    .return(21)
  __label_6: # case
.annotate 'line', 6591
    .return(22)
  __label_2: # default
.annotate 'line', 6592
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6594

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6598
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6599
    .return(28)
  __label_4: # case
.annotate 'line', 6600
    .return(29)
  __label_2: # default
.annotate 'line', 6601
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6603

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_84')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6607
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
.annotate 'line', 6608
    .return(14)
  __label_4: # case
.annotate 'line', 6609
    .return(16)
  __label_5: # case
.annotate 'line', 6610
    .return(15)
  __label_6: # case
.annotate 'line', 6611
    .return(17)
  __label_2: # default
.annotate 'line', 6613
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6614
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6616

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_86')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6620
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
.annotate 'line', 6621
    .return(12)
  __label_4: # case
.annotate 'line', 6622
    .return(13)
  __label_5: # case
.annotate 'line', 6623
    .return(25)
  __label_6: # case
.annotate 'line', 6624
    .return(26)
  __label_2: # default
.annotate 'line', 6625
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6627

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_95')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6631
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
.annotate 'line', 6632
    .return(4)
  __label_4: # case
.annotate 'line', 6633
    .return(5)
  __label_5: # case
.annotate 'line', 6634
    .return(6)
  __label_6: # case
.annotate 'line', 6635
    .return(18)
  __label_7: # case
.annotate 'line', 6636
    .return(23)
  __label_8: # case
.annotate 'line', 6637
    .return(24)
  __label_9: # case
.annotate 'line', 6638
    .return(30)
  __label_2: # default
.annotate 'line', 6639
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6641

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 6645
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6646
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6649
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6653
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6655
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6657
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6659
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6661
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6663
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6665
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6667
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6669
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 6671
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 6650
    $P2 = WSubId_40(__ARG_1, __ARG_2)
.annotate 'line', 6651
    WSubId_57(')', __ARG_1)
.annotate 'line', 6652
    .return($P2)
  __label_4: # case
.annotate 'line', 6654
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6656
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6658
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6660
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6662
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6664
    .tailcall WSubId_72(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6666
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6668
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6670
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 6672
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 6674
    WSubId_43('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6676

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6680
# var subexp: $P1
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6681
# var t: $P2
    null $P2
.annotate 'line', 6682
# var start: $P3
    null $P3
.annotate 'line', 6683
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6684
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_74($P2)
    set $I1, $P5
    unless $I1, __label_1
# {
# switch
.annotate 'line', 6685
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6687
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6690
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6693
    set $P3, $P2
.annotate 'line', 6694
    $P2 = __ARG_1.'get'()
.annotate 'line', 6695
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6696
# var right: $P4
    $P4 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6697
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6700
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6703
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6706
    __ARG_1.'unget'($P2)
.annotate 'line', 6707
    .return($P1)
# }
.annotate 'line', 6708

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_75 = "WSubId_75"
# Body
# {
.annotate 'line', 6712
# var subexp: $P1
    $P1 = WSubId_75(__ARG_1, __ARG_2)
.annotate 'line', 6713
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6715
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6717
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6716
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6718
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6720
    __ARG_1.'unget'($P2)
.annotate 'line', 6721
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6723

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_76 = "WSubId_76"
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_78 = "WSubId_78"
# Body
# {
.annotate 'line', 6727
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6728
# code: $I1
    $P3 = WSubId_76($P1)
    set $I1, $P3
.annotate 'line', 6729
    unless $I1, __label_1
# {
.annotate 'line', 6730
# var subexpr: $P2
    $P2 = WSubId_77(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6731
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
.annotate 'line', 6733
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6735
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6737
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6739
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6741
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6743
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6745
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6749
    __ARG_1.'unget'($P1)
.annotate 'line', 6750
    .tailcall WSubId_78(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6752

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6756
# var lexpr: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6757
# var t: $P2
    null $P2
.annotate 'line', 6758
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6759
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_79($P2)
    set $I1, $P4
    unless $I1, __label_1
# {
.annotate 'line', 6760
# var rexpr: $P3
    $P3 = WSubId_77(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6761
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
.annotate 'line', 6763
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6766
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6769
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6772
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6775
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6778
    __ARG_1.'unget'($P2)
.annotate 'line', 6779
    .return($P1)
# }
.annotate 'line', 6780

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_80 = "WSubId_80"
# Body
# {
.annotate 'line', 6784
# var lexpr: $P1
    $P1 = WSubId_80(__ARG_1, __ARG_2)
.annotate 'line', 6785
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6786
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6787
# var rexpr: $P3
    $P3 = WSubId_80(__ARG_1, __ARG_2)
.annotate 'line', 6788
# var expr: $P4
    null $P4
.annotate 'line', 6789
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6790
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6792
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6793
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6795
    __ARG_1.'unget'($P2)
.annotate 'line', 6796
    .return($P1)
# }
.annotate 'line', 6797

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6801
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6802
# var rexpr: $P2
    null $P2
.annotate 'line', 6803
# var t: $P3
    null $P3
.annotate 'line', 6804
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6805
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    unless $I1, __label_1
# {
# switch
.annotate 'line', 6806
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6808
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6809
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6812
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6813
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6816
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6819
    __ARG_1.'unget'($P3)
.annotate 'line', 6820
    .return($P1)
# }
.annotate 'line', 6821

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6825
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6826
# var rexpr: $P2
    null $P2
.annotate 'line', 6827
# var t: $P3
    null $P3
.annotate 'line', 6828
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6829
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_84($P3)
    set $I1, $P4
    unless $I1, __label_1
# {
# switch
.annotate 'line', 6830
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
.annotate 'line', 6832
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6833
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6836
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6837
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6840
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6841
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6844
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6845
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6848
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6851
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6854
    __ARG_1.'unget'($P3)
.annotate 'line', 6855
    .return($P1)
# }
.annotate 'line', 6856

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6860
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6861
# var rexpr: $P2
    null $P2
.annotate 'line', 6862
# var t: $P3
    null $P3
.annotate 'line', 6863
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6864
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_86($P3)
    set $I1, $P4
    unless $I1, __label_1
# {
# switch
.annotate 'line', 6865
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
.annotate 'line', 6867
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6868
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6871
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6872
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6875
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6876
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6879
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6880
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6883
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6886
    __ARG_1.'unget'($P3)
.annotate 'line', 6887
    .return($P1)
# }
.annotate 'line', 6888

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
# Body
# {
.annotate 'line', 6892
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6893
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6894
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6895
# var rexpr: $P3
    $P3 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6896
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6898
    __ARG_1.'unget'($P2)
.annotate 'line', 6899
    .return($P1)
# }
.annotate 'line', 6900

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
# Body
# {
.annotate 'line', 6904
# var lexpr: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6905
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6906
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6907
# var rexpr: $P3
    $P3 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6908
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6910
    __ARG_1.'unget'($P2)
.annotate 'line', 6911
    .return($P1)
# }
.annotate 'line', 6912

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6916
# var lexpr: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6917
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6918
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6919
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6920
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6922
    __ARG_1.'unget'($P2)
.annotate 'line', 6923
    .return($P1)
# }
.annotate 'line', 6924

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
# Body
# {
.annotate 'line', 6928
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6929
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6930
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6931
# var rexpr: $P3
    $P3 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6932
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6934
    __ARG_1.'unget'($P2)
.annotate 'line', 6935
    .return($P1)
# }
.annotate 'line', 6936

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_90 = "WSubId_90"
# Body
# {
.annotate 'line', 6940
# var lexpr: $P1
    $P1 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6941
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6942
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6943
# var rexpr: $P3
    $P3 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6944
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6946
    __ARG_1.'unget'($P2)
.annotate 'line', 6947
    .return($P1)
# }
.annotate 'line', 6948

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_94')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 6952
# var econd: $P1
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 6953
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6954
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6955
# var etrue: $P3
    $P3 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 6956
    WSubId_57(':', __ARG_1)
.annotate 'line', 6957
# var efalse: $P4
    $P4 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 6958
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6961
    __ARG_1.'unget'($P2)
.annotate 'line', 6962
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6964

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6968
# var lexpr: $P1
    $P1 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 6969
# var t: $P2
    null $P2
.annotate 'line', 6970
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6971
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_95($P2)
    set $I1, $P5
    unless $I1, __label_1
# {
.annotate 'line', 6972
# var rexpr: $P3
    $P3 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 6973
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6974
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
.annotate 'line', 6976
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6979
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6982
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6985
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6988
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6991
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6994
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6997
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6999
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7000
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7002
    __ARG_1.'unget'($P2)
.annotate 'line', 7003
    .return($P1)
# }
.annotate 'line', 7004

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 7008
    .tailcall WSubId_93(__ARG_1, __ARG_2)
# }
.annotate 'line', 7009

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7024
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7025
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7026
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7027
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7028
    .return($S1)
# }
.annotate 'line', 7029

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7032
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7033
    unless_null $P1, __label_1
.annotate 'line', 7034
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7035
    .return($P1)
# }
.annotate 'line', 7036

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7020
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7045
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7046
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7047
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7048
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7049
    .return($S1)
# }
.annotate 'line', 7050

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7053
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7054
    unless_null $P1, __label_1
.annotate 'line', 7055
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7056
    .return($P1)
# }
.annotate 'line', 7057

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7039
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7041
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7073
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7074
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7075
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7076
    __ARG_2.'unget'($P1)
.annotate 'line', 7077
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 7079

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7082
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7083
    if_null $P1, __label_1
.annotate 'line', 7084
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7085
    .return(self)
# }
.annotate 'line', 7086

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7090
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7091
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7094
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 7095
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7096
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 7097
    self.'annotate'(__ARG_1)
.annotate 'line', 7098
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 7102
    le $I1, 0, __label_6
.annotate 'line', 7103
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 7105
    self.'annotate'(__ARG_1)
.annotate 'line', 7106
    self.'emitret'(__ARG_1)
.annotate 'line', 7107
    le $I1, 0, __label_7
.annotate 'line', 7108
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7109
    __ARG_1.'say'(')')
# }
.annotate 'line', 7110

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7067
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7069
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7117
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7118

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7121
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 7122

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7113
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
.annotate 'line', 7129
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7130

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7133
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 7134

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7125
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7147
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7148
    setattribute self, 'name', __ARG_1
.annotate 'line', 7149
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 7150

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7151
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7154
    self.'annotate'(__ARG_1)
.annotate 'line', 7155
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 7156

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7141
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7143
    addattribute $P0, 'name'
.annotate 'line', 7144
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7170
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7171
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 7172

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7173
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7176
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7177
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7178
    .return($S2)
# }
.annotate 'line', 7179

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7165
    addattribute $P0, 'owner'
.annotate 'line', 7166
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7192
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7193
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7194
    WSubId_96($P1)
.annotate 'line', 7195
    setattribute self, 'label', $P1
.annotate 'line', 7196
    WSubId_57(';', __ARG_2)
# }
.annotate 'line', 7197

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7198
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7201
    self.'annotate'(__ARG_1)
.annotate 'line', 7202
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7203
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7204
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 7205

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7186
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7188
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7216
    $P1 = WSubId_40(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 7217

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7220
    WSubId_57('(', __ARG_1)
.annotate 'line', 7221
    $P1 = WSubId_40(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7222
    WSubId_57(')', __ARG_1)
# }
.annotate 'line', 7223

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7212
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
.const 'Sub' WSubId_97 = "WSubId_97"
# Body
# {
.annotate 'line', 7236
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7237
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7238
    $P3 = WSubId_97(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7239
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7240
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7241
    $P4 = WSubId_97(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7243
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7244
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7246

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7249
    self.'optimize_condition'()
.annotate 'line', 7250
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7251
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 7252
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7254
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7256
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7258
    .return(self)
# }
.annotate 'line', 7259

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7262
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7263
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7264
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7265
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7266
# elselabel: $S1
    set $S1, ''
.annotate 'line', 7267
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7268
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7269
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7270
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7271
    self.'annotate'(__ARG_1)
.annotate 'line', 7272
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7273
    $P1.'emit'(__ARG_1)
.annotate 'line', 7275
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7276
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7277
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7278
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7280
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7281

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7230
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7232
    addattribute $P0, 'truebranch'
.annotate 'line', 7233
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_97 = "WSubId_97"
# Body
# {
.annotate 'line', 7293
    $P2 = WSubId_97(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7294

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7297
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7298
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7300
    self.'annotate'(__ARG_1)
.annotate 'line', 7301
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7302
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7303
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7304
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7305

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7288
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7290
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7316
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7317
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7318
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7319

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7322
    self.'optimize_condition'()
.annotate 'line', 7323
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7324
    .return(self)
# }
.annotate 'line', 7325

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7328
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7330
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7333
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7336
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7337
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7339
    self.'annotate'(__ARG_1)
.annotate 'line', 7340
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7341
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7342
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7343
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7344
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7346

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7312
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
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 7357
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7358
    self.'parsebody'(__ARG_2)
.annotate 'line', 7359
    WSubId_98('while', __ARG_2)
.annotate 'line', 7360
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7361

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7364
    self.'optimize_condition'()
.annotate 'line', 7365
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7366
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7367
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7368
    setattribute self, 'body', $P1
.annotate 'line', 7369
    .return(self)
# }
.annotate 'line', 7370

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7373
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7374
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7375
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7377
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7380
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7381
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7382
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7384
    self.'annotate'(__ARG_1)
.annotate 'line', 7385
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7387
    $P1.'emit'(__ARG_1)
.annotate 'line', 7388
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7389
    eq $I1, 2, __label_7
.annotate 'line', 7390
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7391
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7393

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7353
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
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7404
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7405
    WSubId_57(';', __ARG_2)
# }
.annotate 'line', 7406

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7407
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7410
    self.'annotate'(__ARG_1)
.annotate 'line', 7411
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7412
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7413

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7400
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7424
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7425
    WSubId_57(';', __ARG_2)
# }
.annotate 'line', 7426

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7427
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7430
    self.'annotate'(__ARG_1)
.annotate 'line', 7431
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7432
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7433

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7420
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7448
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7449
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7450
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7451
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7452

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_97 = "WSubId_97"
# Body
# {
.annotate 'line', 7455
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7456
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7457
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7458
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_40(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7459
    $P1 = __ARG_1.'get'()
.annotate 'line', 7460
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7461
    WSubId_43("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7462
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7463
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
.annotate 'line', 7464
    __ARG_1.'unget'($P1)
.annotate 'line', 7465
    $P3 = WSubId_97(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7467
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7468
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7471
    $P1 = __ARG_1.'get'()
.annotate 'line', 7472
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7473
    WSubId_43("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7474
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
.annotate 'line', 7475
    __ARG_1.'unget'($P1)
.annotate 'line', 7476
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_97(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7478
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7481
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7482
    WSubId_43("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7483

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7486
    getattribute $P2, self, 'case_value'
    WSubId_41($P2)
.annotate 'line', 7487
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7488
    WSubId_41($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7489
    getattribute $P2, self, 'default_st'
    WSubId_41($P2)
# }
.annotate 'line', 7490

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7440
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7442
    addattribute $P0, 'case_value'
.annotate 'line', 7443
    addattribute $P0, 'case_st'
.annotate 'line', 7444
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 7503
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7504
    $P3 = WSubId_40(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7505
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7506
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7507
    WSubId_43("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7508
    $P1 = __ARG_2.'get'()
.annotate 'line', 7509
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7510
    WSubId_43("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7511
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7512

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7515
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7516
    self.'optimize_cases'()
.annotate 'line', 7517
    .return(self)
# }
.annotate 'line', 7518

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 7522
# type: $S1
    set $S1, ''
.annotate 'line', 7523
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7524
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7525
    ne $S2, 'N', __label_4
.annotate 'line', 7526
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7527
    ne $S1, '', __label_5
.annotate 'line', 7528
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7529
    eq $S1, $S2, __label_7
.annotate 'line', 7530
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7533
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7534
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7538
    ne $S1, '', __label_8
.annotate 'line', 7539
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7541
    __ARG_1.'comment'('switch')
.annotate 'line', 7542
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7543
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7544
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7546
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7547
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7551
    self.'genbreaklabel'()
.annotate 'line', 7552
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7553
    new $P4, ['ResizableStringArray']
.annotate 'line', 7554
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7555
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7556
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7557
# predefined push
    push $P4, $S7
.annotate 'line', 7558
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7559
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7561
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7564
    self.'annotate'(__ARG_1)
.annotate 'line', 7565
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7566
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7567
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7568
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7569
    $P7 = $P6[$I2]
    WSubId_55(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7567
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7572
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7573
    getattribute $P7, self, 'default_st'
    WSubId_55(__ARG_1, $P7)
.annotate 'line', 7575
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7576

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7497
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7499
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7588
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7589
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7590

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7593
    self.'optimize_cases'()
.annotate 'line', 7594
    .return(self)
# }
.annotate 'line', 7595

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 7599
    self.'genbreaklabel'()
.annotate 'line', 7600
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7601
    new $P1, ['ResizableStringArray']
.annotate 'line', 7603
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7604
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7605
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7606
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7607
# predefined push
    push $P1, $S3
.annotate 'line', 7608
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7609
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7611
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7614
    self.'annotate'(__ARG_1)
.annotate 'line', 7615
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7616
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7617
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7618
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7619
    $P4 = $P3[$I2]
    WSubId_55(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7617
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7622
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7623
    getattribute $P4, self, 'default_st'
    WSubId_55(__ARG_1, $P4)
.annotate 'line', 7625
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7626

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7583
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 7633
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7634
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7635
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7636
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7637
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7638
    WSubId_43("'(' in switch", $P1)
# }
.annotate 'line', 7639

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7652
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7653
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7654
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7655
    __ARG_2.'unget'($P1)
.annotate 'line', 7656
    $P3 = WSubId_97(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7658
    $P1 = __ARG_2.'get'()
.annotate 'line', 7659
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7660
    __ARG_2.'unget'($P1)
.annotate 'line', 7661
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7662
    WSubId_57(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7664
    $P1 = __ARG_2.'get'()
.annotate 'line', 7665
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7666
    __ARG_2.'unget'($P1)
.annotate 'line', 7667
    $P3 = WSubId_40(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7668
    WSubId_57(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7670
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7671

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7674
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7675
    if_null $P1, __label_1
.annotate 'line', 7676
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7677
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7678
    self.'optimize_condition'()
.annotate 'line', 7679
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7680
    if_null $P1, __label_4
.annotate 'line', 7681
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7683
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7686
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7687
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7688
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7689
    .return(self)
# }
.annotate 'line', 7690

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7693
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7694
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7695
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7696
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7697
    .return()
# }
  __label_1: # endif
.annotate 'line', 7699
    __ARG_1.'comment'('for loop')
.annotate 'line', 7700
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7701
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7702
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7703
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7704
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7706
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7707
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7708
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7710
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7711
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7712
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7713
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7714
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7716
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7717

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7645
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7647
    addattribute $P0, 'initializer'
.annotate 'line', 7648
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7732
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7733
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7734
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7735
# deftype: $S2
    $P1 = WSubId_99(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7736
    self.'createvar'($S1, $S2)
.annotate 'line', 7737
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7739
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7740
    $P2 = WSubId_40(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7741
    WSubId_57(')', __ARG_2)
.annotate 'line', 7742
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7743

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7746
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7750
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7751
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7752
    $P2 = $P1.'get_value'()
    set $S1, $P2
# predefined length
    length $I2, $S1
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7753
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7755
    setattribute self, 'container', $P1
.annotate 'line', 7756
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7757
    .return(self)
# }
.annotate 'line', 7758

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 7761
    self.'annotate'(__ARG_1)
.annotate 'line', 7762
# regcont: $S1
    null $S1
.annotate 'line', 7763
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7764
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7765
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7766
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7769
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7771
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7772
    unless_null $P1, __label_4
.annotate 'line', 7773
    getattribute $P2, self, 'varname'
    WSubId_64($P2)
  __label_4: # endif
.annotate 'line', 7775
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7776
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7777
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7778
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7779
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7780
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7781
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7782
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7783
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7784
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7785
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7786
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7787

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7724
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7726
    addattribute $P0, 'deftype'
.annotate 'line', 7727
    addattribute $P0, 'varname'
.annotate 'line', 7728
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7794
    WSubId_57('(', __ARG_2)
.annotate 'line', 7795
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7796
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7797
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7798
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7800
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7801
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7802
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7803
    __ARG_2.'unget'($P3)
.annotate 'line', 7804
    __ARG_2.'unget'($P2)
.annotate 'line', 7805
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7807
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7808

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7820
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7821
    $P2 = WSubId_40(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7822

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7825
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7826
    .return(self)
# }
.annotate 'line', 7827

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7830
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7831
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7832
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7833
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7835
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7838
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7841
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7843

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7814
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7816
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7855
    setattribute self, 'start', __ARG_1
.annotate 'line', 7856
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7857

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7860
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7861
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7862
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7863
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7864
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
.annotate 'line', 7867
    eq $I1, 1, __label_10
.annotate 'line', 7868
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7869
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7870
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7871
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7875
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7876
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7877
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7878
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7876
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7881
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7880
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7884
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7887

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7850
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7852
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 7899
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7900
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7901
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7902
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7904
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7906
    $P3 = WSubId_97(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7907
    $P1 = __ARG_2.'get'()
.annotate 'line', 7908
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7909
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7910
    $P1 = __ARG_2.'get'()
.annotate 'line', 7911
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7912
    WSubId_43("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7913
    $P1 = __ARG_2.'get'()
.annotate 'line', 7914
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7915
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7916
    setattribute self, 'exname', $P1
.annotate 'line', 7917
    self.'createvar'($S1, 'P')
.annotate 'line', 7918
    $P1 = __ARG_2.'get'()
.annotate 'line', 7919
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7920
    WSubId_43("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7922
    $P3 = WSubId_97(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7923

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7926
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7927
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7928
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7929
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7930
    .return(self)
# }
.annotate 'line', 7931

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7934
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7935
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7936
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7937
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7938
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7939
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7941
    self.'annotate'(__ARG_1)
.annotate 'line', 7942
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7944
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7945
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7947
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7948
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7950
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7951
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7952
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7953
    __ARG_1.'comment'('try: end')
.annotate 'line', 7954
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7956
    self.'annotate'(__ARG_1)
.annotate 'line', 7957
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7959
    __ARG_1.'comment'('catch')
.annotate 'line', 7960
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7961
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7962
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7963
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7964
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7966
    __ARG_1.'comment'('catch end')
.annotate 'line', 7967
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7968

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7890
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7892
    addattribute $P0, 'stry'
.annotate 'line', 7893
    addattribute $P0, 'modifiers'
.annotate 'line', 7894
    addattribute $P0, 'exname'
.annotate 'line', 7895
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
.annotate 'line', 7981
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7982
    setattribute self, 'name', __ARG_3
.annotate 'line', 7983
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7984
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7985

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7975
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7977
    addattribute $P0, 'name'
.annotate 'line', 7978
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
.annotate 'line', 8000
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8001
    setattribute self, 'name', __ARG_3
.annotate 'line', 8002
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 8003

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7992
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7994
    addattribute $P0, 'name'
.annotate 'line', 7995
    addattribute $P0, 'basetype'
.annotate 'line', 7996
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 8014
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 8015
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 8016
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 8017
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 8018
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8020
    $P5 = WSubId_40(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8023
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 8024

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8027
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8028
    if_null $P1, __label_1
.annotate 'line', 8029
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8030
    .return(self)
# }
.annotate 'line', 8031

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8034
    self.'annotate'(__ARG_1)
.annotate 'line', 8035
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8036
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8037
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 8038
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8039
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 8041
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 8042
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8044
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 8045
    ne $S4, $S3, __label_8
.annotate 'line', 8046
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8048
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 8050
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 8053
# ireg: $S5
    null $S5
# switch
.annotate 'line', 8054
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 8056
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 8058
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 8061
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 8062
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 8064
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 8065
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 8066
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8067
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 8068
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 8069
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 8072
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 8076

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8008
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8010
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
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 8091
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 8092
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 8093
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 8094
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 8095
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 8096
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8098
    __ARG_6.'unget'($P2)
.annotate 'line', 8099
    $P4 = WSubId_40(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 8100
    WSubId_57(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 8102
    $P2 = __ARG_6.'get'()
.annotate 'line', 8103
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 8104
    $P2 = __ARG_6.'get'()
.annotate 'line', 8105
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8106
    WSubId_43("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 8107
    $P2 = __ARG_6.'get'()
.annotate 'line', 8108
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 8109
    __ARG_6.'unget'($P2)
.annotate 'line', 8110
    $P4 = WSubId_39(__ARG_6, self, WSubId_40, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 8114
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 8115

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 8118
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8119
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8120
    getattribute $P1, self, 'initarray'
    WSubId_41($P1)
.annotate 'line', 8121
    .return(self)
# }
.annotate 'line', 8122

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8125
    self.'annotate'(__ARG_1)
.annotate 'line', 8127
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 8128
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 8129
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 8130
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 8131
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 8132
    if_null $P2, __label_1
# {
.annotate 'line', 8134
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 8135
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8139
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 8141
    if_null $P3, __label_4
# {
.annotate 'line', 8142
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 8143
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 8144
    unless_null $P2, __label_6
# {
.annotate 'line', 8145
    unless $I1, __label_7
# {
.annotate 'line', 8147
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 8150
# i: $I2
    null $I2
.annotate 'line', 8151
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 8152
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 8153
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 8154
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 8157

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8081
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8083
    addattribute $P0, 'size'
.annotate 'line', 8084
    addattribute $P0, 'initarray'
.annotate 'line', 8085
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8164
# var next: $P1
    null $P1
.annotate 'line', 8165
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 8166
# {
.annotate 'line', 8167
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 8168
    WSubId_96($P3)
.annotate 'line', 8169
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8170
# var item: $P5
    null $P5
.annotate 'line', 8171
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8172
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8174
    __ARG_4.'unget'($P4)
.annotate 'line', 8175
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 8177
    $P2 = WSubId_100($P2, $P5)
.annotate 'line', 8178
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 8179
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8180
    WSubId_4(';', $P1)
.annotate 'line', 8181
    .return($P2)
# }
.annotate 'line', 8182

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8190
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 8191

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8186
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
.annotate 'line', 8198
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 8199

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8194
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8205
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8206

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8210
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8211

.end # newIntArray


.sub 'parseInt' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 8215
    .tailcall WSubId_101(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8216

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8224
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 8225

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8220
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
.annotate 'line', 8232
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 8233

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8228
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8239
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8240

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8244
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8245

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8249
    .tailcall WSubId_101(WSubId_104, WSubId_105, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8250

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8258
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 8259

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8254
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
.annotate 'line', 8266
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 8267

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8262
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8273
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8274

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8278
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8279

.end # newStringArray


.sub 'parseString' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_107 = "WSubId_107"
# Body
# {
.annotate 'line', 8283
    .tailcall WSubId_101(WSubId_106, WSubId_107, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8284

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
.annotate 'line', 8300
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8301
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8302
    setattribute self, 'name', __ARG_4
.annotate 'line', 8303
    setattribute self, 'value', __ARG_5
.annotate 'line', 8304
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8305

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8308
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8309
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8310
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8311
    $P1 = $P1.'optimize'()
.annotate 'line', 8312
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8313
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8316
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8317
    .return(self)
# }
.annotate 'line', 8318

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8321
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8322

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8325
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8326

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8290
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8292
    addattribute $P0, 'type'
.annotate 'line', 8293
    addattribute $P0, 'name'
.annotate 'line', 8294
    addattribute $P0, 'data'
.annotate 'line', 8295
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_100 = "WSubId_100"
# Body
# {
.annotate 'line', 8331
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8332
# type: $S1
    $P5 = WSubId_99($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8333
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8334
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8336
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8337
# {
.annotate 'line', 8338
    $P1 = __ARG_2.'get'()
.annotate 'line', 8339
# var name: $P3
    set $P3, $P1
.annotate 'line', 8340
    WSubId_57('=', __ARG_2)
.annotate 'line', 8341
# var value: $P4
    $P4 = WSubId_40(__ARG_2, __ARG_3)
.annotate 'line', 8343
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8342
    $P2 = WSubId_100($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8344
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8345
    .return($P2)
# }
.annotate 'line', 8346

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8357
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8358
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8359
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8360
    $P4 = WSubId_40(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8361
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8363
    WSubId_4(';', $P1)
# }
.annotate 'line', 8364

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8367
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8368
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8369
    .return(self)
# }
.annotate 'line', 8370

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8373
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8374

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8377
    self.'annotate'(__ARG_1)
.annotate 'line', 8378
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8379
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8380
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8381
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8382
    if_null $P1, __label_3
.annotate 'line', 8383
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8384
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8385
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8386
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
.annotate 'line', 8388
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8389
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8391
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8396
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8397
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8400
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8402
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8406
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8407

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8352
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8354
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 8414
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8415
    WSubId_57(';', __ARG_2)
# }
.annotate 'line', 8416

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8419
    self.'annotate'(__ARG_1)
.annotate 'line', 8420
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8421
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8422
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8423

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8410
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 8432
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8433
    $P2 = WSubId_40(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8434
    WSubId_57(']', __ARG_2)
.annotate 'line', 8435
    WSubId_57(';', __ARG_2)
# }
.annotate 'line', 8436

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8439
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8440
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8441

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8444
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8445
    self.'annotate'(__ARG_1)
.annotate 'line', 8446
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8447
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8448
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8449

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8426
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8428
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 8454
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8455
    WSubId_96($P1)
.annotate 'line', 8456
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8457
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8458
    $P2 = __ARG_2.'get'()
.annotate 'line', 8459
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8460
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8462
    __ARG_2.'unget'($P2)
.annotate 'line', 8463
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
.annotate 'line', 8467
    __ARG_2.'unget'($P2)
.annotate 'line', 8468
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8470

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_49 = "WSubId_49"
# Body
# {
.annotate 'line', 8474
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8475
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8476
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8477
    .tailcall WSubId_49(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8478

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8491
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8492
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8493
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8494
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8495
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8496
    __ARG_2.'unget'($P1)
.annotate 'line', 8497
# var c: $P2
    $P2 = WSubId_97(__ARG_2, self)
.annotate 'line', 8498
    unless_null $P2, __label_3
.annotate 'line', 8499
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8500
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8502
    setattribute self, 'end', $P1
# }
.annotate 'line', 8503

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8506
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8507
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8508
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8509
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8510
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8511
    .return($S2)
# }
.annotate 'line', 8512

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8515
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8516
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8517
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8518
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8519
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8520
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8521
    $P1[$S1] = $S3
.annotate 'line', 8522
    .return($S3)
# }
.annotate 'line', 8523

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8524
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8527
    __ARG_1.'comment'('{')
.annotate 'line', 8528
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8529
    $P1.'emit'(__ARG_1)
.annotate 'line', 8530
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8532
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8533

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8484
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8486
    addattribute $P0, 'end'
.annotate 'line', 8487
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8548
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8550
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8551
    new $P1, ['ResizableStringArray']
.annotate 'line', 8552
    new $P2, ['ResizableStringArray']
.annotate 'line', 8553
    setattribute self, 'tempreg', $P1
.annotate 'line', 8554
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8555

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8558
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8559
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8560
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8561
    assign $P1, $I1
# predefined string
.annotate 'line', 8562
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8563

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8566
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8567
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8568
# reg: $S1
    null $S1
.annotate 'line', 8569
# predefined elements
    elements $I1, $P1
    unless $I1, __label_1
.annotate 'line', 8570
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8572
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8573
# predefined push
    push $P2, $S1
.annotate 'line', 8574
    .return($S1)
# }
.annotate 'line', 8575

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8578
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8579
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8580
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8581
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8582
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8583
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8581
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8585
    assign $P2, 0
# }
.annotate 'line', 8586

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8542
    addattribute $P0, 'type'
.annotate 'line', 8543
    addattribute $P0, 'nreg'
.annotate 'line', 8544
    addattribute $P0, 'tempreg'
.annotate 'line', 8545
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8597
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8598

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8601
# var named: $P1
    null $P1
.annotate 'line', 8602
# var slurpy: $P2
    null $P2
.annotate 'line', 8603
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8604
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8605
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8606
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8608
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8611
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8614
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8618
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8625
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8642
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8623
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8626
# setname: $S2
    null $S2
# switch
.annotate 'line', 8627
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8629
    concat $S2, "'", __ARG_3
    concat $S2, $S2, "'"
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8632
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8633
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8634
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8635
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8638
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8640
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8643
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8644
# }
.annotate 'line', 8646

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8593
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 8657
    setattribute self, 'func', __ARG_1
.annotate 'line', 8658
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8659
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_99($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8660
    eq $S1, '', __label_2
.annotate 'line', 8661
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8663
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8664
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 8665
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8666
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8668
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8669
    $P1 = __ARG_2.'get'()
.annotate 'line', 8670
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8671
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8673
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8674

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_108 = "WSubId_108"
# Body
# {
.annotate 'line', 8677
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8678
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8679
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8680
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_108($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8681
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8682
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8683
    if_null $P3, __label_3
.annotate 'line', 8684
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8685
    __ARG_1.'say'('')
# }
.annotate 'line', 8686

.end # emit


.sub 'get_type' :method
# Body
# {
.annotate 'line', 8689
    getattribute $P1, self, 'type'
    .return($P1)
# }
.annotate 'line', 8690

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8651
    addattribute $P0, 'func'
.annotate 'line', 8652
    addattribute $P0, 'name'
.annotate 'line', 8653
    addattribute $P0, 'modifiers'
.annotate 'line', 8654
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8696
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8697

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8708
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8709
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8710

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 8713
# var ns: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 8714
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 8715
# key: $S1
    null $S1
.annotate 'line', 8716
# predefined elements
    elements $I1, $P2
    unless $I1, __label_1
.annotate 'line', 8717
    $P3 = WSubId_22($P2)
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8718
# reg: $S2
    $P3 = __ARG_2.'tempreg'('P')
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8719
    getattribute $P3, self, 'name'
    __ARG_1.'emitget_hll_global'($S2, $P3, $S1)
.annotate 'line', 8720
    .return($S2)
# }
.annotate 'line', 8721

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8703
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8705
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8732
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8733

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8736
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8737
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8738
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8739
    le $I1, 0, __label_3
# {
.annotate 'line', 8740
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8741
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8742
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8743
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8744
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8745
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 8746
    sub $I3, $I1, 1
    ge $I2, $I3, __label_8
.annotate 'line', 8747
    __ARG_1.'print'(", ")
  __label_8: # endif
# }
  __label_4: # for iteration
.annotate 'line', 8741
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8749
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8752

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8728
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8775
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8776
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8777
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8778
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8779
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8780
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8781

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8783
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8787
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8788
    unless_null $P1, __label_1
.annotate 'line', 8789
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8790
    .return($P1)
# }
.annotate 'line', 8791

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8794
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8795
    unless_null $P1, __label_1
.annotate 'line', 8796
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8797
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8798

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8802
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8803
    .return($I1)
# }
.annotate 'line', 8804

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 8807
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8808
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8809
    __ARG_1.'unget'($P1)
.annotate 'line', 8810
    $P3 = WSubId_39(__ARG_1, self, WSubId_109, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8812

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8816
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8817
    unless_null $P1, __label_1
.annotate 'line', 8818
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8820
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8821

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8824
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8825
    unless_null $P1, __label_1
# {
.annotate 'line', 8827
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8830
    if_null $P1, __label_4
    iter $P5, $P1
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 8831
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8832
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8833
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8835

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 8838
# var found: $P1
    null $P1
.annotate 'line', 8839
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8840
    $P1 = $P2.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 8841
    if_null $P1, __label_3
.annotate 'line', 8842
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8844
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8845

.end # scopesearch


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8849
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 8850
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8851
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8852
    .return(self)
# }
.annotate 'line', 8853

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8857
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8858
    unless_null $P1, __label_1
.annotate 'line', 8859
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8860
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8861

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8864
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8865
    unless_null $P1, __label_1
.annotate 'line', 8866
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8867
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8868

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8873
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8874
# lexname: $S1
    null $S1
.annotate 'line', 8875
    if_null $P1, __label_1
.annotate 'line', 8876
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8878
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8879
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8880
# predefined string
    set $S3, $I1
    concat $S1, '__WLEX_', $S3
.annotate 'line', 8881
    self.'setlex'($S1, $S2)
.annotate 'line', 8882
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8884
    .return($S1)
# }
.annotate 'line', 8885

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8889
# var store: $P1
    null $P1
# switch
.annotate 'line', 8890
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
.annotate 'line', 8892
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8894
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8896
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8898
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8900
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8902
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8903
    .return($S1)
# }
.annotate 'line', 8904

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8907
# var store: $P1
    null $P1
# switch
.annotate 'line', 8908
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
.annotate 'line', 8910
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8912
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8914
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8916
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8918
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8920
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8921
    .return($S1)
# }
.annotate 'line', 8922

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8925
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
.annotate 'line', 8926
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8927

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8930
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8931
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8932

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8935
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8936

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8939
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8940

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
# Empty body

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 8946
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 8947
    __ARG_1.'say'()
.annotate 'line', 8948
    __ARG_1.'print'(".sub ")
.annotate 'line', 8949
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 8950
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8952
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8953
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 8954
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 8955
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 8956
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8957
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8958
    if_null $P2, __label_6
.annotate 'line', 8959
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8963
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 8964
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8965
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8966
    if_null $P3, __label_8
.annotate 'line', 8967
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8969
    ne $S1, 'main', __label_10
.annotate 'line', 8970
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8972
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 8973
    __ARG_1.'say'()
.annotate 'line', 8976
    getattribute $P8, self, 'params'
    WSubId_55(__ARG_1, $P8)
.annotate 'line', 8978
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8979
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8980
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8981
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 8983
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 8984
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 8986
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 8987
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 8988
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 8989
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 8993
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 8995
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 8998
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8999
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 9000
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 9002
    __ARG_1.'comment'('Body')
.annotate 'line', 9003
    $P6.'emit'(__ARG_1)
.annotate 'line', 9004
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 9006
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9009
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 9010
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 9011

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8755
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8757
    addattribute $P0, 'name'
.annotate 'line', 8758
    addattribute $P0, 'subid'
.annotate 'line', 8759
    addattribute $P0, 'modifiers'
.annotate 'line', 8760
    addattribute $P0, 'params'
.annotate 'line', 8761
    addattribute $P0, 'body'
.annotate 'line', 8762
    addattribute $P0, 'regstI'
.annotate 'line', 8763
    addattribute $P0, 'regstN'
.annotate 'line', 8764
    addattribute $P0, 'regstS'
.annotate 'line', 8765
    addattribute $P0, 'regstP'
.annotate 'line', 8766
    addattribute $P0, 'nlabel'
.annotate 'line', 8767
    addattribute $P0, 'localfun'
.annotate 'line', 8768
    addattribute $P0, 'lexicals'
.annotate 'line', 8769
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8770
    addattribute $P0, 'usedsubids'
.annotate 'line', 8771
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9027
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9028
    box $P4, 0
    setattribute self, 'paramnum', $P4
.annotate 'line', 9029
    box $P4, 0
    setattribute self, 'lexnum', $P4
.annotate 'line', 9030
    self.'parse'(__ARG_2)
.annotate 'line', 9031
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'multi_sig', $P5
.annotate 'line', 9032
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 9033
    new $P5, [ 'Boolean' ]
    setattribute self, 'is_multi', $P5
.annotate 'line', 9034
    if_null $P1, __label_1
# {
.annotate 'line', 9035
# var multi_sig: $P2
    getattribute $P2, self, 'multi_sig'
.annotate 'line', 9036
# start_idx: $I1
    null $I1
.annotate 'line', 9037
    $P4 = self.'ismethod'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9038
    set $I1, 1
.annotate 'line', 9039
    $P2[0] = 'P'
# }
  __label_2: # endif
# for loop
.annotate 'line', 9041
# i: $I2
    null $I2
  __label_5: # for condition
# predefined elements
    elements $I3, $P1
    ge $I2, $I3, __label_4
# {
.annotate 'line', 9042
# var param: $P3
    $P3 = $P1[$I2]
.annotate 'line', 9043
    add $I3, $I2, $I1
    $P4 = $P3.'get_type'()
    $P2[$I3] = $P4
# }
  __label_3: # for iteration
.annotate 'line', 9041
    set $I3, $I2
    inc $I2
    goto __label_5
  __label_4: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 9046

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9048
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 9052
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9053

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 9057
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9058

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9059
    .return(0)
# }

.end # ismethod


.sub 'ismulti' :method
# Body
# {
.annotate 'line', 9062
    getattribute $P1, self, 'is_multi'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9063

.end # ismulti


.sub 'setmulti' :method
# Body
# {
.annotate 'line', 9066
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
# }
.annotate 'line', 9067

.end # setmulti


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 9071
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9072
    setattribute self, 'name', $P1
.annotate 'line', 9073
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9074
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9075
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9076
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 9078
    WSubId_4('(', $P2)
.annotate 'line', 9079
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9081
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 9082
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 9083
# predefined join
    join $S1, '.', $P3
    WSubId_110(self, '__FUNCTION__', $S1)
.annotate 'line', 9085
    $P2 = __ARG_1.'get'()
.annotate 'line', 9086
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9087
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9088
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9089
    .return(self)
# }
.annotate 'line', 9090

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_108 = "WSubId_108"
# Body
# {
.annotate 'line', 9094
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 9095
# var multi_sig: $P1
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9096
    __ARG_1.'print'(' :multi(')
.annotate 'line', 9097
# sep: $S1
    set $S1, ''
.annotate 'line', 9098
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $S2, $P3
# {
.annotate 'line', 9099
    $P2 = WSubId_108($S2)
    __ARG_1.'print'($S1, $P2)
.annotate 'line', 9100
    set $S1, ', '
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9102
    __ARG_1.'print'(')')
# }
  __label_1: # endif
# }
.annotate 'line', 9104

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9018
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9020
    addattribute $P0, 'paramnum'
.annotate 'line', 9021
    addattribute $P0, 'lexnum'
.annotate 'line', 9022
    addattribute $P0, 'multi_sig'
.annotate 'line', 9023
    addattribute $P0, 'is_multi'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9115
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9116
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9117
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9118
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 9119
    setattribute self, 'name', $P1
.annotate 'line', 9120
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9121
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9122
    WSubId_4('{', $P2)
.annotate 'line', 9123
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9124
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 9125

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9126
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9127
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 9130
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9131
    .return(1)
  __label_1: # endif
.annotate 'line', 9132
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9133
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9134
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9135
    .return(0)
# }
.annotate 'line', 9136

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 9139
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 9140

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 9144
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 9145

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 9149
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 9150

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9153
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9154
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9155
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9157
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9158
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9159
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9160
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 9161
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 9162
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 9163
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 9164
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9165
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 9166
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9167
    eq $S3, 'P', __label_8
.annotate 'line', 9168
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9169
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9170
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9171
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9172
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 9175
    .return(__ARG_2)
# }
.annotate 'line', 9176

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9179
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9180
    unless_null $P1, __label_1
.annotate 'line', 9181
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9182
    unless_null $P1, __label_2
# {
.annotate 'line', 9185
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9186
    unless_null $P1, __label_3
# {
.annotate 'line', 9188
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 9189
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 9190
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 9191
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9192
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9193
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9194
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 9198
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 9200
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9201
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9202
    .return($P1)
# }
.annotate 'line', 9203

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9111
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
.annotate 'line', 9214
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9215

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9216
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9210
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 9230
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9231
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9232
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9233
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9234
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9235
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_99($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9236
    set $P1, $P2
.annotate 'line', 9237
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9238
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 9240
    setattribute self, 'name', $P1
.annotate 'line', 9241
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9242
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9243
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9244
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9246
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 9247

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9250
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9251
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9252
    if_null $P1, __label_1
# {
.annotate 'line', 9253
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 9254
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 9256

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9225
    addattribute $P0, 'name'
.annotate 'line', 9226
    addattribute $P0, 'modifiers'
.annotate 'line', 9227
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9261
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 9262

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_111 = "WSubId_111"
# Body
# {
.annotate 'line', 9269
    $P2 = WSubId_39(__ARG_1, __ARG_2, WSubId_111, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 9270

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9273
    __ARG_1.'print'('(')
.annotate 'line', 9274
# sep: $S1
    set $S1, ''
.annotate 'line', 9275
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 9276
    __ARG_1.'print'($S1)
.annotate 'line', 9277
    $P1.'emit'(__ARG_1)
.annotate 'line', 9278
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9280
    __ARG_1.'print'(')')
# }
.annotate 'line', 9281

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9266
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
.annotate 'line', 9290
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9291
    setattribute self, 'params', __ARG_3
.annotate 'line', 9292
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 9293

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9296
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9297
    .return(self)
# }
.annotate 'line', 9298

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9301
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 9302
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9303
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9304
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9305
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9306
    __ARG_1.'print'('    ')
.annotate 'line', 9307
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9308
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9309
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9310
    __ARG_1.'say'()
# }
.annotate 'line', 9311

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9284
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9286
    addattribute $P0, 'params'
.annotate 'line', 9287
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
.annotate 'line', 9328
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9329

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9330
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9334
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9335

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9324
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9343
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9344
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9345

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9346
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9350
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9351
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9352

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9338
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9340
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9361
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9362
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9363
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9364
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9365
    WSubId_43('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9366
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 9367
    $P2 = __ARG_1.'get'()
.annotate 'line', 9368
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9369
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9371
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9375
    WSubId_44('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9377
# {
.annotate 'line', 9378
    $P2 = __ARG_1.'get'()
.annotate 'line', 9379
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9380
    WSubId_43('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9381
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9382
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9383
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9385
    setattribute self, 'key', $P1
# }
.annotate 'line', 9386

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9387
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 9390
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9391

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9395
    getattribute $P2, self, 'key'
    $P1 = WSubId_22($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9396

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9355
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9357
    addattribute $P0, 'key'
.annotate 'line', 9358
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9404
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9405
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
# predefined string
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 9406
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9407
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9408
    $P2 = __ARG_1.'get'()
.annotate 'line', 9409
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9411
    __ARG_1.'unget'($P2)
.annotate 'line', 9412
    setattribute self, 'key', $P1
# }
.annotate 'line', 9413

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9414
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9418
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9419
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9420

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9424
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9425
    unless_null $P1, __label_1
# {
.annotate 'line', 9426
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9427
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_71($S2)
  __label_3: # endif
.annotate 'line', 9428
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9430
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9431

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9399
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9401
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9436
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9437
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9438
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9439
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9440
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9441
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9442
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9443
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9444

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9456
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9457
    setattribute self, 'name', __ARG_2
.annotate 'line', 9458
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9459
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 9460
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9461

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9464
    getattribute $P1, self, 'classns'
    .tailcall WSubId_22($P1)
# }
.annotate 'line', 9465

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9450
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9452
    addattribute $P0, 'name'
.annotate 'line', 9453
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 9478
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9479
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9480
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9481
    setattribute self, 'functions', $P1
.annotate 'line', 9482
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9483
    setattribute self, 'members', $P2
.annotate 'line', 9484
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9485
    setattribute self, 'constants', $P3
.annotate 'line', 9486
# var seen_functions: $P4
    root_new $P4, ['parrot';'Hash']
.annotate 'line', 9488
# var t: $P5
    $P5 = __ARG_4.'get'()
.annotate 'line', 9489
    $P10 = $P5.'isop'(':')
    if_null $P10, __label_1
    unless $P10 goto __label_1
# {
.annotate 'line', 9490
    $P12 = WSubId_39(__ARG_4, self, WSubId_65)
    setattribute self, 'bases', $P12
.annotate 'line', 9491
    $P5 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9493
    WSubId_4('{', $P5)
.annotate 'line', 9495
    getattribute $P10, self, 'classns'
# predefined join
    join $S1, '.', $P10
    WSubId_110(self, '__CLASS__', $S1)
# for loop
.annotate 'line', 9497
    $P5 = __ARG_4.'get'()
  __label_4: # for condition
    $P10 = $P5.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9498
    $P11 = $P5.'checkkeyword'()
    set $S1, $P11
    set $S2, 'function'
    if $S1 == $S2 goto __label_7
    set $S2, 'var'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 9500
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P6.'MethodStatement'($P5, __ARG_4, self)
.annotate 'line', 9501
# predefined push
    push $P1, $P6
.annotate 'line', 9502
# var first_func: $P7
    getattribute $P12, $P6, 'name'
    $P7 = $P4[$P12]
.annotate 'line', 9503
    unless_null $P7, __label_10
.annotate 'line', 9504
    getattribute $P13, $P6, 'name'
    $P4[$P13] = $P6
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 9506
    $P7.'setmulti'()
.annotate 'line', 9507
    $P6.'setmulti'()
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9511
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 9512
    $P10 = $P8.'isidentifier'()
    isfalse $I1, $P10
    unless $I1 goto __label_12
.annotate 'line', 9513
    WSubId_43("member identifier", $P8)
  __label_12: # endif
.annotate 'line', 9514
# predefined push
    push $P2, $P8
.annotate 'line', 9515
    $P5 = __ARG_4.'get'()
.annotate 'line', 9516
    $P11 = $P5.'isop'(';')
    isfalse $I2, $P11
    unless $I2 goto __label_13
.annotate 'line', 9517
    WSubId_43("';' in member declaration", $P5)
  __label_13: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9520
# var cst: $P9
    $P9 = WSubId_47($P5, __ARG_4, self)
.annotate 'line', 9521
# predefined push
    push $P3, $P9
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9524
    WSubId_44("item in class", $P5)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9497
    $P5 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9527

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9530
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9531

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9534
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9535

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9538
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9539

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9542
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9543

.end # scopesearch


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9546
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9547

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9550
    getattribute $P1, self, 'constants'
    WSubId_41($P1)
.annotate 'line', 9551
    getattribute $P1, self, 'functions'
    WSubId_41($P1)
.annotate 'line', 9552
    .return(self)
# }
.annotate 'line', 9553

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 9556
    getattribute $P3, self, 'classns'
    __ARG_1.'emitnamespace'($P3)
.annotate 'line', 9557
    getattribute $P3, self, 'functions'
    WSubId_55(__ARG_1, $P3)
.annotate 'line', 9559
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9561
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 9562
# n: $I1
    set $I1, 1
.annotate 'line', 9563
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 9564
    $P1.'annotate'(__ARG_1)
.annotate 'line', 9565
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9566
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9567
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 9568
    __ARG_1.'say'()
.annotate 'line', 9569
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9571
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 9572
    __ARG_1.'annotate'($P2)
.annotate 'line', 9573
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9576
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9577

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9468
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9470
    addattribute $P0, 'parent'
.annotate 'line', 9471
    addattribute $P0, 'bases'
.annotate 'line', 9472
    addattribute $P0, 'constants'
.annotate 'line', 9473
    addattribute $P0, 'functions'
.annotate 'line', 9474
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9584
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9585

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9588
    .return(self)
# }
.annotate 'line', 9589

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9580
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9597
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9598
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9599
# var nskey: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9600
# var ns: $P4
    null $P4
# for loop
  __label_3: # for condition
.annotate 'line', 9602
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
# {
.annotate 'line', 9603
    $P3.'push'($P1)
.annotate 'line', 9604
    $P1 = __ARG_2.'get'()
# }
  __label_1: # for iteration
.annotate 'line', 9602
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9607
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 9608
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 9609
# predefined string
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 9610
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 9613
    __ARG_2.'unget'($P2)
.annotate 'line', 9614
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 9615
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9616
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
# }
  __label_5: # endif
# }
.annotate 'line', 9618

.end # parseClass


.sub 'open_include' :subid('WSubId_112')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9626
# var interp: $P1
# predefined getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9631
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9632
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9633
# var file: $P4
    null $P4
.annotate 'line', 9634
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9635
# filepath: $S2
    concat $S2, $S1, __ARG_1
.annotate 'line', 9636
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9637
# predefined open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9638
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 9639
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9636
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
.annotate 'line', 9644
    isnull $I1, $P4
    if $I1 goto __label_8
    $I1 = $P4.'is_closed'()
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 9645
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 9646
    $P4.'encoding'("utf8")
.annotate 'line', 9647
    .return($P4)
# }
.annotate 'line', 9648

.end # open_include


.sub 'include_parrot' :subid('WSubId_115')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9652
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9653
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9654
    WSubId_43('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9655
    WSubId_57(';', __ARG_2)
.annotate 'line', 9657
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9658
# var file: $P2
    $P2 = WSubId_112($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9663
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
.annotate 'line', 9664
# predefined substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9665
# pos: $I1
    set $I1, 12
.annotate 'line', 9666
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9667
# predefined substr
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 9668
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9669
# pos2: $I2
    set $I2, $I1
  __label_12: # while
.annotate 'line', 9670
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 9671
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9672
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 9673
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 9675
# name: $S4
    sub $I4, $I2, $I1
# predefined substr
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 9676
# predefined substr
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 9677
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 9678
    set $I1, $I2
  __label_22: # while
.annotate 'line', 9679
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 9680
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 9681
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 9682
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 9684
# value: $S5
    sub $I4, $I2, $I1
# predefined substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 9686
# ivalue: $I3
    null $I3
.annotate 'line', 9687
# predefined substr
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
# predefined substr
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 9688
# predefined substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 9690
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 9691
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 9693
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 9692
    $P4 = WSubId_21(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9663
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 9697
    $P2.'close'()
# }
.annotate 'line', 9698

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_112 = "WSubId_112"
# Body
# {
.annotate 'line', 9704
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9705
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 9706
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9707
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9708
    WSubId_43('literal string', $P1)
  __label_2: # endif
.annotate 'line', 9709
    WSubId_57(';', __ARG_2)
.annotate 'line', 9711
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 9712
# var file: $P2
    $P2 = WSubId_112($S1, __ARG_1)
.annotate 'line', 9714
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 9715
    __ARG_3.'parse'($P3)
.annotate 'line', 9717
    $P2.'close'()
# }
.annotate 'line', 9718

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_61 = "WSubId_61"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 9724
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9725
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 9726
    WSubId_61(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9727
    WSubId_57(';', __ARG_2)
.annotate 'line', 9728
    .return()
# }
  __label_1: # endif
.annotate 'line', 9730
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
# {
.annotate 'line', 9731
    __ARG_2.'unget'($P1)
.annotate 'line', 9732
# var key: $P2
    $P2 = WSubId_58(__ARG_2)
.annotate 'line', 9733
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9734
    ge $I1, 1, __label_3
.annotate 'line', 9735
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 9736
    WSubId_57(';', __ARG_2)
.annotate 'line', 9737
    __ARG_3.'use'($P2)
.annotate 'line', 9738
    .return()
# }
  __label_2: # endif
.annotate 'line', 9740
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9742
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 9748
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9744
# reqlib: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 9745
    __ARG_3.'addlib'($S1)
.annotate 'line', 9746
    WSubId_57(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9749
    __ARG_2.'unget'($P1)
.annotate 'line', 9750
# var module: $P3
    $P3 = WSubId_58(__ARG_2)
.annotate 'line', 9751
    $P1 = __ARG_2.'get'()
.annotate 'line', 9752
    $P6 = $P1.'isop'(';')
    isfalse $I3, $P6
    unless $I3 goto __label_9
# {
.annotate 'line', 9753
    __ARG_2.'unget'($P1)
.annotate 'line', 9754
# var names: $P4
    null $P5
    $P4 = WSubId_39(__ARG_2, $P5, WSubId_60, ';')
.annotate 'line', 9755
    __ARG_3.'addextern'($P3, $P4)
# }
  __label_9: # endif
.annotate 'line', 9757
# reqmodule: $S2
# predefined join
    join $S3, '/', $P3
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9758
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9761
    WSubId_43('string literal or identifier', $P1)
  __label_4: # switch end
# }
.annotate 'line', 9763

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9773
    setattribute self, 'module', __ARG_1
.annotate 'line', 9774
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9775

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9780
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9788
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9789
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9790
    __ARG_1.'say'("']")
.annotate 'line', 9791
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9792
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9793
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9799

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9769
    addattribute $P0, 'module'
.annotate 'line', 9770
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 9819
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9820
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9821
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9822
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9823
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9824
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 9825
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions_name', $P2
.annotate 'line', 9826
    getattribute $P1, self, 'nspath'
# predefined join
    join $S1, '.', $P1
    WSubId_110(self, '__NAMESPACE__', $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9829
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9830
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9831
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9832
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9833
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
.annotate 'line', 9834
    getattribute $P2, __ARG_2, 'functions_name'
    setattribute self, 'functions_name', $P2
# }
  __label_2: # endif
.annotate 'line', 9836
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9837

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9840
# var ns: $P1
    null $P1
.annotate 'line', 9841
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9842
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9843
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9844
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9845
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9846

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9849
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9850

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9853
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9854
    .return()
  __label_1: # endif
.annotate 'line', 9855
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9856
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9857
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9858
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9859
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9860

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9863
# var sym: $P1
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 9864
    if_null $P1, __label_1
# {
.annotate 'line', 9865
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9866
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9869
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9870
# var ns: $P2
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 9871
    if_null $P2, __label_5
# {
.annotate 'line', 9872
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9873
    if_null $P1, __label_6
.annotate 'line', 9874
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9877

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9880
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9881
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9882
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9883
    .return($P2)
# }
.annotate 'line', 9884

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9887
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9888
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9889
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9890
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9891

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9895
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9896
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9897
    unless_null $P2, __label_1
.annotate 'line', 9898
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9900
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9901

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9905
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9906
# var cl: $P2
    null $P2
.annotate 'line', 9907
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9908
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9909
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9910
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9911
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9912
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9913
    .return($P5)
# }
.annotate 'line', 9914

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9917
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9918
    if_null $P1, __label_1
.annotate 'line', 9919
    .return($P1)
  __label_1: # endif
.annotate 'line', 9920
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9921
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9922
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9923
    .return($P2)
# }
.annotate 'line', 9924

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 9929
# keylen: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9930
# name: $S1
    null $S1
.annotate 'line', 9931
# var sym: $P1
    null $P1
.annotate 'line', 9932
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9933
    sub $I2, $I1, __ARG_3
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9937
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
# switch
.annotate 'line', 9938
    set $I5, __ARG_2
    set $I6, 1
    if $I5 == $I6 goto __label_7
    set $I6, 2
    if $I5 == $I6 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 9940
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 9942
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 9945
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 9946
    .return($P1)
  __label_9: # endif
.annotate 'line', 9947
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 9948
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 9949
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9956
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 9957
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9958
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_14
.annotate 'line', 9959
    add $I8, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I8)
    isnull $I7, $P1
    not $I7
  __label_14:
    unless $I7 goto __label_13
.annotate 'line', 9960
    .return($P1)
  __label_13: # endif
.annotate 'line', 9961
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9962
    isnull $I9, $P2
    not $I9
    unless $I9 goto __label_16
.annotate 'line', 9963
    add $I10, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I10)
    isnull $I9, $P1
    not $I9
  __label_16:
    unless $I9 goto __label_15
.annotate 'line', 9964
    .return($P1)
  __label_15: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9966
    .return($P3)
# }
.annotate 'line', 9967

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9970
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9971
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9972
    .return($P1)
# }
.annotate 'line', 9973

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9976
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9977
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9978
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9979
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9980
    .return($P2)
# }
.annotate 'line', 9981

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9984
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9985

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9988
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9989
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9990

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9993
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9994
# name: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 9995
    $P1 = __ARG_2.'get'()
.annotate 'line', 9997
# var parent: $P2
    set $P2, self
# for loop
  __label_4: # for condition
.annotate 'line', 9998
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 9999
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10000
    $P5 = __ARG_2.'get'()
    set $S1, $P5
# }
  __label_2: # for iteration
.annotate 'line', 9998
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10003
# var modifier: $P3
    null $P3
.annotate 'line', 10004
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 10005
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10006
    $P1 = __ARG_2.'get'()
# }
  __label_5: # endif
.annotate 'line', 10009
    WSubId_4('{', $P1)
.annotate 'line', 10010
# var child: $P4
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10011
    $P4.'parse'(__ARG_2)
# }
.annotate 'line', 10012

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_116 = "WSubId_116"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 10015
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 10016
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 10017
# var functions_name: $P3
    getattribute $P3, self, 'functions_name'
.annotate 'line', 10018
# var classes: $P4
    getattribute $P4, self, 'classes'
.annotate 'line', 10019
# var t: $P5
    null $P5
# for loop
.annotate 'line', 10020
    $P5 = __ARG_1.'get'()
  __label_3: # for condition
    $I2 = $P5.'iseof'()
    if $I2 goto __label_4
    $I2 = $P5.'isop'('}')
  __label_4:
    not $I1, $I2
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 10022
    $P11 = $P5.'checkkeyword'()
    set $S2, $P11
    set $S3, 'namespace'
    if $S2 == $S3 goto __label_7
    set $S3, 'const'
    if $S2 == $S3 goto __label_8
    set $S3, 'function'
    if $S2 == $S3 goto __label_9
    set $S3, 'class'
    if $S2 == $S3 goto __label_10
    set $S3, 'extern'
    if $S2 == $S3 goto __label_11
    set $S3, 'using'
    if $S2 == $S3 goto __label_12
    set $S3, '$include_const'
    if $S2 == $S3 goto __label_13
    set $S3, '$include'
    if $S2 == $S3 goto __label_14
    set $S3, '$load'
    if $S2 == $S3 goto __label_15
    set $S3, '$loadlib'
    if $S2 == $S3 goto __label_16
    goto __label_6
  __label_7: # case
.annotate 'line', 10024
    self.'parsenamespace'($P5, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10027
# var cst: $P6
    $P6 = WSubId_47($P5, __ARG_1, self)
.annotate 'line', 10028
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10031
# var f: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P7.'FunctionStatement'($P5, __ARG_1, self)
.annotate 'line', 10032
# name: $S1
    getattribute $P12, $P7, 'name'
    null $S1
    if_null $P12, __label_17
    set $S1, $P12
  __label_17:
.annotate 'line', 10033
# predefined push
    push $P2, $P7
.annotate 'line', 10034
# predefined push
    push $P1, $P7
.annotate 'line', 10035
# var funcs: $P8
    $P8 = $P3[$S1]
.annotate 'line', 10036
    if_null $P8, __label_18
# {
.annotate 'line', 10037
    $P7.'setmulti'()
.annotate 'line', 10038
# predefined elements
    elements $I1, $P8
    ne $I1, 1, __label_20
.annotate 'line', 10039
    $P11 = $P8[0]
    $P11.'setmulti'()
  __label_20: # endif
.annotate 'line', 10040
    $P8.'push'($P7)
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 10043
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P11[0] = $P7
    $P3[$S1] = $P11
  __label_19: # endif
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 10046
    WSubId_113($P5, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 10049
# var t1: $P9
    $P9 = __ARG_1.'get'()
.annotate 'line', 10050
    $P12 = $P9.'iskeyword'('function')
    isfalse $I1, $P12
    unless $I1 goto __label_21
.annotate 'line', 10051
    WSubId_1('Unsupported extern', $P9)
  __label_21: # endif
.annotate 'line', 10052
    $P9 = __ARG_1.'get'()
.annotate 'line', 10053
    WSubId_96($P9)
.annotate 'line', 10054
    WSubId_57(';', __ARG_1)
.annotate 'line', 10055
# var fex: $P10
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P10.'FunctionExtern'($P9, self)
.annotate 'line', 10056
# predefined push
    push $P2, $P10
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 10059
    WSubId_114($P5, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 10062
    WSubId_115($P5, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 10065
    WSubId_116($P5, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 10068
    $P5 = __ARG_1.'get'()
.annotate 'line', 10069
    $P13 = $P5.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_22
.annotate 'line', 10070
    WSubId_43('string literal', $P5)
  __label_22: # endif
.annotate 'line', 10071
    WSubId_57(';', __ARG_1)
.annotate 'line', 10072
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P5)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 10075
    $P5 = __ARG_1.'get'()
.annotate 'line', 10076
    $P17 = $P5.'isstring'()
    isfalse $I3, $P17
    unless $I3 goto __label_23
.annotate 'line', 10077
    WSubId_43('string literal', $P5)
  __label_23: # endif
.annotate 'line', 10078
    WSubId_57(';', __ARG_1)
.annotate 'line', 10079
    new $P20, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P5)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10082
    WSubId_44("token", $P5)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 10020
    $P5 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10085
    $P11 = $P5.'iseof'()
    if_null $P11, __label_24
    unless $P11 goto __label_24
.annotate 'line', 10086
    self.'unclosed_ns'()
    goto __label_25
  __label_24: # else
.annotate 'line', 10088
    self.'close_ns'($P5)
  __label_25: # endif
# }
.annotate 'line', 10089

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 10092
    getattribute $P1, self, 'items'
    WSubId_41($P1)
# }
.annotate 'line', 10093

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 10096
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 10098
# activate: $I1
    set $I1, 1
.annotate 'line', 10100
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10101
    if_null $P2, __label_1
# {
.annotate 'line', 10102
    __ARG_1.'emitnamespace'($P1)
.annotate 'line', 10103
    null $I1
.annotate 'line', 10104
    WSubId_55(__ARG_1, $P2)
# }
  __label_1: # endif
.annotate 'line', 10107
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
# {
.annotate 'line', 10108
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 10109
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 10110
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10112
    unless $I1 goto __label_7
# {
.annotate 'line', 10113
    __ARG_1.'emitnamespace'($P1)
.annotate 'line', 10114
    null $I1
# }
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10116
    $P3.'emit'(__ARG_1)
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 10118

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9806
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9808
    addattribute $P0, 'nspath'
.annotate 'line', 9809
    addattribute $P0, 'externals'
.annotate 'line', 9810
    addattribute $P0, 'namespaces'
.annotate 'line', 9811
    addattribute $P0, 'classes'
.annotate 'line', 9812
    addattribute $P0, 'functions'
.annotate 'line', 9813
    addattribute $P0, 'functions_name'
.annotate 'line', 9814
    addattribute $P0, 'items'
.annotate 'line', 9815
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
.annotate 'line', 10136
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 10137
# predefined push
    push $P1, __ARG_4
.annotate 'line', 10138
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10140
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10141
    setattribute self, 'start', __ARG_2
.annotate 'line', 10142
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10143
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 10144
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10145
    if_null __ARG_5, __label_1
# {
.annotate 'line', 10146
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 10147
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 10149

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10152
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10153

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10156
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 10157

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10160
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 10161

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10164
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 10165

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10168
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 10169

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10172
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10173
    unless_null $P1, __label_1
.annotate 'line', 10174
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10175
    .return($P1)
# }
.annotate 'line', 10176

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10179
# var sym: $P1
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10180
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10181
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10182
    .return($P1)
# }
.annotate 'line', 10183

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10186
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 10187

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10194
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 10195
    if_null $P1, __label_1
.annotate 'line', 10196
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10197
    self.'optimize_base'()
.annotate 'line', 10198
    .return(self)
# }
.annotate 'line', 10199

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10202
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10203
    if_null $P1, __label_1
.annotate 'line', 10204
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 10206
    self.'emit_base'(__ARG_1)
.annotate 'line', 10208
    if_null $P1, __label_2
.annotate 'line', 10209
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 10210

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10125
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10127
    addattribute $P0, 'parent'
.annotate 'line', 10128
    addattribute $P0, 'start'
.annotate 'line', 10129
    addattribute $P0, 'name'
.annotate 'line', 10130
    addattribute $P0, 'modifier'
.annotate 'line', 10131
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10227
    new $P1, ['ResizableStringArray']
.annotate 'line', 10228
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10229
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10230
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 10231
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 10232

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10235
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10236
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10237

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10240
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10241
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 10242

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10246
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 10247
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 10248

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10252
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 10253
    unless_null $P1, __label_1
.annotate 'line', 10254
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10255
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10256

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10259
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 10260
    unless_null $P1, __label_1
.annotate 'line', 10261
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10262
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10263

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10266
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 10267

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10270
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 10271

.end # scopesearch


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10278
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 10279

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10282
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10283

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10286
    self.'optimize_base'()
.annotate 'line', 10287
    .return(self)
# }
.annotate 'line', 10288

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10291
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10294
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10295
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10298
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
.annotate 'line', 10301
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10302
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10303
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10304
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10307
# somelib: $I1
    null $I1
.annotate 'line', 10308
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10309
    if_null $P3, __label_5
# {
.annotate 'line', 10310
    set $I1, 1
.annotate 'line', 10311
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10312
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10315
# someload: $I2
    null $I2
.annotate 'line', 10316
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10317
    if_null $P4, __label_8
# {
.annotate 'line', 10318
    set $I2, 1
.annotate 'line', 10319
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10320
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10321
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10322
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10324
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10325
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10327
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10328

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10331
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10332
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10333
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10334
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 10335
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 10336
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10338
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10339
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10341

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10217
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10219
    addattribute $P0, 'unit'
.annotate 'line', 10220
    addattribute $P0, 'predefs_used'
.annotate 'line', 10221
    addattribute $P0, 'libs'
.annotate 'line', 10222
    addattribute $P0, 'loads'
.annotate 'line', 10223
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10353
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10354
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10355

.end # Builtin


.sub 'getname' :method
# Body
# {
# predefined string
.annotate 'line', 10356
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10359
    getattribute $P1, self, 'variants'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10360

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10349
    addattribute $P0, 'name'
.annotate 'line', 10350
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
# Body
# {
.annotate 'line', 10370
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
# }
.annotate 'line', 10371

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10374
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10375
# name: $S1
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10376
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 10377
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 10379
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
# }
.annotate 'line', 10380

.end # add


.sub 'put' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10383
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10384
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10385
    getattribute $P3, __ARG_1, 'functions'
    $P4 = $P1[$S1]
# predefined push
    push $P3, $P4
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10386

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 10367
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_117 = "WSubId_117"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_118 = "WSubId_118"
# Body
# {
.annotate 'line', 10396
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 10397
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10401
    WSubId_117($P1, 'false', 0)
.annotate 'line', 10402
    WSubId_117($P1, 'true', 1)
.annotate 'line', 10407
    WSubId_110($P1, '__STAGE__', "3")
.annotate 'line', 10410
    WSubId_117($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 10413
    WSubId_117($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10416
# var builtins_ns: $P2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 10418
# var builder: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 10419
    WSubId_118($P3)
.annotate 'line', 10420
    $P3.'put'($P2)
.annotate 'line', 10422
    $P1.'usenamespace'($P2)
.annotate 'line', 10424
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10425

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 10428
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10429

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10432
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10433
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10434

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10437
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10438

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10441
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10442
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10443
    __ARG_1.'say'('')
.annotate 'line', 10445
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10447
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10448

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10451
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10452
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10454
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10456
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10457

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10391
    addattribute $P0, 'rootns'
.annotate 'line', 10392
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
# Body
# {
.annotate 'line', 10466
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 2
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 10467
    .return($P1)
# }
.annotate 'line', 10468

.end # version


.sub 'version_string' :method
# Body
# {
# predefined string
.annotate 'line', 10471
    $P1 = self.'version'()
# predefined join
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
# }
.annotate 'line', 10472

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
# Body
# {
.annotate 'line', 10475
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10476
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10477
# var handleout: $P1
    null $P1
.annotate 'line', 10478
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10479
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10480
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10483
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10484
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10485
    unless __ARG_4 goto __label_4
.annotate 'line', 10486
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 10487
    __ARG_1.'emit'($P2)
.annotate 'line', 10488
    $P2.'close'()
.annotate 'line', 10489
    if_null __ARG_3, __label_5
.annotate 'line', 10490
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 10492
    $P1.'close'()
.annotate 'line', 10493
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10494
# var object: $P3
    null $P3
# switch
.annotate 'line', 10495
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 10497
    new $P3, [ 'String' ]
.annotate 'line', 10498
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 10502
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 10503
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 10504
# predefined string
.annotate 'line', 10506
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 10508
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 10510

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10513
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10514
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10515
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10516
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10517
    $P2.'close'()
.annotate 'line', 10518
    $P1.'close'()
.annotate 'line', 10519
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10520

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10528
    unless_null __ARG_2, __label_1
.annotate 'line', 10529
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10530
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10531
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10532
    $P1.'puts'(__ARG_1)
.annotate 'line', 10533
    $P1.'close'()
.annotate 'line', 10534
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10535
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10536
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10537
    $P3.'parse'($P2)
.annotate 'line', 10538
    $P1.'close'()
.annotate 'line', 10539
    $P3.'optimize'()
.annotate 'line', 10540
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10541
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10543
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10544

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10553
    unless_null __ARG_2, __label_1
.annotate 'line', 10554
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10555
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10556
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10557
    $P1.'encoding'('utf8')
.annotate 'line', 10558
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10559
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10560
    $P3.'parse'($P2)
.annotate 'line', 10561
    $P1.'close'()
.annotate 'line', 10562
    $P3.'optimize'()
.annotate 'line', 10563
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10564
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10566
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10567

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10576
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10577
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10578

.end # initializer

# End generated code
