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
    iseq $I3, __ARG_1, ' '
    if $I3 goto __label_3
    iseq $I4, __ARG_1, "\n"
    set $I2, $I4
    goto __label_4
  __label_3:
    set $I2, $I3
  __label_4:
    if $I2 goto __label_1
    iseq $I5, __ARG_1, "\t"
    set $I1, $I5
    goto __label_2
  __label_1:
    set $I1, $I2
  __label_2:
    .return($I1)
# }
.annotate 'line', 23

.end # isspace


.sub 'isdigit' :subid('WSubId_9')
        .param string __ARG_1
# Body
# {
.annotate 'line', 27
# builtin indexof
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
# builtin indexof
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
# builtin indexof
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
# builtin indexof
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

.sub 'Warn' :subid('WSubId_21')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
# Body
# {
.annotate 'line', 87
# var stderr: $P1
# builtin getstderr
    getstderr $P1
.annotate 'line', 88
    $P1.'print'('WARNING: ')
.annotate 'line', 89
    $P1.'print'(__ARG_1)
.annotate 'line', 90
    if_null __ARG_2, __label_1
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
    concat $S2, __ARG_1, ' near '
    concat $S2, $S2, $S1
    set __ARG_1, $S2
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
    new $P6, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P6.'WinxedCompilerError'('internal', __ARG_1)
    set $P5, $P6
    set $P1, $P5
  __label_3:
.annotate 'line', 107
# builtin Error
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
# builtin string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# builtin string
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
# builtin Error
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
# builtin string
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S4, ' near ', $S3
    set $S2, $S4
.annotate 'line', 122
# builtin string
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
# builtin Error
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


.sub 'NoLeftSide' :subid('WSubId_67')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 130
    WSubId_1('Not a left-side expression', __ARG_1)
# }
.annotate 'line', 131

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_48')
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


.sub 'Unexpected' :subid('WSubId_49')
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


.sub 'RequireIdentifier' :subid('WSubId_102')
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


.sub 'ExpectOp' :subid('WSubId_62')
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


.sub 'ExpectKeyword' :subid('WSubId_104')
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


.sub 'UndefinedVariable' :subid('WSubId_69')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 185
# builtin string
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
# builtin string
    getattribute $P1, self, 'file'
    set $S2, $P1
# builtin string
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
# builtin string
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
# builtin string
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
# builtin string
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
# builtin string
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
# builtin unescape
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
# builtin escape
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
# builtin string
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
# builtin string
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
    concat $S5, '\', $S2
    set $S2, $S5
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
    islt $I6, $I2, 32
    if $I6 goto __label_5
    isgt $I7, $I2, 127
    set $I5, $I7
    goto __label_6
  __label_5:
    set $I5, $I6
  __label_6:
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
    unless $I1 goto __label_7
# {
.annotate 'line', 400
    set $S2, '"'
.annotate 'line', 401
# result: $S3
    set $S3, ''
.annotate 'line', 402
    box $P1, $S1
    if_null $P1, __label_9
    iter $P3, $P1
    set $P3, 0
  __label_8: # for iteration
    unless $P3 goto __label_9
    shift $S4, $P3
# {
.annotate 'line', 403
    ne $S4, '\', __label_10
.annotate 'line', 404
    concat $S3, $S3, '\\'
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 407
# n: $I4
# builtin ord
    ord $I4, $S4
.annotate 'line', 408
    islt $I6, $I4, 32
    if $I6 goto __label_14
    isgt $I7, $I4, 127
    set $I5, $I7
    goto __label_15
  __label_14:
    set $I5, $I6
  __label_15:
    unless $I5 goto __label_12
# {
.annotate 'line', 409
    le $I4, 127, __label_16
.annotate 'line', 410
    set $I3, 1
  __label_16: # endif
.annotate 'line', 411
# h: $S5
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_17
    set $S5, $P1
  __label_17:
.annotate 'line', 412
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 415
    concat $S3, $S3, $S4
  __label_13: # endif
# }
  __label_11: # endif
# }
    goto __label_8
  __label_9: # endfor
.annotate 'line', 418
    set $S1, $S3
# }
  __label_7: # endif
.annotate 'line', 420
    concat $S6, $S2, $S1
    concat $S6, $S6, $S2
    set $S1, $S6
.annotate 'line', 421
    unless $I3 goto __label_18
.annotate 'line', 422
    concat $S6, 'utf8:', $S1
    set $S1, $S6
  __label_18: # endif
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
# builtin int
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
    iseq $I2, $S3, ''
    if $I2 goto __label_11
    iseq $I3, $S3, "\n"
    set $I1, $I3
    goto __label_12
  __label_11:
    set $I1, $I2
  __label_12:
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
    iseq $I2, $S2, ""
    if $I2 goto __label_5
    iseq $I3, $S2, "\n"
    set $I1, $I3
    goto __label_6
  __label_5:
    set $I1, $I2
  __label_6:
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
    concat $S7, '\', $S2
    set $S2, $S7
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 510
    concat $S5, $S1, $S2
    set $S1, $S5
# }
  __label_1: # for iteration
.annotate 'line', 499
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 512
    concat $S5, $S1, ':>>'
    set $S1, $S5
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
    concat $S7, '\', $S2
    set $S2, $S7
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
    iseq $I4, $S1, '0'
    unless $I4 goto __label_5
    iseq $I6, $S2, 'x'
    if $I6 goto __label_7
    iseq $I7, $S2, 'X'
    set $I5, $I7
    goto __label_8
  __label_7:
    set $I5, $I6
  __label_8:
    set $I3, $I5
    goto __label_6
  __label_5:
    set $I3, $I4
  __label_6:
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
  __label_11: # for condition
    $P2 = WSubId_10($S2)
    set $I2, $P2
    lt $I2, 0, __label_10
# {
.annotate 'line', 556
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 557
    concat $S1, $S1, $S2
# }
  __label_9: # for iteration
.annotate 'line', 555
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_11
  __label_10: # for end
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
    ne $S2, '.', __label_12
# {
  __label_14: # do
.annotate 'line', 564
# {
.annotate 'line', 565
    concat $S1, $S1, $S2
.annotate 'line', 566
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_16: # continue
.annotate 'line', 567
    $P1 = WSubId_9($S2)
    if_null $P1, __label_15
    if $P1 goto __label_14
  __label_15: # enddo
.annotate 'line', 568
    iseq $I4, $S2, 'e'
    if $I4 goto __label_18
    iseq $I5, $S2, 'E'
    set $I3, $I5
    goto __label_19
  __label_18:
    set $I3, $I4
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 569
    concat $S1, $S1, 'E'
.annotate 'line', 570
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I4, $S2, '+'
    if $I4 goto __label_21
    iseq $I5, $S2, '-'
    set $I3, $I5
    goto __label_22
  __label_21:
    set $I3, $I4
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 571
    concat $S1, $S1, $S2
.annotate 'line', 572
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_20: # endif
# for loop
  __label_25: # for condition
.annotate 'line', 574
    $P1 = WSubId_9($S2)
    if_null $P1, __label_24
    unless $P1 goto __label_24
.annotate 'line', 575
    concat $S1, $S1, $S2
  __label_23: # for iteration
.annotate 'line', 574
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_25
  __label_24: # for end
# }
  __label_17: # endif
.annotate 'line', 577
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 578
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_13
  __label_12: # else
# {
.annotate 'line', 581
    iseq $I4, $S2, 'e'
    if $I4 goto __label_28
    iseq $I5, $S2, 'E'
    set $I3, $I5
    goto __label_29
  __label_28:
    set $I3, $I4
  __label_29:
    unless $I3 goto __label_26
# {
.annotate 'line', 582
    concat $S1, $S1, 'E'
.annotate 'line', 583
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I4, $S2, '+'
    if $I4 goto __label_31
    iseq $I5, $S2, '-'
    set $I3, $I5
    goto __label_32
  __label_31:
    set $I3, $I4
  __label_32:
    unless $I3 goto __label_30
# {
.annotate 'line', 584
    concat $S1, $S1, $S2
.annotate 'line', 585
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_30: # endif
# for loop
  __label_35: # for condition
.annotate 'line', 587
    $P1 = WSubId_9($S2)
    if_null $P1, __label_34
    unless $P1 goto __label_34
.annotate 'line', 588
    concat $S1, $S1, $S2
  __label_33: # for iteration
.annotate 'line', 587
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_35
  __label_34: # for end
.annotate 'line', 589
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 590
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_27
  __label_26: # else
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
  __label_27: # endif
# }
  __label_13: # endif
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
    isne $I2, $S2, ''
    unless $I2 goto __label_5
    isne $I3, $S2, "\n"
    set $I1, $I3
    goto __label_6
  __label_5:
    set $I1, $I2
  __label_6:
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
    isne $I2, $S2, ''
    unless $I2 goto __label_8
    isne $I3, $S2, '*'
    set $I1, $I3
    goto __label_9
  __label_8:
    set $I1, $I2
  __label_9:
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
    ne $S2, '', __label_10
.annotate 'line', 615
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 616
    concat $S1, $S1, $S2
.annotate 'line', 617
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 618
    ne $S2, '', __label_11
.annotate 'line', 619
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_11: # endif
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
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
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
    isnull $I3, $P2
    not $I3
    unless $I3 goto __label_10
    isa $I4, $P2, 'Hash'
    set $I2, $I4
    goto __label_11
  __label_10:
    set $I2, $I3
  __label_11:
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
    unless_null $P2, __label_12
# {
.annotate 'line', 720
    self.'ungetchar'($S1)
.annotate 'line', 721
    $P2 = $P1['']
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 724
    concat $S2, $S2, $S1
  __label_13: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 726
    if_null $P2, __label_15
.annotate 'line', 727
    $P3 = $P2(self, $S2, $I1)
    goto __label_14
  __label_15:
.annotate 'line', 728
    $P4 = WSubId_12(self, $S2, $I1)
    set $P3, $P4
  __label_14:
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
    $P3 = $P1.'iseof'()
    isfalse $I2, $P3
    unless $I2 goto __label_5
    not $I3, __ARG_1
    set $I1, $I3
    goto __label_6
  __label_5:
    set $I1, $I2
  __label_6:
    unless $I1 goto __label_3
    $P4 = $P1.'iscomment'()
    set $P2, $P4
    goto __label_4
  __label_3:
    box $P2, $I1
  __label_4:
    if_null $P2, __label_1
    unless $P2 goto __label_1
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
# builtin push
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

.sub 'typetoregcheck' :subid('WSubId_105')
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


.sub 'typetopirname' :subid('WSubId_115')
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
        .param int __ARG_2
# Body
# {
.annotate 'line', 802
    setattribute self, 'handle', __ARG_1
.annotate 'line', 803
    box $P1, ""
    setattribute self, 'file', $P1
.annotate 'line', 804
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 805
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 806
    box $P1, 0
    setattribute self, 'pendingl', $P1
.annotate 'line', 807
    not $I1, __ARG_2
    new $P2, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P2
# }
.annotate 'line', 808

.end # Emit


.sub 'setDebug' :method
# Body
# {
.annotate 'line', 811
    box $P1, 1
    setattribute self, 'debug', $P1
# }
.annotate 'line', 812

.end # setDebug


.sub 'getDebug' :method
# Body
# {
.annotate 'line', 815
    getattribute $P1, self, 'debug'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 816

.end # getDebug


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 819
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 820

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 823
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 824

.end # close


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 827
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 828
    WSubId_21(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 829

.end # warn


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 832
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 833
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'file', '"
.annotate 'line', 835
    getattribute $P4, self, 'file'
.annotate 'line', 833
    $P3[1] = $P4
    $P3[2] = "'\n"
# builtin join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 838
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 840
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 841
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'line', "
.annotate 'line', 843
    getattribute $P4, self, 'line'
.annotate 'line', 841
    $P3[1] = $P4
    $P3[2] = "\n"
# builtin join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 846
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 848

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 851
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 852
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 853

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 856
    self.'updateannot'()
.annotate 'line', 857
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 858

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 861
    self.'updateannot'()
.annotate 'line', 862
    self.'vprint'(__ARG_1)
.annotate 'line', 863
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 864

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 867
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 869
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 870
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 871
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 872
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 873
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 874
    assign $P1, $S1
.annotate 'line', 875
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 876
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 878
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 879
    assign $P2, $I1
.annotate 'line', 880
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 883

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 886
    self.'updateannot'()
.annotate 'line', 887
    getattribute $P1, self, 'handle'
    concat $S1, "# ", __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 888

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 891
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 892
    $P1.'print'('  ')
.annotate 'line', 893
    $P1.'print'(__ARG_1)
.annotate 'line', 894
    $P1.'print'(":")
.annotate 'line', 895
    if_null __ARG_2, __label_1
.annotate 'line', 896
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 897
    $P1.'print'("\n")
# }
.annotate 'line', 898

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 901
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 902
    $P1.'print'("    goto ")
.annotate 'line', 903
    $P1.'print'(__ARG_1)
.annotate 'line', 904
    if_null __ARG_2, __label_1
.annotate 'line', 905
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 906
    $P1.'print'("\n")
# }
.annotate 'line', 907

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 911
    self.'say'('    ', __ARG_1, " ", __ARG_2)
# }
.annotate 'line', 912

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 915
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 916

.end # emitarg2


.sub 'emitarg3' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 919
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 920

.end # emitarg3


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 923
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 924

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 927
    self.'say'("    if ", __ARG_1, " goto ", __ARG_2)
# }
.annotate 'line', 928

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 931
    self.'say'("    unless ", __ARG_1, " goto ", __ARG_2)
# }
.annotate 'line', 932

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 935
    self.'say'("    if_null ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 936

.end # emitif_null


.sub 'emitunless_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 939
    self.'say'("    unless_null ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 940

.end # emitunless_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 943
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 944

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 948
    self.'say'("    inc ", __ARG_1)
# }
.annotate 'line', 949

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 952
    self.'say'("    dec ", __ARG_1)
# }
.annotate 'line', 953

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 956
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 957

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 960
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 961

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 964
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 965

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 968
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 969

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 972
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 973

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 976
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 977

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 980
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 981

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 984
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 985

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 988
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 989

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 992
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 993

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 996
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 997

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1000
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 1001

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1004
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 1005

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1008
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 1009

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1012
    self.'say'("    print ", __ARG_1)
# }
.annotate 'line', 1013

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1016
    self.'say'("    say ", __ARG_1)
# }
.annotate 'line', 1017

.end # emitsay


.sub 'emitget_hll_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1020
    concat $S1, ", ", __ARG_2
    self.'say'("    get_hll_namespace ", __ARG_1, $S1)
# }
.annotate 'line', 1021

.end # emitget_hll_namespace


.sub 'emitget_root_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1024
    concat $S1, ", ", __ARG_2
    self.'say'("    get_root_namespace ", __ARG_1, $S1)
# }
.annotate 'line', 1025

.end # emitget_root_namespace


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 1028
    self.'print'("    get_hll_global ", __ARG_1)
.annotate 'line', 1029
    if_null __ARG_3, __label_1
.annotate 'line', 1030
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1031
    self.'say'(", '", __ARG_2, "'")
# }
.annotate 'line', 1032

.end # emitget_hll_global


.sub 'emitget_root_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 1035
    self.'print'("    get_root_global ", __ARG_1)
.annotate 'line', 1036
    if_null __ARG_3, __label_1
.annotate 'line', 1037
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1038
    self.'say'(", '", __ARG_2, "'")
# }
.annotate 'line', 1039

.end # emitget_root_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1042
    self.'say'("    find_lex ", __ARG_1, ", '", __ARG_2, "'")
# }
.annotate 'line', 1043

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1046
    self.'say'("    store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 1047

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
    addattribute $P0, 'debug'
.annotate 'line', 797
    addattribute $P0, 'noan'
.annotate 'line', 798
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant SEARCH_NAMESPACE evaluated at compile time
# Constant SEARCH_CLASS evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time

.sub 'integerValue' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 1072
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 1073

.end # integerValue


.sub 'floatValue' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 1077
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 1078
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 1079

.end # floatValue


.sub 'stringQuotedValue' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1083
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenQuoted'($P2, $P3, __ARG_3)
.annotate 'line', 1084
    new $P3, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P3.'StringLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 1085

.end # stringQuotedValue


.sub 'floatresult' :subid('WSubId_73')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1093
# result: $I1
    iseq $I3, __ARG_1, 'N'
    unless $I3 goto __label_3
    iseq $I5, __ARG_2, 'N'
    if $I5 goto __label_5
    iseq $I6, __ARG_2, 'I'
    set $I4, $I6
    goto __label_6
  __label_5:
    set $I4, $I5
  __label_6:
    set $I2, $I4
    goto __label_4
  __label_3:
    set $I2, $I3
  __label_4:
    if $I2 goto __label_1
.annotate 'line', 1094
    iseq $I8, __ARG_2, 'N'
    unless $I8 goto __label_7
    iseq $I10, __ARG_1, 'N'
    if $I10 goto __label_9
    iseq $I11, __ARG_1, 'I'
    set $I9, $I11
    goto __label_10
  __label_9:
    set $I9, $I10
  __label_10:
    set $I7, $I9
    goto __label_8
  __label_7:
    set $I7, $I8
  __label_8:
    set $I1, $I7
    goto __label_2
  __label_1:
    set $I1, $I2
  __label_2:
.annotate 'line', 1095
    .return($I1)
# }
.annotate 'line', 1096

.end # floatresult


.sub 'floatAsString' :subid('WSubId_68')
        .param num __ARG_1
# Body
# {
.annotate 'line', 1106
# aux: $S1
    null $S1
    set $S1, __ARG_1
.annotate 'line', 1108
    box $P2, $S1
    $P1 = $P2.'is_integer'($S1)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 1109
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1110
    .return($S1)
# }
.annotate 'line', 1111

.end # floatAsString

# Constant PREDEFCONST_FILENAME evaluated at compile time
# Constant PREDEFCONST_LINENUM evaluated at compile time

.sub 'createPredefConstInt' :subid('WSubId_125')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1122
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1123
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1124
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1125
    $P3 = WSubId_22(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1126

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_118')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1130
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1131
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1132
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1133
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1134
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1133
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1135

.end # createPredefConstString

# Constant BULTIN_arglist evaluated at compile time
# Constant BULTIN_raw1 evaluated at compile time

.sub 'string_from_literal' :subid('WSubId_24')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1149
# value: $S1
    null $S1
# switch-case
.annotate 'line', 1151
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1154
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1157
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1152
    getattribute $P1, __ARG_1, 'numval'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1155
    $P2 = __ARG_1.'getFloatValue'()
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1158
    $P3 = __ARG_1.'get_value'()
    set $S1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1161
    WSubId_6('wrong call to string_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1163
    .return($S1)
# }
.annotate 'line', 1164

.end # string_from_literal


.sub 'int_from_literal' :subid('WSubId_25')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1168
# value: $I1
    null $I1
# switch-case
.annotate 'line', 1170
    $I2 = __ARG_1.'isintegerliteral'()
    if $I2 goto __label_3
.annotate 'line', 1173
    $I2 = __ARG_1.'isfloatliteral'()
    if $I2 goto __label_4
.annotate 'line', 1176
    $I2 = __ARG_1.'isstringliteral'()
    if $I2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1171
    getattribute $P1, __ARG_1, 'numval'
    set $I1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1174
    $P2 = __ARG_1.'getFloatValue'()
    set $I1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1177
    $P3 = __ARG_1.'get_value'()
    set $I1, $P3
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1180
    WSubId_6('wrong call to int_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1182
    .return($I1)
# }
.annotate 'line', 1183

.end # int_from_literal


.sub 'float_from_literal' :subid('WSubId_106')
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1187
# value: $N1
    null $N1
# switch-case
.annotate 'line', 1189
    $I1 = __ARG_1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1190
    $I1 = __ARG_1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1193
    $I1 = __ARG_1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
  __label_4: # case
.annotate 'line', 1191
    $P1 = __ARG_1.'getFloatValue'()
    set $N1, $P1
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1194
    $P2 = __ARG_1.'get_value'()
    set $N1, $P2
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1197
    WSubId_6('wrong call to float_from_literal', __ARG_1)
  __label_1: # switch end
.annotate 'line', 1199
    .return($N1)
# }
.annotate 'line', 1200

.end # float_from_literal

.namespace [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]

.sub 'Builtin_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1220
# l: $I2
# builtin length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1221
# builtin substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1222
# builtin substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1223
# builtin split
    split $P1, "\n", __ARG_2
# builtin join
    join $S1, "\n    ", $P1
    concat $S2, '    ', $S1
    set __ARG_2, $S2
.annotate 'line', 1224
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1225
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1226

.end # Builtin_frombody


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
.annotate 'line', 1229
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1231
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1232
    isnull $I2, __ARG_4
    not $I2
    unless $I2 goto __label_5
    isne $I3, __ARG_4, ''
    set $I1, $I3
    goto __label_6
  __label_5:
    set $I1, $I2
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 1233
    WSubId_1('using return value from void builtin')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1236
    isnull $I2, __ARG_4
    if $I2 goto __label_8
    iseq $I3, __ARG_4, ''
    set $I1, $I3
    goto __label_9
  __label_8:
    set $I1, $I2
  __label_9:
    unless $I1 goto __label_7
.annotate 'line', 1237
    WSubId_6('Bad result in non void builtin')
  __label_7: # endif
# }
  __label_3: # endif
.annotate 'line', 1240
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1241
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_4, __ARG_5 :flat)
.annotate 'line', 1242
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1243
# builtin string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1244

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
.annotate 'line', 1206
    addattribute $P0, 'body'
.annotate 'line', 1207
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
# Body
# {
.annotate 'line', 1265
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1266
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1267
    new $P3, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
    $P3.'Builtin_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1269
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1270
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1271
# n: $I1
    null $I1
.annotate 'line', 1272
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1273
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1274
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1276
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1279
    set $I1, -2
.annotate 'line', 1280
    if_null __ARG_5, __label_8
.annotate 'line', 1281
    concat $S3, "Invalid builtin '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1284
    set $I1, 1
.annotate 'line', 1285
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1286
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1287
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1289
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1290
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1291
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1293
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1294
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1295
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1299
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1300

.end # BuiltinBase


.sub 'iscompileevaluable' :method
# Body
# {
.annotate 'line', 1303
    .return(0)
# }
.annotate 'line', 1304

.end # iscompileevaluable


.sub 'name' :method
# Body
# {
.annotate 'line', 1307
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1308
    .return($S1)
# }
.annotate 'line', 1309

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1312
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1313

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1314
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1317
# type: $S1
    null $S1
# switch
.annotate 'line', 1318
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
.annotate 'line', 1319
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1320
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1321
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1322
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1324
    WSubId_6('Invalid builtin arg')
  __label_1: # switch end
.annotate 'line', 1326
    .return($S1)
# }
.annotate 'line', 1327

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1330
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1333
    eq $S1, '__ASSERT__', __label_2
.annotate 'line', 1334
    concat $S3, 'builtin ', $S1
    __ARG_1.'comment'($S3)
  __label_2: # endif
.annotate 'line', 1336
# typeresult: $S2
    getattribute $P2, self, 'typeresult'
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 1337
    isne $I2, $S2, 'v'
    unless $I2 goto __label_5
    iseq $I3, __ARG_4, ''
    set $I1, $I3
    goto __label_6
  __label_5:
    set $I1, $I2
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 1338
    $P2 = __ARG_2.'tempreg'($S2)
    set __ARG_4, $P2
  __label_4: # endif
.annotate 'line', 1339
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1340
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1341

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
.annotate 'line', 1249
    addattribute $P0, 'name'
.annotate 'line', 1250
    addattribute $P0, 'body'
.annotate 'line', 1251
    addattribute $P0, 'typeresult'
.annotate 'line', 1252
    addattribute $P0, 'type0'
.annotate 'line', 1253
    addattribute $P0, 'type1'
.annotate 'line', 1254
    addattribute $P0, 'type2'
.annotate 'line', 1255
    addattribute $P0, 'type3'
.annotate 'line', 1256
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
# Body
# {
.annotate 'line', 1353
    self.'BuiltinBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1354

.end # BuiltinFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1344
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
# Body
# {
.annotate 'line', 1367
    self.'BuiltinBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1368
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1369

.end # BuiltinFunctionEval


.sub 'iscompileevaluable' :method
# Body
# {
.annotate 'line', 1372
    .return(1)
# }
.annotate 'line', 1373

.end # iscompileevaluable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1357
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
.annotate 'line', 1359
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]

.sub 'Builtin_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1381
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1382

.end # Builtin_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1385
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1386
# builtin elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1387
    WSubId_6("Invalid Builtin_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1388
# var rawarg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1389
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1391
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1392
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1393
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1396
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1397
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1399
    ne $S3, 'null', __label_9
.annotate 'line', 1400
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1402
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1404

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
.annotate 'line', 1378
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'builtineval_stringcast' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_23 = "WSubId_23"
.const 'Sub' WSubId_24 = "WSubId_24"
# Body
# {
.annotate 'line', 1409
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1410
    $P2 = WSubId_24($P1)
    .tailcall WSubId_23(__ARG_1, __ARG_2, $P2)
# }
.annotate 'line', 1411

.end # builtineval_stringcast


.sub 'builtineval_intcast' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1415
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1416
# value: $I1
    $P2 = WSubId_25($P1)
    set $I1, $P2
.annotate 'line', 1417
    .tailcall WSubId_22(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1418

.end # builtineval_intcast


.sub 'Builtin_varcast' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
.annotate 'line', 1422
# builtin elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1423
    WSubId_6("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1424
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1425
# argtype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 1426
    ne $S1, 'P', __label_3
# {
.annotate 'line', 1427
# name: $S2
    null $S2
.annotate 'line', 1428
# var sym: $P2
    null $P2
# switch-case
.annotate 'line', 1430
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1446
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1431
    $P7 = $P1.'getName'()
    set $S2, $P7
.annotate 'line', 1432
# id: $S3
    $P8 = $P1.'checkIdentifier'()
    null $S3
    if_null $P8, __label_9
    set $S3, $P8
  __label_9:
.annotate 'line', 1433
# var desc: $P3
    $P3 = $P1.'checkVar'()
.annotate 'line', 1434
    isne $I4, $S3, ''
    unless $I4 goto __label_14
    isnull $I5, $P3
    not $I5
    set $I3, $I5
    goto __label_15
  __label_14:
    set $I3, $I4
  __label_15:
    unless $I3 goto __label_12
    $P9 = $P3.'issubid'()
    isfalse $I6, $P9
    set $I2, $I6
    goto __label_13
  __label_12:
    set $I2, $I3
  __label_13:
    unless $I2 goto __label_10
# {
.annotate 'line', 1436
    $P1.'emit'(__ARG_1, __ARG_4)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 1439
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 1
    $P7[0] = $S2
    $P2 = $P1.'scopesearch'($P7, 0)
.annotate 'line', 1440
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_17
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    set $I1, $I3
    goto __label_18
  __label_17:
    set $I1, $I2
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 1441
# var path: $P4
    getattribute $P7, $P2, 'owner'
    $P4 = $P7.'getpath'()
.annotate 'line', 1442
    $P7 = WSubId_26($P4)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_16: # endif
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1449
    new $P5, ['ResizableStringArray']
.annotate 'line', 1450
    $P1.'buildkey'($P5)
.annotate 'line', 1451
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1452
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_20
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    set $I1, $I3
    goto __label_21
  __label_20:
    set $I1, $I2
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 1453
# var path: $P6
    getattribute $P7, $P2, 'owner'
    $P6 = $P7.'getpath'()
.annotate 'line', 1454
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1455
    $P7 = WSubId_26($P6)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_19: # endif
.annotate 'line', 1457
    $P7 = $P5.'pop'()
    set $S2, $P7
.annotate 'line', 1458
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1459
    $P8 = WSubId_26($P5)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P8)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1462
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1463
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 1467
# reg: $S4
    $P7 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_22
    set $S4, $P7
  __label_22:
.annotate 'line', 1468
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1469
    ne $S4, 'null', __label_23
.annotate 'line', 1470
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_24
  __label_23: # else
.annotate 'line', 1472
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_24: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 1474

.end # Builtin_varcast


.sub 'Builtin_say' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1478
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1479
# n: $I1
# builtin elements
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1480
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1481
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1482
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1481
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1483
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1486
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1487

.end # Builtin_say


.sub 'Builtin_cry' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1491
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1492
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1493
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1494
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1495
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1496

.end # Builtin_cry


.sub 'Builtin_print' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1500
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1501
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1502
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1503

.end # Builtin_print


.sub 'Builtin_ASSERT' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1509
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1510
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1511
# label: $S1
    $P3 = __ARG_2.'genlabel'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 1512
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1513
# var reg: $P2
    $P2 = $P1.'emit_getint'(__ARG_1)
.annotate 'line', 1514
    __ARG_1.'emitif'($P2, $S1)
.annotate 'line', 1515
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1516
    $P3 = __ARG_3.'filename'()
    __ARG_1.'say'('    ', "print $P0, \"Assertion failed at '", $P3, "' line \"")
.annotate 'line', 1517
    $P3 = __ARG_3.'linenum'()
    __ARG_1.'say'('    ', "print $P0, ", $P3)
.annotate 'line', 1518
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
.annotate 'line', 1519
    __ARG_1.'say'('    ', "exit 1")
.annotate 'line', 1520
    __ARG_1.'emitlabel'($S1)
# }
  __label_1: # endif
# }
.annotate 'line', 1522

.end # Builtin_ASSERT


.sub 'Builtin_invoke' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1528
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1529
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1530
    WSubId_1("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1531
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1532

.end # Builtin_invoke


.sub 'builtineval_length' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1536
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1537
# s: $S1
    $P2 = WSubId_24($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1538
# builtin length
    length $I1, $S1
    .tailcall WSubId_22(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1539

.end # builtineval_length


.sub 'builtineval_bytelength' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1543
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1544
# s: $S1
    $P2 = WSubId_24($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1545
# builtin bytelength
    bytelength $I1, $S1
    .tailcall WSubId_22(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1546

.end # builtineval_bytelength


.sub 'builtineval_ord' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1550
# nargs: $I1
# builtin elements
    elements $I1, __ARG_3
.annotate 'line', 1551
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1552
# s: $S1
    $P3 = WSubId_24($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1553
# pos: $I2
    null $I2
.annotate 'line', 1554
    le $I1, 1, __label_2
# {
.annotate 'line', 1555
# var argpos: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1556
    $P3 = WSubId_25($P2)
    set $I2, $P3
# }
  __label_2: # endif
.annotate 'line', 1558
# builtin ord
    ord $I3, $S1, $I2
    .tailcall WSubId_22(__ARG_1, __ARG_2, $I3)
# }
.annotate 'line', 1559

.end # builtineval_ord


.sub 'builtineval_chr' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_23 = "WSubId_23"
.const 'Sub' WSubId_25 = "WSubId_25"
# Body
# {
.annotate 'line', 1563
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1564
    $P2 = WSubId_25($P1)
    set $I1, $P2
# builtin chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    .tailcall WSubId_23(__ARG_1, __ARG_2, $S1)
# }
.annotate 'line', 1565

.end # builtineval_chr


.sub 'builtineval_substr' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_23 = "WSubId_23"
# Body
# {
.annotate 'line', 1569
# nargs: $I1
# builtin elements
    elements $I1, __ARG_3
.annotate 'line', 1570
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1571
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1572
# str: $S1
    $P4 = WSubId_24($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1573
# pos: $I2
    $P4 = WSubId_25($P2)
    set $I2, $P4
.annotate 'line', 1574
# result: $S2
    null $S2
.annotate 'line', 1575
    set $I4, __ARG_3
    le $I4, 2, __label_2
# {
.annotate 'line', 1576
# var arglen: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1577
# len: $I3
    $P4 = WSubId_25($P3)
    set $I3, $P4
.annotate 'line', 1578
# builtin substr
    substr $S2, $S1, $I2, $I3
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 1581
# builtin substr
    substr $S2, $S1, $I2
  __label_3: # endif
.annotate 'line', 1582
    .tailcall WSubId_23(__ARG_1, __ARG_2, $S2)
# }
.annotate 'line', 1583

.end # builtineval_substr


.sub 'builtineval_indexof' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1587
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1588
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1589
# strfrom: $S1
    $P3 = WSubId_24($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1590
# strsearch: $S2
    $P3 = WSubId_24($P2)
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1591
# builtin indexof
    index $I1, $S1, $S2
    .tailcall WSubId_22(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1592

.end # builtineval_indexof


.sub 'builtineval_indexof_pos' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1596
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1597
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1598
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1599
# strfrom: $S1
    $P4 = WSubId_24($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1600
# strsearch: $S2
    $P4 = WSubId_24($P2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1601
# pos: $I1
    $P6 = __ARG_3[2]
    getattribute $P5, $P6, 'arg'
    $P4 = WSubId_25($P5)
    set $I1, $P4
.annotate 'line', 1602
# builtin indexof
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_22(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1603

.end # builtineval_indexof_pos


.sub 'builtineval_escape' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_23 = "WSubId_23"
.const 'Sub' WSubId_24 = "WSubId_24"
# Body
# {
.annotate 'line', 1607
# var argstrfrom: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1611
    $P2 = WSubId_24($P1)
    set $S3, $P2
# builtin escape
    escape $S2, $S3
# builtin escape
    escape $S1, $S2
.annotate 'line', 1610
    .tailcall WSubId_23(__ARG_1, __ARG_2, $S1)
# }
.annotate 'line', 1612

.end # builtineval_escape


.sub 'builtin_sleep' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1616
# var expr: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1617
# reg: $S1
    null $S1
.annotate 'line', 1618
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
# switch
.annotate 'line', 1619
    set $S4, $S2
    set $S5, 'I'
    if $S4 == $S5 goto __label_4
    set $S5, 'N'
    if $S4 == $S5 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 1621
    $P2 = $P1.'emit_getint'(__ARG_1)
    set $S1, $P2
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 1624
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 1627
    $P4 = $P1.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 1628
    set $S1, "0"
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 1630
# aux: $S3
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 1631
    $P2 = __ARG_2.'tempreg'('N')
    set $S1, $P2
.annotate 'line', 1632
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1633
    __ARG_1.'emitset'($S1, $S3)
# }
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 1636
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1637
    __ARG_1.'emitarg1'('sleep', $S1)
# }
.annotate 'line', 1638

.end # builtin_sleep


.sub 'getbuiltins' :subid('WSubId_126')
        .param pmc __ARG_1
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
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 1642
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1644
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('I')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('int', WSubId_27, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1642
    __ARG_1.'add'($P1)
.annotate 'line', 1647
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1648
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('N')
    set $P3, $P4
    $P2.'BuiltinFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1647
    __ARG_1.'add'($P1)
.annotate 'line', 1651
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1653
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('S')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('string', WSubId_28, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1651
    __ARG_1.'add'($P1)
.annotate 'line', 1656
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1657
    $P2.'BuiltinFunction'('var', WSubId_29, 'P', '!')
    set $P1, $P2
.annotate 'line', 1656
    __ARG_1.'add'($P1)
.annotate 'line', 1660
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1664
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1668
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1672
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1676
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1677
    $P2.'BuiltinFunction'('sleep', WSubId_30, 'v', '!')
    set $P1, $P2
.annotate 'line', 1676
    __ARG_1.'add'($P1)
.annotate 'line', 1680
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1684
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1688
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1692
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1696
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1703
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1710
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1717
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1725
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1734
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1744
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1748
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1749
    $P2.'BuiltinFunctionEval'('length', WSubId_31, 'length %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1748
    __ARG_1.'add'($P1)
.annotate 'line', 1753
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1754
    $P2.'BuiltinFunctionEval'('bytelength', WSubId_32, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1753
    __ARG_1.'add'($P1)
.annotate 'line', 1758
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1759
    $P2.'BuiltinFunctionEval'('chr', WSubId_33, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
.annotate 'line', 1758
    __ARG_1.'add'($P1)
.annotate 'line', 1767
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1768
    $P2.'BuiltinFunctionEval'('ord', WSubId_34, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1767
    __ARG_1.'add'($P1)
.annotate 'line', 1772
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1773
    $P2.'BuiltinFunctionEval'('ord', WSubId_34, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1772
    __ARG_1.'add'($P1)
.annotate 'line', 1777
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1778
    $P2.'BuiltinFunctionEval'('substr', WSubId_35, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1777
    __ARG_1.'add'($P1)
.annotate 'line', 1782
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1783
    $P2.'BuiltinFunctionEval'('substr', WSubId_35, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
.annotate 'line', 1782
    __ARG_1.'add'($P1)
.annotate 'line', 1787
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1791
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1792
    $P2.'BuiltinFunctionEval'('indexof', WSubId_36, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1791
    __ARG_1.'add'($P1)
.annotate 'line', 1796
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1797
    $P2.'BuiltinFunctionEval'('indexof', WSubId_37, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1796
    __ARG_1.'add'($P1)
.annotate 'line', 1801
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1805
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1806
    $P2.'BuiltinFunctionEval'('escape', WSubId_38, 'escape %0, %1', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1805
    __ARG_1.'add'($P1)
.annotate 'line', 1810
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1818
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1826
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1833
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1840
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1844
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1848
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1852
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1856
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1863
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1870
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1874
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1878
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1882
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1886
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1890
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1894
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1898
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1902
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1906
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1910
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1914
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1918
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1922
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1935
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1939
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1943
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1947
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1951
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1955
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1959
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1963
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1967
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1971
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1975
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1982
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1989
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1993
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1997
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2001
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2005
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 2009
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2010
    $P2.'BuiltinFunction'('print', WSubId_39, 'v', '*')
    set $P1, $P2
.annotate 'line', 2009
    __ARG_1.'add'($P1)
.annotate 'line', 2013
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2014
    $P2.'BuiltinFunction'('say', WSubId_40, 'v', '*')
    set $P1, $P2
.annotate 'line', 2013
    __ARG_1.'add'($P1)
.annotate 'line', 2017
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2018
    $P2.'BuiltinFunction'('cry', WSubId_41, 'v', '*')
    set $P1, $P2
.annotate 'line', 2017
    __ARG_1.'add'($P1)
.annotate 'line', 2021
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2022
    $P2.'BuiltinFunction'('__ASSERT__', WSubId_42, 'v', '!')
    set $P1, $P2
.annotate 'line', 2021
    __ARG_1.'add'($P1)
.annotate 'line', 2025
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 2026
    $P2.'BuiltinFunction'('invoke', WSubId_43, 'P', '!')
    set $P1, $P2
.annotate 'line', 2025
    __ARG_1.'add'($P1)
# }
.annotate 'line', 2029

.end # getbuiltins


.sub 'optimize_array' :subid('WSubId_46')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2037
    if_null __ARG_1, __label_1
# {
.annotate 'line', 2038
# n: $I1
# builtin elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 2039
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 2040
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 2039
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 2042

.end # optimize_array


.sub 'emit_array' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2046
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 2047
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2048

.end # emit_array


.sub 'parseDotted' :subid('WSubId_63')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2052
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2053
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2054
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2055
# builtin push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 2056
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 2057
    $P2 = __ARG_1.'get'()
.annotate 'line', 2058
# builtin push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 2061
    __ARG_1.'unget'($P2)
.annotate 'line', 2062
    .return($P1)
# }
.annotate 'line', 2063

.end # parseDotted


.sub 'parseList' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2071
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2072
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 2073
# {
.annotate 'line', 2074
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 2075
# builtin push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 2076
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 2077
    unless_null __ARG_4, __label_4
.annotate 'line', 2078
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2080
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 2081
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 2082
    .return($P1)
# }
.annotate 'line', 2083

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 2088
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2089
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2090
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 2091
    .return($P1)
# }
.annotate 'line', 2092

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_64')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2096
    new $P1, ['ResizableStringArray']
.annotate 'line', 2097
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 2098
    $P4 = $P2.'getidentifier'()
# builtin push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2099
    .return($P1)
# }
.annotate 'line', 2100

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2113
    setattribute self, 'start', __ARG_1
.annotate 'line', 2114
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 2115

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 2118
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2119
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2121
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 2122

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 2125
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2126
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2128
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 2129

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 2132
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2133
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2135
    .return("")
  __label_2: # endif
# }
.annotate 'line', 2136

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2139
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 2140

.end # annotate


.sub 'getpath' :method
# Body
# {
.annotate 'line', 2143
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()
# }
.annotate 'line', 2144

.end # getpath


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2147
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
# }
.annotate 'line', 2148

.end # use_builtin


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 2151
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 2152

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2155
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 2156

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2159
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 2160

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 2163
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2164

.end # scopesearch


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 2167
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 2168

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 2108
    addattribute $P0, 'start'
.annotate 'line', 2109
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2185
    setattribute self, 'owner', __ARG_1
.annotate 'line', 2186
    setattribute self, 'e', __ARG_2
# }
.annotate 'line', 2187

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2191
# var e: $P1
    getattribute $P1, self, 'e'
.annotate 'line', 2192
# valuereg: $S1
    null $S1
.annotate 'line', 2193
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2194
# var pnull: $P2
    getattribute $P2, self, 'pnull'
.annotate 'line', 2195
    unless_null $P2, __label_3
# {
.annotate 'line', 2196
# regnull: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2197
    $P1.'emitnull'($S2)
.annotate 'line', 2198
    box $P2, $S2
    setattribute self, 'pnull', $P2
# }
  __label_3: # endif
.annotate 'line', 2200
    set $S1, $P2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 2203
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2204
    .return($S1)
# }
.annotate 'line', 2205

.end # add

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
.annotate 'line', 2180
    addattribute $P0, 'owner'
.annotate 'line', 2181
    addattribute $P0, 'e'
.annotate 'line', 2182
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 2220
    $P2 = WSubId_44(__ARG_1, __ARG_2, WSubId_45, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 2221

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2225
    getattribute $P1, self, 'args'
# builtin elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 2226

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 2229
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2230
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 2231

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 2235
    getattribute $P1, self, 'args'
    WSubId_46($P1)
# }
.annotate 'line', 2236

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2239
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2240
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2241
    $P5 = $P2.'emit_get'(__ARG_1)
# builtin push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2242
    .return($P1)
# }
.annotate 'line', 2243

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2246
    $P1 = self.'getargvalues'(__ARG_1)
# builtin join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 2247

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2216
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 2259
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2262
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2263
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2264
    .return($I1)
# }
.annotate 'line', 2265

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2268
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2269
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2270
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2271
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 2272

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2275
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2276
    if_null __ARG_2, __label_1
.annotate 'line', 2277
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 2278

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2281
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2282
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2283
    .return(self)
# }
.annotate 'line', 2284

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2256
    addattribute $P0, 'name'
.annotate 'line', 2257
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2289
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2290
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2291
    $P1 = __ARG_1.'get'()
.annotate 'line', 2292
# var args: $P2
    null $P2
.annotate 'line', 2293
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2294
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2296
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2297
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2298

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_47 = "WSubId_47"
# Body
# {
.annotate 'line', 2307
    $P2 = WSubId_44(__ARG_1, __ARG_2, WSubId_47, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2308

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 2311
    getattribute $P1, self, 'list'
    WSubId_46($P1)
# }
.annotate 'line', 2312

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2313
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2316
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2317
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2318
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2320
    .return($P2)
# }
.annotate 'line', 2321

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2303
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_26')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2330
# r: $S1
    null $S1
.annotate 'line', 2331
# builtin elements
    elements $I1, __ARG_1
    unless $I1 goto __label_1
.annotate 'line', 2332
# builtin string
# builtin join
    join $S2, "'; '", __ARG_1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 2333
    .return($S1)
# }
.annotate 'line', 2334

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2338
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2340
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2342
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2344
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2341
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2343
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2345
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2347
    __ARG_2.'unget'($P1)
.annotate 'line', 2348
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2350

.end # parseUsing


.sub 'parseSig' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 2354
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2355
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2356
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2357
    WSubId_48("'='", $P2)
  __label_1: # endif
.annotate 'line', 2358
# var expr: $P3
    $P3 = WSubId_45(__ARG_2, __ARG_3)
.annotate 'line', 2359
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2360

.end # parseSig


.sub 'parseClassSpecifier' :subid('WSubId_70')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2364
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2365
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2366
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 2367
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 2368
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 2369
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2370
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 2371
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 2372

.end # parseClassSpecifier


.sub 'parseStatement' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
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
# Body
# {
.annotate 'line', 2376
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2377
# var t2: $P2
    null $P2
.annotate 'line', 2378
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2379
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2380
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2381
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2382
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2383
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2384
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 2385
# var open: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2386
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2387
    WSubId_49("':'", $P1)
  __label_5: # endif
.annotate 'line', 2388
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2391
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
.annotate 'line', 2393
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2395
    .tailcall WSubId_52($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2398
    .tailcall WSubId_53($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2401
    $P2 = __ARG_1.'get'()
.annotate 'line', 2402
    __ARG_1.'unget'($P2)
.annotate 'line', 2403
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2404
    .tailcall WSubId_54($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2407
    $P2 = __ARG_1.'get'()
.annotate 'line', 2408
    __ARG_1.'unget'($P2)
.annotate 'line', 2409
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2410
    .tailcall WSubId_55($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2413
    $P2 = __ARG_1.'get'()
.annotate 'line', 2414
    __ARG_1.'unget'($P2)
.annotate 'line', 2415
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2416
    .tailcall WSubId_56($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2419
    $P2 = __ARG_1.'get'()
.annotate 'line', 2420
    __ARG_1.'unget'($P2)
.annotate 'line', 2421
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2422
    .tailcall WSubId_57($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2425
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2427
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2429
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2431
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2433
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2435
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2437
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2439
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2441
    .tailcall WSubId_58($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2443
    .tailcall WSubId_59($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2445
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2447
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2450
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
# {
.annotate 'line', 2451
# var t2: $P4
    $P4 = __ARG_1.'get'()
.annotate 'line', 2452
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2453
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2454
    __ARG_1.'unget'($P4)
# }
  __label_31: # endif
.annotate 'line', 2456
    __ARG_1.'unget'($P1)
.annotate 'line', 2457
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 2458

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2468
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2469

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2470
    .return(0)
# }

.end # isempty


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 2473
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
# }
.annotate 'line', 2474

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2477
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2478

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2481
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2482

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2485
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2486

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2489
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2490

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2493
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2494

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2497
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2498

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2501
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2502

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2505
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2506

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2509
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2510

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2513
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2514

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2517
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2518

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2521
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2522

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2525
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2526

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2533
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2534

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2537
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2538

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2541
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2542

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2545
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2547
    .return(self)
# }
.annotate 'line', 2548

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2464
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2553
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2556
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2557

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2558
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2551
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2571
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2572
# n: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 2573
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2574
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2575
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2576
    unless $I2 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I5, $P3
    set $I4, $I5
    goto __label_6
  __label_5:
    set $I4, $I2
  __label_6:
    unless $I4 goto __label_4
.annotate 'line', 2577
    null $I2
  __label_4: # endif
.annotate 'line', 2578
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2574
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2580
    unless $I2 goto __label_8
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_7
  __label_8:
    set $P3, self
  __label_7:
    .return($P3)
# }
.annotate 'line', 2581

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2567
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2588
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2589
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2590

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2591
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2594
    getattribute $P1, self, 'statements'
# builtin push
    push $P1, __ARG_1
.annotate 'line', 2595
    .return(self)
# }
.annotate 'line', 2596

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 2599
    getattribute $P1, self, 'statements'
    WSubId_60(__ARG_1, $P1)
# }
.annotate 'line', 2600

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2584
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
# switch-case
.annotate 'line', 2606
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2608
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2607
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2609
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2611
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 2613

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 2621
# var arg: $P1
    null $P1
.annotate 'line', 2622
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2623
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2624
    $P2 = __ARG_1.'get'()
.annotate 'line', 2625
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2626
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2629
    __ARG_1.'unget'($P2)
.annotate 'line', 2630
    $P1 = WSubId_45(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2632
    .return($P1)
# }
.annotate 'line', 2633

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_61 = "WSubId_61"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 2642
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2643
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2644
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2645
    unless $I1 goto __label_1
.annotate 'line', 2646
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2647
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2648
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2649
    $P1 = __ARG_2.'get'()
.annotate 'line', 2650
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2651
    __ARG_2.'unget'($P1)
.annotate 'line', 2652
    $P3 = WSubId_44(__ARG_2, __ARG_3, WSubId_61, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2654
    WSubId_62(';', __ARG_2)
# }
.annotate 'line', 2655

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 2658
    getattribute $P1, self, 'args'
    WSubId_46($P1)
.annotate 'line', 2659
    .return(self)
# }
.annotate 'line', 2660

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2663
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2664
    self.'annotate'(__ARG_1)
.annotate 'line', 2665
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2666
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2667
    __ARG_1.'print'('    ')
.annotate 'line', 2668
    unless_null $P1, __label_2
.annotate 'line', 2669
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2671
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2672
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2673
    $P4 = $P3.'emit_get'(__ARG_1)
# builtin push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2674
# builtin join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2676

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2635
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2637
    addattribute $P0, 'opname'
.annotate 'line', 2638
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 2688
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2689
# var path: $P1
    $P1 = WSubId_63(__ARG_2)
.annotate 'line', 2690
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2691
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2692
    WSubId_62(';', __ARG_2)
.annotate 'line', 2693
    $P3 = WSubId_64($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2694
    .return(self)
# }
.annotate 'line', 2695

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2696
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2699
    self.'annotate'(__ARG_1)
.annotate 'line', 2700
    getattribute $P1, self, 'path'
# builtin join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2701

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2683
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2685
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 2713
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2714
# var names: $P1
    null $P3
    $P1 = WSubId_44(__ARG_2, $P3, WSubId_65, ';')
.annotate 'line', 2715
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2716
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2717
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2719
    setattribute self, 'names', $P1
# }
.annotate 'line', 2720

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2723
    .return(self)
# }
.annotate 'line', 2724

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2727
    self.'annotate'(__ARG_1)
.annotate 'line', 2728
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2729
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2730
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2732

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2708
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2710
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 2746
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2747
# var path: $P1
    $P1 = WSubId_63(__ARG_2)
.annotate 'line', 2748
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2749
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2750
    WSubId_62(';', __ARG_2)
.annotate 'line', 2751
    setattribute self, 'path', $P1
# }
.annotate 'line', 2752

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2755
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2756
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2758
# var symbol: $P3
    $P3 = self.'scopesearch'($P1, 0)
# switch-case
.annotate 'line', 2760
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2774
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2761
# builtin elements
    elements $I2, $P1
    unless $I2 goto __label_5
# {
.annotate 'line', 2762
# var p: $P4
# builtin clone
    clone $P4, $P1
.annotate 'line', 2763
    $P4.'pop'()
.annotate 'line', 2764
# var ns: $P5
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2765
    if_null $P5, __label_6
# {
.annotate 'line', 2766
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2767
    if_null $P3, __label_7
# {
.annotate 'line', 2768
    self.'createvarused'($P2, $P3)
.annotate 'line', 2769
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
.annotate 'line', 2775
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2776
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2777
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2778
    self.'usesubid'($S1)
.annotate 'line', 2779
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2781
    self.'createvar'($P2, 'P')
.annotate 'line', 2782
    .return(self)
# }
.annotate 'line', 2783

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
.annotate 'line', 2786
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2787
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2788
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2789
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2790
    self.'annotate'(__ARG_1)
.annotate 'line', 2791
# key: $S2
    null $S2
.annotate 'line', 2792
# builtin elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2793
    $P1.'pop'()
.annotate 'line', 2794
    $P3 = WSubId_26($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2796
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2798

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2739
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2741
    addattribute $P0, 'path'
.annotate 'line', 2742
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2808
# var nskey: $P1
    $P1 = WSubId_63(__ARG_2)
.annotate 'line', 2809
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2810
    WSubId_48('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2811
# var nssym: $P2
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2812
    unless_null $P2, __label_2
.annotate 'line', 2813
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2814
    __ARG_3.'usenamespace'($P2)
# }
.annotate 'line', 2815

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 2821
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2822
    WSubId_66(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2823
    WSubId_62(';', __ARG_2)
# }
.annotate 'line', 2824

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2827
    .return(self)
# }
.annotate 'line', 2828

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2817
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 2843
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2844
    $P2 = WSubId_45(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2845
    WSubId_62(';', __ARG_2)
# }
.annotate 'line', 2846

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2849
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2850
    .return(self)
# }
.annotate 'line', 2851

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2854
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2855

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2838
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2840
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
.annotate 'line', 2872
    setattribute self, 'type', __ARG_1
.annotate 'line', 2873
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2874
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2875
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2876

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2879
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2880

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2881
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2882
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2883
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2884
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2885
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2886
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2887
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags


.sub 'issubid' :method
# Body
# {
.annotate 'line', 2890
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 2891
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_1
    set $S2, $P1
# builtin substr
    substr $S1, $S2, 0, 7
    iseq $I3, $S1, 'WSubId_'
    set $I1, $I3
    goto __label_2
  __label_1:
    set $I1, $I2
  __label_2:
    .return($I1)
# }
.annotate 'line', 2892

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2864
    addattribute $P0, 'type'
.annotate 'line', 2865
    addattribute $P0, 'reg'
.annotate 'line', 2866
    addattribute $P0, 'scope'
.annotate 'line', 2867
    addattribute $P0, 'flags'
.annotate 'line', 2868
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2900
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2901

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2904
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2905

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2897
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
.annotate 'line', 2914
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2915

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2916
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2919
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2920
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2921
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2922

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2908
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2910
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2933
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2934

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2937
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2938
# sname: $S1
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 2939
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2940
    if_null $P2, __label_2
.annotate 'line', 2941
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2942
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2943
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2944
    $P1[$S1] = $P3
.annotate 'line', 2945
    .return($P3)
# }
.annotate 'line', 2946

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2949
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2950
# sname: $S1
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 2951
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2952
    if_null $P2, __label_2
.annotate 'line', 2953
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2954
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2955

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2958
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2959
# sname: $S1
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 2960
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2961
    if_null $P2, __label_2
.annotate 'line', 2962
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2963
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2964

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2967
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2968
# sname: $S1
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 2969
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2970
    if_null $P2, __label_2
.annotate 'line', 2971
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2972
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2973
    $P1[$S1] = $P3
.annotate 'line', 2974
    .return($P3)
# }
.annotate 'line', 2975

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2978
# var locals: $P1
    getattribute $P1, self, 'locals'
# builtin string
.annotate 'line', 2979
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2980

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2983
# var sym: $P1
    null $P1
.annotate 'line', 2984
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2985
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2986
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2988
    .return($P3)
# }
.annotate 'line', 2989

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2992
# var sym: $P1
    null $P1
.annotate 'line', 2993
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2994
    .return($P1)
  __label_1: # endif
.annotate 'line', 2995
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2996
    .return($P1)
  __label_2: # endif
.annotate 'line', 2997
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2998
    if_null $P2, __label_3
.annotate 'line', 2999
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 3000
    .return($P3)
# }
.annotate 'line', 3001

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3004
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 3005
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3006
    .return($S1)
# }
.annotate 'line', 3007

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 3010
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 3012
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 3013
    .return('__WLEX_self')
# }
.annotate 'line', 3014

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2928
    addattribute $P0, 'locals'
.annotate 'line', 2929
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 3023
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
.annotate 'line', 3035
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 3036

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 3037
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 3038
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 3039
    .return(0)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
.annotate 'line', 3040
    .return(0)
# }

.end # isintegerzero


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 3041
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 3042
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3043
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3044
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 3045
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3046
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3049
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 3050

.end # tempreg


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 3053
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 3054

.end # genlabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3058
    .return(self)
# }
.annotate 'line', 3059

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 3060
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3063
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3064
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $P1 = self.'tempreg'($S1)
    set $S2, $P1
  __label_2:
.annotate 'line', 3065
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3066
    .return($S2)
# }
.annotate 'line', 3067

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3070
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3071
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 3072
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 3073

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3076
# reg: $S1
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3077
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
# {
.annotate 'line', 3078
# aux: $S2
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3079
    self.'annotate'(__ARG_1)
.annotate 'line', 3080
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 3081
    set $S1, $S2
# }
  __label_2: # endif
.annotate 'line', 3083
    .return($S1)
# }
.annotate 'line', 3084

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 3087
    WSubId_67(self)
# }
.annotate 'line', 3088

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 3031
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 3093
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 3091
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 3103
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3104
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 3105
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3106
    WSubId_48('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3107
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 3108

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3109
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3112
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3113
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3114
    .return(self)
# }
.annotate 'line', 3115

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3118
    self.'annotate'(__ARG_1)
.annotate 'line', 3119
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 3120
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3121
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3122
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 3123
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 3125
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3127

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3098
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3100
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
.annotate 'line', 3142
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3143
    .return(self)
# }
.annotate 'line', 3144

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 3147
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 3148

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3151
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3152
    .return(self)
# }
.annotate 'line', 3153

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 3156
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3157
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3158
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
.annotate 'line', 3159
    .return(0)
# }
.annotate 'line', 3160

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3163
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3165
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I2 goto __label_3
.annotate 'line', 3166
    isa $I3, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    set $I1, $I3
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_1
.annotate 'line', 3167
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3169
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
# switch
.annotate 'line', 3170
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_8
    set $S3, 'P'
    if $S2 == $S3 goto __label_9
    set $S3, 'I'
    if $S2 == $S3 goto __label_10
    set $S3, 'N'
    if $S2 == $S3 goto __label_11
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3173
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_10: # case
  __label_11: # case
.annotate 'line', 3176
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3179
    WSubId_6('Invalid if condition')
  __label_6: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3182

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3185
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3187
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I2 goto __label_3
.annotate 'line', 3188
    isa $I3, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    set $I1, $I3
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_1
.annotate 'line', 3189
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3191
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
# switch
.annotate 'line', 3192
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_8
    set $S3, 'P'
    if $S2 == $S3 goto __label_9
    set $S3, 'I'
    if $S2 == $S3 goto __label_10
    set $S3, 'N'
    if $S2 == $S3 goto __label_11
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3195
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_10: # case
  __label_11: # case
.annotate 'line', 3198
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3201
    WSubId_6('Invalid if condition')
  __label_6: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3204

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3139
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 3211
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 3212
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3209
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3222
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3223
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 3224

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 3225
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3226
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 3229
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3230
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3231
    .return($S1)
# }
.annotate 'line', 3232

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 3235
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3236
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3237
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3238
# builtin unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3239
    .return($S1)
# }
.annotate 'line', 3240

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3243
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 3244
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 3245

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3248
    .tailcall self.'getPirString'()
# }
.annotate 'line', 3249

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3217
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3219
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3260
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3261
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3262
# n: $I1
    set $I1, __ARG_3
.annotate 'line', 3263
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 3264

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 3265
    .return(1)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
# builtin int
.annotate 'line', 3268
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
# }
.annotate 'line', 3269

.end # isintegerzero


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3270
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 3273
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 3274

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3277
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3278
    .return($N1)
# }
.annotate 'line', 3279

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3282
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 3283
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3284
    if $I1 goto __label_2
.annotate 'line', 3285
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3287
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3289

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3292
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 3293

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3254
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3256
    addattribute $P0, 'pos'
.annotate 'line', 3257
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3303
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3304
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 3305

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 3306
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3307
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3310
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3311
    .return($N1)
# }
.annotate 'line', 3312

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3315
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3316
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3317
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3319

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 3322
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3323
    .tailcall WSubId_68($N1)
# }
.annotate 'line', 3324

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3298
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3300
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'concat_literal' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3334
# var etok: $P1
    getattribute $P1, __ARG_1, 'strval'
.annotate 'line', 3335
# var rtok: $P2
    getattribute $P2, __ARG_2, 'strval'
.annotate 'line', 3338
# var t: $P3
    $P5 = $P1.'issinglequoted'()
    unless $P5 goto __label_3
    $P6 = $P2.'issinglequoted'()
    set $P4, $P6
    goto __label_4
  __label_3:
    set $P4, $P5
  __label_4:
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 3340
    new $P7, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P8, $P1, 'file'
    getattribute $P9, $P1, 'line'
# builtin string
.annotate 'line', 3341
    getattribute $P10, $P1, 'str'
    set $S1, $P10
# builtin string
    getattribute $P11, $P2, 'str'
    set $S2, $P11
    concat $S3, $S1, $S2
    $P7.'TokenSingleQuoted'($P8, $P9, $S3)
    set $P3, $P7
    goto __label_1
  __label_2:
.annotate 'line', 3343
    new $P13, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P14, $P1, 'file'
    getattribute $P15, $P1, 'line'
# builtin string
.annotate 'line', 3344
    $P16 = $P1.'getasquoted'()
    set $S4, $P16
# builtin string
    $P17 = $P2.'getasquoted'()
    set $S5, $P17
    concat $S6, $S4, $S5
    $P13.'TokenQuoted'($P14, $P15, $S6)
    set $P12, $P13
    set $P3, $P12
  __label_1:
.annotate 'line', 3345
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 3346

.end # concat_literal

.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3354
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3357
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3358
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3359

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3362
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3363
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3364
    .return(0)
  __label_1: # endif
.annotate 'line', 3365
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3366

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3369
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3370
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3371
    if_null $P2, __label_1
.annotate 'line', 3372
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3374
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3377
    .return('P')
  __label_4: # default
.annotate 'line', 3379
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3382

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3385
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3386
    .return($S1)
# }
.annotate 'line', 3387

.end # getName


.sub 'checkVar' :method
# Body
# {
.annotate 'line', 3390
    getattribute $P1, self, 'owner'
# builtin string
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
# }
.annotate 'line', 3391

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3394
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3395
    unless_null $P1, __label_1
.annotate 'line', 3396
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3397
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3398
# s: $S1
    null $S1
.annotate 'line', 3399
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3400
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3403
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3405
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3409
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3410
    .return($S1)
# }
.annotate 'line', 3411

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_69 = "WSubId_69"
# Body
# {
.annotate 'line', 3414
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3415
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3416
    getattribute $P2, self, 'name'
    WSubId_69($P2)
  __label_1: # endif
.annotate 'line', 3417
    .return($P1)
# }
.annotate 'line', 3418

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3421
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3422
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3423
    if_null $P2, __label_1
# {
.annotate 'line', 3424
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3425
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3426
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3427
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3428
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3429
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3436
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3437
    isnull $I3, $P3
    not $I3
    unless $I3 goto __label_8
    set $S3, $P3
# builtin substr
    substr $S2, $S3, 0, 7
    iseq $I4, $S2, 'WSubId_'
    set $I2, $I4
    goto __label_9
  __label_8:
    set $I2, $I3
  __label_9:
    unless $I2 goto __label_7
.annotate 'line', 3438
# builtin string
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
.annotate 'line', 3442
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3443
    isnull $I3, $P4
    not $I3
    unless $I3 goto __label_11
    isa $I4, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    set $I2, $I4
    goto __label_12
  __label_11:
    set $I2, $I3
  __label_12:
    unless $I2 goto __label_10
# {
.annotate 'line', 3444
    $P5 = $P4.'ismulti'()
    isfalse $I5, $P5
    unless $I5 goto __label_13
# {
.annotate 'line', 3445
# id: $S1
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_14
    set $S1, $P6
  __label_14:
.annotate 'line', 3446
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3447
    self.'usesubid'($S1)
.annotate 'line', 3448
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_13: # endif
# }
  __label_10: # endif
# }
  __label_2: # endif
.annotate 'line', 3452
    .return(self)
# }
.annotate 'line', 3453

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3456
# id: $S1
    null $S1
.annotate 'line', 3457
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3458
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3460
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3461
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3462
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_3:
.annotate 'line', 3463
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3464
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3465
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3466
    isnull $I3, $S2
    not $I3
    unless $I3 goto __label_9
    isne $I4, $S2, ''
    set $I2, $I4
    goto __label_10
  __label_9:
    set $I2, $I3
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3467
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3471
    .return($S1)
# }
.annotate 'line', 3472

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3475
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3476
    self.'annotate'(__ARG_1)
.annotate 'line', 3477
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3478
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3480

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3483
    self.'annotate'(__ARG_1)
.annotate 'line', 3484
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3485

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3488
    self.'annotate'(__ARG_1)
.annotate 'line', 3489
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3490
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3491
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3492
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3493
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3494
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3497
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3500
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3503
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3504
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3506
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3507
    ne $S3, 'v', __label_13
.annotate 'line', 3508
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3509
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3510
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3513
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3514
    self.'annotate'(__ARG_1)
.annotate 'line', 3515
    iseq $I2, $S1, 'P'
    unless $I2 goto __label_19
    isne $I3, $S3, 'P'
    set $I1, $I3
    goto __label_20
  __label_19:
    set $I1, $I2
  __label_20:
    unless $I1 goto __label_17
.annotate 'line', 3516
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3518
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3521
    .return($S2)
# }
.annotate 'line', 3522

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3350
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3352
    addattribute $P0, 'name'
.annotate 'line', 3353
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3532
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3533
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3534

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3537
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3538

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3541
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3542
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3543
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3544
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3545
    .return($S2)
# }
.annotate 'line', 3546

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3549
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3550
    self.'annotate'(__ARG_1)
.annotate 'line', 3551
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3552
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3554

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3557
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3558
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3559
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3561
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3564
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3562
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3565
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3568
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3569
    iseq $I3, $S1, $S3
    if $I3 goto __label_10
    isne $I4, $S1, 'P'
    set $I2, $I4
    goto __label_11
  __label_10:
    set $I2, $I3
  __label_11:
    unless $I2 goto __label_8
.annotate 'line', 3570
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3572
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_12
    set $S4, $P3
  __label_12:
.annotate 'line', 3573
    self.'annotate'(__ARG_1)
.annotate 'line', 3574
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3578
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
.annotate 'line', 3579
    .return($S2)
# }
.annotate 'line', 3580

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3583
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3584

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3527
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3529
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3593
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3594

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3589
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 3604
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3605
    $P2 = WSubId_63(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3606
    getattribute $P1, self, 'key'
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3607
    WSubId_48('namespace identifier', __ARG_3)
  __label_1: # endif
# }
.annotate 'line', 3608

.end # OpNamespaceExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3609
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3612
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3613
# var sym: $P2
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3614
    unless_null $P2, __label_1
.annotate 'line', 3615
    getattribute $P4, self, 'start'
    WSubId_1('unknown namespace', $P4)
  __label_1: # endif
.annotate 'line', 3616
# var path: $P3
    $P3 = $P2.'getpath'()
.annotate 'line', 3617
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
# }
.annotate 'line', 3618

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3599
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3601
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
# Body
# {
.annotate 'line', 3629
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3630
    $P2 = WSubId_70(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3631

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3632
    .return('P')
# }

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3635
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3636
# var clspec: $P2
    getattribute $P2, self, 'clspec'
.annotate 'line', 3637
# var clkey: $P3
    null $P3
# switch-case
.annotate 'line', 3640
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
.annotate 'line', 3643
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    if $I1 goto __label_4
.annotate 'line', 3646
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 3641
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3642
    if_null $P3, __label_7
    getattribute $P4, $P3, 'path'
    goto __label_6
  __label_7:
    null $P4
  __label_6:
    .return($P4)
  __label_4: # case
.annotate 'line', 3644
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3645
    if_null $P3, __label_9
    getattribute $P5, $P3, 'path'
    goto __label_8
  __label_9:
    null $P5
  __label_8:
    .return($P5)
  __label_5: # case
.annotate 'line', 3647
# builtin string
# builtin typeof
    typeof $P6, $P2
    set $S1, $P6
    concat $S2, $S1, " not supported yet here"
.annotate 'line', 3648
    getattribute $P7, $P2, 'start'
.annotate 'line', 3647
    WSubId_1($S2, $P7)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3650
    getattribute $P4, $P2, 'start'
    WSubId_6("Unexpected class key", $P4)
# }
.annotate 'line', 3651

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3654
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3655
# var clspec: $P2
    getattribute $P2, self, 'clspec'
.annotate 'line', 3658
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3659
    getattribute $P4, self, 'owner'
    __ARG_2 = $P4.'tempreg'('P')
  __label_1: # endif
# switch-case
.annotate 'line', 3663
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 3664
# var clkey: $P3
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3665
    if_null $P3, __label_5
# {
.annotate 'line', 3666
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3667
    .return()
# }
  __label_5: # endif
    goto __label_2 # break
  __label_3: # default
  __label_2: # switch end
.annotate 'line', 3672
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3673
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3674
    __ARG_1.'say'()
# }
.annotate 'line', 3675

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3623
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3625
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3685
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3686
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3687

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3690
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3691

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3694
    self.'optimizearg'()
.annotate 'line', 3695
    .return(self)
# }
.annotate 'line', 3696

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3680
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3682
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
.annotate 'line', 3707
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3708
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3709
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3710

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3713
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3714
    .return(self)
# }
.annotate 'line', 3715

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3718
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3719

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3722
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3723
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3724

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3727
    self.'optimizearg'()
.annotate 'line', 3728
    .return(self)
# }
.annotate 'line', 3729

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3732
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3733

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3736
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3737

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3701
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3703
    addattribute $P0, 'lexpr'
.annotate 'line', 3704
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3746
    .return('I')
# }
.annotate 'line', 3747

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 3750
    self.'optimizearg'()
.annotate 'line', 3751
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3752
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3753
    $P4 = $P1.'isintegerliteral'()
    unless $P4 goto __label_2
    $P5 = $P2.'isintegerliteral'()
    set $P3, $P5
    goto __label_3
  __label_2:
    set $P3, $P4
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3754
# li: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 3755
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3756
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_22($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3758
    .return(self)
# }
.annotate 'line', 3759

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3742
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3768
    .return('I')
# }
.annotate 'line', 3769

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3764
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
.annotate 'line', 3777
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3778

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3781
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3782
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I2 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I3, $S1, 'S'
    set $I1, $I3
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_1
# {
.annotate 'line', 3783
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3784
    self.'annotate'(__ARG_1)
.annotate 'line', 3785
    __ARG_1.'print'('    delete ')
.annotate 'line', 3786
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3787
    __ARG_1.'say'()
.annotate 'line', 3788
    set $S1, __ARG_2
    eq $S1, '', __label_5
.annotate 'line', 3789
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_5: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3792
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3793

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3773
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
.annotate 'line', 3800
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3801

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3804
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3805
# reg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_2
    set $P2, __ARG_2
    goto __label_1
  __label_2:
    $P3 = self.'tempreg'('I')
    set $P2, $P3
  __label_1:
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 3806
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I2 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I3, $S2, 'S'
    set $I1, $I3
    goto __label_7
  __label_6:
    set $I1, $I2
  __label_7:
    unless $I1 goto __label_4
# {
.annotate 'line', 3807
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3808
    self.'annotate'(__ARG_1)
.annotate 'line', 3809
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3810
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3811
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3814
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3815

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3796
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
.annotate 'line', 3824
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3825

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3828
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3829

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3832
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3833
    .return(self)
# }
.annotate 'line', 3834

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 3837
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3838
    self.'optimizearg'()
.annotate 'line', 3839
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3840
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3841
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_22($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3844
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3845
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3846
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_71($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3849
    .return(self)
# }
.annotate 'line', 3850

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3853
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3854
    self.'annotate'(__ARG_1)
.annotate 'line', 3855
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3856

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3820
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
.annotate 'line', 3865
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3866

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3867
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3870
    .return('I')
# }
.annotate 'line', 3871

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3874
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3875
    .return(self)
# }
.annotate 'line', 3876

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 3879
    self.'optimizearg'()
.annotate 'line', 3880
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3881
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3882
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3883
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_22($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3885
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3886
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3887
    .return(self)
# }
.annotate 'line', 3888

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3891
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3892

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3895
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3896
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3897
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3898
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3900
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3903
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3906
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3908

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3861
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]

.sub 'OpBinNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3917
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3918

.end # OpBinNotExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3921
    .return('I')
# }
.annotate 'line', 3922

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3925
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3926
    .return(self)
# }
.annotate 'line', 3927

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 3930
    self.'optimizearg'()
.annotate 'line', 3931
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3932
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3933
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3934
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_22($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3936
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3937
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3938
    .return(self)
# }
.annotate 'line', 3939

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3942
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3943
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3944
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3945
    self.'annotate'(__ARG_1)
.annotate 'line', 3946
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
# }
  __label_2: # endif
# }
.annotate 'line', 3948

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 3913
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3957
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3958

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3961
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3962
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3963
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3964

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3953
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3973
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3974
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3975
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3976

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3969
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
.annotate 'line', 3983
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3984

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3987
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3988
    self.'annotate'(__ARG_1)
.annotate 'line', 3989
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3990
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3991
    .return($S1)
# }
.annotate 'line', 3992

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3979
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
.annotate 'line', 3999
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4000

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4003
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4004
    self.'annotate'(__ARG_1)
.annotate 'line', 4005
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4006
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4007
    .return($S1)
# }
.annotate 'line', 4008

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3995
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
.annotate 'line', 4017
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4018

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4021
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4022
    self.'annotate'(__ARG_1)
.annotate 'line', 4023
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 4024
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 4025
    __ARG_1.'emitinc'($S1)
.annotate 'line', 4026
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4027
    .return($S1)
# }
.annotate 'line', 4028

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 4013
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
.annotate 'line', 4035
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4036

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4039
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4040
    self.'annotate'(__ARG_1)
.annotate 'line', 4041
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 4042
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 4043
    __ARG_1.'emitdec'($S1)
.annotate 'line', 4044
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 4045
    .return($S1)
# }
.annotate 'line', 4046

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 4031
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
.annotate 'line', 4057
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4058
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 4059
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 4060
    .return(self)
# }
.annotate 'line', 4061

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4064
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 4065

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 4068
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 4069
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 4070
    .return(self)
# }
.annotate 'line', 4071

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4074
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 4075

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 4078
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4079
    $P3 = $P1.'isnull'()
    if $P3 goto __label_2
    $P4 = $P1.'isliteral'()
    set $P2, $P4
    goto __label_3
  __label_2:
    set $P2, $P3
  __label_3:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 4080
    WSubId_67($P1)
  __label_1: # endif
# }
.annotate 'line', 4081

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4084
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4085
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 4086
    self.'annotate'(__ARG_1)
.annotate 'line', 4087
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 4089

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 4051
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4053
    addattribute $P0, 'lexpr'
.annotate 'line', 4054
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4098
    self.'annotate'(__ARG_1)
.annotate 'line', 4099
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4100
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 4101

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 4094
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4110
    self.'annotate'(__ARG_1)
.annotate 'line', 4111
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4112
    isnull $I2, __ARG_2
    not $I2
    unless $I2 goto __label_3
    set $S2, __ARG_2
    isne $I3, $S2, ''
    set $I1, $I3
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_2
.annotate 'line', 4113
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 4114

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4117
    self.'checkleft'()
.annotate 'line', 4118
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4119
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 4120
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 4121
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 4122
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 4123
    self.'annotate'(__ARG_1)
.annotate 'line', 4124
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 4125
    .return($S1)
# }
.annotate 'line', 4126

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 4106
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4135
    self.'checkleft'()
.annotate 'line', 4136
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4137
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4138
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4139
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4140
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4141
    iseq $I2, $S1, 'S'
    unless $I2 goto __label_6
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    set $I1, $I3
    goto __label_7
  __label_6:
    set $I1, $I2
  __label_7:
    unless $I1 goto __label_4
.annotate 'line', 4142
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4144
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
.annotate 'line', 4145
# aux: $S5
    null $S5
.annotate 'line', 4146
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 4147
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_11
    set $S7, 'I'
    if $S6 == $S7 goto __label_12
    set $S7, 'N'
    if $S6 == $S7 goto __label_13
    goto __label_10
  __label_11: # case
.annotate 'line', 4149
    eq $S2, 'S', __label_14
# {
.annotate 'line', 4150
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4151
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4152
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 4154
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_9 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 4158
    eq $S1, $S2, __label_15
# {
.annotate 'line', 4159
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4160
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4161
    set $S4, $S5
# }
  __label_15: # endif
.annotate 'line', 4163
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 4166
    __ARG_1.'emitaddto'($S3, $S4)
  __label_9: # switch end
# }
  __label_5: # endif
.annotate 'line', 4169
    .return($S3)
# }
.annotate 'line', 4170

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 4131
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4179
    self.'checkleft'()
.annotate 'line', 4180
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4181
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4182
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4183
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4184
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4185
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4186
# aux: $S5
    null $S5
.annotate 'line', 4187
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 4188
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 4190
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4193
    eq $S1, $S2, __label_10
# {
.annotate 'line', 4194
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4195
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4196
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 4198
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 4201
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 4203
    .return($S3)
# }
.annotate 'line', 4204

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4175
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4213
    self.'checkleft'()
.annotate 'line', 4214
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4215
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4216
# lreg: $S1
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4217
# rreg: $S2
    null $S2
# switch
.annotate 'line', 4218
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    set $S4, 'S'
    if $S3 == $S4 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 4220
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4221
    self.'annotate'(__ARG_1)
.annotate 'line', 4222
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 4225
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4226
    self.'annotate'(__ARG_1)
.annotate 'line', 4227
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_2: # switch end
.annotate 'line', 4229
    .return($S1)
# }
.annotate 'line', 4230

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4209
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4239
    self.'checkleft'()
.annotate 'line', 4240
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4241
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4242
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4243
    self.'annotate'(__ARG_1)
.annotate 'line', 4244
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 4245
    .return($S2)
# }
.annotate 'line', 4246

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4235
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4255
    self.'checkleft'()
.annotate 'line', 4256
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4257
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4258
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4259
    self.'annotate'(__ARG_1)
.annotate 'line', 4260
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 4261
    .return($S2)
# }
.annotate 'line', 4262

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4251
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant COMPARATOR_DEFAULT evaluated at compile time
# Constant COMPARATOR_IF evaluated at compile time
# Constant COMPARATOR_ELSE evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4274
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 4277
    self.'optimizearg'()
.annotate 'line', 4278
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4279
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4280
    $P4 = $P1.'isintegerliteral'()
    unless $P4 goto __label_2
    $P5 = $P2.'isintegerliteral'()
    set $P3, $P5
    goto __label_3
  __label_2:
    set $P3, $P4
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 4281
# li: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4282
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4283
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_22($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 4285
    .return(self)
# }
.annotate 'line', 4286

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 4289
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4290
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4291
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4292
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4293
    self.'annotate'(__ARG_1)
.annotate 'line', 4294
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 4296
    iseq $I2, $S1, 'I'
    unless $I2 goto __label_8
    iseq $I3, $S2, 'N'
    set $I1, $I3
    goto __label_9
  __label_8:
    set $I1, $I2
  __label_9:
    if $I1 goto __label_7
.annotate 'line', 4301
    iseq $I4, $S1, 'N'
    unless $I4 goto __label_11
    iseq $I5, $S2, 'I'
    set $I1, $I5
    goto __label_12
  __label_11:
    set $I1, $I4
  __label_12:
    if $I1 goto __label_10
.annotate 'line', 4306
    iseq $I6, $S2, 'I'
    unless $I6 goto __label_14
    iseq $I7, $S1, 'P'
    set $I1, $I7
    goto __label_15
  __label_14:
    set $I1, $I6
  __label_15:
    if $I1 goto __label_13
.annotate 'line', 4311
    iseq $I8, $S2, 'P'
    unless $I8 goto __label_17
    iseq $I9, $S1, 'I'
    set $I1, $I9
    goto __label_18
  __label_17:
    set $I1, $I8
  __label_18:
    if $I1 goto __label_16
.annotate 'line', 4316
    iseq $I10, $S2, 'S'
    unless $I10 goto __label_20
    iseq $I11, $S1, 'P'
    set $I1, $I11
    goto __label_21
  __label_20:
    set $I1, $I10
  __label_21:
    if $I1 goto __label_19
.annotate 'line', 4321
    iseq $I12, $S2, 'P'
    unless $I12 goto __label_23
    iseq $I13, $S1, 'S'
    set $I1, $I13
    goto __label_24
  __label_23:
    set $I1, $I12
  __label_24:
    if $I1 goto __label_22
    goto __label_6
  __label_7: # case
.annotate 'line', 4297
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4298
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4299
    set $S3, $S5
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 4302
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4303
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4304
    set $S4, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4307
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4308
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4309
    set $S3, $S5
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 4312
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4313
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4314
    set $S4, $S5
    goto __label_5 # break
  __label_19: # case
.annotate 'line', 4317
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4318
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4319
    set $S3, $S5
    goto __label_5 # break
  __label_22: # case
.annotate 'line', 4322
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4323
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4324
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4325
# switch
.annotate 'line', 4328
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_27
    set $I2, 1
    if $I1 == $I2 goto __label_28
    set $I2, 2
    if $I1 == $I2 goto __label_29
    goto __label_26
  __label_27: # case
.annotate 'line', 4330
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_25 # break
  __label_28: # case
.annotate 'line', 4333
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_25 # break
  __label_29: # case
.annotate 'line', 4336
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_25 # break
  __label_26: # default
  __label_25: # switch end
.annotate 'line', 4337
# }
.annotate 'line', 4339

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4342
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4343

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4346
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4347

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4350
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 4351

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4272
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4362
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
# }
.annotate 'line', 4363

.end # Negable


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4364
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4367
# positive: $I1
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4368
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4369
    .return(self)
# }
.annotate 'line', 4370

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4358
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4384
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4385
    self.'Negable'(__ARG_3)
.annotate 'line', 4386
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 4387

.end # CheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4388
    .return('I')
# }

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4378
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4380
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4395
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4396

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4399
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4400
    self.'annotate'(__ARG_1)
.annotate 'line', 4401
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4402
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4403
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 4404

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4407
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4408
    self.'annotate'(__ARG_1)
.annotate 'line', 4409
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4410
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4412
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4413

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4391
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
.annotate 'line', 4420
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4421

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4424
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4425
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4426
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 4427
    self.'annotate'(__ARG_1)
.annotate 'line', 4428
    getattribute $P2, self, 'positive'
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 4429
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_4
  __label_3: # else
.annotate 'line', 4431
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_4: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 4433

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4436
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4437
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4438
    self.'annotate'(__ARG_1)
.annotate 'line', 4439
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4440
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4442
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4443

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4416
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
# Body
# {
.annotate 'line', 4452
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4453
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4454

.end # OpEqualExpr


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 4457
    self.'optimizearg'()
.annotate 'line', 4458
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4459
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4460
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4461
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4462
    unless $I1 goto __label_1
# {
.annotate 'line', 4463
    unless $I2 goto __label_2
.annotate 'line', 4464
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_22($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4466
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4468
    unless $I2 goto __label_4
.annotate 'line', 4469
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4470
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4471
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4472
    $P4 = $P1.'isliteral'()
    unless $P4 goto __label_8
    $P5 = $P2.'isliteral'()
    set $P3, $P5
    goto __label_9
  __label_8:
    set $P3, $P4
  __label_9:
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4473
    ne $S1, $S2, __label_10
# {
# switch
.annotate 'line', 4474
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_13
    set $S6, 'S'
    if $S5 == $S6 goto __label_14
    goto __label_12
  __label_13: # case
.annotate 'line', 4476
# li: $I3
    $P6 = $P1.'getIntegerValue'()
    set $I3, $P6
.annotate 'line', 4477
# ri: $I4
    $P7 = $P2.'getIntegerValue'()
    set $I4, $P7
.annotate 'line', 4478
# vi: $I5
    getattribute $P8, self, 'positive'
    if_null $P8, __label_16
    unless $P8 goto __label_16
    iseq $I5, $I3, $I4
    goto __label_15
  __label_16:
    isne $I5, $I3, $I4
  __label_15:
.annotate 'line', 4479
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    .tailcall WSubId_22($P9, $P10, $I5)
  __label_14: # case
.annotate 'line', 4481
# ls: $S3
    getattribute $P12, $P1, 'strval'
    getattribute $P11, $P12, 'str'
    null $S3
    if_null $P11, __label_17
    set $S3, $P11
  __label_17:
.annotate 'line', 4482
# rs: $S4
    getattribute $P14, $P2, 'strval'
    getattribute $P13, $P14, 'str'
    null $S4
    if_null $P13, __label_18
    set $S4, $P13
  __label_18:
.annotate 'line', 4483
# vs: $I6
    getattribute $P15, self, 'positive'
    if_null $P15, __label_20
    unless $P15 goto __label_20
    iseq $I6, $S3, $S4
    goto __label_19
  __label_20:
    isne $I6, $S3, $S4
  __label_19:
.annotate 'line', 4484
    getattribute $P16, self, 'owner'
    getattribute $P17, self, 'start'
    .tailcall WSubId_22($P16, $P17, $I6)
  __label_12: # default
  __label_11: # switch end
# }
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 4488
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4489
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4490
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_22
    unless $P3 goto __label_22
.annotate 'line', 4491
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_22: # endif
.annotate 'line', 4492
    .return(self)
# }
.annotate 'line', 4493

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4496
    self.'annotate'(__ARG_1)
.annotate 'line', 4497
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'iseq'
    goto __label_1
  __label_2:
    set $S1, 'isne'
  __label_1:
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4498

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4501
    self.'annotate'(__ARG_1)
.annotate 'line', 4502
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4503

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4506
    self.'annotate'(__ARG_1)
.annotate 'line', 4507
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'eq'
    goto __label_1
  __label_2:
    set $S1, 'ne'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4508

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4511
    self.'annotate'(__ARG_1)
.annotate 'line', 4512
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'ne'
    goto __label_1
  __label_2:
    set $S1, 'eq'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4513

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4448
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
# Body
# {
.annotate 'line', 4524
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4525
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4526

.end # OpSameExpr


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4529
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
.annotate 'line', 4530

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4533
    self.'annotate'(__ARG_1)
.annotate 'line', 4534
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4535
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4536
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4537

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4540
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4541

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4544
    self.'annotate'(__ARG_1)
.annotate 'line', 4545
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4546
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4547
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4548

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4551
    self.'annotate'(__ARG_1)
.annotate 'line', 4552
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4553
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4554
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4555

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4519
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4521
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4562
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4565
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4566

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4569
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4570

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4573
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4574

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4577
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4578

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4581
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4582

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4560
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4589
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4592
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4593

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4596
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4597

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4600
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4601

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4604
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4605

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4608
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4609

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4587
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4616
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4619
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4620

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4623
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4624

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4627
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4628

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4631
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4632

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4635
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4636

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4614
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4643
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4646
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4647

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4650
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4651

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4654
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4655

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4658
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4659

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4662
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4663

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4641
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4672
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    set $S2, $P1
    iseq $I2, $S2, 'I'
    unless $I2 goto __label_3
    getattribute $P4, self, 'rexpr'
    $P3 = $P4.'checkresult'()
    set $S3, $P3
    iseq $I3, $S3, 'I'
    set $I1, $I3
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_2
    set $S1, 'I'
    goto __label_1
  __label_2:
    set $S1, 'P'
  __label_1:
    .return($S1)
# }
.annotate 'line', 4674

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4668
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
.annotate 'line', 4683
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4684

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 4687
    self.'optimizearg'()
.annotate 'line', 4688
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4689
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4690
    unless $I1 goto __label_3
.annotate 'line', 4691
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4692
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_22($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4690
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4694
    .return(self)
# }
.annotate 'line', 4695

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4698
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4699
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4700
# type: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4701
# res: $S2
    if_null __ARG_2, __label_3
    set $P3, __ARG_2
    goto __label_2
  __label_3:
    $P4 = self.'tempreg'($S1)
    set $P3, $P4
  __label_2:
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4702
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    $P5 = $P1.'issimple'()
    set $P4, $P5
    goto __label_10
  __label_9:
    box $P4, $I1
  __label_10:
    unless $P4 goto __label_7
    $P6 = $P2.'issimple'()
    set $P3, $P6
    goto __label_8
  __label_7:
    set $P3, $P4
  __label_8:
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 4703
# lreg: $S3
    $P7 = self.'emit_intleft'(__ARG_1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
  __label_11:
.annotate 'line', 4704
# rreg: $S4
    $P3 = self.'emit_intright'(__ARG_1)
    null $S4
    if_null $P3, __label_12
    set $S4, $P3
  __label_12:
.annotate 'line', 4705
    __ARG_1.'emitbinop'('and', $S2, $S3, $S4)
# }
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 4708
# isfalse: $S5
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S5
    if_null $P3, __label_13
    set $S5, $P3
  __label_13:
.annotate 'line', 4709
# done: $S6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S6
    if_null $P3, __label_14
    set $S6, $P3
  __label_14:
.annotate 'line', 4710
# lres: $S7
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S7
    if_null $P3, __label_15
    set $S7, $P3
  __label_15:
.annotate 'line', 4711
    __ARG_1.'emitunless'($S7, $S5)
.annotate 'line', 4712
# rres: $S8
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S8
    if_null $P3, __label_16
    set $S8, $P3
  __label_16:
.annotate 'line', 4713
    iseq $I2, $S1, 'P'
    unless $I2 goto __label_19
    $P3 = $P2.'checkresult'()
    set $S9, $P3
    isne $I3, $S9, 'P'
    set $I1, $I3
    goto __label_20
  __label_19:
    set $I1, $I2
  __label_20:
    unless $I1 goto __label_17
.annotate 'line', 4714
    __ARG_1.'emitbox'($S2, $S8)
    goto __label_18
  __label_17: # else
.annotate 'line', 4716
    __ARG_1.'emitset'($S2, $S8)
  __label_18: # endif
.annotate 'line', 4717
    __ARG_1.'emitgoto'($S6)
.annotate 'line', 4718
    __ARG_1.'emitlabel'($S5)
.annotate 'line', 4719
    iseq $I2, $S1, 'P'
    unless $I2 goto __label_23
    $P3 = $P1.'checkresult'()
    set $S9, $P3
    isne $I3, $S9, 'P'
    set $I1, $I3
    goto __label_24
  __label_23:
    set $I1, $I2
  __label_24:
    unless $I1 goto __label_21
.annotate 'line', 4720
    __ARG_1.'emitbox'($S2, $S7)
    goto __label_22
  __label_21: # else
.annotate 'line', 4722
    __ARG_1.'emitset'($S2, $S7)
  __label_22: # endif
.annotate 'line', 4723
    __ARG_1.'emitlabel'($S6)
# }
  __label_6: # endif
# }
.annotate 'line', 4725

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4679
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
.annotate 'line', 4734
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4735

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 4738
    self.'optimizearg'()
.annotate 'line', 4739
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4740
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4741
    if $I1 goto __label_3
.annotate 'line', 4742
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4743
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_22($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4741
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4745
    .return(self)
# }
.annotate 'line', 4746

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4749
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4750
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4751
# type: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4752
# res: $S2
    if_null __ARG_2, __label_3
    set $P3, __ARG_2
    goto __label_2
  __label_3:
    $P4 = self.'tempreg'($S1)
    set $P3, $P4
  __label_2:
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4753
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    getattribute $P6, self, 'lexpr'
    $P5 = $P6.'issimple'()
    set $P4, $P5
    goto __label_10
  __label_9:
    box $P4, $I1
  __label_10:
    unless $P4 goto __label_7
    getattribute $P8, self, 'rexpr'
    $P7 = $P8.'issimple'()
    set $P3, $P7
    goto __label_8
  __label_7:
    set $P3, $P4
  __label_8:
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 4754
# lreg: $S3
    $P9 = self.'emit_intleft'(__ARG_1)
    null $S3
    if_null $P9, __label_11
    set $S3, $P9
  __label_11:
.annotate 'line', 4755
# rreg: $S4
    $P3 = self.'emit_intright'(__ARG_1)
    null $S4
    if_null $P3, __label_12
    set $S4, $P3
  __label_12:
.annotate 'line', 4756
    __ARG_1.'emitbinop'('or', $S2, $S3, $S4)
# }
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 4759
# istrue: $S5
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S5
    if_null $P3, __label_13
    set $S5, $P3
  __label_13:
.annotate 'line', 4760
# done: $S6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S6
    if_null $P3, __label_14
    set $S6, $P3
  __label_14:
.annotate 'line', 4761
# lres: $S7
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'emit_get'(__ARG_1)
    null $S7
    if_null $P3, __label_15
    set $S7, $P3
  __label_15:
.annotate 'line', 4762
    __ARG_1.'emitif'($S7, $S5)
.annotate 'line', 4763
# rres: $S8
    getattribute $P4, self, 'rexpr'
    $P3 = $P4.'emit_get'(__ARG_1)
    null $S8
    if_null $P3, __label_16
    set $S8, $P3
  __label_16:
.annotate 'line', 4764
    iseq $I2, $S1, 'P'
    unless $I2 goto __label_19
    $P3 = $P2.'checkresult'()
    set $S9, $P3
    isne $I3, $S9, 'P'
    set $I1, $I3
    goto __label_20
  __label_19:
    set $I1, $I2
  __label_20:
    unless $I1 goto __label_17
.annotate 'line', 4765
    __ARG_1.'emitbox'($S2, $S8)
    goto __label_18
  __label_17: # else
.annotate 'line', 4767
    __ARG_1.'emitset'($S2, $S8)
  __label_18: # endif
.annotate 'line', 4768
    __ARG_1.'emitgoto'($S6)
.annotate 'line', 4769
    __ARG_1.'emitlabel'($S5)
.annotate 'line', 4770
    iseq $I2, $S1, 'P'
    unless $I2 goto __label_23
    $P3 = $P1.'checkresult'()
    set $S9, $P3
    isne $I3, $S9, 'P'
    set $I1, $I3
    goto __label_24
  __label_23:
    set $I1, $I2
  __label_24:
    unless $I1 goto __label_21
.annotate 'line', 4771
    __ARG_1.'emitbox'($S2, $S7)
    goto __label_22
  __label_21: # else
.annotate 'line', 4773
    __ARG_1.'emitset'($S2, $S7)
  __label_22: # endif
.annotate 'line', 4774
    __ARG_1.'emitlabel'($S6)
# }
  __label_6: # endif
# }
.annotate 'line', 4776

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4730
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4781
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
.annotate 'line', 4791
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4792

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4795
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
    set $P1, $P2
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4796
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4797
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4798
    self.'annotate'(__ARG_1)
.annotate 'line', 4799
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4800

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4803
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4804

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4787
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
.annotate 'line', 4813
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4814

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4817
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
    set $P1, $P2
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4818
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4819
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4820
    self.'annotate'(__ARG_1)
.annotate 'line', 4821
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4822

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4825
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4826

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4809
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
.annotate 'line', 4835
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4836

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4839
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
    set $P1, $P2
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4840
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4841
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4842
    self.'annotate'(__ARG_1)
.annotate 'line', 4843
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4844

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4847
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4848

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4831
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
.annotate 'line', 4858
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4860
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4867
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4861
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4862
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4863
    getattribute $P3, __ARG_4, 'values'
    self.'append'($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 4865
    self.'pushexpr'(__ARG_4)
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4868
    getattribute $P5, __ARG_4, 'values'
    setattribute self, 'values', $P5
.annotate 'line', 4869
    self.'unshiftexpr'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4872
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = __ARG_3
    $P7[1] = __ARG_4
    setattribute self, 'values', $P7
  __label_1: # switch end
# }
.annotate 'line', 4874

.end # ConcatString


.sub 'pushexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_72 = "WSubId_72"
# Body
# {
.annotate 'line', 4877
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4878
# var last: $P2
    $P2 = $P1[-1]
.annotate 'line', 4879
    $P4 = $P2.'isstringliteral'()
    unless $P4 goto __label_3
    $P5 = __ARG_1.'isstringliteral'()
    set $P3, $P5
    goto __label_4
  __label_3:
    set $P3, $P4
  __label_4:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4880
    $P6 = WSubId_72($P2, __ARG_1)
    $P1[-1] = $P6
    goto __label_2
  __label_1: # else
.annotate 'line', 4882
# builtin push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 4883

.end # pushexpr


.sub 'unshiftexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_72 = "WSubId_72"
# Body
# {
.annotate 'line', 4886
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4887
# var first: $P2
    $P2 = $P1[0]
.annotate 'line', 4888
    $P4 = $P2.'isstringliteral'()
    unless $P4 goto __label_3
    $P5 = __ARG_1.'isstringliteral'()
    set $P3, $P5
    goto __label_4
  __label_3:
    set $P3, $P4
  __label_4:
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 4889
    $P6 = WSubId_72(__ARG_1, $P2)
    $P1[0] = $P6
    goto __label_2
  __label_1: # else
.annotate 'line', 4891
    'unshift'($P1, __ARG_1)
  __label_2: # endif
# }
.annotate 'line', 4892

.end # unshiftexpr


.sub 'append' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_72 = "WSubId_72"
# Body
# {
.annotate 'line', 4895
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4896
# var last: $P2
    $P2 = $P1[-1]
.annotate 'line', 4897
    $P4 = $P2.'isstringliteral'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4898
# var first: $P3
    $P3 = __ARG_1[0]
.annotate 'line', 4899
    $P4 = $P3.'isstringliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 4900
    $P5 = WSubId_72($P2, $P3)
    $P1[-1] = $P5
.annotate 'line', 4901
    __ARG_1.'shift'()
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 4904
    $P1.'append'(__ARG_1)
# }
.annotate 'line', 4905

.end # append


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4907
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4910
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4911
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4912
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4913
# i: $I2
    null $I2
# for loop
.annotate 'line', 4914
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4915
# builtin string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4914
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4916
    .return($P2)
# }
.annotate 'line', 4917

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4920
# auxreg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4921
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 4922
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 4923

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4926
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4927
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4928
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4929
    self.'annotate'(__ARG_1)
.annotate 'line', 4930
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4931
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4932
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4931
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4933
    .return($S1)
# }
.annotate 'line', 4934

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4937
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4938
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4939
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4940
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4941
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4940
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4942

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4853
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4855
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4951
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4952

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4953
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4956
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4957
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4958
# rreg: $S2
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4959
    set $S3, __ARG_2
    eq $S3, '', __label_3
# {
.annotate 'line', 4960
    self.'annotate'(__ARG_1)
.annotate 'line', 4961
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 4963

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4947
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
.annotate 'line', 4972
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4973

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 4976
    self.'optimizearg'()
.annotate 'line', 4977
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4978
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4979
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4980
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4981
    $P4 = $P1.'isliteral'()
    unless $P4 goto __label_4
    $P5 = $P2.'isliteral'()
    set $P3, $P5
    goto __label_5
  __label_4:
    set $P3, $P4
  __label_5:
    if_null $P3, __label_3
    unless $P3 goto __label_3
# {
.annotate 'line', 4982
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_7
    iseq $I5, $S2, 'S'
    set $I3, $I5
    goto __label_8
  __label_7:
    set $I3, $I4
  __label_8:
    unless $I3 goto __label_6
.annotate 'line', 4983
    .tailcall WSubId_72($P1, $P2)
  __label_6: # endif
.annotate 'line', 4984
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_10
    iseq $I5, $S2, 'I'
    set $I3, $I5
    goto __label_11
  __label_10:
    set $I3, $I4
  __label_11:
    unless $I3 goto __label_9
# {
.annotate 'line', 4985
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4986
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4987
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_22($P3, $P4, $I3)
# }
  __label_9: # endif
# {
.annotate 'line', 4990
    $P3 = WSubId_73($S1, $S2)
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 4991
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 4992
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 4993
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_71($P3, $P4, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4997
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_14
    iseq $I5, $S2, 'S'
    set $I3, $I5
    goto __label_15
  __label_14:
    set $I3, $I4
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 4998
    new $P4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'ConcatString'($P5, $P6, $P1, $P2)
    set $P3, $P4
    .return($P3)
# }
  __label_13: # endif
.annotate 'line', 5000
    .return(self)
# }
.annotate 'line', 5001

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_73 = "WSubId_73"
# Body
# {
.annotate 'line', 5004
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5005
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5006
    ne $S1, $S2, __label_3
.annotate 'line', 5007
    .return($S1)
  __label_3: # endif
.annotate 'line', 5008
    iseq $I2, $S1, 'I'
    unless $I2 goto __label_5
    iseq $I3, $S2, 'S'
    set $I1, $I3
    goto __label_6
  __label_5:
    set $I1, $I2
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 5009
    .return('S')
  __label_4: # endif
.annotate 'line', 5010
    iseq $I2, $S1, 'S'
    unless $I2 goto __label_8
    iseq $I3, $S2, 'I'
    set $I1, $I3
    goto __label_9
  __label_8:
    set $I1, $I2
  __label_9:
    unless $I1 goto __label_7
.annotate 'line', 5011
    .return('S')
  __label_7: # endif
.annotate 'line', 5012
    $P1 = WSubId_73($S1, $S2)
    if_null $P1, __label_10
    unless $P1 goto __label_10
.annotate 'line', 5013
    .return('N')
  __label_10: # endif
.annotate 'line', 5014
    .return('I')
# }
.annotate 'line', 5015

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5018
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5019
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5020
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5021
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5022
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5024
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5025
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5026
    ne $S1, 'S', __label_6
# {
.annotate 'line', 5027
    isne $I2, $S2, 'S'
    if $I2 goto __label_9
    isne $I3, $S3, 'S'
    set $I1, $I3
    goto __label_10
  __label_9:
    set $I1, $I2
  __label_10:
    unless $I1 goto __label_8
# {
.annotate 'line', 5028
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_11
    set $S6, $P3
  __label_11:
.annotate 'line', 5029
    eq $S2, 'S', __label_12
# {
.annotate 'line', 5030
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 5031
    set $S4, $S6
# }
    goto __label_13
  __label_12: # else
# {
.annotate 'line', 5034
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 5035
    set $S5, $S6
# }
  __label_13: # endif
# }
  __label_8: # endif
.annotate 'line', 5038
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 5041
    iseq $I2, $S1, 'I'
    unless $I2 goto __label_16
    isne $I4, $S2, 'I'
    if $I4 goto __label_18
    isne $I5, $S3, 'I'
    set $I3, $I5
    goto __label_19
  __label_18:
    set $I3, $I4
  __label_19:
    set $I1, $I3
    goto __label_17
  __label_16:
    set $I1, $I2
  __label_17:
    unless $I1 goto __label_14
# {
.annotate 'line', 5042
# l: $S7
    null $S7
.annotate 'line', 5043
    ne $S2, 'I', __label_20
    set $S7, $S4
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 5045
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 5046
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_21: # endif
.annotate 'line', 5048
# r: $S8
    null $S8
.annotate 'line', 5049
    ne $S3, 'I', __label_22
    set $S8, $S5
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 5051
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 5052
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_23: # endif
.annotate 'line', 5054
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_15
  __label_14: # else
.annotate 'line', 5057
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_15: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 5059

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4968
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
.annotate 'line', 5068
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5069

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 5072
    self.'optimizearg'()
.annotate 'line', 5073
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5074
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5075
    $P4 = $P1.'isliteral'()
    unless $P4 goto __label_2
    $P5 = $P2.'isliteral'()
    set $P3, $P5
    goto __label_3
  __label_2:
    set $P3, $P4
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 5076
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_4
    set $S1, $P6
  __label_4:
.annotate 'line', 5077
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 5078
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_7
    iseq $I5, $S2, 'I'
    set $I3, $I5
    goto __label_8
  __label_7:
    set $I3, $I4
  __label_8:
    unless $I3 goto __label_6
# {
.annotate 'line', 5079
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5080
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5081
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_22($P3, $P4, $I3)
# }
  __label_6: # endif
# }
  __label_1: # endif
.annotate 'line', 5084
    .return(self)
# }
.annotate 'line', 5085

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5088
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5089
# rtype: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
# switch-case
.annotate 'line', 5091
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 5093
    iseq $I2, $S1, 'P'
    if $I2 goto __label_7
    iseq $I3, $S2, 'P'
    set $I1, $I3
    goto __label_8
  __label_7:
    set $I1, $I2
  __label_8:
    if $I1 goto __label_6
.annotate 'line', 5095
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_10
    iseq $I5, $S2, 'N'
    set $I1, $I5
    goto __label_11
  __label_10:
    set $I1, $I4
  __label_11:
    if $I1 goto __label_9
.annotate 'line', 5097
    iseq $I6, $S1, 'N'
    unless $I6 goto __label_13
    iseq $I7, $S2, 'I'
    set $I1, $I7
    goto __label_14
  __label_13:
    set $I1, $I6
  __label_14:
    if $I1 goto __label_12
    goto __label_4
  __label_5: # case
.annotate 'line', 5092
    .return($S1)
  __label_6: # case
.annotate 'line', 5094
    .return('P')
  __label_9: # case
.annotate 'line', 5096
    .return('N')
  __label_12: # case
.annotate 'line', 5098
    .return('N')
  __label_4: # default
.annotate 'line', 5100
    .return('I')
  __label_3: # switch end
# }
.annotate 'line', 5102

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5105
# type: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5106
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5107
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5108
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5109
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5110
# lreg: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 5111
# rreg: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 5112
# aux: $S6
    null $S6
.annotate 'line', 5113
    eq $S2, $S1, __label_6
# {
.annotate 'line', 5114
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5115
    ne $S1, 'P', __label_7
.annotate 'line', 5116
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 5118
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 5119
    set $S4, $S6
# }
  __label_6: # endif
.annotate 'line', 5121
    eq $S3, $S1, __label_9
# {
.annotate 'line', 5122
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 5123
    ne $S1, 'P', __label_10
.annotate 'line', 5124
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 5126
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 5127
    set $S5, $S6
# }
  __label_9: # endif
.annotate 'line', 5129
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
# }
.annotate 'line', 5130

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 5064
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
.annotate 'line', 5139
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5140

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 5143
    self.'optimizearg'()
.annotate 'line', 5144
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5145
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5146
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5147
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5148
    $P4 = $P1.'isliteral'()
    unless $P4 goto __label_4
    $P5 = $P2.'isliteral'()
    set $P3, $P5
    goto __label_5
  __label_4:
    set $P3, $P4
  __label_5:
    if_null $P3, __label_3
    unless $P3 goto __label_3
# {
.annotate 'line', 5149
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_7
    iseq $I5, $S2, 'I'
    set $I3, $I5
    goto __label_8
  __label_7:
    set $I3, $I4
  __label_8:
    unless $I3 goto __label_6
# {
.annotate 'line', 5150
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5151
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5152
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_22($P3, $P4, $I3)
# }
  __label_6: # endif
# {
.annotate 'line', 5155
    $P3 = WSubId_73($S1, $S2)
    if_null $P3, __label_9
    unless $P3 goto __label_9
# {
.annotate 'line', 5156
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5157
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5158
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_71($P3, $P4, $N3)
# }
  __label_9: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 5162
    ne $S1, 'S', __label_10
.annotate 'line', 5163
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_10: # endif
.annotate 'line', 5164
    .return(self)
# }
.annotate 'line', 5165

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5168
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5169
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5170
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5171
    ne $S1, $S2, __label_3
.annotate 'line', 5172
    .return($S1)
  __label_3: # endif
.annotate 'line', 5173
    ne $S1, 'S', __label_4
.annotate 'line', 5174
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5176
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 5177

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5180
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5181
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5182
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5183
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5184
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 5185
    iseq $I4, $S1, $S2
    unless $I4 goto __label_4
    iseq $I7, $S1, 'I'
    if $I7 goto __label_8
    iseq $I8, $S1, 'N'
    set $I6, $I8
    goto __label_9
  __label_8:
    set $I6, $I7
  __label_9:
    if $I6 goto __label_6
    iseq $I9, $S1, 'P'
    set $I5, $I9
    goto __label_7
  __label_6:
    set $I5, $I6
  __label_7:
    set $I3, $I5
    goto __label_5
  __label_4:
    set $I3, $I4
  __label_5:
    unless $I3 goto __label_3
# {
.annotate 'line', 5186
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5187
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5188
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5189
    .return()
# }
  __label_3: # endif
.annotate 'line', 5194
    ne $S1, 'N', __label_10
# {
.annotate 'line', 5195
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5196
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5197
# rval: $S5
    null $S5
# switch
.annotate 'line', 5198
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_13
    set $S7, 'N'
    if $S6 == $S7 goto __label_14
    goto __label_12
  __label_13: # case
.annotate 'line', 5200
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5201
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5202
    set $S5, $S4
    goto __label_11 # break
  __label_14: # case
.annotate 'line', 5205
    set $S5, $S4
    goto __label_11 # break
  __label_12: # default
.annotate 'line', 5208
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5209
    __ARG_1.'emitset'($S5, $S4)
  __label_11: # switch end
.annotate 'line', 5211
    set $S6, __ARG_2
    eq $S6, '', __label_15
# {
.annotate 'line', 5212
    self.'annotate'(__ARG_1)
.annotate 'line', 5213
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_15: # endif
.annotate 'line', 5215
    .return()
# }
  __label_10: # endif
.annotate 'line', 5218
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 5219
    $P4 = $P1.'issimple'()
    isfalse $I3, $P4
    if $I3 goto __label_18
    $P5 = $P1.'isidentifier'()
    set $P3, $P5
    goto __label_19
  __label_18:
    box $P3, $I3
  __label_19:
    if_null $P3, __label_16
    unless $P3 goto __label_16
# {
.annotate 'line', 5220
    $P7 = self.'checkresult'()
    $P6 = self.'tempreg'($P7)
    set $S3, $P6
.annotate 'line', 5221
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
  __label_16: # else
# {
.annotate 'line', 5224
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5225
    set $S3, $I1
# }
  __label_17: # endif
.annotate 'line', 5227
    $P4 = $P2.'issimple'()
    isfalse $I3, $P4
    if $I3 goto __label_22
    $P5 = $P2.'isidentifier'()
    set $P3, $P5
    goto __label_23
  __label_22:
    box $P3, $I3
  __label_23:
    if_null $P3, __label_20
    unless $P3 goto __label_20
# {
.annotate 'line', 5228
    $P7 = self.'checkresult'()
    $P6 = self.'tempreg'($P7)
    set $S4, $P6
.annotate 'line', 5229
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 5232
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_26
    set $S7, 'N'
    if $S6 == $S7 goto __label_27
    set $S7, 'I'
    if $S6 == $S7 goto __label_28
    goto __label_25
  __label_26: # case
.annotate 'line', 5234
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5235
    $P2.'emit'(__ARG_1, $S4)
    goto __label_24 # break
  __label_27: # case
.annotate 'line', 5238
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_24 # break
  __label_28: # case
  __label_25: # default
.annotate 'line', 5242
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5243
    set $S4, $I2
    goto __label_24 # break
  __label_24: # switch end
.annotate 'line', 5244
# }
  __label_21: # endif
.annotate 'line', 5247
    self.'annotate'(__ARG_1)
.annotate 'line', 5248
    set $S6, __ARG_2
    ne $S6, '', __label_29
.annotate 'line', 5249
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_29: # endif
.annotate 'line', 5250
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 5251

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 5135
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
.annotate 'line', 5260
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5261

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 5264
    self.'optimizearg'()
.annotate 'line', 5265
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5266
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5267
    $P6 = $P1.'isliteral'()
    unless $P6 goto __label_2
    $P7 = $P2.'isliteral'()
    set $P5, $P7
    goto __label_3
  __label_2:
    set $P5, $P6
  __label_3:
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 5268
# ltype: $S1
    $P8 = $P1.'checkresult'()
    null $S1
    if_null $P8, __label_4
    set $S1, $P8
  __label_4:
.annotate 'line', 5269
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_5
    set $S2, $P5
  __label_5:
.annotate 'line', 5270
# var lval: $P3
    null $P3
.annotate 'line', 5271
# var rval: $P4
    null $P4
.annotate 'line', 5272
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_7
    iseq $I5, $S2, 'I'
    set $I3, $I5
    goto __label_8
  __label_7:
    set $I3, $I4
  __label_8:
    unless $I3 goto __label_6
# {
.annotate 'line', 5273
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5274
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5275
    unless $I2 goto __label_9
.annotate 'line', 5276
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_22($P5, $P6, $N3)
  __label_9: # endif
# }
  __label_6: # endif
# {
.annotate 'line', 5279
    $P5 = WSubId_73($S1, $S2)
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5280
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5281
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5282
    set $I3, $N2
    unless $I3 goto __label_11
.annotate 'line', 5283
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_71($P5, $P6, $N3)
  __label_11: # endif
# }
  __label_10: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 5287
    .return(self)
# }
.annotate 'line', 5288

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5291
    .return('N')
# }
.annotate 'line', 5292

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5295
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5296
# var aux: $P2
    null $P2
.annotate 'line', 5297
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5298
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 5299
    $P2 = self.'tempreg'('N')
.annotate 'line', 5300
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5301
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 5303
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5304
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5305
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 5306
    $P2 = self.'tempreg'('N')
.annotate 'line', 5307
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5308
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 5310
    self.'annotate'(__ARG_1)
.annotate 'line', 5311
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 5312

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5256
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
.annotate 'line', 5321
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5322

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5325
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5326
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5327
    self.'annotate'(__ARG_1)
.annotate 'line', 5328
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5329

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5332
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5333

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5317
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
.annotate 'line', 5342
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5343

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5346
    .return('I')
# }
.annotate 'line', 5347

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5350
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5351
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5352
    self.'annotate'(__ARG_1)
.annotate 'line', 5357
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5358

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5338
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
.annotate 'line', 5367
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5368

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5371
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
    set $P1, $P2
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5372
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5373
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5374
    self.'annotate'(__ARG_1)
.annotate 'line', 5375
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 5376

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5379
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5380

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5363
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
.annotate 'line', 5389
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5390

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5393
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
    set $P1, $P2
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5394
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5395
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5396
    self.'annotate'(__ARG_1)
.annotate 'line', 5397
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 5398

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5401
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5402

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5385
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5411
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5412

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5415
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 5416
# setname: $S1
    set $S1, ''
.annotate 'line', 5417
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 5418
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5420
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5423
    set $I2, 1
# switch
.annotate 'line', 5424
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
.annotate 'line', 5428
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5429
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5430
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5431
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5434
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 5439
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5442
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5445
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5440
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5443
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5446
    __ARG_1.'print'(' :named')
.annotate 'line', 5447
    eq $S1, '', __label_17
.annotate 'line', 5448
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5449
# }
.annotate 'line', 5451

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5407
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5460
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5461
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 5462

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5465
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5466
    .return(self)
# }
.annotate 'line', 5467

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 5470
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 5471

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5456
    addattribute $P0, 'arg'
.annotate 'line', 5457
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 5476
# var modifier: $P1
    null $P1
.annotate 'line', 5477
# var expr: $P2
    $P2 = WSubId_45(__ARG_1, __ARG_2)
.annotate 'line', 5478
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5479
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 5480
    $P3 = __ARG_1.'get'()
.annotate 'line', 5481
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 5482
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5485
    WSubId_48('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5488
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5489
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 5490

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_74 = "WSubId_74"
# Body
# {
.annotate 'line', 5501
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5502
    setattribute self, 'start', __ARG_2
.annotate 'line', 5503
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5504
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5505
    __ARG_3.'unget'($P1)
.annotate 'line', 5506
    $P3 = WSubId_44(__ARG_3, __ARG_1, WSubId_74, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5508

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5511
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5512
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5513

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5516
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5517

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5520
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5521
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5522

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5525
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5526
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5527

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 5530
    getattribute $P1, self, 'args'
    WSubId_46($P1)
.annotate 'line', 5531
    .return(self)
# }
.annotate 'line', 5532

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5535
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5536
    unless_null $P1, __label_1
# {
.annotate 'line', 5537
    new $P2, ['ResizableStringArray']
.annotate 'line', 5538
# var collect: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 5539
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P4, $P6
# {
.annotate 'line', 5540
# reg: $S1
    getattribute $P8, $P4, 'arg'
    $P7 = $P3.'add'($P8)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 5541
# builtin push
    push $P2, $S1
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5543
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5545
    .return($P1)
# }
.annotate 'line', 5546

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5549
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5550
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5552
# sep: $S1
    set $S1, ''
.annotate 'line', 5553
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5554
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5555
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5556
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5557
    if_null $P3, __label_4
.annotate 'line', 5558
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5559
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5554
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5561

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5494
    addattribute $P0, 'owner'
.annotate 'line', 5495
    addattribute $P0, 'start'
.annotate 'line', 5496
    addattribute $P0, 'args'
.annotate 'line', 5497
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5566
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5567
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5568
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5569
    .return(1)
# }
.annotate 'line', 5570

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5581
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5582
    setattribute self, 'builtin', __ARG_3
.annotate 'line', 5583
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5584

.end # CallBuiltinExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5587
    getattribute $P1, self, 'builtin'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5588

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5591
# var builtin: $P1
    getattribute $P1, self, 'builtin'
.annotate 'line', 5592
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5593
    new $P3, ['ResizableStringArray']
.annotate 'line', 5594
# var arg: $P4
    null $P4
# switch
.annotate 'line', 5595
    $P8 = $P1.'params'()
    set $I3, $P8
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5597
# var collectarglist: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P9, self, 'owner'
    $P5.'CollectValues'($P9, __ARG_1)
.annotate 'line', 5598
    if_null $P2, __label_6
    iter $P10, $P2
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P4, $P10
.annotate 'line', 5599
    getattribute $P12, $P4, 'arg'
    $P11 = $P5.'add'($P12)
# builtin push
    push $P3, $P11
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5602
# var rawargs: $P6
    root_new $P6, ['parrot';'ResizablePMCArray']
.annotate 'line', 5603
    if_null $P2, __label_8
    iter $P13, $P2
    set $P13, 0
  __label_7: # for iteration
    unless $P13 goto __label_8
    shift $P4, $P13
.annotate 'line', 5604
    getattribute $P14, $P4, 'arg'
# builtin push
    push $P6, $P14
    goto __label_7
  __label_8: # endfor
.annotate 'line', 5605
    getattribute $P15, self, 'builtin'
    getattribute $P16, self, 'start'
    $P15.'expand'(__ARG_1, self, $P16, __ARG_2, $P6)
.annotate 'line', 5606
    .return()
  __label_2: # default
.annotate 'line', 5608
# n: $I1
    getattribute $P17, self, 'args'
    set $I1, $P17
.annotate 'line', 5609
# var collectdefault: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P18, self, 'owner'
    $P7.'CollectValues'($P18, __ARG_1)
# for loop
.annotate 'line', 5610
# i: $I2
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
# {
.annotate 'line', 5611
    $P19 = $P2[$I2]
    getattribute $P4, $P19, 'arg'
.annotate 'line', 5612
# argtype: $S1
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
.annotate 'line', 5613
# paramtype: $S2
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
.annotate 'line', 5614
# argr: $S3
    null $S3
.annotate 'line', 5615
    $P8 = $P4.'isnull'()
    if_null $P8, __label_14
    unless $P8 goto __label_14
# {
# switch
.annotate 'line', 5616
    set $S5, $S2
    set $S6, 'I'
    if $S5 == $S6 goto __label_18
    set $S6, 'N'
    if $S5 == $S6 goto __label_19
    set $S6, 'S'
    if $S5 == $S6 goto __label_20
    goto __label_17
  __label_18: # case
  __label_19: # case
  __label_20: # case
.annotate 'line', 5620
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5621
    __ARG_1.'emitnull'($S3)
    goto __label_16 # break
  __label_17: # default
.annotate 'line', 5624
    $P11 = $P7.'add'($P4)
    set $S3, $P11
  __label_16: # switch end
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 5628
    iseq $I5, $S1, $S2
    if $I5 goto __label_25
    iseq $I6, $S2, '?'
    set $I4, $I6
    goto __label_26
  __label_25:
    set $I4, $I5
  __label_26:
    if $I4 goto __label_23
.annotate 'line', 5629
    iseq $I8, $S2, 'p'
    unless $I8 goto __label_27
.annotate 'line', 5630
    iseq $I10, $S1, 'S'
    if $I10 goto __label_29
    iseq $I11, $S1, 'P'
    set $I9, $I11
    goto __label_30
  __label_29:
    set $I9, $I10
  __label_30:
    set $I7, $I9
    goto __label_28
  __label_27:
    set $I7, $I8
  __label_28:
    set $I3, $I7
    goto __label_24
  __label_23:
    set $I3, $I4
  __label_24:
    unless $I3 goto __label_21
.annotate 'line', 5631
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
# {
.annotate 'line', 5633
    ne $S2, 'p', __label_31
.annotate 'line', 5634
    set $S2, 'P'
  __label_31: # endif
.annotate 'line', 5635
# aux: $S4
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P8, __label_32
    set $S4, $P8
  __label_32:
# switch
.annotate 'line', 5636
    set $S5, $S2
    set $S6, 'P'
    if $S5 == $S6 goto __label_35
    set $S6, 'I'
    if $S5 == $S6 goto __label_36
    set $S6, 'N'
    if $S5 == $S6 goto __label_37
    set $S6, 'S'
    if $S5 == $S6 goto __label_38
    goto __label_34
  __label_35: # case
# switch
.annotate 'line', 5638
    set $S7, $S1
    set $S8, 'I'
    if $S7 == $S8 goto __label_41
    set $S8, 'N'
    if $S7 == $S8 goto __label_42
    set $S8, 'S'
    if $S7 == $S8 goto __label_43
    goto __label_40
  __label_41: # case
  __label_42: # case
  __label_43: # case
.annotate 'line', 5642
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
.annotate 'line', 5643
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_39 # break
  __label_40: # default
.annotate 'line', 5646
    set $S3, $S4
  __label_39: # switch end
    goto __label_33 # break
  __label_36: # case
  __label_37: # case
  __label_38: # case
.annotate 'line', 5652
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5653
    __ARG_1.'emitset'($S3, $S4)
    goto __label_33 # break
  __label_34: # default
.annotate 'line', 5656
    set $S3, $S4
  __label_33: # switch end
# }
  __label_22: # endif
# }
  __label_15: # endif
.annotate 'line', 5660
# builtin push
    push $P3, $S3
# }
  __label_9: # for iteration
.annotate 'line', 5610
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_1: # switch end
.annotate 'line', 5663
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)
# }
.annotate 'line', 5664

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
.annotate 'line', 5574
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5576
    addattribute $P0, 'builtin'
.annotate 'line', 5577
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_75 = "WSubId_75"
# Body
# {
.annotate 'line', 5671
# callname: $S1
    $P7 = __ARG_3.'getname'()
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
.annotate 'line', 5672
    __ARG_1.'use_builtin'($S1)
.annotate 'line', 5673
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P7 = __ARG_4.'numargs'()
    set $I1, $P7
  __label_2:
.annotate 'line', 5674
# var rawargs: $P1
    if $I1 goto __label_5
    root_new $P7, ['parrot';'ResizablePMCArray']
    set $P1, $P7
    goto __label_4
  __label_5:
    $P8 = __ARG_4.'getrawargs'()
    set $P1, $P8
  __label_4:
.annotate 'line', 5676
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5677
# var variant: $P3
    null $P3
.annotate 'line', 5678
    if_null $P2, __label_7
    iter $P9, $P2
    set $P9, 0
  __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P4, $P9
# {
.annotate 'line', 5679
# vargs: $I2
    getattribute $P7, $P4, 'nparams'
    set $I2, $P7
.annotate 'line', 5680
    iseq $I5, $I2, $I1
    if $I5 goto __label_11
.annotate 'line', 5681
    iseq $I6, $I2, -1
    set $I4, $I6
    goto __label_12
  __label_11:
    set $I4, $I5
  __label_12:
    if $I4 goto __label_9
.annotate 'line', 5682
    iseq $I8, $I2, -2
    unless $I8 goto __label_13
    iseq $I9, $I1, 1
    set $I7, $I9
    goto __label_14
  __label_13:
    set $I7, $I8
  __label_14:
    set $I3, $I7
    goto __label_10
  __label_9:
    set $I3, $I4
  __label_10:
    unless $I3 goto __label_8
.annotate 'line', 5683
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5685
    unless_null $P3, __label_15
.annotate 'line', 5686
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_15: # endif
.annotate 'line', 5689
    $P7 = $P3.'iscompileevaluable'()
    if_null $P7, __label_16
    unless $P7 goto __label_16
# {
.annotate 'line', 5690
    $P8 = WSubId_75($P1)
    if_null $P8, __label_17
    unless $P8 goto __label_17
# {
.annotate 'line', 5691
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5692
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_18
    push_eh $P7
# try: begin
# {
.annotate 'line', 5693
    getattribute $P10, __ARG_1, 'owner'
    getattribute $P11, __ARG_1, 'start'
    $P8 = $P5($P10, $P11, $P1)
    .return($P8)
# }
# try: end
    pop_eh
    goto __label_19
.annotate 'line', 5692
# catch
  __label_18:
    .get_results($P6)
    finalize $P6
    pop_eh
# {
.annotate 'line', 5696
# builtin string
.annotate 'line', 5697
    $S2 = $P6["message"]
    concat $S3, "Compile time evaluation of builtin ", $S1
    concat $S3, $S3, " failed: '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
.annotate 'line', 5696
    WSubId_1($S3, __ARG_2)
# }
# catch end
  __label_19:
# }
  __label_17: # endif
# }
  __label_16: # endif
.annotate 'line', 5702
    new $P8, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P8.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P7, $P8
    .return($P7)
# }
.annotate 'line', 5703

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5712
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5713
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5714
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5715
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5716
    __ARG_1.'unget'($P1)
.annotate 'line', 5717
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5719

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5720
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 5723
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5724
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5725
    if_null $P2, __label_1
.annotate 'line', 5726
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5728
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5732
# var sym: $P3
    null $P3
.annotate 'line', 5733
# var subid: $P4
    null $P4
.annotate 'line', 5734
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5735
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5736
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5737
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5738
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5739
    isnull $I2, $P6
    if $I2 goto __label_7
    set $S1, $P6
    iseq $I3, $S1, ''
    set $I1, $I3
    goto __label_8
  __label_7:
    set $I1, $I2
  __label_8:
    unless $I1 goto __label_6
# {
.annotate 'line', 5740
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5741
    $P1.'buildkey'($P7)
.annotate 'line', 5742
    $P3 = self.'scopesearch'($P7, 0)
.annotate 'line', 5743
    if_null $P3, __label_9
# {
.annotate 'line', 5744
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 5745
    $P9 = $P3.'ismulti'()
    isfalse $I2, $P9
    unless $I2 goto __label_11
# {
.annotate 'line', 5746
    $P4 = $P3.'makesubid'()
.annotate 'line', 5747
    self.'usesubid'($P4)
# }
  __label_11: # endif
# }
  __label_10: # endif
.annotate 'line', 5750
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_12
.annotate 'line', 5751
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_76($P9, $P10, $P3, $P2)
  __label_12: # endif
# }
  __label_9: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 5755
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5757
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_13
.annotate 'line', 5758
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_13: # endif
.annotate 'line', 5761
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_14
    unless $P9 goto __label_14
# {
.annotate 'line', 5762
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_15
# {
.annotate 'line', 5763
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P12 = $P1.'getName'()
    $P11[0] = $P12
    $P8 = self.'scopesearch'($P11, 0)
.annotate 'line', 5764
    isnull $I2, $P8
    not $I2
    unless $I2 goto __label_17
    isa $I3, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    set $I1, $I3
    goto __label_18
  __label_17:
    set $I1, $I2
  __label_18:
    unless $I1 goto __label_16
.annotate 'line', 5765
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_76($P9, $P10, $P8, $P2)
  __label_16: # endif
# }
  __label_15: # endif
# }
  __label_14: # endif
.annotate 'line', 5769
    setattribute self, 'funref', $P1
.annotate 'line', 5770
    setattribute self, 'args', $P2
.annotate 'line', 5771
    .return(self)
# }
.annotate 'line', 5772

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5775
    .return(1)
# }
.annotate 'line', 5776

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5779
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5780
# call: $S1
    null $S1
.annotate 'line', 5782
    $P4 = $P1.'isidentifier'()
    unless $P4 goto __label_3
    getattribute $P5, $P1, 'subid'
    isnull $I1, $P5
    box $P3, $I1
    goto __label_4
  __label_3:
    set $P3, $P4
  __label_4:
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 5783
    $P6 = $P1.'checkIdentifier'()
    set $S1, $P6
.annotate 'line', 5784
    ne $S1, '', __label_5
# {
.annotate 'line', 5785
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
# switch-case
.annotate 'line', 5787
    isnull $I1, $P2
    if $I1 goto __label_8
.annotate 'line', 5790
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_9
.annotate 'line', 5793
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_10
    goto __label_7
  __label_8: # case
.annotate 'line', 5788
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
# builtin join
    join $S1, "", $P3
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 5791
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 5794
    WSubId_6("Builtin unexpeted here", self)
  __label_7: # default
.annotate 'line', 5796
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 3
    $P6[0] = "'"
    $P7 = $P1.'getName'()
    $P6[1] = $P7
    $P6[2] = "'"
# builtin join
    join $S1, "", $P6
  __label_6: # switch end
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5801
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5802
    .return($S1)
# }
.annotate 'line', 5803

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5806
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5807
    if_null $P1, __label_1
.annotate 'line', 5808
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5809

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5812
    __ARG_1.'print'('(')
.annotate 'line', 5813
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5814
    if_null $P1, __label_1
.annotate 'line', 5815
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5816
    __ARG_1.'say'(')')
# }
.annotate 'line', 5817

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5820
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5821
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5823
    self.'annotate'(__ARG_1)
.annotate 'line', 5825
    __ARG_1.'print'('    ')
.annotate 'line', 5826
    isnull $I2, __ARG_2
    not $I2
    unless $I2 goto __label_3
    set $S2, __ARG_2
    isne $I3, $S2, ''
    set $I1, $I3
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 5827
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_5
.annotate 'line', 5828
    __ARG_1.'print'('.tailcall ')
    goto __label_6
  __label_5: # else
.annotate 'line', 5830
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_6: # endif
# }
  __label_2: # endif
.annotate 'line', 5833
    __ARG_1.'print'($S1)
.annotate 'line', 5834
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5835

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5705
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5707
    addattribute $P0, 'funref'
.annotate 'line', 5708
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
.annotate 'line', 5849
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5850
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5851
    setattribute self, 'args', __ARG_3
.annotate 'line', 5852
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5853
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5854

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
.annotate 'line', 5857
    getattribute $P6, self, 'sym'
    if_null $P6, __label_1
# {
.annotate 'line', 5858
    getattribute $P7, self, 'subid'
    if_null $P7, __label_2
.annotate 'line', 5859
    getattribute $P8, self, 'subid'
    .return($P8)
  __label_2: # endif
.annotate 'line', 5860
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5861
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5862
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5864
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5866
# var first: $P3
    getattribute $P3, $P2, 'left'
  __label_5: # while
.annotate 'line', 5867
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_4
.annotate 'line', 5868
    getattribute $P3, $P3, 'left'
    goto __label_5
  __label_4: # endwhile
.annotate 'line', 5869
    $P6 = $P3.'isidentifier'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 5870
# check: $S1
    $P7 = $P3.'checkIdentifier'()
    null $S1
    if_null $P7, __label_7
    set $S1, $P7
  __label_7:
.annotate 'line', 5871
    isnull $I2, $S1
    if $I2 goto __label_9
    iseq $I3, $S1, ''
    set $I1, $I3
    goto __label_10
  __label_9:
    set $I1, $I2
  __label_10:
    unless $I1 goto __label_8
# {
.annotate 'line', 5875
    new $P4, ['ResizableStringArray']
.annotate 'line', 5876
    $P2.'buildkey'($P4)
.annotate 'line', 5877
# fun: $S2
    $P6 = $P4.'pop'()
    null $S2
    if_null $P6, __label_11
    set $S2, $P6
  __label_11:
.annotate 'line', 5878
# var reg: $P5
    $P5 = self.'tempreg'('P')
.annotate 'line', 5879
    self.'annotate'(__ARG_1)
.annotate 'line', 5880
    $P6 = WSubId_26($P4)
    __ARG_1.'emitget_hll_global'($P5, $S2, $P6)
.annotate 'line', 5881
    .return($P5)
# }
  __label_8: # endif
# }
  __label_6: # endif
.annotate 'line', 5884
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P2.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
.annotate 'line', 5885
    $P8 = $P2.'get_member'()
.annotate 'line', 5884
    $P6[2] = $P8
    $P6[3] = "'"
# builtin join
    join $S3, "", $P6
    .return($S3)
# }
.annotate 'line', 5886

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5843
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5845
    addattribute $P0, 'sym'
.annotate 'line', 5846
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5896
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5897
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5898
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5899

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5902
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5903
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5904
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5905
    set $S3, $P3
    isne $I2, $S3, 'P'
    unless $I2 goto __label_2
    set $S4, $P3
    isne $I3, $S4, 'S'
    set $I1, $I3
    goto __label_3
  __label_2:
    set $I1, $I2
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 5906
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5909
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_4
    set $S1, $P4
  __label_4:
.annotate 'line', 5910
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_5
    set $S2, $P4
  __label_5:
.annotate 'line', 5911
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5912

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5892
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
.annotate 'line', 5922
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5923
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5924

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5927
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5928
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5929
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5930
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5931
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5932
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5933
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5935
    .return($S2)
# }
.annotate 'line', 5936

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5917
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5919
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
.annotate 'line', 5945
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5946
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5947

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5948
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5951
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5952
    .return(self)
# }
.annotate 'line', 5953

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5956
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5957
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5958
    $P2 = $P1.'getName'()
# builtin push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5960
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5961
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# builtin push
    push __ARG_1, $P2
# }
.annotate 'line', 5962

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5965
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5966

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5969
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5970
    self.'annotate'(__ARG_1)
.annotate 'line', 5971
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5972

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5975
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5976
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5977
    .return($S1)
# }
.annotate 'line', 5978

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5981
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5982
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5983
    self.'annotate'(__ARG_1)
.annotate 'line', 5984
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5985

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5988
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5989

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5992
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5993
# value: $S2
    null $S2
.annotate 'line', 5994
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5996
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5997
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5998
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 6000
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 6003
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 6004
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 6006
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 6007

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6010
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6011
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6012
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 6013
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 6015
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 6016
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 6017
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 6019
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 6021
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 6022
    .return($S2)
# }
.annotate 'line', 6023

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5939
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5941
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
.annotate 'line', 6034
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6035
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 6036

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6037
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6040
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 6041
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 6042
    .return(self)
# }
.annotate 'line', 6043

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 6046
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 6047
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 6048
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 6049
    WSubId_48("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6050
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6051
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6052
    self.'annotate'(__ARG_1)
.annotate 'line', 6053
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 6054
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 6055
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 6056

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 6059
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 6060
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 6061
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 6062
    WSubId_48("string expression", $P2)
  __label_1: # endif
.annotate 'line', 6063
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 6064
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6065
# vreg: $S3
    null $S3
# switch
.annotate 'line', 6066
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 6068
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 6070
    ne $S3, 'null', __label_7
# {
.annotate 'line', 6071
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 6072
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 6076
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 6077
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6078
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 6081
    self.'annotate'(__ARG_1)
.annotate 'line', 6082
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 6083
    .return($S3)
# }
.annotate 'line', 6084

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 6029
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 6031
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]

.sub 'StringIndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 6095
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6096
    setattribute self, 'left', __ARG_3
.annotate 'line', 6097
    setattribute self, 'arg', __ARG_4
# }
.annotate 'line', 6098

.end # StringIndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6101
    .return('S')
# }
.annotate 'line', 6102

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6105
# lreg: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6106
# rreg: $S2
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6107
    set $S3, __ARG_2
    eq $S3, '', __label_3
# {
.annotate 'line', 6108
    self.'annotate'(__ARG_1)
.annotate 'line', 6109
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $S1, ', ', $S2, ', ', 1)
# }
  __label_3: # endif
# }
.annotate 'line', 6111

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 6089
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6091
    addattribute $P0, 'left'
.annotate 'line', 6092
    addattribute $P0, 'arg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 6125
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6126
    setattribute self, 'left', __ARG_4
.annotate 'line', 6127
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 6128

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6131
    .return('P')
# }
.annotate 'line', 6132

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_23 = "WSubId_23"
# Body
# {
.annotate 'line', 6135
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 6136
    setattribute self, 'left', $P1
.annotate 'line', 6137
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 6138
    $P2.'optimizeargs'()
.annotate 'line', 6140
    $P4 = $P1.'checkresult'()
    set $S2, $P4
    ne $S2, 'S', __label_1
# {
.annotate 'line', 6141
    $P5 = $P2.'numargs'()
    set $I2, $P5
    eq $I2, 1, __label_2
.annotate 'line', 6142
    WSubId_1('Bad string index', self)
  __label_2: # endif
.annotate 'line', 6143
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6146
    $P5 = $P1.'isstringliteral'()
    unless $P5 goto __label_4
    $P6 = $P3.'isintegerliteral'()
    set $P4, $P6
    goto __label_5
  __label_4:
    set $P4, $P5
  __label_5:
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 6147
# ival: $I1
    $P7 = $P3.'getIntegerValue'()
    set $I1, $P7
.annotate 'line', 6148
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_6
    set $S1, $P4
  __label_6:
.annotate 'line', 6149
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
.annotate 'line', 6150
# builtin substr
    substr $S2, $S1, $I1, 1
.annotate 'line', 6149
    .tailcall WSubId_23($P4, $P5, $S2)
# }
  __label_3: # endif
.annotate 'line', 6152
    new $P5, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'StringIndexExpr'($P6, $P7, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
  __label_1: # endif
.annotate 'line', 6155
    .return(self)
# }
.annotate 'line', 6156

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6159
    getattribute $P2, self, 'regleft'
    isnull $I2, $P2
    not $I2
    if $I2 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I3, $P3
    not $I3
    set $I1, $I3
    goto __label_3
  __label_2:
    set $I1, $I2
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 6160
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6161
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 6162
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 6163
    $P3 = $P1.'getIdentifier'()
    goto __label_4
  __label_5:
.annotate 'line', 6164
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_4:
.annotate 'line', 6162
    setattribute self, 'regleft', $P3
.annotate 'line', 6165
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 6166

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6169
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 6170
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 6171
    isnull $I2, $P1
    if $I2 goto __label_2
    isnull $I3, $P2
    set $I1, $I3
    goto __label_3
  __label_2:
    set $I1, $I2
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 6172
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6173
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6174
# builtin join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6175
    __ARG_1.'print'(']')
# }
.annotate 'line', 6176

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6179
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6180
    self.'annotate'(__ARG_1)
.annotate 'line', 6181
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6182
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6183
    __ARG_1.'say'('')
# }
.annotate 'line', 6184

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6187
# result: $S1
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6188
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6189
    .return($S1)
# }
.annotate 'line', 6190

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6193
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6194
    self.'annotate'(__ARG_1)
.annotate 'line', 6195
    __ARG_1.'print'('    ')
.annotate 'line', 6196
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6197
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 6198

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6201
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6202
# rreg: $S1
    null $S1
.annotate 'line', 6203
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 6204
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6205
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 6208
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6209
    self.'annotate'(__ARG_1)
.annotate 'line', 6210
    __ARG_1.'print'('    ')
.annotate 'line', 6211
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6212
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6213
    .return($S1)
# }
.annotate 'line', 6214

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 6116
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6118
    addattribute $P0, 'left'
.annotate 'line', 6119
    addattribute $P0, 'regleft'
.annotate 'line', 6120
    addattribute $P0, 'args'
.annotate 'line', 6121
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 6225
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6226
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6227
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6228
    __ARG_1.'unget'($P1)
.annotate 'line', 6229
    $P3 = WSubId_44(__ARG_1, __ARG_2, WSubId_45, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6231

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6232
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 6235
    getattribute $P1, self, 'values'
    WSubId_46($P1)
.annotate 'line', 6236
    .return(self)
# }
.annotate 'line', 6237

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6240
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 6241
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 6242
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6248
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 6250

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6253
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6254
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6255
    .return($S1)
# }
.annotate 'line', 6256

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6259
    self.'annotate'(__ARG_1)
.annotate 'line', 6260
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6261
# size: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin elements
    elements $I1, $P1
  __label_1:
.annotate 'line', 6262
    eq __ARG_2, '', __label_3
# {
.annotate 'line', 6263
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6264
    le $I1, 0, __label_4
.annotate 'line', 6265
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 6267
# var collect: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P4, self, 'owner'
    $P2.'CollectValues'($P4, __ARG_1)
.annotate 'line', 6268
# i: $I2
    null $I2
.annotate 'line', 6269
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
# {
.annotate 'line', 6270
# valuereg: $S1
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6271
    eq __ARG_2, '', __label_8
# {
.annotate 'line', 6272
    self.'annotate'(__ARG_1)
.annotate 'line', 6273
    __ARG_1.'say'('    ', __ARG_2, "[", $I2, "] = ", $S1)
.annotate 'line', 6274
    inc $I2
# }
  __label_8: # endif
# }
    goto __label_5
  __label_6: # endfor
# }
.annotate 'line', 6277

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6219
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6221
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 6289
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6290
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6291
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6292
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6293
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 6294
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6295
# {
.annotate 'line', 6296
# var key: $P4
    $P4 = WSubId_45(__ARG_1, __ARG_2)
.annotate 'line', 6297
    WSubId_62(':', __ARG_1)
.annotate 'line', 6298
# var value: $P5
    $P5 = WSubId_45(__ARG_1, __ARG_2)
.annotate 'line', 6299
# builtin push
    push $P2, $P4
.annotate 'line', 6300
# builtin push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 6302
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6303
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6304
    WSubId_48("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 6306
    setattribute self, 'keys', $P2
.annotate 'line', 6307
    setattribute self, 'values', $P3
# }
.annotate 'line', 6308

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6309
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 6312
    getattribute $P1, self, 'keys'
    WSubId_46($P1)
.annotate 'line', 6313
    getattribute $P1, self, 'values'
    WSubId_46($P1)
.annotate 'line', 6314
    .return(self)
# }
.annotate 'line', 6315

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6318
    self.'annotate'(__ARG_1)
.annotate 'line', 6323
    set $S4, __ARG_2
    eq $S4, '', __label_1
.annotate 'line', 6324
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6326
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 6327
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 6328
# var collectvalues: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 6329
# n: $I1
    set $I1, $P1
# for loop
.annotate 'line', 6330
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 6331
# var key: $P4
    $P4 = $P1[$I2]
.annotate 'line', 6332
# keyreg: $S1
    null $S1
.annotate 'line', 6333
    $P6 = $P4.'isidentifier'()
    unless $P6 goto __label_7
    $P7 = $P4.'checkIdentifier'()
    set $S4, $P7
    iseq $I3, $S4, ''
    box $P5, $I3
    goto __label_8
  __label_7:
    set $P5, $P6
  __label_8:
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 6334
# id: $S2
    $P8 = $P4.'getName'()
    null $S2
    if_null $P8, __label_9
    set $S2, $P8
  __label_9:
.annotate 'line', 6335
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6336
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 6339
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6341
# valuereg: $S3
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 6342
    set $S4, __ARG_2
    eq $S4, '', __label_11
.annotate 'line', 6343
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_11: # endif
# }
  __label_2: # for iteration
.annotate 'line', 6330
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 6345

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6348
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6349
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6350
    .return($S1)
# }
.annotate 'line', 6351

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6282
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6284
    addattribute $P0, 'keys'
.annotate 'line', 6285
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6364
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6369
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 6370

.end # parseinitializer


.sub 'numargs' :method
# Body
# {
.annotate 'line', 6373
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6374
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
# builtin int
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)
# }
.annotate 'line', 6375

.end # numargs


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 6378
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6379
    if_null $P1, __label_1
.annotate 'line', 6380
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 6381

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6384
    self.'optimize_initializer'()
.annotate 'line', 6385
    .return(self)
# }
.annotate 'line', 6386

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6389
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6390
    if_null $P1, __label_1
.annotate 'line', 6391
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6392
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6393
    if_null $P1, __label_2
.annotate 'line', 6394
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6395
    __ARG_1.'say'(")")
# }
.annotate 'line', 6396

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6356
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6358
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'warn_class_unknown' :subid('WSubId_77')
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6403
    concat $S1, "class ", __ARG_2
    concat $S1, $S1, " not found at compile time"
    __ARG_1.'warn'($S1, __ARG_3)
# }
.annotate 'line', 6404

.end # warn_class_unknown

.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6412
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6414
    $P3 = __ARG_4.'isstring'()
    if $P3 goto __label_2
    $P4 = __ARG_4.'isidentifier'()
    set $P2, $P4
    goto __label_3
  __label_2:
    set $P2, $P3
  __label_3:
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6415
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6416
    setattribute self, 'value', __ARG_4
.annotate 'line', 6417
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6419
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 6420
    self.'parseinitializer'(__ARG_1)
    goto __label_5
  __label_4: # else
.annotate 'line', 6422
    __ARG_1.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 6423

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6426
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 6427
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 6430
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6431
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_3
    $P4 = $P2.'isconst'()
    set $P3, $P4
    goto __label_4
  __label_3:
    box $P3, $I1
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 6432
    $P1 = $P2.'getvalue'()
.annotate 'line', 6433
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 6434
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 6435
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 6438
    self.'optimize_initializer'()
.annotate 'line', 6439
    .return(self)
# }
.annotate 'line', 6440

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6443
    self.'annotate'(__ARG_1)
.annotate 'line', 6445
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6446
# var value: $P2
    getattribute $P2, self, 'value'
.annotate 'line', 6447
# numinits: $I1
    $P8 = self.'numargs'()
    set $I1, $P8
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 6450
# type: $I2
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6451
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6453
# reginit: $S1
    set $S1, ''
.annotate 'line', 6454
# regnew: $S2
    null $S2
    if_null __ARG_2, __label_5
    set $S2, __ARG_2
  __label_5:
.annotate 'line', 6455
# constructor: $S3
    null $S3
# switch
.annotate 'line', 6456
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
.annotate 'line', 6461
    ne $I2, 1, __label_11
# {
.annotate 'line', 6462
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 6463
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 6466
# var initval: $P3
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 6467
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 6468
    concat $S5, ', ', $S1
    set $S1, $S5
# }
  __label_12: # endif
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 6472
    eq $I2, 1, __label_14
.annotate 'line', 6473
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_14: # endif
.annotate 'line', 6474
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 6475
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
  __label_6: # switch end
.annotate 'line', 6478
    ne $S2, '', __label_16
.annotate 'line', 6479
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_16: # endif
# switch
.annotate 'line', 6481
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
  __label_19: # case
.annotate 'line', 6484
# name: $S4
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_21
    set $S4, $P8
  __label_21:
.annotate 'line', 6485
# var aux: $P4
# builtin get_class
    get_class $P4, $S4
.annotate 'line', 6486
    unless_null $P4, __label_22
.annotate 'line', 6487
    WSubId_77(__ARG_1, $S4, $P2)
  __label_22: # endif
.annotate 'line', 6491
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 6492
    le $I1, 1, __label_23
# {
.annotate 'line', 6493
    __ARG_1.'say'($S2, ".'", $P2, "'()")
# }
  __label_23: # endif
    goto __label_17 # break
  __label_20: # case
.annotate 'line', 6497
# var id: $P5
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 6498
    unless_null $P5, __label_24
# {
.annotate 'line', 6499
# var cl: $P6
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 6500
    if_null $P6, __label_26
# {
.annotate 'line', 6501
# var key: $P7
    $P7 = $P6.'getpath'()
.annotate 'line', 6502
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 6505
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 6506
    if_null $P5, __label_28
.annotate 'line', 6507
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 6509
    $P9 = $P2.'getidentifier'()
    WSubId_77(__ARG_1, $P9, $P2)
.annotate 'line', 6510
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
# }
  __label_29: # endif
# }
  __label_27: # endif
.annotate 'line', 6513
    set $S3, $P2
# }
    goto __label_25
  __label_24: # else
# {
.annotate 'line', 6517
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
# }
  __label_25: # endif
    goto __label_17 # break
  __label_18: # default
.annotate 'line', 6521
    WSubId_6('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 6523
    isgt $I4, $I1, 1
    if $I4 goto __label_31
    isge $I6, $I1, 0
    unless $I6 goto __label_33
    iseq $I7, $I2, 1
    set $I5, $I7
    goto __label_34
  __label_33:
    set $I5, $I6
  __label_34:
    set $I3, $I5
    goto __label_32
  __label_31:
    set $I3, $I4
  __label_32:
    unless $I3 goto __label_30
# {
.annotate 'line', 6524
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6525
    not $I4, __ARG_3
    unless $I4 goto __label_36
    set $S5, __ARG_2
    isne $I5, $S5, ''
    set $I3, $I5
    goto __label_37
  __label_36:
    set $I3, $I4
  __label_37:
    unless $I3 goto __label_35
.annotate 'line', 6526
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_35: # endif
# }
  __label_30: # endif
# }
.annotate 'line', 6528

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6531
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6532

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6406
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6408
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6543
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6544
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6545
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6546
    setattribute self, 'nskey', $P1
.annotate 'line', 6547
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6548
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6549
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6551
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6552

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6555
# reginit: $S1
    null $S1
# switch
.annotate 'line', 6556
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
.annotate 'line', 6561
# var initval: $P1
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6562
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6565
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_1: # switch end
.annotate 'line', 6567
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6569
    set $S2, __ARG_2
    ne $S2, '', __label_6
.annotate 'line', 6570
    __ARG_2 = self.'tempreg'('P')
  __label_6: # endif
.annotate 'line', 6572
    __ARG_1.'print'('    ')
.annotate 'line', 6573
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 6574
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6575
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6576
    null $P3
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6577
    if_null $S1, __label_8
.annotate 'line', 6578
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6579
    __ARG_1.'say'()
# }
.annotate 'line', 6580

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6537
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6539
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6591
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6592
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6593
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6594
    setattribute self, 'nskey', $P1
.annotate 'line', 6595
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6596
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6597
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6599
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6600

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6603
# numinits: $I1
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6604
# regnew: $S1
    null $S1
    if_null __ARG_2, __label_1
    set $S1, __ARG_2
  __label_1:
.annotate 'line', 6605
    le $I1, 0, __label_2
.annotate 'line', 6606
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6607
# var nskey: $P1
    getattribute $P1, self, 'nskey'
.annotate 'line', 6609
    ne $S1, '', __label_3
.annotate 'line', 6610
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_3: # endif
.annotate 'line', 6612
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 6614
    lt $I1, 0, __label_4
# {
.annotate 'line', 6615
# constructor: $S2
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 6616
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6617
    set $S3, __ARG_2
    eq $S3, '', __label_6
.annotate 'line', 6618
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_6: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 6620

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6585
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6587
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6627
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6630
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6634
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6637
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6632
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6633
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6632
    .return($P3)
  __label_4: # case
.annotate 'line', 6636
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6640
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6641
    __ARG_1.'unget'($P2)
.annotate 'line', 6642
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6644
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6649
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6651

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_70 = "WSubId_70"
# Body
# {
.annotate 'line', 6662
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6663
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6664
    $P2 = WSubId_70(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6665

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6668
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6669
    .return(self)
# }
.annotate 'line', 6670

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6671
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6674
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6675
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6676
    eq $S1, 'P', __label_2
.annotate 'line', 6677
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6678
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6680
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
.annotate 'line', 6681
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6682
    self.'annotate'(__ARG_1)
.annotate 'line', 6683
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6684
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6685
    __ARG_1.'say'()
# }
.annotate 'line', 6686

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6655
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6657
    addattribute $P0, 'lexpr'
.annotate 'line', 6658
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
.annotate 'line', 6699
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6700
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6701
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6702
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6703
    .return(self)
# }
.annotate 'line', 6704

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6707
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6708
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6710
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6712
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6714
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6715
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6716
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6718

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6721
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6722
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6723
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6725
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6726

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6729
# cond_end: $S1
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 6730
# cond_false: $S2
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 6731
    getattribute $P4, self, 'condition'
    $P4.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6732
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6733
# tres: $S3
    $P4 = self.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
.annotate 'line', 6734
    $P4 = $P1.'isnull'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6735
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6737
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6738
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6739
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6740
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6741
    $P4 = $P2.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 6742
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6744
# tfalse: $S4
    $P5 = $P2.'checkresult'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
  __label_8:
.annotate 'line', 6745
    iseq $I2, $S3, 'P'
    unless $I2 goto __label_11
    isne $I3, $S4, 'P'
    set $I1, $I3
    goto __label_12
  __label_11:
    set $I1, $I2
  __label_12:
    unless $I1 goto __label_9
# {
.annotate 'line', 6746
# r: $S5
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_13
    set $S5, $P4
  __label_13:
.annotate 'line', 6747
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 6751
    ne $S4, 'P', __label_14
# {
.annotate 'line', 6752
# var aux: $P3
    $P3 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 6753
    __ARG_1.'emitset'(__ARG_2, $P3)
# }
    goto __label_15
  __label_14: # else
.annotate 'line', 6756
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_15: # endif
# }
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6759
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6760

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6691
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6693
    addattribute $P0, 'condition'
.annotate 'line', 6694
    addattribute $P0, 'etrue'
.annotate 'line', 6695
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
# Constant Code_bin_not evaluated at compile time

.sub 'getOpCode_2' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6805
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
.annotate 'line', 6806
    .return(1)
  __label_4: # case
.annotate 'line', 6807
    .return(2)
  __label_5: # case
.annotate 'line', 6808
    .return(3)
  __label_2: # default
.annotate 'line', 6809
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6811

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6815
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '-'
    if $S1 == $S2 goto __label_3
    set $S2, '!'
    if $S1 == $S2 goto __label_4
    set $S2, '~'
    if $S1 == $S2 goto __label_5
    set $S2, '++'
    if $S1 == $S2 goto __label_6
    set $S2, '--'
    if $S1 == $S2 goto __label_7
    goto __label_2
  __label_3: # case
.annotate 'line', 6816
    .return(8)
  __label_4: # case
.annotate 'line', 6817
    .return(11)
  __label_5: # case
.annotate 'line', 6818
    .return(33)
  __label_6: # case
.annotate 'line', 6819
    .return(9)
  __label_7: # case
.annotate 'line', 6820
    .return(10)
  __label_2: # default
.annotate 'line', 6822
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(31)
    goto __label_9
  __label_8: # else
.annotate 'line', 6823
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(32)
    goto __label_11
  __label_10: # else
.annotate 'line', 6824
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_1: # switch end
# }
.annotate 'line', 6826

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_85')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6830
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
.annotate 'line', 6831
    .return(19)
  __label_4: # case
.annotate 'line', 6832
    .return(20)
  __label_5: # case
.annotate 'line', 6833
    .return(21)
  __label_6: # case
.annotate 'line', 6834
    .return(22)
  __label_2: # default
.annotate 'line', 6835
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6837

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_88')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6841
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6842
    .return(28)
  __label_4: # case
.annotate 'line', 6843
    .return(29)
  __label_2: # default
.annotate 'line', 6844
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6846

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_90')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6850
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
.annotate 'line', 6851
    .return(14)
  __label_4: # case
.annotate 'line', 6852
    .return(16)
  __label_5: # case
.annotate 'line', 6853
    .return(15)
  __label_6: # case
.annotate 'line', 6854
    .return(17)
  __label_2: # default
.annotate 'line', 6856
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6857
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6859

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_92')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6863
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
.annotate 'line', 6864
    .return(12)
  __label_4: # case
.annotate 'line', 6865
    .return(13)
  __label_5: # case
.annotate 'line', 6866
    .return(25)
  __label_6: # case
.annotate 'line', 6867
    .return(26)
  __label_2: # default
.annotate 'line', 6868
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6870

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_101')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6874
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
.annotate 'line', 6875
    .return(4)
  __label_4: # case
.annotate 'line', 6876
    .return(5)
  __label_5: # case
.annotate 'line', 6877
    .return(6)
  __label_6: # case
.annotate 'line', 6878
    .return(18)
  __label_7: # case
.annotate 'line', 6879
    .return(23)
  __label_8: # case
.annotate 'line', 6880
    .return(24)
  __label_9: # case
.annotate 'line', 6881
    .return(30)
  __label_2: # default
.annotate 'line', 6882
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6884

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_22 = "WSubId_22"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 6888
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6889
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6892
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6896
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6898
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6900
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6902
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6904
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6906
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6908
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6910
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6912
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 6914
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 6893
    $P2 = WSubId_45(__ARG_1, __ARG_2)
.annotate 'line', 6894
    WSubId_62(')', __ARG_1)
.annotate 'line', 6895
    .return($P2)
  __label_4: # case
.annotate 'line', 6897
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6899
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6901
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6903
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_22(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6905
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6907
    .tailcall WSubId_78(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6909
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6911
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6913
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 6915
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 6917
    WSubId_48('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6919

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6923
# var subexp: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6924
# var t: $P2
    null $P2
.annotate 'line', 6925
# var start: $P3
    null $P3
.annotate 'line', 6926
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6927
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_80($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6928
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6930
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6933
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6936
    set $P3, $P2
.annotate 'line', 6937
    $P2 = __ARG_1.'get'()
.annotate 'line', 6938
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6939
# var right: $P4
    $P4 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6940
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6943
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6946
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6949
    __ARG_1.'unget'($P2)
.annotate 'line', 6950
    .return($P1)
# }
.annotate 'line', 6951

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
# Body
# {
.annotate 'line', 6955
# var subexp: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6956
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6958
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6960
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6959
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6961
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6963
    __ARG_1.'unget'($P2)
.annotate 'line', 6964
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6966

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_84 = "WSubId_84"
# Body
# {
.annotate 'line', 6970
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6971
# code: $I1
    $P3 = WSubId_82($P1)
    set $I1, $P3
.annotate 'line', 6972
    unless $I1 goto __label_1
# {
.annotate 'line', 6973
# var subexpr: $P2
    $P2 = WSubId_83(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6974
    set $I2, $I1
    set $I3, 8
    if $I2 == $I3 goto __label_5
    set $I3, 11
    if $I2 == $I3 goto __label_6
    set $I3, 33
    if $I2 == $I3 goto __label_7
    set $I3, 9
    if $I2 == $I3 goto __label_8
    set $I3, 10
    if $I2 == $I3 goto __label_9
    set $I3, 31
    if $I2 == $I3 goto __label_10
    set $I3, 32
    if $I2 == $I3 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 6976
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6978
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6980
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6982
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6984
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6986
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6988
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_4: # default
.annotate 'line', 6990
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6994
    __ARG_1.'unget'($P1)
.annotate 'line', 6995
    .tailcall WSubId_84(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6997

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7001
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 7002
# var t: $P2
    null $P2
.annotate 'line', 7003
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 7004
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_85($P2)
    set $I1, $P4
    unless $I1 goto __label_1
# {
.annotate 'line', 7005
# var rexpr: $P3
    $P3 = WSubId_83(__ARG_1, __ARG_2)
# switch
.annotate 'line', 7006
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
.annotate 'line', 7008
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7011
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7014
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7017
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7020
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7023
    __ARG_1.'unget'($P2)
.annotate 'line', 7024
    .return($P1)
# }
.annotate 'line', 7025

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 7029
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 7030
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7031
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('+')
    if $P6 goto __label_3
    $P7 = $P2.'isop'('-')
    set $P5, $P7
    goto __label_4
  __label_3:
    set $P5, $P6
  __label_4:
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 7032
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 7033
# var expr: $P4
    null $P4
.annotate 'line', 7034
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_5
    unless $P5 goto __label_5
.annotate 'line', 7035
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_6
  __label_5: # else
.annotate 'line', 7037
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_6: # endif
.annotate 'line', 7038
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7040
    __ARG_1.'unget'($P2)
.annotate 'line', 7041
    .return($P1)
# }
.annotate 'line', 7042

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7046
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 7047
# var rexpr: $P2
    null $P2
.annotate 'line', 7048
# var t: $P3
    null $P3
.annotate 'line', 7049
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 7050
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_88($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 7051
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 7053
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 7054
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7057
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 7058
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7061
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7064
    __ARG_1.'unget'($P3)
.annotate 'line', 7065
    .return($P1)
# }
.annotate 'line', 7066

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_90 = "WSubId_90"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7070
# var lexpr: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7071
# var rexpr: $P2
    null $P2
.annotate 'line', 7072
# var t: $P3
    null $P3
.annotate 'line', 7073
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 7074
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_90($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 7075
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
.annotate 'line', 7077
    $P2 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7078
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7081
    $P2 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7082
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7085
    $P2 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7086
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7089
    $P2 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7090
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7093
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7096
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7099
    __ARG_1.'unget'($P3)
.annotate 'line', 7100
    .return($P1)
# }
.annotate 'line', 7101

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7105
# var lexpr: $P1
    $P1 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7106
# var rexpr: $P2
    null $P2
.annotate 'line', 7107
# var t: $P3
    null $P3
.annotate 'line', 7108
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 7109
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_92($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 7110
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
.annotate 'line', 7112
    $P2 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7113
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7116
    $P2 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7117
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7120
    $P2 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7121
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7124
    $P2 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7125
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7128
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7131
    __ARG_1.'unget'($P3)
.annotate 'line', 7132
    .return($P1)
# }
.annotate 'line', 7133

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_94')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 7137
# var lexpr: $P1
    $P1 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7138
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7139
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7140
# var rexpr: $P3
    $P3 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7141
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7143
    __ARG_1.'unget'($P2)
.annotate 'line', 7144
    .return($P1)
# }
.annotate 'line', 7145

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 7149
# var lexpr: $P1
    $P1 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 7150
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7151
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7152
# var rexpr: $P3
    $P3 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 7153
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7155
    __ARG_1.'unget'($P2)
.annotate 'line', 7156
    .return($P1)
# }
.annotate 'line', 7157

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 7161
# var lexpr: $P1
    $P1 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7162
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7163
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7164
# var rexpr: $P3
    $P3 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7165
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7167
    __ARG_1.'unget'($P2)
.annotate 'line', 7168
    .return($P1)
# }
.annotate 'line', 7169

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 7173
# var lexpr: $P1
    $P1 = WSubId_96(__ARG_1, __ARG_2)
.annotate 'line', 7174
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7175
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7176
# var rexpr: $P3
    $P3 = WSubId_96(__ARG_1, __ARG_2)
.annotate 'line', 7177
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7179
    __ARG_1.'unget'($P2)
.annotate 'line', 7180
    .return($P1)
# }
.annotate 'line', 7181

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 7185
# var lexpr: $P1
    $P1 = WSubId_97(__ARG_1, __ARG_2)
.annotate 'line', 7186
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7187
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7188
# var rexpr: $P3
    $P3 = WSubId_96(__ARG_1, __ARG_2)
.annotate 'line', 7189
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7191
    __ARG_1.'unget'($P2)
.annotate 'line', 7192
    .return($P1)
# }
.annotate 'line', 7193

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 7197
# var econd: $P1
    $P1 = WSubId_98(__ARG_1, __ARG_2)
.annotate 'line', 7198
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 7199
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 7200
# var etrue: $P3
    $P3 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7201
    WSubId_62(':', __ARG_1)
.annotate 'line', 7202
# var efalse: $P4
    $P4 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7203
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7206
    __ARG_1.'unget'($P2)
.annotate 'line', 7207
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7209

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7213
# var lexpr: $P1
    $P1 = WSubId_100(__ARG_1, __ARG_2)
.annotate 'line', 7214
# var t: $P2
    null $P2
.annotate 'line', 7215
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 7216
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_101($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
.annotate 'line', 7217
# var rexpr: $P3
    $P3 = WSubId_99(__ARG_1, __ARG_2)
.annotate 'line', 7218
# var expr: $P4
    null $P4
# switch
.annotate 'line', 7219
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
.annotate 'line', 7221
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7224
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7227
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7230
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7233
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 7236
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 7239
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7242
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 7244
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7245
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7247
    __ARG_1.'unget'($P2)
.annotate 'line', 7248
    .return($P1)
# }
.annotate 'line', 7249

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7253
    .tailcall WSubId_99(__ARG_1, __ARG_2)
# }
.annotate 'line', 7254

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7269
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7270
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7271
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7272
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7273
    .return($S1)
# }
.annotate 'line', 7274

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7277
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7278
    unless_null $P1, __label_1
.annotate 'line', 7279
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7280
    .return($P1)
# }
.annotate 'line', 7281

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7265
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7290
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7291
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7292
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7293
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7294
    .return($S1)
# }
.annotate 'line', 7295

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7298
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7299
    unless_null $P1, __label_1
.annotate 'line', 7300
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7301
    .return($P1)
# }
.annotate 'line', 7302

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7284
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7286
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7318
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7319
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7320
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7321
    __ARG_2.'unget'($P1)
.annotate 'line', 7322
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 7324

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7327
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7328
    if_null $P1, __label_1
.annotate 'line', 7329
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7330
    .return(self)
# }
.annotate 'line', 7331

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7335
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7336
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7339
    iseq $I3, $I1, 1
    unless $I3 goto __label_4
    isa $I4, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    set $I2, $I4
    goto __label_5
  __label_4:
    set $I2, $I3
  __label_5:
    unless $I2 goto __label_3
# {
.annotate 'line', 7340
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7341
    $P4 = $P2.'cantailcall'()
    unless $P4 goto __label_7
    getattribute $P6, self, 'owner'
    $P5 = $P6.'allowtailcall'()
    set $P3, $P5
    goto __label_8
  __label_7:
    set $P3, $P4
  __label_8:
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 7342
    self.'annotate'(__ARG_1)
.annotate 'line', 7343
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 7347
    le $I1, 0, __label_9
.annotate 'line', 7348
    $P1.'getargvalues'(__ARG_1)
  __label_9: # endif
.annotate 'line', 7350
    self.'annotate'(__ARG_1)
.annotate 'line', 7351
    self.'emitret'(__ARG_1)
.annotate 'line', 7352
    le $I1, 0, __label_10
.annotate 'line', 7353
    $P1.'emitargs'(__ARG_1)
  __label_10: # endif
.annotate 'line', 7354
    __ARG_1.'say'(')')
# }
.annotate 'line', 7355

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7312
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7314
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7362
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7363

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7366
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 7367

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7358
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
.annotate 'line', 7374
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7375

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7378
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 7379

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7370
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7392
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7393
    setattribute self, 'name', __ARG_1
.annotate 'line', 7394
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 7395

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7396
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7399
    self.'annotate'(__ARG_1)
.annotate 'line', 7400
    getattribute $P1, self, 'value'
# builtin string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 7401

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7386
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7388
    addattribute $P0, 'name'
.annotate 'line', 7389
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7415
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7416
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 7417

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7418
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7421
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7422
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7423
    .return($S2)
# }
.annotate 'line', 7424

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7410
    addattribute $P0, 'owner'
.annotate 'line', 7411
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 7437
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7438
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7439
    WSubId_102($P1)
.annotate 'line', 7440
    setattribute self, 'label', $P1
.annotate 'line', 7441
    WSubId_62(';', __ARG_2)
# }
.annotate 'line', 7442

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7443
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7446
    self.'annotate'(__ARG_1)
.annotate 'line', 7447
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7448
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7449
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 7450

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7431
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7433
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 7461
    $P1 = WSubId_45(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 7462

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 7465
    WSubId_62('(', __ARG_1)
.annotate 'line', 7466
    $P1 = WSubId_45(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7467
    WSubId_62(')', __ARG_1)
# }
.annotate 'line', 7468

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7457
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
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 7481
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7482
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7483
    $P3 = WSubId_103(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7484
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7485
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7486
    $P4 = WSubId_103(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7488
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7489
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7491

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7494
    self.'optimize_condition'()
.annotate 'line', 7495
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7496
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 7497
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7499
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7501
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7503
    .return(self)
# }
.annotate 'line', 7504

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7507
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7508
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7509
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7510
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7511
# elselabel: $S1
    set $S1, ''
.annotate 'line', 7512
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7513
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7514
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7515
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7516
    self.'annotate'(__ARG_1)
.annotate 'line', 7517
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7518
    $P1.'emit'(__ARG_1)
.annotate 'line', 7520
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7521
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7522
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7523
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7525
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7526

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7475
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7477
    addattribute $P0, 'truebranch'
.annotate 'line', 7478
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 7538
    $P2 = WSubId_103(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7539

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7542
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7543
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7545
    self.'annotate'(__ARG_1)
.annotate 'line', 7546
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7547
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7548
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7549
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7550

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7533
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7535
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7561
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7562
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7563
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7564

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7567
    self.'optimize_condition'()
.annotate 'line', 7568
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7569
    .return(self)
# }
.annotate 'line', 7570

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7573
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7575
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7578
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7581
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7582
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7584
    self.'annotate'(__ARG_1)
.annotate 'line', 7585
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7586
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7587
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7588
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7589
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7591

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7557
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
.const 'Sub' WSubId_104 = "WSubId_104"
# Body
# {
.annotate 'line', 7602
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7603
    self.'parsebody'(__ARG_2)
.annotate 'line', 7604
    WSubId_104('while', __ARG_2)
.annotate 'line', 7605
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7606

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7609
    self.'optimize_condition'()
.annotate 'line', 7610
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7611
    $P3 = $P1.'isempty'()
    unless $P3 goto __label_2
    $P4 = self.'getvalue'()
    set $I2, $P4
    iseq $I1, $I2, 2
    box $P2, $I1
    goto __label_3
  __label_2:
    set $P2, $P3
  __label_3:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7612
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 7613
    setattribute self, 'body', $P1
.annotate 'line', 7614
    .return(self)
# }
.annotate 'line', 7615

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7618
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7619
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7620
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7622
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7625
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7626
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7627
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7629
    self.'annotate'(__ARG_1)
.annotate 'line', 7630
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7632
    $P1.'emit'(__ARG_1)
.annotate 'line', 7633
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7634
    eq $I1, 2, __label_7
.annotate 'line', 7635
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7636
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7638

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7598
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
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 7649
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7650
    WSubId_62(';', __ARG_2)
# }
.annotate 'line', 7651

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7652
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7655
    self.'annotate'(__ARG_1)
.annotate 'line', 7656
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7657
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7658

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7645
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 7669
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7670
    WSubId_62(';', __ARG_2)
# }
.annotate 'line', 7671

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7672
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7675
    self.'annotate'(__ARG_1)
.annotate 'line', 7676
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7677
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7678

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7665
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7693
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7694
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7695
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7696
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7697

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 7700
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7701
    $P1 = __ARG_1.'get'()
    $P4 = $P1.'iskeyword'('case')
    if $P4 goto __label_3
    $P5 = $P1.'iskeyword'('default')
    set $P3, $P5
    goto __label_4
  __label_3:
    set $P3, $P4
  __label_4:
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7702
    $P6 = $P1.'iskeyword'('case')
    if_null $P6, __label_5
    unless $P6 goto __label_5
# {
.annotate 'line', 7703
    getattribute $P7, self, 'case_value'
    $P8 = WSubId_45(__ARG_1, self)
# builtin push
    push $P7, $P8
.annotate 'line', 7704
    $P1 = __ARG_1.'get'()
.annotate 'line', 7705
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_7
.annotate 'line', 7706
    WSubId_48("':' in case", $P1)
  __label_7: # endif
.annotate 'line', 7707
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_9: # while
.annotate 'line', 7708
    $P1 = __ARG_1.'get'()
    $P5 = $P1.'isop'('}')
    if $P5 goto __label_12
    $P6 = $P1.'iskeyword'('case')
    set $P4, $P6
    goto __label_13
  __label_12:
    set $P4, $P5
  __label_13:
    if $P4 goto __label_10
    $P7 = $P1.'iskeyword'('default')
    set $P3, $P7
    goto __label_11
  __label_10:
    set $P3, $P4
  __label_11:
    isfalse $I1, $P3
    unless $I1 goto __label_8
# {
.annotate 'line', 7709
    __ARG_1.'unget'($P1)
.annotate 'line', 7710
    $P3 = WSubId_103(__ARG_1, self)
# builtin push
    push $P2, $P3
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 7712
    getattribute $P3, self, 'case_st'
# builtin push
    push $P3, $P2
.annotate 'line', 7713
    __ARG_1.'unget'($P1)
# }
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 7716
    $P1 = __ARG_1.'get'()
.annotate 'line', 7717
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_14
.annotate 'line', 7718
    WSubId_48("':' in default", $P1)
  __label_14: # endif
  __label_16: # while
.annotate 'line', 7719
    $P1 = __ARG_1.'get'()
    $P5 = $P1.'isop'('}')
    if $P5 goto __label_19
    $P6 = $P1.'iskeyword'('case')
    set $P4, $P6
    goto __label_20
  __label_19:
    set $P4, $P5
  __label_20:
    if $P4 goto __label_17
    $P7 = $P1.'iskeyword'('default')
    set $P3, $P7
    goto __label_18
  __label_17:
    set $P3, $P4
  __label_18:
    isfalse $I1, $P3
    unless $I1 goto __label_15
# {
.annotate 'line', 7720
    __ARG_1.'unget'($P1)
.annotate 'line', 7721
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_103(__ARG_1, self)
# builtin push
    push $P3, $P4
# }
    goto __label_16
  __label_15: # endwhile
.annotate 'line', 7723
    __ARG_1.'unget'($P1)
# }
  __label_6: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7726
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_21
.annotate 'line', 7727
    WSubId_48("'}' in switch", $P1)
  __label_21: # endif
# }
.annotate 'line', 7728

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 7731
    getattribute $P2, self, 'case_value'
    WSubId_46($P2)
.annotate 'line', 7732
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7733
    WSubId_46($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7734
    getattribute $P2, self, 'default_st'
    WSubId_46($P2)
# }
.annotate 'line', 7735

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7685
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7687
    addattribute $P0, 'case_value'
.annotate 'line', 7688
    addattribute $P0, 'case_st'
.annotate 'line', 7689
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 7748
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7749
    $P3 = WSubId_45(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7750
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7751
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7752
    WSubId_48("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7753
    $P1 = __ARG_2.'get'()
.annotate 'line', 7754
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7755
    WSubId_48("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7756
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7757

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7760
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7761
    self.'optimize_cases'()
.annotate 'line', 7762
    .return(self)
# }
.annotate 'line', 7763

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 7767
# type: $S1
    set $S1, ''
.annotate 'line', 7768
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7769
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7770
    ne $S2, 'N', __label_4
.annotate 'line', 7771
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7772
    ne $S1, '', __label_5
.annotate 'line', 7773
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7774
    eq $S1, $S2, __label_7
.annotate 'line', 7775
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7778
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7779
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7783
    ne $S1, '', __label_8
.annotate 'line', 7784
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7786
    __ARG_1.'comment'('switch')
.annotate 'line', 7787
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7788
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7789
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7791
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7792
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7796
    self.'genbreaklabel'()
.annotate 'line', 7797
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7798
    new $P4, ['ResizableStringArray']
.annotate 'line', 7799
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7800
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7801
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7802
# builtin push
    push $P4, $S7
.annotate 'line', 7803
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7804
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7806
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7809
    self.'annotate'(__ARG_1)
.annotate 'line', 7810
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7811
# n: $I1
    set $I1, $P6
# for loop
.annotate 'line', 7812
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7813
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7814
    $P7 = $P6[$I2]
    WSubId_60(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7812
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7817
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7818
    getattribute $P7, self, 'default_st'
    WSubId_60(__ARG_1, $P7)
.annotate 'line', 7820
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7821

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7742
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7744
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7833
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7834
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7835

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7838
    self.'optimize_cases'()
.annotate 'line', 7839
    .return(self)
# }
.annotate 'line', 7840

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 7844
    self.'genbreaklabel'()
.annotate 'line', 7845
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7846
    new $P1, ['ResizableStringArray']
.annotate 'line', 7848
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7849
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7850
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7851
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7852
# builtin push
    push $P1, $S3
.annotate 'line', 7853
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7854
    __ARG_1.'emitif'($S2, $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7856
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7859
    self.'annotate'(__ARG_1)
.annotate 'line', 7860
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7861
# n: $I1
    set $I1, $P3
# for loop
.annotate 'line', 7862
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7863
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7864
    $P4 = $P3[$I2]
    WSubId_60(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7862
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7867
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7868
    getattribute $P4, self, 'default_st'
    WSubId_60(__ARG_1, $P4)
.annotate 'line', 7870
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7871

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7828
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 7878
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7879
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7880
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7881
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7882
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7883
    WSubId_48("'(' in switch", $P1)
# }
.annotate 'line', 7884

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 7897
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7898
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7899
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7900
    __ARG_2.'unget'($P1)
.annotate 'line', 7901
    $P3 = WSubId_103(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7903
    $P1 = __ARG_2.'get'()
.annotate 'line', 7904
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7905
    __ARG_2.'unget'($P1)
.annotate 'line', 7906
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7907
    WSubId_62(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7909
    $P1 = __ARG_2.'get'()
.annotate 'line', 7910
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7911
    __ARG_2.'unget'($P1)
.annotate 'line', 7912
    $P3 = WSubId_45(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7913
    WSubId_62(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7915
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7916

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7919
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7920
    if_null $P1, __label_1
.annotate 'line', 7921
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7922
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7923
    self.'optimize_condition'()
.annotate 'line', 7924
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7925
    if_null $P1, __label_4
.annotate 'line', 7926
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7928
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7931
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7932
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7933
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7934
    .return(self)
# }
.annotate 'line', 7935

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7938
    getattribute $P1, self, 'initializer'
    isnull $I3, $P1
    unless $I3 goto __label_4
.annotate 'line', 7939
    getattribute $P2, self, 'condexpr'
    isnull $I4, $P2
    set $I2, $I4
    goto __label_5
  __label_4:
    set $I2, $I3
  __label_5:
    unless $I2 goto __label_2
.annotate 'line', 7940
    getattribute $P3, self, 'iteration'
    isnull $I5, $P3
    set $I1, $I5
    goto __label_3
  __label_2:
    set $I1, $I2
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7941
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7942
    .return()
# }
  __label_1: # endif
.annotate 'line', 7944
    __ARG_1.'comment'('for loop')
.annotate 'line', 7945
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_6
    set $S1, $P1
  __label_6:
.annotate 'line', 7946
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_7
    set $S2, $P1
  __label_7:
.annotate 'line', 7947
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 7948
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_9
.annotate 'line', 7949
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_9: # endif
.annotate 'line', 7951
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7952
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_10
.annotate 'line', 7953
    self.'emit_else'(__ARG_1, $S2)
  __label_10: # endif
.annotate 'line', 7955
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7956
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7957
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_11
.annotate 'line', 7958
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_12
    set $S4, $P2
  __label_12:
  __label_11: # endif
.annotate 'line', 7959
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7961
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7962

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7890
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7892
    addattribute $P0, 'initializer'
.annotate 'line', 7893
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 7977
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7978
# sname: $S1
    null $S1
    if_null __ARG_4, __label_1
    set $S1, __ARG_4
  __label_1:
.annotate 'line', 7979
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7980
# deftype: $S2
    $P1 = WSubId_105(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7981
    self.'createvar'($S1, $S2)
.annotate 'line', 7982
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7984
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7985
    $P2 = WSubId_45(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7986
    WSubId_62(')', __ARG_2)
.annotate 'line', 7987
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7988

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7991
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7995
    $P3 = $P1.'isnull'()
    if $P3 goto __label_2
.annotate 'line', 7996
    $P5 = $P1.'isstringliteral'()
    unless $P5 goto __label_4
.annotate 'line', 7997
    $P6 = $P1.'get_value'()
    set $S1, $P6
# builtin length
    length $I2, $S1
    iseq $I1, $I2, 0
    box $P4, $I1
    goto __label_5
  __label_4:
    set $P4, $P5
  __label_5:
    set $P2, $P4
    goto __label_3
  __label_2:
    set $P2, $P3
  __label_3:
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7998
    new $P7, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P7)
  __label_1: # endif
.annotate 'line', 8000
    setattribute self, 'container', $P1
.annotate 'line', 8001
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 8002
    .return(self)
# }
.annotate 'line', 8003

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_69 = "WSubId_69"
# Body
# {
.annotate 'line', 8006
    self.'annotate'(__ARG_1)
.annotate 'line', 8007
# regcont: $S1
    null $S1
.annotate 'line', 8008
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 8009
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 8010
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 8011
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8014
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 8016
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 8017
    unless_null $P1, __label_4
.annotate 'line', 8018
    getattribute $P2, self, 'varname'
    WSubId_69($P2)
  __label_4: # endif
.annotate 'line', 8020
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 8021
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 8022
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 8023
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 8024
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 8025
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 8026
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 8027
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 8028
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 8029
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 8030
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 8031
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 8032

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7969
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7971
    addattribute $P0, 'deftype'
.annotate 'line', 7972
    addattribute $P0, 'varname'
.annotate 'line', 7973
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 8039
    WSubId_62('(', __ARG_2)
.annotate 'line', 8040
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8041
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8042
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 8043
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8045
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 8046
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8047
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 8048
    __ARG_2.'unget'($P3)
.annotate 'line', 8049
    __ARG_2.'unget'($P2)
.annotate 'line', 8050
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 8052
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 8053

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 8065
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8066
    $P2 = WSubId_45(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 8067

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8070
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 8071
    .return(self)
# }
.annotate 'line', 8072

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8075
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 8076
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8077
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 8078
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    set $S4, 'P'
    if $S3 == $S4 goto __label_4
    set $S4, 'S'
    if $S3 == $S4 goto __label_5
    goto __label_3
  __label_4: # case
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 8084
# msg: $S2
    set $S2, $S1
.annotate 'line', 8085
    $P3 = self.'tempreg'('P')
    set $S1, $P3
.annotate 'line', 8086
    __ARG_1.'say'('    ', 'root_new ', $S1, ", ['parrot';'Exception']")
.annotate 'line', 8087
    concat $S5, '    ', $S1
    concat $S5, $S5, "['message'] = "
    __ARG_1.'say'($S5, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 8090
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
.annotate 'line', 8092
    __ARG_1.'emitarg1'('throw', $S1)
# }
.annotate 'line', 8093

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 8059
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8061
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8105
    setattribute self, 'start', __ARG_1
.annotate 'line', 8106
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 8107

.end # TryModifierList


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8110
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8111

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8114
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 8115
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 8116
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 8117
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 8118
    set $S3, $S1
    set $S4, 'min_severity'
    if $S3 == $S4 goto __label_6
    set $S4, 'max_severity'
    if $S3 == $S4 goto __label_7
    set $S4, 'handle_types'
    if $S3 == $S4 goto __label_8
    set $S4, 'handle_types_except'
    if $S3 == $S4 goto __label_9
    set $S4, 'allowtailcall'
    if $S3 == $S4 goto __label_10
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 8121
    eq $I1, 1, __label_11
.annotate 'line', 8122
    WSubId_1('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 8123
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 8124
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_12
    set $S2, $P7
  __label_12:
.annotate 'line', 8125
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 8129
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 8130
# i: $I2
    null $I2
  __label_15: # for condition
    ge $I2, $I1, __label_14
# {
.annotate 'line', 8131
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 8132
    $P7 = $P5.'emit_get'(__ARG_1)
# builtin push
    push $P4, $P7
# }
  __label_13: # for iteration
.annotate 'line', 8130
    inc $I2
    goto __label_15
  __label_14: # for end
.annotate 'line', 8135
# builtin join
    join $S3, ', ', $P4
.annotate 'line', 8134
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_10: # case
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8140
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    WSubId_1($S4, $P7)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8143

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 8100
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 8102
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 8155
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8156
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8157
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8158
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8160
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8162
    $P3 = WSubId_103(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 8163
    $P1 = __ARG_2.'get'()
.annotate 'line', 8164
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 8165
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 8166
    $P1 = __ARG_2.'get'()
.annotate 'line', 8167
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8168
    WSubId_48("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 8169
    $P1 = __ARG_2.'get'()
.annotate 'line', 8170
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 8171
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8172
    setattribute self, 'exname', $P1
.annotate 'line', 8173
    self.'createvar'($S1, 'P')
.annotate 'line', 8174
    $P1 = __ARG_2.'get'()
.annotate 'line', 8175
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 8176
    WSubId_48("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 8178
    $P3 = WSubId_103(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 8179

.end # TryStatement


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8182
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8183
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8185
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 8186

.end # allowtailcall


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8189
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8190
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 8191
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 8192
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 8193
    .return(self)
# }
.annotate 'line', 8194

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8197
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8198
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8199
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 8200
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 8201
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 8202
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 8204
    self.'annotate'(__ARG_1)
.annotate 'line', 8205
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 8207
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 8208
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 8210
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 8211
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 8213
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 8214
    __ARG_1.'comment'('try: begin')
.annotate 'line', 8215
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8216
    __ARG_1.'comment'('try: end')
.annotate 'line', 8217
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8219
    self.'annotate'(__ARG_1)
.annotate 'line', 8220
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8222
    __ARG_1.'comment'('catch')
.annotate 'line', 8223
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 8224
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 8225
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 8226
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8227
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8229
    __ARG_1.'comment'('catch end')
.annotate 'line', 8230
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 8231

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 8146
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8148
    addattribute $P0, 'stry'
.annotate 'line', 8149
    addattribute $P0, 'modifiers'
.annotate 'line', 8150
    addattribute $P0, 'exname'
.annotate 'line', 8151
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
.annotate 'line', 8244
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8245
    setattribute self, 'name', __ARG_3
.annotate 'line', 8246
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 8247
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8248

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 8238
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8240
    addattribute $P0, 'name'
.annotate 'line', 8241
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
# Body
# {
.annotate 'line', 8263
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8264
    setattribute self, 'name', __ARG_3
.annotate 'line', 8265
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 8266
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 8267
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8268

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 8255
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8257
    addattribute $P0, 'name'
.annotate 'line', 8258
    addattribute $P0, 'basetype'
.annotate 'line', 8259
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 8279
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 8280
# var t: $P1
    $P1 = __ARG_5.'get'()
.annotate 'line', 8281
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8283
    $P4 = WSubId_45(__ARG_5, self)
    setattribute self, 'init', $P4
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8286
    __ARG_5.'unget'($P1)
  __label_2: # endif
# }
.annotate 'line', 8287

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8290
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8291
    if_null $P1, __label_1
.annotate 'line', 8292
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8293
    .return(self)
# }
.annotate 'line', 8294

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_24 = "WSubId_24"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8297
    self.'annotate'(__ARG_1)
.annotate 'line', 8298
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8299
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8300
# ireg: $S3
    null $S3
.annotate 'line', 8301
# basetype: $S4
    getattribute $P2, self, 'basetype'
    null $S4
    if_null $P2, __label_3
    set $S4, $P2
  __label_3:
.annotate 'line', 8302
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8303
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 8305
    isnull $I1, $P1
    if $I1 goto __label_6
    $P3 = $P1.'isnull'()
    set $P2, $P3
    goto __label_7
  __label_6:
    box $P2, $I1
  __label_7:
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8306
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8308
# itype: $S5
    $P4 = $P1.'checkresult'()
    null $S5
    if_null $P4, __label_8
    set $S5, $P4
  __label_8:
.annotate 'line', 8309
    ne $S5, $S4, __label_9
.annotate 'line', 8310
    $P1.'emit'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 8312
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_11
# {
.annotate 'line', 8314
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 8316
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_13
    unless $P2 goto __label_13
# {
# switch
.annotate 'line', 8317
    set $S7, $S4
    set $S8, 'I'
    if $S7 == $S8 goto __label_17
    set $S8, 'N'
    if $S7 == $S8 goto __label_18
    set $S8, 'S'
    if $S7 == $S8 goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 8319
    $P3 = WSubId_25($P1)
    set $S3, $P3
.annotate 'line', 8320
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_18: # case
.annotate 'line', 8323
    $P4 = WSubId_106($P1)
    set $S3, $P4
.annotate 'line', 8324
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_19: # case
.annotate 'line', 8327
    $P5 = WSubId_24($P1)
    set $S3, $P5
.annotate 'line', 8328
    __ARG_1.'emitset'($S2, $S3)
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 8331
    WSubId_6("Wrong type", self)
  __label_15: # switch end
# }
    goto __label_14
  __label_13: # else
# {
# switch
.annotate 'line', 8335
    set $S7, $S5
    set $S8, 'v'
    if $S7 == $S8 goto __label_22
    goto __label_21
  __label_22: # case
.annotate 'line', 8337
    WSubId_1('Invalid initialization from void value', self)
  __label_21: # default
.annotate 'line', 8339
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S3, $P2
  __label_20: # switch end
.annotate 'line', 8341
    iseq $I2, $S4, 'S'
    unless $I2 goto __label_25
    iseq $I3, $S5, 'P'
    set $I1, $I3
    goto __label_26
  __label_25:
    set $I1, $I2
  __label_26:
    unless $I1 goto __label_23
# {
.annotate 'line', 8342
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_27
    set $S6, $P2
  __label_27:
.annotate 'line', 8343
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8344
    __ARG_1.'emitif_null'($S3, $S6)
.annotate 'line', 8345
    __ARG_1.'emitset'($S2, $S3)
.annotate 'line', 8346
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_24
  __label_23: # else
.annotate 'line', 8349
    __ARG_1.'emitset'($S2, $S3)
  __label_24: # endif
# }
  __label_14: # endif
  __label_12: # endif
# }
  __label_10: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 8353

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8273
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8275
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
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 8368
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 8369
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 8370
# var t: $P1
    $P1 = __ARG_6.'get'()
.annotate 'line', 8371
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8373
    __ARG_6.'unget'($P1)
.annotate 'line', 8374
    $P3 = WSubId_45(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 8375
    WSubId_62(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 8377
    $P1 = __ARG_6.'get'()
.annotate 'line', 8378
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 8379
    $P1 = __ARG_6.'get'()
.annotate 'line', 8380
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8381
    WSubId_48("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 8382
    $P1 = __ARG_6.'get'()
.annotate 'line', 8383
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 8384
    __ARG_6.'unget'($P1)
.annotate 'line', 8385
    $P3 = WSubId_44(__ARG_6, self, WSubId_45, ']')
    setattribute self, 'initarray', $P3
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 8389
    __ARG_6.'unget'($P1)
  __label_3: # endif
# }
.annotate 'line', 8390

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 8393
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8394
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8395
    getattribute $P1, self, 'initarray'
    WSubId_46($P1)
.annotate 'line', 8396
    .return(self)
# }
.annotate 'line', 8397

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8400
    self.'annotate'(__ARG_1)
.annotate 'line', 8402
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 8403
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 8404
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 8405
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 8406
# arraytype: $S1
# builtin string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S5, $S4, 'Array'
    set $S1, $S5
.annotate 'line', 8407
    if_null $P2, __label_1
# {
.annotate 'line', 8409
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 8410
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8414
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 8416
    if_null $P3, __label_4
# {
.annotate 'line', 8417
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 8418
# n: $I1
# builtin elements
    elements $I1, $P3
.annotate 'line', 8419
    unless_null $P2, __label_6
# {
.annotate 'line', 8420
    unless $I1 goto __label_7
# {
.annotate 'line', 8422
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 8425
# i: $I2
    null $I2
.annotate 'line', 8426
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 8427
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 8428
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 8429
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 8432

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8358
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8360
    addattribute $P0, 'size'
.annotate 'line', 8361
    addattribute $P0, 'initarray'
.annotate 'line', 8362
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8439
# var next: $P1
    null $P1
.annotate 'line', 8440
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 8441
# {
.annotate 'line', 8442
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 8443
    WSubId_102($P3)
.annotate 'line', 8444
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8445
# var item: $P5
    null $P5
.annotate 'line', 8446
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8447
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8449
    __ARG_4.'unget'($P4)
.annotate 'line', 8450
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 8452
    $P2 = WSubId_107($P2, $P5)
.annotate 'line', 8453
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 8454
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8455
    WSubId_4(';', $P1)
.annotate 'line', 8456
    .return($P2)
# }
.annotate 'line', 8457

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8465
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 8466

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8461
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
.annotate 'line', 8473
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 8474

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8469
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8480
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8481

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8485
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8486

.end # newIntArray


.sub 'parseInt' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 8490
    .tailcall WSubId_108(WSubId_109, WSubId_110, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8491

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8499
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 8500

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8495
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
.annotate 'line', 8507
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 8508

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8503
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8514
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8515

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8519
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8520

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_112 = "WSubId_112"
# Body
# {
.annotate 'line', 8524
    .tailcall WSubId_108(WSubId_111, WSubId_112, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8525

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8533
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 8534

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8529
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
.annotate 'line', 8541
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 8542

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8537
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8548
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8549

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8553
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8554

.end # newStringArray


.sub 'parseString' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_114 = "WSubId_114"
# Body
# {
.annotate 'line', 8558
    .tailcall WSubId_108(WSubId_113, WSubId_114, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8559

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
.annotate 'line', 8575
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8576
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8577
    setattribute self, 'name', __ARG_4
.annotate 'line', 8578
    setattribute self, 'value', __ARG_5
.annotate 'line', 8579
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8580

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8583
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8584
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8585
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8586
    $P1 = $P1.'optimize'()
.annotate 'line', 8587
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8588
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8591
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8592
    .return(self)
# }
.annotate 'line', 8593

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8596
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8597

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8600
# builtin string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8601

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8565
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8567
    addattribute $P0, 'type'
.annotate 'line', 8568
    addattribute $P0, 'name'
.annotate 'line', 8569
    addattribute $P0, 'data'
.annotate 'line', 8570
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_107 = "WSubId_107"
# Body
# {
.annotate 'line', 8606
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8607
# type: $S1
    $P5 = WSubId_105($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8608
    isne $I3, $S1, 'I'
    unless $I3 goto __label_5
    isne $I4, $S1, 'N'
    set $I2, $I4
    goto __label_6
  __label_5:
    set $I2, $I3
  __label_6:
    unless $I2 goto __label_3
    isne $I5, $S1, 'S'
    set $I1, $I5
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_2
.annotate 'line', 8609
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8611
# var multi: $P2
    null $P2
  __label_7: # do
.annotate 'line', 8612
# {
.annotate 'line', 8613
    $P1 = __ARG_2.'get'()
.annotate 'line', 8614
# var name: $P3
    set $P3, $P1
.annotate 'line', 8615
    WSubId_62('=', __ARG_2)
.annotate 'line', 8616
# var value: $P4
    $P4 = WSubId_45(__ARG_2, __ARG_3)
.annotate 'line', 8618
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8617
    $P2 = WSubId_107($P2, $P5)
# }
  __label_9: # continue
.annotate 'line', 8619
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_8
    if $P5 goto __label_7
  __label_8: # enddo
.annotate 'line', 8620
    .return($P2)
# }
.annotate 'line', 8621

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8632
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8633
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8634
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8635
    $P4 = WSubId_45(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8636
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8638
    WSubId_4(';', $P1)
# }
.annotate 'line', 8639

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8642
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8643
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8644
    .return(self)
# }
.annotate 'line', 8645

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8648
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8649

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8652
    self.'annotate'(__ARG_1)
.annotate 'line', 8653
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8654
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8655
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8656
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8657
    if_null $P1, __label_3
.annotate 'line', 8658
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8659
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8660
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8661
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
.annotate 'line', 8663
    isa $I3, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I3 goto __label_18
    isa $I4, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    set $I2, $I4
    goto __label_19
  __label_18:
    set $I2, $I3
  __label_19:
    if $I2 goto __label_16
    isa $I5, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    set $I1, $I5
    goto __label_17
  __label_16:
    set $I1, $I2
  __label_17:
    unless $I1 goto __label_14
.annotate 'line', 8664
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8666
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8671
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_20
    set $S3, $P3
  __label_20:
.annotate 'line', 8672
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8675
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8677
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8681
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8682

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8627
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8629
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 8689
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8690
    WSubId_62(';', __ARG_2)
# }
.annotate 'line', 8691

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8694
    self.'annotate'(__ARG_1)
.annotate 'line', 8695
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8696
# builtin string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8697
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8698

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8685
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 8707
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8708
    $P2 = WSubId_45(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8709
    WSubId_62(']', __ARG_2)
.annotate 'line', 8710
    WSubId_62(';', __ARG_2)
# }
.annotate 'line', 8711

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8714
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8715
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8716

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8719
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8720
    self.'annotate'(__ARG_1)
.annotate 'line', 8721
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8722
# builtin string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8723
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8724

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8701
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8703
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_102 = "WSubId_102"
# Body
# {
.annotate 'line', 8729
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8730
    WSubId_102($P1)
.annotate 'line', 8731
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8732
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8733
    $P2 = __ARG_2.'get'()
.annotate 'line', 8734
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8735
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8737
    __ARG_2.'unget'($P2)
.annotate 'line', 8738
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
.annotate 'line', 8742
    __ARG_2.'unget'($P2)
.annotate 'line', 8743
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8745

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 8749
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8750
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8751
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8752
    .tailcall WSubId_54(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8753

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8766
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8767
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8768
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8769
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8770
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8771
    __ARG_2.'unget'($P1)
.annotate 'line', 8772
# var c: $P2
    $P2 = WSubId_103(__ARG_2, self)
.annotate 'line', 8773
    unless_null $P2, __label_3
.annotate 'line', 8774
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8775
    getattribute $P3, self, 'statements'
# builtin push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8777
    setattribute self, 'end', $P1
# }
.annotate 'line', 8778

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8781
# s: $S1
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 8782
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8783
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8784
    isnull $I2, $S2
    if $I2 goto __label_3
    iseq $I3, $S2, ''
    set $I1, $I3
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_2
.annotate 'line', 8785
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8786
    .return($S2)
# }
.annotate 'line', 8787

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8790
# s: $S1
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
.annotate 'line', 8791
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8792
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8793
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_3
    isne $I3, $S2, ''
    set $I1, $I3
    goto __label_4
  __label_3:
    set $I1, $I2
  __label_4:
    unless $I1 goto __label_2
.annotate 'line', 8794
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8795
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 8796
    $P1[$S1] = $S3
.annotate 'line', 8797
    .return($S3)
# }
.annotate 'line', 8798

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8799
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8802
    __ARG_1.'comment'('{')
.annotate 'line', 8803
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8804
    $P1.'emit'(__ARG_1)
.annotate 'line', 8805
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8807
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8808

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8759
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8761
    addattribute $P0, 'end'
.annotate 'line', 8762
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8823
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8825
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8826
    new $P1, ['ResizableStringArray']
.annotate 'line', 8827
    new $P2, ['ResizableStringArray']
.annotate 'line', 8828
    setattribute self, 'tempreg', $P1
.annotate 'line', 8829
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8830

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8833
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8834
# i: $I1
    set $I1, $P1
.annotate 'line', 8835
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8836
    assign $P1, $I1
# builtin string
.annotate 'line', 8837
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8838

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8841
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8842
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8843
# reg: $S1
    null $S1
.annotate 'line', 8844
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 8845
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8847
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8848
# builtin push
    push $P2, $S1
.annotate 'line', 8849
    .return($S1)
# }
.annotate 'line', 8850

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8853
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8854
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8855
# n: $I1
# builtin elements
    elements $I1, $P2
# for loop
.annotate 'line', 8856
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8857
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8858
# builtin push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8856
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8860
    assign $P2, 0
# }
.annotate 'line', 8861

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8817
    addattribute $P0, 'type'
.annotate 'line', 8818
    addattribute $P0, 'nreg'
.annotate 'line', 8819
    addattribute $P0, 'tempreg'
.annotate 'line', 8820
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8872
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8873

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8876
# var named: $P1
    null $P1
.annotate 'line', 8877
# var slurpy: $P2
    null $P2
.annotate 'line', 8878
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8879
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8880
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8881
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8883
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8886
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8889
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8893
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_11
    isnull $I3, $P2
    not $I3
    set $I1, $I3
    goto __label_12
  __label_11:
    set $I1, $I2
  __label_12:
    if $I1 goto __label_10
.annotate 'line', 8900
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_13
.annotate 'line', 8917
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_14
    goto __label_9
  __label_10: # case
.annotate 'line', 8898
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8901
# setname: $S2
    null $S2
# switch
.annotate 'line', 8902
    $P7 = $P1.'numargs'()
    set $I4, $P7
    null $I5
    if $I4 == $I5 goto __label_17
    set $I5, 1
    if $I4 == $I5 goto __label_18
    goto __label_16
  __label_17: # case
.annotate 'line', 8904
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_15 # break
  __label_18: # case
.annotate 'line', 8907
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8908
    $P8 = $P5.'isstringliteral'()
    isfalse $I6, $P8
    unless $I6 goto __label_19
.annotate 'line', 8909
    WSubId_1('Invalid modifier', __ARG_2)
  __label_19: # endif
.annotate 'line', 8910
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 8913
    WSubId_1('Invalid modifier', __ARG_2)
  __label_15: # switch end
.annotate 'line', 8915
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_14: # case
.annotate 'line', 8918
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8919
# }
.annotate 'line', 8921

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8868
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8932
    setattribute self, 'func', __ARG_1
.annotate 'line', 8933
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8934
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_105($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8935
    eq $S1, '', __label_2
.annotate 'line', 8936
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8938
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8939
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 8940
# argname: $S2
# builtin string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S4, '__ARG_', $S3
    set $S2, $S4
.annotate 'line', 8941
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8943
# builtin string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8944
    $P1 = __ARG_2.'get'()
.annotate 'line', 8945
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8946
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8948
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8949

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_115 = "WSubId_115"
# Body
# {
.annotate 'line', 8952
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8953
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8954
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8955
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_115($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8956
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8957
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8958
    if_null $P3, __label_3
.annotate 'line', 8959
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8960
    __ARG_1.'say'('')
# }
.annotate 'line', 8961

.end # emit


.sub 'get_type' :method
# Body
# {
.annotate 'line', 8964
    getattribute $P1, self, 'type'
    .return($P1)
# }
.annotate 'line', 8965

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8926
    addattribute $P0, 'func'
.annotate 'line', 8927
    addattribute $P0, 'name'
.annotate 'line', 8928
    addattribute $P0, 'modifiers'
.annotate 'line', 8929
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8971
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8972

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8983
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8984
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8985

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8988
# var path: $P1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 8989
# reg: $S1
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8990
    self.'annotate'(__ARG_1)
.annotate 'line', 8991
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 8992
    .return($S1)
# }
.annotate 'line', 8993

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8978
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8980
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9004
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9005

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9008
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 9009
# name: $S1
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9011
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 9013
# nargmods: $I1
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 9014
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 9015
    le $I1, 0, __label_5
# {
.annotate 'line', 9016
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 9017
# iargmod: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 9018
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 9019
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 9020
    WSubId_1('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 9021
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 9022
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 9023
    __ARG_1.'print'(", ")
  __label_10: # endif
# }
  __label_6: # for iteration
.annotate 'line', 9017
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 9025
    __ARG_1.'print'(')')
# }
  __label_5: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9028

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 9000
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
.annotate 'line', 9033
# nargs: $I1
    $P4 = __ARG_2.'numargs'()
    set $I1, $P4
.annotate 'line', 9034
# var sig: $P1
    null $P1
.annotate 'line', 9035
    unless $I1 goto __label_1
# {
.annotate 'line', 9036
    root_new $P4, ['parrot';'ResizablePMCArray']
    set $P1, $P4
# for loop
.annotate 'line', 9037
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 9038
# var arg: $P2
    $P2 = __ARG_2.'getarg'($I2)
# switch-case
.annotate 'line', 9040
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 9043
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 9050
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 9041
    $P4 = $P2.'get_value'()
# builtin push
    push $P1, $P4
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9044
# name: $S1
    $P5 = $P2.'getName'()
    null $S1
    if_null $P5, __label_10
    set $S1, $P5
  __label_10:
.annotate 'line', 9045
    iseq $I7, $S1, "int"
    if $I7 goto __label_17
    iseq $I8, $S1, "float"
    set $I6, $I8
    goto __label_18
  __label_17:
    set $I6, $I7
  __label_18:
    if $I6 goto __label_15
    iseq $I9, $S1, "string"
    set $I5, $I9
    goto __label_16
  __label_15:
    set $I5, $I6
  __label_16:
    if $I5 goto __label_13
    iseq $I10, $S1, "var"
    set $I4, $I10
    goto __label_14
  __label_13:
    set $I4, $I5
  __label_14:
    unless $I4 goto __label_11
.annotate 'line', 9046
# builtin push
    push $P1, $S1
    goto __label_12
  __label_11: # else
.annotate 'line', 9048
    getattribute $P6, $P2, 'start'
    WSubId_1("unsupported multi signature", $P6)
  __label_12: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9051
# var key: $P3
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 9052
    unless_null $P3, __label_19
.annotate 'line', 9053
    getattribute $P7, $P2, 'start'
    WSubId_1("class not found", $P7)
  __label_19: # endif
.annotate 'line', 9055
    $P8 = WSubId_26($P3)
# builtin push
    push $P1, $P8
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9058
    getattribute $P9, $P2, 'start'
    WSubId_1("unsupported multi signature", $P9)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9037
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
.annotate 'line', 9062
    .return($P1)
# }
.annotate 'line', 9063

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9085
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9086
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 9087
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 9088
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 9089
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 9090
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 9091

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 9093
    .return(self)
# }

.end # getouter


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 9096
    .return(1)
# }
.annotate 'line', 9097

.end # allowtailcall


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 9101
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 9102
    unless_null $P1, __label_1
.annotate 'line', 9103
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 9104
    .return($P1)
# }
.annotate 'line', 9105

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9108
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 9109
    unless_null $P1, __label_1
.annotate 'line', 9110
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 9111
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9112

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9116
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 9117
    .return($I1)
# }
.annotate 'line', 9118

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_116 = "WSubId_116"
# Body
# {
.annotate 'line', 9121
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9122
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 9123
    __ARG_1.'unget'($P1)
.annotate 'line', 9124
    $P3 = WSubId_44(__ARG_1, self, WSubId_116, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 9126

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9130
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 9131
    unless_null $P1, __label_1
.annotate 'line', 9132
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 9134
# builtin push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 9135

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9138
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9139
    unless_null $P1, __label_1
# {
.annotate 'line', 9141
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9144
    if_null $P1, __label_4
    iter $P5, $P1
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 9145
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 9146
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9147
# builtin push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 9149

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9152
# var found: $P1
    null $P1
.annotate 'line', 9153
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 9154
    $P1 = $P2.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 9155
    if_null $P1, __label_3
.annotate 'line', 9156
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9158
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9159

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_117 = "WSubId_117"
# Body
# {
.annotate 'line', 9163
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9164
    if_null $P1, __label_1
# {
.annotate 'line', 9165
# var multi: $P2
    $P2 = $P1.'pick'('multi')
.annotate 'line', 9166
    if_null $P2, __label_2
# {
.annotate 'line', 9168
    self.'setmulti'()
.annotate 'line', 9169
    $P5 = WSubId_117(self, $P2)
    setattribute self, 'multi_sig', $P5
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 9172
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
.annotate 'line', 9173
    $P3.'fixnamespaces'()
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9174
    getattribute $P7, self, 'body'
    $P5 = $P7.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 9175
    .return(self)
# }
.annotate 'line', 9176

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9180
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 9181
    unless_null $P1, __label_1
.annotate 'line', 9182
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 9183
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 9184

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9187
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 9188
    unless_null $P1, __label_1
.annotate 'line', 9189
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 9190
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 9191

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9196
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 9197
# lexname: $S1
    null $S1
.annotate 'line', 9198
    if_null $P1, __label_1
.annotate 'line', 9199
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9201
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 9202
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 9203
# builtin string
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 9204
    self.'setlex'($S1, $S2)
.annotate 'line', 9205
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 9207
    .return($S1)
# }
.annotate 'line', 9208

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9212
# var store: $P1
    null $P1
# switch
.annotate 'line', 9213
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
.annotate 'line', 9215
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9217
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9219
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9221
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9223
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 9225
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9226
    .return($S1)
# }
.annotate 'line', 9227

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9230
# var store: $P1
    null $P1
# switch
.annotate 'line', 9231
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
.annotate 'line', 9233
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9235
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9237
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9239
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9241
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 9243
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9244
    .return($S1)
# }
.annotate 'line', 9245

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 9248
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
.annotate 'line', 9249
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9250

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 9253
# n: $I1
    getattribute $P1, self, 'nlabel'
    inc $P1
    set $I1, $P1
# builtin string
.annotate 'line', 9254
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 9255

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9258
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 9259

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9262
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 9263

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
# Empty body

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 9269
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 9270
    __ARG_1.'say'()
.annotate 'line', 9271
    __ARG_1.'print'(".sub ")
.annotate 'line', 9272
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 9273
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 9275
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 9276
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 9277
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 9279
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 9280
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_6
    getattribute $P8, self, 'usedlexicals'
    isnull $I3, $P8
    not $I3
    set $I1, $I3
    goto __label_7
  __label_6:
    set $I1, $I2
  __label_7:
    unless $I1 goto __label_5
# {
.annotate 'line', 9281
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 9282
    if_null $P2, __label_8
.annotate 'line', 9283
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_8: # endif
# }
  __label_5: # endif
.annotate 'line', 9287
    $P8 = self.'ismethod'()
    if_null $P8, __label_9
    unless $P8 goto __label_9
.annotate 'line', 9288
    __ARG_1.'print'(' :method')
  __label_9: # endif
.annotate 'line', 9289
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9290
    if_null $P3, __label_10
.annotate 'line', 9291
    $P3.'emit'(__ARG_1)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 9293
    ne $S1, 'main', __label_12
.annotate 'line', 9294
    __ARG_1.'print'(' :main')
  __label_12: # endif
# }
  __label_11: # endif
.annotate 'line', 9296
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 9297
    __ARG_1.'say'()
.annotate 'line', 9300
    getattribute $P8, self, 'params'
    WSubId_60(__ARG_1, $P8)
.annotate 'line', 9302
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 9303
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 9304
    isnull $I2, $P4
    not $I2
    if $I2 goto __label_14
    isnull $I3, $P5
    not $I3
    set $I1, $I3
    goto __label_15
  __label_14:
    set $I1, $I2
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 9305
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 9307
    if_null $P4, __label_17
    iter $P10, $P4
    set $P10, 0
  __label_16: # for iteration
    unless $P10 goto __label_17
    shift $S2, $P10
.annotate 'line', 9308
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_16
  __label_17: # endfor
.annotate 'line', 9310
    if_null $P5, __label_19
    iter $P11, $P5
    set $P11, 0
  __label_18: # for iteration
    unless $P11 goto __label_19
    shift $S3, $P11
# {
.annotate 'line', 9311
# builtin substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_20
.annotate 'line', 9312
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_20: # endif
.annotate 'line', 9313
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_18
  __label_19: # endfor
# }
  __label_13: # endif
.annotate 'line', 9317
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_22
    iter $P12, $P8
    set $P12, 0
  __label_21: # for iteration
    unless $P12 goto __label_22
    shift $S4, $P12
# {
.annotate 'line', 9319
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_21
  __label_22: # endfor
.annotate 'line', 9322
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 9323
    $P8 = $P6.'isempty'()
    if_null $P8, __label_23
    unless $P8 goto __label_23
.annotate 'line', 9324
    __ARG_1.'comment'('Empty body')
    goto __label_24
  __label_23: # else
# {
.annotate 'line', 9326
    __ARG_1.'comment'('Body')
.annotate 'line', 9327
    $P6.'emit'(__ARG_1)
.annotate 'line', 9328
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_24: # endif
.annotate 'line', 9330
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9333
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_26
    iter $P13, $P8
    set $P13, 0
  __label_25: # for iteration
    unless $P13 goto __label_26
    shift $P7, $P13
.annotate 'line', 9334
    $P7.'emit'(__ARG_1)
    goto __label_25
  __label_26: # endfor
# }
.annotate 'line', 9335

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 9065
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 9067
    addattribute $P0, 'name'
.annotate 'line', 9068
    addattribute $P0, 'subid'
.annotate 'line', 9069
    addattribute $P0, 'modifiers'
.annotate 'line', 9070
    addattribute $P0, 'params'
.annotate 'line', 9071
    addattribute $P0, 'body'
.annotate 'line', 9072
    addattribute $P0, 'regstI'
.annotate 'line', 9073
    addattribute $P0, 'regstN'
.annotate 'line', 9074
    addattribute $P0, 'regstS'
.annotate 'line', 9075
    addattribute $P0, 'regstP'
.annotate 'line', 9076
    addattribute $P0, 'nlabel'
.annotate 'line', 9077
    addattribute $P0, 'localfun'
.annotate 'line', 9078
    addattribute $P0, 'lexicals'
.annotate 'line', 9079
    addattribute $P0, 'usedlexicals'
.annotate 'line', 9080
    addattribute $P0, 'usedsubids'
.annotate 'line', 9081
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9351
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9352
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 9353
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 9354
    self.'parse'(__ARG_2)
.annotate 'line', 9355
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
# }
.annotate 'line', 9356

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9358
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# builtin int
.annotate 'line', 9362
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9363

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# builtin int
.annotate 'line', 9367
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9368

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9369
    .return(0)
# }

.end # ismethod


.sub 'ismulti' :method
# Body
# {
.annotate 'line', 9373
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
.annotate 'line', 9374

.end # ismulti


.sub 'setmulti' :method
# Body
# {
.annotate 'line', 9377
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
# }
.annotate 'line', 9378

.end # setmulti


.sub 'default_multi_sig' :method
.const 'Sub' WSubId_115 = "WSubId_115"
# Body
# {
.annotate 'line', 9381
# var multi_sig: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9382
    $P3 = self.'ismethod'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9383
# builtin push
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 9384
    getattribute $P3, self, 'params'
    if_null $P3, __label_3
    iter $P4, $P3
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P2, $P4
.annotate 'line', 9385
    $P6 = $P2.'get_type'()
    $P5 = WSubId_115($P6)
# builtin push
    push $P1, $P5
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9386
    .return($P1)
# }
.annotate 'line', 9387

.end # default_multi_sig


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 9390
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9391
    setattribute self, 'name', $P1
.annotate 'line', 9392
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9393
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9394
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9395
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 9397
    WSubId_4('(', $P2)
.annotate 'line', 9398
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9400
# var path: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 9401
    $P4 = $P3.'fullname'()
    WSubId_118(self, '__FUNCTION__', $P4)
.annotate 'line', 9403
    $P2 = __ARG_1.'get'()
.annotate 'line', 9404
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9405
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9406
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9407
    .return(self)
# }
.annotate 'line', 9408

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9412
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 9413
# var multi_sig: $P1
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9414
    unless_null $P1, __label_2
.annotate 'line', 9415
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 9416
    __ARG_1.'print'(' :multi(')
.annotate 'line', 9417
# sep: $S1
    set $S1, ''
.annotate 'line', 9418
    if_null $P1, __label_4
    iter $P3, $P1
    set $P3, 0
  __label_3: # for iteration
    unless $P3 goto __label_4
    shift $S2, $P3
# {
.annotate 'line', 9419
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 9420
    set $S1, ', '
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9422
    __ARG_1.'print'(')')
# }
  __label_1: # endif
# }
.annotate 'line', 9424

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9342
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9344
    addattribute $P0, 'paramnum'
.annotate 'line', 9345
    addattribute $P0, 'lexnum'
.annotate 'line', 9346
    addattribute $P0, 'is_multi'
.annotate 'line', 9347
    addattribute $P0, 'multi_sig'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9435
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9436
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9437
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9438
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 9439
    setattribute self, 'name', $P1
.annotate 'line', 9440
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9441
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9442
    WSubId_4('{', $P2)
.annotate 'line', 9443
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9444
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 9445

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9446
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9447
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 9450
    getattribute $P2, self, 'lexicals'
    isnull $I2, $P2
    not $I2
    if $I2 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I3, $P3
    not $I3
    set $I1, $I3
    goto __label_3
  __label_2:
    set $I1, $I2
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 9451
    .return(1)
  __label_1: # endif
.annotate 'line', 9452
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_5
    iter $P4, $P2
    set $P4, 0
  __label_4: # for iteration
    unless $P4 goto __label_5
    shift $P1, $P4
.annotate 'line', 9453
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 9454
    .return(1)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
.annotate 'line', 9455
    .return(0)
# }
.annotate 'line', 9456

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 9459
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 9460

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 9464
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 9465

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 9469
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 9470

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9473
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9474
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9475
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9477
# builtin substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9478
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9479
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9480
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 9481
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 9482
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 9483
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 9484
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9485
# flags: $I1
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 9486
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9487
    eq $S3, 'P', __label_8
.annotate 'line', 9488
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9489
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9490
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9491
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9492
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 9495
    .return(__ARG_2)
# }
.annotate 'line', 9496

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9499
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9500
    unless_null $P1, __label_1
.annotate 'line', 9501
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9502
    unless_null $P1, __label_2
# {
.annotate 'line', 9505
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9506
    unless_null $P1, __label_3
# {
.annotate 'line', 9508
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 9509
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 9510
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 9511
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9512
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9513
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9514
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 9518
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 9520
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_10
    isa $I4, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I3, $I4
    set $I1, $I3
    goto __label_11
  __label_10:
    set $I1, $I2
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 9521
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9522
    .return($P1)
# }
.annotate 'line', 9523

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9431
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
.annotate 'line', 9534
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9535

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9536
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9530
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 9550
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9551
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9552
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9553
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9554
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9555
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_105($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9556
    set $P1, $P2
.annotate 'line', 9557
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9558
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 9560
    setattribute self, 'name', $P1
.annotate 'line', 9561
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9562
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9563
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9564
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9566
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 9567

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9570
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9571
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9572
    if_null $P1, __label_1
# {
.annotate 'line', 9573
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 9574
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 9576

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9545
    addattribute $P0, 'name'
.annotate 'line', 9546
    addattribute $P0, 'modifiers'
.annotate 'line', 9547
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9581
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 9582

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_119 = "WSubId_119"
# Body
# {
.annotate 'line', 9589
    $P2 = WSubId_44(__ARG_1, __ARG_2, WSubId_119, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 9590

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9593
    __ARG_1.'print'('(')
.annotate 'line', 9594
# sep: $S1
    set $S1, ''
.annotate 'line', 9595
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 9596
    __ARG_1.'print'($S1)
.annotate 'line', 9597
    $P1.'emit'(__ARG_1)
.annotate 'line', 9598
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9600
    __ARG_1.'print'(')')
# }
.annotate 'line', 9601

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9586
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
.annotate 'line', 9610
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9611
    setattribute self, 'params', __ARG_3
.annotate 'line', 9612
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 9613

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9616
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9617
    .return(self)
# }
.annotate 'line', 9618

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9621
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 9622
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9623
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9624
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9625
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9626
    __ARG_1.'print'('    ')
.annotate 'line', 9627
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9628
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9629
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9630
    __ARG_1.'say'()
# }
.annotate 'line', 9631

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9604
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9606
    addattribute $P0, 'params'
.annotate 'line', 9607
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
.annotate 'line', 9648
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9649

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9650
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9654
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9655

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9644
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9663
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9664
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9665

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9666
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9670
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9671
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9672

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9658
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9660
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9681
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9682
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9683
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9684
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9685
    WSubId_48('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9686
    $P3 = $P2.'rawstring'()
# builtin push
    push $P1, $P3
.annotate 'line', 9687
    $P2 = __ARG_1.'get'()
.annotate 'line', 9688
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9689
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9691
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9695
    WSubId_49('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9697
# {
.annotate 'line', 9698
    $P2 = __ARG_1.'get'()
.annotate 'line', 9699
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9700
    WSubId_48('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9701
    $P3 = $P2.'rawstring'()
# builtin push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9702
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9703
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9705
    setattribute self, 'key', $P1
# }
.annotate 'line', 9706

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9707
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# builtin int
.annotate 'line', 9710
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9711

.end # hasHLL


.sub 'checknskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9715
# var nskey: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9716
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
# }
.annotate 'line', 9717

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
.annotate 'line', 9720
    getattribute $P2, self, 'key'
    $P1 = WSubId_26($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9721

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9675
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9677
    addattribute $P0, 'key'
.annotate 'line', 9678
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9729
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9730
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
# builtin string
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 9731
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9732
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9733
    $P2 = __ARG_1.'get'()
.annotate 'line', 9734
# builtin string
    set $S1, $P2
# builtin push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9736
    __ARG_1.'unget'($P2)
.annotate 'line', 9737
    setattribute self, 'key', $P1
# }
.annotate 'line', 9738

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9739
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9743
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9744
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9745

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9748
# var nskey: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9749
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
# }
.annotate 'line', 9750

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
.annotate 'line', 9754
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9755
    unless_null $P1, __label_1
# {
.annotate 'line', 9756
    getattribute $P2, self, 'key'
# builtin join
    join $S1, ".", $P2
    getattribute $P3, self, 'start'
    WSubId_77(__ARG_1, $S1, $P3)
.annotate 'line', 9757
    getattribute $P3, self, 'key'
    $P2 = WSubId_26($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9759
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9760

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
.annotate 'line', 9763
# var nskey: $P1
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 9764
    unless_null $P1, __label_1
# {
.annotate 'line', 9765
    getattribute $P2, self, 'key'
# builtin join
    join $S1, ".", $P2
    getattribute $P3, self, 'start'
    WSubId_77(__ARG_1, $S1, $P3)
.annotate 'line', 9766
    getattribute $P3, self, 'key'
    $P2 = WSubId_26($P3)
    __ARG_1.'say'("new ", __ARG_3, ", ", $P2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9769
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 9771

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9724
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9726
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9784
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9785
    setattribute self, 'name', __ARG_2
.annotate 'line', 9786
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 9787
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9788

.end # ClassBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9791
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9792

.end # getpath


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 9795
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
# }
.annotate 'line', 9796

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9778
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9780
    addattribute $P0, 'name'
.annotate 'line', 9781
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_49 = "WSubId_49"
# Body
# {
.annotate 'line', 9809
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9810
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9811
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9812
    setattribute self, 'functions', $P1
.annotate 'line', 9813
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9814
    setattribute self, 'members', $P2
.annotate 'line', 9815
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9816
    setattribute self, 'constants', $P3
.annotate 'line', 9817
# var seen_functions: $P4
    root_new $P4, ['parrot';'Hash']
.annotate 'line', 9819
# var t: $P5
    $P5 = __ARG_4.'get'()
.annotate 'line', 9820
    $P10 = $P5.'isop'(':')
    if_null $P10, __label_1
    unless $P10 goto __label_1
# {
.annotate 'line', 9821
    $P12 = WSubId_44(__ARG_4, self, WSubId_70)
    setattribute self, 'bases', $P12
.annotate 'line', 9822
    $P5 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9824
    WSubId_4('{', $P5)
.annotate 'line', 9826
    getattribute $P11, self, 'classns'
    $P10 = $P11.'fullname'()
    WSubId_118(self, '__CLASS__', $P10)
# for loop
.annotate 'line', 9828
    $P5 = __ARG_4.'get'()
  __label_4: # for condition
    $P10 = $P5.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9829
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
.annotate 'line', 9831
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P6.'MethodStatement'($P5, __ARG_4, self)
.annotate 'line', 9832
# builtin push
    push $P1, $P6
.annotate 'line', 9833
# var first_func: $P7
    getattribute $P12, $P6, 'name'
    $P7 = $P4[$P12]
.annotate 'line', 9834
    unless_null $P7, __label_10
.annotate 'line', 9835
    getattribute $P13, $P6, 'name'
    $P4[$P13] = $P6
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 9837
    $P7.'setmulti'()
.annotate 'line', 9838
    $P6.'setmulti'()
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9842
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 9843
    $P10 = $P8.'isidentifier'()
    isfalse $I1, $P10
    unless $I1 goto __label_12
.annotate 'line', 9844
    WSubId_48("member identifier", $P8)
  __label_12: # endif
.annotate 'line', 9845
# builtin push
    push $P2, $P8
.annotate 'line', 9846
    $P5 = __ARG_4.'get'()
.annotate 'line', 9847
    $P11 = $P5.'isop'(';')
    isfalse $I2, $P11
    unless $I2 goto __label_13
.annotate 'line', 9848
    WSubId_48("';' in member declaration", $P5)
  __label_13: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9851
# var cst: $P9
    $P9 = WSubId_52($P5, __ARG_4, self)
.annotate 'line', 9852
# builtin push
    push $P3, $P9
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9855
    WSubId_49("item in class", $P5)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9828
    $P5 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9858

.end # ClassStatement


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9861
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9862

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9865
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9866

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9869
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9870

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9873
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
# }
.annotate 'line', 9874

.end # use_builtin


.sub 'optimize' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 9877
    getattribute $P1, self, 'constants'
    WSubId_46($P1)
.annotate 'line', 9878
    getattribute $P1, self, 'functions'
    WSubId_46($P1)
.annotate 'line', 9879
    .return(self)
# }
.annotate 'line', 9880

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 9883
    getattribute $P3, self, 'classns'
    $P3.'emitnamespace'(__ARG_1)
.annotate 'line', 9884
    getattribute $P3, self, 'functions'
    WSubId_60(__ARG_1, $P3)
.annotate 'line', 9886
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9888
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 9889
# n: $I1
    set $I1, 1
.annotate 'line', 9890
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 9891
    $P1.'annotate'(__ARG_1)
.annotate 'line', 9892
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9893
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9894
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 9895
    __ARG_1.'say'()
.annotate 'line', 9896
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9898
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 9899
    __ARG_1.'annotate'($P2)
.annotate 'line', 9900
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9903
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9904

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9799
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9801
    addattribute $P0, 'parent'
.annotate 'line', 9802
    addattribute $P0, 'bases'
.annotate 'line', 9803
    addattribute $P0, 'constants'
.annotate 'line', 9804
    addattribute $P0, 'functions'
.annotate 'line', 9805
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9911
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9912

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9915
    .return(self)
# }
.annotate 'line', 9916

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9907
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_121')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9924
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9925
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9926
# var nskey: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9927
# var ns: $P4
    null $P4
# for loop
  __label_3: # for condition
.annotate 'line', 9929
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
# {
.annotate 'line', 9930
    $P3.'push'($P1)
.annotate 'line', 9931
    $P1 = __ARG_2.'get'()
# }
  __label_1: # for iteration
.annotate 'line', 9929
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9934
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 9935
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 9936
# builtin string
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 9937
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 9940
    __ARG_2.'unget'($P2)
.annotate 'line', 9941
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 9942
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9943
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
# }
  __label_5: # endif
# }
.annotate 'line', 9945

.end # parseClass


.sub 'open_include' :subid('WSubId_120')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9953
# var interp: $P1
# builtin getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9958
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9959
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9960
# var file: $P4
    null $P4
.annotate 'line', 9961
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9962
# filepath: $S2
    concat $S3, $S1, __ARG_1
    set $S2, $S3
.annotate 'line', 9963
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9964
# builtin open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9965
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I3, $P6
    set $I1, $I3
    goto __label_7
  __label_6:
    set $I1, $I2
  __label_7:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 9966
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9963
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
.annotate 'line', 9971
    isnull $I1, $P4
    if $I1 goto __label_9
    $P7 = $P4.'is_closed'()
    set $P6, $P7
    goto __label_10
  __label_9:
    box $P6, $I1
  __label_10:
    if_null $P6, __label_8
    unless $P6 goto __label_8
.annotate 'line', 9972
    WSubId_1('File not found', __ARG_2)
  __label_8: # endif
.annotate 'line', 9973
    $P4.'encoding'("utf8")
.annotate 'line', 9974
    .return($P4)
# }
.annotate 'line', 9975

.end # open_include


.sub 'include_parrot' :subid('WSubId_123')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9979
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9980
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9981
    WSubId_48('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9982
    WSubId_62(';', __ARG_2)
.annotate 'line', 9984
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9985
# var file: $P2
    $P2 = WSubId_120($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9990
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
.annotate 'line', 9991
# builtin substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9992
# pos: $I1
    set $I1, 12
.annotate 'line', 9993
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9994
# builtin substr
    substr $S3, $S2, $I1, 1
    iseq $I5, $S3, " "
    if $I5 goto __label_10
    iseq $I6, $S3, "\t"
    set $I4, $I6
    goto __label_11
  __label_10:
    set $I4, $I5
  __label_11:
    unless $I4 goto __label_8
.annotate 'line', 9995
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9996
# pos2: $I2
    set $I2, $I1
  __label_13: # while
.annotate 'line', 9997
# builtin substr
    substr $S3, $S2, $I2, 1
    isne $I8, $S3, " "
    unless $I8 goto __label_20
    isne $I9, $S3, "\t"
    set $I7, $I9
    goto __label_21
  __label_20:
    set $I7, $I8
  __label_21:
    unless $I7 goto __label_18
.annotate 'line', 9998
    isne $I10, $S3, "\n"
    set $I6, $I10
    goto __label_19
  __label_18:
    set $I6, $I7
  __label_19:
    unless $I6 goto __label_16
    isne $I11, $S3, "\r"
    set $I5, $I11
    goto __label_17
  __label_16:
    set $I5, $I6
  __label_17:
    unless $I5 goto __label_14
    isne $I12, $S3, ""
    set $I4, $I12
    goto __label_15
  __label_14:
    set $I4, $I5
  __label_15:
    unless $I4 goto __label_12
.annotate 'line', 9999
    inc $I2
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 10000
    ne $I2, $I1, __label_22
    goto __label_3 # continue
  __label_22: # endif
.annotate 'line', 10002
# name: $S4
    sub $I4, $I2, $I1
# builtin substr
    substr $S4, $S2, $I1, $I4
  __label_24: # while
.annotate 'line', 10003
# builtin substr
    substr $S3, $S2, $I2, 1
    iseq $I5, $S3, " "
    if $I5 goto __label_25
    iseq $I6, $S3, "\t"
    set $I4, $I6
    goto __label_26
  __label_25:
    set $I4, $I5
  __label_26:
    unless $I4 goto __label_23
.annotate 'line', 10004
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 10005
    set $I1, $I2
  __label_28: # while
.annotate 'line', 10006
# builtin substr
    substr $S3, $S2, $I2, 1
    isne $I8, $S3, " "
    unless $I8 goto __label_35
    isne $I9, $S3, "\t"
    set $I7, $I9
    goto __label_36
  __label_35:
    set $I7, $I8
  __label_36:
    unless $I7 goto __label_33
.annotate 'line', 10007
    isne $I10, $S3, "\n"
    set $I6, $I10
    goto __label_34
  __label_33:
    set $I6, $I7
  __label_34:
    unless $I6 goto __label_31
    isne $I11, $S3, "\r"
    set $I5, $I11
    goto __label_32
  __label_31:
    set $I5, $I6
  __label_32:
    unless $I5 goto __label_29
    isne $I12, $S3, ""
    set $I4, $I12
    goto __label_30
  __label_29:
    set $I4, $I5
  __label_30:
    unless $I4 goto __label_27
.annotate 'line', 10008
    inc $I2
    goto __label_28
  __label_27: # endwhile
.annotate 'line', 10009
    ne $I2, $I1, __label_37
    goto __label_3 # continue
  __label_37: # endif
.annotate 'line', 10011
# value: $S5
    sub $I4, $I2, $I1
# builtin substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 10013
# ivalue: $I3
    null $I3
.annotate 'line', 10014
# builtin substr
    substr $S6, $S5, 0, 2
    iseq $I5, $S6, '0x'
    if $I5 goto __label_40
# builtin substr
    substr $S7, $S5, 0, 2
    iseq $I6, $S7, '0X'
    set $I4, $I6
    goto __label_41
  __label_40:
    set $I4, $I5
  __label_41:
    unless $I4 goto __label_38
.annotate 'line', 10015
# builtin substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_39
  __label_38: # else
.annotate 'line', 10017
    set $I3, $S5
  __label_39: # endif
.annotate 'line', 10018
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 10020
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 10019
    $P4 = WSubId_22(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9990
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 10024
    $P2.'close'()
# }
.annotate 'line', 10025

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_124')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_120 = "WSubId_120"
# Body
# {
.annotate 'line', 10031
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 10032
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 10033
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 10034
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 10035
    WSubId_48('literal string', $P1)
  __label_2: # endif
.annotate 'line', 10036
    WSubId_62(';', __ARG_2)
.annotate 'line', 10038
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 10039
# var file: $P2
    $P2 = WSubId_120($S1, __ARG_1)
.annotate 'line', 10041
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 10042
    __ARG_3.'parse'($P3)
.annotate 'line', 10044
    $P2.'close'()
# }
.annotate 'line', 10045

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_122')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
.annotate 'line', 10051
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 10052
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 10053
    WSubId_66(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10054
    WSubId_62(';', __ARG_2)
.annotate 'line', 10055
    .return()
# }
  __label_1: # endif
.annotate 'line', 10057
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
# {
.annotate 'line', 10058
    __ARG_2.'unget'($P1)
.annotate 'line', 10059
# var key: $P2
    $P2 = WSubId_63(__ARG_2)
.annotate 'line', 10060
# nelems: $I1
# builtin elements
    elements $I1, $P2
.annotate 'line', 10061
    ge $I1, 1, __label_3
.annotate 'line', 10062
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 10063
    WSubId_62(';', __ARG_2)
.annotate 'line', 10064
    __ARG_3.'use'($P2)
.annotate 'line', 10065
    .return()
# }
  __label_2: # endif
.annotate 'line', 10067
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 10069
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 10075
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 10071
# reqlib: $S1
    null $S1
    if_null $P1, __label_8
    set $S1, $P1
  __label_8:
.annotate 'line', 10072
    __ARG_3.'addlib'($S1)
.annotate 'line', 10073
    WSubId_62(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 10076
    __ARG_2.'unget'($P1)
.annotate 'line', 10077
# var module: $P3
    $P3 = WSubId_63(__ARG_2)
.annotate 'line', 10078
    $P1 = __ARG_2.'get'()
.annotate 'line', 10079
    $P5 = $P1.'isop'(';')
    isfalse $I3, $P5
    unless $I3 goto __label_9
# {
.annotate 'line', 10080
    __ARG_2.'unget'($P1)
.annotate 'line', 10081
# var names: $P4
    null $P5
    $P4 = WSubId_44(__ARG_2, $P5, WSubId_65, ';')
.annotate 'line', 10082
    __ARG_3.'addextern'($P3, $P4)
# }
  __label_9: # endif
.annotate 'line', 10084
# reqmodule: $S2
# builtin join
    join $S3, '/', $P3
    concat $S4, '"', $S3
    concat $S4, $S4, '.pbc"'
    set $S2, $S4
.annotate 'line', 10085
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 10088
    WSubId_48('string literal or identifier', $P1)
  __label_4: # switch end
# }
.annotate 'line', 10090

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10100
    setattribute self, 'module', __ARG_1
.annotate 'line', 10101
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 10102

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10107
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 10116
# builtin string
.annotate 'line', 10117
    getattribute $P1, self, 'module'
# builtin join
    join $S2, "'; '", $P1
    concat $S3, "['parrot'; '", $S2
    concat $S3, $S3, "']"
.annotate 'line', 10116
    __ARG_1.'emitget_root_namespace'("srcns", $S3)
.annotate 'line', 10119
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10120
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10121
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 10127

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 10096
    addattribute $P0, 'module'
.annotate 'line', 10097
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 10137
    new $P1, ['ResizableStringArray']
.annotate 'line', 10138
    unless __ARG_2 goto __label_1
.annotate 'line', 10139
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10141
    if_null __ARG_1, __label_3
.annotate 'line', 10142
# builtin push
    push $P1, __ARG_1
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 10144
    setattribute self, 'path', $P1
# }
.annotate 'line', 10145

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10148
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 10149
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 10150
# var path: $P2
    getattribute $P3, self, 'path'
# builtin clone
    clone $P2, $P3
.annotate 'line', 10151
# builtin push
    push $P2, __ARG_1
.annotate 'line', 10152
    setattribute $P1, 'path', $P2
.annotate 'line', 10153
    .return($P1)
# }
.annotate 'line', 10154

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10157
# var fromkey: $P1
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 10158
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 10159
# var fromhll: $P3
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 10160
    unless_null $P2, __label_3
.annotate 'line', 10161
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 10163
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
# }
.annotate 'line', 10164

.end # samehllas


.sub 'fullname' :method
# Body
# {
.annotate 'line', 10167
# name: $S1
    getattribute $P1, self, 'path'
# builtin join
    join $S1, '.', $P1
.annotate 'line', 10168
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
# builtin string
.annotate 'line', 10169
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 10171
    .return($S1)
  __label_2: # endif
# }
.annotate 'line', 10172

.end # fullname


.sub 'getparrotkey' :method
# Body
# {
.annotate 'line', 10175
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10176
# r: $S1
    null $S1
.annotate 'line', 10177
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10178
# builtin string
# builtin join
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 10179
    .return($S1)
# }
.annotate 'line', 10180

.end # getparrotkey


.sub 'getparrotrootkey' :method
# Body
# {
.annotate 'line', 10183
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10184
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 10185
# r: $S1
    set $S1, "[ '"
.annotate 'line', 10186
    if_null $P2, __label_1
# {
.annotate 'line', 10189
    set $S3, $P2
# builtin downcase
    downcase $S2, $S3
    concat $S1, $S1, $S2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 10192
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 10193
    concat $S1, $S1, "'"
.annotate 'line', 10194
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 10195
# builtin string
# builtin join
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 10196
    concat $S1, $S1, " ]"
.annotate 'line', 10197
    .return($S1)
# }
.annotate 'line', 10198

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10201
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10202
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 10203
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10204
# builtin join
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 10205
    __ARG_1.'say'("]")
# }
.annotate 'line', 10206

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 10209
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 10210
    __ARG_1.'print'('    ', 'new ', __ARG_3, ", ")
.annotate 'line', 10211
    $P1 = self.'getparrotkey'()
    __ARG_1.'print'($P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10214
    __ARG_1.'print'('    ', 'root_new ', __ARG_3, ", ")
.annotate 'line', 10215
    $P1 = self.'getparrotrootkey'()
    __ARG_1.'print'($P1)
# }
  __label_2: # endif
.annotate 'line', 10217
    isnull $I2, __ARG_4
    not $I2
    unless $I2 goto __label_4
    isne $I3, __ARG_4, ''
    set $I1, $I3
    goto __label_5
  __label_4:
    set $I1, $I2
  __label_5:
    unless $I1 goto __label_3
.annotate 'line', 10218
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 10219
    __ARG_1.'say'()
# }
.annotate 'line', 10220

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 10223
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10224
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10226
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
# }
.annotate 'line', 10227

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 10230
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 10231
    $P4 = self.'getparrotkey'()
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", $P4)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10236
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10237
# var path: $P2
    getattribute $P3, self, 'path'
# builtin clone
    clone $P2, $P3
.annotate 'line', 10238
# name: $S1
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 10239
# shll: $S2
    if_null $P1, __label_5
    set $S3, $P1
# builtin downcase
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 10240
# builtin elements
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 10242
# builtin join
    join $S3, "'; '", $P2
.annotate 'line', 10241
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'; '", $S3, "'], '", $S1, "'")
    goto __label_7
  __label_6: # else
.annotate 'line', 10244
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'], '", $S1, "'")
  __label_7: # endif
.annotate 'line', 10246
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 10248

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 10251
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10252
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10254
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
# }
.annotate 'line', 10255

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 10132
    addattribute $P0, 'hll'
.annotate 'line', 10133
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_118 = "WSubId_118"
# Body
# {
.annotate 'line', 10275
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 10276
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 10277
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 10278
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10279
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 10280
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 10281
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions_name', $P2
.annotate 'line', 10282
    $P1 = __ARG_1.'fullname'()
    WSubId_118(self, '__NAMESPACE__', $P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10285
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 10286
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 10287
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10288
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 10289
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
.annotate 'line', 10290
    getattribute $P2, __ARG_2, 'functions_name'
    setattribute self, 'functions_name', $P2
# }
  __label_2: # endif
.annotate 'line', 10292
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 10293

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 10296
# var ns: $P1
    null $P1
.annotate 'line', 10297
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10298
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10299
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 10300
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 10301
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 10302

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 10305
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 10306

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10309
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 10310
    .return()
  __label_1: # endif
.annotate 'line', 10311
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10312
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 10313
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 10314
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10315
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10316

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10319
# var sym: $P1
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 10320
    if_null $P1, __label_1
# {
.annotate 'line', 10321
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 10322
    getattribute $P3, self, 'functions'
# builtin push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10325
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 10326
# var ns: $P2
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 10327
    if_null $P2, __label_5
# {
.annotate 'line', 10328
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 10329
    if_null $P1, __label_6
.annotate 'line', 10330
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 10333

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10336
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10337
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10338
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 10339
    .return($P2)
# }
.annotate 'line', 10340

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10343
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10344
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10345
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10346
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 10347

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10351
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 10352
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10353
    unless_null $P2, __label_1
.annotate 'line', 10354
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10356
# builtin push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 10357

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10361
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 10362
# var cl: $P2
    null $P2
.annotate 'line', 10363
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 10364
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10365
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10366
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 10367
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 10368
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 10369
    .return($P5)
# }
.annotate 'line', 10370

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10373
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10374
    if_null $P1, __label_1
.annotate 'line', 10375
    .return($P1)
  __label_1: # endif
.annotate 'line', 10376
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 10377
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 10378
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 10379
    .return($P2)
# }
.annotate 'line', 10380

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 10385
# keylen: $I1
# builtin elements
    elements $I1, __ARG_1
.annotate 'line', 10386
# name: $S1
    null $S1
.annotate 'line', 10387
# var sym: $P1
    null $P1
.annotate 'line', 10388
# var ns: $P2
    null $P2
# switch
.annotate 'line', 10389
    sub $I2, $I1, __ARG_3
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 10393
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
# switch
.annotate 'line', 10394
    set $I5, __ARG_2
    set $I6, 1
    if $I5 == $I6 goto __label_7
    set $I6, 2
    if $I5 == $I6 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 10396
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 10398
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 10401
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 10402
    .return($P1)
  __label_9: # endif
.annotate 'line', 10403
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 10404
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 10405
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 10412
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 10413
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 10414
    isnull $I8, $P2
    not $I8
    unless $I8 goto __label_14
.annotate 'line', 10415
    add $I10, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I10)
    isnull $I9, $P1
    not $I9
    set $I7, $I9
    goto __label_15
  __label_14:
    set $I7, $I8
  __label_15:
    unless $I7 goto __label_13
.annotate 'line', 10416
    .return($P1)
  __label_13: # endif
.annotate 'line', 10417
    $P2 = self.'getusedns'($S1)
.annotate 'line', 10418
    isnull $I12, $P2
    not $I12
    unless $I12 goto __label_17
.annotate 'line', 10419
    add $I14, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I14)
    isnull $I13, $P1
    not $I13
    set $I11, $I13
    goto __label_18
  __label_17:
    set $I11, $I12
  __label_18:
    unless $I11 goto __label_16
.annotate 'line', 10420
    .return($P1)
  __label_16: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 10422
    .return($P3)
# }
.annotate 'line', 10423

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 10426
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 10427
    getattribute $P2, self, 'namespaces'
# builtin push
    push $P2, $P1
.annotate 'line', 10428
    .return($P1)
# }
.annotate 'line', 10429

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 10432
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 10433
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 10434
    getattribute $P3, self, 'namespaces'
# builtin push
    push $P3, $P2
.annotate 'line', 10435
    getattribute $P3, self, 'items'
# builtin push
    push $P3, $P2
.annotate 'line', 10436
    .return($P2)
# }
.annotate 'line', 10437

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10440
    getattribute $P1, self, 'classes'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10441

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10444
    getattribute $P1, self, 'classes'
# builtin push
    push $P1, __ARG_1
.annotate 'line', 10445
    getattribute $P1, self, 'items'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10446

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 10449
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 10450
# name: $S1
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 10451
    $P1 = __ARG_2.'get'()
.annotate 'line', 10453
# var parent: $P2
    set $P2, self
# for loop
  __label_4: # for condition
.annotate 'line', 10454
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 10455
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10456
    $P5 = __ARG_2.'get'()
    set $S1, $P5
# }
  __label_2: # for iteration
.annotate 'line', 10454
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10459
# var modifier: $P3
    null $P3
.annotate 'line', 10460
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 10461
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10462
    $P1 = __ARG_2.'get'()
# }
  __label_5: # endif
.annotate 'line', 10465
    WSubId_4('{', $P1)
.annotate 'line', 10466
# var child: $P4
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10467
    $P4.'parse'(__ARG_2)
# }
.annotate 'line', 10468

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_122 = "WSubId_122"
.const 'Sub' WSubId_123 = "WSubId_123"
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_49 = "WSubId_49"
# Body
# {
.annotate 'line', 10471
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 10472
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 10473
# var functions_name: $P3
    getattribute $P3, self, 'functions_name'
.annotate 'line', 10474
# var classes: $P4
    getattribute $P4, self, 'classes'
.annotate 'line', 10475
# var t: $P5
    null $P5
# for loop
.annotate 'line', 10476
    $P5 = __ARG_1.'get'()
  __label_3: # for condition
    $P12 = $P5.'iseof'()
    if $P12 goto __label_4
    $P13 = $P5.'isop'('}')
    set $P11, $P13
    goto __label_5
  __label_4:
    set $P11, $P12
  __label_5:
    isfalse $I1, $P11
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 10478
    $P14 = $P5.'checkkeyword'()
    set $S2, $P14
    set $S3, 'namespace'
    if $S2 == $S3 goto __label_8
    set $S3, 'const'
    if $S2 == $S3 goto __label_9
    set $S3, 'function'
    if $S2 == $S3 goto __label_10
    set $S3, 'class'
    if $S2 == $S3 goto __label_11
    set $S3, 'extern'
    if $S2 == $S3 goto __label_12
    set $S3, 'using'
    if $S2 == $S3 goto __label_13
    set $S3, '$include_const'
    if $S2 == $S3 goto __label_14
    set $S3, '$include'
    if $S2 == $S3 goto __label_15
    set $S3, '$load'
    if $S2 == $S3 goto __label_16
    set $S3, '$loadlib'
    if $S2 == $S3 goto __label_17
    goto __label_7
  __label_8: # case
.annotate 'line', 10480
    self.'parsenamespace'($P5, __ARG_1)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 10483
# var cst: $P6
    $P6 = WSubId_52($P5, __ARG_1, self)
.annotate 'line', 10484
# builtin push
    push $P1, $P6
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 10487
# var f: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P7.'FunctionStatement'($P5, __ARG_1, self)
.annotate 'line', 10488
# name: $S1
    getattribute $P15, $P7, 'name'
    null $S1
    if_null $P15, __label_18
    set $S1, $P15
  __label_18:
.annotate 'line', 10489
# builtin push
    push $P2, $P7
.annotate 'line', 10490
# builtin push
    push $P1, $P7
.annotate 'line', 10491
# var funcs: $P8
    $P8 = $P3[$S1]
.annotate 'line', 10492
    if_null $P8, __label_19
# {
.annotate 'line', 10493
    $P7.'setmulti'()
.annotate 'line', 10494
# builtin elements
    elements $I1, $P8
    ne $I1, 1, __label_21
.annotate 'line', 10495
    $P11 = $P8[0]
    $P11.'setmulti'()
  __label_21: # endif
.annotate 'line', 10496
    $P8.'push'($P7)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 10499
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P11[0] = $P7
    $P3[$S1] = $P11
  __label_20: # endif
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 10502
    WSubId_121($P5, __ARG_1, self)
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 10505
# var t1: $P9
    $P9 = __ARG_1.'get'()
.annotate 'line', 10506
    $P12 = $P9.'iskeyword'('function')
    isfalse $I1, $P12
    unless $I1 goto __label_22
.annotate 'line', 10507
    WSubId_1('Unsupported extern', $P9)
  __label_22: # endif
.annotate 'line', 10508
    $P9 = __ARG_1.'get'()
.annotate 'line', 10509
    WSubId_102($P9)
.annotate 'line', 10510
    WSubId_62(';', __ARG_1)
.annotate 'line', 10511
# var fex: $P10
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P10.'FunctionExtern'($P9, self)
.annotate 'line', 10512
# builtin push
    push $P2, $P10
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 10515
    WSubId_122($P5, __ARG_1, self)
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 10518
    WSubId_123($P5, __ARG_1, self)
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 10521
    WSubId_124($P5, __ARG_1, self)
    goto __label_6 # break
  __label_16: # case
.annotate 'line', 10524
    $P5 = __ARG_1.'get'()
.annotate 'line', 10525
    $P13 = $P5.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_23
.annotate 'line', 10526
    WSubId_48('string literal', $P5)
  __label_23: # endif
.annotate 'line', 10527
    WSubId_62(';', __ARG_1)
.annotate 'line', 10528
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P5)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_6 # break
  __label_17: # case
.annotate 'line', 10531
    $P5 = __ARG_1.'get'()
.annotate 'line', 10532
    $P17 = $P5.'isstring'()
    isfalse $I3, $P17
    unless $I3 goto __label_24
.annotate 'line', 10533
    WSubId_48('string literal', $P5)
  __label_24: # endif
.annotate 'line', 10534
    WSubId_62(';', __ARG_1)
.annotate 'line', 10535
    new $P20, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P5)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 10538
    WSubId_49("token", $P5)
  __label_6: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 10476
    $P5 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10541
    $P11 = $P5.'iseof'()
    if_null $P11, __label_25
    unless $P11 goto __label_25
.annotate 'line', 10542
    self.'unclosed_ns'()
    goto __label_26
  __label_25: # else
.annotate 'line', 10544
    self.'close_ns'($P5)
  __label_26: # endif
# }
.annotate 'line', 10545

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 10548
    getattribute $P1, self, 'items'
    WSubId_46($P1)
# }
.annotate 'line', 10549

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 10552
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 10554
# activate: $I1
    set $I1, 1
.annotate 'line', 10556
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10557
    if_null $P2, __label_1
# {
.annotate 'line', 10558
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10559
    null $I1
.annotate 'line', 10560
    WSubId_60(__ARG_1, $P2)
# }
  __label_1: # endif
.annotate 'line', 10563
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
# {
.annotate 'line', 10564
    isa $I3, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I3 goto __label_6
.annotate 'line', 10565
    isa $I4, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    set $I2, $I4
    goto __label_7
  __label_6:
    set $I2, $I3
  __label_7:
    unless $I2 goto __label_4
.annotate 'line', 10566
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10568
    unless $I1 goto __label_8
# {
.annotate 'line', 10569
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10570
    null $I1
# }
  __label_8: # endif
  __label_5: # endif
.annotate 'line', 10572
    $P3.'emit'(__ARG_1)
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 10574

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 10262
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 10264
    addattribute $P0, 'nspath'
.annotate 'line', 10265
    addattribute $P0, 'externals'
.annotate 'line', 10266
    addattribute $P0, 'namespaces'
.annotate 'line', 10267
    addattribute $P0, 'classes'
.annotate 'line', 10268
    addattribute $P0, 'functions'
.annotate 'line', 10269
    addattribute $P0, 'functions_name'
.annotate 'line', 10270
    addattribute $P0, 'items'
.annotate 'line', 10271
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
.annotate 'line', 10592
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10593
# is_hll: $I1
    null $I1
.annotate 'line', 10594
    if_null __ARG_5, __label_1
# {
.annotate 'line', 10595
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
# {
.annotate 'line', 10596
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 10597
    set $I1, 1
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 10600
# var nspath: $P1
    unless $I1 goto __label_4
.annotate 'line', 10601
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 10602
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 10603
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10605
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10606
    setattribute self, 'start', __ARG_2
.annotate 'line', 10607
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10608
    box $P2, __ARG_4
    setattribute self, 'name', $P2
# }
.annotate 'line', 10609

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10612
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10613

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10616
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 10617

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10620
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
# }
.annotate 'line', 10621

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10624
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 10625

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10628
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 10629

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10632
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10633
    unless_null $P1, __label_1
.annotate 'line', 10634
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10635
    .return($P1)
# }
.annotate 'line', 10636

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10639
# var sym: $P1
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10640
    isnull $I2, $P1
    unless $I2 goto __label_2
    isle $I3, __ARG_3, 0
    set $I1, $I3
    goto __label_3
  __label_2:
    set $I1, $I2
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 10641
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10642
    .return($P1)
# }
.annotate 'line', 10643

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10646
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 10647

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10654
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 10655
    if_null $P1, __label_1
.annotate 'line', 10656
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10657
    self.'optimize_base'()
.annotate 'line', 10658
    .return(self)
# }
.annotate 'line', 10659

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10662
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10663
    if_null $P1, __label_1
.annotate 'line', 10664
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 10666
    self.'emit_base'(__ARG_1)
.annotate 'line', 10668
    if_null $P1, __label_2
.annotate 'line', 10669
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 10670

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10581
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10583
    addattribute $P0, 'parent'
.annotate 'line', 10584
    addattribute $P0, 'start'
.annotate 'line', 10585
    addattribute $P0, 'name'
.annotate 'line', 10586
    addattribute $P0, 'modifier'
.annotate 'line', 10587
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10687
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10688
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10689
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 10690
    box $P1, 0
    setattribute self, 'subidgen', $P1
# }
.annotate 'line', 10691

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10694
# var bultins_used: $P1
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 10695
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10696

.end # use_builtin


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10700
# idgen: $I1
    getattribute $P1, self, 'subidgen'
    inc $P1
    set $I1, $P1
# builtin string
.annotate 'line', 10701
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 10702

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10706
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 10707
    unless_null $P1, __label_1
.annotate 'line', 10708
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10709
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10710

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10713
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 10714
    unless_null $P1, __label_1
.annotate 'line', 10715
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10716
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10717

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10720
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 10721

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10724
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 10725

.end # scopesearch


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10732
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 10733

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10736
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10737

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10740
    self.'optimize_base'()
.annotate 'line', 10741
    .return(self)
# }
.annotate 'line', 10742

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10745
# var bultins_used: $P1
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 10748
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10749
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10752
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
.annotate 'line', 10755
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10756
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10757
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10758
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10761
# somelib: $I1
    null $I1
.annotate 'line', 10762
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10763
    if_null $P3, __label_5
# {
.annotate 'line', 10764
    set $I1, 1
.annotate 'line', 10765
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10766
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10769
# someload: $I2
    null $I2
.annotate 'line', 10770
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10771
    if_null $P4, __label_8
# {
.annotate 'line', 10772
    set $I2, 1
.annotate 'line', 10773
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10774
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10775
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10776
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10778
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10779
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10781
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10782

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10785
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10786
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10787
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10788
    isa $I4, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I3, $I4
    if $I3 goto __label_6
.annotate 'line', 10789
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I5, $S2, 'I'
    set $I2, $I5
    goto __label_7
  __label_6:
    set $I2, $I3
  __label_7:
    if $I2 goto __label_4
.annotate 'line', 10790
    $P6 = $P2.'getflags'()
    set $I7, $P6
    band $I6, $I7, 4
    set $I1, $I6
    goto __label_5
  __label_4:
    set $I1, $I2
  __label_5:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10792
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10793
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10795

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10677
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10679
    addattribute $P0, 'unit'
.annotate 'line', 10680
    addattribute $P0, 'bultins_used'
.annotate 'line', 10681
    addattribute $P0, 'libs'
.annotate 'line', 10682
    addattribute $P0, 'loads'
.annotate 'line', 10683
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10807
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10808
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10809

.end # Builtin


.sub 'getname' :method
# Body
# {
# builtin string
.annotate 'line', 10810
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10813
    getattribute $P1, self, 'variants'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10814

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10803
    addattribute $P0, 'name'
.annotate 'line', 10804
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
# Body
# {
.annotate 'line', 10824
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
# }
.annotate 'line', 10825

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10828
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10829
# name: $S1
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10830
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 10831
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 10833
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
# }
.annotate 'line', 10834

.end # add


.sub 'put' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10837
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10838
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10839
    getattribute $P3, __ARG_1, 'functions'
    $P4 = $P1[$S1]
# builtin push
    push $P3, $P4
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10840

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 10821
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_126 = "WSubId_126"
# Body
# {
.annotate 'line', 10850
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 10851
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10855
    WSubId_125($P1, 'false', 0)
.annotate 'line', 10856
    WSubId_125($P1, 'true', 1)
.annotate 'line', 10861
    WSubId_118($P1, '__STAGE__', "3")
.annotate 'line', 10864
    WSubId_125($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 10867
    WSubId_125($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10870
# var builtins_ns: $P2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 10872
# var builder: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 10873
    WSubId_126($P3)
.annotate 'line', 10874
    $P3.'put'($P2)
.annotate 'line', 10876
    $P1.'usenamespace'($P2)
.annotate 'line', 10878
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10879

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# builtin int
.annotate 'line', 10882
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10883

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10886
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10887
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10888

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10891
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10892

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10895
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10896
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10897
    __ARG_1.'say'('')
.annotate 'line', 10899
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10901
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10902

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10905
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10906
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10908
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10910
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10911

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10845
    addattribute $P0, 'rootns'
.annotate 'line', 10846
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
# Body
# {
.annotate 'line', 10920
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 4
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 10921
    .return($P1)
# }
.annotate 'line', 10922

.end # version


.sub 'version_string' :method
# Body
# {
# builtin string
.annotate 'line', 10925
    $P1 = self.'version'()
# builtin join
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
# }
.annotate 'line', 10926

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
        .param int __ARG_6
# Body
# {
.annotate 'line', 10929
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10930
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10931
# var handleout: $P1
    null $P1
.annotate 'line', 10932
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10933
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10934
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10937
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10938
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1, __ARG_6)
.annotate 'line', 10939
    unless __ARG_4 goto __label_4
.annotate 'line', 10940
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 10941
    unless __ARG_5 goto __label_5
.annotate 'line', 10942
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 10943
    __ARG_1.'emit'($P2)
.annotate 'line', 10944
    $P2.'close'()
.annotate 'line', 10945
    if_null __ARG_3, __label_6
.annotate 'line', 10946
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 10948
    $P1.'close'()
.annotate 'line', 10949
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 10950
# var object: $P3
    null $P3
# switch
.annotate 'line', 10951
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_11
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_12
    set $S3, ''
    if $S2 == $S3 goto __label_13
    goto __label_10
  __label_11: # case
.annotate 'line', 10953
    new $P3, [ 'String' ]
.annotate 'line', 10954
    assign $P3, $S1
    goto __label_9 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 10958
# var pircomp: $P4
# builtin compreg
    compreg $P4, 'PIR'
.annotate 'line', 10959
    $P3 = $P4($S1)
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 10960
# builtin string
.annotate 'line', 10962
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# builtin die
    die $S5
  __label_9: # switch end
.annotate 'line', 10964
    .return($P3)
# }
  __label_7: # endif
# }
.annotate 'line', 10966

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10969
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10970
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10971
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1, 1)
.annotate 'line', 10972
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10973
    $P2.'close'()
.annotate 'line', 10974
    $P1.'close'()
.annotate 'line', 10975
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10976

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
.annotate 'line', 10984
    unless_null __ARG_2, __label_1
.annotate 'line', 10985
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10986
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10987
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10988
    $P1.'puts'(__ARG_1)
.annotate 'line', 10989
    $P1.'close'()
.annotate 'line', 10990
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10991
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10992
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10993
    $P3.'parse'($P2)
.annotate 'line', 10994
    $P1.'close'()
.annotate 'line', 10995
    $P3.'optimize'()
.annotate 'line', 10996
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10997
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10999
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
# }
.annotate 'line', 11000

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
.annotate 'line', 11009
    unless_null __ARG_2, __label_1
.annotate 'line', 11010
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 11011
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 11012
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 11013
    $P1.'encoding'('utf8')
.annotate 'line', 11014
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 11015
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 11016
    $P3.'parse'($P2)
.annotate 'line', 11017
    $P1.'close'()
.annotate 'line', 11018
    $P3.'optimize'()
.annotate 'line', 11019
    ne __ARG_2, 'include', __label_2
.annotate 'line', 11020
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 11022
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif
# }
.annotate 'line', 11023

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 11032
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 11033
# builtin compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 11034

.end # initializer

# End generated code
