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

.sub 'Warn' :subid('WSubId_73')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
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


.sub 'NoLeftSide' :subid('WSubId_64')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 130
    WSubId_1('Not a left-side expression', __ARG_1)
# }
.annotate 'line', 131

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_45')
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


.sub 'Unexpected' :subid('WSubId_46')
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


.sub 'RequireIdentifier' :subid('WSubId_98')
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


.sub 'ExpectOp' :subid('WSubId_59')
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


.sub 'ExpectKeyword' :subid('WSubId_100')
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


.sub 'UndefinedVariable' :subid('WSubId_66')
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
# builtin ord
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
    concat $S6, $S2, $S1
    concat $S6, $S6, $S2
    set $S1, $S6
.annotate 'line', 421
    unless $I3 goto __label_16
.annotate 'line', 422
    concat $S6, 'utf8:', $S1
    set $S1, $S6
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
    $P4 = WSubId_12(self, $S2, $I1)
    set $P3, $P4
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

.sub 'typetoregcheck' :subid('WSubId_101')
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


.sub 'typetopirname' :subid('WSubId_110')
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
.annotate 'line', 801
    setattribute self, 'handle', __ARG_1
.annotate 'line', 802
    box $P1, ""
    setattribute self, 'file', $P1
.annotate 'line', 803
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 804
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 805
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 806

.end # Emit


.sub 'setDebug' :method
# Body
# {
.annotate 'line', 809
    box $P1, 1
    setattribute self, 'debug', $P1
# }
.annotate 'line', 810

.end # setDebug


.sub 'getDebug' :method
# Body
# {
.annotate 'line', 813
    getattribute $P1, self, 'debug'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 814

.end # getDebug


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 817
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 818

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 821
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 822

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 825
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 826
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'file', '"
.annotate 'line', 828
    getattribute $P4, self, 'file'
.annotate 'line', 826
    $P3[1] = $P4
    $P3[2] = "'\n"
# builtin join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 831
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 833
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 834
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'line', "
.annotate 'line', 836
    getattribute $P4, self, 'line'
.annotate 'line', 834
    $P3[1] = $P4
    $P3[2] = "\n"
# builtin join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 839
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 841

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 844
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 845
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 846

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 849
    self.'updateannot'()
.annotate 'line', 850
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 851

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 854
    self.'updateannot'()
.annotate 'line', 855
    self.'vprint'(__ARG_1)
.annotate 'line', 856
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 857

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 860
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 862
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 863
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 864
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 865
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 866
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 867
    assign $P1, $S1
.annotate 'line', 868
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 869
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 871
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 872
    assign $P2, $I1
.annotate 'line', 873
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 876

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 879
    self.'updateannot'()
.annotate 'line', 880
    getattribute $P1, self, 'handle'
    concat $S1, "# ", __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 881

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 884
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 885
    $P1.'print'('  ')
.annotate 'line', 886
    $P1.'print'(__ARG_1)
.annotate 'line', 887
    $P1.'print'(":")
.annotate 'line', 888
    if_null __ARG_2, __label_1
.annotate 'line', 889
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 890
    $P1.'print'("\n")
# }
.annotate 'line', 891

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 894
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 895
    $P1.'print'("    goto ")
.annotate 'line', 896
    $P1.'print'(__ARG_1)
.annotate 'line', 897
    if_null __ARG_2, __label_1
.annotate 'line', 898
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 899
    $P1.'print'("\n")
# }
.annotate 'line', 900

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 904
    self.'say'('    ', __ARG_1, " ", __ARG_2)
# }
.annotate 'line', 905

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 908
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 909

.end # emitarg2


.sub 'emitarg3' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 912
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 913

.end # emitarg3


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 916
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 917

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 920
    self.'say'("    if ", __ARG_1, " goto ", __ARG_2)
# }
.annotate 'line', 921

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 924
    self.'say'("    unless ", __ARG_1, " goto ", __ARG_2)
# }
.annotate 'line', 925

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 928
    self.'say'("    if_null ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 929

.end # emitif_null


.sub 'emitunless_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 932
    self.'say'("    unless_null ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 933

.end # emitunless_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 936
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 937

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 941
    self.'say'("    inc ", __ARG_1)
# }
.annotate 'line', 942

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 945
    self.'say'("    dec ", __ARG_1)
# }
.annotate 'line', 946

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 949
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 950

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 953
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 954

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 957
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 958

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 961
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 962

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 965
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 966

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 969
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 970

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 973
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 974

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 977
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 978

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 981
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 982

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 985
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 986

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 989
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 990

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 993
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 994

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 997
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 998

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1001
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 1002

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1005
    self.'say'("    print ", __ARG_1)
# }
.annotate 'line', 1006

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1009
    self.'say'("    say ", __ARG_1)
# }
.annotate 'line', 1010

.end # emitsay


.sub 'emitget_hll_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1013
    concat $S1, ", ", __ARG_2
    self.'say'("    get_hll_namespace ", __ARG_1, $S1)
# }
.annotate 'line', 1014

.end # emitget_hll_namespace


.sub 'emitget_root_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1017
    concat $S1, ", ", __ARG_2
    self.'say'("    get_root_namespace ", __ARG_1, $S1)
# }
.annotate 'line', 1018

.end # emitget_root_namespace


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 1021
    self.'print'("    get_hll_global ", __ARG_1)
.annotate 'line', 1022
    if_null __ARG_3, __label_1
.annotate 'line', 1023
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1024
    self.'say'(", '", __ARG_2, "'")
# }
.annotate 'line', 1025

.end # emitget_hll_global


.sub 'emitget_root_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 1028
    self.'print'("    get_root_global ", __ARG_1)
.annotate 'line', 1029
    if_null __ARG_3, __label_1
.annotate 'line', 1030
    self.'print'(", ", __ARG_3)
  __label_1: # endif
.annotate 'line', 1031
    self.'say'(", '", __ARG_2, "'")
# }
.annotate 'line', 1032

.end # emitget_root_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1035
    self.'say'("    find_lex ", __ARG_1, ", '", __ARG_2, "'")
# }
.annotate 'line', 1036

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1039
    self.'say'("store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 1040

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
.annotate 'line', 1065
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 1066

.end # integerValue


.sub 'floatValue' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 1070
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 1071
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 1072

.end # floatValue


.sub 'floatresult' :subid('WSubId_69')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1080
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1081
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1082
    .return($I1)
# }
.annotate 'line', 1083

.end # floatresult


.sub 'floatAsString' :subid('WSubId_65')
        .param num __ARG_1
# Body
# {
.annotate 'line', 1093
# aux: $S1
    null $S1
    set $S1, __ARG_1
.annotate 'line', 1095
    box $P2, $S1
    $P1 = $P2.'is_integer'($S1)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 1096
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1097
    .return($S1)
# }
.annotate 'line', 1098

.end # floatAsString

# Constant PREDEFCONST_FILENAME evaluated at compile time
# Constant PREDEFCONST_LINENUM evaluated at compile time

.sub 'createPredefConstInt' :subid('WSubId_120')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1109
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1110
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1111
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1112
    $P3 = WSubId_21(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1113

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_113')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1117
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1118
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1119
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1120
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1121
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1120
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1122

.end # createPredefConstString

# Constant BULTIN_arglist evaluated at compile time
# Constant BULTIN_raw1 evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]

.sub 'Builtin_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1150
# l: $I2
# builtin length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1151
# builtin substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1152
# builtin substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1153
# builtin split
    split $P1, "\n", __ARG_2
# builtin join
    join $S1, "\n    ", $P1
    concat $S2, '    ', $S1
    set __ARG_2, $S2
.annotate 'line', 1154
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1155
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1156

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
.annotate 'line', 1159
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1161
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1162
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_4, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1163
    WSubId_1('using return value from void builtin')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1166
    isnull $I1, __ARG_4
    if $I1 goto __label_7
    iseq $I1, __ARG_4, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1167
    WSubId_6('Bad result in non void builtin')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1170
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1171
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_4, __ARG_5 :flat)
.annotate 'line', 1172
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1173
# builtin string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1174

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
.annotate 'line', 1136
    addattribute $P0, 'body'
.annotate 'line', 1137
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
.annotate 'line', 1195
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1196
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1197
    new $P3, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
    $P3.'Builtin_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1199
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1200
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1201
# n: $I1
    null $I1
.annotate 'line', 1202
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1203
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1204
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1206
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1209
    set $I1, -2
.annotate 'line', 1210
    if_null __ARG_5, __label_8
.annotate 'line', 1211
    concat $S3, "Invalid builtin '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1214
    set $I1, 1
.annotate 'line', 1215
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1216
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1217
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1219
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1220
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1221
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1223
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1224
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1225
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1229
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1230

.end # BuiltinBase


.sub 'iscompileevaluable' :method
# Body
# {
.annotate 'line', 1233
    .return(0)
# }
.annotate 'line', 1234

.end # iscompileevaluable


.sub 'name' :method
# Body
# {
.annotate 'line', 1237
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1238
    .return($S1)
# }
.annotate 'line', 1239

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1242
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1243

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1244
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1247
# type: $S1
    null $S1
# switch
.annotate 'line', 1248
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
.annotate 'line', 1249
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1250
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1251
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1252
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1254
    WSubId_6('Invalid builtin arg')
  __label_1: # switch end
.annotate 'line', 1256
    .return($S1)
# }
.annotate 'line', 1257

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1260
# builtin string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'builtin ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1261
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1262
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1263
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1264
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1265
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1266

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
.annotate 'line', 1179
    addattribute $P0, 'name'
.annotate 'line', 1180
    addattribute $P0, 'body'
.annotate 'line', 1181
    addattribute $P0, 'typeresult'
.annotate 'line', 1182
    addattribute $P0, 'type0'
.annotate 'line', 1183
    addattribute $P0, 'type1'
.annotate 'line', 1184
    addattribute $P0, 'type2'
.annotate 'line', 1185
    addattribute $P0, 'type3'
.annotate 'line', 1186
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
.annotate 'line', 1278
    self.'BuiltinBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1279

.end # BuiltinFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1269
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
.annotate 'line', 1292
    self.'BuiltinBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1293
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1294

.end # BuiltinFunctionEval


.sub 'iscompileevaluable' :method
# Body
# {
.annotate 'line', 1297
    .return(1)
# }
.annotate 'line', 1298

.end # iscompileevaluable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1282
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
.annotate 'line', 1284
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]

.sub 'Builtin_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1306
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1307

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
.annotate 'line', 1310
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1311
# builtin elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1312
    WSubId_6("Invalid Builtin_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1313
# var rawarg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1314
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1316
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1317
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1318
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1321
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1322
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1324
    ne $S3, 'null', __label_9
.annotate 'line', 1325
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1327
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1329

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
.annotate 'line', 1303
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'builtineval_stringcast' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1334
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1336
# s: $S1
    null $S1
# switch-case
.annotate 'line', 1338
    $I1 = $P1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1341
    $I1 = $P1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1344
    $I1 = $P1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1339
# builtin int
    getattribute $P3, $P1, 'numval'
    set $I2, $P3
    set $S1, $I2
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1342
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1345
    .return($P1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1348
    WSubId_6('wrong call to builtineval_stringcast', __ARG_2)
  __label_1: # switch end
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

.end # builtineval_stringcast


.sub 'builtineval_intcast' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1357
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
# switch-case
.annotate 'line', 1360
    $I1 = $P1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1362
    $I1 = $P1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1364
    $I1 = $P1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1361
    .return($P1)
  __label_4: # case
.annotate 'line', 1363
# builtin int
    $P2 = $P1.'getFloatValue'()
    set $I2, $P2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
  __label_5: # case
.annotate 'line', 1365
# builtin int
    $P3 = $P1.'get_value'()
    set $I3, $P3
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I3)
  __label_2: # default
.annotate 'line', 1367
    WSubId_6('wrong call to builtineval_intcast', __ARG_2)
  __label_1: # switch end
# }
.annotate 'line', 1369

.end # builtineval_intcast


.sub 'Builtin_varcast' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 1373
# builtin elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1374
    WSubId_6("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1375
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1376
# argtype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 1377
    ne $S1, 'P', __label_3
# {
.annotate 'line', 1378
# name: $S2
    null $S2
.annotate 'line', 1379
# var sym: $P2
    null $P2
# switch-case
.annotate 'line', 1381
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1397
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1382
    $P7 = $P1.'getName'()
    set $S2, $P7
.annotate 'line', 1383
# id: $S3
    $P8 = $P1.'checkIdentifier'()
    null $S3
    if_null $P8, __label_9
    set $S3, $P8
  __label_9:
.annotate 'line', 1384
# var desc: $P3
    $P3 = $P1.'checkVar'()
.annotate 'line', 1385
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
.annotate 'line', 1387
    $P1.'emit'(__ARG_1, __ARG_4)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 1390
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 1
    $P7[0] = $S2
    $P2 = $P1.'scopesearch'($P7, 0)
.annotate 'line', 1391
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
# {
.annotate 'line', 1392
# var path: $P4
    getattribute $P7, $P2, 'owner'
    $P4 = $P7.'getpath'()
.annotate 'line', 1393
    $P7 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_14: # endif
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1400
    new $P5, ['ResizableStringArray']
.annotate 'line', 1401
    $P1.'buildkey'($P5)
.annotate 'line', 1402
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1403
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_17
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_17:
    unless $I1 goto __label_16
# {
.annotate 'line', 1404
# var path: $P6
    getattribute $P7, $P2, 'owner'
    $P6 = $P7.'getpath'()
.annotate 'line', 1405
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1406
    $P7 = WSubId_22($P6)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_16: # endif
.annotate 'line', 1408
    $P7 = $P5.'pop'()
    set $S2, $P7
.annotate 'line', 1409
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1410
    $P8 = WSubId_22($P5)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P8)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1413
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1414
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 1418
# reg: $S4
    $P7 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_18
    set $S4, $P7
  __label_18:
.annotate 'line', 1419
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1420
    ne $S4, 'null', __label_19
.annotate 'line', 1421
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_20
  __label_19: # else
.annotate 'line', 1423
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_20: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 1425

.end # Builtin_varcast


.sub 'Builtin_say' :subid('WSubId_37')
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
# n: $I1
# builtin elements
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1431
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1432
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1433
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1432
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1434
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1437
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1438

.end # Builtin_say


.sub 'Builtin_cry' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1442
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1443
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1444
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1445
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1446
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1447

.end # Builtin_cry


.sub 'Builtin_print' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1451
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1452
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1453
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1454

.end # Builtin_print


.sub 'Builtin_ASSERT' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1458
# builtin elements
    elements $I2, __ARG_5
    iseq $I1, $I2, 1
# builtin __ASSERT__
.annotate 'line', 1460
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 1461
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1462
# label: $S1
    $P1 = __ARG_2.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 1463
    $P1 = __ARG_5[0]
    __ARG_1.'emitif'($P1, $S1)
.annotate 'line', 1464
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1465
    $P1 = __ARG_3.'filename'()
    __ARG_1.'say'('    ', "print $P0, \"Assertion failed at '", $P1, "' line \"")
.annotate 'line', 1466
    $P1 = __ARG_3.'linenum'()
    __ARG_1.'say'('    ', "print $P0, ", $P1)
.annotate 'line', 1467
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
.annotate 'line', 1468
    __ARG_1.'say'('    ', "exit 1")
.annotate 'line', 1469
    __ARG_1.'emitlabel'($S1)
# }
  __label_1: # endif
# }
.annotate 'line', 1471

.end # Builtin_ASSERT


.sub 'Builtin_invoke' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1477
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1478
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1479
    WSubId_1("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1480
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1481

.end # Builtin_invoke


.sub 'builtineval_length' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1485
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1486
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1487
# builtin length
    length $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1488

.end # builtineval_length


.sub 'builtineval_bytelength' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1492
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1493
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1494
# builtin bytelength
    bytelength $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1495

.end # builtineval_bytelength


.sub 'builtineval_ord' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1499
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1500
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1501
# builtin ord
    ord $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1502

.end # builtineval_ord


.sub 'builtineval_ord_n' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1506
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1507
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1508
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1509
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1510
# builtin ord
    ord $I2, $S1, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1511

.end # builtineval_ord_n


.sub 'builtineval_chr' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1515
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1517
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1518
# s: $S1
# builtin chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1520
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1521
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1522

.end # builtineval_chr


.sub 'builtineval_substr' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1526
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1527
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1528
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1529
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1531
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# builtin substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1532
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1533

.end # builtineval_substr


.sub 'builtineval_substr_l' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1537
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1538
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1539
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1540
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1541
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1542
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1544
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# builtin substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1545
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1546

.end # builtineval_substr_l


.sub 'builtineval_indexof' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1550
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1551
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1552
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1553
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1554
# builtin indexof
    index $I1, $S1, $S2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1555

.end # builtineval_indexof


.sub 'builtineval_indexof_pos' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1559
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1560
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1561
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1562
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1563
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1564
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1565
# builtin indexof
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1566

.end # builtineval_indexof_pos


.sub 'builtin_sleep' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1570
# var expr: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1571
# reg: $S1
    null $S1
.annotate 'line', 1572
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
# switch
.annotate 'line', 1573
    set $S4, $S2
    set $S5, 'I'
    if $S4 == $S5 goto __label_4
    set $S5, 'N'
    if $S4 == $S5 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 1575
    $P2 = $P1.'emit_getint'(__ARG_1)
    set $S1, $P2
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 1578
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 1581
    $P4 = $P1.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 1582
    set $S1, "0"
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 1584
# aux: $S3
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 1585
    $P2 = __ARG_2.'tempreg'('N')
    set $S1, $P2
.annotate 'line', 1586
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1587
    __ARG_1.'emitset'($S1, $S3)
# }
  __label_7: # endif
  __label_2: # switch end
.annotate 'line', 1590
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1591
    __ARG_1.'emitarg1'('sleep', $S1)
# }
.annotate 'line', 1592

.end # builtin_sleep


.sub 'getbuiltins' :subid('WSubId_121')
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
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 1596
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1598
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('I')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('int', WSubId_23, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1596
    __ARG_1.'add'($P1)
.annotate 'line', 1601
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1602
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('N')
    set $P3, $P4
    $P2.'BuiltinFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1601
    __ARG_1.'add'($P1)
.annotate 'line', 1605
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1607
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('S')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('string', WSubId_24, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1605
    __ARG_1.'add'($P1)
.annotate 'line', 1610
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1611
    $P2.'BuiltinFunction'('var', WSubId_25, 'P', '!')
    set $P1, $P2
.annotate 'line', 1610
    __ARG_1.'add'($P1)
.annotate 'line', 1614
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1618
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1622
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1626
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1630
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1631
    $P2.'BuiltinFunction'('sleep', WSubId_26, 'v', '!')
    set $P1, $P2
.annotate 'line', 1630
    __ARG_1.'add'($P1)
.annotate 'line', 1634
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1638
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1642
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1646
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1650
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1657
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1664
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1671
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1679
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1688
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1698
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1702
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1703
    $P2.'BuiltinFunctionEval'('length', WSubId_27, 'length %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1702
    __ARG_1.'add'($P1)
.annotate 'line', 1707
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1708
    $P2.'BuiltinFunctionEval'('bytelength', WSubId_28, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1707
    __ARG_1.'add'($P1)
.annotate 'line', 1712
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1713
    $P2.'BuiltinFunctionEval'('chr', WSubId_29, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
.annotate 'line', 1712
    __ARG_1.'add'($P1)
.annotate 'line', 1721
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1722
    $P2.'BuiltinFunctionEval'('ord', WSubId_30, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1721
    __ARG_1.'add'($P1)
.annotate 'line', 1726
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1727
    $P2.'BuiltinFunctionEval'('ord', WSubId_31, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1726
    __ARG_1.'add'($P1)
.annotate 'line', 1731
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1732
    $P2.'BuiltinFunctionEval'('substr', WSubId_32, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1731
    __ARG_1.'add'($P1)
.annotate 'line', 1736
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1737
    $P2.'BuiltinFunctionEval'('substr', WSubId_33, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
.annotate 'line', 1736
    __ARG_1.'add'($P1)
.annotate 'line', 1741
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1745
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1746
    $P2.'BuiltinFunctionEval'('indexof', WSubId_34, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1745
    __ARG_1.'add'($P1)
.annotate 'line', 1750
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
.annotate 'line', 1751
    $P2.'BuiltinFunctionEval'('indexof', WSubId_35, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1750
    __ARG_1.'add'($P1)
.annotate 'line', 1755
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1759
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('escape', 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1763
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1771
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1779
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1786
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1793
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1797
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1801
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1805
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1809
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1816
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1823
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1827
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1831
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1835
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1839
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1843
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1847
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1851
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1855
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1859
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1863
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1867
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1871
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1875
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1888
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1892
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1896
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1900
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1904
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1908
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1912
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1916
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1920
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1924
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1928
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1935
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1942
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1946
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1950
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1954
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1958
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1962
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1963
    $P2.'BuiltinFunction'('print', WSubId_36, 'v', '*')
    set $P1, $P2
.annotate 'line', 1962
    __ARG_1.'add'($P1)
.annotate 'line', 1966
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1967
    $P2.'BuiltinFunction'('say', WSubId_37, 'v', '*')
    set $P1, $P2
.annotate 'line', 1966
    __ARG_1.'add'($P1)
.annotate 'line', 1970
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1971
    $P2.'BuiltinFunction'('cry', WSubId_38, 'v', '*')
    set $P1, $P2
.annotate 'line', 1970
    __ARG_1.'add'($P1)
.annotate 'line', 1974
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1975
    $P2.'BuiltinFunction'('__ASSERT__', WSubId_39, 'v', 'I')
    set $P1, $P2
.annotate 'line', 1974
    __ARG_1.'add'($P1)
.annotate 'line', 1978
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
.annotate 'line', 1979
    $P2.'BuiltinFunction'('invoke', WSubId_40, 'P', '!')
    set $P1, $P2
.annotate 'line', 1978
    __ARG_1.'add'($P1)
# }
.annotate 'line', 1982

.end # getbuiltins


.sub 'optimize_array' :subid('WSubId_43')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1990
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1991
# n: $I1
# builtin elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1992
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1993
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1992
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1995

.end # optimize_array


.sub 'emit_array' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1999
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 2000
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2001

.end # emit_array


.sub 'parseDotted' :subid('WSubId_60')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2005
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2006
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2007
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2008
# builtin push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 2009
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 2010
    $P2 = __ARG_1.'get'()
.annotate 'line', 2011
# builtin push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 2014
    __ARG_1.'unget'($P2)
.annotate 'line', 2015
    .return($P1)
# }
.annotate 'line', 2016

.end # parseDotted


.sub 'parseList' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2024
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2025
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 2026
# {
.annotate 'line', 2027
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 2028
# builtin push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 2029
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 2030
    unless_null __ARG_4, __label_4
.annotate 'line', 2031
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2033
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 2034
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 2035
    .return($P1)
# }
.annotate 'line', 2036

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 2041
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2042
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2043
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 2044
    .return($P1)
# }
.annotate 'line', 2045

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_61')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2049
    new $P1, ['ResizableStringArray']
.annotate 'line', 2050
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 2051
    $P4 = $P2.'getidentifier'()
# builtin push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2052
    .return($P1)
# }
.annotate 'line', 2053

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2066
    setattribute self, 'start', __ARG_1
.annotate 'line', 2067
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 2068

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 2071
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2072
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2074
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 2075

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 2078
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2079
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2081
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 2082

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 2085
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2086
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2088
    .return("")
  __label_2: # endif
# }
.annotate 'line', 2089

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2092
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 2093

.end # annotate


.sub 'getpath' :method
# Body
# {
.annotate 'line', 2096
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()
# }
.annotate 'line', 2097

.end # getpath


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2100
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
# }
.annotate 'line', 2101

.end # use_builtin


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 2104
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 2105

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2108
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 2109

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2112
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 2113

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 2116
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2117

.end # scopesearch


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 2120
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 2121

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 2061
    addattribute $P0, 'start'
.annotate 'line', 2062
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2138
    setattribute self, 'owner', __ARG_1
.annotate 'line', 2139
    setattribute self, 'e', __ARG_2
# }
.annotate 'line', 2140

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2143
# var e: $P1
    getattribute $P1, self, 'e'
.annotate 'line', 2144
# valuereg: $S1
    null $S1
.annotate 'line', 2145
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2146
# var pnull: $P2
    getattribute $P2, self, 'pnull'
.annotate 'line', 2147
    unless_null $P2, __label_3
# {
.annotate 'line', 2148
# regnull: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2149
    $P1.'emitnull'($S2)
.annotate 'line', 2150
    box $P2, $S2
    setattribute self, 'pnull', $P2
# }
  __label_3: # endif
.annotate 'line', 2152
    set $S1, $P2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 2155
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2156
    .return($S1)
# }
.annotate 'line', 2157

.end # add

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
.annotate 'line', 2133
    addattribute $P0, 'owner'
.annotate 'line', 2134
    addattribute $P0, 'e'
.annotate 'line', 2135
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2172
    $P2 = WSubId_41(__ARG_1, __ARG_2, WSubId_42, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 2173

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2177
    getattribute $P1, self, 'args'
# builtin elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 2178

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 2181
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2182
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 2183

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2187
    getattribute $P1, self, 'args'
    WSubId_43($P1)
# }
.annotate 'line', 2188

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2191
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2192
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2193
    $P5 = $P2.'emit_get'(__ARG_1)
# builtin push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2194
    .return($P1)
# }
.annotate 'line', 2195

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2198
    $P1 = self.'getargvalues'(__ARG_1)
# builtin join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 2199

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2168
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 2211
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2214
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2215
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2216
    .return($I1)
# }
.annotate 'line', 2217

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2220
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2221
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2222
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2223
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 2224

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2227
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2228
    if_null __ARG_2, __label_1
.annotate 'line', 2229
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 2230

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2233
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2234
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2235
    .return(self)
# }
.annotate 'line', 2236

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2208
    addattribute $P0, 'name'
.annotate 'line', 2209
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2241
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2242
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2243
    $P1 = __ARG_1.'get'()
.annotate 'line', 2244
# var args: $P2
    null $P2
.annotate 'line', 2245
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2246
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2248
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2249
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2250

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 2259
    $P2 = WSubId_41(__ARG_1, __ARG_2, WSubId_44, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2260

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2263
    getattribute $P1, self, 'list'
    WSubId_43($P1)
# }
.annotate 'line', 2264

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2265
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2268
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2269
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2270
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2272
    .return($P2)
# }
.annotate 'line', 2273

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2255
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_22')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2282
# r: $S1
    null $S1
.annotate 'line', 2283
# builtin elements
    elements $I1, __ARG_1
    unless $I1 goto __label_1
.annotate 'line', 2284
# builtin string
# builtin join
    join $S2, "'; '", __ARG_1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 2285
    .return($S1)
# }
.annotate 'line', 2286

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2290
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2292
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2294
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2296
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2293
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2295
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2297
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2299
    __ARG_2.'unget'($P1)
.annotate 'line', 2300
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2302

.end # parseUsing


.sub 'parseSig' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2306
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2307
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2308
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2309
    WSubId_45("'='", $P2)
  __label_1: # endif
.annotate 'line', 2310
# var expr: $P3
    $P3 = WSubId_42(__ARG_2, __ARG_3)
.annotate 'line', 2311
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2312

.end # parseSig


.sub 'parseStatement' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 2316
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2317
# var t2: $P2
    null $P2
.annotate 'line', 2318
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2319
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2320
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2321
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2322
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2323
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2324
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 2325
# var open: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2326
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2327
    WSubId_46("':'", $P1)
  __label_5: # endif
.annotate 'line', 2328
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2331
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
.annotate 'line', 2333
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2335
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2338
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2341
    $P2 = __ARG_1.'get'()
.annotate 'line', 2342
    __ARG_1.'unget'($P2)
.annotate 'line', 2343
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2344
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2347
    $P2 = __ARG_1.'get'()
.annotate 'line', 2348
    __ARG_1.'unget'($P2)
.annotate 'line', 2349
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2350
    .tailcall WSubId_52($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2353
    $P2 = __ARG_1.'get'()
.annotate 'line', 2354
    __ARG_1.'unget'($P2)
.annotate 'line', 2355
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2356
    .tailcall WSubId_53($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2359
    $P2 = __ARG_1.'get'()
.annotate 'line', 2360
    __ARG_1.'unget'($P2)
.annotate 'line', 2361
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2362
    .tailcall WSubId_54($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2365
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2367
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2369
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2371
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2373
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2375
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2377
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2379
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2381
    .tailcall WSubId_55($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2383
    .tailcall WSubId_56($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2385
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2387
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2390
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
# {
.annotate 'line', 2391
# var t2: $P4
    $P4 = __ARG_1.'get'()
.annotate 'line', 2392
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2393
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2394
    __ARG_1.'unget'($P4)
# }
  __label_31: # endif
.annotate 'line', 2396
    __ARG_1.'unget'($P1)
.annotate 'line', 2397
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 2398

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2408
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2409

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2410
    .return(0)
# }

.end # isempty


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 2413
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
# }
.annotate 'line', 2414

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2417
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2418

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2421
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2422

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2425
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2426

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2429
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2430

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2433
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2434

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2437
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2438

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2441
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2442

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2445
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2446

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2449
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2450

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2453
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2454

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2457
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2458

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2461
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2462

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2465
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2466

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2473
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2474

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2477
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2478

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2481
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2482

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2485
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2487
    .return(self)
# }
.annotate 'line', 2488

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2404
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2493
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2496
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2497

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2498
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2491
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2511
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2512
# n: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 2513
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2514
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2515
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2516
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2517
    null $I2
  __label_4: # endif
.annotate 'line', 2518
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2514
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2520
    unless $I2 goto __label_7
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
# }
.annotate 'line', 2521

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2507
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2528
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2529
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2530

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2531
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2534
    getattribute $P1, self, 'statements'
# builtin push
    push $P1, __ARG_1
.annotate 'line', 2535
    .return(self)
# }
.annotate 'line', 2536

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2539
    getattribute $P1, self, 'statements'
    WSubId_57(__ARG_1, $P1)
# }
.annotate 'line', 2540

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2524
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
# switch-case
.annotate 'line', 2546
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2548
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2547
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2549
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2551
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 2553

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2561
# var arg: $P1
    null $P1
.annotate 'line', 2562
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2563
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2564
    $P2 = __ARG_1.'get'()
.annotate 'line', 2565
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2566
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2569
    __ARG_1.'unget'($P2)
.annotate 'line', 2570
    $P1 = WSubId_42(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2572
    .return($P1)
# }
.annotate 'line', 2573

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2582
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2583
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2584
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2585
    unless $I1 goto __label_1
.annotate 'line', 2586
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2587
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2588
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2589
    $P1 = __ARG_2.'get'()
.annotate 'line', 2590
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2591
    __ARG_2.'unget'($P1)
.annotate 'line', 2592
    $P3 = WSubId_41(__ARG_2, __ARG_3, WSubId_58, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2594
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 2595

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2598
    getattribute $P1, self, 'args'
    WSubId_43($P1)
.annotate 'line', 2599
    .return(self)
# }
.annotate 'line', 2600

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2603
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2604
    self.'annotate'(__ARG_1)
.annotate 'line', 2605
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2606
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2607
    __ARG_1.'print'('    ')
.annotate 'line', 2608
    unless_null $P1, __label_2
.annotate 'line', 2609
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2611
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2612
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2613
    $P4 = $P3.'emit_get'(__ARG_1)
# builtin push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2614
# builtin join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2616

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2575
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2577
    addattribute $P0, 'opname'
.annotate 'line', 2578
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 2628
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2629
# var path: $P1
    $P1 = WSubId_60(__ARG_2)
.annotate 'line', 2630
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2631
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2632
    WSubId_59(';', __ARG_2)
.annotate 'line', 2633
    $P3 = WSubId_61($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2634
    .return(self)
# }
.annotate 'line', 2635

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2636
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2639
    self.'annotate'(__ARG_1)
.annotate 'line', 2640
    getattribute $P1, self, 'path'
# builtin join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2641

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2623
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2625
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 2653
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2654
# var names: $P1
    null $P3
    $P1 = WSubId_41(__ARG_2, $P3, WSubId_62, ';')
.annotate 'line', 2655
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2656
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2657
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2659
    setattribute self, 'names', $P1
# }
.annotate 'line', 2660

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2663
    .return(self)
# }
.annotate 'line', 2664

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2667
    self.'annotate'(__ARG_1)
.annotate 'line', 2668
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2669
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2670
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2672

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2648
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2650
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2686
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2687
# var path: $P1
    $P1 = WSubId_60(__ARG_2)
.annotate 'line', 2688
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2689
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2690
    WSubId_59(';', __ARG_2)
.annotate 'line', 2691
    setattribute self, 'path', $P1
# }
.annotate 'line', 2692

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2695
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2696
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2698
# var symbol: $P3
    $P3 = self.'scopesearch'($P1, 0)
# switch-case
.annotate 'line', 2700
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2714
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2701
# builtin elements
    elements $I2, $P1
    unless $I2 goto __label_5
# {
.annotate 'line', 2702
# var p: $P4
# builtin clone
    clone $P4, $P1
.annotate 'line', 2703
    $P4.'pop'()
.annotate 'line', 2704
# var ns: $P5
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2705
    if_null $P5, __label_6
# {
.annotate 'line', 2706
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2707
    if_null $P3, __label_7
# {
.annotate 'line', 2708
    self.'createvarused'($P2, $P3)
.annotate 'line', 2709
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
.annotate 'line', 2715
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2716
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2717
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2718
    self.'usesubid'($S1)
.annotate 'line', 2719
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2721
    self.'createvar'($P2, 'P')
.annotate 'line', 2722
    .return(self)
# }
.annotate 'line', 2723

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 2726
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2727
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2728
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2729
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2730
    self.'annotate'(__ARG_1)
.annotate 'line', 2731
# key: $S2
    null $S2
.annotate 'line', 2732
# builtin elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2733
    $P1.'pop'()
.annotate 'line', 2734
    $P3 = WSubId_22($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2736
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2738

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2679
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2681
    addattribute $P0, 'path'
.annotate 'line', 2682
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2748
# var nskey: $P1
    $P1 = WSubId_60(__ARG_2)
.annotate 'line', 2749
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2750
    WSubId_45('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2751
# var nssym: $P2
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2752
    unless_null $P2, __label_2
.annotate 'line', 2753
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2754
    __ARG_3.'usenamespace'($P2)
# }
.annotate 'line', 2755

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2761
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2762
    WSubId_63(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2763
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 2764

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2767
    .return(self)
# }
.annotate 'line', 2768

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2757
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2783
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2784
    $P2 = WSubId_42(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2785
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 2786

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2789
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2790
    .return(self)
# }
.annotate 'line', 2791

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2794
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2795

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2778
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2780
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
.annotate 'line', 2812
    setattribute self, 'type', __ARG_1
.annotate 'line', 2813
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2814
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2815
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2816

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2819
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2820

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2821
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2822
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2823
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2824
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2825
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2826
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2827
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags


.sub 'issubid' :method
# Body
# {
.annotate 'line', 2830
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 2831
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_1
    set $S2, $P1
# builtin substr
    substr $S1, $S2, 0, 7
    iseq $I1, $S1, 'WSubId_'
  __label_1:
    .return($I1)
# }
.annotate 'line', 2832

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2804
    addattribute $P0, 'type'
.annotate 'line', 2805
    addattribute $P0, 'reg'
.annotate 'line', 2806
    addattribute $P0, 'scope'
.annotate 'line', 2807
    addattribute $P0, 'flags'
.annotate 'line', 2808
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2840
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2841

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2844
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2845

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2837
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
.annotate 'line', 2854
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2855

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2856
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2859
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2860
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2861
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2862

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2848
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2850
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2873
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2874

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2877
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2878
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2879
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2880
    if_null $P2, __label_2
.annotate 'line', 2881
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2882
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2883
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2884
    $P1[$S1] = $P3
.annotate 'line', 2885
    .return($P3)
# }
.annotate 'line', 2886

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2889
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2890
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2891
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2892
    if_null $P2, __label_2
.annotate 'line', 2893
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2894
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2895

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2898
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2899
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2900
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2901
    if_null $P2, __label_2
.annotate 'line', 2902
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2903
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2904

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2907
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2908
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2909
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2910
    if_null $P2, __label_2
.annotate 'line', 2911
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2912
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2913
    $P1[$S1] = $P3
.annotate 'line', 2914
    .return($P3)
# }
.annotate 'line', 2915

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2918
# var locals: $P1
    getattribute $P1, self, 'locals'
# builtin string
.annotate 'line', 2919
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2920

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2923
# var sym: $P1
    null $P1
.annotate 'line', 2924
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2925
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2926
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2928
    .return($P3)
# }
.annotate 'line', 2929

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2932
# var sym: $P1
    null $P1
.annotate 'line', 2933
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2934
    .return($P1)
  __label_1: # endif
.annotate 'line', 2935
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2936
    .return($P1)
  __label_2: # endif
.annotate 'line', 2937
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2938
    if_null $P2, __label_3
.annotate 'line', 2939
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2940
    .return($P3)
# }
.annotate 'line', 2941

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2944
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2945
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2946
    .return($S1)
# }
.annotate 'line', 2947

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2950
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2952
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2953
    .return('__WLEX_self')
# }
.annotate 'line', 2954

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2868
    addattribute $P0, 'locals'
.annotate 'line', 2869
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2963
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
.annotate 'line', 2975
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2976

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2977
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2978
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2979
    .return(0)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
.annotate 'line', 2980
    .return(0)
# }

.end # isintegerzero


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2981
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2982
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2983
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2984
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2985
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2986
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2989
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2990

.end # tempreg


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2993
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2994

.end # genlabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2998
    .return(self)
# }
.annotate 'line', 2999

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 3000
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3003
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3004
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $P1 = self.'tempreg'($S1)
    set $S2, $P1
  __label_2:
.annotate 'line', 3005
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3006
    .return($S2)
# }
.annotate 'line', 3007

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3010
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3011
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 3012
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 3013

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3016
# reg: $S1
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3017
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
# {
.annotate 'line', 3018
# aux: $S2
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3019
    self.'annotate'(__ARG_1)
.annotate 'line', 3020
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 3021
    set $S1, $S2
# }
  __label_2: # endif
.annotate 'line', 3023
    .return($S1)
# }
.annotate 'line', 3024

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 3027
    WSubId_64(self)
# }
.annotate 'line', 3028

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2971
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 3033
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 3031
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 3043
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3044
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 3045
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3046
    WSubId_45('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3047
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 3048

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3049
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3052
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3053
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3054
    .return(self)
# }
.annotate 'line', 3055

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3058
    self.'annotate'(__ARG_1)
.annotate 'line', 3059
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 3060
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3061
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3062
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 3063
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 3065
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3067

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3038
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3040
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
.annotate 'line', 3082
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3083
    .return(self)
# }
.annotate 'line', 3084

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 3087
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 3088

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3091
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3092
    .return(self)
# }
.annotate 'line', 3093

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 3096
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3097
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3098
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
.annotate 'line', 3099
    .return(0)
# }
.annotate 'line', 3100

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3103
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3105
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3106
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3107
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3109
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3110
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
.annotate 'line', 3113
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3116
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3119
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3122

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3125
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3127
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3128
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3129
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3131
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3132
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
.annotate 'line', 3135
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3138
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3141
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3144

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3079
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 3151
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 3152
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3149
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3162
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3163
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 3164

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 3165
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3166
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 3169
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3170
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3171
    .return($S1)
# }
.annotate 'line', 3172

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 3175
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3176
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3177
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3178
# builtin unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3179
    .return($S1)
# }
.annotate 'line', 3180

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3183
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 3184
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 3185

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3188
    .tailcall self.'getPirString'()
# }
.annotate 'line', 3189

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3157
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3159
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3200
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3201
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3202
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 3203
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 3204

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 3205
    .return(1)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
# builtin int
.annotate 'line', 3208
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
# }
.annotate 'line', 3209

.end # isintegerzero


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3210
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 3213
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 3214

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3217
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3218
    .return($N1)
# }
.annotate 'line', 3219

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3222
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 3223
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3224
    if $I1 goto __label_2
.annotate 'line', 3225
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3227
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3229

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3232
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 3233

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3194
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3196
    addattribute $P0, 'pos'
.annotate 'line', 3197
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3243
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3244
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 3245

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 3246
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3247
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3250
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3251
    .return($N1)
# }
.annotate 'line', 3252

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3255
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3256
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3257
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3259

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 3262
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3263
    .tailcall WSubId_65($N1)
# }
.annotate 'line', 3264

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3238
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3240
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3273
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3276
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3277
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3278

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3281
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3282
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3283
    .return(0)
  __label_1: # endif
.annotate 'line', 3284
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3285

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3288
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3289
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3290
    if_null $P2, __label_1
.annotate 'line', 3291
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3293
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3296
    .return('P')
  __label_4: # default
.annotate 'line', 3298
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3301

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3304
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3305
    .return($S1)
# }
.annotate 'line', 3306

.end # getName


.sub 'checkVar' :method
# Body
# {
.annotate 'line', 3309
    getattribute $P1, self, 'owner'
# builtin string
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
# }
.annotate 'line', 3310

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3313
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3314
    unless_null $P1, __label_1
.annotate 'line', 3315
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3316
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3317
# s: $S1
    null $S1
.annotate 'line', 3318
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3319
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3322
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3324
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3328
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3329
    .return($S1)
# }
.annotate 'line', 3330

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 3333
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3334
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3335
    getattribute $P2, self, 'name'
    WSubId_66($P2)
  __label_1: # endif
.annotate 'line', 3336
    .return($P1)
# }
.annotate 'line', 3337

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3340
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3341
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3342
    if_null $P2, __label_1
# {
.annotate 'line', 3343
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3344
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3345
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3346
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3347
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3348
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3355
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3356
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# builtin substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3357
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
.annotate 'line', 3361
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3362
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3363
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_11
# {
.annotate 'line', 3364
# id: $S1
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_12
    set $S1, $P6
  __label_12:
.annotate 'line', 3365
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3366
    self.'usesubid'($S1)
.annotate 'line', 3367
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3371
    .return(self)
# }
.annotate 'line', 3372

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3375
# id: $S1
    null $S1
.annotate 'line', 3376
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3377
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3379
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3380
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3381
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_3:
.annotate 'line', 3382
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3383
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3384
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3385
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3386
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3390
    .return($S1)
# }
.annotate 'line', 3391

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3394
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3395
    self.'annotate'(__ARG_1)
.annotate 'line', 3396
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3397
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3399

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3402
    self.'annotate'(__ARG_1)
.annotate 'line', 3403
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3404

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3407
    self.'annotate'(__ARG_1)
.annotate 'line', 3408
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3409
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3410
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3411
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3412
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3413
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3416
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3419
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3422
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3423
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3425
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3426
    ne $S3, 'v', __label_13
.annotate 'line', 3427
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3428
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3429
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3432
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3433
    self.'annotate'(__ARG_1)
.annotate 'line', 3434
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3435
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3437
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3440
    .return($S2)
# }
.annotate 'line', 3441

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3269
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3271
    addattribute $P0, 'name'
.annotate 'line', 3272
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3451
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3452
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3453

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3456
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3457

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3460
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3461
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3462
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3463
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3464
    .return($S2)
# }
.annotate 'line', 3465

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3468
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3469
    self.'annotate'(__ARG_1)
.annotate 'line', 3470
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3471
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3473

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3476
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3477
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3478
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3480
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3483
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3481
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3484
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3487
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3488
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3489
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3491
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3492
    self.'annotate'(__ARG_1)
.annotate 'line', 3493
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3497
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3498

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3501
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3502

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3446
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3448
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3511
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3512

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3507
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 3522
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3523
    $P2 = WSubId_60(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3524
    getattribute $P1, self, 'key'
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3525
    WSubId_45('namespace identifier', __ARG_3)
  __label_1: # endif
# }
.annotate 'line', 3526

.end # OpNamespaceExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3527
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3530
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3531
# var sym: $P2
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3532
    unless_null $P2, __label_1
.annotate 'line', 3533
    getattribute $P4, self, 'start'
    WSubId_1('unknown namespace', $P4)
  __label_1: # endif
.annotate 'line', 3534
# var path: $P3
    $P3 = $P2.'getpath'()
.annotate 'line', 3535
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
# }
.annotate 'line', 3536

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3517
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3519
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 3547
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3548
    $P2 = WSubId_67(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3549

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3550
    .return('P')
# }

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3553
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3554
# var clspec: $P2
    getattribute $P2, self, 'clspec'
# switch-case
.annotate 'line', 3557
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 3558
# var clkey: $P3
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3559
    if_null $P3, __label_5
    getattribute $P4, $P3, 'path'
    goto __label_4
  __label_5:
    null $P4
  __label_4:
    .return($P4)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3561
    getattribute $P4, self, 'start'
    WSubId_1("Testing, unfinished", $P4)
# }
.annotate 'line', 3562

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3565
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3566
# var clspec: $P2
    getattribute $P2, self, 'clspec'
.annotate 'line', 3569
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3570
    getattribute $P4, self, 'owner'
    __ARG_2 = $P4.'tempreg'('P')
  __label_1: # endif
# switch-case
.annotate 'line', 3574
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 3575
# var clkey: $P3
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3576
    if_null $P3, __label_5
# {
.annotate 'line', 3577
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3578
    .return()
# }
  __label_5: # endif
    goto __label_2 # break
  __label_3: # default
  __label_2: # switch end
.annotate 'line', 3583
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3584
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3585
    __ARG_1.'say'()
# }
.annotate 'line', 3586

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3541
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3543
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3596
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3597
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3598

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3601
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3602

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3605
    self.'optimizearg'()
.annotate 'line', 3606
    .return(self)
# }
.annotate 'line', 3607

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3591
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3593
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
.annotate 'line', 3618
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3619
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3620
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3621

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3624
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3625
    .return(self)
# }
.annotate 'line', 3626

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3629
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3630

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3633
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3634
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3635

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3638
    self.'optimizearg'()
.annotate 'line', 3639
    .return(self)
# }
.annotate 'line', 3640

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3643
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3644

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3647
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3648

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3612
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3614
    addattribute $P0, 'lexpr'
.annotate 'line', 3615
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3657
    .return('I')
# }
.annotate 'line', 3658

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3661
    self.'optimizearg'()
.annotate 'line', 3662
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3663
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3664
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3665
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3666
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3667
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3669
    .return(self)
# }
.annotate 'line', 3670

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3653
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3679
    .return('I')
# }
.annotate 'line', 3680

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3675
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
.annotate 'line', 3688
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3689

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3692
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3693
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3694
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3695
    self.'annotate'(__ARG_1)
.annotate 'line', 3696
    __ARG_1.'print'('    delete ')
.annotate 'line', 3697
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3698
    __ARG_1.'say'()
.annotate 'line', 3699
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3700
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3703
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3704

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3684
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
.annotate 'line', 3711
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3712

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3715
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3716
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
.annotate 'line', 3717
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3718
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3719
    self.'annotate'(__ARG_1)
.annotate 'line', 3720
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3721
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3722
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3725
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3726

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3707
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
.annotate 'line', 3735
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3736

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3739
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3740

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3743
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3744
    .return(self)
# }
.annotate 'line', 3745

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 3748
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3749
    self.'optimizearg'()
.annotate 'line', 3750
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3751
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3752
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3755
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3756
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3757
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_68($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3760
    .return(self)
# }
.annotate 'line', 3761

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3764
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3765
    self.'annotate'(__ARG_1)
.annotate 'line', 3766
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3767

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3731
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
.annotate 'line', 3776
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3777

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3778
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3781
    .return('I')
# }
.annotate 'line', 3782

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3785
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3786
    .return(self)
# }
.annotate 'line', 3787

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3790
    self.'optimizearg'()
.annotate 'line', 3791
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3792
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3793
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3794
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3796
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3797
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3798
    .return(self)
# }
.annotate 'line', 3799

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3802
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3803

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3806
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3807
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3808
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3809
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3811
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3814
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3817
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3819

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3772
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
.annotate 'line', 3828
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3829

.end # OpBinNotExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3832
    .return('I')
# }
.annotate 'line', 3833

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3836
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3837
    .return(self)
# }
.annotate 'line', 3838

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3841
    self.'optimizearg'()
.annotate 'line', 3842
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3843
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3844
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3845
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3847
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3848
    .tailcall $P1.'negated'()
  __label_2: # endif
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
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3854
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3855
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3856
    self.'annotate'(__ARG_1)
.annotate 'line', 3857
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
# }
  __label_2: # endif
# }
.annotate 'line', 3859

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 3824
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3868
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3869

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3872
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3873
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3874
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3875

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3864
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3884
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3885
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3886
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3887

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3880
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
.annotate 'line', 3894
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3895

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3898
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3899
    self.'annotate'(__ARG_1)
.annotate 'line', 3900
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3901
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3902
    .return($S1)
# }
.annotate 'line', 3903

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3890
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
.annotate 'line', 3910
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3911

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3914
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3915
    self.'annotate'(__ARG_1)
.annotate 'line', 3916
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3917
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3918
    .return($S1)
# }
.annotate 'line', 3919

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3906
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
.annotate 'line', 3928
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3929

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3932
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3933
    self.'annotate'(__ARG_1)
.annotate 'line', 3934
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3935
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3936
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3937
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3938
    .return($S1)
# }
.annotate 'line', 3939

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3924
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
.annotate 'line', 3946
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3947

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3950
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3951
    self.'annotate'(__ARG_1)
.annotate 'line', 3952
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3953
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3954
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3955
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3956
    .return($S1)
# }
.annotate 'line', 3957

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3942
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
.annotate 'line', 3968
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3969
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3970
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3971
    .return(self)
# }
.annotate 'line', 3972

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3975
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3976

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3979
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3980
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3981
    .return(self)
# }
.annotate 'line', 3982

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3985
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3986

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 3989
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3990
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3991
    WSubId_64($P1)
  __label_1: # endif
# }
.annotate 'line', 3992

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3995
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3996
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3997
    self.'annotate'(__ARG_1)
.annotate 'line', 3998
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 4000

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3962
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3964
    addattribute $P0, 'lexpr'
.annotate 'line', 3965
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4009
    self.'annotate'(__ARG_1)
.annotate 'line', 4010
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4011
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 4012

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 4005
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4021
    self.'annotate'(__ARG_1)
.annotate 'line', 4022
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4023
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 4024
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 4025

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4028
    self.'checkleft'()
.annotate 'line', 4029
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4030
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 4031
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 4032
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 4033
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 4034
    self.'annotate'(__ARG_1)
.annotate 'line', 4035
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 4036
    .return($S1)
# }
.annotate 'line', 4037

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 4017
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4046
    self.'checkleft'()
.annotate 'line', 4047
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4048
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4049
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4050
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4051
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4052
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 4053
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4055
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 4056
# aux: $S5
    null $S5
.annotate 'line', 4057
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 4058
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 4060
    eq $S2, 'S', __label_13
# {
.annotate 'line', 4061
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4062
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4063
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 4065
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 4069
    eq $S1, $S2, __label_14
# {
.annotate 'line', 4070
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4071
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4072
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 4074
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4077
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 4080
    .return($S3)
# }
.annotate 'line', 4081

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 4042
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4090
    self.'checkleft'()
.annotate 'line', 4091
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4092
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4093
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4094
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4095
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4096
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4097
# aux: $S5
    null $S5
.annotate 'line', 4098
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 4099
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 4101
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4104
    eq $S1, $S2, __label_10
# {
.annotate 'line', 4105
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4106
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4107
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 4109
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 4112
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 4114
    .return($S3)
# }
.annotate 'line', 4115

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4086
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4124
    self.'checkleft'()
.annotate 'line', 4125
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4126
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4127
# lreg: $S1
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4128
# rreg: $S2
    null $S2
# switch
.annotate 'line', 4129
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    set $S4, 'S'
    if $S3 == $S4 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 4131
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4132
    self.'annotate'(__ARG_1)
.annotate 'line', 4133
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 4136
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4137
    self.'annotate'(__ARG_1)
.annotate 'line', 4138
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_2: # switch end
.annotate 'line', 4140
    .return($S1)
# }
.annotate 'line', 4141

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4120
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4150
    self.'checkleft'()
.annotate 'line', 4151
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4152
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4153
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4154
    self.'annotate'(__ARG_1)
.annotate 'line', 4155
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 4156
    .return($S2)
# }
.annotate 'line', 4157

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4146
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4166
    self.'checkleft'()
.annotate 'line', 4167
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4168
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4169
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4170
    self.'annotate'(__ARG_1)
.annotate 'line', 4171
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 4172
    .return($S2)
# }
.annotate 'line', 4173

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4162
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
.annotate 'line', 4185
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4188
    self.'optimizearg'()
.annotate 'line', 4189
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4190
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4191
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4192
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4193
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4194
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 4196
    .return(self)
# }
.annotate 'line', 4197

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 4200
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4201
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4202
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4203
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4204
    self.'annotate'(__ARG_1)
.annotate 'line', 4205
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 4207
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4212
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4217
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4222
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4227
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4232
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4208
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4209
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4210
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4213
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4214
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4215
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4218
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4219
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4220
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4223
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4224
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4225
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4228
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4229
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4230
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4233
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4234
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4235
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4236
# switch
.annotate 'line', 4239
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4241
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4244
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 4247
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 4248
# }
.annotate 'line', 4250

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4253
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4254

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4257
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4258

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4261
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 4262

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4183
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4273
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
# }
.annotate 'line', 4274

.end # Negable


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4275
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4278
# positive: $I1
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4279
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4280
    .return(self)
# }
.annotate 'line', 4281

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4269
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4295
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4296
    self.'Negable'(__ARG_3)
.annotate 'line', 4297
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 4298

.end # CheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4299
    .return('I')
# }

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4289
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4291
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4306
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4307

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4310
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4311
    self.'annotate'(__ARG_1)
.annotate 'line', 4312
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4313
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4314
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 4315

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4318
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4319
    self.'annotate'(__ARG_1)
.annotate 'line', 4320
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4321
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4323
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4324

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4302
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
.annotate 'line', 4331
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4332

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4335
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4336
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4337
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 4338
    self.'annotate'(__ARG_1)
.annotate 'line', 4339
    getattribute $P2, self, 'positive'
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 4340
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_4
  __label_3: # else
.annotate 'line', 4342
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_4: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 4344

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4347
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4348
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4349
    self.'annotate'(__ARG_1)
.annotate 'line', 4350
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4351
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4353
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4354

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4327
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
.annotate 'line', 4363
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4364
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4365

.end # OpEqualExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4368
    self.'optimizearg'()
.annotate 'line', 4369
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4370
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4371
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4372
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4373
    unless $I1 goto __label_1
# {
.annotate 'line', 4374
    unless $I2 goto __label_2
.annotate 'line', 4375
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_21($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4377
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4379
    unless $I2 goto __label_4
.annotate 'line', 4380
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4381
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4382
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4383
    $I7 = $P1.'isliteral'()
    unless $I7 goto __label_8
    $I7 = $P2.'isliteral'()
  __label_8:
    unless $I7 goto __label_7
# {
.annotate 'line', 4384
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4385
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4387
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4388
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4389
# vi: $I5
    getattribute $P5, self, 'positive'
    if_null $P5, __label_15
    unless $P5 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4390
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall WSubId_21($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 4392
# ls: $S3
    getattribute $P9, $P1, 'strval'
    getattribute $P8, $P9, 'str'
    null $S3
    if_null $P8, __label_16
    set $S3, $P8
  __label_16:
.annotate 'line', 4393
# rs: $S4
    getattribute $P11, $P2, 'strval'
    getattribute $P10, $P11, 'str'
    null $S4
    if_null $P10, __label_17
    set $S4, $P10
  __label_17:
.annotate 'line', 4394
# vs: $I6
    getattribute $P12, self, 'positive'
    if_null $P12, __label_19
    unless $P12 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4395
    getattribute $P13, self, 'owner'
    getattribute $P14, self, 'start'
    .tailcall WSubId_21($P13, $P14, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_7: # endif
.annotate 'line', 4399
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4400
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4401
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4402
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4403
    .return(self)
# }
.annotate 'line', 4404

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4407
    self.'annotate'(__ARG_1)
.annotate 'line', 4408
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
.annotate 'line', 4409

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4412
    self.'annotate'(__ARG_1)
.annotate 'line', 4413
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4414

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4417
    self.'annotate'(__ARG_1)
.annotate 'line', 4418
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
.annotate 'line', 4419

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4422
    self.'annotate'(__ARG_1)
.annotate 'line', 4423
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
.annotate 'line', 4424

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4359
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
.annotate 'line', 4435
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4436
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4437

.end # OpSameExpr


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4440
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
.annotate 'line', 4441

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4444
    self.'annotate'(__ARG_1)
.annotate 'line', 4445
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4446
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4447
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4448

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4451
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4452

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4455
    self.'annotate'(__ARG_1)
.annotate 'line', 4456
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4457
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4458
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4459

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4462
    self.'annotate'(__ARG_1)
.annotate 'line', 4463
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4464
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4465
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4466

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4430
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4432
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4473
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4476
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4477

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4480
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4481

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4484
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4485

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4488
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4489

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4492
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4493

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4471
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4500
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4503
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4504

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4507
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4508

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4511
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4512

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4515
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4516

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4519
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4520

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4498
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4527
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4530
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4531

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4534
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4535

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4538
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4539

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4542
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4543

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4546
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4547

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4525
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4554
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4557
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4558

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4561
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4562

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4565
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4566

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4569
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4570

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4573
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4574

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4552
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4583
    .return('I')
# }
.annotate 'line', 4584

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4579
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
.annotate 'line', 4593
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4594

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4597
    self.'optimizearg'()
.annotate 'line', 4598
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4599
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4600
    unless $I1 goto __label_3
.annotate 'line', 4601
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4602
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_21($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4600
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4604
    .return(self)
# }
.annotate 'line', 4605

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4608
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
.annotate 'line', 4609
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4610
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4611
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4612
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4615
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4616
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4617
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4618
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4619
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4621

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4589
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
.annotate 'line', 4630
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4631

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4634
    self.'optimizearg'()
.annotate 'line', 4635
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4636
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4637
    if $I1 goto __label_3
.annotate 'line', 4638
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4639
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_21($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4637
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4641
    .return(self)
# }
.annotate 'line', 4642

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4645
# res: $S1
    null $S1
.annotate 'line', 4646
    if_null __ARG_2, __label_1
.annotate 'line', 4647
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4649
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4650
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4651
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4652
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4653
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4656
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4657
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4658
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4659
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4660
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4662

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4626
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4667
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
.annotate 'line', 4677
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4678

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4681
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
.annotate 'line', 4682
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4683
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4684
    self.'annotate'(__ARG_1)
.annotate 'line', 4685
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4686

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4689
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4690

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4673
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
.annotate 'line', 4699
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4700

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4703
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
.annotate 'line', 4704
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4705
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4706
    self.'annotate'(__ARG_1)
.annotate 'line', 4707
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4708

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4711
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4712

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4695
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
.annotate 'line', 4721
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4722

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4725
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
.annotate 'line', 4726
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4727
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4728
    self.'annotate'(__ARG_1)
.annotate 'line', 4729
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4730

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4733
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4734

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4717
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
.annotate 'line', 4744
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4746
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4753
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4747
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4748
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4749
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4751
    getattribute $P5, self, 'values'
# builtin push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4754
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4755
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4758
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 2
    $P10[0] = __ARG_3
    $P10[1] = __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4760

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4761
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4764
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4765
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4766
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4767
# i: $I2
    null $I2
# for loop
.annotate 'line', 4768
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4769
# builtin string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4768
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4770
    .return($P2)
# }
.annotate 'line', 4771

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4774
# auxreg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4775
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 4776
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 4777

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4780
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4781
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4782
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4783
    self.'annotate'(__ARG_1)
.annotate 'line', 4784
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4785
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4786
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4785
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4787
    .return($S1)
# }
.annotate 'line', 4788

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4791
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4792
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4793
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4794
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4795
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4794
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4796

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4739
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4741
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4805
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4806

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4807
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4810
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4811
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4812
# rreg: $S2
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4813
    set $S3, __ARG_2
    eq $S3, '', __label_3
# {
.annotate 'line', 4814
    self.'annotate'(__ARG_1)
.annotate 'line', 4815
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 4817

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4801
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
.annotate 'line', 4826
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4827

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 4830
    self.'optimizearg'()
.annotate 'line', 4831
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4832
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4833
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4834
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4835
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4836
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4841
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4842
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4843
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4845
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# builtin string
.annotate 'line', 4846
    getattribute $P9, $P3, 'str'
    set $S3, $P9
# builtin string
    getattribute $P10, $P4, 'str'
    set $S4, $P10
    concat $S5, $S3, $S4
    $P6.'TokenSingleQuoted'($P7, $P8, $S5)
    set $P5, $P6
    goto __label_7
  __label_8:
.annotate 'line', 4848
    new $P12, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P13, $P3, 'file'
    getattribute $P14, $P3, 'line'
# builtin string
.annotate 'line', 4849
    $P15 = $P3.'getasquoted'()
    set $S6, $P15
# builtin string
    $P16 = $P4.'getasquoted'()
    set $S7, $P16
    concat $S8, $S6, $S7
    $P12.'TokenQuoted'($P13, $P14, $S8)
    set $P11, $P12
    set $P5, $P11
  __label_7:
.annotate 'line', 4850
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4852
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4853
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4854
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4855
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4858
    $P6 = WSubId_69($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4859
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4860
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4861
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_68($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4865
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4866
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4868
    .return(self)
# }
.annotate 'line', 4869

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_69 = "WSubId_69"
# Body
# {
.annotate 'line', 4872
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4873
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4874
    ne $S1, $S2, __label_3
.annotate 'line', 4875
    .return($S1)
  __label_3: # endif
.annotate 'line', 4876
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4877
    .return('S')
  __label_4: # endif
.annotate 'line', 4878
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4879
    .return('S')
  __label_6: # endif
.annotate 'line', 4880
    $P1 = WSubId_69($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4881
    .return('N')
  __label_8: # endif
.annotate 'line', 4882
    .return('I')
# }
.annotate 'line', 4883

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4886
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4887
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4888
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4889
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4890
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4892
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4893
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4894
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4895
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4896
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4897
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4898
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4899
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4902
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4903
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4906
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4909
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4910
# l: $S7
    null $S7
.annotate 'line', 4911
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4913
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4914
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4916
# r: $S8
    null $S8
.annotate 'line', 4917
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4919
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4920
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4922
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4925
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4927

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4822
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
.annotate 'line', 4936
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4937

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4940
    self.'optimizearg'()
.annotate 'line', 4941
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4942
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4943
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4944
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4945
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4946
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4947
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4948
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4949
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4952
    .return(self)
# }
.annotate 'line', 4953

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4956
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4957
# rtype: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
# switch-case
.annotate 'line', 4959
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 4961
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 4963
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 4965
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 4960
    .return($S1)
  __label_6: # case
.annotate 'line', 4962
    .return('P')
  __label_8: # case
.annotate 'line', 4964
    .return('N')
  __label_10: # case
.annotate 'line', 4966
    .return('N')
  __label_4: # default
.annotate 'line', 4968
    .return('I')
  __label_3: # switch end
# }
.annotate 'line', 4970

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4973
# type: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4974
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4975
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4976
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4977
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4978
# lreg: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4979
# rreg: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4980
# aux: $S6
    null $S6
.annotate 'line', 4981
    eq $S2, $S1, __label_6
# {
.annotate 'line', 4982
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4983
    ne $S1, 'P', __label_7
.annotate 'line', 4984
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 4986
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 4987
    set $S4, $S6
# }
  __label_6: # endif
.annotate 'line', 4989
    eq $S3, $S1, __label_9
# {
.annotate 'line', 4990
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4991
    ne $S1, 'P', __label_10
.annotate 'line', 4992
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 4994
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 4995
    set $S5, $S6
# }
  __label_9: # endif
.annotate 'line', 4997
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
# }
.annotate 'line', 4998

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4932
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
.annotate 'line', 5007
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5008

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_68 = "WSubId_68"
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
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5015
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5016
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 5017
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'I'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 5018
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5019
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5020
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 5023
    $P3 = WSubId_69($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5024
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5025
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5026
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_68($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 5030
    ne $S1, 'S', __label_8
.annotate 'line', 5031
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 5032
    .return(self)
# }
.annotate 'line', 5033

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5036
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5037
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5038
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5039
    ne $S1, $S2, __label_3
.annotate 'line', 5040
    .return($S1)
  __label_3: # endif
.annotate 'line', 5041
    ne $S1, 'S', __label_4
.annotate 'line', 5042
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5044
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 5045

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5048
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5049
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5050
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5051
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5052
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 5053
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
.annotate 'line', 5054
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5055
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5056
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5057
    .return()
# }
  __label_3: # endif
.annotate 'line', 5062
    ne $S1, 'N', __label_7
# {
.annotate 'line', 5063
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5064
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5065
# rval: $S5
    null $S5
# switch
.annotate 'line', 5066
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5068
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5069
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5070
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5073
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5076
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5077
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 5079
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 5080
    self.'annotate'(__ARG_1)
.annotate 'line', 5081
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_12: # endif
.annotate 'line', 5083
    .return()
# }
  __label_7: # endif
.annotate 'line', 5086
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 5087
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_15
    $I3 = $P1.'isidentifier'()
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 5088
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 5089
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5092
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5093
    set $S3, $I1
# }
  __label_14: # endif
.annotate 'line', 5095
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P2.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 5096
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 5097
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_17
  __label_16: # else
# {
# switch
.annotate 'line', 5100
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_21
    set $S7, 'N'
    if $S6 == $S7 goto __label_22
    set $S7, 'I'
    if $S6 == $S7 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 5102
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5103
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 5106
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_23: # case
  __label_20: # default
.annotate 'line', 5110
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5111
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
.annotate 'line', 5112
# }
  __label_17: # endif
.annotate 'line', 5115
    self.'annotate'(__ARG_1)
.annotate 'line', 5116
    set $S6, __ARG_2
    ne $S6, '', __label_24
.annotate 'line', 5117
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_24: # endif
.annotate 'line', 5118
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 5119

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 5003
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
.annotate 'line', 5128
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5129

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 5132
    self.'optimizearg'()
.annotate 'line', 5133
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5134
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5135
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 5136
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5137
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5138
# var lval: $P3
    null $P3
.annotate 'line', 5139
# var rval: $P4
    null $P4
.annotate 'line', 5140
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 5141
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5142
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5143
    unless $I2 goto __label_7
.annotate 'line', 5144
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
.annotate 'line', 5147
    $P5 = WSubId_69($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 5148
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5149
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5150
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5151
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_68($P5, $P6, $N3)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 5155
    .return(self)
# }
.annotate 'line', 5156

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5159
    .return('N')
# }
.annotate 'line', 5160

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5163
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5164
# var aux: $P2
    null $P2
.annotate 'line', 5165
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5166
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 5167
    $P2 = self.'tempreg'('N')
.annotate 'line', 5168
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5169
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 5171
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5172
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5173
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 5174
    $P2 = self.'tempreg'('N')
.annotate 'line', 5175
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5176
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 5178
    self.'annotate'(__ARG_1)
.annotate 'line', 5179
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 5180

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5124
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
.annotate 'line', 5189
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5190

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5193
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5194
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5195
    self.'annotate'(__ARG_1)
.annotate 'line', 5196
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5197

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5200
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5201

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5185
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
.annotate 'line', 5210
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5211

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5214
    .return('I')
# }
.annotate 'line', 5215

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5218
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5219
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5220
    self.'annotate'(__ARG_1)
.annotate 'line', 5225
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5226

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5206
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
.annotate 'line', 5235
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5236

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5239
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
.annotate 'line', 5240
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5241
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5242
    self.'annotate'(__ARG_1)
.annotate 'line', 5243
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 5244

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5247
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5248

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5231
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
.annotate 'line', 5257
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5258

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5261
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
.annotate 'line', 5262
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5263
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5264
    self.'annotate'(__ARG_1)
.annotate 'line', 5265
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 5266

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5269
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5270

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5253
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5279
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5280

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5283
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 5284
# setname: $S1
    set $S1, ''
.annotate 'line', 5285
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 5286
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5288
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5291
    set $I2, 1
# switch
.annotate 'line', 5292
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
.annotate 'line', 5296
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5297
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5298
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5299
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5302
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 5307
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5310
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5313
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5308
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5311
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5314
    __ARG_1.'print'(' :named')
.annotate 'line', 5315
    eq $S1, '', __label_17
.annotate 'line', 5316
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5317
# }
.annotate 'line', 5319

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5275
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5328
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5329
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 5330

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5333
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5334
    .return(self)
# }
.annotate 'line', 5335

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 5338
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 5339

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5324
    addattribute $P0, 'arg'
.annotate 'line', 5325
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_70')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 5344
# var modifier: $P1
    null $P1
.annotate 'line', 5345
# var expr: $P2
    $P2 = WSubId_42(__ARG_1, __ARG_2)
.annotate 'line', 5346
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5347
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 5348
    $P3 = __ARG_1.'get'()
.annotate 'line', 5349
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 5350
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5353
    WSubId_45('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5356
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5357
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 5358

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_70 = "WSubId_70"
# Body
# {
.annotate 'line', 5369
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5370
    setattribute self, 'start', __ARG_2
.annotate 'line', 5371
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5372
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5373
    __ARG_3.'unget'($P1)
.annotate 'line', 5374
    $P3 = WSubId_41(__ARG_3, __ARG_1, WSubId_70, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5376

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5379
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5380
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5381

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5384
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5385

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5388
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5389
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5390

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5393
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5394
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5395

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 5398
    getattribute $P1, self, 'args'
    WSubId_43($P1)
.annotate 'line', 5399
    .return(self)
# }
.annotate 'line', 5400

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5403
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5404
    unless_null $P1, __label_1
# {
.annotate 'line', 5405
    new $P2, ['ResizableStringArray']
.annotate 'line', 5406
# var collect: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 5407
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P4, $P6
# {
.annotate 'line', 5408
# reg: $S1
    getattribute $P8, $P4, 'arg'
    $P7 = $P3.'add'($P8)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 5409
# builtin push
    push $P2, $S1
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5411
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5413
    .return($P1)
# }
.annotate 'line', 5414

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5417
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5418
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5420
# sep: $S1
    set $S1, ''
.annotate 'line', 5421
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5422
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5423
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5424
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5425
    if_null $P3, __label_4
.annotate 'line', 5426
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5427
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5422
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5429

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5362
    addattribute $P0, 'owner'
.annotate 'line', 5363
    addattribute $P0, 'start'
.annotate 'line', 5364
    addattribute $P0, 'args'
.annotate 'line', 5365
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_71')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5434
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5435
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5436
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5437
    .return(1)
# }
.annotate 'line', 5438

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5449
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5450
    setattribute self, 'builtin', __ARG_3
.annotate 'line', 5451
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5452

.end # CallBuiltinExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5455
    getattribute $P1, self, 'builtin'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5456

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5459
# var builtin: $P1
    getattribute $P1, self, 'builtin'
.annotate 'line', 5460
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5461
    new $P3, ['ResizableStringArray']
.annotate 'line', 5462
# var arg: $P4
    null $P4
# switch
.annotate 'line', 5463
    $P8 = $P1.'params'()
    set $I3, $P8
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5465
# var collectarglist: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P9, self, 'owner'
    $P5.'CollectValues'($P9, __ARG_1)
.annotate 'line', 5466
    if_null $P2, __label_6
    iter $P10, $P2
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P4, $P10
.annotate 'line', 5467
    getattribute $P12, $P4, 'arg'
    $P11 = $P5.'add'($P12)
# builtin push
    push $P3, $P11
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5470
# var rawargs: $P6
    root_new $P6, ['parrot';'ResizablePMCArray']
.annotate 'line', 5471
    if_null $P2, __label_8
    iter $P13, $P2
    set $P13, 0
  __label_7: # for iteration
    unless $P13 goto __label_8
    shift $P4, $P13
.annotate 'line', 5472
    getattribute $P14, $P4, 'arg'
# builtin push
    push $P6, $P14
    goto __label_7
  __label_8: # endfor
.annotate 'line', 5473
    getattribute $P15, self, 'builtin'
    getattribute $P16, self, 'start'
    $P15.'expand'(__ARG_1, self, $P16, __ARG_2, $P6)
.annotate 'line', 5474
    .return()
  __label_2: # default
.annotate 'line', 5476
# n: $I1
    getattribute $P17, self, 'args'
    set $I1, $P17
.annotate 'line', 5477
# var collectdefault: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P18, self, 'owner'
    $P7.'CollectValues'($P18, __ARG_1)
# for loop
.annotate 'line', 5478
# i: $I2
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
# {
.annotate 'line', 5479
    $P19 = $P2[$I2]
    getattribute $P4, $P19, 'arg'
.annotate 'line', 5480
# argtype: $S1
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
.annotate 'line', 5481
# paramtype: $S2
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
.annotate 'line', 5482
# argr: $S3
    null $S3
.annotate 'line', 5483
    $P8 = $P4.'isnull'()
    if_null $P8, __label_14
    unless $P8 goto __label_14
# {
# switch
.annotate 'line', 5484
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
.annotate 'line', 5488
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5489
    __ARG_1.'emitnull'($S3)
    goto __label_16 # break
  __label_17: # default
.annotate 'line', 5492
    $P11 = $P7.'add'($S3)
    set $S3, $P11
  __label_16: # switch end
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 5496
    iseq $I3, $S1, $S2
    if $I3 goto __label_24
    iseq $I3, $S2, '?'
  __label_24:
    if $I3 goto __label_23
.annotate 'line', 5497
    iseq $I3, $S2, 'p'
    unless $I3 goto __label_25
.annotate 'line', 5498
    iseq $I3, $S1, 'S'
    if $I3 goto __label_26
    iseq $I3, $S1, 'P'
  __label_26:
  __label_25:
  __label_23:
    unless $I3 goto __label_21
.annotate 'line', 5499
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
# {
.annotate 'line', 5501
    ne $S2, 'p', __label_27
.annotate 'line', 5502
    set $S2, 'P'
  __label_27: # endif
.annotate 'line', 5503
# aux: $S4
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P8, __label_28
    set $S4, $P8
  __label_28:
# switch
.annotate 'line', 5504
    set $S5, $S2
    set $S6, 'P'
    if $S5 == $S6 goto __label_31
    set $S6, 'I'
    if $S5 == $S6 goto __label_32
    set $S6, 'N'
    if $S5 == $S6 goto __label_33
    set $S6, 'S'
    if $S5 == $S6 goto __label_34
    goto __label_30
  __label_31: # case
# switch
.annotate 'line', 5506
    set $S7, $S1
    set $S8, 'I'
    if $S7 == $S8 goto __label_37
    set $S8, 'N'
    if $S7 == $S8 goto __label_38
    set $S8, 'S'
    if $S7 == $S8 goto __label_39
    goto __label_36
  __label_37: # case
  __label_38: # case
  __label_39: # case
.annotate 'line', 5510
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
.annotate 'line', 5511
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_35 # break
  __label_36: # default
.annotate 'line', 5514
    set $S3, $S4
  __label_35: # switch end
    goto __label_29 # break
  __label_32: # case
  __label_33: # case
  __label_34: # case
.annotate 'line', 5520
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5521
    __ARG_1.'emitset'($S3, $S4)
    goto __label_29 # break
  __label_30: # default
.annotate 'line', 5524
    set $S3, $S4
  __label_29: # switch end
# }
  __label_22: # endif
# }
  __label_15: # endif
.annotate 'line', 5528
# builtin push
    push $P3, $S3
# }
  __label_9: # for iteration
.annotate 'line', 5478
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_1: # switch end
.annotate 'line', 5531
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)
# }
.annotate 'line', 5532

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
.annotate 'line', 5442
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5444
    addattribute $P0, 'builtin'
.annotate 'line', 5445
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 5539
# callname: $S1
    $P6 = __ARG_3.'getname'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 5540
    __ARG_1.'use_builtin'($S1)
.annotate 'line', 5541
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P6 = __ARG_4.'numargs'()
    set $I1, $P6
  __label_2:
.annotate 'line', 5542
# var rawargs: $P1
    if $I1 goto __label_5
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
    goto __label_4
  __label_5:
    $P7 = __ARG_4.'getrawargs'()
    set $P1, $P7
  __label_4:
.annotate 'line', 5544
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5545
# var variant: $P3
    null $P3
.annotate 'line', 5546
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P4, $P8
# {
.annotate 'line', 5547
# vargs: $I2
    getattribute $P6, $P4, 'nparams'
    set $I2, $P6
.annotate 'line', 5548
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 5549
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 5550
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 5551
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5553
    unless_null $P3, __label_12
.annotate 'line', 5554
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5557
    $P6 = $P3.'iscompileevaluable'()
    if_null $P6, __label_13
    unless $P6 goto __label_13
# {
.annotate 'line', 5558
    $P7 = WSubId_71($P1)
    if_null $P7, __label_14
    unless $P7 goto __label_14
# {
.annotate 'line', 5559
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5560
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    .tailcall $P5($P6, $P7, $P1)
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5564
    new $P7, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P7.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P6, $P7
    .return($P6)
# }
.annotate 'line', 5565

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5574
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5575
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5576
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5577
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5578
    __ARG_1.'unget'($P1)
.annotate 'line', 5579
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5581

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5582
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_72 = "WSubId_72"
# Body
# {
.annotate 'line', 5585
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5586
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5587
    if_null $P2, __label_1
.annotate 'line', 5588
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5590
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5594
# var sym: $P3
    null $P3
.annotate 'line', 5595
# var subid: $P4
    null $P4
.annotate 'line', 5596
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5597
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5598
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5599
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5600
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5601
    isnull $I1, $P6
    if $I1 goto __label_7
    set $S1, $P6
    iseq $I1, $S1, ''
  __label_7:
    unless $I1 goto __label_6
# {
.annotate 'line', 5602
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5603
    $P1.'buildkey'($P7)
.annotate 'line', 5604
    $P3 = self.'scopesearch'($P7, 0)
.annotate 'line', 5605
    if_null $P3, __label_8
# {
.annotate 'line', 5606
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_9
# {
.annotate 'line', 5607
    $P9 = $P3.'ismulti'()
    isfalse $I2, $P9
    unless $I2 goto __label_10
# {
.annotate 'line', 5608
    $P4 = $P3.'makesubid'()
.annotate 'line', 5609
    self.'usesubid'($P4)
# }
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 5612
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_11
.annotate 'line', 5613
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_72($P9, $P10, $P3, $P2)
  __label_11: # endif
# }
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 5617
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5619
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_12
.annotate 'line', 5620
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_12: # endif
.annotate 'line', 5623
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_13
    unless $P9 goto __label_13
# {
.annotate 'line', 5624
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_14
# {
.annotate 'line', 5625
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P12 = $P1.'getName'()
    $P11[0] = $P12
    $P8 = self.'scopesearch'($P11, 0)
.annotate 'line', 5626
    isnull $I1, $P8
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
.annotate 'line', 5627
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_72($P9, $P10, $P8, $P2)
  __label_15: # endif
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5631
    setattribute self, 'funref', $P1
.annotate 'line', 5632
    setattribute self, 'args', $P2
.annotate 'line', 5633
    .return(self)
# }
.annotate 'line', 5634

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5637
    .return(1)
# }
.annotate 'line', 5638

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5641
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5642
# call: $S1
    null $S1
.annotate 'line', 5644
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5645
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5646
    ne $S1, '', __label_4
# {
.annotate 'line', 5647
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
# switch-case
.annotate 'line', 5649
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5652
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5655
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5650
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
# builtin join
    join $S1, "", $P3
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 5653
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5656
    WSubId_6("Builtin unexpeted here", self)
  __label_6: # default
.annotate 'line', 5658
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 3
    $P6[0] = "'"
    $P7 = $P1.'getName'()
    $P6[1] = $P7
    $P6[2] = "'"
# builtin join
    join $S1, "", $P6
  __label_5: # switch end
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5663
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5664
    .return($S1)
# }
.annotate 'line', 5665

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5668
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5669
    if_null $P1, __label_1
.annotate 'line', 5670
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5671

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5674
    __ARG_1.'print'('(')
.annotate 'line', 5675
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5676
    if_null $P1, __label_1
.annotate 'line', 5677
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5678
    __ARG_1.'say'(')')
# }
.annotate 'line', 5679

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5682
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5683
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5685
    self.'annotate'(__ARG_1)
.annotate 'line', 5687
    __ARG_1.'print'('    ')
.annotate 'line', 5688
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5689
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5690
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5692
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5695
    __ARG_1.'print'($S1)
.annotate 'line', 5696
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5697

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5567
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5569
    addattribute $P0, 'funref'
.annotate 'line', 5570
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
.annotate 'line', 5711
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5712
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5713
    setattribute self, 'args', __ARG_3
.annotate 'line', 5714
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5715
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5716

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 5719
    getattribute $P6, self, 'sym'
    if_null $P6, __label_1
# {
.annotate 'line', 5720
    getattribute $P7, self, 'subid'
    if_null $P7, __label_2
.annotate 'line', 5721
    getattribute $P8, self, 'subid'
    .return($P8)
  __label_2: # endif
.annotate 'line', 5722
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5723
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5724
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5726
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5728
# var first: $P3
    getattribute $P3, $P2, 'left'
  __label_5: # while
.annotate 'line', 5729
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_4
.annotate 'line', 5730
    getattribute $P3, $P3, 'left'
    goto __label_5
  __label_4: # endwhile
.annotate 'line', 5731
    $P6 = $P3.'isidentifier'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 5732
# check: $S1
    $P7 = $P3.'checkIdentifier'()
    null $S1
    if_null $P7, __label_7
    set $S1, $P7
  __label_7:
.annotate 'line', 5733
    isnull $I1, $S1
    if $I1 goto __label_9
    iseq $I1, $S1, ''
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 5737
    new $P4, ['ResizableStringArray']
.annotate 'line', 5738
    $P2.'buildkey'($P4)
.annotate 'line', 5739
# fun: $S2
    $P6 = $P4.'pop'()
    null $S2
    if_null $P6, __label_10
    set $S2, $P6
  __label_10:
.annotate 'line', 5740
# var reg: $P5
    $P5 = self.'tempreg'('P')
.annotate 'line', 5741
    self.'annotate'(__ARG_1)
.annotate 'line', 5742
    $P6 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'($P5, $S2, $P6)
.annotate 'line', 5743
    .return($P5)
# }
  __label_8: # endif
# }
  __label_6: # endif
.annotate 'line', 5746
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P2.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
.annotate 'line', 5747
    $P8 = $P2.'get_member'()
.annotate 'line', 5746
    $P6[2] = $P8
    $P6[3] = "'"
# builtin join
    join $S3, "", $P6
    .return($S3)
# }
.annotate 'line', 5748

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5705
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5707
    addattribute $P0, 'sym'
.annotate 'line', 5708
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5758
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5759
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5760
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5761

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5764
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5765
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5766
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5767
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5768
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5771
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5772
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5773
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5774

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5754
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
.annotate 'line', 5784
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5785
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5786

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5789
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5790
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5791
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5792
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5793
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5794
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5795
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5797
    .return($S2)
# }
.annotate 'line', 5798

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5779
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5781
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
.annotate 'line', 5807
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5808
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5809

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5810
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5813
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5814
    .return(self)
# }
.annotate 'line', 5815

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5818
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5819
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5820
    $P2 = $P1.'getName'()
# builtin push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5822
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5823
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# builtin push
    push __ARG_1, $P2
# }
.annotate 'line', 5824

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5827
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5828

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5831
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5832
    self.'annotate'(__ARG_1)
.annotate 'line', 5833
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5834

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5837
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5838
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5839
    .return($S1)
# }
.annotate 'line', 5840

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5843
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5844
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5845
    self.'annotate'(__ARG_1)
.annotate 'line', 5846
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5847

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5850
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5851

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5854
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5855
# value: $S2
    null $S2
.annotate 'line', 5856
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5858
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5859
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5860
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5862
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5865
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5866
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5868
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5869

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5872
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5873
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5874
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5875
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5877
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5878
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5879
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5881
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5883
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5884
    .return($S2)
# }
.annotate 'line', 5885

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5801
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5803
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
.annotate 'line', 5896
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5897
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5898

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5899
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5902
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5903
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5904
    .return(self)
# }
.annotate 'line', 5905

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 5908
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5909
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5910
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5911
    WSubId_45("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5912
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5913
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5914
    self.'annotate'(__ARG_1)
.annotate 'line', 5915
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5916
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5917
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5918

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 5921
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5922
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5923
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5924
    WSubId_45("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5925
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5926
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5927
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5928
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5930
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5932
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5933
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5934
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5938
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5939
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5940
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5943
    self.'annotate'(__ARG_1)
.annotate 'line', 5944
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5945
    .return($S3)
# }
.annotate 'line', 5946

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5891
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5893
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
.annotate 'line', 5957
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5958
    setattribute self, 'left', __ARG_3
.annotate 'line', 5959
    setattribute self, 'arg', __ARG_4
# }
.annotate 'line', 5960

.end # StringIndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5963
    .return('S')
# }
.annotate 'line', 5964

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5967
# lreg: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5968
# rreg: $S2
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5969
    set $S3, __ARG_2
    eq $S3, '', __label_3
# {
.annotate 'line', 5970
    self.'annotate'(__ARG_1)
.annotate 'line', 5971
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $S1, ', ', $S2, ', ', 1)
# }
  __label_3: # endif
# }
.annotate 'line', 5973

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 5951
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5953
    addattribute $P0, 'left'
.annotate 'line', 5954
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
.annotate 'line', 5987
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5988
    setattribute self, 'left', __ARG_4
.annotate 'line', 5989
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5990

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5993
    .return('P')
# }
.annotate 'line', 5994

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5997
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5998
    setattribute self, 'left', $P1
.annotate 'line', 5999
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 6000
    $P2.'optimizeargs'()
.annotate 'line', 6002
    $P5 = $P1.'checkresult'()
    set $S2, $P5
    ne $S2, 'S', __label_1
# {
.annotate 'line', 6003
    $P6 = $P2.'numargs'()
    set $I2, $P6
    eq $I2, 1, __label_2
.annotate 'line', 6004
    WSubId_1('Bad string index', self)
  __label_2: # endif
.annotate 'line', 6005
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6008
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_4
    $I2 = $P3.'isintegerliteral'()
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6009
# ival: $I1
    $P5 = $P3.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 6010
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 6011
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 6012
# builtin substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 6013
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
.annotate 'line', 6015
    new $P6, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'StringIndexExpr'($P7, $P8, $P1, $P3)
    set $P5, $P6
    .return($P5)
# }
  __label_1: # endif
.annotate 'line', 6018
    .return(self)
# }
.annotate 'line', 6019

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6022
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6023
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6024
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 6025
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6026
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 6027
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 6025
    setattribute self, 'regleft', $P3
.annotate 'line', 6028
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 6029

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6032
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 6033
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 6034
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6035
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6036
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6037
# builtin join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6038
    __ARG_1.'print'(']')
# }
.annotate 'line', 6039

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6042
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6043
    self.'annotate'(__ARG_1)
.annotate 'line', 6044
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6045
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6046
    __ARG_1.'say'('')
# }
.annotate 'line', 6047

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6050
# result: $S1
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6051
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6052
    .return($S1)
# }
.annotate 'line', 6053

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6056
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6057
    self.'annotate'(__ARG_1)
.annotate 'line', 6058
    __ARG_1.'print'('    ')
.annotate 'line', 6059
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6060
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 6061

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6064
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6065
# rreg: $S1
    null $S1
.annotate 'line', 6066
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 6067
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6068
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 6071
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6072
    self.'annotate'(__ARG_1)
.annotate 'line', 6073
    __ARG_1.'print'('    ')
.annotate 'line', 6074
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6075
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6076
    .return($S1)
# }
.annotate 'line', 6077

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5978
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5980
    addattribute $P0, 'left'
.annotate 'line', 5981
    addattribute $P0, 'regleft'
.annotate 'line', 5982
    addattribute $P0, 'args'
.annotate 'line', 5983
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 6088
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6089
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6090
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6091
    __ARG_1.'unget'($P1)
.annotate 'line', 6092
    $P3 = WSubId_41(__ARG_1, __ARG_2, WSubId_42, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6094

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6095
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 6098
    getattribute $P1, self, 'values'
    WSubId_43($P1)
.annotate 'line', 6099
    .return(self)
# }
.annotate 'line', 6100

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6103
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 6104
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 6105
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6111
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 6113

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6116
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6117
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6118
    .return($S1)
# }
.annotate 'line', 6119

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6122
    self.'annotate'(__ARG_1)
.annotate 'line', 6123
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6124
# size: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin elements
    elements $I1, $P1
  __label_1:
.annotate 'line', 6125
    eq __ARG_2, '', __label_3
# {
.annotate 'line', 6126
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6127
    le $I1, 0, __label_4
.annotate 'line', 6128
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 6130
# var collect: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P4, self, 'owner'
    $P2.'CollectValues'($P4, __ARG_1)
.annotate 'line', 6131
# i: $I2
    null $I2
.annotate 'line', 6132
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
# {
.annotate 'line', 6133
# valuereg: $S1
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6134
    eq __ARG_2, '', __label_8
# {
.annotate 'line', 6135
    self.'annotate'(__ARG_1)
.annotate 'line', 6136
    __ARG_1.'say'('    ', __ARG_2, "[", $I2, "] = ", $S1)
.annotate 'line', 6137
    inc $I2
# }
  __label_8: # endif
# }
    goto __label_5
  __label_6: # endfor
# }
.annotate 'line', 6140

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6082
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6084
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 6152
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6153
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6154
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6155
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6156
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 6157
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6158
# {
.annotate 'line', 6159
# var key: $P4
    $P4 = WSubId_42(__ARG_1, __ARG_2)
.annotate 'line', 6160
    WSubId_59(':', __ARG_1)
.annotate 'line', 6161
# var value: $P5
    $P5 = WSubId_42(__ARG_1, __ARG_2)
.annotate 'line', 6162
# builtin push
    push $P2, $P4
.annotate 'line', 6163
# builtin push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 6165
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6166
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6167
    WSubId_45("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 6169
    setattribute self, 'keys', $P2
.annotate 'line', 6170
    setattribute self, 'values', $P3
# }
.annotate 'line', 6171

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6172
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 6175
    getattribute $P1, self, 'keys'
    WSubId_43($P1)
.annotate 'line', 6176
    getattribute $P1, self, 'values'
    WSubId_43($P1)
.annotate 'line', 6177
    .return(self)
# }
.annotate 'line', 6178

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6181
    self.'annotate'(__ARG_1)
.annotate 'line', 6186
    set $S4, __ARG_2
    eq $S4, '', __label_1
.annotate 'line', 6187
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6189
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 6190
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 6191
# var collectvalues: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 6192
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 6193
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 6194
# var key: $P4
    $P4 = $P1[$I2]
.annotate 'line', 6195
# keyreg: $S1
    null $S1
.annotate 'line', 6196
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 6197
# id: $S2
    $P6 = $P4.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 6198
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6199
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 6202
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6204
# valuereg: $S3
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 6205
    set $S4, __ARG_2
    eq $S4, '', __label_9
.annotate 'line', 6206
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_9: # endif
# }
  __label_2: # for iteration
.annotate 'line', 6193
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 6208

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6211
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6212
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6213
    .return($S1)
# }
.annotate 'line', 6214

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6145
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6147
    addattribute $P0, 'keys'
.annotate 'line', 6148
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6227
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6232
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 6233

.end # parseinitializer


.sub 'numargs' :method
# Body
# {
.annotate 'line', 6236
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6237
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
.annotate 'line', 6238

.end # numargs


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 6241
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6242
    if_null $P1, __label_1
.annotate 'line', 6243
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 6244

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6247
    self.'optimize_initializer'()
.annotate 'line', 6248
    .return(self)
# }
.annotate 'line', 6249

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6252
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6253
    if_null $P1, __label_1
.annotate 'line', 6254
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6255
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6256
    if_null $P1, __label_2
.annotate 'line', 6257
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6258
    __ARG_1.'say'(")")
# }
.annotate 'line', 6259

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6219
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6221
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
.annotate 'line', 6270
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6272
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 6273
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6274
    setattribute self, 'value', __ARG_4
.annotate 'line', 6275
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6277
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6278
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6280
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 6281

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6284
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 6285
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 6288
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6289
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_3
    $I1 = $P2.'isconst'()
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 6290
    $P1 = $P2.'getvalue'()
.annotate 'line', 6291
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 6292
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 6293
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 6296
    self.'optimize_initializer'()
.annotate 'line', 6297
    .return(self)
# }
.annotate 'line', 6298

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6301
    self.'annotate'(__ARG_1)
.annotate 'line', 6303
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6304
# var value: $P2
    getattribute $P2, self, 'value'
.annotate 'line', 6305
# numinits: $I1
    $P8 = self.'numargs'()
    set $I1, $P8
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 6308
# type: $I2
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6309
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6311
# reginit: $S1
    set $S1, ''
.annotate 'line', 6312
# regnew: $S2
    set $P8, __ARG_2
    null $S2
    if_null $P8, __label_5
    set $S2, $P8
  __label_5:
.annotate 'line', 6313
# constructor: $S3
    null $S3
# switch
.annotate 'line', 6314
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
.annotate 'line', 6319
    ne $I2, 1, __label_11
# {
.annotate 'line', 6320
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 6321
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 6324
# var initval: $P3
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 6325
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 6326
    concat $S5, ', ', $S1
    set $S1, $S5
# }
  __label_12: # endif
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 6330
    eq $I2, 1, __label_14
.annotate 'line', 6331
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_14: # endif
.annotate 'line', 6332
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 6333
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
  __label_6: # switch end
.annotate 'line', 6336
    ne $S2, '', __label_16
.annotate 'line', 6337
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_16: # endif
# switch
.annotate 'line', 6339
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
  __label_19: # case
.annotate 'line', 6342
# name: $S4
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_21
    set $S4, $P8
  __label_21:
.annotate 'line', 6343
# var aux: $P4
# builtin get_class
    get_class $P4, $S4
.annotate 'line', 6344
    isnull $I5, $P4
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
  __label_23:
    unless $I5 goto __label_22
.annotate 'line', 6345
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    WSubId_73($S5, $P2)
  __label_22: # endif
.annotate 'line', 6349
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 6350
    le $I1, 1, __label_24
# {
.annotate 'line', 6351
    __ARG_1.'say'($S2, ".'", $P2, "'()")
# }
  __label_24: # endif
    goto __label_17 # break
  __label_20: # case
.annotate 'line', 6355
# var id: $P5
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 6356
    unless_null $P5, __label_25
# {
.annotate 'line', 6357
# var cl: $P6
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 6358
    if_null $P6, __label_27
# {
.annotate 'line', 6359
# var key: $P7
    $P7 = $P6.'getpath'()
.annotate 'line', 6360
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
# }
    goto __label_28
  __label_27: # else
# {
.annotate 'line', 6363
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 6364
    if_null $P5, __label_29
.annotate 'line', 6365
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_30
  __label_29: # else
# {
.annotate 'line', 6367
    $P9 = self.'dowarnings'()
    if_null $P9, __label_31
    unless $P9 goto __label_31
.annotate 'line', 6368
    WSubId_73('Checking: new unknown type')
  __label_31: # endif
.annotate 'line', 6369
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
# }
  __label_30: # endif
# }
  __label_28: # endif
.annotate 'line', 6372
    set $S3, $P2
# }
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 6376
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
# }
  __label_26: # endif
    goto __label_17 # break
  __label_18: # default
.annotate 'line', 6380
    WSubId_6('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 6382
    isgt $I3, $I1, 1
    if $I3 goto __label_33
    isge $I3, $I1, 0
    unless $I3 goto __label_34
    iseq $I3, $I2, 1
  __label_34:
  __label_33:
    unless $I3 goto __label_32
# {
.annotate 'line', 6383
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6384
    not $I3, __ARG_3
    unless $I3 goto __label_36
    set $S5, __ARG_2
    isne $I3, $S5, ''
  __label_36:
    unless $I3 goto __label_35
.annotate 'line', 6385
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_35: # endif
# }
  __label_32: # endif
# }
.annotate 'line', 6387

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6390
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6391

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6264
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6266
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6402
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6403
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6404
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6405
    setattribute self, 'nskey', $P1
.annotate 'line', 6406
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6407
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6408
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6410
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6411

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6414
# reginit: $S1
    null $S1
# switch
.annotate 'line', 6415
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
.annotate 'line', 6420
# var initval: $P1
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6421
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6424
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_1: # switch end
.annotate 'line', 6426
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6428
    set $S2, __ARG_2
    ne $S2, '', __label_6
.annotate 'line', 6429
    __ARG_2 = self.'tempreg'('P')
  __label_6: # endif
.annotate 'line', 6431
    __ARG_1.'print'('    ')
.annotate 'line', 6432
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 6433
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6434
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6435
    null $P3
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6436
    if_null $S1, __label_8
.annotate 'line', 6437
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6438
    __ARG_1.'say'()
# }
.annotate 'line', 6439

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6396
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6398
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6450
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6451
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6452
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6453
    setattribute self, 'nskey', $P1
.annotate 'line', 6454
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6455
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6456
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6458
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6459

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6462
# numinits: $I1
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6463
# regnew: $S1
    set $P2, __ARG_2
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 6464
    le $I1, 0, __label_2
.annotate 'line', 6465
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6466
# var nskey: $P1
    getattribute $P1, self, 'nskey'
.annotate 'line', 6468
    ne $S1, '', __label_3
.annotate 'line', 6469
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_3: # endif
.annotate 'line', 6471
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 6473
    lt $I1, 0, __label_4
# {
.annotate 'line', 6474
# constructor: $S2
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 6475
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6476
    set $S3, __ARG_2
    eq $S3, '', __label_6
.annotate 'line', 6477
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_6: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 6479

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6444
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6446
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6486
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6489
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6493
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6496
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6491
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6492
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6491
    .return($P3)
  __label_4: # case
.annotate 'line', 6495
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6499
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6500
    __ARG_1.'unget'($P2)
.annotate 'line', 6501
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6503
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6508
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6510

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 6521
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6522
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6523
    $P2 = WSubId_67(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6524

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6527
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6528
    .return(self)
# }
.annotate 'line', 6529

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6530
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6533
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6534
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6535
    eq $S1, 'P', __label_2
.annotate 'line', 6536
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6537
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6539
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
.annotate 'line', 6540
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6541
    self.'annotate'(__ARG_1)
.annotate 'line', 6542
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6543
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6544
    __ARG_1.'say'()
# }
.annotate 'line', 6545

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6514
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6516
    addattribute $P0, 'lexpr'
.annotate 'line', 6517
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
.annotate 'line', 6558
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6559
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6560
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6561
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6562
    .return(self)
# }
.annotate 'line', 6563

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6566
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6567
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6569
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6571
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6573
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6574
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6575
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6577

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6580
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6581
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6582
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6584
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6585

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6588
# cond_end: $S1
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 6589
# cond_false: $S2
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 6590
    getattribute $P4, self, 'condition'
    $P4.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6591
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6592
# tres: $S3
    $P4 = self.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
.annotate 'line', 6593
    $P4 = $P1.'isnull'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6594
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6596
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6597
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6598
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6599
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6600
    $P4 = $P2.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 6601
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6603
# tfalse: $S4
    $P5 = $P2.'checkresult'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
  __label_8:
.annotate 'line', 6604
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6605
# r: $S5
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 6606
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 6610
    ne $S4, 'P', __label_13
# {
.annotate 'line', 6611
# var aux: $P3
    $P3 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 6612
    __ARG_1.'emitset'(__ARG_2, $P3)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 6615
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
# }
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6618
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6619

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6550
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6552
    addattribute $P0, 'condition'
.annotate 'line', 6553
    addattribute $P0, 'etrue'
.annotate 'line', 6554
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

.sub 'getOpCode_2' :subid('WSubId_76')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6664
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
.annotate 'line', 6665
    .return(1)
  __label_4: # case
.annotate 'line', 6666
    .return(2)
  __label_5: # case
.annotate 'line', 6667
    .return(3)
  __label_2: # default
.annotate 'line', 6668
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6670

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6674
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
.annotate 'line', 6675
    .return(8)
  __label_4: # case
.annotate 'line', 6676
    .return(11)
  __label_5: # case
.annotate 'line', 6677
    .return(33)
  __label_6: # case
.annotate 'line', 6678
    .return(9)
  __label_7: # case
.annotate 'line', 6679
    .return(10)
  __label_2: # default
.annotate 'line', 6681
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(31)
    goto __label_9
  __label_8: # else
.annotate 'line', 6682
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(32)
    goto __label_11
  __label_10: # else
.annotate 'line', 6683
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_1: # switch end
# }
.annotate 'line', 6685

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_81')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6689
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
.annotate 'line', 6690
    .return(19)
  __label_4: # case
.annotate 'line', 6691
    .return(20)
  __label_5: # case
.annotate 'line', 6692
    .return(21)
  __label_6: # case
.annotate 'line', 6693
    .return(22)
  __label_2: # default
.annotate 'line', 6694
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6696

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_84')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6700
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6701
    .return(28)
  __label_4: # case
.annotate 'line', 6702
    .return(29)
  __label_2: # default
.annotate 'line', 6703
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6705

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_86')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6709
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
.annotate 'line', 6710
    .return(14)
  __label_4: # case
.annotate 'line', 6711
    .return(16)
  __label_5: # case
.annotate 'line', 6712
    .return(15)
  __label_6: # case
.annotate 'line', 6713
    .return(17)
  __label_2: # default
.annotate 'line', 6715
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6716
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6718

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_88')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6722
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
.annotate 'line', 6723
    .return(12)
  __label_4: # case
.annotate 'line', 6724
    .return(13)
  __label_5: # case
.annotate 'line', 6725
    .return(25)
  __label_6: # case
.annotate 'line', 6726
    .return(26)
  __label_2: # default
.annotate 'line', 6727
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6729

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_97')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6733
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
.annotate 'line', 6734
    .return(4)
  __label_4: # case
.annotate 'line', 6735
    .return(5)
  __label_5: # case
.annotate 'line', 6736
    .return(6)
  __label_6: # case
.annotate 'line', 6737
    .return(18)
  __label_7: # case
.annotate 'line', 6738
    .return(23)
  __label_8: # case
.annotate 'line', 6739
    .return(24)
  __label_9: # case
.annotate 'line', 6740
    .return(30)
  __label_2: # default
.annotate 'line', 6741
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6743

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 6747
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6748
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6751
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6755
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6757
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6759
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6761
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6763
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6765
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6767
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6769
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6771
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 6773
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 6752
    $P2 = WSubId_42(__ARG_1, __ARG_2)
.annotate 'line', 6753
    WSubId_59(')', __ARG_1)
.annotate 'line', 6754
    .return($P2)
  __label_4: # case
.annotate 'line', 6756
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6758
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6760
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6762
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6764
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6766
    .tailcall WSubId_74(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6768
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6770
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6772
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 6774
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 6776
    WSubId_45('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6778

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_76 = "WSubId_76"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6782
# var subexp: $P1
    $P1 = WSubId_75(__ARG_1, __ARG_2)
.annotate 'line', 6783
# var t: $P2
    null $P2
.annotate 'line', 6784
# var start: $P3
    null $P3
.annotate 'line', 6785
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6786
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_76($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6787
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6789
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6792
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6795
    set $P3, $P2
.annotate 'line', 6796
    $P2 = __ARG_1.'get'()
.annotate 'line', 6797
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6798
# var right: $P4
    $P4 = WSubId_75(__ARG_1, __ARG_2)
.annotate 'line', 6799
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6802
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6805
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6808
    __ARG_1.'unget'($P2)
.annotate 'line', 6809
    .return($P1)
# }
.annotate 'line', 6810

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
# Body
# {
.annotate 'line', 6814
# var subexp: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6815
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6817
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6819
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6818
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6820
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6822
    __ARG_1.'unget'($P2)
.annotate 'line', 6823
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6825

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_80 = "WSubId_80"
# Body
# {
.annotate 'line', 6829
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6830
# code: $I1
    $P3 = WSubId_78($P1)
    set $I1, $P3
.annotate 'line', 6831
    unless $I1 goto __label_1
# {
.annotate 'line', 6832
# var subexpr: $P2
    $P2 = WSubId_79(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6833
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
.annotate 'line', 6835
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6837
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6839
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6841
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6843
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6845
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6847
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_4: # default
.annotate 'line', 6849
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6853
    __ARG_1.'unget'($P1)
.annotate 'line', 6854
    .tailcall WSubId_80(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6856

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6860
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6861
# var t: $P2
    null $P2
.annotate 'line', 6862
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6863
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_81($P2)
    set $I1, $P4
    unless $I1 goto __label_1
# {
.annotate 'line', 6864
# var rexpr: $P3
    $P3 = WSubId_79(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6865
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
.annotate 'line', 6867
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6870
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6873
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6876
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6879
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6882
    __ARG_1.'unget'($P2)
.annotate 'line', 6883
    .return($P1)
# }
.annotate 'line', 6884

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_82 = "WSubId_82"
# Body
# {
.annotate 'line', 6888
# var lexpr: $P1
    $P1 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6889
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6890
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6891
# var rexpr: $P3
    $P3 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6892
# var expr: $P4
    null $P4
.annotate 'line', 6893
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6894
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6896
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6897
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6899
    __ARG_1.'unget'($P2)
.annotate 'line', 6900
    .return($P1)
# }
.annotate 'line', 6901

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6905
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6906
# var rexpr: $P2
    null $P2
.annotate 'line', 6907
# var t: $P3
    null $P3
.annotate 'line', 6908
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6909
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_84($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6910
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6912
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6913
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6916
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6917
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6920
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6923
    __ARG_1.'unget'($P3)
.annotate 'line', 6924
    .return($P1)
# }
.annotate 'line', 6925

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6929
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6930
# var rexpr: $P2
    null $P2
.annotate 'line', 6931
# var t: $P3
    null $P3
.annotate 'line', 6932
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6933
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_86($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6934
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
.annotate 'line', 6936
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6937
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6940
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6941
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6944
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6945
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6948
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6949
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6952
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6955
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6958
    __ARG_1.'unget'($P3)
.annotate 'line', 6959
    .return($P1)
# }
.annotate 'line', 6960

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6964
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6965
# var rexpr: $P2
    null $P2
.annotate 'line', 6966
# var t: $P3
    null $P3
.annotate 'line', 6967
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6968
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_88($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6969
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
.annotate 'line', 6971
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6972
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6975
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6976
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6979
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6980
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6983
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6984
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6987
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6990
    __ARG_1.'unget'($P3)
.annotate 'line', 6991
    .return($P1)
# }
.annotate 'line', 6992

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6996
# var lexpr: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6997
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6998
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6999
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7000
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
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

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
# Body
# {
.annotate 'line', 7008
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 7009
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7010
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7011
# var rexpr: $P3
    $P3 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 7012
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7014
    __ARG_1.'unget'($P2)
.annotate 'line', 7015
    .return($P1)
# }
.annotate 'line', 7016

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
# Body
# {
.annotate 'line', 7020
# var lexpr: $P1
    $P1 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7021
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7022
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7023
# var rexpr: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7024
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7026
    __ARG_1.'unget'($P2)
.annotate 'line', 7027
    .return($P1)
# }
.annotate 'line', 7028

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
# Body
# {
.annotate 'line', 7032
# var lexpr: $P1
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7033
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7034
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7035
# var rexpr: $P3
    $P3 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7036
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7038
    __ARG_1.'unget'($P2)
.annotate 'line', 7039
    .return($P1)
# }
.annotate 'line', 7040

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_94')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_92 = "WSubId_92"
# Body
# {
.annotate 'line', 7044
# var lexpr: $P1
    $P1 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7045
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7046
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7047
# var rexpr: $P3
    $P3 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7048
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7050
    __ARG_1.'unget'($P2)
.annotate 'line', 7051
    .return($P1)
# }
.annotate 'line', 7052

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7056
# var econd: $P1
    $P1 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 7057
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 7058
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 7059
# var etrue: $P3
    $P3 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7060
    WSubId_59(':', __ARG_1)
.annotate 'line', 7061
# var efalse: $P4
    $P4 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7062
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7065
    __ARG_1.'unget'($P2)
.annotate 'line', 7066
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7068

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7072
# var lexpr: $P1
    $P1 = WSubId_96(__ARG_1, __ARG_2)
.annotate 'line', 7073
# var t: $P2
    null $P2
.annotate 'line', 7074
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 7075
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_97($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
.annotate 'line', 7076
# var rexpr: $P3
    $P3 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7077
# var expr: $P4
    null $P4
# switch
.annotate 'line', 7078
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
.annotate 'line', 7080
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7083
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7086
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7089
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7092
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 7095
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 7098
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7101
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 7103
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7104
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7106
    __ARG_1.'unget'($P2)
.annotate 'line', 7107
    .return($P1)
# }
.annotate 'line', 7108

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 7112
    .tailcall WSubId_95(__ARG_1, __ARG_2)
# }
.annotate 'line', 7113

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7128
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7129
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7130
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7131
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7132
    .return($S1)
# }
.annotate 'line', 7133

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7136
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7137
    unless_null $P1, __label_1
.annotate 'line', 7138
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7139
    .return($P1)
# }
.annotate 'line', 7140

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7124
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7149
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7150
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7151
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7152
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7153
    .return($S1)
# }
.annotate 'line', 7154

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7157
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7158
    unless_null $P1, __label_1
.annotate 'line', 7159
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7160
    .return($P1)
# }
.annotate 'line', 7161

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7143
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7145
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7177
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7178
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7179
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7180
    __ARG_2.'unget'($P1)
.annotate 'line', 7181
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 7183

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7186
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7187
    if_null $P1, __label_1
.annotate 'line', 7188
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7189
    .return(self)
# }
.annotate 'line', 7190

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7194
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7195
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7198
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 7199
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7200
    $I2 = $P2.'cantailcall'()
    unless $I2 goto __label_6
    getattribute $P3, self, 'owner'
    $I2 = $P3.'allowtailcall'()
  __label_6:
    unless $I2 goto __label_5
# {
.annotate 'line', 7201
    self.'annotate'(__ARG_1)
.annotate 'line', 7202
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 7206
    le $I1, 0, __label_7
.annotate 'line', 7207
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7209
    self.'annotate'(__ARG_1)
.annotate 'line', 7210
    self.'emitret'(__ARG_1)
.annotate 'line', 7211
    le $I1, 0, __label_8
.annotate 'line', 7212
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 7213
    __ARG_1.'say'(')')
# }
.annotate 'line', 7214

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7171
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7173
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7221
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7222

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7225
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 7226

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7217
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
.annotate 'line', 7233
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7234

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7237
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 7238

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7229
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7251
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7252
    setattribute self, 'name', __ARG_1
.annotate 'line', 7253
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 7254

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7255
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7258
    self.'annotate'(__ARG_1)
.annotate 'line', 7259
    getattribute $P1, self, 'value'
# builtin string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 7260

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7245
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7247
    addattribute $P0, 'name'
.annotate 'line', 7248
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7274
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7275
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 7276

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7277
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7280
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7281
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7282
    .return($S2)
# }
.annotate 'line', 7283

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7269
    addattribute $P0, 'owner'
.annotate 'line', 7270
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7296
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7297
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7298
    WSubId_98($P1)
.annotate 'line', 7299
    setattribute self, 'label', $P1
.annotate 'line', 7300
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 7301

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7302
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7305
    self.'annotate'(__ARG_1)
.annotate 'line', 7306
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7307
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7308
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 7309

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7290
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7292
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7320
    $P1 = WSubId_42(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 7321

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7324
    WSubId_59('(', __ARG_1)
.annotate 'line', 7325
    $P1 = WSubId_42(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7326
    WSubId_59(')', __ARG_1)
# }
.annotate 'line', 7327

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7316
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
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7340
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7341
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7342
    $P3 = WSubId_99(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7343
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7344
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7345
    $P4 = WSubId_99(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7347
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7348
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7350

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7353
    self.'optimize_condition'()
.annotate 'line', 7354
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7355
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 7356
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7358
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7360
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7362
    .return(self)
# }
.annotate 'line', 7363

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7366
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7367
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7368
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7369
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7370
# elselabel: $S1
    set $S1, ''
.annotate 'line', 7371
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7372
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7373
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7374
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7375
    self.'annotate'(__ARG_1)
.annotate 'line', 7376
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7377
    $P1.'emit'(__ARG_1)
.annotate 'line', 7379
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7380
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7381
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7382
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7384
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7385

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7334
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7336
    addattribute $P0, 'truebranch'
.annotate 'line', 7337
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7397
    $P2 = WSubId_99(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7398

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7401
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7402
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7404
    self.'annotate'(__ARG_1)
.annotate 'line', 7405
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7406
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7407
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7408
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7409

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7392
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7394
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7420
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7421
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7422
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7423

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7426
    self.'optimize_condition'()
.annotate 'line', 7427
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7428
    .return(self)
# }
.annotate 'line', 7429

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7432
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7434
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7437
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7440
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7441
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7443
    self.'annotate'(__ARG_1)
.annotate 'line', 7444
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7445
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7446
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7447
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7448
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7450

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7416
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
.const 'Sub' WSubId_100 = "WSubId_100"
# Body
# {
.annotate 'line', 7461
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7462
    self.'parsebody'(__ARG_2)
.annotate 'line', 7463
    WSubId_100('while', __ARG_2)
.annotate 'line', 7464
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7465

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7468
    self.'optimize_condition'()
.annotate 'line', 7469
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7470
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7471
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7472
    setattribute self, 'body', $P1
.annotate 'line', 7473
    .return(self)
# }
.annotate 'line', 7474

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7477
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7478
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7479
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7481
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7484
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7485
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7486
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7488
    self.'annotate'(__ARG_1)
.annotate 'line', 7489
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7491
    $P1.'emit'(__ARG_1)
.annotate 'line', 7492
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7493
    eq $I1, 2, __label_7
.annotate 'line', 7494
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7495
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7497

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7457
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
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7508
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7509
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 7510

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7511
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7514
    self.'annotate'(__ARG_1)
.annotate 'line', 7515
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7516
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7517

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7504
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7528
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7529
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 7530

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7531
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7534
    self.'annotate'(__ARG_1)
.annotate 'line', 7535
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7536
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7537

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7524
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7552
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7553
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7554
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7555
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7556

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7559
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7560
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7561
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7562
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_42(__ARG_1, self)
# builtin push
    push $P4, $P5
.annotate 'line', 7563
    $P1 = __ARG_1.'get'()
.annotate 'line', 7564
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7565
    WSubId_45("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7566
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7567
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
.annotate 'line', 7568
    __ARG_1.'unget'($P1)
.annotate 'line', 7569
    $P3 = WSubId_99(__ARG_1, self)
# builtin push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7571
    getattribute $P3, self, 'case_st'
# builtin push
    push $P3, $P2
.annotate 'line', 7572
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7575
    $P1 = __ARG_1.'get'()
.annotate 'line', 7576
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7577
    WSubId_45("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7578
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
.annotate 'line', 7579
    __ARG_1.'unget'($P1)
.annotate 'line', 7580
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_99(__ARG_1, self)
# builtin push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7582
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7585
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7586
    WSubId_45("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7587

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 7590
    getattribute $P2, self, 'case_value'
    WSubId_43($P2)
.annotate 'line', 7591
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7592
    WSubId_43($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7593
    getattribute $P2, self, 'default_st'
    WSubId_43($P2)
# }
.annotate 'line', 7594

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7544
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7546
    addattribute $P0, 'case_value'
.annotate 'line', 7547
    addattribute $P0, 'case_st'
.annotate 'line', 7548
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 7607
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7608
    $P3 = WSubId_42(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7609
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7610
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7611
    WSubId_45("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7612
    $P1 = __ARG_2.'get'()
.annotate 'line', 7613
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7614
    WSubId_45("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7615
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7616

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7619
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7620
    self.'optimize_cases'()
.annotate 'line', 7621
    .return(self)
# }
.annotate 'line', 7622

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7626
# type: $S1
    set $S1, ''
.annotate 'line', 7627
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7628
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7629
    ne $S2, 'N', __label_4
.annotate 'line', 7630
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7631
    ne $S1, '', __label_5
.annotate 'line', 7632
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7633
    eq $S1, $S2, __label_7
.annotate 'line', 7634
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7637
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7638
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7642
    ne $S1, '', __label_8
.annotate 'line', 7643
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7645
    __ARG_1.'comment'('switch')
.annotate 'line', 7646
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7647
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7648
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7650
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7651
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7655
    self.'genbreaklabel'()
.annotate 'line', 7656
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7657
    new $P4, ['ResizableStringArray']
.annotate 'line', 7658
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7659
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7660
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7661
# builtin push
    push $P4, $S7
.annotate 'line', 7662
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7663
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7665
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7668
    self.'annotate'(__ARG_1)
.annotate 'line', 7669
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7670
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7671
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7672
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7673
    $P7 = $P6[$I2]
    WSubId_57(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7671
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7676
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7677
    getattribute $P7, self, 'default_st'
    WSubId_57(__ARG_1, $P7)
.annotate 'line', 7679
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7680

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7601
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7603
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7692
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7693
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7694

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7697
    self.'optimize_cases'()
.annotate 'line', 7698
    .return(self)
# }
.annotate 'line', 7699

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7703
    self.'genbreaklabel'()
.annotate 'line', 7704
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7705
    new $P1, ['ResizableStringArray']
.annotate 'line', 7707
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7708
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7709
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7710
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7711
# builtin push
    push $P1, $S3
.annotate 'line', 7712
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7713
    __ARG_1.'emitif'($S2, $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7715
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7718
    self.'annotate'(__ARG_1)
.annotate 'line', 7719
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7720
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7721
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7722
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7723
    $P4 = $P3[$I2]
    WSubId_57(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7721
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7726
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7727
    getattribute $P4, self, 'default_st'
    WSubId_57(__ARG_1, $P4)
.annotate 'line', 7729
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7730

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7687
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 7737
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7738
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7739
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7740
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7741
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7742
    WSubId_45("'(' in switch", $P1)
# }
.annotate 'line', 7743

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7756
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7757
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7758
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7759
    __ARG_2.'unget'($P1)
.annotate 'line', 7760
    $P3 = WSubId_99(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7762
    $P1 = __ARG_2.'get'()
.annotate 'line', 7763
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7764
    __ARG_2.'unget'($P1)
.annotate 'line', 7765
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7766
    WSubId_59(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7768
    $P1 = __ARG_2.'get'()
.annotate 'line', 7769
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7770
    __ARG_2.'unget'($P1)
.annotate 'line', 7771
    $P3 = WSubId_42(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7772
    WSubId_59(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7774
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7775

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7778
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7779
    if_null $P1, __label_1
.annotate 'line', 7780
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7781
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7782
    self.'optimize_condition'()
.annotate 'line', 7783
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7784
    if_null $P1, __label_4
.annotate 'line', 7785
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7787
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7790
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7791
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7792
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7793
    .return(self)
# }
.annotate 'line', 7794

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7797
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7798
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7799
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7800
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7801
    .return()
# }
  __label_1: # endif
.annotate 'line', 7803
    __ARG_1.'comment'('for loop')
.annotate 'line', 7804
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7805
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7806
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7807
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7808
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7810
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7811
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7812
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7814
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7815
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7816
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7817
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7818
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7820
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7821

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7749
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7751
    addattribute $P0, 'initializer'
.annotate 'line', 7752
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7836
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7837
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7838
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7839
# deftype: $S2
    $P1 = WSubId_101(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7840
    self.'createvar'($S1, $S2)
.annotate 'line', 7841
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7843
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7844
    $P2 = WSubId_42(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7845
    WSubId_59(')', __ARG_2)
.annotate 'line', 7846
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7847

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7850
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7854
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7855
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7856
    $P2 = $P1.'get_value'()
    set $S1, $P2
# builtin length
    length $I2, $S1
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7857
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7859
    setattribute self, 'container', $P1
.annotate 'line', 7860
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7861
    .return(self)
# }
.annotate 'line', 7862

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 7865
    self.'annotate'(__ARG_1)
.annotate 'line', 7866
# regcont: $S1
    null $S1
.annotate 'line', 7867
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7868
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7869
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7870
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7873
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7875
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7876
    unless_null $P1, __label_4
.annotate 'line', 7877
    getattribute $P2, self, 'varname'
    WSubId_66($P2)
  __label_4: # endif
.annotate 'line', 7879
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7880
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7881
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7882
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7883
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7884
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7885
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7886
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7887
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7888
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7889
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7890
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7891

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7828
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7830
    addattribute $P0, 'deftype'
.annotate 'line', 7831
    addattribute $P0, 'varname'
.annotate 'line', 7832
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7898
    WSubId_59('(', __ARG_2)
.annotate 'line', 7899
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7900
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7901
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7902
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7904
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7905
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7906
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7907
    __ARG_2.'unget'($P3)
.annotate 'line', 7908
    __ARG_2.'unget'($P2)
.annotate 'line', 7909
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7911
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7912

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7924
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7925
    $P2 = WSubId_42(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7926

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7929
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7930
    .return(self)
# }
.annotate 'line', 7931

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7934
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7935
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7936
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7937
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7939
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7942
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7945
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7947

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7918
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7920
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7959
    setattribute self, 'start', __ARG_1
.annotate 'line', 7960
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7961

.end # TryModifierList


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 7964
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 7965

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7968
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7969
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7970
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7971
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7972
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
.annotate 'line', 7975
    eq $I1, 1, __label_11
.annotate 'line', 7976
    WSubId_1('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 7977
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7978
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_12
    set $S2, $P7
  __label_12:
.annotate 'line', 7979
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7983
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7984
# i: $I2
    null $I2
  __label_15: # for condition
    ge $I2, $I1, __label_14
# {
.annotate 'line', 7985
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7986
    $P7 = $P5.'emit_get'(__ARG_1)
# builtin push
    push $P4, $P7
# }
  __label_13: # for iteration
.annotate 'line', 7984
    inc $I2
    goto __label_15
  __label_14: # for end
.annotate 'line', 7989
# builtin join
    join $S3, ', ', $P4
.annotate 'line', 7988
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_10: # case
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7994
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    WSubId_1($S4, $P7)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7997

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7954
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7956
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 8009
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8010
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8011
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8012
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8014
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8016
    $P3 = WSubId_99(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 8017
    $P1 = __ARG_2.'get'()
.annotate 'line', 8018
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 8019
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 8020
    $P1 = __ARG_2.'get'()
.annotate 'line', 8021
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8022
    WSubId_45("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 8023
    $P1 = __ARG_2.'get'()
.annotate 'line', 8024
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 8025
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8026
    setattribute self, 'exname', $P1
.annotate 'line', 8027
    self.'createvar'($S1, 'P')
.annotate 'line', 8028
    $P1 = __ARG_2.'get'()
.annotate 'line', 8029
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 8030
    WSubId_45("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 8032
    $P3 = WSubId_99(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 8033

.end # TryStatement


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8036
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8037
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8039
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 8040

.end # allowtailcall


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8043
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8044
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 8045
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 8046
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 8047
    .return(self)
# }
.annotate 'line', 8048

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8051
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8052
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8053
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 8054
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 8055
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 8056
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 8058
    self.'annotate'(__ARG_1)
.annotate 'line', 8059
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 8061
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 8062
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 8064
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 8065
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 8067
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 8068
    __ARG_1.'comment'('try: begin')
.annotate 'line', 8069
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8070
    __ARG_1.'comment'('try: end')
.annotate 'line', 8071
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8073
    self.'annotate'(__ARG_1)
.annotate 'line', 8074
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8076
    __ARG_1.'comment'('catch')
.annotate 'line', 8077
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 8078
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 8079
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 8080
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8081
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8083
    __ARG_1.'comment'('catch end')
.annotate 'line', 8084
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 8085

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 8000
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8002
    addattribute $P0, 'stry'
.annotate 'line', 8003
    addattribute $P0, 'modifiers'
.annotate 'line', 8004
    addattribute $P0, 'exname'
.annotate 'line', 8005
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
.annotate 'line', 8098
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8099
    setattribute self, 'name', __ARG_3
.annotate 'line', 8100
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 8101
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8102

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 8092
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8094
    addattribute $P0, 'name'
.annotate 'line', 8095
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
.annotate 'line', 8117
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8118
    setattribute self, 'name', __ARG_3
.annotate 'line', 8119
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 8120
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 8121
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8122

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 8109
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8111
    addattribute $P0, 'name'
.annotate 'line', 8112
    addattribute $P0, 'basetype'
.annotate 'line', 8113
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 8133
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 8134
# var t: $P1
    $P1 = __ARG_5.'get'()
.annotate 'line', 8135
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8137
    $P4 = WSubId_42(__ARG_5, self)
    setattribute self, 'init', $P4
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8140
    __ARG_5.'unget'($P1)
  __label_2: # endif
# }
.annotate 'line', 8141

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8144
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8145
    if_null $P1, __label_1
.annotate 'line', 8146
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8147
    .return(self)
# }
.annotate 'line', 8148

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8151
    self.'annotate'(__ARG_1)
.annotate 'line', 8152
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8153
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8154
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 8155
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8156
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 8158
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 8159
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8161
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 8162
    ne $S4, $S3, __label_8
.annotate 'line', 8163
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8165
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 8167
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 8170
# ireg: $S5
    null $S5
# switch
.annotate 'line', 8171
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 8173
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 8175
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 8178
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 8179
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 8181
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 8182
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 8183
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8184
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 8185
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 8186
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 8189
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 8193

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8127
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8129
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
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 8208
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 8209
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 8210
# var t: $P1
    $P1 = __ARG_6.'get'()
.annotate 'line', 8211
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8213
    __ARG_6.'unget'($P1)
.annotate 'line', 8214
    $P3 = WSubId_42(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 8215
    WSubId_59(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 8217
    $P1 = __ARG_6.'get'()
.annotate 'line', 8218
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 8219
    $P1 = __ARG_6.'get'()
.annotate 'line', 8220
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8221
    WSubId_45("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 8222
    $P1 = __ARG_6.'get'()
.annotate 'line', 8223
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 8224
    __ARG_6.'unget'($P1)
.annotate 'line', 8225
    $P3 = WSubId_41(__ARG_6, self, WSubId_42, ']')
    setattribute self, 'initarray', $P3
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 8229
    __ARG_6.'unget'($P1)
  __label_3: # endif
# }
.annotate 'line', 8230

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 8233
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8234
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8235
    getattribute $P1, self, 'initarray'
    WSubId_43($P1)
.annotate 'line', 8236
    .return(self)
# }
.annotate 'line', 8237

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8240
    self.'annotate'(__ARG_1)
.annotate 'line', 8242
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 8243
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 8244
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 8245
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 8246
# arraytype: $S1
# builtin string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S5, $S4, 'Array'
    set $S1, $S5
.annotate 'line', 8247
    if_null $P2, __label_1
# {
.annotate 'line', 8249
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 8250
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8254
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 8256
    if_null $P3, __label_4
# {
.annotate 'line', 8257
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 8258
# n: $I1
# builtin elements
    elements $I1, $P3
.annotate 'line', 8259
    unless_null $P2, __label_6
# {
.annotate 'line', 8260
    unless $I1 goto __label_7
# {
.annotate 'line', 8262
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 8265
# i: $I2
    null $I2
.annotate 'line', 8266
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 8267
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 8268
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 8269
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 8272

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8198
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8200
    addattribute $P0, 'size'
.annotate 'line', 8201
    addattribute $P0, 'initarray'
.annotate 'line', 8202
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8279
# var next: $P1
    null $P1
.annotate 'line', 8280
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 8281
# {
.annotate 'line', 8282
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 8283
    WSubId_98($P3)
.annotate 'line', 8284
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8285
# var item: $P5
    null $P5
.annotate 'line', 8286
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8287
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8289
    __ARG_4.'unget'($P4)
.annotate 'line', 8290
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 8292
    $P2 = WSubId_102($P2, $P5)
.annotate 'line', 8293
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 8294
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8295
    WSubId_4(';', $P1)
.annotate 'line', 8296
    .return($P2)
# }
.annotate 'line', 8297

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8305
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 8306

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8301
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
.annotate 'line', 8313
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 8314

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8309
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8320
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8321

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8325
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8326

.end # newIntArray


.sub 'parseInt' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8330
    .tailcall WSubId_103(WSubId_104, WSubId_105, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8331

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8339
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 8340

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8335
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
.annotate 'line', 8347
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 8348

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8343
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8354
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8355

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8359
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8360

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_107 = "WSubId_107"
# Body
# {
.annotate 'line', 8364
    .tailcall WSubId_103(WSubId_106, WSubId_107, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8365

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8373
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 8374

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8369
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
.annotate 'line', 8381
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 8382

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8377
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8388
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8389

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8393
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8394

.end # newStringArray


.sub 'parseString' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 8398
    .tailcall WSubId_103(WSubId_108, WSubId_109, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8399

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
.annotate 'line', 8415
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8416
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8417
    setattribute self, 'name', __ARG_4
.annotate 'line', 8418
    setattribute self, 'value', __ARG_5
.annotate 'line', 8419
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8420

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8423
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8424
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8425
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8426
    $P1 = $P1.'optimize'()
.annotate 'line', 8427
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8428
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8431
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8432
    .return(self)
# }
.annotate 'line', 8433

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8436
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8437

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8440
# builtin string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8441

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8405
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8407
    addattribute $P0, 'type'
.annotate 'line', 8408
    addattribute $P0, 'name'
.annotate 'line', 8409
    addattribute $P0, 'data'
.annotate 'line', 8410
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_102 = "WSubId_102"
# Body
# {
.annotate 'line', 8446
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8447
# type: $S1
    $P5 = WSubId_101($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8448
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8449
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8451
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8452
# {
.annotate 'line', 8453
    $P1 = __ARG_2.'get'()
.annotate 'line', 8454
# var name: $P3
    set $P3, $P1
.annotate 'line', 8455
    WSubId_59('=', __ARG_2)
.annotate 'line', 8456
# var value: $P4
    $P4 = WSubId_42(__ARG_2, __ARG_3)
.annotate 'line', 8458
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8457
    $P2 = WSubId_102($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8459
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8460
    .return($P2)
# }
.annotate 'line', 8461

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8472
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8473
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8474
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8475
    $P4 = WSubId_42(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8476
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8478
    WSubId_4(';', $P1)
# }
.annotate 'line', 8479

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8482
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8483
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8484
    .return(self)
# }
.annotate 'line', 8485

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8488
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8489

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8492
    self.'annotate'(__ARG_1)
.annotate 'line', 8493
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8494
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8495
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8496
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8497
    if_null $P1, __label_3
.annotate 'line', 8498
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8499
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8500
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8501
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
.annotate 'line', 8503
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8504
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8506
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8511
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8512
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8515
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8517
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8521
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8522

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8467
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8469
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 8529
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8530
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 8531

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8534
    self.'annotate'(__ARG_1)
.annotate 'line', 8535
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8536
# builtin string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8537
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8538

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8525
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 8547
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8548
    $P2 = WSubId_42(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8549
    WSubId_59(']', __ARG_2)
.annotate 'line', 8550
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 8551

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8554
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8555
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8556

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8559
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8560
    self.'annotate'(__ARG_1)
.annotate 'line', 8561
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8562
# builtin string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8563
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8564

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8541
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8543
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 8569
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8570
    WSubId_98($P1)
.annotate 'line', 8571
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8572
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8573
    $P2 = __ARG_2.'get'()
.annotate 'line', 8574
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8575
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8577
    __ARG_2.'unget'($P2)
.annotate 'line', 8578
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
.annotate 'line', 8582
    __ARG_2.'unget'($P2)
.annotate 'line', 8583
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8585

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 8589
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8590
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8591
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8592
    .tailcall WSubId_51(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8593

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8606
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8607
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8608
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8609
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8610
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8611
    __ARG_2.'unget'($P1)
.annotate 'line', 8612
# var c: $P2
    $P2 = WSubId_99(__ARG_2, self)
.annotate 'line', 8613
    unless_null $P2, __label_3
.annotate 'line', 8614
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8615
    getattribute $P3, self, 'statements'
# builtin push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8617
    setattribute self, 'end', $P1
# }
.annotate 'line', 8618

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8621
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8622
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8623
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8624
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8625
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8626
    .return($S2)
# }
.annotate 'line', 8627

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8630
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8631
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8632
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8633
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8634
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8635
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8636
    $P1[$S1] = $S3
.annotate 'line', 8637
    .return($S3)
# }
.annotate 'line', 8638

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8639
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8642
    __ARG_1.'comment'('{')
.annotate 'line', 8643
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8644
    $P1.'emit'(__ARG_1)
.annotate 'line', 8645
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8647
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8648

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8599
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8601
    addattribute $P0, 'end'
.annotate 'line', 8602
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8663
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8665
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8666
    new $P1, ['ResizableStringArray']
.annotate 'line', 8667
    new $P2, ['ResizableStringArray']
.annotate 'line', 8668
    setattribute self, 'tempreg', $P1
.annotate 'line', 8669
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8670

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8673
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8674
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8675
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8676
    assign $P1, $I1
# builtin string
.annotate 'line', 8677
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8678

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8681
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8682
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8683
# reg: $S1
    null $S1
.annotate 'line', 8684
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 8685
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8687
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8688
# builtin push
    push $P2, $S1
.annotate 'line', 8689
    .return($S1)
# }
.annotate 'line', 8690

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8693
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8694
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8695
# n: $I1
# builtin elements
    elements $I1, $P2
# for loop
.annotate 'line', 8696
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8697
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8698
# builtin push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8696
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8700
    assign $P2, 0
# }
.annotate 'line', 8701

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8657
    addattribute $P0, 'type'
.annotate 'line', 8658
    addattribute $P0, 'nreg'
.annotate 'line', 8659
    addattribute $P0, 'tempreg'
.annotate 'line', 8660
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8712
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8713

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8716
# var named: $P1
    null $P1
.annotate 'line', 8717
# var slurpy: $P2
    null $P2
.annotate 'line', 8718
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8719
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8720
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8721
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8723
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8726
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8729
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8733
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8740
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8757
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8738
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8741
# setname: $S2
    null $S2
# switch
.annotate 'line', 8742
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8744
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8747
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8748
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8749
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8750
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8753
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8755
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8758
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8759
# }
.annotate 'line', 8761

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8708
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_101 = "WSubId_101"
# Body
# {
.annotate 'line', 8772
    setattribute self, 'func', __ARG_1
.annotate 'line', 8773
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8774
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_101($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8775
    eq $S1, '', __label_2
.annotate 'line', 8776
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8778
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8779
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 8780
# argname: $S2
# builtin string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S4, '__ARG_', $S3
    set $S2, $S4
.annotate 'line', 8781
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8783
# builtin string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8784
    $P1 = __ARG_2.'get'()
.annotate 'line', 8785
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8786
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8788
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8789

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 8792
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8793
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8794
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8795
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_110($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8796
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8797
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8798
    if_null $P3, __label_3
.annotate 'line', 8799
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8800
    __ARG_1.'say'('')
# }
.annotate 'line', 8801

.end # emit


.sub 'get_type' :method
# Body
# {
.annotate 'line', 8804
    getattribute $P1, self, 'type'
    .return($P1)
# }
.annotate 'line', 8805

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8766
    addattribute $P0, 'func'
.annotate 'line', 8767
    addattribute $P0, 'name'
.annotate 'line', 8768
    addattribute $P0, 'modifiers'
.annotate 'line', 8769
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8811
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8812

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8823
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8824
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8825

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8828
# var path: $P1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 8829
# reg: $S1
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8830
    self.'annotate'(__ARG_1)
.annotate 'line', 8831
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 8832
    .return($S1)
# }
.annotate 'line', 8833

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8818
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8820
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8844
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8845

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8848
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8849
# name: $S1
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8851
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 8853
# nargmods: $I1
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 8854
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 8855
    le $I1, 0, __label_5
# {
.annotate 'line', 8856
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8857
# iargmod: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 8858
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8859
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 8860
    WSubId_1('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 8861
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 8862
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 8863
    __ARG_1.'print'(", ")
  __label_10: # endif
# }
  __label_6: # for iteration
.annotate 'line', 8857
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 8865
    __ARG_1.'print'(')')
# }
  __label_5: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8868

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8840
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 8873
# nargs: $I1
    $P4 = __ARG_2.'numargs'()
    set $I1, $P4
.annotate 'line', 8874
# var sig: $P1
    null $P1
.annotate 'line', 8875
    unless $I1 goto __label_1
# {
.annotate 'line', 8876
    root_new $P4, ['parrot';'ResizablePMCArray']
    set $P1, $P4
# for loop
.annotate 'line', 8877
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 8878
# var arg: $P2
    $P2 = __ARG_2.'getarg'($I2)
# switch-case
.annotate 'line', 8880
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 8883
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 8890
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 8881
    $P4 = $P2.'get_value'()
# builtin push
    push $P1, $P4
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 8884
# name: $S1
    $P5 = $P2.'getName'()
    null $S1
    if_null $P5, __label_10
    set $S1, $P5
  __label_10:
.annotate 'line', 8885
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
.annotate 'line', 8886
# builtin push
    push $P1, $S1
    goto __label_12
  __label_11: # else
.annotate 'line', 8888
    getattribute $P6, $P2, 'start'
    WSubId_1("unsupported multi signature", $P6)
  __label_12: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 8891
# var key: $P3
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 8892
    unless_null $P3, __label_16
.annotate 'line', 8893
    getattribute $P7, $P2, 'start'
    WSubId_1("class not found", $P7)
  __label_16: # endif
.annotate 'line', 8894
    isa $I5, $P3, 'ResizableStringArray'
# builtin __ASSERT__
.annotate 'line', 8895
    $P8 = WSubId_22($P3)
# builtin push
    push $P1, $P8
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 8898
    getattribute $P9, $P2, 'start'
    WSubId_1("unsupported multi signature", $P9)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 8877
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
.annotate 'line', 8902
    .return($P1)
# }
.annotate 'line', 8903

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8925
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8926
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8927
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8928
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8929
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8930
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8931

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8933
    .return(self)
# }

.end # getouter


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8936
    .return(1)
# }
.annotate 'line', 8937

.end # allowtailcall


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8941
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8942
    unless_null $P1, __label_1
.annotate 'line', 8943
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8944
    .return($P1)
# }
.annotate 'line', 8945

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8948
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8949
    unless_null $P1, __label_1
.annotate 'line', 8950
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8951
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8952

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8956
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8957
    .return($I1)
# }
.annotate 'line', 8958

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_111 = "WSubId_111"
# Body
# {
.annotate 'line', 8961
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8962
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8963
    __ARG_1.'unget'($P1)
.annotate 'line', 8964
    $P3 = WSubId_41(__ARG_1, self, WSubId_111, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8966

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8970
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8971
    unless_null $P1, __label_1
.annotate 'line', 8972
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8974
# builtin push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8975

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8978
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8979
    unless_null $P1, __label_1
# {
.annotate 'line', 8981
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8984
    if_null $P1, __label_4
    iter $P5, $P1
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 8985
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8986
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8987
# builtin push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8989

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 8992
# var found: $P1
    null $P1
.annotate 'line', 8993
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8994
    $P1 = $P2.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 8995
    if_null $P1, __label_3
.annotate 'line', 8996
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8998
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8999

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_112 = "WSubId_112"
# Body
# {
.annotate 'line', 9003
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9004
    if_null $P1, __label_1
# {
.annotate 'line', 9005
# var multi: $P2
    $P2 = $P1.'pick'('multi')
.annotate 'line', 9006
    if_null $P2, __label_2
# {
.annotate 'line', 9007
    isa $I1, self, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
# builtin __ASSERT__
.annotate 'line', 9008
    self.'setmulti'()
.annotate 'line', 9009
    $P5 = WSubId_112(self, $P2)
    setattribute self, 'multi_sig', $P5
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 9012
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
.annotate 'line', 9013
    $P3.'fixnamespaces'()
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9014
    getattribute $P7, self, 'body'
    $P5 = $P7.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 9015
    .return(self)
# }
.annotate 'line', 9016

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9020
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 9021
    unless_null $P1, __label_1
.annotate 'line', 9022
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 9023
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 9024

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9027
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 9028
    unless_null $P1, __label_1
.annotate 'line', 9029
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 9030
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 9031

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9036
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 9037
# lexname: $S1
    null $S1
.annotate 'line', 9038
    if_null $P1, __label_1
.annotate 'line', 9039
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9041
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 9042
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 9043
# builtin string
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 9044
    self.'setlex'($S1, $S2)
.annotate 'line', 9045
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 9047
    .return($S1)
# }
.annotate 'line', 9048

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9052
# var store: $P1
    null $P1
# switch
.annotate 'line', 9053
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
.annotate 'line', 9055
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9057
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9059
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9061
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9063
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 9065
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9066
    .return($S1)
# }
.annotate 'line', 9067

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9070
# var store: $P1
    null $P1
# switch
.annotate 'line', 9071
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
.annotate 'line', 9073
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9075
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9077
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9079
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9081
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 9083
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9084
    .return($S1)
# }
.annotate 'line', 9085

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 9088
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
.annotate 'line', 9089
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9090

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 9093
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# builtin string
.annotate 'line', 9094
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 9095

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9098
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 9099

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9102
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 9103

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
# Empty body

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9109
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 9110
    __ARG_1.'say'()
.annotate 'line', 9111
    __ARG_1.'print'(".sub ")
.annotate 'line', 9112
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 9113
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 9115
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 9116
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 9117
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 9118
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 9119
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 9120
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 9121
    if_null $P2, __label_6
.annotate 'line', 9122
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 9126
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 9127
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 9128
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9129
    if_null $P3, __label_8
.annotate 'line', 9130
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 9132
    ne $S1, 'main', __label_10
.annotate 'line', 9133
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 9135
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 9136
    __ARG_1.'say'()
.annotate 'line', 9139
    getattribute $P8, self, 'params'
    WSubId_57(__ARG_1, $P8)
.annotate 'line', 9141
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 9142
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 9143
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 9144
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 9146
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 9147
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 9149
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 9150
# builtin substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 9151
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 9152
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 9156
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 9158
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 9161
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 9162
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 9163
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 9165
    __ARG_1.'comment'('Body')
.annotate 'line', 9166
    $P6.'emit'(__ARG_1)
.annotate 'line', 9167
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 9169
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9172
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 9173
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 9174

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8905
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8907
    addattribute $P0, 'name'
.annotate 'line', 8908
    addattribute $P0, 'subid'
.annotate 'line', 8909
    addattribute $P0, 'modifiers'
.annotate 'line', 8910
    addattribute $P0, 'params'
.annotate 'line', 8911
    addattribute $P0, 'body'
.annotate 'line', 8912
    addattribute $P0, 'regstI'
.annotate 'line', 8913
    addattribute $P0, 'regstN'
.annotate 'line', 8914
    addattribute $P0, 'regstS'
.annotate 'line', 8915
    addattribute $P0, 'regstP'
.annotate 'line', 8916
    addattribute $P0, 'nlabel'
.annotate 'line', 8917
    addattribute $P0, 'localfun'
.annotate 'line', 8918
    addattribute $P0, 'lexicals'
.annotate 'line', 8919
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8920
    addattribute $P0, 'usedsubids'
.annotate 'line', 8921
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9190
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9191
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 9192
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 9193
    self.'parse'(__ARG_2)
.annotate 'line', 9194
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
# }
.annotate 'line', 9195

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9197
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# builtin int
.annotate 'line', 9201
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9202

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# builtin int
.annotate 'line', 9206
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9207

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9208
    .return(0)
# }

.end # ismethod


.sub 'ismulti' :method
# Body
# {
.annotate 'line', 9212
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
.annotate 'line', 9213

.end # ismulti


.sub 'setmulti' :method
# Body
# {
.annotate 'line', 9216
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
# }
.annotate 'line', 9217

.end # setmulti


.sub 'default_multi_sig' :method
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 9220
# var multi_sig: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9221
    $P3 = self.'ismethod'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9222
# builtin push
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 9223
    getattribute $P3, self, 'params'
    if_null $P3, __label_3
    iter $P4, $P3
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P2, $P4
.annotate 'line', 9224
    $P6 = $P2.'get_type'()
    $P5 = WSubId_110($P6)
# builtin push
    push $P1, $P5
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9225
    .return($P1)
# }
.annotate 'line', 9226

.end # default_multi_sig


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 9229
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9230
    setattribute self, 'name', $P1
.annotate 'line', 9231
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9232
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9233
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9234
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 9236
    WSubId_4('(', $P2)
.annotate 'line', 9237
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9239
# var path: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 9240
    $P4 = $P3.'fullname'()
    WSubId_113(self, '__FUNCTION__', $P4)
.annotate 'line', 9242
    $P2 = __ARG_1.'get'()
.annotate 'line', 9243
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9244
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9245
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9246
    .return(self)
# }
.annotate 'line', 9247

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9251
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 9252
# var multi_sig: $P1
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9253
    unless_null $P1, __label_2
.annotate 'line', 9254
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 9255
    __ARG_1.'print'(' :multi(')
.annotate 'line', 9256
# sep: $S1
    set $S1, ''
.annotate 'line', 9257
    if_null $P1, __label_4
    iter $P3, $P1
    set $P3, 0
  __label_3: # for iteration
    unless $P3 goto __label_4
    shift $S2, $P3
# {
.annotate 'line', 9258
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 9259
    set $S1, ', '
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9261
    __ARG_1.'print'(')')
# }
  __label_1: # endif
# }
.annotate 'line', 9263

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9181
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9183
    addattribute $P0, 'paramnum'
.annotate 'line', 9184
    addattribute $P0, 'lexnum'
.annotate 'line', 9185
    addattribute $P0, 'is_multi'
.annotate 'line', 9186
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
.annotate 'line', 9274
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9275
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9276
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9277
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 9278
    setattribute self, 'name', $P1
.annotate 'line', 9279
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9280
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9281
    WSubId_4('{', $P2)
.annotate 'line', 9282
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9283
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 9284

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9285
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9286
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 9289
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9290
    .return(1)
  __label_1: # endif
.annotate 'line', 9291
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9292
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9293
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9294
    .return(0)
# }
.annotate 'line', 9295

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 9298
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 9299

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 9303
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 9304

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 9308
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 9309

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9312
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9313
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9314
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9316
# builtin substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9317
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9318
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9319
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 9320
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 9321
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 9322
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 9323
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9324
# flags: $I1
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 9325
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9326
    eq $S3, 'P', __label_8
.annotate 'line', 9327
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9328
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9329
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9330
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9331
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 9334
    .return(__ARG_2)
# }
.annotate 'line', 9335

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9338
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9339
    unless_null $P1, __label_1
.annotate 'line', 9340
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9341
    unless_null $P1, __label_2
# {
.annotate 'line', 9344
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9345
    unless_null $P1, __label_3
# {
.annotate 'line', 9347
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 9348
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 9349
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 9350
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9351
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9352
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9353
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 9357
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 9359
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9360
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9361
    .return($P1)
# }
.annotate 'line', 9362

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9270
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
.annotate 'line', 9373
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9374

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9375
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9369
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_101 = "WSubId_101"
# Body
# {
.annotate 'line', 9389
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9390
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9391
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9392
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9393
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9394
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_101($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9395
    set $P1, $P2
.annotate 'line', 9396
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9397
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 9399
    setattribute self, 'name', $P1
.annotate 'line', 9400
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9401
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9402
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9403
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9405
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 9406

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9409
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9410
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9411
    if_null $P1, __label_1
# {
.annotate 'line', 9412
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 9413
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 9415

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9384
    addattribute $P0, 'name'
.annotate 'line', 9385
    addattribute $P0, 'modifiers'
.annotate 'line', 9386
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9420
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 9421

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_114 = "WSubId_114"
# Body
# {
.annotate 'line', 9428
    $P2 = WSubId_41(__ARG_1, __ARG_2, WSubId_114, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 9429

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9432
    __ARG_1.'print'('(')
.annotate 'line', 9433
# sep: $S1
    set $S1, ''
.annotate 'line', 9434
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 9435
    __ARG_1.'print'($S1)
.annotate 'line', 9436
    $P1.'emit'(__ARG_1)
.annotate 'line', 9437
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9439
    __ARG_1.'print'(')')
# }
.annotate 'line', 9440

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9425
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
.annotate 'line', 9449
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9450
    setattribute self, 'params', __ARG_3
.annotate 'line', 9451
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 9452

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9455
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9456
    .return(self)
# }
.annotate 'line', 9457

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9460
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 9461
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9462
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9463
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9464
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9465
    __ARG_1.'print'('    ')
.annotate 'line', 9466
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9467
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9468
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9469
    __ARG_1.'say'()
# }
.annotate 'line', 9470

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9443
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9445
    addattribute $P0, 'params'
.annotate 'line', 9446
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
.annotate 'line', 9487
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9488

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9489
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9493
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9494

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9483
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9502
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9503
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9504

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9505
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9509
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9510
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9511

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9497
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9499
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9520
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9521
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9522
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9523
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9524
    WSubId_45('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9525
    $P3 = $P2.'rawstring'()
# builtin push
    push $P1, $P3
.annotate 'line', 9526
    $P2 = __ARG_1.'get'()
.annotate 'line', 9527
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9528
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9530
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9534
    WSubId_46('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9536
# {
.annotate 'line', 9537
    $P2 = __ARG_1.'get'()
.annotate 'line', 9538
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9539
    WSubId_45('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9540
    $P3 = $P2.'rawstring'()
# builtin push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9541
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9542
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9544
    setattribute self, 'key', $P1
# }
.annotate 'line', 9545

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9546
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# builtin int
.annotate 'line', 9549
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9550

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9554
    getattribute $P2, self, 'key'
    $P1 = WSubId_22($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9555

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9514
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9516
    addattribute $P0, 'key'
.annotate 'line', 9517
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9563
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9564
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
# builtin string
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 9565
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9566
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9567
    $P2 = __ARG_1.'get'()
.annotate 'line', 9568
# builtin string
    set $S1, $P2
# builtin push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9570
    __ARG_1.'unget'($P2)
.annotate 'line', 9571
    setattribute self, 'key', $P1
# }
.annotate 'line', 9572

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9573
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9577
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9578
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9579

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9582
# var nskey: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9583
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
# }
.annotate 'line', 9584

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9588
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9589
    unless_null $P1, __label_1
# {
.annotate 'line', 9590
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9591
    getattribute $P3, self, 'key'
# builtin join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_73($S2)
  __label_3: # endif
.annotate 'line', 9592
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9594
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9595

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9598
# var nskey: $P1
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 9599
    unless_null $P1, __label_1
# {
.annotate 'line', 9600
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9601
    getattribute $P3, self, 'key'
# builtin join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_73($S2)
  __label_3: # endif
.annotate 'line', 9602
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'say'("new ", __ARG_3, ", ", $P2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9605
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 9607

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9558
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9560
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9612
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9613
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9614
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9615
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9616
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9617
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9618
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9619
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9620

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9632
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9633
    setattribute self, 'name', __ARG_2
.annotate 'line', 9634
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 9635
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9636

.end # ClassBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9639
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9640

.end # getpath


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 9643
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
# }
.annotate 'line', 9644

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9626
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9628
    addattribute $P0, 'name'
.annotate 'line', 9629
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 9657
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9658
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9659
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9660
    setattribute self, 'functions', $P1
.annotate 'line', 9661
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9662
    setattribute self, 'members', $P2
.annotate 'line', 9663
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9664
    setattribute self, 'constants', $P3
.annotate 'line', 9665
# var seen_functions: $P4
    root_new $P4, ['parrot';'Hash']
.annotate 'line', 9667
# var t: $P5
    $P5 = __ARG_4.'get'()
.annotate 'line', 9668
    $P10 = $P5.'isop'(':')
    if_null $P10, __label_1
    unless $P10 goto __label_1
# {
.annotate 'line', 9669
    $P12 = WSubId_41(__ARG_4, self, WSubId_67)
    setattribute self, 'bases', $P12
.annotate 'line', 9670
    $P5 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9672
    WSubId_4('{', $P5)
.annotate 'line', 9674
    getattribute $P11, self, 'classns'
    $P10 = $P11.'fullname'()
    WSubId_113(self, '__CLASS__', $P10)
# for loop
.annotate 'line', 9676
    $P5 = __ARG_4.'get'()
  __label_4: # for condition
    $P10 = $P5.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9677
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
.annotate 'line', 9679
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P6.'MethodStatement'($P5, __ARG_4, self)
.annotate 'line', 9680
# builtin push
    push $P1, $P6
.annotate 'line', 9681
# var first_func: $P7
    getattribute $P12, $P6, 'name'
    $P7 = $P4[$P12]
.annotate 'line', 9682
    unless_null $P7, __label_10
.annotate 'line', 9683
    getattribute $P13, $P6, 'name'
    $P4[$P13] = $P6
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 9685
    $P7.'setmulti'()
.annotate 'line', 9686
    $P6.'setmulti'()
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9690
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 9691
    $P10 = $P8.'isidentifier'()
    isfalse $I1, $P10
    unless $I1 goto __label_12
.annotate 'line', 9692
    WSubId_45("member identifier", $P8)
  __label_12: # endif
.annotate 'line', 9693
# builtin push
    push $P2, $P8
.annotate 'line', 9694
    $P5 = __ARG_4.'get'()
.annotate 'line', 9695
    $P11 = $P5.'isop'(';')
    isfalse $I2, $P11
    unless $I2 goto __label_13
.annotate 'line', 9696
    WSubId_45("';' in member declaration", $P5)
  __label_13: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9699
# var cst: $P9
    $P9 = WSubId_49($P5, __ARG_4, self)
.annotate 'line', 9700
# builtin push
    push $P3, $P9
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9703
    WSubId_46("item in class", $P5)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9676
    $P5 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9706

.end # ClassStatement


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9709
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9710

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9713
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9714

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9717
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9718

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9721
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
# }
.annotate 'line', 9722

.end # use_builtin


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 9725
    getattribute $P1, self, 'constants'
    WSubId_43($P1)
.annotate 'line', 9726
    getattribute $P1, self, 'functions'
    WSubId_43($P1)
.annotate 'line', 9727
    .return(self)
# }
.annotate 'line', 9728

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9731
    getattribute $P3, self, 'classns'
    $P3.'emitnamespace'(__ARG_1)
.annotate 'line', 9732
    getattribute $P3, self, 'functions'
    WSubId_57(__ARG_1, $P3)
.annotate 'line', 9734
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9736
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 9737
# n: $I1
    set $I1, 1
.annotate 'line', 9738
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 9739
    $P1.'annotate'(__ARG_1)
.annotate 'line', 9740
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9741
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9742
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 9743
    __ARG_1.'say'()
.annotate 'line', 9744
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9746
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 9747
    __ARG_1.'annotate'($P2)
.annotate 'line', 9748
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9751
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9752

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9647
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9649
    addattribute $P0, 'parent'
.annotate 'line', 9650
    addattribute $P0, 'bases'
.annotate 'line', 9651
    addattribute $P0, 'constants'
.annotate 'line', 9652
    addattribute $P0, 'functions'
.annotate 'line', 9653
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9759
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9760

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9763
    .return(self)
# }
.annotate 'line', 9764

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9755
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9772
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9773
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9774
# var nskey: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9775
# var ns: $P4
    null $P4
# for loop
  __label_3: # for condition
.annotate 'line', 9777
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
# {
.annotate 'line', 9778
    $P3.'push'($P1)
.annotate 'line', 9779
    $P1 = __ARG_2.'get'()
# }
  __label_1: # for iteration
.annotate 'line', 9777
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9782
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 9783
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 9784
# builtin string
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 9785
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 9788
    __ARG_2.'unget'($P2)
.annotate 'line', 9789
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 9790
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9791
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
# }
  __label_5: # endif
# }
.annotate 'line', 9793

.end # parseClass


.sub 'open_include' :subid('WSubId_115')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9801
# var interp: $P1
# builtin getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9806
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9807
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9808
# var file: $P4
    null $P4
.annotate 'line', 9809
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9810
# filepath: $S2
    concat $S3, $S1, __ARG_1
    set $S2, $S3
.annotate 'line', 9811
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9812
# builtin open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9813
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 9814
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9811
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
.annotate 'line', 9819
    isnull $I1, $P4
    if $I1 goto __label_8
    $I1 = $P4.'is_closed'()
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 9820
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 9821
    $P4.'encoding'("utf8")
.annotate 'line', 9822
    .return($P4)
# }
.annotate 'line', 9823

.end # open_include


.sub 'include_parrot' :subid('WSubId_118')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9827
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9828
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9829
    WSubId_45('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9830
    WSubId_59(';', __ARG_2)
.annotate 'line', 9832
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9833
# var file: $P2
    $P2 = WSubId_115($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9838
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
.annotate 'line', 9839
# builtin substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9840
# pos: $I1
    set $I1, 12
.annotate 'line', 9841
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9842
# builtin substr
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 9843
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9844
# pos2: $I2
    set $I2, $I1
  __label_12: # while
.annotate 'line', 9845
# builtin substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 9846
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9847
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 9848
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 9850
# name: $S4
    sub $I4, $I2, $I1
# builtin substr
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 9851
# builtin substr
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 9852
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 9853
    set $I1, $I2
  __label_22: # while
.annotate 'line', 9854
# builtin substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 9855
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 9856
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 9857
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 9859
# value: $S5
    sub $I4, $I2, $I1
# builtin substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 9861
# ivalue: $I3
    null $I3
.annotate 'line', 9862
# builtin substr
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
# builtin substr
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 9863
# builtin substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 9865
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 9866
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 9868
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 9867
    $P4 = WSubId_21(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9838
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 9872
    $P2.'close'()
# }
.annotate 'line', 9873

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_115 = "WSubId_115"
# Body
# {
.annotate 'line', 9879
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9880
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 9881
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9882
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9883
    WSubId_45('literal string', $P1)
  __label_2: # endif
.annotate 'line', 9884
    WSubId_59(';', __ARG_2)
.annotate 'line', 9886
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 9887
# var file: $P2
    $P2 = WSubId_115($S1, __ARG_1)
.annotate 'line', 9889
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 9890
    __ARG_3.'parse'($P3)
.annotate 'line', 9892
    $P2.'close'()
# }
.annotate 'line', 9893

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 9899
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9900
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 9901
    WSubId_63(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9902
    WSubId_59(';', __ARG_2)
.annotate 'line', 9903
    .return()
# }
  __label_1: # endif
.annotate 'line', 9905
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
# {
.annotate 'line', 9906
    __ARG_2.'unget'($P1)
.annotate 'line', 9907
# var key: $P2
    $P2 = WSubId_60(__ARG_2)
.annotate 'line', 9908
# nelems: $I1
# builtin elements
    elements $I1, $P2
.annotate 'line', 9909
    ge $I1, 1, __label_3
.annotate 'line', 9910
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 9911
    WSubId_59(';', __ARG_2)
.annotate 'line', 9912
    __ARG_3.'use'($P2)
.annotate 'line', 9913
    .return()
# }
  __label_2: # endif
.annotate 'line', 9915
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9917
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 9923
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9919
# reqlib: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 9920
    __ARG_3.'addlib'($S1)
.annotate 'line', 9921
    WSubId_59(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9924
    __ARG_2.'unget'($P1)
.annotate 'line', 9925
# var module: $P3
    $P3 = WSubId_60(__ARG_2)
.annotate 'line', 9926
    $P1 = __ARG_2.'get'()
.annotate 'line', 9927
    $P6 = $P1.'isop'(';')
    isfalse $I3, $P6
    unless $I3 goto __label_9
# {
.annotate 'line', 9928
    __ARG_2.'unget'($P1)
.annotate 'line', 9929
# var names: $P4
    null $P5
    $P4 = WSubId_41(__ARG_2, $P5, WSubId_62, ';')
.annotate 'line', 9930
    __ARG_3.'addextern'($P3, $P4)
# }
  __label_9: # endif
.annotate 'line', 9932
# reqmodule: $S2
# builtin join
    join $S3, '/', $P3
    concat $S4, '"', $S3
    concat $S4, $S4, '.pbc"'
    set $S2, $S4
.annotate 'line', 9933
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9936
    WSubId_45('string literal or identifier', $P1)
  __label_4: # switch end
# }
.annotate 'line', 9938

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9948
    setattribute self, 'module', __ARG_1
.annotate 'line', 9949
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9950

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9955
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9964
# builtin string
.annotate 'line', 9965
    getattribute $P1, self, 'module'
# builtin join
    join $S2, "'; '", $P1
    concat $S3, "['parrot'; '", $S2
    concat $S3, $S3, "']"
.annotate 'line', 9964
    __ARG_1.'emitget_root_namespace'("srcns", $S3)
.annotate 'line', 9967
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9968
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9969
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9975

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9944
    addattribute $P0, 'module'
.annotate 'line', 9945
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9985
    new $P1, ['ResizableStringArray']
.annotate 'line', 9986
    unless __ARG_2 goto __label_1
.annotate 'line', 9987
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9989
    if_null __ARG_1, __label_3
.annotate 'line', 9990
# builtin push
    push $P1, __ARG_1
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 9992
    setattribute self, 'path', $P1
# }
.annotate 'line', 9993

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9996
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 9997
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 9998
# var path: $P2
    getattribute $P3, self, 'path'
# builtin clone
    clone $P2, $P3
.annotate 'line', 9999
# builtin push
    push $P2, __ARG_1
.annotate 'line', 10000
    setattribute $P1, 'path', $P2
.annotate 'line', 10001
    .return($P1)
# }
.annotate 'line', 10002

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10005
# var fromkey: $P1
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 10006
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 10007
# var fromhll: $P3
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 10008
    unless_null $P2, __label_3
.annotate 'line', 10009
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 10011
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
# }
.annotate 'line', 10012

.end # samehllas


.sub 'fullname' :method
# Body
# {
.annotate 'line', 10015
# name: $S1
    getattribute $P1, self, 'path'
# builtin join
    join $S1, '.', $P1
.annotate 'line', 10016
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
# builtin string
.annotate 'line', 10017
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 10019
    .return($S1)
  __label_2: # endif
# }
.annotate 'line', 10020

.end # fullname


.sub 'getparrotkey' :method
# Body
# {
.annotate 'line', 10023
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10024
# r: $S1
    null $S1
.annotate 'line', 10025
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10026
# builtin string
# builtin join
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 10027
    .return($S1)
# }
.annotate 'line', 10028

.end # getparrotkey


.sub 'getparrotrootkey' :method
# Body
# {
.annotate 'line', 10031
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10032
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 10033
# r: $S1
    set $S1, "[ '"
.annotate 'line', 10034
    if_null $P2, __label_1
# {
.annotate 'line', 10037
    set $S3, $P2
# builtin downcase
    downcase $S2, $S3
    concat $S1, $S1, $S2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 10040
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 10041
    concat $S1, $S1, "'"
.annotate 'line', 10042
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 10043
# builtin string
# builtin join
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 10044
    concat $S1, $S1, " ]"
.annotate 'line', 10045
    .return($S1)
# }
.annotate 'line', 10046

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10049
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10050
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 10051
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10052
# builtin join
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 10053
    __ARG_1.'say'("]")
# }
.annotate 'line', 10054

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 10057
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 10058
    __ARG_1.'print'('    ', 'new ', __ARG_3, ", ")
.annotate 'line', 10059
    $P1 = self.'getparrotkey'()
    __ARG_1.'print'($P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10062
    __ARG_1.'print'('    ', 'root_new ', __ARG_3, ", ")
.annotate 'line', 10063
    $P1 = self.'getparrotrootkey'()
    __ARG_1.'print'($P1)
# }
  __label_2: # endif
.annotate 'line', 10065
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 10066
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 10067
    __ARG_1.'say'()
# }
.annotate 'line', 10068

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 10071
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10072
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10074
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
# }
.annotate 'line', 10075

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 10078
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 10079
    $P4 = self.'getparrotkey'()
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", $P4)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10084
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10085
# var path: $P2
    getattribute $P3, self, 'path'
# builtin clone
    clone $P2, $P3
.annotate 'line', 10086
# name: $S1
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 10087
# shll: $S2
    if_null $P1, __label_5
    set $S3, $P1
# builtin downcase
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 10088
# builtin elements
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 10090
# builtin join
    join $S3, "'; '", $P2
.annotate 'line', 10089
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'; '", $S3, "'], '", $S1, "'")
    goto __label_7
  __label_6: # else
.annotate 'line', 10092
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'], '", $S1, "'")
  __label_7: # endif
.annotate 'line', 10094
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 10096

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 10099
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10100
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10102
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
# }
.annotate 'line', 10103

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 9980
    addattribute $P0, 'hll'
.annotate 'line', 9981
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_113 = "WSubId_113"
# Body
# {
.annotate 'line', 10123
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 10124
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 10125
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 10126
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10127
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 10128
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 10129
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions_name', $P2
.annotate 'line', 10130
    $P1 = __ARG_1.'fullname'()
    WSubId_113(self, '__NAMESPACE__', $P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10133
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 10134
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 10135
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10136
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 10137
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
.annotate 'line', 10138
    getattribute $P2, __ARG_2, 'functions_name'
    setattribute self, 'functions_name', $P2
# }
  __label_2: # endif
.annotate 'line', 10140
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 10141

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 10144
# var ns: $P1
    null $P1
.annotate 'line', 10145
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10146
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10147
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 10148
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 10149
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 10150

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 10153
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 10154

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10157
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 10158
    .return()
  __label_1: # endif
.annotate 'line', 10159
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10160
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 10161
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 10162
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10163
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10164

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10167
# var sym: $P1
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 10168
    if_null $P1, __label_1
# {
.annotate 'line', 10169
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 10170
    getattribute $P3, self, 'functions'
# builtin push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10173
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 10174
# var ns: $P2
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 10175
    if_null $P2, __label_5
# {
.annotate 'line', 10176
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 10177
    if_null $P1, __label_6
.annotate 'line', 10178
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 10181

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10184
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10185
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10186
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 10187
    .return($P2)
# }
.annotate 'line', 10188

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10191
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10192
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10193
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10194
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 10195

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10199
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 10200
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10201
    unless_null $P2, __label_1
.annotate 'line', 10202
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10204
# builtin push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 10205

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10209
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 10210
# var cl: $P2
    null $P2
.annotate 'line', 10211
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 10212
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10213
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10214
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 10215
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 10216
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 10217
    .return($P5)
# }
.annotate 'line', 10218

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10221
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10222
    if_null $P1, __label_1
.annotate 'line', 10223
    .return($P1)
  __label_1: # endif
.annotate 'line', 10224
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 10225
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 10226
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 10227
    .return($P2)
# }
.annotate 'line', 10228

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 10233
# keylen: $I1
# builtin elements
    elements $I1, __ARG_1
.annotate 'line', 10234
# name: $S1
    null $S1
.annotate 'line', 10235
# var sym: $P1
    null $P1
.annotate 'line', 10236
# var ns: $P2
    null $P2
# switch
.annotate 'line', 10237
    sub $I2, $I1, __ARG_3
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 10241
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
# switch
.annotate 'line', 10242
    set $I5, __ARG_2
    set $I6, 1
    if $I5 == $I6 goto __label_7
    set $I6, 2
    if $I5 == $I6 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 10244
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 10246
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 10249
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 10250
    .return($P1)
  __label_9: # endif
.annotate 'line', 10251
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 10252
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 10253
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 10260
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 10261
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 10262
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_14
.annotate 'line', 10263
    add $I8, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I8)
    isnull $I7, $P1
    not $I7
  __label_14:
    unless $I7 goto __label_13
.annotate 'line', 10264
    .return($P1)
  __label_13: # endif
.annotate 'line', 10265
    $P2 = self.'getusedns'($S1)
.annotate 'line', 10266
    isnull $I9, $P2
    not $I9
    unless $I9 goto __label_16
.annotate 'line', 10267
    add $I10, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I10)
    isnull $I9, $P1
    not $I9
  __label_16:
    unless $I9 goto __label_15
.annotate 'line', 10268
    .return($P1)
  __label_15: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 10270
    .return($P3)
# }
.annotate 'line', 10271

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 10274
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 10275
    getattribute $P2, self, 'namespaces'
# builtin push
    push $P2, $P1
.annotate 'line', 10276
    .return($P1)
# }
.annotate 'line', 10277

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 10280
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 10281
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 10282
    getattribute $P3, self, 'namespaces'
# builtin push
    push $P3, $P2
.annotate 'line', 10283
    getattribute $P3, self, 'items'
# builtin push
    push $P3, $P2
.annotate 'line', 10284
    .return($P2)
# }
.annotate 'line', 10285

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10288
    getattribute $P1, self, 'classes'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10289

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10292
    getattribute $P1, self, 'classes'
# builtin push
    push $P1, __ARG_1
.annotate 'line', 10293
    getattribute $P1, self, 'items'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10294

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 10297
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 10298
# name: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 10299
    $P1 = __ARG_2.'get'()
.annotate 'line', 10301
# var parent: $P2
    set $P2, self
# for loop
  __label_4: # for condition
.annotate 'line', 10302
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 10303
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10304
    $P5 = __ARG_2.'get'()
    set $S1, $P5
# }
  __label_2: # for iteration
.annotate 'line', 10302
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10307
# var modifier: $P3
    null $P3
.annotate 'line', 10308
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 10309
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10310
    $P1 = __ARG_2.'get'()
# }
  __label_5: # endif
.annotate 'line', 10313
    WSubId_4('{', $P1)
.annotate 'line', 10314
# var child: $P4
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10315
    $P4.'parse'(__ARG_2)
# }
.annotate 'line', 10316

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_116 = "WSubId_116"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_117 = "WSubId_117"
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_119 = "WSubId_119"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 10319
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 10320
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 10321
# var functions_name: $P3
    getattribute $P3, self, 'functions_name'
.annotate 'line', 10322
# var classes: $P4
    getattribute $P4, self, 'classes'
.annotate 'line', 10323
# var t: $P5
    null $P5
# for loop
.annotate 'line', 10324
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
.annotate 'line', 10326
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
.annotate 'line', 10328
    self.'parsenamespace'($P5, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10331
# var cst: $P6
    $P6 = WSubId_49($P5, __ARG_1, self)
.annotate 'line', 10332
# builtin push
    push $P1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10335
# var f: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P7.'FunctionStatement'($P5, __ARG_1, self)
.annotate 'line', 10336
# name: $S1
    getattribute $P12, $P7, 'name'
    null $S1
    if_null $P12, __label_17
    set $S1, $P12
  __label_17:
.annotate 'line', 10337
# builtin push
    push $P2, $P7
.annotate 'line', 10338
# builtin push
    push $P1, $P7
.annotate 'line', 10339
# var funcs: $P8
    $P8 = $P3[$S1]
.annotate 'line', 10340
    if_null $P8, __label_18
# {
.annotate 'line', 10341
    $P7.'setmulti'()
.annotate 'line', 10342
# builtin elements
    elements $I1, $P8
    ne $I1, 1, __label_20
.annotate 'line', 10343
    $P11 = $P8[0]
    $P11.'setmulti'()
  __label_20: # endif
.annotate 'line', 10344
    $P8.'push'($P7)
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 10347
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P11[0] = $P7
    $P3[$S1] = $P11
  __label_19: # endif
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 10350
    WSubId_116($P5, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 10353
# var t1: $P9
    $P9 = __ARG_1.'get'()
.annotate 'line', 10354
    $P12 = $P9.'iskeyword'('function')
    isfalse $I1, $P12
    unless $I1 goto __label_21
.annotate 'line', 10355
    WSubId_1('Unsupported extern', $P9)
  __label_21: # endif
.annotate 'line', 10356
    $P9 = __ARG_1.'get'()
.annotate 'line', 10357
    WSubId_98($P9)
.annotate 'line', 10358
    WSubId_59(';', __ARG_1)
.annotate 'line', 10359
# var fex: $P10
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P10.'FunctionExtern'($P9, self)
.annotate 'line', 10360
# builtin push
    push $P2, $P10
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 10363
    WSubId_117($P5, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 10366
    WSubId_118($P5, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 10369
    WSubId_119($P5, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 10372
    $P5 = __ARG_1.'get'()
.annotate 'line', 10373
    $P13 = $P5.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_22
.annotate 'line', 10374
    WSubId_45('string literal', $P5)
  __label_22: # endif
.annotate 'line', 10375
    WSubId_59(';', __ARG_1)
.annotate 'line', 10376
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P5)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 10379
    $P5 = __ARG_1.'get'()
.annotate 'line', 10380
    $P17 = $P5.'isstring'()
    isfalse $I3, $P17
    unless $I3 goto __label_23
.annotate 'line', 10381
    WSubId_45('string literal', $P5)
  __label_23: # endif
.annotate 'line', 10382
    WSubId_59(';', __ARG_1)
.annotate 'line', 10383
    new $P20, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P5)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10386
    WSubId_46("token", $P5)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 10324
    $P5 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10389
    $P11 = $P5.'iseof'()
    if_null $P11, __label_24
    unless $P11 goto __label_24
.annotate 'line', 10390
    self.'unclosed_ns'()
    goto __label_25
  __label_24: # else
.annotate 'line', 10392
    self.'close_ns'($P5)
  __label_25: # endif
# }
.annotate 'line', 10393

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 10396
    getattribute $P1, self, 'items'
    WSubId_43($P1)
# }
.annotate 'line', 10397

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 10400
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 10402
# activate: $I1
    set $I1, 1
.annotate 'line', 10404
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10405
    if_null $P2, __label_1
# {
.annotate 'line', 10406
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10407
    null $I1
.annotate 'line', 10408
    WSubId_57(__ARG_1, $P2)
# }
  __label_1: # endif
.annotate 'line', 10411
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
# {
.annotate 'line', 10412
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 10413
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 10414
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10416
    unless $I1 goto __label_7
# {
.annotate 'line', 10417
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10418
    null $I1
# }
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10420
    $P3.'emit'(__ARG_1)
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 10422

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 10110
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 10112
    addattribute $P0, 'nspath'
.annotate 'line', 10113
    addattribute $P0, 'externals'
.annotate 'line', 10114
    addattribute $P0, 'namespaces'
.annotate 'line', 10115
    addattribute $P0, 'classes'
.annotate 'line', 10116
    addattribute $P0, 'functions'
.annotate 'line', 10117
    addattribute $P0, 'functions_name'
.annotate 'line', 10118
    addattribute $P0, 'items'
.annotate 'line', 10119
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
.annotate 'line', 10440
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10441
# is_hll: $I1
    null $I1
.annotate 'line', 10442
    if_null __ARG_5, __label_1
# {
.annotate 'line', 10443
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
# {
.annotate 'line', 10444
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 10445
    set $I1, 1
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 10448
# var nspath: $P1
    unless $I1 goto __label_4
.annotate 'line', 10449
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 10450
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 10451
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10453
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10454
    setattribute self, 'start', __ARG_2
.annotate 'line', 10455
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10456
    box $P2, __ARG_4
    setattribute self, 'name', $P2
# }
.annotate 'line', 10457

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10460
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10461

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10464
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 10465

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10468
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
# }
.annotate 'line', 10469

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10472
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 10473

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10476
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 10477

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10480
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10481
    unless_null $P1, __label_1
.annotate 'line', 10482
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10483
    .return($P1)
# }
.annotate 'line', 10484

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10487
# var sym: $P1
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10488
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10489
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10490
    .return($P1)
# }
.annotate 'line', 10491

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10494
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 10495

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10502
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 10503
    if_null $P1, __label_1
.annotate 'line', 10504
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10505
    self.'optimize_base'()
.annotate 'line', 10506
    .return(self)
# }
.annotate 'line', 10507

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10510
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10511
    if_null $P1, __label_1
.annotate 'line', 10512
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 10514
    self.'emit_base'(__ARG_1)
.annotate 'line', 10516
    if_null $P1, __label_2
.annotate 'line', 10517
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 10518

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10429
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10431
    addattribute $P0, 'parent'
.annotate 'line', 10432
    addattribute $P0, 'start'
.annotate 'line', 10433
    addattribute $P0, 'name'
.annotate 'line', 10434
    addattribute $P0, 'modifier'
.annotate 'line', 10435
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10535
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10536
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10537
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 10538
    box $P1, 0
    setattribute self, 'subidgen', $P1
# }
.annotate 'line', 10539

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10542
# var bultins_used: $P1
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 10543
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10544

.end # use_builtin


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10548
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# builtin string
.annotate 'line', 10549
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 10550

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10554
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 10555
    unless_null $P1, __label_1
.annotate 'line', 10556
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10557
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10558

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10561
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 10562
    unless_null $P1, __label_1
.annotate 'line', 10563
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10564
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10565

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10568
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 10569

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10572
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 10573

.end # scopesearch


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10580
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 10581

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10584
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10585

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10588
    self.'optimize_base'()
.annotate 'line', 10589
    .return(self)
# }
.annotate 'line', 10590

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10593
# var bultins_used: $P1
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 10596
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10597
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10600
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
.annotate 'line', 10603
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10604
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10605
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10606
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10609
# somelib: $I1
    null $I1
.annotate 'line', 10610
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10611
    if_null $P3, __label_5
# {
.annotate 'line', 10612
    set $I1, 1
.annotate 'line', 10613
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10614
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10617
# someload: $I2
    null $I2
.annotate 'line', 10618
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10619
    if_null $P4, __label_8
# {
.annotate 'line', 10620
    set $I2, 1
.annotate 'line', 10621
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10622
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10623
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10624
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10626
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10627
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10629
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10630

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10633
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10634
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10635
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10636
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 10637
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 10638
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10640
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10641
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10643

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10525
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10527
    addattribute $P0, 'unit'
.annotate 'line', 10528
    addattribute $P0, 'bultins_used'
.annotate 'line', 10529
    addattribute $P0, 'libs'
.annotate 'line', 10530
    addattribute $P0, 'loads'
.annotate 'line', 10531
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10655
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10656
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10657

.end # Builtin


.sub 'getname' :method
# Body
# {
# builtin string
.annotate 'line', 10658
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10661
    getattribute $P1, self, 'variants'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10662

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10651
    addattribute $P0, 'name'
.annotate 'line', 10652
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
# Body
# {
.annotate 'line', 10672
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
# }
.annotate 'line', 10673

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10676
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10677
# name: $S1
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10678
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 10679
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 10681
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
# }
.annotate 'line', 10682

.end # add


.sub 'put' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10685
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10686
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10687
    getattribute $P3, __ARG_1, 'functions'
    $P4 = $P1[$S1]
# builtin push
    push $P3, $P4
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10688

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 10669
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_121 = "WSubId_121"
# Body
# {
.annotate 'line', 10698
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 10699
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10703
    WSubId_120($P1, 'false', 0)
.annotate 'line', 10704
    WSubId_120($P1, 'true', 1)
.annotate 'line', 10709
    WSubId_113($P1, '__STAGE__', "3")
.annotate 'line', 10712
    WSubId_120($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 10715
    WSubId_120($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10718
# var builtins_ns: $P2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 10720
# var builder: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 10721
    WSubId_121($P3)
.annotate 'line', 10722
    $P3.'put'($P2)
.annotate 'line', 10724
    $P1.'usenamespace'($P2)
.annotate 'line', 10726
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10727

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# builtin int
.annotate 'line', 10730
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10731

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10734
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10735
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10736

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10739
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10740

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10743
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10744
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10745
    __ARG_1.'say'('')
.annotate 'line', 10747
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10749
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10750

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10753
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10754
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10756
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10758
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10759

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10693
    addattribute $P0, 'rootns'
.annotate 'line', 10694
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
# Body
# {
.annotate 'line', 10768
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 3
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 10769
    .return($P1)
# }
.annotate 'line', 10770

.end # version


.sub 'version_string' :method
# Body
# {
# builtin string
.annotate 'line', 10773
    $P1 = self.'version'()
# builtin join
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
# }
.annotate 'line', 10774

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 10777
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10778
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10779
# var handleout: $P1
    null $P1
.annotate 'line', 10780
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10781
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10782
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10785
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10786
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10787
    unless __ARG_4 goto __label_4
.annotate 'line', 10788
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 10789
    unless __ARG_5 goto __label_5
.annotate 'line', 10790
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 10791
    __ARG_1.'emit'($P2)
.annotate 'line', 10792
    $P2.'close'()
.annotate 'line', 10793
    if_null __ARG_3, __label_6
.annotate 'line', 10794
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 10796
    $P1.'close'()
.annotate 'line', 10797
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 10798
# var object: $P3
    null $P3
# switch
.annotate 'line', 10799
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_11
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_12
    set $S3, ''
    if $S2 == $S3 goto __label_13
    goto __label_10
  __label_11: # case
.annotate 'line', 10801
    new $P3, [ 'String' ]
.annotate 'line', 10802
    assign $P3, $S1
    goto __label_9 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 10806
# var pircomp: $P4
# builtin compreg
    compreg $P4, 'PIR'
.annotate 'line', 10807
    $P3 = $P4($S1)
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 10808
# builtin string
.annotate 'line', 10810
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# builtin die
    die $S5
  __label_9: # switch end
.annotate 'line', 10812
    .return($P3)
# }
  __label_7: # endif
# }
.annotate 'line', 10814

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10817
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10818
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10819
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10820
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10821
    $P2.'close'()
.annotate 'line', 10822
    $P1.'close'()
.annotate 'line', 10823
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10824

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
.annotate 'line', 10832
    unless_null __ARG_2, __label_1
.annotate 'line', 10833
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10834
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10835
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10836
    $P1.'puts'(__ARG_1)
.annotate 'line', 10837
    $P1.'close'()
.annotate 'line', 10838
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10839
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10840
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10841
    $P3.'parse'($P2)
.annotate 'line', 10842
    $P1.'close'()
.annotate 'line', 10843
    $P3.'optimize'()
.annotate 'line', 10844
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10845
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10847
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10848

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
.annotate 'line', 10857
    unless_null __ARG_2, __label_1
.annotate 'line', 10858
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10859
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10860
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10861
    $P1.'encoding'('utf8')
.annotate 'line', 10862
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10863
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10864
    $P3.'parse'($P2)
.annotate 'line', 10865
    $P1.'close'()
.annotate 'line', 10866
    $P3.'optimize'()
.annotate 'line', 10867
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10868
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10870
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10871

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10880
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10881
# builtin compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10882

.end # initializer

# End generated code
