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

.sub 'Warn' :subid('WSubId_69')
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


.sub 'NoLeftSide' :subid('WSubId_60')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 130
    WSubId_1('Not a left-side expression', __ARG_1)
# }
.annotate 'line', 131

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_41')
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


.sub 'Unexpected' :subid('WSubId_42')
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


.sub 'RequireIdentifier' :subid('WSubId_94')
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


.sub 'ExpectOp' :subid('WSubId_55')
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


.sub 'ExpectKeyword' :subid('WSubId_96')
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


.sub 'UndefinedVariable' :subid('WSubId_62')
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
    root_new $P3, ['parrot';'Hash']
    $P3[''] = WSubId_11
    $P3['{'] = WSubId_12
    $P1['$'] = $P3
.annotate 'line', 652
    $P1['"'] = WSubId_13
.annotate 'line', 653
    $P1["'"] = WSubId_14
.annotate 'line', 654
    root_new $P9, ['parrot';'Hash']
.annotate 'line', 655
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_12
    $P11['='] = WSubId_12
    $P9['='] = $P11
.annotate 'line', 656
    $P9[':'] = WSubId_12
    $P1['='] = $P9
.annotate 'line', 658
    root_new $P16, ['parrot';'Hash']
    $P16['+'] = WSubId_12
    $P16['='] = WSubId_12
    $P1['+'] = $P16
.annotate 'line', 659
    root_new $P20, ['parrot';'Hash']
    $P20['-'] = WSubId_12
    $P20['='] = WSubId_12
    $P1['-'] = $P20
.annotate 'line', 660
    root_new $P24, ['parrot';'Hash']
    $P24['='] = WSubId_12
    $P1['*'] = $P24
.annotate 'line', 661
    root_new $P27, ['parrot';'Hash']
    $P27['|'] = WSubId_12
    $P1['|'] = $P27
.annotate 'line', 662
    root_new $P30, ['parrot';'Hash']
    $P30['&'] = WSubId_12
    $P1['&'] = $P30
.annotate 'line', 663
    root_new $P33, ['parrot';'Hash']
.annotate 'line', 664
    root_new $P35, ['parrot';'Hash']
    $P35[''] = WSubId_12
    $P35[':'] = WSubId_15
    $P33['<'] = $P35
.annotate 'line', 665
    $P33['='] = WSubId_12
    $P1['<'] = $P33
.annotate 'line', 667
    root_new $P40, ['parrot';'Hash']
    $P40['>'] = WSubId_12
    $P40['='] = WSubId_12
    $P1['>'] = $P40
.annotate 'line', 668
    root_new $P44, ['parrot';'Hash']
.annotate 'line', 669
    root_new $P46, ['parrot';'Hash']
    $P46[''] = WSubId_12
    $P46['='] = WSubId_12
    $P44['='] = $P46
    $P1['!'] = $P44
.annotate 'line', 671
    root_new $P50, ['parrot';'Hash']
    $P50['%'] = WSubId_12
    $P50['='] = WSubId_12
    $P1['%'] = $P50
.annotate 'line', 672
    root_new $P54, ['parrot';'Hash']
    $P54['='] = WSubId_12
    $P54['/'] = WSubId_16
    $P54['*'] = WSubId_17
    $P1['/'] = $P54
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
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 727
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 728
    .tailcall WSubId_12(self, $S2, $I1)
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

.sub 'typetoregcheck' :subid('WSubId_97')
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


.sub 'typetopirname' :subid('WSubId_106')
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
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 819
    getattribute $P5, self, 'file'
.annotate 'line', 817
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
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
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 827
    getattribute $P5, self, 'line'
.annotate 'line', 825
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
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
    le $I1, 0, __label_1
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


.sub 'floatValue' :subid('WSubId_64')
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


.sub 'floatresult' :subid('WSubId_65')
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


.sub 'floatAsString' :subid('WSubId_61')
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

.sub 'createPredefConstInt' :subid('WSubId_115')
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


.sub 'createPredefConstString' :subid('WSubId_108')
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


.sub 'name' :method
# Body
# {
.annotate 'line', 1211
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1212
    .return($S1)
# }
.annotate 'line', 1213

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1216
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1217

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1218
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1221
# type: $S1
    null $S1
# switch
.annotate 'line', 1222
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
.annotate 'line', 1223
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1224
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1225
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1226
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1228
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1230
    .return($S1)
# }
.annotate 'line', 1231

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1234
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1235
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1236
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1237
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1238
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1239
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1240

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
.annotate 'line', 1252
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1253

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1243
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
.annotate 'line', 1266
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1267
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1268

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1256
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1258
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1276
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1277

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
.annotate 'line', 1280
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1281
# predefined elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1282
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1283
# var rawarg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1284
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1286
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1287
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1288
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1291
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1292
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1294
    ne $S3, 'null', __label_9
.annotate 'line', 1295
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1297
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1299

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1273
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Predef_varcast' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1304
# predefined elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1305
    WSubId_6("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1306
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1307
# argtype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 1308
    ne $S1, 'P', __label_3
# {
.annotate 'line', 1309
# name: $S2
    null $S2
.annotate 'line', 1310
# var sym: $P2
    null $P2
# switch-case
.annotate 'line', 1312
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1328
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1313
    $P7 = $P1.'getName'()
    set $S2, $P7
.annotate 'line', 1314
# id: $S3
    $P8 = $P1.'checkIdentifier'()
    null $S3
    if_null $P8, __label_9
    set $S3, $P8
  __label_9:
.annotate 'line', 1315
# var desc: $P3
    $P3 = $P1.'checkVar'()
.annotate 'line', 1316
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
.annotate 'line', 1318
    $P1.'emit'(__ARG_1, __ARG_4)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 1321
    root_new $P7, ['parrot';'ResizablePMCArray']
    box $P8, $S2
    push $P7, $P8
    $P2 = $P1.'scopesearch'($P7, 0)
.annotate 'line', 1322
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
# {
.annotate 'line', 1323
# var path: $P4
    getattribute $P7, $P2, 'owner'
    $P4 = $P7.'getpath'()
.annotate 'line', 1324
    $P7 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_14: # endif
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1331
    new $P5, ['ResizableStringArray']
.annotate 'line', 1332
    $P1.'buildkey'($P5)
.annotate 'line', 1333
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1334
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_17
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_17:
    unless $I1 goto __label_16
# {
.annotate 'line', 1335
# var path: $P6
    getattribute $P7, $P2, 'owner'
    $P6 = $P7.'getpath'()
.annotate 'line', 1336
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1337
    $P7 = WSubId_22($P6)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_16: # endif
.annotate 'line', 1339
    $P7 = $P5.'pop'()
    set $S2, $P7
.annotate 'line', 1340
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1341
    $P8 = WSubId_22($P5)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P8)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1344
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1345
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 1349
# reg: $S4
    $P7 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_18
    set $S4, $P7
  __label_18:
.annotate 'line', 1350
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1351
    ne $S4, 'null', __label_19
.annotate 'line', 1352
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_20
  __label_19: # else
.annotate 'line', 1354
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_20: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 1356

.end # Predef_varcast


.sub 'Predef_say' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1360
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1361
# n: $I1
# predefined elements
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1362
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1363
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1364
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1363
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1365
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1368
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1369

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1373
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1374
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1375
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1376
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1377
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1378

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1382
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1383
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1384
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1385

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1391
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1392
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1393
    WSubId_1("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1394
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1395

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1399
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1400
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1401
# predefined length
    length $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1402

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1406
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1407
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1408
# predefined bytelength
    bytelength $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1409

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1413
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1414
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1415
# predefined ord
    ord $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1416

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1420
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1421
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1422
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1423
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1424
# predefined ord
    ord $I2, $S1, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1425

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1429
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1431
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1432
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1434
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1435
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1436

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1440
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1441
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1442
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1443
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1445
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1446
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1447

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1451
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1452
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1453
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1454
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1455
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1456
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1458
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1459
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1460

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1464
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1465
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1466
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1467
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1468
# predefined indexof
    index $I1, $S1, $S2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1469

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1473
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1474
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1475
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1476
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1477
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1478
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1479
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1480

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_116')
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
# Body
# {
.annotate 'line', 1484
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1485
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('I')
    set $P3, $P4
    $P2.'PredefFunction'('int', $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1484
    __ARG_1.'add'($P1)
.annotate 'line', 1488
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1489
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('N')
    set $P3, $P4
    $P2.'PredefFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1488
    __ARG_1.'add'($P1)
.annotate 'line', 1492
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1493
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('S')
    set $P3, $P4
    $P2.'PredefFunction'('string', $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1492
    __ARG_1.'add'($P1)
.annotate 'line', 1496
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1497
    $P2.'PredefFunction'('var', WSubId_23, 'P', '!')
    set $P1, $P2
.annotate 'line', 1496
    __ARG_1.'add'($P1)
.annotate 'line', 1500
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1504
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1508
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1512
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1516
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1520
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1524
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1528
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1532
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1539
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1546
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1553
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1561
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1570
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1580
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1584
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1585
    $P2.'PredefFunctionEval'('length', WSubId_24, 'length %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1584
    __ARG_1.'add'($P1)
.annotate 'line', 1589
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1590
    $P2.'PredefFunctionEval'('bytelength', WSubId_25, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1589
    __ARG_1.'add'($P1)
.annotate 'line', 1594
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1595
    $P2.'PredefFunctionEval'('chr', WSubId_26, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
.annotate 'line', 1594
    __ARG_1.'add'($P1)
.annotate 'line', 1603
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1604
    $P2.'PredefFunctionEval'('ord', WSubId_27, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1603
    __ARG_1.'add'($P1)
.annotate 'line', 1608
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1609
    $P2.'PredefFunctionEval'('ord', WSubId_28, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1608
    __ARG_1.'add'($P1)
.annotate 'line', 1613
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1614
    $P2.'PredefFunctionEval'('substr', WSubId_29, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1613
    __ARG_1.'add'($P1)
.annotate 'line', 1618
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1619
    $P2.'PredefFunctionEval'('substr', WSubId_30, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
.annotate 'line', 1618
    __ARG_1.'add'($P1)
.annotate 'line', 1623
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1627
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1628
    $P2.'PredefFunctionEval'('indexof', WSubId_31, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1627
    __ARG_1.'add'($P1)
.annotate 'line', 1632
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1633
    $P2.'PredefFunctionEval'('indexof', WSubId_32, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1632
    __ARG_1.'add'($P1)
.annotate 'line', 1637
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1641
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('escape', 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1645
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1653
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1661
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1668
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1675
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1679
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1683
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1687
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1691
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1698
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1705
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1709
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1713
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1717
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1721
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1725
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1729
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1733
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1737
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1741
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1745
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1749
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1753
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1757
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1770
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1774
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1778
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1782
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1786
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1790
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1794
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1798
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1802
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1806
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1810
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1817
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1824
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1828
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1832
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1836
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1840
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1844
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1845
    $P2.'PredefFunction'('print', WSubId_33, 'v', '*')
    set $P1, $P2
.annotate 'line', 1844
    __ARG_1.'add'($P1)
.annotate 'line', 1848
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1849
    $P2.'PredefFunction'('say', WSubId_34, 'v', '*')
    set $P1, $P2
.annotate 'line', 1848
    __ARG_1.'add'($P1)
.annotate 'line', 1852
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1853
    $P2.'PredefFunction'('cry', WSubId_35, 'v', '*')
    set $P1, $P2
.annotate 'line', 1852
    __ARG_1.'add'($P1)
.annotate 'line', 1856
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1857
    $P2.'PredefFunction'('invoke', WSubId_36, 'P', '!')
    set $P1, $P2
.annotate 'line', 1856
    __ARG_1.'add'($P1)
# }
.annotate 'line', 1860

.end # getpredefs


.sub 'optimize_array' :subid('WSubId_39')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1868
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1869
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1870
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1871
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1870
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1873

.end # optimize_array


.sub 'emit_array' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1877
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 1878
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1879

.end # emit_array


.sub 'parseDotted' :subid('WSubId_56')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1883
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1884
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1885
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1886
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1887
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1888
    $P2 = __ARG_1.'get'()
.annotate 'line', 1889
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1892
    __ARG_1.'unget'($P2)
.annotate 'line', 1893
    .return($P1)
# }
.annotate 'line', 1894

.end # parseDotted


.sub 'parseList' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1902
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1903
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1904
# {
.annotate 'line', 1905
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1906
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1907
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1908
    unless_null __ARG_4, __label_4
.annotate 'line', 1909
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1911
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1912
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1913
    .return($P1)
# }
.annotate 'line', 1914

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1919
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1920
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1921
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1922
    .return($P1)
# }
.annotate 'line', 1923

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_57')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1927
    new $P1, ['ResizableStringArray']
.annotate 'line', 1928
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1929
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1930
    .return($P1)
# }
.annotate 'line', 1931

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1944
    setattribute self, 'start', __ARG_1
.annotate 'line', 1945
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1946

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1949
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1950
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1952
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 1953

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 1956
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1957
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1959
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 1960

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 1963
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1964
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1966
    .return("")
  __label_2: # endif
# }
.annotate 'line', 1967

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1970
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1971

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1974
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1975

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1978
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1979

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1982
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 1983

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1986
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1987

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1990
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1991

.end # scopesearch


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1994
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1995

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1939
    addattribute $P0, 'start'
.annotate 'line', 1940
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2010
    $P2 = WSubId_37(__ARG_1, __ARG_2, WSubId_38, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 2011

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2015
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 2016

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 2019
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2020
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 2021

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 2025
    getattribute $P1, self, 'args'
    WSubId_39($P1)
# }
.annotate 'line', 2026

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2029
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2030
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2031
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2032
    .return($P1)
# }
.annotate 'line', 2033

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2036
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 2037

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2006
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 2049
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2052
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2053
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 2054
    .return($I1)
# }
.annotate 'line', 2055

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2058
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2059
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2060
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2061
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 2062

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2065
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2066
    if_null __ARG_2, __label_1
.annotate 'line', 2067
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 2068

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2071
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2072
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2073
    .return(self)
# }
.annotate 'line', 2074

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2046
    addattribute $P0, 'name'
.annotate 'line', 2047
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2079
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2080
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2081
    $P1 = __ARG_1.'get'()
.annotate 'line', 2082
# var args: $P2
    null $P2
.annotate 'line', 2083
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2084
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2086
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2087
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2088

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 2097
    $P2 = WSubId_37(__ARG_1, __ARG_2, WSubId_40, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2098

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 2101
    getattribute $P1, self, 'list'
    WSubId_39($P1)
# }
.annotate 'line', 2102

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2103
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2106
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2107
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2108
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2110
    .return($P2)
# }
.annotate 'line', 2111

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2093
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_22')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2120
# r: $S1
    null $S1
.annotate 'line', 2121
# predefined elements
    elements $I1, __ARG_1
    le $I1, 0, __label_1
.annotate 'line', 2122
# predefined string
# predefined join
    join $S2, "'; '", __ARG_1
    concat $S1, "[ '", $S2
    concat $S1, $S1, "' ]"
  __label_1: # endif
.annotate 'line', 2123
    .return($S1)
# }
.annotate 'line', 2124

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2128
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2130
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2132
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2134
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2131
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2133
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2135
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2137
    __ARG_2.'unget'($P1)
.annotate 'line', 2138
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2140

.end # parseUsing


.sub 'parseSig' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2144
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2145
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2146
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2147
    WSubId_41("'='", $P2)
  __label_1: # endif
.annotate 'line', 2148
# var expr: $P3
    $P3 = WSubId_38(__ARG_2, __ARG_3)
.annotate 'line', 2149
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2150

.end # parseSig


.sub 'parseStatement' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
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
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 2154
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2155
# var t2: $P2
    null $P2
.annotate 'line', 2156
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2157
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2158
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2159
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2160
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2161
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2162
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 2163
# var open: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2164
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2165
    WSubId_42("':'", $P1)
  __label_5: # endif
.annotate 'line', 2166
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2169
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
.annotate 'line', 2171
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2173
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2176
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2179
    $P2 = __ARG_1.'get'()
.annotate 'line', 2180
    __ARG_1.'unget'($P2)
.annotate 'line', 2181
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2182
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2185
    $P2 = __ARG_1.'get'()
.annotate 'line', 2186
    __ARG_1.'unget'($P2)
.annotate 'line', 2187
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2188
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2191
    $P2 = __ARG_1.'get'()
.annotate 'line', 2192
    __ARG_1.'unget'($P2)
.annotate 'line', 2193
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2194
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2197
    $P2 = __ARG_1.'get'()
.annotate 'line', 2198
    __ARG_1.'unget'($P2)
.annotate 'line', 2199
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2200
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2203
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2205
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2207
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2209
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2211
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2213
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2215
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2217
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2219
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2221
    .tailcall WSubId_52($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2223
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2225
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2228
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
# {
.annotate 'line', 2229
# var t2: $P4
    $P4 = __ARG_1.'get'()
.annotate 'line', 2230
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2231
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2232
    __ARG_1.'unget'($P4)
# }
  __label_31: # endif
.annotate 'line', 2234
    __ARG_1.'unget'($P1)
.annotate 'line', 2235
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 2236

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2246
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2247

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2248
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2251
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2252

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2255
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2256

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2259
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2260

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2263
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2264

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2267
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2268

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2271
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2272

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2275
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2276

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2279
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2280

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2283
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2284

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2287
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2288

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2291
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2292

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2295
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2296

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2299
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2300

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2307
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2308

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2311
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2312

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2315
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2316

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2319
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2321
    .return(self)
# }
.annotate 'line', 2322

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2242
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2327
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2330
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2331

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2332
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2325
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2345
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2346
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2347
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2348
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2349
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2350
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2351
    null $I2
  __label_4: # endif
.annotate 'line', 2352
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2348
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2354
    unless $I2 goto __label_6
.annotate 'line', 2355
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2357
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2358

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2341
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2365
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2366
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2367

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2368
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2371
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2372
    .return(self)
# }
.annotate 'line', 2373

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2376
    getattribute $P1, self, 'statements'
    WSubId_53(__ARG_1, $P1)
# }
.annotate 'line', 2377

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2361
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2382
    unless_null __ARG_1, __label_1
.annotate 'line', 2383
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2384
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2385
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2387
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2388

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2396
# var arg: $P1
    null $P1
.annotate 'line', 2397
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2398
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2399
    $P2 = __ARG_1.'get'()
.annotate 'line', 2400
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2401
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2404
    __ARG_1.'unget'($P2)
.annotate 'line', 2405
    $P1 = WSubId_38(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2407
    .return($P1)
# }
.annotate 'line', 2408

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 2417
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2418
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2419
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2420
    unless $I1 goto __label_1
.annotate 'line', 2421
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2422
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2423
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2424
    $P1 = __ARG_2.'get'()
.annotate 'line', 2425
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2426
    __ARG_2.'unget'($P1)
.annotate 'line', 2427
    $P3 = WSubId_37(__ARG_2, __ARG_3, WSubId_54, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2429
    WSubId_55(';', __ARG_2)
# }
.annotate 'line', 2430

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 2433
    getattribute $P1, self, 'args'
    WSubId_39($P1)
.annotate 'line', 2434
    .return(self)
# }
.annotate 'line', 2435

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2438
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2439
    self.'annotate'(__ARG_1)
.annotate 'line', 2440
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2441
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2442
    __ARG_1.'print'('    ')
.annotate 'line', 2443
    unless_null $P1, __label_2
.annotate 'line', 2444
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2446
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2447
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2448
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2449
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2451

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2410
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2412
    addattribute $P0, 'opname'
.annotate 'line', 2413
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2463
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2464
# var path: $P1
    $P1 = WSubId_56(__ARG_2)
.annotate 'line', 2465
# predefined elements
    elements $I1, $P1
    if $I1, __label_1
.annotate 'line', 2466
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2467
    WSubId_55(';', __ARG_2)
.annotate 'line', 2468
    $P3 = WSubId_57($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2469
    .return(self)
# }
.annotate 'line', 2470

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2471
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2474
    self.'annotate'(__ARG_1)
.annotate 'line', 2475
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2476

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2458
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2460
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2488
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2489
# var names: $P1
    null $P3
    $P1 = WSubId_37(__ARG_2, $P3, WSubId_58, ';')
.annotate 'line', 2490
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2491
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2492
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2494
    setattribute self, 'names', $P1
# }
.annotate 'line', 2495

.end # StaticStatement


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
# Body
# {
.annotate 'line', 2502
    self.'annotate'(__ARG_1)
.annotate 'line', 2503
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2504
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2505
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2507

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2483
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2485
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 2521
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2522
# var path: $P1
    $P1 = WSubId_56(__ARG_2)
.annotate 'line', 2523
# predefined elements
    elements $I1, $P1
    if $I1, __label_1
.annotate 'line', 2524
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2525
    WSubId_55(';', __ARG_2)
.annotate 'line', 2526
    setattribute self, 'path', $P1
# }
.annotate 'line', 2527

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2530
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2531
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2533
# var symbol: $P3
    $P3 = self.'scopesearch'($P1, 0)
# switch-case
.annotate 'line', 2535
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2549
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2536
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2537
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2538
    $P4.'pop'()
.annotate 'line', 2539
# var ns: $P5
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2540
    if_null $P5, __label_6
# {
.annotate 'line', 2541
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2542
    if_null $P3, __label_7
# {
.annotate 'line', 2543
    self.'createvarused'($P2, $P3)
.annotate 'line', 2544
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
.annotate 'line', 2550
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2551
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2552
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2553
    self.'usesubid'($S1)
.annotate 'line', 2554
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2556
    self.'createvar'($P2, 'P')
.annotate 'line', 2557
    .return(self)
# }
.annotate 'line', 2558

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 2561
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2562
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2563
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2564
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2565
    self.'annotate'(__ARG_1)
.annotate 'line', 2566
# key: $S2
    null $S2
.annotate 'line', 2567
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2568
    $P1.'pop'()
.annotate 'line', 2569
    $P3 = WSubId_22($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2571
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2573

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2514
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2516
    addattribute $P0, 'path'
.annotate 'line', 2517
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2583
# var nskey: $P1
    $P1 = WSubId_56(__ARG_2)
.annotate 'line', 2584
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2585
    ge $I1, 1, __label_1
.annotate 'line', 2586
    WSubId_41('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2587
# var nssym: $P2
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2588
    unless_null $P2, __label_2
.annotate 'line', 2589
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2590
    __ARG_3.'usenamespace'($P2)
# }
.annotate 'line', 2591

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 2597
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2598
    WSubId_59(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2599
    WSubId_55(';', __ARG_2)
# }
.annotate 'line', 2600

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2603
    .return(self)
# }
.annotate 'line', 2604

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2593
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 2619
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2620
    $P2 = WSubId_38(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2621
    WSubId_55(';', __ARG_2)
# }
.annotate 'line', 2622

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2625
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2626
    .return(self)
# }
.annotate 'line', 2627

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2630
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2631

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2614
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2616
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
.annotate 'line', 2648
    setattribute self, 'type', __ARG_1
.annotate 'line', 2649
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2650
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2651
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2652

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2655
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2656

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2657
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2658
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2659
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2660
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2661
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2662
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2663
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags


.sub 'issubid' :method
# Body
# {
.annotate 'line', 2666
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 2667
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
.annotate 'line', 2668

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2640
    addattribute $P0, 'type'
.annotate 'line', 2641
    addattribute $P0, 'reg'
.annotate 'line', 2642
    addattribute $P0, 'scope'
.annotate 'line', 2643
    addattribute $P0, 'flags'
.annotate 'line', 2644
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2676
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2677

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2680
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2681

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2673
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
.annotate 'line', 2690
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2691

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2692
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2695
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2696
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2697
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2698

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2684
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2686
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2709
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2710

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2713
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2714
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2715
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2716
    if_null $P2, __label_2
.annotate 'line', 2717
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2718
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2719
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2720
    $P1[$S1] = $P3
.annotate 'line', 2721
    .return($P3)
# }
.annotate 'line', 2722

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2725
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2726
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2727
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2728
    if_null $P2, __label_2
.annotate 'line', 2729
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2730
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2731

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2734
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2735
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2736
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2737
    if_null $P2, __label_2
.annotate 'line', 2738
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2739
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2740

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2743
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2744
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2745
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2746
    if_null $P2, __label_2
.annotate 'line', 2747
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2748
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2749
    $P1[$S1] = $P3
.annotate 'line', 2750
    .return($P3)
# }
.annotate 'line', 2751

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2754
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2755
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2756

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2759
# var sym: $P1
    null $P1
.annotate 'line', 2760
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2761
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2762
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2764
    .return($P3)
# }
.annotate 'line', 2765

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2768
# var sym: $P1
    null $P1
.annotate 'line', 2769
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2770
    .return($P1)
  __label_1: # endif
.annotate 'line', 2771
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2772
    .return($P1)
  __label_2: # endif
.annotate 'line', 2773
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2774
    if_null $P2, __label_3
.annotate 'line', 2775
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2776
    .return($P3)
# }
.annotate 'line', 2777

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2780
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2781
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2782
    .return($S1)
# }
.annotate 'line', 2783

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2786
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2788
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2789
    .return('__WLEX_self')
# }
.annotate 'line', 2790

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2704
    addattribute $P0, 'locals'
.annotate 'line', 2705
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2799
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
.annotate 'line', 2811
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2812

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2813
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2814
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2815
    .return(0)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
.annotate 'line', 2816
    .return(0)
# }

.end # isintegerzero


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2817
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2818
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2819
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2820
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2821
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2822
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2825
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2826

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2830
    .return(self)
# }
.annotate 'line', 2831

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2832
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2835
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2836
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2837
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2838
    .return($S2)
# }
.annotate 'line', 2839

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2842
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 2843
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 2844
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 2845

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2848
# reg: $S1
    null $S1
.annotate 'line', 2849
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2850
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2852
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2853
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2855
    .return($S1)
# }
.annotate 'line', 2856

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 2859
    WSubId_60(self)
# }
.annotate 'line', 2860

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2807
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2865
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2863
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2875
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2876
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2877
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2878
    WSubId_41('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2879
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2880

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2881
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2884
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2885
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2886
    .return(self)
# }
.annotate 'line', 2887

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2890
    self.'annotate'(__ARG_1)
.annotate 'line', 2891
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2892
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2893
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2894
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2895
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2897
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2899

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2870
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2872
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
.annotate 'line', 2914
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2915
    .return(self)
# }
.annotate 'line', 2916

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2919
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2920

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2923
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2924
    .return(self)
# }
.annotate 'line', 2925

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2928
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2929
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2930
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2932
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2933
    if $I1, __label_5
.annotate 'line', 2934
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2936
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2939
    .return(0)
# }
.annotate 'line', 2940

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2943
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2945
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2946
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2947
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2949
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2950
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
.annotate 'line', 2953
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2956
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2959
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2962

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2965
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2967
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2968
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2969
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2971
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2972
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
.annotate 'line', 2975
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2978
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2981
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2984

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2911
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2991
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2992
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2989
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3002
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3003
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 3004

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 3005
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3006
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 3009
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3010
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3011
    .return($S1)
# }
.annotate 'line', 3012

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 3015
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3016
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3017
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3018
# predefined unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3019
    .return($S1)
# }
.annotate 'line', 3020

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3023
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 3024
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 3025

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3028
    .tailcall self.'getPirString'()
# }
.annotate 'line', 3029

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2997
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2999
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3040
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3041
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3042
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 3043
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 3044

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 3045
    .return(1)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
# predefined int
.annotate 'line', 3048
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
# }
.annotate 'line', 3049

.end # isintegerzero


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3050
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 3053
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 3054

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3057
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3058
    .return($N1)
# }
.annotate 'line', 3059

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3062
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 3063
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3064
    if $I1, __label_2
.annotate 'line', 3065
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3067
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3069

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3072
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 3073

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3034
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3036
    addattribute $P0, 'pos'
.annotate 'line', 3037
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3083
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3084
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 3085

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 3086
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3087
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3090
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3091
    .return($N1)
# }
.annotate 'line', 3092

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3095
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3096
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3097
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3099

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 3102
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3103
    .tailcall WSubId_61($N1)
# }
.annotate 'line', 3104

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3078
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3080
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3113
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3116
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3117
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3118

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3121
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3122
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3123
    .return(0)
  __label_1: # endif
.annotate 'line', 3124
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3125

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3128
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3129
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3130
    if_null $P2, __label_1
.annotate 'line', 3131
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3133
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3136
    .return('P')
  __label_4: # default
.annotate 'line', 3138
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3141

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3144
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3145
    .return($S1)
# }
.annotate 'line', 3146

.end # getName


.sub 'checkVar' :method
# Body
# {
.annotate 'line', 3149
    getattribute $P1, self, 'owner'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
# }
.annotate 'line', 3150

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3153
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3154
    unless_null $P1, __label_1
.annotate 'line', 3155
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3156
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3157
# s: $S1
    null $S1
.annotate 'line', 3158
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3159
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3162
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3164
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3168
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3169
    .return($S1)
# }
.annotate 'line', 3170

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 3173
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3174
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3175
    getattribute $P2, self, 'name'
    WSubId_62($P2)
  __label_1: # endif
.annotate 'line', 3176
    .return($P1)
# }
.annotate 'line', 3177

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3180
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3181
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3182
    if_null $P2, __label_1
# {
.annotate 'line', 3183
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3184
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3185
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3186
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3187
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3188
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3195
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3196
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3197
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
.annotate 'line', 3201
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3202
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3203
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_11
# {
.annotate 'line', 3204
# id: $S1
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_12
    set $S1, $P6
  __label_12:
.annotate 'line', 3205
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3206
    self.'usesubid'($S1)
.annotate 'line', 3207
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3211
    .return(self)
# }
.annotate 'line', 3212

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3215
# id: $S1
    null $S1
.annotate 'line', 3216
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3217
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3219
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3220
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3221
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3222
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3223
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3224
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3225
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3226
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3230
    .return($S1)
# }
.annotate 'line', 3231

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3234
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3235
    self.'annotate'(__ARG_1)
.annotate 'line', 3236
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3237
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3239

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3242
    self.'annotate'(__ARG_1)
.annotate 'line', 3243
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3244

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3247
    self.'annotate'(__ARG_1)
.annotate 'line', 3248
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3249
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3250
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3251
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3252
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3253
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3256
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3259
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3262
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3263
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3265
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3266
    ne $S3, 'v', __label_13
.annotate 'line', 3267
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3268
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3269
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3272
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3273
    self.'annotate'(__ARG_1)
.annotate 'line', 3274
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3275
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3277
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3280
    .return($S2)
# }
.annotate 'line', 3281

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3109
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3111
    addattribute $P0, 'name'
.annotate 'line', 3112
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3291
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3292
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3293

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3296
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3297

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3300
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3301
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3302
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3303
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3304
    .return($S2)
# }
.annotate 'line', 3305

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3308
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3309
    self.'annotate'(__ARG_1)
.annotate 'line', 3310
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3311
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3313

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3316
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3317
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3318
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3320
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3323
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3321
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3324
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3327
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3328
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3329
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3331
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3332
    self.'annotate'(__ARG_1)
.annotate 'line', 3333
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3337
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3338

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3341
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3342

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3286
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3288
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3351
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3352

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3347
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 3362
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3363
    $P2 = WSubId_56(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3364
    getattribute $P1, self, 'key'
# predefined elements
    elements $I1, $P1
    ge $I1, 1, __label_1
.annotate 'line', 3365
    WSubId_41('namespace identifier', __ARG_3)
  __label_1: # endif
# }
.annotate 'line', 3366

.end # OpNamespaceExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3367
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
.annotate 'line', 3370
# var sym: $P1
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'key'
    $P1 = $P3.'scopesearch'($P4, 1)
.annotate 'line', 3371
    unless_null $P1, __label_1
.annotate 'line', 3372
    getattribute $P3, self, 'start'
    WSubId_1('unknown namespace', $P3)
  __label_1: # endif
.annotate 'line', 3373
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 3374
    $P3 = WSubId_22($P2)
    __ARG_1.'say'('    get_namespace ', __ARG_2, ', ', $P3)
# }
.annotate 'line', 3375

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3357
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3359
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 3386
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3387
    $P2 = WSubId_63(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3388

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3389
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3392
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3395
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3396
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3397
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3398
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3399
    __ARG_1.'say'()
# }
.annotate 'line', 3400

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3380
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3382
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3410
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3411
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3412

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3415
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3416

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3419
    self.'optimizearg'()
.annotate 'line', 3420
    .return(self)
# }
.annotate 'line', 3421

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3405
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3407
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
.annotate 'line', 3432
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3433
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3434
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3435

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3438
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3439
    .return(self)
# }
.annotate 'line', 3440

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3443
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3444

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3447
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3448
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3449

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3452
    self.'optimizearg'()
.annotate 'line', 3453
    .return(self)
# }
.annotate 'line', 3454

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3457
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3458

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3461
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3462

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3426
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3428
    addattribute $P0, 'lexpr'
.annotate 'line', 3429
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3471
    .return('I')
# }
.annotate 'line', 3472

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3475
    self.'optimizearg'()
.annotate 'line', 3476
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3477
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3478
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3479
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3480
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3481
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3483
    .return(self)
# }
.annotate 'line', 3484

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3467
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3493
    .return('I')
# }
.annotate 'line', 3494

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3489
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
.annotate 'line', 3502
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3503

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3506
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3507
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3508
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3509
    self.'annotate'(__ARG_1)
.annotate 'line', 3510
    __ARG_1.'print'('    delete ')
.annotate 'line', 3511
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3512
    __ARG_1.'say'()
.annotate 'line', 3513
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3514
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3517
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3518

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3498
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
.annotate 'line', 3525
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3526

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3529
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3530
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
.annotate 'line', 3531
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3532
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3533
    self.'annotate'(__ARG_1)
.annotate 'line', 3534
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3535
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3536
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3539
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3540

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3521
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
.annotate 'line', 3549
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3550

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3553
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3554

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3557
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3558
    .return(self)
# }
.annotate 'line', 3559

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 3562
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3563
    self.'optimizearg'()
.annotate 'line', 3564
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3565
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3566
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3569
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3570
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3571
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_64($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3574
    .return(self)
# }
.annotate 'line', 3575

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3578
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3579
    self.'annotate'(__ARG_1)
.annotate 'line', 3580
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3581

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3545
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
.annotate 'line', 3590
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3591

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3592
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3595
    .return('I')
# }
.annotate 'line', 3596

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3599
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3600
    .return(self)
# }
.annotate 'line', 3601

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3604
    self.'optimizearg'()
.annotate 'line', 3605
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3606
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3607
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3608
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3610
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3611
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3612
    .return(self)
# }
.annotate 'line', 3613

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3616
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3617

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3620
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3621
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3622
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3623
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3625
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3628
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3631
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3633

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3586
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3642
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3643

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3646
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3647
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3648
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3649

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3638
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3658
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3659
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3660
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3661

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3654
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
.annotate 'line', 3668
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3669

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3672
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3673
    self.'annotate'(__ARG_1)
.annotate 'line', 3674
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3675
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3676
    .return($S1)
# }
.annotate 'line', 3677

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3664
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
.annotate 'line', 3684
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3685

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3688
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3689
    self.'annotate'(__ARG_1)
.annotate 'line', 3690
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3691
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3692
    .return($S1)
# }
.annotate 'line', 3693

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3680
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
.annotate 'line', 3702
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3703

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3706
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3707
    self.'annotate'(__ARG_1)
.annotate 'line', 3708
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3709
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3710
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3711
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3712
    .return($S1)
# }
.annotate 'line', 3713

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3698
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
.annotate 'line', 3720
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3721

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3724
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3725
    self.'annotate'(__ARG_1)
.annotate 'line', 3726
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3727
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3728
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3729
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3730
    .return($S1)
# }
.annotate 'line', 3731

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3716
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
.annotate 'line', 3742
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3743
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3744
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3745
    .return(self)
# }
.annotate 'line', 3746

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3749
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3750

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3753
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3754
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3755
    .return(self)
# }
.annotate 'line', 3756

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3759
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3760

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 3763
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3764
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3765
    WSubId_60($P1)
  __label_1: # endif
# }
.annotate 'line', 3766

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3769
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3770
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3771
    self.'annotate'(__ARG_1)
.annotate 'line', 3772
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3774

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3736
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3738
    addattribute $P0, 'lexpr'
.annotate 'line', 3739
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3783
    self.'annotate'(__ARG_1)
.annotate 'line', 3784
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3785
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3786

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3779
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3795
    self.'annotate'(__ARG_1)
.annotate 'line', 3796
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3797
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3798
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3799

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3802
    self.'checkleft'()
.annotate 'line', 3803
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3804
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 3805
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 3806
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3807
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3808
    self.'annotate'(__ARG_1)
.annotate 'line', 3809
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3810
    .return($S1)
# }
.annotate 'line', 3811

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3791
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3820
    self.'checkleft'()
.annotate 'line', 3821
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3822
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3823
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3824
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3825
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3826
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3827
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3829
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3830
# aux: $S5
    null $S5
.annotate 'line', 3831
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3832
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3834
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3835
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3836
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3837
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3839
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3843
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3844
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3845
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3846
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3848
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3851
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3854
    .return($S3)
# }
.annotate 'line', 3855

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3816
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3864
    self.'checkleft'()
.annotate 'line', 3865
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3866
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3867
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3868
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3869
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3870
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3871
# aux: $S5
    null $S5
.annotate 'line', 3872
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3873
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3875
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3878
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3879
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3880
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3881
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3883
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3886
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3888
    .return($S3)
# }
.annotate 'line', 3889

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3860
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3898
    self.'checkleft'()
.annotate 'line', 3899
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3900
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3901
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3902
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3903
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3905
    ne $S2, 'I', __label_7
.annotate 'line', 3906
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3908
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3909
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3911
    self.'annotate'(__ARG_1)
.annotate 'line', 3912
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3915
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3916
    self.'annotate'(__ARG_1)
.annotate 'line', 3917
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3919
    .return($S3)
# }
.annotate 'line', 3920

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3894
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3929
    self.'checkleft'()
.annotate 'line', 3930
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3931
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3932
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3933
    self.'annotate'(__ARG_1)
.annotate 'line', 3934
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3935
    .return($S2)
# }
.annotate 'line', 3936

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3925
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3945
    self.'checkleft'()
.annotate 'line', 3946
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3947
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3948
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3949
    self.'annotate'(__ARG_1)
.annotate 'line', 3950
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3951
    .return($S2)
# }
.annotate 'line', 3952

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3941
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3959
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3962
    self.'optimizearg'()
.annotate 'line', 3963
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3964
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3965
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3966
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3967
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3968
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3970
    .return(self)
# }
.annotate 'line', 3971

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3974
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3975
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3976
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3977
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3978
    self.'annotate'(__ARG_1)
.annotate 'line', 3979
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3981
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3986
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3991
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3996
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4001
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4006
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3982
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3983
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3984
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3987
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3988
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3989
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3992
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3993
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3994
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3997
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3998
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3999
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4002
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4003
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4004
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4007
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4008
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4009
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4010
# switch
.annotate 'line', 4013
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4015
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4018
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 4021
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 4022
# }
.annotate 'line', 4024

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4027
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4028

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4031
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4032

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4035
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 4036

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3957
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
.annotate 'line', 4051
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4052
    setattribute self, 'expr', __ARG_2
.annotate 'line', 4053
    new $P2, [ 'Boolean' ], __ARG_3
    setattribute self, 'positive', $P2
# }
.annotate 'line', 4054

.end # CheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4055
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4056
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4059
# var positive: $P1
    getattribute $P1, self, 'positive'
.annotate 'line', 4060
# n: $I1
    isfalse $I1, $P1
.annotate 'line', 4061
    assign $P1, $I1
.annotate 'line', 4062
    .return(self)
# }
.annotate 'line', 4063

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4044
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4046
    addattribute $P0, 'expr'
.annotate 'line', 4047
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4070
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4071

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4074
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4075
    self.'annotate'(__ARG_1)
.annotate 'line', 4076
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4077
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4078
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 4079

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4082
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4083
    self.'annotate'(__ARG_1)
.annotate 'line', 4084
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
.annotate 'line', 4085

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4066
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
.annotate 'line', 4092
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4093

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4096
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4097
# reg: $S1
    null $S1
.annotate 'line', 4098
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    ne $S2, 'I', __label_1
.annotate 'line', 4099
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 4101
    $P4 = self.'tempreg'('I')
    set $S1, $P4
.annotate 'line', 4102
    $P1.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 4104
    self.'annotate'(__ARG_1)
.annotate 'line', 4105
    getattribute $P2, self, 'positive'
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 4106
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_4
  __label_3: # else
.annotate 'line', 4108
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_4: # endif
# }
.annotate 'line', 4109

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4112
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4113
# reg: $S1
    null $S1
.annotate 'line', 4114
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    ne $S2, 'I', __label_1
.annotate 'line', 4115
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 4117
    $P4 = self.'tempreg'('I')
    set $S1, $P4
.annotate 'line', 4118
    $P1.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 4120
    self.'annotate'(__ARG_1)
.annotate 'line', 4121
    getattribute $P2, self, 'positive'
    if_null $P2, __label_4
    unless $P2 goto __label_4
    set $S2, 'if '
    goto __label_3
  __label_4:
    set $S2, 'unless '
  __label_3:
    __ARG_1.'say'('    ', $S2, $S1, ', ', __ARG_2)
# }
.annotate 'line', 4122

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4088
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4129
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4132
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4133

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4136
    self.'optimizearg'()
.annotate 'line', 4137
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4138
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4139
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4140
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4141
    unless $I1 goto __label_1
# {
.annotate 'line', 4142
    unless $I2 goto __label_2
.annotate 'line', 4143
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4145
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    $P6.'NullCheckerExpr'(self, $P2, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4147
    unless $I2 goto __label_4
.annotate 'line', 4148
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    $P4.'NullCheckerExpr'(self, $P1, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4149
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4150
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4151
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_8
    $I5 = $P2.'isliteral'()
  __label_8:
    unless $I5 goto __label_7
# {
.annotate 'line', 4152
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4153
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4155
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4156
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4157
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I6, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I6)
  __label_13: # case
.annotate 'line', 4159
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 4160
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 4161
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
.annotate 'line', 4165
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_16
    unless $P3 goto __label_16
.annotate 'line', 4166
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    $P5.'ZeroCheckerExpr'(self, $P1, 1)
    set $P4, $P5
    .return($P4)
  __label_16: # endif
.annotate 'line', 4167
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_17
    unless $P3 goto __label_17
.annotate 'line', 4168
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    $P5.'ZeroCheckerExpr'(self, $P2, 1)
    set $P4, $P5
    .return($P4)
  __label_17: # endif
.annotate 'line', 4169
    .return(self)
# }
.annotate 'line', 4170

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4173
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4174

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4177
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4178

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4181
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4182

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4185
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4186

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4127
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4193
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4196
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4197

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4200
    self.'optimizearg'()
.annotate 'line', 4201
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4202
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4203
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4204
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4205
    unless $I1 goto __label_1
# {
.annotate 'line', 4206
    unless $I2 goto __label_2
.annotate 'line', 4207
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4209
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    $P6.'NullCheckerExpr'(self, $P2, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4211
    unless $I2 goto __label_4
.annotate 'line', 4212
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    $P4.'NullCheckerExpr'(self, $P1, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4213
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4214
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4215
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_8
    $I5 = $P2.'isliteral'()
  __label_8:
    unless $I5 goto __label_7
# {
.annotate 'line', 4216
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4217
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4219
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4220
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4221
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I6, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I6)
  __label_13: # case
.annotate 'line', 4223
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 4224
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 4225
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
.annotate 'line', 4229
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_16
    unless $P3 goto __label_16
.annotate 'line', 4230
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    $P5.'ZeroCheckerExpr'(self, $P1, 0)
    set $P4, $P5
    .return($P4)
  __label_16: # endif
.annotate 'line', 4231
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_17
    unless $P3 goto __label_17
.annotate 'line', 4232
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    $P5.'ZeroCheckerExpr'(self, $P2, 0)
    set $P4, $P5
    .return($P4)
  __label_17: # endif
.annotate 'line', 4233
    .return(self)
# }
.annotate 'line', 4234

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4237
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4238

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4241
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4242

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4245
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4246

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4249
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4250

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 4191
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
.annotate 'line', 4260
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 4261
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 4262

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4263
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4266
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4267
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
.annotate 'line', 4268

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4271
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
.annotate 'line', 4272

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4275
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4276
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4277
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
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
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4286
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4287
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4288

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4291
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4292
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4293
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4294

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4255
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 4257
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4301
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4304
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4305

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4308
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4309

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4312
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4313

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4316
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4317

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4320
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4321

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4299
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4328
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4331
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4332

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4335
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4336

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4339
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4340

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4343
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4344

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4347
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4348

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4326
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4355
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4358
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4359

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4362
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4363

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4366
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4367

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4370
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4371

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4374
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4375

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4353
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4382
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4385
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4386

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4389
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4390

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4393
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4394

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4397
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4398

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4401
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4402

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4380
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4411
    .return('I')
# }
.annotate 'line', 4412

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4407
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
.annotate 'line', 4421
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4422

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4425
    self.'optimizearg'()
.annotate 'line', 4426
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4427
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4428
    unless $I1, __label_2
.annotate 'line', 4429
    getattribute $P1, self, 'rexpr'
    .return($P1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4431
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    .tailcall WSubId_21($P2, $P3, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4433
    .return(self)
# }
.annotate 'line', 4434

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4437
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
.annotate 'line', 4438
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4439
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4440
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4441
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4444
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4445
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4446
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4447
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4448
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4450

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4417
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
.annotate 'line', 4459
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4460

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4463
    self.'optimizearg'()
.annotate 'line', 4464
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4465
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4466
    if $I1, __label_2
.annotate 'line', 4467
    getattribute $P1, self, 'rexpr'
    .return($P1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4469
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    .tailcall WSubId_21($P2, $P3, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4471
    .return(self)
# }
.annotate 'line', 4472

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4475
# res: $S1
    null $S1
.annotate 'line', 4476
    if_null __ARG_2, __label_1
.annotate 'line', 4477
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4479
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4480
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4481
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4482
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4483
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4486
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4487
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4488
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4489
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4490
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4492

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4455
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4497
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
.annotate 'line', 4507
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4508

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4511
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
.annotate 'line', 4512
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4513
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4514
    self.'annotate'(__ARG_1)
.annotate 'line', 4515
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4516

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4519
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4520

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4503
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
.annotate 'line', 4529
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4530

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4533
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
.annotate 'line', 4534
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4535
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4536
    self.'annotate'(__ARG_1)
.annotate 'line', 4537
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4538

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4541
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4542

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4525
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
.annotate 'line', 4551
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4552

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4555
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
.annotate 'line', 4556
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4557
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4558
    self.'annotate'(__ARG_1)
.annotate 'line', 4559
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4560

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4563
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4564

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4547
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
.annotate 'line', 4574
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4576
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4583
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4577
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4578
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4579
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4581
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4584
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4585
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4588
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4590

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4591
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4594
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4595
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4596
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4597
# i: $I2
    null $I2
# for loop
.annotate 'line', 4598
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4599
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4598
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4600
    .return($P2)
# }
.annotate 'line', 4601

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4604
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4605
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4606
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
.annotate 'line', 4607
    self.'annotate'(__ARG_1)
.annotate 'line', 4608
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4609
# i: $I2
    set $I2, 2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 4610
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_4: # for iteration
.annotate 'line', 4609
    inc $I2
    goto __label_6
  __label_5: # for end
# }
.annotate 'line', 4611

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4614
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4615
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4616
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4617
    self.'annotate'(__ARG_1)
.annotate 'line', 4618
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4619
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4620
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4619
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4621
    .return($S1)
# }
.annotate 'line', 4622

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4625
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4626
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4627
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4628
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4629
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4628
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4630

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4569
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4571
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4639
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4640

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4641
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4644
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4645
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4646
# rreg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4647
# rval: $S3
    null $S3
# switch
.annotate 'line', 4648
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'I'
    if $S4 == $S5 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 4650
    set $S3, $S2
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 4653
    $P3 = self.'tempreg'('I')
    set $S3, $P3
.annotate 'line', 4654
    __ARG_1.'emitset'($S3, $S2)
  __label_3: # switch end
.annotate 'line', 4656
    self.'annotate'(__ARG_1)
.annotate 'line', 4657
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S3)
# }
.annotate 'line', 4658

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4635
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
.annotate 'line', 4667
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4668

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 4671
    self.'optimizearg'()
.annotate 'line', 4672
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4673
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4674
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4675
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4676
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4677
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4682
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4683
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4684
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4686
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# predefined string
.annotate 'line', 4687
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
.annotate 'line', 4689
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P3, 'file'
    getattribute $P13, $P3, 'line'
# predefined string
.annotate 'line', 4690
    $P14 = $P3.'getasquoted'()
    set $S6, $P14
# predefined string
    $P15 = $P4.'getasquoted'()
    set $S7, $P15
    concat $S8, $S6, $S7
    $P11.'TokenQuoted'($P12, $P13, $S8)
    set $P5, $P11
  __label_7:
.annotate 'line', 4691
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4693
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4694
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4695
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4696
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4699
    $P6 = WSubId_65($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4700
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4701
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4702
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_64($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4706
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4707
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4709
    .return(self)
# }
.annotate 'line', 4710

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 4713
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4714
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4715
    ne $S1, $S2, __label_3
.annotate 'line', 4716
    .return($S1)
  __label_3: # endif
.annotate 'line', 4717
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4718
    .return('S')
  __label_4: # endif
.annotate 'line', 4719
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4720
    .return('S')
  __label_6: # endif
.annotate 'line', 4721
    $P1 = WSubId_65($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4722
    .return('N')
  __label_8: # endif
.annotate 'line', 4723
    .return('I')
# }
.annotate 'line', 4724

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4727
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4728
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4729
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4730
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4731
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4733
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4734
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4735
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4736
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4737
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4738
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4739
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4740
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4743
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4744
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4747
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4750
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4751
# l: $S7
    null $S7
.annotate 'line', 4752
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4754
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4755
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4757
# r: $S8
    null $S8
.annotate 'line', 4758
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4760
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4761
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4763
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4766
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4768

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4663
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
.annotate 'line', 4777
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4778

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4781
    self.'optimizearg'()
.annotate 'line', 4782
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4783
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4784
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4785
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4786
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4787
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4788
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4789
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4790
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4793
    .return(self)
# }
.annotate 'line', 4794

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4797
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4798
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4799
    ne $S1, $S2, __label_3
.annotate 'line', 4800
    .return($S1)
  __label_3: # endif
.annotate 'line', 4801
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4802
    .return('N')
  __label_4: # endif
.annotate 'line', 4803
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4804
    .return('N')
  __label_6: # endif
.annotate 'line', 4805
    .return('I')
# }
.annotate 'line', 4806

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4809
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4810
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4811
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4812

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4773
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
.annotate 'line', 4821
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4822

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 4825
    self.'optimizearg'()
.annotate 'line', 4826
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4827
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4828
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4829
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4830
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4831
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'I'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4832
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4833
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4834
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4837
    $P3 = WSubId_65($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4838
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 4839
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 4840
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_64($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4844
    ne $S1, 'S', __label_8
.annotate 'line', 4845
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 4846
    .return(self)
# }
.annotate 'line', 4847

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4850
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4851
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4852
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4853
    ne $S1, $S2, __label_3
.annotate 'line', 4854
    .return($S1)
  __label_3: # endif
.annotate 'line', 4855
    ne $S1, 'S', __label_4
.annotate 'line', 4856
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4858
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4859

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4862
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4863
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4864
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4865
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4866
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4867
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
.annotate 'line', 4868
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4869
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4870
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4871
    .return()
# }
  __label_3: # endif
.annotate 'line', 4876
    ne $S1, 'N', __label_7
# {
.annotate 'line', 4877
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4878
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4879
# rval: $S5
    null $S5
# switch
.annotate 'line', 4880
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 4882
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 4883
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4884
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 4887
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4890
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 4891
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 4893
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 4894
    self.'annotate'(__ARG_1)
.annotate 'line', 4895
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_12: # endif
.annotate 'line', 4897
    .return()
# }
  __label_7: # endif
.annotate 'line', 4900
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4901
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_15
    $I3 = $P1.'isidentifier'()
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 4902
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4903
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 4906
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4907
    set $S3, $I1
# }
  __label_14: # endif
.annotate 'line', 4909
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P2.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4910
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4911
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_17
  __label_16: # else
# {
# switch
.annotate 'line', 4914
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_21
    set $S7, 'N'
    if $S6 == $S7 goto __label_22
    set $S7, 'I'
    if $S6 == $S7 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4916
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4917
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4920
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_23: # case
  __label_20: # default
.annotate 'line', 4924
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4925
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
.annotate 'line', 4926
# }
  __label_17: # endif
.annotate 'line', 4929
    self.'annotate'(__ARG_1)
.annotate 'line', 4930
    set $S6, __ARG_2
    ne $S6, '', __label_24
.annotate 'line', 4931
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_24: # endif
.annotate 'line', 4932
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4933

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4817
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
.annotate 'line', 4942
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4943

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 4946
    self.'optimizearg'()
.annotate 'line', 4947
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4948
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4949
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4950
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4951
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4952
# var lval: $P3
    null $P3
.annotate 'line', 4953
# var rval: $P4
    null $P4
.annotate 'line', 4954
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4955
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 4956
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 4957
    unless $I2, __label_7
.annotate 'line', 4958
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
.annotate 'line', 4961
    $P5 = WSubId_65($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4962
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 4963
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 4964
    set $I3, $N2
    unless $I3, __label_9
.annotate 'line', 4965
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_64($P5, $P6, $N3)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4969
    .return(self)
# }
.annotate 'line', 4970

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4973
    .return('N')
# }
.annotate 'line', 4974

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4977
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4978
# var aux: $P2
    null $P2
.annotate 'line', 4979
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4980
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4981
    $P2 = self.'tempreg'('N')
.annotate 'line', 4982
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4983
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4985
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4986
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4987
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4988
    $P2 = self.'tempreg'('N')
.annotate 'line', 4989
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4990
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4992
    self.'annotate'(__ARG_1)
.annotate 'line', 4993
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4994

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4938
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
.annotate 'line', 5003
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5004

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5007
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5008
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5009
    self.'annotate'(__ARG_1)
.annotate 'line', 5010
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5011

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5014
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5015

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4999
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
.annotate 'line', 5024
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5025

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5028
    .return('I')
# }
.annotate 'line', 5029

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5032
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5033
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5034
    self.'annotate'(__ARG_1)
.annotate 'line', 5039
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5040

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5020
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
.annotate 'line', 5049
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5050

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5053
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
.annotate 'line', 5054
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5055
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5056
    self.'annotate'(__ARG_1)
.annotate 'line', 5057
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 5058

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5061
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5062

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5045
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
.annotate 'line', 5071
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5072

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5075
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
.annotate 'line', 5076
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5077
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5078
    self.'annotate'(__ARG_1)
.annotate 'line', 5079
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 5080

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5083
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5084

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5067
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5093
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5094

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5097
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 5098
# setname: $S1
    set $S1, ''
.annotate 'line', 5099
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 5100
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5102
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5105
    set $I2, 1
# switch
.annotate 'line', 5106
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
.annotate 'line', 5110
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5111
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5112
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5113
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5116
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 5121
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5124
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5127
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5122
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5125
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5128
    __ARG_1.'print'(' :named')
.annotate 'line', 5129
    eq $S1, '', __label_17
.annotate 'line', 5130
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5131
# }
.annotate 'line', 5133

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5089
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5142
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5143
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 5144

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5147
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5148
    .return(self)
# }
.annotate 'line', 5149

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 5152
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 5153

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5138
    addattribute $P0, 'arg'
.annotate 'line', 5139
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 5158
# var modifier: $P1
    null $P1
.annotate 'line', 5159
# var expr: $P2
    $P2 = WSubId_38(__ARG_1, __ARG_2)
.annotate 'line', 5160
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5161
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 5162
    $P3 = __ARG_1.'get'()
.annotate 'line', 5163
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 5164
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5167
    WSubId_41('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5170
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5171
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 5172

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5183
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5184
    setattribute self, 'start', __ARG_2
.annotate 'line', 5185
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5186
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5187
    __ARG_3.'unget'($P1)
.annotate 'line', 5188
    $P3 = WSubId_37(__ARG_3, __ARG_1, WSubId_66, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5190

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5193
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5194
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5195

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5198
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5199

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5202
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5203
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5204

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5207
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5208
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5209

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 5212
    getattribute $P1, self, 'args'
    WSubId_39($P1)
.annotate 'line', 5213
    .return(self)
# }
.annotate 'line', 5214

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5217
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5218
    unless_null $P1, __label_1
# {
.annotate 'line', 5219
    new $P2, ['ResizableStringArray']
.annotate 'line', 5220
# pnull: $S1
    set $S1, ''
.annotate 'line', 5221
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 5222
# var arg: $P4
    getattribute $P4, $P3, 'arg'
.annotate 'line', 5223
# reg: $S2
    null $S2
.annotate 'line', 5224
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5225
    ne $S1, '', __label_6
# {
.annotate 'line', 5226
    getattribute $P8, self, 'owner'
    $P7 = $P8.'tempreg'('P')
    set $S1, $P7
.annotate 'line', 5227
    __ARG_1.'emitnull'($S1)
# }
  __label_6: # endif
.annotate 'line', 5229
    set $S2, $S1
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5232
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
  __label_5: # endif
.annotate 'line', 5233
# predefined push
    push $P2, $S2
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5235
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5237
    .return($P1)
# }
.annotate 'line', 5238

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5241
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5242
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5244
# sep: $S1
    set $S1, ''
.annotate 'line', 5245
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5246
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5247
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5248
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5249
    if_null $P3, __label_4
.annotate 'line', 5250
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5251
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5246
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5253

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5176
    addattribute $P0, 'owner'
.annotate 'line', 5177
    addattribute $P0, 'start'
.annotate 'line', 5178
    addattribute $P0, 'args'
.annotate 'line', 5179
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_67')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5258
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5259
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5260
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5261
    .return(1)
# }
.annotate 'line', 5262

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5273
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5274
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5275
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5276

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5279
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5280

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5283
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5284
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5285
    new $P3, ['ResizableStringArray']
.annotate 'line', 5286
# var arg: $P4
    null $P4
.annotate 'line', 5287
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5288
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5290
    if_null $P2, __label_6
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5291
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5293
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5294
    ne $S1, '', __label_9
# {
.annotate 'line', 5295
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5296
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5298
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5300
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5304
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5305
    if_null $P2, __label_11
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5306
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5307
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 5308
    .return()
  __label_2: # default
.annotate 'line', 5310
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5311
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5312
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5313
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5314
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5315
# argr: $S5
    null $S5
.annotate 'line', 5316
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5317
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
.annotate 'line', 5321
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5322
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5325
    ne $S1, '', __label_24
# {
.annotate 'line', 5326
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5327
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5329
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5333
    iseq $I3, $S3, $S4
    if $I3 goto __label_28
    iseq $I3, $S4, '?'
  __label_28:
    if $I3 goto __label_27
.annotate 'line', 5334
    iseq $I3, $S4, 'p'
    unless $I3 goto __label_29
.annotate 'line', 5335
    iseq $I3, $S3, 'S'
    if $I3 goto __label_30
    iseq $I3, $S3, 'P'
  __label_30:
  __label_29:
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5336
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5338
# aux: $S6
    null $S6
.annotate 'line', 5339
    ne $S4, 'p', __label_31
.annotate 'line', 5340
    set $S4, 'P'
  __label_31: # endif
.annotate 'line', 5341
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5342
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
.annotate 'line', 5344
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
.annotate 'line', 5348
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5349
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_38 # break
  __label_39: # default
.annotate 'line', 5352
    $P4.'emit'(__ARG_1, $S5)
  __label_38: # switch end
    goto __label_32 # break
  __label_35: # case
  __label_36: # case
  __label_37: # case
.annotate 'line', 5358
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5359
    __ARG_1.'emitset'($S5, $S6)
    goto __label_32 # break
  __label_33: # default
.annotate 'line', 5362
    $P4.'emit'(__ARG_1, $S5)
  __label_32: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5366
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5311
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5369
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5370

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 5266
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5268
    addattribute $P0, 'predef'
.annotate 'line', 5269
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 5377
# callname: $S1
    $P6 = __ARG_3.'getname'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 5378
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5379
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_4.'numargs'()
  __label_2:
.annotate 'line', 5380
# var rawargs: $P1
    if $I1, __label_5
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
    goto __label_4
  __label_5:
    $P1 = __ARG_4.'getrawargs'()
  __label_4:
.annotate 'line', 5382
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5383
# nvariants: $I2
# predefined elements
    elements $I2, $P2
.annotate 'line', 5384
# var predef: $P3
    null $P3
.annotate 'line', 5385
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P4, $P8
# {
.annotate 'line', 5386
# pargs: $I3
    getattribute $P6, $P4, 'nparams'
    set $I3, $P6
.annotate 'line', 5387
    iseq $I4, $I3, $I1
    if $I4 goto __label_10
.annotate 'line', 5388
    iseq $I4, $I3, -1
  __label_10:
    if $I4 goto __label_9
.annotate 'line', 5389
    iseq $I4, $I3, -2
    unless $I4 goto __label_11
    iseq $I4, $I1, 1
  __label_11:
  __label_9:
    unless $I4 goto __label_8
.annotate 'line', 5390
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5392
    unless_null $P3, __label_12
.annotate 'line', 5393
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5396
    isa $I4, $P3, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I4 goto __label_13
# {
.annotate 'line', 5397
    $P6 = WSubId_67($P1)
    if_null $P6, __label_14
    unless $P6 goto __label_14
# {
.annotate 'line', 5398
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5399
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    .tailcall $P5($P6, $P7, $P1)
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5403
    new $P7, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    $P7.'CallPredefExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P6, $P7
    .return($P6)
# }
.annotate 'line', 5404

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5413
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5414
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5415
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5416
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5417
    __ARG_1.'unget'($P1)
.annotate 'line', 5418
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5420

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5421
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 5424
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5425
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5426
    if_null $P2, __label_1
.annotate 'line', 5427
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5429
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5433
# var sym: $P3
    null $P3
.annotate 'line', 5434
# var subid: $P4
    null $P4
.annotate 'line', 5435
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5436
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5437
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5438
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5439
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5440
    isnull $I1, $P6
    if $I1 goto __label_7
    set $S1, $P6
    iseq $I1, $S1, ''
  __label_7:
    unless $I1 goto __label_6
# {
.annotate 'line', 5441
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5442
    $P1.'buildkey'($P7)
.annotate 'line', 5443
    $P3 = self.'scopesearch'($P7, 0)
.annotate 'line', 5444
    if_null $P3, __label_8
# {
.annotate 'line', 5445
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_9
# {
.annotate 'line', 5446
    $P9 = $P3.'ismulti'()
    isfalse $I2, $P9
    unless $I2 goto __label_10
# {
.annotate 'line', 5447
    $P4 = $P3.'makesubid'()
.annotate 'line', 5448
    self.'usesubid'($P4)
# }
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 5451
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_11
.annotate 'line', 5452
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_68($P9, $P10, $P3, $P2)
  __label_11: # endif
# }
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 5456
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5458
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_12
.annotate 'line', 5459
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_12: # endif
.annotate 'line', 5462
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_13
    unless $P9 goto __label_13
# {
.annotate 'line', 5463
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_14
# {
.annotate 'line', 5464
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    $P13 = $P1.'getName'()
    push $P11, $P13
    $P8 = self.'scopesearch'($P11, 0)
.annotate 'line', 5465
    isnull $I1, $P8
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
.annotate 'line', 5466
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_68($P9, $P10, $P8, $P2)
  __label_15: # endif
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5470
    setattribute self, 'funref', $P1
.annotate 'line', 5471
    setattribute self, 'args', $P2
.annotate 'line', 5472
    .return(self)
# }
.annotate 'line', 5473

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5476
    .return(1)
# }
.annotate 'line', 5477

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5480
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5481
# call: $S1
    null $S1
.annotate 'line', 5483
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5484
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5485
    ne $S1, '', __label_4
# {
.annotate 'line', 5486
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P1.'getName'()
    push $P3, $P5
    $P2 = self.'scopesearch'($P3, 0)
# switch-case
.annotate 'line', 5488
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5491
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5494
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5489
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
.annotate 'line', 5492
    $P6 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5495
    WSubId_6("Builtin unexpeted here", self)
  __label_6: # default
.annotate 'line', 5497
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
.annotate 'line', 5502
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5503
    .return($S1)
# }
.annotate 'line', 5504

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5507
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5508
    if_null $P1, __label_1
.annotate 'line', 5509
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5510

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5513
    __ARG_1.'print'('(')
.annotate 'line', 5514
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5515
    if_null $P1, __label_1
.annotate 'line', 5516
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5517
    __ARG_1.'say'(')')
# }
.annotate 'line', 5518

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5521
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5522
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5524
    self.'annotate'(__ARG_1)
.annotate 'line', 5526
    __ARG_1.'print'('    ')
.annotate 'line', 5527
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5528
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5529
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5531
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5534
    __ARG_1.'print'($S1)
.annotate 'line', 5535
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5536

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5406
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5408
    addattribute $P0, 'funref'
.annotate 'line', 5409
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
.annotate 'line', 5550
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5551
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5552
    setattribute self, 'args', __ARG_3
.annotate 'line', 5553
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5554
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5555

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 5558
    getattribute $P6, self, 'sym'
    if_null $P6, __label_1
# {
.annotate 'line', 5559
    getattribute $P7, self, 'subid'
    if_null $P7, __label_2
.annotate 'line', 5560
    getattribute $P8, self, 'subid'
    .return($P8)
  __label_2: # endif
.annotate 'line', 5561
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5562
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5563
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5565
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5567
# var first: $P3
    getattribute $P3, $P2, 'left'
  __label_5: # while
.annotate 'line', 5568
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_4
.annotate 'line', 5569
    getattribute $P3, $P3, 'left'
    goto __label_5
  __label_4: # endwhile
.annotate 'line', 5570
    $P6 = $P3.'isidentifier'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 5571
# check: $S1
    $P7 = $P3.'checkIdentifier'()
    null $S1
    if_null $P7, __label_7
    set $S1, $P7
  __label_7:
.annotate 'line', 5572
    isnull $I1, $S1
    if $I1 goto __label_9
    iseq $I1, $S1, ''
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 5576
    new $P4, ['ResizableStringArray']
.annotate 'line', 5577
    $P2.'buildkey'($P4)
.annotate 'line', 5578
# fun: $S2
    $P6 = $P4.'pop'()
    null $S2
    if_null $P6, __label_10
    set $S2, $P6
  __label_10:
.annotate 'line', 5579
# var reg: $P5
    $P5 = self.'tempreg'('P')
.annotate 'line', 5580
    self.'annotate'(__ARG_1)
.annotate 'line', 5581
    $P6 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'($P5, $S2, $P6)
.annotate 'line', 5582
    .return($P5)
# }
  __label_8: # endif
# }
  __label_6: # endif
.annotate 'line', 5585
    root_new $P6, ['parrot';'ResizablePMCArray']
    $P8 = $P2.'emit_left_get'(__ARG_1)
    push $P6, $P8
    box $P7, ".'"
    push $P6, $P7
.annotate 'line', 5586
    $P9 = $P2.'get_member'()
.annotate 'line', 5585
    push $P6, $P9
    box $P7, "'"
    push $P6, $P7
# predefined join
    join $S3, "", $P6
    .return($S3)
# }
.annotate 'line', 5587

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5544
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5546
    addattribute $P0, 'sym'
.annotate 'line', 5547
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5597
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5598
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5599
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5600

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5603
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5604
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5605
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5606
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5607
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5610
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5611
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5612
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5613

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5593
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
.annotate 'line', 5623
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5624
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5625

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5628
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5629
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5630
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5631
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5632
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5633
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5634
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5636
    .return($S2)
# }
.annotate 'line', 5637

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5618
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5620
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
.annotate 'line', 5646
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5647
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5648

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5649
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5652
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5653
    .return(self)
# }
.annotate 'line', 5654

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5657
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5658
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5659
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5661
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5662
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5663

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5666
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5667

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5670
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5671
    self.'annotate'(__ARG_1)
.annotate 'line', 5672
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5673

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5676
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5677
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5678
    .return($S1)
# }
.annotate 'line', 5679

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5682
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5683
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5684
    self.'annotate'(__ARG_1)
.annotate 'line', 5685
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5686

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5689
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5690

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5693
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5694
# value: $S2
    null $S2
.annotate 'line', 5695
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5697
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5698
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5699
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5701
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5704
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5705
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5707
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5708

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5711
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5712
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5713
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5714
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5716
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5717
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5718
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5720
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5722
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5723
    .return($S2)
# }
.annotate 'line', 5724

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5640
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5642
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
.annotate 'line', 5735
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5736
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5737

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5738
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5741
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5742
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5743
    .return(self)
# }
.annotate 'line', 5744

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 5747
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5748
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5749
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5750
    WSubId_41("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5751
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5752
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5753
    self.'annotate'(__ARG_1)
.annotate 'line', 5754
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5755
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5756
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5757

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 5760
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5761
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5762
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5763
    WSubId_41("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5764
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5765
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5766
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5767
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5769
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5771
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5772
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5773
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5777
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5778
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5779
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5782
    self.'annotate'(__ARG_1)
.annotate 'line', 5783
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5784
    .return($S3)
# }
.annotate 'line', 5785

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5730
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5732
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
.annotate 'line', 5799
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5800
    setattribute self, 'left', __ARG_4
.annotate 'line', 5801
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5802

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5805
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5806
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5808
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5809

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5812
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5813
    setattribute self, 'left', $P1
.annotate 'line', 5814
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5815
    $P2.'optimizeargs'()
.annotate 'line', 5819
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5820
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5821
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5822
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5823
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5824
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5825
# predefined substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5826
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5829
    .return(self)
# }
.annotate 'line', 5830

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5833
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5834
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5835
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5836
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5837
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5838
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5836
    setattribute self, 'regleft', $P3
.annotate 'line', 5839
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5840

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5843
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5844
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5845
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5846
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5847
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5848
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5849
    __ARG_1.'print'(']')
# }
.annotate 'line', 5850

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5853
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5854
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5855
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5856
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5857
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5858
    eq $I1, 1, __label_4
.annotate 'line', 5859
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5860
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5861
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5862
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5865
    self.'annotate'(__ARG_1)
.annotate 'line', 5866
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5867
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5868
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5870

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5873
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5874
    self.'annotate'(__ARG_1)
.annotate 'line', 5875
    __ARG_1.'print'('    ')
.annotate 'line', 5876
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5877
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5878

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5881
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5882
# rreg: $S1
    null $S1
.annotate 'line', 5883
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5884
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5885
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5888
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5889
    self.'annotate'(__ARG_1)
.annotate 'line', 5890
    __ARG_1.'print'('    ')
.annotate 'line', 5891
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5892
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5893
    .return($S1)
# }
.annotate 'line', 5894

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5790
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5792
    addattribute $P0, 'left'
.annotate 'line', 5793
    addattribute $P0, 'regleft'
.annotate 'line', 5794
    addattribute $P0, 'args'
.annotate 'line', 5795
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5905
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5906
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5907
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5908
    __ARG_1.'unget'($P1)
.annotate 'line', 5909
    $P3 = WSubId_37(__ARG_1, __ARG_2, WSubId_38, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5911

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5912
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 5915
    getattribute $P1, self, 'values'
    WSubId_39($P1)
.annotate 'line', 5916
    .return(self)
# }
.annotate 'line', 5917

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5920
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5921
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5922
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5928
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5930

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5933
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5934
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5935
    .return($S1)
# }
.annotate 'line', 5936

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5939
    self.'annotate'(__ARG_1)
.annotate 'line', 5940
# itemreg: $S1
    null $S1
.annotate 'line', 5941
# it_p: $S2
    null $S2
.annotate 'line', 5942
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5943
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5944
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
  __label_1: # endif
.annotate 'line', 5946
    getattribute $P2, self, 'values'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
# {
# switch
.annotate 'line', 5947
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
.annotate 'line', 5949
# aux: $S3
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 5950
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5951
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5952
    set $S1, $S2
# }
  __label_10: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5956
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5957
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5958
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5959
    __ARG_1.'emitnull'($S1)
# }
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 5963
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_12: # endif
  __label_4: # switch end
.annotate 'line', 5965
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5966
    self.'annotate'(__ARG_1)
.annotate 'line', 5967
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_14: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 5970

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5899
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5901
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 5982
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5983
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5984
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5985
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5986
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5987
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5988
# {
.annotate 'line', 5989
# var key: $P4
    $P4 = WSubId_38(__ARG_1, __ARG_2)
.annotate 'line', 5990
    WSubId_55(':', __ARG_1)
.annotate 'line', 5991
# var value: $P5
    $P5 = WSubId_38(__ARG_1, __ARG_2)
.annotate 'line', 5992
# predefined push
    push $P2, $P4
.annotate 'line', 5993
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5995
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5996
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5997
    WSubId_41("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5999
    setattribute self, 'keys', $P2
.annotate 'line', 6000
    setattribute self, 'values', $P3
# }
.annotate 'line', 6001

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6002
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 6005
    getattribute $P1, self, 'keys'
    WSubId_39($P1)
.annotate 'line', 6006
    getattribute $P1, self, 'values'
    WSubId_39($P1)
.annotate 'line', 6007
    .return(self)
# }
.annotate 'line', 6008

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6011
    self.'annotate'(__ARG_1)
.annotate 'line', 6016
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 6017
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6019
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 6020
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 6021
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 6022
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 6023
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 6024
# item: $S1
    null $S1
.annotate 'line', 6025
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 6026
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 6027
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6028
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 6031
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6033
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 6034
# itemreg: $S3
    null $S3
.annotate 'line', 6035
# it_p: $S4
    null $S4
.annotate 'line', 6036
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 6037
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 6038
# aux: $S5
    null $S5
# switch
.annotate 'line', 6039
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
.annotate 'line', 6041
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 6042
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 6043
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 6044
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 6048
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 6049
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 6050
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 6051
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 6055
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 6057
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 6058
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 6022
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 6060

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6063
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6064
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6065
    .return($S1)
# }
.annotate 'line', 6066

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5975
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5977
    addattribute $P0, 'keys'
.annotate 'line', 5978
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6079
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6084
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 6085

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 6088
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6089
    if_null $P1, __label_1
.annotate 'line', 6090
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 6091

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6094
    self.'optimize_initializer'()
.annotate 'line', 6095
    .return(self)
# }
.annotate 'line', 6096

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6099
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6100
    if_null $P1, __label_1
.annotate 'line', 6101
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6102
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6103
    if_null $P1, __label_2
.annotate 'line', 6104
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6105
    __ARG_1.'say'(")")
# }
.annotate 'line', 6106

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6071
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6073
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
.annotate 'line', 6117
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6119
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 6120
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6121
    setattribute self, 'value', __ARG_4
.annotate 'line', 6122
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6124
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6125
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6127
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 6128

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6131
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 6132
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 6135
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 6136
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 6137
    $P1 = $P2.'getvalue'()
.annotate 'line', 6138
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 6139
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 6140
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 6143
    self.'optimize_initializer'()
.annotate 'line', 6144
    .return(self)
# }
.annotate 'line', 6145

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
.annotate 'line', 6148
    self.'annotate'(__ARG_1)
.annotate 'line', 6150
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6151
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 6154
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 6155
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
.annotate 'line', 6157
# reginit: $S1
    set $S1, ''
.annotate 'line', 6158
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 6159
# constructor: $S3
    null $S3
# switch
.annotate 'line', 6160
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
.annotate 'line', 6165
    ne $I2, 1, __label_13
# {
.annotate 'line', 6166
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 6167
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 6170
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6171
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 6172
    concat $S1, ', ', $S1
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 6176
    eq $I2, 1, __label_16
.annotate 'line', 6177
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 6178
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 6179
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 6182
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 6185
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 6186
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 6187
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 6188
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_69($S5, $P8)
  __label_23: # endif
.annotate 'line', 6192
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 6193
    le $I1, 1, __label_25
# {
.annotate 'line', 6194
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 6198
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 6199
    unless_null $P4, __label_26
# {
.annotate 'line', 6201
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 6202
    if_null $P5, __label_28
# {
.annotate 'line', 6203
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 6206
    root_new $P6, ['parrot';'ResizablePMCArray']
    getattribute $P8, self, 'value'
    push $P6, $P8
    $P4 = self.'scopesearch'($P6, 2)
.annotate 'line', 6207
    if_null $P4, __label_30
.annotate 'line', 6208
    $P6 = $P4.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
    goto __label_31
  __label_30: # else
# {
.annotate 'line', 6210
    $P7 = self.'dowarnings'()
    if_null $P7, __label_32
    unless $P7 goto __label_32
.annotate 'line', 6211
    WSubId_69('Checking: new unknown type')
  __label_32: # endif
.annotate 'line', 6212
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_31: # endif
# }
  __label_29: # endif
.annotate 'line', 6215
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 6219
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 6223
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 6225
    isgt $I3, $I1, 1
    if $I3 goto __label_34
    isge $I3, $I1, 0
    unless $I3 goto __label_35
    iseq $I3, $I2, 1
  __label_35:
  __label_34:
    unless $I3 goto __label_33
# {
.annotate 'line', 6226
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6227
    not $I3, __ARG_3
    unless $I3 goto __label_36
.annotate 'line', 6228
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_36: # endif
# }
  __label_33: # endif
# }
.annotate 'line', 6230

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6233
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6234

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6111
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6113
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6245
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6246
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6247
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6248
    setattribute self, 'nskey', $P1
.annotate 'line', 6249
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6250
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6251
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6253
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6254

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6257
# reginit: $S1
    null $S1
.annotate 'line', 6258
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6259
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 6260
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6264
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6265
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6268
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 6270
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 6271
    __ARG_1.'print'('    ')
.annotate 'line', 6272
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 6273
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6274
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6275
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 6276
    if_null $S1, __label_8
.annotate 'line', 6277
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6278
    __ARG_1.'say'()
# }
.annotate 'line', 6279

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6239
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6241
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6290
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6291
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6292
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6293
    setattribute self, 'nskey', $P1
.annotate 'line', 6294
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6295
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6296
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6298
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6299

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6302
# reginit: $S1
    null $S1
.annotate 'line', 6303
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6305
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 6306
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6307
    le $I1, 0, __label_4
.annotate 'line', 6308
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 6309
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6310
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 6311
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6312
    __ARG_1.'say'()
.annotate 'line', 6314
    lt $I1, 0, __label_5
# {
.annotate 'line', 6315
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6316
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6317
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 6319

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6284
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6286
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_70')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6326
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6329
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6333
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6336
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6331
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6332
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6331
    .return($P3)
  __label_4: # case
.annotate 'line', 6335
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6339
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6340
    __ARG_1.'unget'($P2)
.annotate 'line', 6341
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6343
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6348
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6350

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 6361
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6362
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6363
    $P2 = WSubId_63(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6364

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6367
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6368
    .return(self)
# }
.annotate 'line', 6369

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6370
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6373
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6374
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6375
    eq $S1, 'P', __label_2
.annotate 'line', 6376
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6377
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6379
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
.annotate 'line', 6380
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6381
    self.'annotate'(__ARG_1)
.annotate 'line', 6382
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6383
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6384
    __ARG_1.'say'()
# }
.annotate 'line', 6385

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6354
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6356
    addattribute $P0, 'lexpr'
.annotate 'line', 6357
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
.annotate 'line', 6402
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6403
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6404
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6405
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6406
    .return(self)
# }
.annotate 'line', 6407

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6410
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6411
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6413
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6415
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6417
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6418
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6419
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6421

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6424
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6425
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6426
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6428
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6429

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6432
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6433
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6434
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6435
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6436
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6437
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6438
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6440
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6441
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6442
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6443
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6444
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6445
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6447
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6448
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6449
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6450
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6453
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6455
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6456

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6390
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6396
    addattribute $P0, 'condition'
.annotate 'line', 6397
    addattribute $P0, 'etrue'
.annotate 'line', 6398
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
.annotate 'line', 6500
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
.annotate 'line', 6501
    .return(1)
  __label_4: # case
.annotate 'line', 6502
    .return(2)
  __label_5: # case
.annotate 'line', 6503
    .return(3)
  __label_2: # default
.annotate 'line', 6504
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6506

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_74')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6510
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
.annotate 'line', 6511
    .return(8)
  __label_4: # case
.annotate 'line', 6512
    .return(11)
  __label_5: # case
.annotate 'line', 6513
    .return(9)
  __label_6: # case
.annotate 'line', 6514
    .return(10)
  __label_2: # default
.annotate 'line', 6516
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6517
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6518
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6520

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_77')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6524
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
.annotate 'line', 6525
    .return(19)
  __label_4: # case
.annotate 'line', 6526
    .return(20)
  __label_5: # case
.annotate 'line', 6527
    .return(21)
  __label_6: # case
.annotate 'line', 6528
    .return(22)
  __label_2: # default
.annotate 'line', 6529
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6531

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6535
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6536
    .return(28)
  __label_4: # case
.annotate 'line', 6537
    .return(29)
  __label_2: # default
.annotate 'line', 6538
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6540

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6544
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
.annotate 'line', 6545
    .return(14)
  __label_4: # case
.annotate 'line', 6546
    .return(16)
  __label_5: # case
.annotate 'line', 6547
    .return(15)
  __label_6: # case
.annotate 'line', 6548
    .return(17)
  __label_2: # default
.annotate 'line', 6550
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6551
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6553

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_84')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6557
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
.annotate 'line', 6558
    .return(12)
  __label_4: # case
.annotate 'line', 6559
    .return(13)
  __label_5: # case
.annotate 'line', 6560
    .return(25)
  __label_6: # case
.annotate 'line', 6561
    .return(26)
  __label_2: # default
.annotate 'line', 6562
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6564

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_93')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6568
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
.annotate 'line', 6569
    .return(4)
  __label_4: # case
.annotate 'line', 6570
    .return(5)
  __label_5: # case
.annotate 'line', 6571
    .return(6)
  __label_6: # case
.annotate 'line', 6572
    .return(18)
  __label_7: # case
.annotate 'line', 6573
    .return(23)
  __label_8: # case
.annotate 'line', 6574
    .return(24)
  __label_9: # case
.annotate 'line', 6575
    .return(30)
  __label_2: # default
.annotate 'line', 6576
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6578

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 6582
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6583
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6586
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6590
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6592
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6594
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6596
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6598
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6600
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6602
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6604
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6606
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 6608
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 6587
    $P2 = WSubId_38(__ARG_1, __ARG_2)
.annotate 'line', 6588
    WSubId_55(')', __ARG_1)
.annotate 'line', 6589
    .return($P2)
  __label_4: # case
.annotate 'line', 6591
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6593
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6595
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6597
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6599
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6601
    .tailcall WSubId_70(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6603
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6605
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6607
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 6609
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 6611
    WSubId_41('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6613

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6617
# var subexp: $P1
    $P1 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6618
# var t: $P2
    null $P2
.annotate 'line', 6619
# var start: $P3
    null $P3
.annotate 'line', 6620
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6621
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_72($P2)
    set $I1, $P5
    unless $I1, __label_1
# {
# switch
.annotate 'line', 6622
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6624
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6627
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6630
    set $P3, $P2
.annotate 'line', 6631
    $P2 = __ARG_1.'get'()
.annotate 'line', 6632
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6633
# var right: $P4
    $P4 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6634
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6637
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6640
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6643
    __ARG_1.'unget'($P2)
.annotate 'line', 6644
    .return($P1)
# }
.annotate 'line', 6645

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
# Body
# {
.annotate 'line', 6649
# var subexp: $P1
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6650
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6652
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6654
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6653
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6655
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6657
    __ARG_1.'unget'($P2)
.annotate 'line', 6658
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6660

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
.annotate 'line', 6664
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6665
# code: $I1
    $P3 = WSubId_74($P1)
    set $I1, $P3
.annotate 'line', 6666
    unless $I1, __label_1
# {
.annotate 'line', 6667
# var subexpr: $P2
    $P2 = WSubId_75(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6668
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
.annotate 'line', 6670
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6672
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6674
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6676
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6678
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6680
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6682
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6686
    __ARG_1.'unget'($P1)
.annotate 'line', 6687
    .tailcall WSubId_76(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6689

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6693
# var lexpr: $P1
    $P1 = WSubId_75(__ARG_1, __ARG_2)
.annotate 'line', 6694
# var t: $P2
    null $P2
.annotate 'line', 6695
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6696
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_77($P2)
    set $I1, $P4
    unless $I1, __label_1
# {
.annotate 'line', 6697
# var rexpr: $P3
    $P3 = WSubId_75(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6698
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
.annotate 'line', 6700
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6703
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6706
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6709
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6712
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6715
    __ARG_1.'unget'($P2)
.annotate 'line', 6716
    .return($P1)
# }
.annotate 'line', 6717

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_78 = "WSubId_78"
# Body
# {
.annotate 'line', 6721
# var lexpr: $P1
    $P1 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6722
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6723
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6724
# var rexpr: $P3
    $P3 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6725
# var expr: $P4
    null $P4
.annotate 'line', 6726
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6727
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6729
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6730
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6732
    __ARG_1.'unget'($P2)
.annotate 'line', 6733
    .return($P1)
# }
.annotate 'line', 6734

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6738
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6739
# var rexpr: $P2
    null $P2
.annotate 'line', 6740
# var t: $P3
    null $P3
.annotate 'line', 6741
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6742
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_80($P3)
    set $I1, $P4
    unless $I1, __label_1
# {
# switch
.annotate 'line', 6743
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6745
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6746
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6749
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6750
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6753
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6756
    __ARG_1.'unget'($P3)
.annotate 'line', 6757
    .return($P1)
# }
.annotate 'line', 6758

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6762
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6763
# var rexpr: $P2
    null $P2
.annotate 'line', 6764
# var t: $P3
    null $P3
.annotate 'line', 6765
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6766
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    unless $I1, __label_1
# {
# switch
.annotate 'line', 6767
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
.annotate 'line', 6769
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6770
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6773
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6774
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6777
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6778
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6781
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6782
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6785
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6788
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6791
    __ARG_1.'unget'($P3)
.annotate 'line', 6792
    .return($P1)
# }
.annotate 'line', 6793

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6797
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6798
# var rexpr: $P2
    null $P2
.annotate 'line', 6799
# var t: $P3
    null $P3
.annotate 'line', 6800
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6801
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_84($P3)
    set $I1, $P4
    unless $I1, __label_1
# {
# switch
.annotate 'line', 6802
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
.annotate 'line', 6804
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6805
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6808
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6809
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6812
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6813
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6816
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6817
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6820
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6823
    __ARG_1.'unget'($P3)
.annotate 'line', 6824
    .return($P1)
# }
.annotate 'line', 6825

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
# Body
# {
.annotate 'line', 6829
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6830
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6831
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6832
# var rexpr: $P3
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6833
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6835
    __ARG_1.'unget'($P2)
.annotate 'line', 6836
    .return($P1)
# }
.annotate 'line', 6837

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6841
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6842
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6843
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6844
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6845
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6847
    __ARG_1.'unget'($P2)
.annotate 'line', 6848
    .return($P1)
# }
.annotate 'line', 6849

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
# Body
# {
.annotate 'line', 6853
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6854
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6855
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6856
# var rexpr: $P3
    $P3 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6857
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6859
    __ARG_1.'unget'($P2)
.annotate 'line', 6860
    .return($P1)
# }
.annotate 'line', 6861

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
# Body
# {
.annotate 'line', 6865
# var lexpr: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6866
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6867
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6868
# var rexpr: $P3
    $P3 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6869
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6871
    __ARG_1.'unget'($P2)
.annotate 'line', 6872
    .return($P1)
# }
.annotate 'line', 6873

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_88 = "WSubId_88"
# Body
# {
.annotate 'line', 6877
# var lexpr: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6878
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6879
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6880
# var rexpr: $P3
    $P3 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6881
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6883
    __ARG_1.'unget'($P2)
.annotate 'line', 6884
    .return($P1)
# }
.annotate 'line', 6885

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 6889
# var econd: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6890
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6891
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6892
# var etrue: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6893
    WSubId_55(':', __ARG_1)
.annotate 'line', 6894
# var efalse: $P4
    $P4 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6895
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6898
    __ARG_1.'unget'($P2)
.annotate 'line', 6899
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6901

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
.annotate 'line', 6905
# var lexpr: $P1
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 6906
# var t: $P2
    null $P2
.annotate 'line', 6907
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6908
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_93($P2)
    set $I1, $P5
    unless $I1, __label_1
# {
.annotate 'line', 6909
# var rexpr: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6910
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6911
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
.annotate 'line', 6913
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6916
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6919
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6922
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6925
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6928
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6931
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6934
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6936
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6937
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6939
    __ARG_1.'unget'($P2)
.annotate 'line', 6940
    .return($P1)
# }
.annotate 'line', 6941

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
# Body
# {
.annotate 'line', 6945
    .tailcall WSubId_91(__ARG_1, __ARG_2)
# }
.annotate 'line', 6946

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6961
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6962
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6963
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6964
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6965
    .return($S1)
# }
.annotate 'line', 6966

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6969
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6970
    unless_null $P1, __label_1
.annotate 'line', 6971
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6972
    .return($P1)
# }
.annotate 'line', 6973

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6957
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6982
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6983
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6984
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6985
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6986
    .return($S1)
# }
.annotate 'line', 6987

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6990
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6991
    unless_null $P1, __label_1
.annotate 'line', 6992
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6993
    .return($P1)
# }
.annotate 'line', 6994

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6976
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6978
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7010
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7011
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7012
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7013
    __ARG_2.'unget'($P1)
.annotate 'line', 7014
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 7016

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7019
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7020
    if_null $P1, __label_1
.annotate 'line', 7021
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7022
    .return(self)
# }
.annotate 'line', 7023

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7027
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7028
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7031
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 7032
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7033
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 7034
    self.'annotate'(__ARG_1)
.annotate 'line', 7035
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 7039
    le $I1, 0, __label_6
.annotate 'line', 7040
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 7042
    self.'annotate'(__ARG_1)
.annotate 'line', 7043
    self.'emitret'(__ARG_1)
.annotate 'line', 7044
    le $I1, 0, __label_7
.annotate 'line', 7045
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7046
    __ARG_1.'say'(')')
# }
.annotate 'line', 7047

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7004
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7006
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7054
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7055

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7058
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 7059

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7050
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
.annotate 'line', 7066
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7067

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7070
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 7071

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7062
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7084
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7085
    setattribute self, 'name', __ARG_1
.annotate 'line', 7086
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 7087

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7088
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7091
    self.'annotate'(__ARG_1)
.annotate 'line', 7092
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 7093

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7078
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7080
    addattribute $P0, 'name'
.annotate 'line', 7081
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7107
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7108
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 7109

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7110
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7113
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7114
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7115
    .return($S2)
# }
.annotate 'line', 7116

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7102
    addattribute $P0, 'owner'
.annotate 'line', 7103
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 7129
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7130
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7131
    WSubId_94($P1)
.annotate 'line', 7132
    setattribute self, 'label', $P1
.annotate 'line', 7133
    WSubId_55(';', __ARG_2)
# }
.annotate 'line', 7134

.end # GotoStatement


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
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7140
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7141
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 7142

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7123
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7125
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7153
    $P1 = WSubId_38(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 7154

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7157
    WSubId_55('(', __ARG_1)
.annotate 'line', 7158
    $P1 = WSubId_38(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7159
    WSubId_55(')', __ARG_1)
# }
.annotate 'line', 7160

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7149
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
.annotate 'line', 7173
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7174
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7175
    $P3 = WSubId_95(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7176
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7177
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7178
    $P4 = WSubId_95(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7180
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7181
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7183

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7186
    self.'optimize_condition'()
.annotate 'line', 7187
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7188
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 7189
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7191
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7193
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7195
    .return(self)
# }
.annotate 'line', 7196

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7199
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7200
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7201
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7202
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7203
# elselabel: $S1
    set $S1, ''
.annotate 'line', 7204
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7205
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7206
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7207
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7208
    self.'annotate'(__ARG_1)
.annotate 'line', 7209
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7210
    $P1.'emit'(__ARG_1)
.annotate 'line', 7212
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7213
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7214
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7215
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7217
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7218

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7167
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7169
    addattribute $P0, 'truebranch'
.annotate 'line', 7170
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 7230
    $P2 = WSubId_95(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7231

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7234
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7235
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7237
    self.'annotate'(__ARG_1)
.annotate 'line', 7238
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7239
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7240
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7241
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7242

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7225
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7227
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7253
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7254
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7255
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7256

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7259
    self.'optimize_condition'()
.annotate 'line', 7260
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7261
    .return(self)
# }
.annotate 'line', 7262

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7265
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7267
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7270
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7273
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7274
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7276
    self.'annotate'(__ARG_1)
.annotate 'line', 7277
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7278
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7279
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7280
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7281
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7283

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7249
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
.annotate 'line', 7294
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7295
    self.'parsebody'(__ARG_2)
.annotate 'line', 7296
    WSubId_96('while', __ARG_2)
.annotate 'line', 7297
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7298

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7301
    self.'optimize_condition'()
.annotate 'line', 7302
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7303
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7304
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7305
    setattribute self, 'body', $P1
.annotate 'line', 7306
    .return(self)
# }
.annotate 'line', 7307

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7310
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7311
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7312
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7314
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7317
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7318
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7319
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7321
    self.'annotate'(__ARG_1)
.annotate 'line', 7322
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7324
    $P1.'emit'(__ARG_1)
.annotate 'line', 7325
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7326
    eq $I1, 2, __label_7
.annotate 'line', 7327
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7328
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7330

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7290
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
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 7341
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7342
    WSubId_55(';', __ARG_2)
# }
.annotate 'line', 7343

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7344
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7347
    self.'annotate'(__ARG_1)
.annotate 'line', 7348
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7349
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7350

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7337
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 7361
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7362
    WSubId_55(';', __ARG_2)
# }
.annotate 'line', 7363

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7364
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7367
    self.'annotate'(__ARG_1)
.annotate 'line', 7368
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7369
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7370

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7357
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7385
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7386
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7387
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7388
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7389

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 7392
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7393
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7394
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7395
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_38(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7396
    $P1 = __ARG_1.'get'()
.annotate 'line', 7397
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7398
    WSubId_41("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7399
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7400
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
.annotate 'line', 7401
    __ARG_1.'unget'($P1)
.annotate 'line', 7402
    $P3 = WSubId_95(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7404
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7405
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7408
    $P1 = __ARG_1.'get'()
.annotate 'line', 7409
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7410
    WSubId_41("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7411
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
.annotate 'line', 7412
    __ARG_1.'unget'($P1)
.annotate 'line', 7413
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_95(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7415
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7418
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7419
    WSubId_41("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7420

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 7423
    getattribute $P2, self, 'case_value'
    WSubId_39($P2)
.annotate 'line', 7424
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7425
    WSubId_39($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7426
    getattribute $P2, self, 'default_st'
    WSubId_39($P2)
# }
.annotate 'line', 7427

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7377
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7379
    addattribute $P0, 'case_value'
.annotate 'line', 7380
    addattribute $P0, 'case_st'
.annotate 'line', 7381
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7440
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7441
    $P3 = WSubId_38(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7442
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7443
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7444
    WSubId_41("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7445
    $P1 = __ARG_2.'get'()
.annotate 'line', 7446
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7447
    WSubId_41("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7448
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7449

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7452
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7453
    self.'optimize_cases'()
.annotate 'line', 7454
    .return(self)
# }
.annotate 'line', 7455

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7459
# type: $S1
    set $S1, ''
.annotate 'line', 7460
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7461
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7462
    ne $S2, 'N', __label_4
.annotate 'line', 7463
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7464
    ne $S1, '', __label_5
.annotate 'line', 7465
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7466
    eq $S1, $S2, __label_7
.annotate 'line', 7467
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7470
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7471
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7475
    ne $S1, '', __label_8
.annotate 'line', 7476
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7478
    __ARG_1.'comment'('switch')
.annotate 'line', 7479
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7480
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7481
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7483
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7484
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7488
    self.'genbreaklabel'()
.annotate 'line', 7489
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7490
    new $P4, ['ResizableStringArray']
.annotate 'line', 7491
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7492
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7493
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7494
# predefined push
    push $P4, $S7
.annotate 'line', 7495
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7496
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7498
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7501
    self.'annotate'(__ARG_1)
.annotate 'line', 7502
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7503
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7504
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7505
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7506
    $P7 = $P6[$I2]
    WSubId_53(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7504
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7509
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7510
    getattribute $P7, self, 'default_st'
    WSubId_53(__ARG_1, $P7)
.annotate 'line', 7512
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7513

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7434
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7436
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7525
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7526
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7527

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7530
    self.'optimize_cases'()
.annotate 'line', 7531
    .return(self)
# }
.annotate 'line', 7532

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7536
    self.'genbreaklabel'()
.annotate 'line', 7537
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7538
    new $P1, ['ResizableStringArray']
.annotate 'line', 7540
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7541
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7542
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7543
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7544
# predefined push
    push $P1, $S3
.annotate 'line', 7545
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7546
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7548
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7551
    self.'annotate'(__ARG_1)
.annotate 'line', 7552
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7553
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7554
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7555
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7556
    $P4 = $P3[$I2]
    WSubId_53(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7554
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7559
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7560
    getattribute $P4, self, 'default_st'
    WSubId_53(__ARG_1, $P4)
.annotate 'line', 7562
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7563

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7520
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7570
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7571
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7572
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7573
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7574
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7575
    WSubId_41("'(' in switch", $P1)
# }
.annotate 'line', 7576

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7589
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7590
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7591
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7592
    __ARG_2.'unget'($P1)
.annotate 'line', 7593
    $P3 = WSubId_95(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7595
    $P1 = __ARG_2.'get'()
.annotate 'line', 7596
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7597
    __ARG_2.'unget'($P1)
.annotate 'line', 7598
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7599
    WSubId_55(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7601
    $P1 = __ARG_2.'get'()
.annotate 'line', 7602
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7603
    __ARG_2.'unget'($P1)
.annotate 'line', 7604
    $P3 = WSubId_38(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7605
    WSubId_55(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7607
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7608

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7611
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7612
    if_null $P1, __label_1
.annotate 'line', 7613
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7614
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7615
    self.'optimize_condition'()
.annotate 'line', 7616
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7617
    if_null $P1, __label_4
.annotate 'line', 7618
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7620
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7623
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7624
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7625
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7626
    .return(self)
# }
.annotate 'line', 7627

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7630
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7631
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7632
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7633
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7634
    .return()
# }
  __label_1: # endif
.annotate 'line', 7636
    __ARG_1.'comment'('for loop')
.annotate 'line', 7637
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7638
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7639
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7640
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7641
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7643
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7644
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7645
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7647
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7648
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7649
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7650
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7651
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7653
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7654

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7582
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7584
    addattribute $P0, 'initializer'
.annotate 'line', 7585
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
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 7669
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7670
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7671
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7672
# deftype: $S2
    $P1 = WSubId_97(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7673
    self.'createvar'($S1, $S2)
.annotate 'line', 7674
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7676
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7677
    $P2 = WSubId_38(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7678
    WSubId_55(')', __ARG_2)
.annotate 'line', 7679
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7680

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7683
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7687
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7688
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7689
    $P2 = $P1.'get_value'()
    set $S1, $P2
# predefined length
    length $I2, $S1
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7690
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7692
    setattribute self, 'container', $P1
.annotate 'line', 7693
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7694
    .return(self)
# }
.annotate 'line', 7695

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 7698
    self.'annotate'(__ARG_1)
.annotate 'line', 7699
# regcont: $S1
    null $S1
.annotate 'line', 7700
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7701
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7702
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7703
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7706
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7708
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7709
    unless_null $P1, __label_4
.annotate 'line', 7710
    getattribute $P2, self, 'varname'
    WSubId_62($P2)
  __label_4: # endif
.annotate 'line', 7712
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7713
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7714
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7715
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7716
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7717
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7718
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7719
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7720
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7721
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7722
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7723
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7724

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7661
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7663
    addattribute $P0, 'deftype'
.annotate 'line', 7664
    addattribute $P0, 'varname'
.annotate 'line', 7665
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 7731
    WSubId_55('(', __ARG_2)
.annotate 'line', 7732
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7733
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7734
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7735
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7737
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7738
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7739
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7740
    __ARG_2.'unget'($P3)
.annotate 'line', 7741
    __ARG_2.'unget'($P2)
.annotate 'line', 7742
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7744
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7745

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7757
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7758
    $P2 = WSubId_38(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7759

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7762
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7763
    .return(self)
# }
.annotate 'line', 7764

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7767
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7768
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7769
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7770
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7772
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7775
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7778
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7780

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7751
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7753
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7792
    setattribute self, 'start', __ARG_1
.annotate 'line', 7793
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7794

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7797
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7798
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7799
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7800
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7801
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
.annotate 'line', 7804
    eq $I1, 1, __label_10
.annotate 'line', 7805
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7806
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7807
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7808
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7812
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7813
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7814
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7815
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7813
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7818
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7817
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7821
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7824

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7787
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7789
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7836
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7837
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7838
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7839
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7841
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7843
    $P3 = WSubId_95(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7844
    $P1 = __ARG_2.'get'()
.annotate 'line', 7845
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7846
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7847
    $P1 = __ARG_2.'get'()
.annotate 'line', 7848
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7849
    WSubId_41("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7850
    $P1 = __ARG_2.'get'()
.annotate 'line', 7851
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7852
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7853
    setattribute self, 'exname', $P1
.annotate 'line', 7854
    self.'createvar'($S1, 'P')
.annotate 'line', 7855
    $P1 = __ARG_2.'get'()
.annotate 'line', 7856
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7857
    WSubId_41("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7859
    $P3 = WSubId_95(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7860

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7863
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7864
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7865
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7866
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7867
    .return(self)
# }
.annotate 'line', 7868

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7871
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7872
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7873
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7874
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7875
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7876
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7878
    self.'annotate'(__ARG_1)
.annotate 'line', 7879
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7881
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7882
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7884
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7885
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7887
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7888
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7889
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7890
    __ARG_1.'comment'('try: end')
.annotate 'line', 7891
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7893
    self.'annotate'(__ARG_1)
.annotate 'line', 7894
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7896
    __ARG_1.'comment'('catch')
.annotate 'line', 7897
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7898
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7899
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7900
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7901
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7903
    __ARG_1.'comment'('catch end')
.annotate 'line', 7904
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7905

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7827
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7829
    addattribute $P0, 'stry'
.annotate 'line', 7830
    addattribute $P0, 'modifiers'
.annotate 'line', 7831
    addattribute $P0, 'exname'
.annotate 'line', 7832
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
.annotate 'line', 7918
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7919
    setattribute self, 'name', __ARG_3
.annotate 'line', 7920
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7921
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7922

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7912
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7914
    addattribute $P0, 'name'
.annotate 'line', 7915
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
.annotate 'line', 7937
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7938
    setattribute self, 'name', __ARG_3
.annotate 'line', 7939
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7940

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7929
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7931
    addattribute $P0, 'name'
.annotate 'line', 7932
    addattribute $P0, 'basetype'
.annotate 'line', 7933
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7951
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7952
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7953
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7954
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7955
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7957
    $P5 = WSubId_38(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7960
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7961

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7964
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7965
    if_null $P1, __label_1
.annotate 'line', 7966
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7967
    .return(self)
# }
.annotate 'line', 7968

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7971
    self.'annotate'(__ARG_1)
.annotate 'line', 7972
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7973
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7974
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7975
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7976
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7978
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7979
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7981
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7982
    ne $S4, $S3, __label_8
.annotate 'line', 7983
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7985
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 7987
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7990
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7991
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 7993
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 7995
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 7998
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7999
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 8001
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 8002
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 8003
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8004
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 8005
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 8006
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 8009
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 8013

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7945
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7947
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
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 8028
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 8029
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 8030
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 8031
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 8032
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 8033
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8035
    __ARG_6.'unget'($P2)
.annotate 'line', 8036
    $P4 = WSubId_38(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 8037
    WSubId_55(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 8039
    $P2 = __ARG_6.'get'()
.annotate 'line', 8040
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 8041
    $P2 = __ARG_6.'get'()
.annotate 'line', 8042
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8043
    WSubId_41("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 8044
    $P2 = __ARG_6.'get'()
.annotate 'line', 8045
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 8046
    __ARG_6.'unget'($P2)
.annotate 'line', 8047
    $P4 = WSubId_37(__ARG_6, self, WSubId_38, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 8051
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 8052

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 8055
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8056
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8057
    getattribute $P1, self, 'initarray'
    WSubId_39($P1)
.annotate 'line', 8058
    .return(self)
# }
.annotate 'line', 8059

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8062
    self.'annotate'(__ARG_1)
.annotate 'line', 8064
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 8065
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 8066
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 8067
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 8068
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 8069
    if_null $P2, __label_1
# {
.annotate 'line', 8071
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 8072
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8076
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 8078
    if_null $P3, __label_4
# {
.annotate 'line', 8079
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 8080
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 8081
    unless_null $P2, __label_6
# {
.annotate 'line', 8082
    le $I1, 0, __label_7
# {
.annotate 'line', 8084
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 8087
# i: $I2
    null $I2
.annotate 'line', 8088
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 8089
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 8090
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 8091
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 8094

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8018
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8020
    addattribute $P0, 'size'
.annotate 'line', 8021
    addattribute $P0, 'initarray'
.annotate 'line', 8022
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
.annotate 'line', 8101
# var next: $P1
    null $P1
.annotate 'line', 8102
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 8103
# {
.annotate 'line', 8104
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 8105
    WSubId_94($P3)
.annotate 'line', 8106
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8107
# var item: $P5
    null $P5
.annotate 'line', 8108
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8109
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8111
    __ARG_4.'unget'($P4)
.annotate 'line', 8112
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 8114
    $P2 = WSubId_98($P2, $P5)
.annotate 'line', 8115
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 8116
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8117
    WSubId_4(';', $P1)
.annotate 'line', 8118
    .return($P2)
# }
.annotate 'line', 8119

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8127
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 8128

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8123
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
.annotate 'line', 8135
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 8136

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8131
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
.annotate 'line', 8142
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8143

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8147
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8148

.end # newIntArray


.sub 'parseInt' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_101 = "WSubId_101"
# Body
# {
.annotate 'line', 8152
    .tailcall WSubId_99(WSubId_100, WSubId_101, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8153

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8161
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 8162

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8157
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
.annotate 'line', 8169
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 8170

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8165
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
.annotate 'line', 8176
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8177

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8181
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8182

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 8186
    .tailcall WSubId_99(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8187

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8195
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 8196

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8191
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
.annotate 'line', 8203
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 8204

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8199
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
.annotate 'line', 8210
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8211

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8215
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8216

.end # newStringArray


.sub 'parseString' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8220
    .tailcall WSubId_99(WSubId_104, WSubId_105, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8221

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
.annotate 'line', 8237
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8238
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8239
    setattribute self, 'name', __ARG_4
.annotate 'line', 8240
    setattribute self, 'value', __ARG_5
.annotate 'line', 8241
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8242

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8245
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8246
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8247
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8248
    $P1 = $P1.'optimize'()
.annotate 'line', 8249
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8250
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8253
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8254
    .return(self)
# }
.annotate 'line', 8255

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8258
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8259

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8262
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8263

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8227
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8229
    addattribute $P0, 'type'
.annotate 'line', 8230
    addattribute $P0, 'name'
.annotate 'line', 8231
    addattribute $P0, 'data'
.annotate 'line', 8232
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 8268
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8269
# type: $S1
    $P5 = WSubId_97($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8270
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8271
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8273
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8274
# {
.annotate 'line', 8275
    $P1 = __ARG_2.'get'()
.annotate 'line', 8276
# var name: $P3
    set $P3, $P1
.annotate 'line', 8277
    WSubId_55('=', __ARG_2)
.annotate 'line', 8278
# var value: $P4
    $P4 = WSubId_38(__ARG_2, __ARG_3)
.annotate 'line', 8280
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8279
    $P2 = WSubId_98($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8281
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8282
    .return($P2)
# }
.annotate 'line', 8283

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8294
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8295
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8296
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8297
    $P4 = WSubId_38(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8298
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8300
    WSubId_4(';', $P1)
# }
.annotate 'line', 8301

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8304
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8305
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8306
    .return(self)
# }
.annotate 'line', 8307

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8310
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8311

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8314
    self.'annotate'(__ARG_1)
.annotate 'line', 8315
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8316
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8317
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8318
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8319
    if_null $P1, __label_3
.annotate 'line', 8320
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8321
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8322
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8323
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
.annotate 'line', 8325
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8326
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8328
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8333
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8334
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8337
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8339
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8343
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8344

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8289
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8291
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 8351
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8352
    WSubId_55(';', __ARG_2)
# }
.annotate 'line', 8353

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8356
    self.'annotate'(__ARG_1)
.annotate 'line', 8357
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8358
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8359
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8360

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8347
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 8369
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8370
    $P2 = WSubId_38(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8371
    WSubId_55(']', __ARG_2)
.annotate 'line', 8372
    WSubId_55(';', __ARG_2)
# }
.annotate 'line', 8373

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8376
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8377
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8378

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8381
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8382
    self.'annotate'(__ARG_1)
.annotate 'line', 8383
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8384
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8385
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8386

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8363
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8365
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 8391
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8392
    WSubId_94($P1)
.annotate 'line', 8393
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8394
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8395
    $P2 = __ARG_2.'get'()
.annotate 'line', 8396
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8397
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8399
    __ARG_2.'unget'($P2)
.annotate 'line', 8400
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
.annotate 'line', 8404
    __ARG_2.'unget'($P2)
.annotate 'line', 8405
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8407

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_47 = "WSubId_47"
# Body
# {
.annotate 'line', 8411
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8412
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8413
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8414
    .tailcall WSubId_47(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8415

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
.annotate 'line', 8428
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8429
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8430
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8431
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8432
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8433
    __ARG_2.'unget'($P1)
.annotate 'line', 8434
# var c: $P2
    $P2 = WSubId_95(__ARG_2, self)
.annotate 'line', 8435
    unless_null $P2, __label_3
.annotate 'line', 8436
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8437
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8439
    setattribute self, 'end', $P1
# }
.annotate 'line', 8440

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8443
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8444
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8445
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8446
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8447
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8448
    .return($S2)
# }
.annotate 'line', 8449

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8452
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8453
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8454
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8455
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8456
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8457
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8458
    $P1[$S1] = $S3
.annotate 'line', 8459
    .return($S3)
# }
.annotate 'line', 8460

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8461
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8464
    __ARG_1.'comment'('{')
.annotate 'line', 8465
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8466
    $P1.'emit'(__ARG_1)
.annotate 'line', 8467
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8469
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8470

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8421
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8423
    addattribute $P0, 'end'
.annotate 'line', 8424
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8485
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8487
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8488
    new $P1, ['ResizableStringArray']
.annotate 'line', 8489
    new $P2, ['ResizableStringArray']
.annotate 'line', 8490
    setattribute self, 'tempreg', $P1
.annotate 'line', 8491
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8492

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8495
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8496
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8497
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8498
    assign $P1, $I1
# predefined string
.annotate 'line', 8499
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8500

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8503
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8504
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8505
# reg: $S1
    null $S1
.annotate 'line', 8506
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8507
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8509
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8510
# predefined push
    push $P2, $S1
.annotate 'line', 8511
    .return($S1)
# }
.annotate 'line', 8512

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8515
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8516
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8517
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8518
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8519
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8520
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8518
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8522
    assign $P2, 0
# }
.annotate 'line', 8523

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8479
    addattribute $P0, 'type'
.annotate 'line', 8480
    addattribute $P0, 'nreg'
.annotate 'line', 8481
    addattribute $P0, 'tempreg'
.annotate 'line', 8482
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8534
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8535

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8538
# var named: $P1
    null $P1
.annotate 'line', 8539
# var slurpy: $P2
    null $P2
.annotate 'line', 8540
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8541
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8542
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8543
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8545
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8548
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8551
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8555
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8562
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8579
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8560
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8563
# setname: $S2
    null $S2
# switch
.annotate 'line', 8564
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8566
    concat $S2, "'", __ARG_3
    concat $S2, $S2, "'"
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8569
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8570
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8571
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8572
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8575
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8577
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8580
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8581
# }
.annotate 'line', 8583

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8530
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
.annotate 'line', 8594
    setattribute self, 'func', __ARG_1
.annotate 'line', 8595
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8596
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_97($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8597
    eq $S1, '', __label_2
.annotate 'line', 8598
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8600
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8601
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 8602
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8603
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8605
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8606
    $P1 = __ARG_2.'get'()
.annotate 'line', 8607
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8608
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8610
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8611

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 8614
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8615
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8616
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8617
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_106($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8618
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8619
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8620
    if_null $P3, __label_3
.annotate 'line', 8621
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8622
    __ARG_1.'say'('')
# }
.annotate 'line', 8623

.end # emit


.sub 'get_type' :method
# Body
# {
.annotate 'line', 8626
    getattribute $P1, self, 'type'
    .return($P1)
# }
.annotate 'line', 8627

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8588
    addattribute $P0, 'func'
.annotate 'line', 8589
    addattribute $P0, 'name'
.annotate 'line', 8590
    addattribute $P0, 'modifiers'
.annotate 'line', 8591
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8633
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8634

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8645
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8646
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8647

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 8650
# var ns: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 8651
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 8652
# key: $S1
    null $S1
.annotate 'line', 8653
# predefined elements
    elements $I1, $P2
    le $I1, 0, __label_1
.annotate 'line', 8654
    $P3 = WSubId_22($P2)
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8655
# reg: $S2
    $P3 = __ARG_2.'tempreg'('P')
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8656
    getattribute $P3, self, 'name'
    __ARG_1.'emitget_hll_global'($S2, $P3, $S1)
.annotate 'line', 8657
    .return($S2)
# }
.annotate 'line', 8658

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8640
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8642
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8669
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8670

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8673
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8674
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8675
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8676
    le $I1, 0, __label_3
# {
.annotate 'line', 8677
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8678
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8679
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8680
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8681
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8682
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 8683
    sub $I3, $I1, 1
    ge $I2, $I3, __label_8
.annotate 'line', 8684
    __ARG_1.'print'(", ")
  __label_8: # endif
# }
  __label_4: # for iteration
.annotate 'line', 8678
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8686
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8689

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8665
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8712
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8713
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8714
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8715
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8716
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8717
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8718

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8720
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8724
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8725
    unless_null $P1, __label_1
.annotate 'line', 8726
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8727
    .return($P1)
# }
.annotate 'line', 8728

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8731
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8732
    unless_null $P1, __label_1
.annotate 'line', 8733
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8734
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8735

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8739
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8740
    .return($I1)
# }
.annotate 'line', 8741

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_107 = "WSubId_107"
# Body
# {
.annotate 'line', 8744
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8745
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8746
    __ARG_1.'unget'($P1)
.annotate 'line', 8747
    $P3 = WSubId_37(__ARG_1, self, WSubId_107, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8749

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8753
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8754
    unless_null $P1, __label_1
.annotate 'line', 8755
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8757
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8758

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8761
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8762
    unless_null $P1, __label_1
# {
.annotate 'line', 8764
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8767
    if_null $P1, __label_4
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8768
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8769
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8770
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8772

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 8775
# var found: $P1
    null $P1
.annotate 'line', 8776
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8777
    $P1 = $P2.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 8778
    if_null $P1, __label_3
.annotate 'line', 8779
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8781
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8782

.end # scopesearch


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8786
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 8787
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8788
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8789
    .return(self)
# }
.annotate 'line', 8790

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8794
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8795
    unless_null $P1, __label_1
.annotate 'line', 8796
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8797
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8798

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8801
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8802
    unless_null $P1, __label_1
.annotate 'line', 8803
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8804
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8805

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8810
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8811
# lexname: $S1
    null $S1
.annotate 'line', 8812
    if_null $P1, __label_1
.annotate 'line', 8813
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8815
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8816
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8817
# predefined string
    set $S3, $I1
    concat $S1, '__WLEX_', $S3
.annotate 'line', 8818
    self.'setlex'($S1, $S2)
.annotate 'line', 8819
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8821
    .return($S1)
# }
.annotate 'line', 8822

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8826
# var store: $P1
    null $P1
# switch
.annotate 'line', 8827
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
.annotate 'line', 8829
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8831
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8833
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8835
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8837
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8839
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8840
    .return($S1)
# }
.annotate 'line', 8841

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8844
# var store: $P1
    null $P1
# switch
.annotate 'line', 8845
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
.annotate 'line', 8847
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8849
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8851
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8853
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8855
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8857
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8858
    .return($S1)
# }
.annotate 'line', 8859

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8862
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
.annotate 'line', 8863
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8864

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8867
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8868
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8869

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8872
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8873

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8876
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8877

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
# Empty body

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 8883
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 8884
    __ARG_1.'say'()
.annotate 'line', 8885
    __ARG_1.'print'(".sub ")
.annotate 'line', 8886
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 8887
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8889
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8890
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 8891
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 8892
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 8893
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8894
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8895
    if_null $P2, __label_6
.annotate 'line', 8896
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8900
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 8901
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8902
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8903
    if_null $P3, __label_8
.annotate 'line', 8904
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8906
    ne $S1, 'main', __label_10
.annotate 'line', 8907
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8909
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 8910
    __ARG_1.'say'()
.annotate 'line', 8913
    getattribute $P8, self, 'params'
    WSubId_53(__ARG_1, $P8)
.annotate 'line', 8915
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8916
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8917
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8918
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 8920
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 8921
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 8923
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 8924
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 8925
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 8926
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 8930
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 8932
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 8935
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8936
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 8937
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 8939
    __ARG_1.'comment'('Body')
.annotate 'line', 8940
    $P6.'emit'(__ARG_1)
.annotate 'line', 8941
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 8943
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8946
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 8947
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 8948

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8692
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8694
    addattribute $P0, 'name'
.annotate 'line', 8695
    addattribute $P0, 'subid'
.annotate 'line', 8696
    addattribute $P0, 'modifiers'
.annotate 'line', 8697
    addattribute $P0, 'params'
.annotate 'line', 8698
    addattribute $P0, 'body'
.annotate 'line', 8699
    addattribute $P0, 'regstI'
.annotate 'line', 8700
    addattribute $P0, 'regstN'
.annotate 'line', 8701
    addattribute $P0, 'regstS'
.annotate 'line', 8702
    addattribute $P0, 'regstP'
.annotate 'line', 8703
    addattribute $P0, 'nlabel'
.annotate 'line', 8704
    addattribute $P0, 'localfun'
.annotate 'line', 8705
    addattribute $P0, 'lexicals'
.annotate 'line', 8706
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8707
    addattribute $P0, 'usedsubids'
.annotate 'line', 8708
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8964
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8965
    box $P4, 0
    setattribute self, 'paramnum', $P4
.annotate 'line', 8966
    box $P4, 0
    setattribute self, 'lexnum', $P4
.annotate 'line', 8967
    self.'parse'(__ARG_2)
.annotate 'line', 8968
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'multi_sig', $P5
.annotate 'line', 8969
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 8970
    new $P5, [ 'Boolean' ]
    setattribute self, 'is_multi', $P5
.annotate 'line', 8971
    if_null $P1, __label_1
# {
.annotate 'line', 8972
# var multi_sig: $P2
    getattribute $P2, self, 'multi_sig'
.annotate 'line', 8973
# start_idx: $I1
    null $I1
.annotate 'line', 8974
    $P4 = self.'ismethod'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8975
    set $I1, 1
.annotate 'line', 8976
    $P2[0] = 'P'
# }
  __label_2: # endif
# for loop
.annotate 'line', 8978
# i: $I2
    null $I2
  __label_5: # for condition
# predefined elements
    elements $I3, $P1
    ge $I2, $I3, __label_4
# {
.annotate 'line', 8979
# var param: $P3
    $P3 = $P1[$I2]
.annotate 'line', 8980
    add $I3, $I2, $I1
    $P4 = $P3.'get_type'()
    $P2[$I3] = $P4
# }
  __label_3: # for iteration
.annotate 'line', 8978
    set $I3, $I2
    inc $I2
    goto __label_5
  __label_4: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 8983

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8985
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8989
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 8990

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8994
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 8995

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8996
    .return(0)
# }

.end # ismethod


.sub 'ismulti' :method
# Body
# {
.annotate 'line', 8999
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
.annotate 'line', 9000

.end # ismulti


.sub 'setmulti' :method
# Body
# {
.annotate 'line', 9003
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
# }
.annotate 'line', 9004

.end # setmulti


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 9008
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9009
    setattribute self, 'name', $P1
.annotate 'line', 9010
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9011
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9012
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9013
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 9015
    WSubId_4('(', $P2)
.annotate 'line', 9016
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9018
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 9019
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 9020
# predefined join
    join $S1, '.', $P3
    WSubId_108(self, '__FUNCTION__', $S1)
.annotate 'line', 9022
    $P2 = __ARG_1.'get'()
.annotate 'line', 9023
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9024
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9025
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9026
    .return(self)
# }
.annotate 'line', 9027

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 9031
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 9032
# var multi_sig: $P1
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9033
    __ARG_1.'print'(' :multi(')
.annotate 'line', 9034
# sep: $S1
    set $S1, ''
.annotate 'line', 9035
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $S2, $P3
# {
.annotate 'line', 9036
    $P2 = WSubId_106($S2)
    __ARG_1.'print'($S1, $P2)
.annotate 'line', 9037
    set $S1, ', '
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9039
    __ARG_1.'print'(')')
# }
  __label_1: # endif
# }
.annotate 'line', 9041

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8955
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8957
    addattribute $P0, 'paramnum'
.annotate 'line', 8958
    addattribute $P0, 'lexnum'
.annotate 'line', 8959
    addattribute $P0, 'multi_sig'
.annotate 'line', 8960
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
.annotate 'line', 9052
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9053
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9054
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9055
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 9056
    setattribute self, 'name', $P1
.annotate 'line', 9057
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9058
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9059
    WSubId_4('{', $P2)
.annotate 'line', 9060
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9061
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 9062

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9063
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9064
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 9067
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9068
    .return(1)
  __label_1: # endif
.annotate 'line', 9069
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9070
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9071
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9072
    .return(0)
# }
.annotate 'line', 9073

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 9076
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 9077

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 9081
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 9082

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 9086
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 9087

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9090
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9091
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9092
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9094
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9095
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9096
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9097
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 9098
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 9099
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 9100
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 9101
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9102
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 9103
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9104
    eq $S3, 'P', __label_8
.annotate 'line', 9105
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9106
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9107
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9108
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9109
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 9112
    .return(__ARG_2)
# }
.annotate 'line', 9113

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9116
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9117
    unless_null $P1, __label_1
.annotate 'line', 9118
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9119
    unless_null $P1, __label_2
# {
.annotate 'line', 9122
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9123
    unless_null $P1, __label_3
# {
.annotate 'line', 9125
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 9126
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 9127
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 9128
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9129
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9130
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9131
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 9135
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 9137
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9138
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9139
    .return($P1)
# }
.annotate 'line', 9140

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9048
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
.annotate 'line', 9151
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9152

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9153
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9147
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
.annotate 'line', 9167
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9168
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9169
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9170
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9171
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9172
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_97($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9173
    set $P1, $P2
.annotate 'line', 9174
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9175
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 9177
    setattribute self, 'name', $P1
.annotate 'line', 9178
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9179
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9180
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9181
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9183
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 9184

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9187
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9188
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9189
    if_null $P1, __label_1
# {
.annotate 'line', 9190
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 9191
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 9193

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9162
    addattribute $P0, 'name'
.annotate 'line', 9163
    addattribute $P0, 'modifiers'
.annotate 'line', 9164
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9198
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 9199

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 9206
    $P2 = WSubId_37(__ARG_1, __ARG_2, WSubId_109, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 9207

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9210
    __ARG_1.'print'('(')
.annotate 'line', 9211
# sep: $S1
    set $S1, ''
.annotate 'line', 9212
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 9213
    __ARG_1.'print'($S1)
.annotate 'line', 9214
    $P1.'emit'(__ARG_1)
.annotate 'line', 9215
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9217
    __ARG_1.'print'(')')
# }
.annotate 'line', 9218

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9203
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
.annotate 'line', 9227
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9228
    setattribute self, 'params', __ARG_3
.annotate 'line', 9229
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 9230

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9233
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9234
    .return(self)
# }
.annotate 'line', 9235

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9238
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 9239
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9240
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9241
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9242
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9243
    __ARG_1.'print'('    ')
.annotate 'line', 9244
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9245
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9246
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9247
    __ARG_1.'say'()
# }
.annotate 'line', 9248

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9221
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9223
    addattribute $P0, 'params'
.annotate 'line', 9224
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
.annotate 'line', 9265
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9266

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9267
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9271
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9272

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9261
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9280
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9281
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9282

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9283
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9287
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9288
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9289

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9275
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9277
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9298
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9299
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9300
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9301
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9302
    WSubId_41('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9303
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 9304
    $P2 = __ARG_1.'get'()
.annotate 'line', 9305
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9306
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9308
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9312
    WSubId_42('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9314
# {
.annotate 'line', 9315
    $P2 = __ARG_1.'get'()
.annotate 'line', 9316
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9317
    WSubId_41('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9318
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9319
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9320
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9322
    setattribute self, 'key', $P1
# }
.annotate 'line', 9323

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9324
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 9327
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9328

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9332
    getattribute $P2, self, 'key'
    $P1 = WSubId_22($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9333

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9292
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9294
    addattribute $P0, 'key'
.annotate 'line', 9295
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9341
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9342
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 9343
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9344
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9345
    $P2 = __ARG_1.'get'()
.annotate 'line', 9346
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9348
    __ARG_1.'unget'($P2)
.annotate 'line', 9349
    setattribute self, 'key', $P1
# }
.annotate 'line', 9350

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9351
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9355
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9356
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9357

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9361
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9362
    unless_null $P1, __label_1
# {
.annotate 'line', 9363
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9364
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_69($S2)
  __label_3: # endif
.annotate 'line', 9365
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9367
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9368

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9336
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9338
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9373
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9374
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9375
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9376
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9377
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9378
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9379
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9380
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9381

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9393
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9394
    setattribute self, 'name', __ARG_2
.annotate 'line', 9395
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9396
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 9397
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9398

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9401
    getattribute $P1, self, 'classns'
    .tailcall WSubId_22($P1)
# }
.annotate 'line', 9402

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9387
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9389
    addattribute $P0, 'name'
.annotate 'line', 9390
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 9415
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9416
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9417
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9418
    setattribute self, 'functions', $P1
.annotate 'line', 9419
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9420
    setattribute self, 'members', $P2
.annotate 'line', 9421
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9422
    setattribute self, 'constants', $P3
.annotate 'line', 9423
# var seen_functions: $P4
    root_new $P4, ['parrot';'Hash']
.annotate 'line', 9425
# var t: $P5
    $P5 = __ARG_4.'get'()
.annotate 'line', 9426
    $P10 = $P5.'isop'(':')
    if_null $P10, __label_1
    unless $P10 goto __label_1
# {
.annotate 'line', 9427
    $P12 = WSubId_37(__ARG_4, self, WSubId_63)
    setattribute self, 'bases', $P12
.annotate 'line', 9428
    $P5 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9430
    WSubId_4('{', $P5)
.annotate 'line', 9432
    getattribute $P10, self, 'classns'
# predefined join
    join $S1, '.', $P10
    WSubId_108(self, '__CLASS__', $S1)
# for loop
.annotate 'line', 9434
    $P5 = __ARG_4.'get'()
  __label_4: # for condition
    $P10 = $P5.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9435
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
.annotate 'line', 9437
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P6.'MethodStatement'($P5, __ARG_4, self)
.annotate 'line', 9438
# predefined push
    push $P1, $P6
.annotate 'line', 9439
# var first_func: $P7
    getattribute $P12, $P6, 'name'
    $P7 = $P4[$P12]
.annotate 'line', 9440
    unless_null $P7, __label_10
.annotate 'line', 9441
    getattribute $P13, $P6, 'name'
    $P4[$P13] = $P6
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 9443
    $P7.'setmulti'()
.annotate 'line', 9444
    $P6.'setmulti'()
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9448
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 9449
    $P10 = $P8.'isidentifier'()
    isfalse $I1, $P10
    unless $I1 goto __label_12
.annotate 'line', 9450
    WSubId_41("member identifier", $P8)
  __label_12: # endif
.annotate 'line', 9451
# predefined push
    push $P2, $P8
.annotate 'line', 9452
    $P5 = __ARG_4.'get'()
.annotate 'line', 9453
    $P11 = $P5.'isop'(';')
    isfalse $I2, $P11
    unless $I2 goto __label_13
.annotate 'line', 9454
    WSubId_41("';' in member declaration", $P5)
  __label_13: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9457
# var cst: $P9
    $P9 = WSubId_45($P5, __ARG_4, self)
.annotate 'line', 9458
# predefined push
    push $P3, $P9
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9461
    WSubId_42("item in class", $P5)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9434
    $P5 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9464

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9467
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9468

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9471
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9472

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9475
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9476

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9479
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9480

.end # scopesearch


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9483
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9484

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 9487
    getattribute $P1, self, 'constants'
    WSubId_39($P1)
.annotate 'line', 9488
    getattribute $P1, self, 'functions'
    WSubId_39($P1)
.annotate 'line', 9489
    .return(self)
# }
.annotate 'line', 9490

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 9493
    getattribute $P3, self, 'classns'
    __ARG_1.'emitnamespace'($P3)
.annotate 'line', 9494
    getattribute $P3, self, 'functions'
    WSubId_53(__ARG_1, $P3)
.annotate 'line', 9496
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9498
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 9499
# n: $I1
    set $I1, 1
.annotate 'line', 9500
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 9501
    $P1.'annotate'(__ARG_1)
.annotate 'line', 9502
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9503
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9504
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 9505
    __ARG_1.'say'()
.annotate 'line', 9506
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9508
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 9509
    __ARG_1.'annotate'($P2)
.annotate 'line', 9510
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9513
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9514

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9405
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9407
    addattribute $P0, 'parent'
.annotate 'line', 9408
    addattribute $P0, 'bases'
.annotate 'line', 9409
    addattribute $P0, 'constants'
.annotate 'line', 9410
    addattribute $P0, 'functions'
.annotate 'line', 9411
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9521
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9522

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9525
    .return(self)
# }
.annotate 'line', 9526

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9517
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9534
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9535
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9536
# var nskey: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9537
# var ns: $P4
    null $P4
# for loop
  __label_3: # for condition
.annotate 'line', 9539
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
# {
.annotate 'line', 9540
    $P3.'push'($P1)
.annotate 'line', 9541
    $P1 = __ARG_2.'get'()
# }
  __label_1: # for iteration
.annotate 'line', 9539
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9544
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 9545
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 9546
# predefined string
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 9547
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 9550
    __ARG_2.'unget'($P2)
.annotate 'line', 9551
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 9552
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9553
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
# }
  __label_5: # endif
# }
.annotate 'line', 9555

.end # parseClass


.sub 'open_include' :subid('WSubId_110')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9563
# var interp: $P1
# predefined getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9568
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9569
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9570
# var file: $P4
    null $P4
.annotate 'line', 9571
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9572
# filepath: $S2
    concat $S2, $S1, __ARG_1
.annotate 'line', 9573
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9574
# predefined open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9575
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 9576
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9573
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
.annotate 'line', 9581
    isnull $I1, $P4
    if $I1 goto __label_8
    $I1 = $P4.'is_closed'()
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 9582
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 9583
    $P4.'encoding'("utf8")
.annotate 'line', 9584
    .return($P4)
# }
.annotate 'line', 9585

.end # open_include


.sub 'include_parrot' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9589
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9590
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9591
    WSubId_41('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9592
    WSubId_55(';', __ARG_2)
.annotate 'line', 9594
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9595
# var file: $P2
    $P2 = WSubId_110($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9600
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
.annotate 'line', 9601
# predefined substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9602
# pos: $I1
    set $I1, 12
.annotate 'line', 9603
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9604
# predefined substr
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 9605
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9606
# pos2: $I2
    set $I2, $I1
  __label_12: # while
.annotate 'line', 9607
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 9608
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9609
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 9610
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 9612
# name: $S4
    sub $I4, $I2, $I1
# predefined substr
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 9613
# predefined substr
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 9614
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 9615
    set $I1, $I2
  __label_22: # while
.annotate 'line', 9616
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 9617
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 9618
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 9619
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 9621
# value: $S5
    sub $I4, $I2, $I1
# predefined substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 9623
# ivalue: $I3
    null $I3
.annotate 'line', 9624
# predefined substr
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
# predefined substr
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 9625
# predefined substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 9627
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 9628
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 9630
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 9629
    $P4 = WSubId_21(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9600
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 9634
    $P2.'close'()
# }
.annotate 'line', 9635

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 9641
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9642
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 9643
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9644
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9645
    WSubId_41('literal string', $P1)
  __label_2: # endif
.annotate 'line', 9646
    WSubId_55(';', __ARG_2)
.annotate 'line', 9648
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 9649
# var file: $P2
    $P2 = WSubId_110($S1, __ARG_1)
.annotate 'line', 9651
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 9652
    __ARG_3.'parse'($P3)
.annotate 'line', 9654
    $P2.'close'()
# }
.annotate 'line', 9655

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9661
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9662
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 9663
    WSubId_59(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9664
    WSubId_55(';', __ARG_2)
.annotate 'line', 9665
    .return()
# }
  __label_1: # endif
.annotate 'line', 9667
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
# {
.annotate 'line', 9668
    __ARG_2.'unget'($P1)
.annotate 'line', 9669
# var key: $P2
    $P2 = WSubId_56(__ARG_2)
.annotate 'line', 9670
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9671
    ge $I1, 1, __label_3
.annotate 'line', 9672
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 9673
    WSubId_55(';', __ARG_2)
.annotate 'line', 9674
    __ARG_3.'use'($P2)
.annotate 'line', 9675
    .return()
# }
  __label_2: # endif
.annotate 'line', 9677
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9679
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 9685
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9681
# reqlib: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 9682
    __ARG_3.'addlib'($S1)
.annotate 'line', 9683
    WSubId_55(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9686
    __ARG_2.'unget'($P1)
.annotate 'line', 9687
# var module: $P3
    $P3 = WSubId_56(__ARG_2)
.annotate 'line', 9688
    $P1 = __ARG_2.'get'()
.annotate 'line', 9689
    $P6 = $P1.'isop'(';')
    isfalse $I3, $P6
    unless $I3 goto __label_9
# {
.annotate 'line', 9690
    __ARG_2.'unget'($P1)
.annotate 'line', 9691
# var names: $P4
    null $P5
    $P4 = WSubId_37(__ARG_2, $P5, WSubId_58, ';')
.annotate 'line', 9692
    __ARG_3.'addextern'($P3, $P4)
# }
  __label_9: # endif
.annotate 'line', 9694
# reqmodule: $S2
# predefined join
    join $S3, '/', $P3
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9695
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9698
    WSubId_41('string literal or identifier', $P1)
  __label_4: # switch end
# }
.annotate 'line', 9700

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9710
    setattribute self, 'module', __ARG_1
.annotate 'line', 9711
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9712

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9717
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9725
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9726
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9727
    __ARG_1.'say'("']")
.annotate 'line', 9728
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9729
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9730
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9736

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9706
    addattribute $P0, 'module'
.annotate 'line', 9707
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_108 = "WSubId_108"
# Body
# {
.annotate 'line', 9756
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9757
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9758
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9759
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9760
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9761
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 9762
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions_name', $P2
.annotate 'line', 9763
    getattribute $P1, self, 'nspath'
# predefined join
    join $S1, '.', $P1
    WSubId_108(self, '__NAMESPACE__', $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9766
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9767
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9768
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9769
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9770
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
.annotate 'line', 9771
    getattribute $P2, __ARG_2, 'functions_name'
    setattribute self, 'functions_name', $P2
# }
  __label_2: # endif
.annotate 'line', 9773
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9774

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9777
# var ns: $P1
    null $P1
.annotate 'line', 9778
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9779
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9780
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9781
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9782
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9783

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9786
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9787

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9790
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9791
    .return()
  __label_1: # endif
.annotate 'line', 9792
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9793
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9794
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9795
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9796
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9797

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9800
# var sym: $P1
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 9801
    if_null $P1, __label_1
# {
.annotate 'line', 9802
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9803
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9806
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9807
# var ns: $P2
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 9808
    if_null $P2, __label_5
# {
.annotate 'line', 9809
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9810
    if_null $P1, __label_6
.annotate 'line', 9811
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9814

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9817
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9818
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9819
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9820
    .return($P2)
# }
.annotate 'line', 9821

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9824
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9825
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9826
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9827
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9828

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9832
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9833
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9834
    unless_null $P2, __label_1
.annotate 'line', 9835
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9837
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9838

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9842
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9843
# var cl: $P2
    null $P2
.annotate 'line', 9844
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9845
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9846
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9847
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9848
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9849
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9850
    .return($P5)
# }
.annotate 'line', 9851

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9854
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9855
    if_null $P1, __label_1
.annotate 'line', 9856
    .return($P1)
  __label_1: # endif
.annotate 'line', 9857
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9858
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9859
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9860
    .return($P2)
# }
.annotate 'line', 9861

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 9866
# keylen: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9867
# name: $S1
    null $S1
.annotate 'line', 9868
# var sym: $P1
    null $P1
.annotate 'line', 9869
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9870
    sub $I2, $I1, __ARG_3
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9874
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
# switch
.annotate 'line', 9875
    set $I5, __ARG_2
    set $I6, 1
    if $I5 == $I6 goto __label_7
    set $I6, 2
    if $I5 == $I6 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 9877
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 9879
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 9882
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 9883
    .return($P1)
  __label_9: # endif
.annotate 'line', 9884
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 9885
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 9886
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9893
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 9894
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9895
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_14
.annotate 'line', 9896
    add $I8, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I8)
    isnull $I7, $P1
    not $I7
  __label_14:
    unless $I7 goto __label_13
.annotate 'line', 9897
    .return($P1)
  __label_13: # endif
.annotate 'line', 9898
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9899
    isnull $I9, $P2
    not $I9
    unless $I9 goto __label_16
.annotate 'line', 9900
    add $I10, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I10)
    isnull $I9, $P1
    not $I9
  __label_16:
    unless $I9 goto __label_15
.annotate 'line', 9901
    .return($P1)
  __label_15: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9903
    .return($P3)
# }
.annotate 'line', 9904

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9907
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9908
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9909
    .return($P1)
# }
.annotate 'line', 9910

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9913
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9914
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9915
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9916
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9917
    .return($P2)
# }
.annotate 'line', 9918

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9921
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9922

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9925
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9926
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9927

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9930
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9931
# name: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 9932
    $P1 = __ARG_2.'get'()
.annotate 'line', 9934
# var parent: $P2
    set $P2, self
# for loop
  __label_4: # for condition
.annotate 'line', 9935
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 9936
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 9937
    $P5 = __ARG_2.'get'()
    set $S1, $P5
# }
  __label_2: # for iteration
.annotate 'line', 9935
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 9940
# var modifier: $P3
    null $P3
.annotate 'line', 9941
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 9942
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 9943
    $P1 = __ARG_2.'get'()
# }
  __label_5: # endif
.annotate 'line', 9946
    WSubId_4('{', $P1)
.annotate 'line', 9947
# var child: $P4
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 9948
    $P4.'parse'(__ARG_2)
# }
.annotate 'line', 9949

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 9952
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9953
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9954
# var functions_name: $P3
    getattribute $P3, self, 'functions_name'
.annotate 'line', 9955
# var classes: $P4
    getattribute $P4, self, 'classes'
.annotate 'line', 9956
# var t: $P5
    null $P5
# for loop
.annotate 'line', 9957
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
.annotate 'line', 9959
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
.annotate 'line', 9961
    self.'parsenamespace'($P5, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9964
# var cst: $P6
    $P6 = WSubId_45($P5, __ARG_1, self)
.annotate 'line', 9965
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9968
# var f: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P7.'FunctionStatement'($P5, __ARG_1, self)
.annotate 'line', 9969
# name: $S1
    getattribute $P12, $P7, 'name'
    null $S1
    if_null $P12, __label_17
    set $S1, $P12
  __label_17:
.annotate 'line', 9970
# predefined push
    push $P2, $P7
.annotate 'line', 9971
# predefined push
    push $P1, $P7
.annotate 'line', 9972
# var funcs: $P8
    $P8 = $P3[$S1]
.annotate 'line', 9973
    if_null $P8, __label_18
# {
.annotate 'line', 9974
    $P7.'setmulti'()
.annotate 'line', 9975
# predefined elements
    elements $I1, $P8
    ne $I1, 1, __label_20
.annotate 'line', 9976
    $P11 = $P8[0]
    $P11.'setmulti'()
  __label_20: # endif
.annotate 'line', 9977
    $P8.'push'($P7)
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 9980
    root_new $P11, ['parrot';'ResizablePMCArray']
    push $P11, $P7
    $P3[$S1] = $P11
  __label_19: # endif
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9983
    WSubId_111($P5, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9986
# var t1: $P9
    $P9 = __ARG_1.'get'()
.annotate 'line', 9987
    $P13 = $P9.'iskeyword'('function')
    isfalse $I1, $P13
    unless $I1 goto __label_21
.annotate 'line', 9988
    WSubId_1('Unsupported extern', $P9)
  __label_21: # endif
.annotate 'line', 9989
    $P9 = __ARG_1.'get'()
.annotate 'line', 9990
    WSubId_94($P9)
.annotate 'line', 9991
    WSubId_55(';', __ARG_1)
.annotate 'line', 9992
# var fex: $P10
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P10.'FunctionExtern'($P9, self)
.annotate 'line', 9993
# predefined push
    push $P2, $P10
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9996
    WSubId_112($P5, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9999
    WSubId_113($P5, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 10002
    WSubId_114($P5, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 10005
    $P5 = __ARG_1.'get'()
.annotate 'line', 10006
    $P14 = $P5.'isstring'()
    isfalse $I2, $P14
    unless $I2 goto __label_22
.annotate 'line', 10007
    WSubId_41('string literal', $P5)
  __label_22: # endif
.annotate 'line', 10008
    WSubId_55(';', __ARG_1)
.annotate 'line', 10009
    new $P17, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P17.'StringLiteral'(self, $P5)
    set $P16, $P17
    $P15 = $P16.'getPirString'()
    self.'addload'($P15)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 10012
    $P5 = __ARG_1.'get'()
.annotate 'line', 10013
    $P18 = $P5.'isstring'()
    isfalse $I3, $P18
    unless $I3 goto __label_23
.annotate 'line', 10014
    WSubId_41('string literal', $P5)
  __label_23: # endif
.annotate 'line', 10015
    WSubId_55(';', __ARG_1)
.annotate 'line', 10016
    new $P21, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P21.'StringLiteral'(self, $P5)
    set $P20, $P21
    $P19 = $P20.'getPirString'()
    self.'addlib'($P19)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10019
    WSubId_42("token", $P5)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9957
    $P5 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10022
    $P11 = $P5.'iseof'()
    if_null $P11, __label_24
    unless $P11 goto __label_24
.annotate 'line', 10023
    self.'unclosed_ns'()
    goto __label_25
  __label_24: # else
.annotate 'line', 10025
    self.'close_ns'($P5)
  __label_25: # endif
# }
.annotate 'line', 10026

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 10029
    getattribute $P1, self, 'items'
    WSubId_39($P1)
# }
.annotate 'line', 10030

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 10033
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 10035
# activate: $I1
    set $I1, 1
.annotate 'line', 10037
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10038
    if_null $P2, __label_1
# {
.annotate 'line', 10039
    __ARG_1.'emitnamespace'($P1)
.annotate 'line', 10040
    null $I1
.annotate 'line', 10041
    WSubId_53(__ARG_1, $P2)
# }
  __label_1: # endif
.annotate 'line', 10044
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
# {
.annotate 'line', 10045
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 10046
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 10047
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10049
    unless $I1 goto __label_7
# {
.annotate 'line', 10050
    __ARG_1.'emitnamespace'($P1)
.annotate 'line', 10051
    null $I1
# }
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10053
    $P3.'emit'(__ARG_1)
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 10055

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9743
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9745
    addattribute $P0, 'nspath'
.annotate 'line', 9746
    addattribute $P0, 'externals'
.annotate 'line', 9747
    addattribute $P0, 'namespaces'
.annotate 'line', 9748
    addattribute $P0, 'classes'
.annotate 'line', 9749
    addattribute $P0, 'functions'
.annotate 'line', 9750
    addattribute $P0, 'functions_name'
.annotate 'line', 9751
    addattribute $P0, 'items'
.annotate 'line', 9752
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
.annotate 'line', 10073
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 10074
# predefined push
    push $P1, __ARG_4
.annotate 'line', 10075
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10077
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10078
    setattribute self, 'start', __ARG_2
.annotate 'line', 10079
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10080
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 10081
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10082
    if_null __ARG_5, __label_1
# {
.annotate 'line', 10083
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 10084
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 10086

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10089
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10090

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10093
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 10094

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10097
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 10098

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10101
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 10102

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10105
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 10106

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10109
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10110
    unless_null $P1, __label_1
.annotate 'line', 10111
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10112
    .return($P1)
# }
.annotate 'line', 10113

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10116
# var sym: $P1
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10117
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10118
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10119
    .return($P1)
# }
.annotate 'line', 10120

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10123
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 10124

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10131
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 10132
    if_null $P1, __label_1
.annotate 'line', 10133
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10134
    self.'optimize_base'()
.annotate 'line', 10135
    .return(self)
# }
.annotate 'line', 10136

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10139
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10140
    if_null $P1, __label_1
.annotate 'line', 10141
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 10143
    self.'emit_base'(__ARG_1)
.annotate 'line', 10145
    if_null $P1, __label_2
.annotate 'line', 10146
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 10147

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10062
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10064
    addattribute $P0, 'parent'
.annotate 'line', 10065
    addattribute $P0, 'start'
.annotate 'line', 10066
    addattribute $P0, 'name'
.annotate 'line', 10067
    addattribute $P0, 'modifier'
.annotate 'line', 10068
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10164
    new $P1, ['ResizableStringArray']
.annotate 'line', 10165
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10166
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10167
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 10168
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 10169

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10172
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10173
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10174

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10177
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10178
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 10179

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10183
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 10184
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 10185

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10189
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 10190
    unless_null $P1, __label_1
.annotate 'line', 10191
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10192
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10193

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10196
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 10197
    unless_null $P1, __label_1
.annotate 'line', 10198
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10199
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10200

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10203
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 10204

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10207
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 10208

.end # scopesearch


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10215
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 10216

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10219
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10220

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10223
    self.'optimize_base'()
.annotate 'line', 10224
    .return(self)
# }
.annotate 'line', 10225

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10228
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10231
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10232
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10235
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
.annotate 'line', 10238
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10239
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10240
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10241
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10244
# somelib: $I1
    null $I1
.annotate 'line', 10245
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10246
    if_null $P3, __label_5
# {
.annotate 'line', 10247
    set $I1, 1
.annotate 'line', 10248
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10249
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10252
# someload: $I2
    null $I2
.annotate 'line', 10253
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10254
    if_null $P4, __label_8
# {
.annotate 'line', 10255
    set $I2, 1
.annotate 'line', 10256
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10257
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10258
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10259
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10261
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10262
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10264
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10265

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10268
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10269
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10270
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10271
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 10272
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 10273
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10275
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10276
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10278

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10154
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10156
    addattribute $P0, 'unit'
.annotate 'line', 10157
    addattribute $P0, 'predefs_used'
.annotate 'line', 10158
    addattribute $P0, 'libs'
.annotate 'line', 10159
    addattribute $P0, 'loads'
.annotate 'line', 10160
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10290
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10291
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10292

.end # Builtin


.sub 'getname' :method
# Body
# {
# predefined string
.annotate 'line', 10293
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10296
    getattribute $P1, self, 'variants'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10297

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10286
    addattribute $P0, 'name'
.annotate 'line', 10287
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
# Body
# {
.annotate 'line', 10307
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
# }
.annotate 'line', 10308

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10311
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10312
# name: $S1
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10313
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 10314
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 10316
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
# }
.annotate 'line', 10317

.end # add


.sub 'put' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10320
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10321
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10322
    getattribute $P3, __ARG_1, 'functions'
    $P4 = $P1[$S1]
# predefined push
    push $P3, $P4
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10323

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 10304
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_116 = "WSubId_116"
# Body
# {
.annotate 'line', 10333
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 10334
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10338
    WSubId_115($P1, 'false', 0)
.annotate 'line', 10339
    WSubId_115($P1, 'true', 1)
.annotate 'line', 10344
# predefined string
# predefined int
.annotate 'line', 10345
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
.annotate 'line', 10344
    WSubId_108($P1, '__STAGE__', $S1)
.annotate 'line', 10347
    WSubId_115($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 10350
    WSubId_115($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10353
# var builtins_ns: $P2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 10355
# var builder: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 10356
    WSubId_116($P3)
.annotate 'line', 10357
    $P3.'put'($P2)
.annotate 'line', 10359
    $P1.'usenamespace'($P2)
.annotate 'line', 10361
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10362

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 10365
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10366

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10369
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10370
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10371

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10374
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10375

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10378
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10379
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10380
    __ARG_1.'say'('')
.annotate 'line', 10382
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10384
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10385

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10388
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10389
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10391
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10393
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10394

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10328
    addattribute $P0, 'rootns'
.annotate 'line', 10329
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
# Body
# {
.annotate 'line', 10403
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 2
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 10404
    .return($P1)
# }
.annotate 'line', 10405

.end # version


.sub 'version_string' :method
# Body
# {
# predefined string
.annotate 'line', 10408
    $P1 = self.'version'()
# predefined join
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
# }
.annotate 'line', 10409

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
# Body
# {
.annotate 'line', 10412
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10413
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10414
# var handleout: $P1
    null $P1
.annotate 'line', 10415
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10416
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10417
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10420
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10421
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10422
    unless __ARG_4 goto __label_4
.annotate 'line', 10423
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 10424
    __ARG_1.'emit'($P2)
.annotate 'line', 10425
    $P2.'close'()
.annotate 'line', 10426
    if_null __ARG_3, __label_5
.annotate 'line', 10427
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 10429
    $P1.'close'()
.annotate 'line', 10430
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10431
# var object: $P3
    null $P3
# switch
.annotate 'line', 10432
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 10434
    new $P3, [ 'String' ]
.annotate 'line', 10435
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 10439
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 10440
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 10441
# predefined string
.annotate 'line', 10443
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 10445
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 10447

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10450
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10451
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10452
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10453
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10454
    $P2.'close'()
.annotate 'line', 10455
    $P1.'close'()
.annotate 'line', 10456
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10457

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
.annotate 'line', 10465
    unless_null __ARG_2, __label_1
.annotate 'line', 10466
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10467
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10468
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10469
    $P1.'puts'(__ARG_1)
.annotate 'line', 10470
    $P1.'close'()
.annotate 'line', 10471
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10472
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10473
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10474
    $P3.'parse'($P2)
.annotate 'line', 10475
    $P1.'close'()
.annotate 'line', 10476
    $P3.'optimize'()
.annotate 'line', 10477
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10478
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10480
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10481

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
.annotate 'line', 10490
    unless_null __ARG_2, __label_1
.annotate 'line', 10491
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10492
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10493
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10494
    $P1.'encoding'('utf8')
.annotate 'line', 10495
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10496
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10497
    $P3.'parse'($P2)
.annotate 'line', 10498
    $P1.'close'()
.annotate 'line', 10499
    $P3.'optimize'()
.annotate 'line', 10500
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10501
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10503
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10504

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10513
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10514
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10515

.end # initializer

# End generated code
